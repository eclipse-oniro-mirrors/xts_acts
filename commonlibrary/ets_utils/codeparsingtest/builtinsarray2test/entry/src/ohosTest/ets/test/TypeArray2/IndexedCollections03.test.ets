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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';

export default function IndexedCollections03Test() {
  describe('IndexedCollections03Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
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
     * @tc.number    SUB_ARRAY_FROM_INT8ARRAY_0100
     * @tc.name      test_ArrayFrom_Int8Array_0001
     * @tc.desc      Test Array.from() to convert Int8Array to normal array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayFrom_Int8Array_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayFrom_Int8Array_0001 start');
        let typedArr1 = new Int8Array([1, -2, 3]);
        let normalArr1 = Array.from(typedArr1);
        let result = Array.isArray(normalArr1) && normalArr1.join(",") === "1,-2,3";
        expect(result).assertTrue();

        done();
        console.log('test_ArrayFrom_Int8Array_0001 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_UINT16ARRAY_0200
     * @tc.name      test_ArrayFrom_Uint16Array_0002
     * @tc.desc      Test Array.from() to convert Uint16Array to normal array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayFrom_Uint16Array_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayFrom_Uint16Array_0002 start');
        let typedArr2 = new Uint16Array([65535, 1234]);
        let normalArr2 = Array.from(typedArr2);
        let result = normalArr2[0] === 65535 && normalArr2[1] === 1234;
        expect(result).assertTrue();

        done();
        console.log('test_ArrayFrom_Uint16Array_0002 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SPREAD_FLOAT32ARRAY_0300
     * @tc.name      test_ArraySpread_Float32Array_0003
     * @tc.desc      Test spread operator to convert Float32Array to normal array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArraySpread_Float32Array_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArraySpread_Float32Array_0003 start');
        let typedArr3 = new Float32Array([1.23, 4.56]);
        let normalArr3 = [...typedArr3];
        let result = Array.isArray(normalArr3) && normalArr3[0].toFixed(2) === "1.23";
        expect(result).assertTrue();

        done();
        console.log('test_ArraySpread_Float32Array_0003 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SPREAD_INT32ARRAY_0400
     * @tc.name      test_ArraySpread_Int32Array_0004
     * @tc.desc      Test spread operator to convert Int32Array to normal array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArraySpread_Int32Array_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArraySpread_Int32Array_0004 start');
        let typedArr4 = new Int32Array([-123456, 789012]);
        let normalArr4 = [...typedArr4];
        let result = normalArr4.join(",") === "-123456,789012";
        expect(result).assertTrue();

        done();
        console.log('test_ArraySpread_Int32Array_0004 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_SPREAD_INT8ARRAY_0500
     * @tc.name      test_ArrayFrom_Spread_Int8Array_0005
     * @tc.desc      Test consistency between Array.from() and spread operator for Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayFrom_Spread_Int8Array_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayFrom_Spread_Int8Array_0005 start');
        let typedArr5 = new Int8Array([-1, 0, 1]);
        let fromArr5 = Array.from(typedArr5);
        let spreadArr5 = [...typedArr5];
        let result = fromArr5.join(",") === spreadArr5.join(",");
        expect(result).assertTrue();

        done();
        console.log('test_ArrayFrom_Spread_Int8Array_0005 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_SPREAD_FLOAT64ARRAY_0600
     * @tc.name      test_ArrayFrom_Spread_Float64Array_0006
     * @tc.desc      Test consistency between Array.from() and spread operator for Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayFrom_Spread_Float64Array_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayFrom_Spread_Float64Array_0006 start');
        let typedArr6 = new Float64Array([1.123456789, 9.87654321]);
        let fromArr6 = Array.from(typedArr6);
        let spreadArr6 = [...typedArr6];
        let result = fromArr6[0].toFixed(9) === spreadArr6[0].toFixed(9);
        expect(result).assertTrue();

        done();
        console.log('test_ArrayFrom_Spread_Float64Array_0006 end');
      });

    /**
     * @tc.number    SUB_ARRAY_ISARRAY_INT16ARRAY_0700
     * @tc.name      test_ArrayIsArray_Int16Array_0007
     * @tc.desc      Test Array.isArray() on Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayIsArray_Int16Array_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayIsArray_Int16Array_0007 start');
        let typedArr7 = new Int16Array(2);
        let result = !Array.isArray(typedArr7);
        expect(result).assertTrue();

        done();
        console.log('test_ArrayIsArray_Int16Array_0007 end');
      });

    /**
     * @tc.number    SUB_ARRAY_ISARRAY_NORMALARRAY_0800
     * @tc.name      test_ArrayIsArray_NormalArray_0008
     * @tc.desc      Test Array.isArray() on converted normal array from Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayIsArray_NormalArray_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayIsArray_NormalArray_0008 start');
        let typedArr8 = new Uint32Array([100, 200]);
        let normalArr8 = Array.from(typedArr8);
        let result = Array.isArray(normalArr8);
        expect(result).assertTrue();

        done();
        console.log('test_ArrayIsArray_NormalArray_0008 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FOREACH_TYPEDARRAY_0900
     * @tc.name      test_ArrayForEach_TypedArray_0009
     * @tc.desc      Test Array.prototype.forEach on TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayForEach_TypedArray_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayForEach_TypedArray_0009 start');
        let typedArr9: Int8Array = new Int8Array([1, 2, 3]);
        let sum9: number = 0;
        for (let i = 0; i < typedArr9.length; i++) {
          sum9 += typedArr9[i];
        }
        let result: boolean = sum9 === 6;
        expect(result).assertTrue();

        done();
        console.log('test_ArrayForEach_TypedArray_0009 end');
      });

    /**
     * @tc.number    SUB_ARRAY_MAP_TYPEDARRAY_1000
     * @tc.name      test_ArrayMap_TypedArray_0010
     * @tc.desc      Test Array.prototype.map on TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayMap_TypedArray_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayMap_TypedArray_0010 start');
        let typedArr10: Uint8Array = new Uint8Array([10, 20]);
        let mapped10: number[] = Array.from(typedArr10, (x: number) => x * 2);
        let result: boolean = mapped10.join(",") === "20,40";
        expect(result).assertTrue();

        done();
        console.log('test_ArrayMap_TypedArray_0010 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_EMPTY_TYPEDARRAY_1100
     * @tc.name      test_ArrayFrom_EmptyTypedArray_0011
     * @tc.desc      Test Array.from() on empty TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayFrom_EmptyTypedArray_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayFrom_EmptyTypedArray_0011 start');
        let typedArr11 = new Float32Array(0);
        let normalArr11 = Array.from(typedArr11);
        let result = normalArr11.length === 0 && Array.isArray(normalArr11);
        expect(result).assertTrue();

        done();
        console.log('test_ArrayFrom_EmptyTypedArray_0011 end');
      });

    /**
     * @tc.number    SUB_ARRAY_SPREAD_EMPTY_TYPEDARRAY_1200
     * @tc.name      test_ArraySpread_EmptyTypedArray_0012
     * @tc.desc      Test spread operator on empty TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArraySpread_EmptyTypedArray_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArraySpread_EmptyTypedArray_0012 start');
        let typedArr12 = new Int32Array(0);
        let normalArr12 = [...typedArr12];
        let result = normalArr12.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_ArraySpread_EmptyTypedArray_0012 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_TYPEDARRAY_VIEW_1300
     * @tc.name      test_ArrayFrom_TypedArrayView_0013
     * @tc.desc      Test Array.from() on TypedArray view with offset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayFrom_TypedArrayView_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayFrom_TypedArrayView_0013 start');
        let buffer13: ArrayBuffer = new ArrayBuffer(8);
        let typedArr13: Int16Array = new Int16Array(buffer13, 2, 3);
        typedArr13.set([10, 20, 30]);
        let normalArr13: number[] = Array.from(typedArr13);
        let result: boolean = normalArr13.join(",") === "10,20,30";
        expect(result).assertTrue();

        done();
        console.log('test_ArrayFrom_TypedArrayView_0013 end');
      });

    /**
     * @tc.number    SUB_ARRAY_TYPE_COMPARISON_1400
     * @tc.name      test_ArrayTypeComparison_0014
     * @tc.desc      Test type comparison between TypedArray and normal array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayTypeComparison_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayTypeComparison_0014 start');
        let typedArr14: Uint16Array = new Uint16Array(1);
        let normalArr14: number[] = [1];
        let result: boolean = (typeof typedArr14 === typeof normalArr14) && !(typedArr14 instanceof Array);
        expect(result).assertTrue();

        done();
        console.log('test_ArrayTypeComparison_0014 end');
      });

    /**
     * @tc.number    SUB_ARRAY_FROM_MAP_FUNCTION_1500
     * @tc.name      test_ArrayFrom_MapFunction_0015
     * @tc.desc      Test Array.from() with a map function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_ArrayFrom_MapFunction_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_ArrayFrom_MapFunction_0015 start');
        let typedArr15: Int8Array = new Int8Array([1, 2, 3]);
        let normalArr15: number[] = Array.from(typedArr15, (x: number) => x * 10);
        let result: boolean = normalArr15.join(",") === "10,20,30";
        expect(result).assertTrue();

        done();
        console.log('test_ArrayFrom_MapFunction_0015 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_INT8_TO_UINT8_1600
     * @tc.name      test_TypedArrayConversion_Int8ToUint8_0016
     * @tc.desc      Test conversion from Int8Array to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Int8ToUint8_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Int8ToUint8_0016 start');
        let source16: Int8Array = new Int8Array([-1, -128, 127]);
        let target16: Uint8Array = new Uint8Array(source16.buffer, source16.byteOffset, source16.length);
        let result: boolean = target16.join(",") === "255,128,127";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Int8ToUint8_0016 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_UINT8_TO_INT8_1700
     * @tc.name      test_TypedArrayConversion_Uint8ToInt8_0017
     * @tc.desc      Test conversion from Uint8Array to Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Uint8ToInt8_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Uint8ToInt8_0017 start');
        let source17: Uint8Array = new Uint8Array([255, 128, 127]);
        let target17: Int8Array = new Int8Array(source17.buffer, source17.byteOffset, source17.length);
        let result: boolean = target17.join(",") === "-1,-128,127";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Uint8ToInt8_0017 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_INT16_TO_UINT32_1800
     * @tc.name      test_TypedArrayConversion_Int16ToUint32_0018
     * @tc.desc      Test conversion from Int16Array to Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Int16ToUint32_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Int16ToUint32_0018 start');
        let source18: Int16Array = new Int16Array([-1, 32767]);
        let target18: Uint32Array = new Uint32Array(source18.length);

        for (let i = 0; i < source18.length; i++) {
          target18[i] = source18[i] < 0 ? 0xFFFFFFFF + source18[i] + 1 : source18[i];
        }

        let result: boolean = target18.join(",") === "4294967295,32767";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Int16ToUint32_0018 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_FLOAT32_TO_INT32_1900
     * @tc.name      test_TypedArrayConversion_Float32ToInt32_0019
     * @tc.desc      Test conversion from Float32Array to Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Float32ToInt32_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Float32ToInt32_0019 start');
        let source19: Float32Array = new Float32Array([1.9, -2.1, 3.5]);
        let target19: Int32Array = new Int32Array(source19.length);

        for (let i = 0; i < source19.length; i++) {
          target19[i] = Math.trunc(source19[i]);
        }

        let result: boolean = target19.join(",") === "1,-2,3";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Float32ToInt32_0019 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_INT32_TO_FLOAT64_2000
     * @tc.name      test_TypedArrayConversion_Int32ToFloat64_0020
     * @tc.desc      Test conversion from Int32Array to Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Int32ToFloat64_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Int32ToFloat64_0020 start');
        let source20: Int32Array = new Int32Array([123456789, -987654321]);
        let target20: Float64Array = new Float64Array(source20.length);

        for (let i = 0; i < source20.length; i++) {
          target20[i] = source20[i];
        }

        let result: boolean = target20[0] === 123456789 && target20[1] === -987654321;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Int32ToFloat64_0020 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_UINT16_TO_INT32_2100
     * @tc.name      test_TypedArrayConversion_Uint16ToInt32_0021
     * @tc.desc      Test conversion from Uint16Array to Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Uint16ToInt32_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Uint16ToInt32_0021 start');
        let source21: Uint16Array = new Uint16Array([65535, 1000]);
        let target21: Int32Array = new Int32Array(source21.length);

        for (let i = 0; i < source21.length; i++) {
          target21[i] = source21[i];
        }

        let result: boolean = target21.join(",") === "65535,1000";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Uint16ToInt32_0021 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_FLOAT64_TO_UINT8_2200
     * @tc.name      test_TypedArrayConversion_Float64ToUint8_0022
     * @tc.desc      Test conversion from Float64Array to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Float64ToUint8_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Float64ToUint8_0022 start');
        let source22: Float64Array = new Float64Array([1.0]);
        let target22: Uint8Array = new Uint8Array(source22.buffer);
        let result: boolean = target22[7].toString(16) === "3f";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Float64ToUint8_0022 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_LENGTH_2300
     * @tc.name      test_TypedArrayConversion_Length_0023
     * @tc.desc      Test length consistency after cross-type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Length_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Length_0023 start');
        let source23: Int8Array = new Int8Array([1, 2, 3, 4]);
        let target23: Uint16Array = new Uint16Array(source23.buffer, source23.byteOffset, source23.length / 2);
        let result: boolean = target23.length === 2;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Length_0023 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_INT32_TO_UINT16_2400
     * @tc.name      test_TypedArrayConversion_Int32ToUint16_0024
     * @tc.desc      Test conversion from Int32Array to Uint16Array (high bits truncated)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Int32ToUint16_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Int32ToUint16_0024 start');
        let source24: Int32Array = new Int32Array([0x12345678, 0x9ABCDEF0]);
        let target24: Uint16Array = new Uint16Array(source24.length);

        for (let i = 0; i < source24.length; i++) {
          target24[i] = source24[i] & 0xFFFF;
        }

        let result: boolean = target24[0].toString(16) === "5678" && target24[1].toString(16) === "def0";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Int32ToUint16_0024 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_FLOAT32_TO_UINT32_2500
     * @tc.name      test_TypedArrayConversion_Float32ToUint32_0025
     * @tc.desc      Test conversion from Float32Array to Uint32Array (sign and exponent bits preserved)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Float32ToUint32_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Float32ToUint32_0025 start');
        let source25: Float32Array = new Float32Array([-1.0]);
        let target25: Uint32Array = new Uint32Array(source25.buffer);
        let result: boolean = target25[0].toString(16) === "bf800000";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Float32ToUint32_0025 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_EMPTY_2600
     * @tc.name      test_TypedArrayConversion_Empty_0026
     * @tc.desc      Test cross-type conversion of an empty TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Empty_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Empty_0026 start');
        let source26: Int16Array = new Int16Array(0);
        let target26: Float32Array = new Float32Array(source26.buffer);
        let result: boolean = target26.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Empty_0026 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_INT8_TO_INT16_2700
     * @tc.name      test_TypedArrayConversion_Int8ToInt16_0027
     * @tc.desc      Test conversion from Int8Array to Int16Array (within range)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Int8ToInt16_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Int8ToInt16_0027 start');
        let source27: Int8Array = new Int8Array([127, -128]);
        let target27: Int16Array = new Int16Array(source27.length);

        for (let i = 0; i < source27.length; i++) {
          target27[i] = source27[i];
        }

        let result: boolean = target27[0] === 127 && target27[1] === -128;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Int8ToInt16_0027 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_UINT32_TO_UINT16_2800
     * @tc.name      test_TypedArrayConversion_Uint32ToUint16_0028
     * @tc.desc      Test conversion from Uint32Array to Uint16Array (high bits truncated)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Uint32ToUint16_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Uint32ToUint16_0028 start');
        let source28: Uint32Array = new Uint32Array([0x12345678, 0x9ABCDEF0]);
        let target28: Uint16Array = new Uint16Array(source28.buffer, source28.byteOffset, source28.length * 2);
        let result: boolean = target28[0].toString(16) === "5678" && target28[1].toString(16) === "1234";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Uint32ToUint16_0028 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONVERSION_FLOAT32_TO_INT8_OVERFLOW_2900
     * @tc.name      test_TypedArrayConversion_Float32ToInt8Overflow_0029
     * @tc.desc      Test overflow handling when converting Float32Array to Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayConversion_Float32ToInt8Overflow_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayConversion_Float32ToInt8Overflow_0029 start');
        let source29: Float32Array = new Float32Array([200.5, -200.5]);
        let target29: Int8Array = new Int8Array(source29.length);

        for (let i = 0; i < source29.length; i++) {
          let value = Math.trunc(source29[i]);
          target29[i] = value % 256;
        }

        let result: boolean = target29[0] === -56 && target29[1] === 56;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayConversion_Float32ToInt8Overflow_0029 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_BUFFER_SHARING_3000
     * @tc.name      test_TypedArrayBufferSharing_0030
     * @tc.desc      Test buffer sharing after cross-type conversion
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayBufferSharing_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayBufferSharing_0030 start');
        let buffer30: ArrayBuffer = new ArrayBuffer(4);
        let source30: Int32Array = new Int32Array(buffer30);
        source30[0] = 123;
        let target30: Uint32Array = new Uint32Array(buffer30);
        source30[0] = 456;
        let result: boolean = target30[0] === 456;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayBufferSharing_0030 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_TO_STRING_ASCII_3100
     * @tc.name      test_TypedArrayToString_ASCII_0031
     * @tc.desc      Test converting Uint16Array to string (ASCII characters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayToString_ASCII_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayToString_ASCII_0031 start');
        let typedArr31: Uint16Array = new Uint16Array([97, 98, 99]);
        let str31: string = String.fromCharCode(...typedArr31);
        let result: boolean = str31 === "abc";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayToString_ASCII_0031 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_TO_STRING_UNICODE_3200
     * @tc.name      test_TypedArrayToString_Unicode_0032
     * @tc.desc      Test converting Uint16Array to string (Chinese characters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArrayToString_Unicode_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArrayToString_Unicode_0032 start');
        let typedArr32: Uint16Array = new Uint16Array([20013, 25991]);
        let str32: string = String.fromCharCode(...typedArr32);
        let result: boolean = str32 === "中文";
        expect(result).assertTrue();

        done();
        console.log('test_TypedArrayToString_Unicode_0032 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_MIN_0033
     * @tc.name      test_TypedArray_Int8Min_0033
     * @tc.desc      Test Int8Array minimum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8Min_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8Min_0033 start');
        const int8: Int8Array = new Int8Array(1);
        int8[0] = -128;
        let result: boolean = int8[0] === -128;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8Min_0033 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_MAX_0034
     * @tc.name      test_TypedArray_Int8Max_0034
     * @tc.desc      Test Int8Array maximum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8Max_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8Max_0034 start');
        const int8: Int8Array = new Int8Array(1);
        int8[0] = 127;
        let result: boolean = int8[0] === 127;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8Max_0034 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_UNDERFLOW_0035
     * @tc.name      test_TypedArray_Int8Underflow_0035
     * @tc.desc      Test Int8Array underflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8Underflow_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8Underflow_0035 start');
        const int8: Int8Array = new Int8Array(1);
        int8[0] = -129;
        let result: boolean = int8[0] === 127;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8Underflow_0035 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_OVERFLOW_0036
     * @tc.name      test_TypedArray_Int8Overflow_0036
     * @tc.desc      Test Int8Array overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8Overflow_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8Overflow_0036 start');
        const int8: Int8Array = new Int8Array(1);
        int8[0] = 128;
        let result: boolean = int8[0] === -128;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8Overflow_0036 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_MIN_0037
     * @tc.name      test_TypedArray_Uint8Min_0037
     * @tc.desc      Test Uint8Array minimum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8Min_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8Min_0037 start');
        const uint8: Uint8Array = new Uint8Array(1);
        uint8[0] = 0;
        let result: boolean = uint8[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8Min_0037 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_MAX_0038
     * @tc.name      test_TypedArray_Uint8Max_0038
     * @tc.desc      Test Uint8Array maximum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8Max_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8Max_0038 start');
        const uint8: Uint8Array = new Uint8Array(1);
        uint8[0] = 255;
        let result: boolean = uint8[0] === 255;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8Max_0038 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_UNDERFLOW_0039
     * @tc.name      test_TypedArray_Uint8Underflow_0039
     * @tc.desc      Test Uint8Array underflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8Underflow_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8Underflow_0039 start');
        const uint8: Uint8Array = new Uint8Array(1);
        uint8[0] = -1;
        let result: boolean = uint8[0] === 255;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8Underflow_0039 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_OVERFLOW_0040
     * @tc.name      test_TypedArray_Uint8Overflow_0040
     * @tc.desc      Test Uint8Array overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8Overflow_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8Overflow_0040 start');
        const uint8: Uint8Array = new Uint8Array(1);
        uint8[0] = 256;
        let result: boolean = uint8[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8Overflow_0040 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_MIN_0041
     * @tc.name      test_TypedArray_Int16Min_0041
     * @tc.desc      Test Int16Array minimum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16Min_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16Min_0041 start');
        const int16: Int16Array = new Int16Array(1);
        int16[0] = -32768;
        let result: boolean = int16[0] === -32768;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16Min_0041 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_MAX_0042
     * @tc.name      test_TypedArray_Int16Max_0042
     * @tc.desc      Test Int16Array maximum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16Max_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16Max_0042 start');
        const int16: Int16Array = new Int16Array(1);
        int16[0] = 32767;
        let result: boolean = int16[0] === 32767;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16Max_0042 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_OVERFLOW_0043
     * @tc.name      test_TypedArray_Int16Overflow_0043
     * @tc.desc      Test Int16Array overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16Overflow_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16Overflow_0043 start');
        const int16: Int16Array = new Int16Array(1);
        int16[0] = 32768;
        let result: boolean = int16[0] === -32768;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16Overflow_0043 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_MAX_0044
     * @tc.name      test_TypedArray_Uint16Max_0044
     * @tc.desc      Test Uint16Array maximum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16Max_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16Max_0044 start');
        const uint16: Uint16Array = new Uint16Array(1);
        uint16[0] = 65535;
        let result: boolean = uint16[0] === 65535;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16Max_0044 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_OVERFLOW_0045
     * @tc.name      test_TypedArray_Uint16Overflow_0045
     * @tc.desc      Test Uint16Array overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16Overflow_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16Overflow_0045 start');
        const uint16: Uint16Array = new Uint16Array(1);
        uint16[0] = 65536;
        let result: boolean = uint16[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16Overflow_0045 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_MIN_0046
     * @tc.name      test_TypedArray_Int32Min_0046
     * @tc.desc      Test Int32Array minimum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32Min_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32Min_0046 start');
        const int32: Int32Array = new Int32Array(1);
        int32[0] = -2147483648;
        let result: boolean = int32[0] === -2147483648;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32Min_0046 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_MAX_0047
     * @tc.name      test_TypedArray_Int32Max_0047
     * @tc.desc      Test Int32Array maximum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32Max_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32Max_0047 start');
        const int32: Int32Array = new Int32Array(1);
        int32[0] = 2147483647;
        let result: boolean = int32[0] === 2147483647;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32Max_0047 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_OVERFLOW_0048
     * @tc.name      test_TypedArray_Int32Overflow_0048
     * @tc.desc      Test Int32Array overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32Overflow_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32Overflow_0048 start');
        const int32: Int32Array = new Int32Array(1);
        int32[0] = 2147483648;
        let result: boolean = int32[0] === -2147483648;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32Overflow_0048 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_MAX_0049
     * @tc.name      test_TypedArray_Uint32Max_0049
     * @tc.desc      Test Uint32Array maximum value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32Max_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32Max_0049 start');
        const uint32: Uint32Array = new Uint32Array(1);
        uint32[0] = 4294967295;
        let result: boolean = uint32[0] === 4294967295;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32Max_0049 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_OVERFLOW_0050
     * @tc.name      test_TypedArray_Uint32Overflow_0050
     * @tc.desc      Test Uint32Array overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32Overflow_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32Overflow_0050 start');
        const uint32: Uint32Array = new Uint32Array(1);
        uint32[0] = 4294967296;
        let result: boolean = uint32[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32Overflow_0050 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_POSITIVE_INFINITY_0051
     * @tc.name      test_TypedArray_Float32PositiveInfinity_0051
     * @tc.desc      Test Float32Array positive infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32PositiveInfinity_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32PositiveInfinity_0051 start');
        const float32: Float32Array = new Float32Array(1);
        float32[0] = Infinity;
        let result: boolean = float32[0] === Infinity;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32PositiveInfinity_0051 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_NEGATIVE_INFINITY_0052
     * @tc.name      test_TypedArray_Float32NegativeInfinity_0052
     * @tc.desc      Test Float32Array negative infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32NegativeInfinity_0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32NegativeInfinity_0052 start');
        const float32: Float32Array = new Float32Array(1);
        float32[0] = -Infinity;
        let result: boolean = float32[0] === -Infinity;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32NegativeInfinity_0052 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT64_NAN_0053
     * @tc.name      test_TypedArray_Float64Nan_0053
     * @tc.desc      Test Float64Array NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float64Nan_0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float64Nan_0053 start');
        const float64: Float64Array = new Float64Array(1);
        float64[0] = NaN;
        let result: boolean = isNaN(float64[0]);
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float64Nan_0053 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_LARGE_UINT8_CREATION_0054
     * @tc.name      test_TypedArray_LargeUint8Creation_0054
     * @tc.desc      Test large Uint8Array creation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_LargeUint8Creation_0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_LargeUint8Creation_0054 start');
        let success: boolean = true;
        try {
          const largeArray: Uint8Array = new Uint8Array(1024 * 1024 * 10);
          success = largeArray.byteLength === 1024 * 1024 * 10;
        } catch (e) {
          success = false;
        }
        let result: boolean = success;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_LargeUint8Creation_0054 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_HUGE_UINT8_CREATION_0055
     * @tc.name      test_TypedArray_HugeUint8Creation_0055
     * @tc.desc      Test huge Uint8Array creation (may fail)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_HugeUint8Creation_0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_HugeUint8Creation_0055 start');
        let success: boolean = true;
        try {
          const hugeArray: Uint8Array = new Uint8Array(1024 * 1024 * 1024 * 10);
          success = true;
        } catch (e) {
          success = false;
        }
        let result: boolean = !success;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_HugeUint8Creation_0055 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FREQUENT_LARGE_ARRAY_CREATION_0056
     * @tc.name      test_TypedArray_FrequentLargeArrayCreation_0056
     * @tc.desc      Test frequent creation and destruction of large arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_FrequentLargeArrayCreation_0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_FrequentLargeArrayCreation_0056 start');
        let success: boolean = true;
        try {
          for (let i = 0; i < 10; i++) {
            const arr: Uint8Array = new Uint8Array(1024 * 1024 * 5);
            if (globalThis.gc) {
              globalThis.gc();
            }
          }
        } catch (e) {
          success = false;
        }
        let result: boolean = success;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_FrequentLargeArrayCreation_0056 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_UNDEFINED_0057
     * @tc.name      test_TypedArray_Int32Undefined_0057
     * @tc.desc      Test Int32Array assignment of undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32Undefined_0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32Undefined_0057 start');
        const int32: Int32Array = new Int32Array(1);
        int32[0] = Number(undefined);
        let result: boolean = int32[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32Undefined_0057 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_NULL_0058
     * @tc.name      test_TypedArray_Uint16Null_0058
     * @tc.desc      Test Uint16Array assignment of null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16Null_0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16Null_0058 start');
        const uint16: Uint16Array = new Uint16Array(1);
        uint16[0] = Number(null);
        let result: boolean = uint16[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16Null_0058 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_OBJECT_0059
     * @tc.name      test_TypedArray_Float32Object_0059
     * @tc.desc      Test Float32Array assignment of an object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32Object_0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32Object_0059 start');
        const float32: Float32Array = new Float32Array(1);
        float32[0] = Number({ value: 1.2 });
        let result: boolean = isNaN(float32[0]);
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32Object_0059 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_STRING_NUMBER_0060
     * @tc.name      test_TypedArray_Int8StringNumber_0060
     * @tc.desc      Test Int8Array assignment of a string number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8StringNumber_0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8StringNumber_0060 start');
        const int8: Int8Array = new Int8Array(1);
        int8[0] = Number("64");
        let result: boolean = int8[0] === 64;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8StringNumber_0060 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_NON_NUMBER_STRING_0061
     * @tc.name      test_TypedArray_Uint8NonNumberString_0061
     * @tc.desc      Test Uint8Array assignment of a non-number string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8NonNumberString_0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8NonNumberString_0061 start');
        const uint8: Uint8Array = new Uint8Array(1);
        uint8[0] = Number("not a number");
        let result: boolean = uint8[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8NonNumberString_0061 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT64_BOOLEAN_TRUE_0062
     * @tc.name      test_TypedArray_Float64BooleanTrue_0062
     * @tc.desc      Test Float64Array assignment of boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float64BooleanTrue_0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float64BooleanTrue_0062 start');
        const float64: Float64Array = new Float64Array(1);
        float64[0] = Number(true);
        let result: boolean = float64[0] === 1;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float64BooleanTrue_0062 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT64_BOOLEAN_FALSE_0063
     * @tc.name      test_TypedArray_Float64BooleanFalse_0063
     * @tc.desc      Test Float64Array assignment of boolean false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float64BooleanFalse_0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float64BooleanFalse_0063 start');
        const float64: Float64Array = new Float64Array(1);
        float64[0] = Number(false);
        let result: boolean = float64[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float64BooleanFalse_0063 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_DETACHED_BUFFER_VIEW_0064
     * @tc.name      test_TypedArray_DetachedBufferView_0064
     * @tc.desc      Test creating a view from a detached ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_DetachedBufferView_0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_DetachedBufferView_0064 start');
        const buffer: ArrayBuffer = new ArrayBuffer(16);
        const uint8: Uint8Array = new Uint8Array(buffer);
        let result: boolean = false;

        let isDetached: boolean = false;

        const transfer = (buffer: ArrayBuffer) => {
          if (buffer instanceof ArrayBuffer) {
            isDetached = true;
          }
        };

        try {
          transfer(buffer);
          if (isDetached) {
            throw new Error('ArrayBuffer is detached');
          }
          new Uint8Array(buffer);
        } catch (e) {
          result = true;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_DetachedBufferView_0064 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_OUT_OF_BOUNDS_ACCESS_0065
     * @tc.name      test_TypedArray_OutOfBoundsAccess_0065
     * @tc.desc      Test accessing an out-of-bounds index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_OutOfBoundsAccess_0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_OutOfBoundsAccess_0065 start');
        const int16: Int16Array = new Int16Array(5);
        let result: boolean = int16[10] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_OutOfBoundsAccess_0065 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_OUT_OF_BOUNDS_SET_0066
     * @tc.name      test_TypedArray_OutOfBoundsSet_0066
     * @tc.desc      Test setting an out-of-bounds index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_OutOfBoundsSet_0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_OutOfBoundsSet_0066 start');
        const uint32: Uint32Array = new Uint32Array(5);
        uint32[10] = 100;
        let result: boolean = uint32[10] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_OutOfBoundsSet_0066 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_NEGATIVE_LENGTH_CREATION_0067
     * @tc.name      test_TypedArray_NegativeLengthCreation_0067
     * @tc.desc      Test creating a TypedArray with a negative length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_NegativeLengthCreation_0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_NegativeLengthCreation_0067 start');
        let result: boolean = false;
        try {
          new Int8Array(-1);
        } catch (e) {
          result = true;
        }
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_NegativeLengthCreation_0067 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_NON_NUMERIC_LENGTH_CREATION_0068
     * @tc.name      test_TypedArray_NonNumericLengthCreation_0068
     * @tc.desc      Test creating a TypedArray with a non-numeric length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_NonNumericLengthCreation_0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_NonNumericLengthCreation_0068 start');
        let result: boolean = false;

        try {
          const invalidLength: string = "invalid length";
          new Uint8Array(Number(invalidLength));
        } catch (e) {
          result = true;
        }

        expect(result).assertFalse();

        done();
        console.log('test_TypedArray_NonNumericLengthCreation_0068 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_NULL_BUFFER_0069
     * @tc.name      test_TypedArray_NullBuffer_0069
     * @tc.desc      Test creating a view with null as the buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_NullBuffer_0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_NullBuffer_0069 start');
        let result: boolean = false;
        try {
          const invalidLength1: string = "invalid length";
          new Float32Array(Number(invalidLength1));
        } catch (e) {
          result = true;
        }
        expect(result).assertFalse();

        done();
        console.log('test_TypedArray_NullBuffer_0069 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INVALID_BUFFER_TYPE_0070
     * @tc.name      test_TypedArray_InvalidBufferType_0070
     * @tc.desc      Test creating a view with an invalid buffer type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_InvalidBufferType_0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_InvalidBufferType_0070 start');
        let result: boolean = false;
        try {
          new Int32Array({ length: 10 });
        } catch (e) {
          result = true;
        }
        expect(result).assertFalse();

        done();
        console.log('test_TypedArray_InvalidBufferType_0070 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_BYTEOFFSET_OUT_OF_BOUNDS_0071
     * @tc.name      test_TypedArray_ByteOffsetOutOfBounds_0071
     * @tc.desc      Test creating a TypedArray with byteOffset out of bounds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ByteOffsetOutOfBounds_0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ByteOffsetOutOfBounds_0071 start');
        const buffer: ArrayBuffer = new ArrayBuffer(10);
        let result: boolean = false;
        try {
          new Uint8Array(buffer, 15);
        } catch (e) {
          result = true;
        }
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ByteOffsetOutOfBounds_0071 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_BYTEOFFSET_LENGTH_OUT_OF_BOUNDS_0072
     * @tc.name      test_TypedArray_ByteOffsetLengthOutOfBounds_0072
     * @tc.desc      Test creating a TypedArray with byteOffset and length out of bounds
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ByteOffsetLengthOutOfBounds_0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ByteOffsetLengthOutOfBounds_0072 start');
        const buffer: ArrayBuffer = new ArrayBuffer(10);
        let result: boolean = false;
        try {
          new Uint8Array(buffer, 5, 10);
        } catch (e) {
          result = true;
        }
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ByteOffsetLengthOutOfBounds_0072 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SLICE_RETURN_TYPE_0073
     * @tc.name      test_TypedArray_SliceReturnType_0073
     * @tc.desc      Test the return type of Int8Array.slice()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SliceReturnType_0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SliceReturnType_0073 start');
        const int8: Int8Array = new Int8Array([1, 2, 3]);
        const sliced: Int8Array = int8.slice();
        let result: boolean = sliced instanceof Int8Array;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SliceReturnType_0073 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SLICE_DATA_INDEPENDENCE_0074
     * @tc.name      test_TypedArray_SliceDataIndependence_0074
     * @tc.desc      Test data independence between original and sliced Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SliceDataIndependence_0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SliceDataIndependence_0074 start');
        const int8: Int8Array = new Int8Array([1, 2, 3]);
        const sliced: Int8Array = int8.slice();
        sliced[0] = 100;
        let result: boolean = int8[0] === 1;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SliceDataIndependence_0074 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_DATA_SHARING_0075
     * @tc.name      test_TypedArray_SubarrayDataSharing_0075
     * @tc.desc      Test data sharing between original and subarray Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarrayDataSharing_0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarrayDataSharing_0075 start');
        const int8: Int8Array = new Int8Array([1, 2, 3]);
        const sub: Int8Array = int8.subarray();
        sub[0] = 100;
        let result: boolean = int8[0] === 100;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarrayDataSharing_0075 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SLICE_START_PARAM_0076
     * @tc.name      test_TypedArray_SliceStartParam_0076
     * @tc.desc      Test slice(start) parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SliceStartParam_0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SliceStartParam_0076 start');
        const uint16: Uint16Array = new Uint16Array([10, 20, 30, 40]);
        const sliced: Uint16Array = uint16.slice(1);
        let result: boolean = sliced.join(',') === '20,30,40';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SliceStartParam_0076 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SLICE_START_END_PARAM_0077
     * @tc.name      test_TypedArray_SliceStartEndParam_0077
     * @tc.desc      Test slice(start, end) parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SliceStartEndParam_0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SliceStartEndParam_0077 start');
        const int32: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
        const sliced: Int32Array = int32.slice(1, 3);
        let result: boolean = sliced.join(',') === '2,3';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SliceStartEndParam_0077 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SLICE_NEGATIVE_START_PARAM_0078
     * @tc.name      test_TypedArray_SliceNegativeStartParam_0078
     * @tc.desc      Test slice with negative start parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SliceNegativeStartParam_0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SliceNegativeStartParam_0078 start');
        const uint32: Uint32Array = new Uint32Array([10, 20, 30, 40]);
        const sliced: Uint32Array = uint32.slice(-2);
        let result: boolean = sliced.join(',') === '30,40';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SliceNegativeStartParam_0078 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SLICE_NEGATIVE_END_PARAM_0079
     * @tc.name      test_TypedArray_SliceNegativeEndParam_0079
     * @tc.desc      Test slice with negative end parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SliceNegativeEndParam_0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SliceNegativeEndParam_0079 start');
        const float32: Float32Array = new Float32Array([1.1, 2.2, 3.3, 4.4]);
        const sliced: Float32Array = float32.slice(1, -1);
        let result: boolean = sliced.join(',') === '2.2,3.3';
        expect(result).assertFalse();

        done();
        console.log('test_TypedArray_SliceNegativeEndParam_0079 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SLICE_OUT_OF_BOUNDS_0080
     * @tc.name      test_TypedArray_SliceOutOfBounds_0080
     * @tc.desc      Test slice with out-of-bounds parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SliceOutOfBounds_0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SliceOutOfBounds_0080 start');
        const float64: Float64Array = new Float64Array([1, 2, 3]);
        const sliced: Float64Array = float64.slice(5, 10);
        let result: boolean = sliced.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SliceOutOfBounds_0080 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FOREACH_ALL_ELEMENTS_0081
     * @tc.name      test_TypedArray_ForeachAllElements_0081
     * @tc.desc      Test forEach to iterate all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ForeachAllElements_0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ForeachAllElements_0081 start');
        const int8: Int8Array = new Int8Array([1, 2, 3, 4]);
        let count: number = 0;
        int8.forEach(() => count++);
        let result: boolean = count === 4;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ForeachAllElements_0081 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FOREACH_VALUE_INDEX_0082
     * @tc.name      test_TypedArray_ForeachValueIndex_0082
     * @tc.desc      Test forEach to handle values and indices
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ForeachValueIndex_0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ForeachValueIndex_0082 start');
        const uint8: Uint8Array = new Uint8Array([5, 6, 7]);
        const result: string[] = [];
        uint8.forEach((value, index) => result.push(`${index}:${value}`));
        let resultStr: string = result.join(',');
        let expectedStr: string = '0:5,1:6,2:7';
        let resultBool: boolean = resultStr === expectedStr;
        expect(resultBool).assertTrue();

        done();
        console.log('test_TypedArray_ForeachValueIndex_0082 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FOREACH_NO_SPARSE_ELEMENTS_0083
     * @tc.name      test_TypedArray_ForeachNoSparseElements_0083
     * @tc.desc      Test forEach with no sparse elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ForeachNoSparseElements_0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ForeachNoSparseElements_0083 start');
        const arr: Uint16Array = new Uint16Array(3);
        arr[1] = 10;
        let count: number = 0;
        arr.forEach(() => count++);
        let result: boolean = count === 3;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ForeachNoSparseElements_0083 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_MAP_RETURN_TYPE_0084
     * @tc.name      test_TypedArray_MapReturnType_0084
     * @tc.desc      Test the return type of Int16Array.map()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_MapReturnType_0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_MapReturnType_0084 start');
        const int16: Int16Array = new Int16Array([1, 2, 3]);
        const mapped: Int16Array = int16.map(x => x * 2);
        let result: boolean = mapped instanceof Int16Array;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_MapReturnType_0084 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_MAP_ELEMENT_TYPE_CONVERSION_0085
     * @tc.name      test_TypedArray_MapElementTypeConversion_0085
     * @tc.desc      Test element type conversion in Uint8Array.map()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_MapElementTypeConversion_0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_MapElementTypeConversion_0085 start');
        const uint8: Uint8Array = new Uint8Array([250, 251]);
        const mapped: Uint8Array = uint8.map(x => x + 10);
        let result: boolean = mapped[0] === 4 && mapped[1] === 5;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_MapElementTypeConversion_0085 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_MAP_LENGTH_CONSISTENCY_0086
     * @tc.name      test_TypedArray_MapLengthConsistency_0086
     * @tc.desc      Test length consistency in Int32Array.map()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_MapLengthConsistency_0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_MapLengthConsistency_0086 start');
        const int32: Int32Array = new Int32Array([10, 20, 30, 40]);
        const mapped: Int32Array = int32.map(x => x / 10);
        let result: boolean = mapped.length === 4;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_MapLengthConsistency_0086 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FILTER_RETURN_TYPE_0087
     * @tc.name      test_TypedArray_FilterReturnType_0087
     * @tc.desc      Test the return type of Float32Array.filter()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_FilterReturnType_0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_FilterReturnType_0087 start');
        const float32: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
        const filtered: Float32Array = float32.filter(x => x > 2);
        let result: boolean = filtered instanceof Float32Array;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_FilterReturnType_0087 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FILTER_RESULT_0088
     * @tc.name      test_TypedArray_FilterResult_0088
     * @tc.desc      Test the filtering result of Uint32Array.filter()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_FilterResult_0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_FilterResult_0088 start');
        const uint32: Uint32Array = new Uint32Array([5, 15, 25, 35]);
        const filtered: Uint32Array = uint32.filter(x => x % 20 === 5);
        let result: boolean = filtered.join(',') === '5,25';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_FilterResult_0088 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FILTER_EMPTY_RESULT_0089
     * @tc.name      test_TypedArray_FilterEmptyResult_0089
     * @tc.desc      Test the empty filtering result of Int8Array.filter()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_FilterEmptyResult_0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_FilterEmptyResult_0089 start');
        const int8: Int8Array = new Int8Array([1, 2, 3]);
        const filtered: Int8Array = int8.filter(x => x > 10);
        let result: boolean = filtered.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_FilterEmptyResult_0089 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_EVERY_ALL_SATISFY_0090
     * @tc.name      test_TypedArray_EveryAllSatisfy_0090
     * @tc.desc      Test every() with all elements satisfying the condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_EveryAllSatisfy_0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_EveryAllSatisfy_0090 start');
        const uint16: Uint16Array = new Uint16Array([2, 4, 6, 8]);
        const result: boolean = uint16.every(x => x % 2 === 0);
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_EveryAllSatisfy_0090 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_EVERY_PARTIAL_SATISFY_0091
     * @tc.name      test_TypedArray_EveryPartialSatisfy_0091
     * @tc.desc      Test every() with some elements satisfying the condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_EveryPartialSatisfy_0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_EveryPartialSatisfy_0091 start');
        const int32: Int32Array = new Int32Array([2, 4, 5, 8]);
        const result: boolean = int32.every(x => x % 2 === 0);
        expect(result).assertFalse();

        done();
        console.log('test_TypedArray_EveryPartialSatisfy_0091 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SOME_SATISFY_0092
     * @tc.name      test_TypedArray_SomeSatisfy_0092
     * @tc.desc      Test some() with some elements satisfying the condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SomeSatisfy_0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SomeSatisfy_0092 start');
        const float64: Float64Array = new Float64Array([1.1, 2.2, 3.3, 4.5]);
        const result: boolean = float64.some(x => x > 4);
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SomeSatisfy_0092 end');
      });
  })
}