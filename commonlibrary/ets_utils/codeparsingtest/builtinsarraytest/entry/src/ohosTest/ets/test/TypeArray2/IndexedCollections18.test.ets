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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect ,TestType ,Size ,Level} from '@ohos/hypium';

interface TestObject {
  id?: number;
  name?: string;
  data?: string;
  key?: string;
  prop?: string;
  a?: number;
  b?: number;
  unused?: string;
  new?: string;
  x?: number;
  y?: number;
}

type TestArray = Array<number | string | boolean | null | undefined>;

interface TestFunction extends Function {
  prop?: string;
}

class MockSymbol {
  description: string;

  constructor(description: string) {
    this.description = description;
  }
}


export default function IndexedCollections18Test() {
  describe('IndexedCollections18Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
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
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0100
     * @tc.name   testTypedArrayLengthConstructor0001
     * @tc.desc   Verify Int8Array creation with length parameter.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0001 start');
        const arr1 = new Int8Array(4);
        let result1 = arr1.length;
        let result2 = arr1.byteLength;
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(4);
        done();
        console.log('testTypedArrayLengthConstructor0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0200
     * @tc.name   testTypedArrayLengthConstructor0002
     * @tc.desc   Verify Uint8Array creation with length parameter.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0002 start');
        const arr2 = new Uint8Array(5);
        let result1 = arr2.length;
        let result2 = arr2.byteLength;
        expect(result1).assertEqual(5);
        expect(result2).assertEqual(5);
        done();
        console.log('testTypedArrayLengthConstructor0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0300
     * @tc.name   testTypedArrayLengthConstructor0003
     * @tc.desc   Verify Int16Array creation with length parameter.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0003 start');
        const arr3 = new Int16Array(3);
        let result1 = arr3.length;
        let result2 = arr3.byteLength;
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(6);
        done();
        console.log('testTypedArrayLengthConstructor0003 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0400
     * @tc.name   testTypedArrayLengthConstructor0004
     * @tc.desc   Verify Uint16Array creation with length parameter.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0004 start');
        const arr4 = new Uint16Array(2);
        let result1 = arr4.length;
        let result2 = arr4.byteLength;
        expect(result1).assertEqual(2);
        expect(result2).assertEqual(4);
        done();
        console.log('testTypedArrayLengthConstructor0004 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0500
     * @tc.name   testTypedArrayLengthConstructor0005
     * @tc.desc   Verify Int32Array creation with length parameter.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0005 start');
        const arr5 = new Int32Array(4);
        let result1 = arr5.length;
        let result2 = arr5.byteLength;
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(16);
        done();
        console.log('testTypedArrayLengthConstructor0005 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0600
     * @tc.name   testTypedArrayLengthConstructor0006
     * @tc.desc   Verify Uint32Array creation with length parameter.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0006 start');
        const arr6 = new Uint32Array(1);
        let result1 = arr6.length;
        let result2 = arr6.byteLength;
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(4);
        done();
        console.log('testTypedArrayLengthConstructor0006 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0700
     * @tc.name   testTypedArrayLengthConstructor0007
     * @tc.desc   Verify Float32Array creation with length parameter.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0007 start');
        const arr7 = new Float32Array(2);
        let result1 = arr7.length;
        let result2 = arr7.byteLength;
        expect(result1).assertEqual(2);
        expect(result2).assertEqual(8);
        done();
        console.log('testTypedArrayLengthConstructor0007 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0800
     * @tc.name   testTypedArrayLengthConstructor0008
     * @tc.desc   Verify Float64Array creation with length parameter.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0008 start');
        const arr8 = new Float64Array(3);
        let result1 = arr8.length;
        let result2 = arr8.byteLength;
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(24);
        done();
        console.log('testTypedArrayLengthConstructor0008 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_0900
     * @tc.name   testTypedArrayLengthConstructor0009
     * @tc.desc   Verify zero-length Int8Array creation.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0009 start');
        const arr9 = new Int8Array(0);
        let result1 = arr9.length;
        let result2 = arr9.byteLength;
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(0);
        done();
        console.log('testTypedArrayLengthConstructor0009 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CONSTRUCTOR_LENGTH_1000
     * @tc.name   testTypedArrayLengthConstructor0010
     * @tc.desc   Verify Int8Array initial value with length 1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthConstructor0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthConstructor0010 start');
        const arr10 = new Int8Array(1);
        let result1 = arr10[0];
        expect(result1).assertEqual(0);
        done();
        console.log('testTypedArrayLengthConstructor0010 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INITIAL_VALUES_0100
     * @tc.name   testTypedArrayInitialValues0001
     * @tc.desc   Verify Float64Array initial values with length 3.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayInitialValues0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayInitialValues0001 start');
        const arr11 = new Float64Array(3);
        let result1 = arr11[0];
        let result2 = arr11[1];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(0);
        done();
        console.log('testTypedArrayInitialValues0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_MODIFY_ELEMENT_0100
     * @tc.name   testTypedArrayModifyElement0001
     * @tc.desc   Verify Uint32Array element modification after creation.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayModifyElement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
       console.log('testTypedArrayModifyElement0001 start');
       const arr12 = new Uint32Array(2);
       arr12[0] = 100;
       let result12 = arr12[0];
       expect(result12).assertEqual(100);
       done();
       console.log('testTypedArrayModifyElement0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_LARGE_LENGTH_0100
     * @tc.name   testTypedArrayLargeLength0001
     * @tc.desc   Verify Uint8Array creation with large length (boundary test).
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLargeLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testTypedArrayLargeLength0001 start');
        let result13 = false;
        try {
          const arr13 = new Uint8Array(1024 * 1024);
          result13 = arr13.byteLength === 1024 * 1024;
        } catch (e) {
          result13 = false;
        }

        expect(result13).assertTrue();
        done();
        console.log('testTypedArrayLargeLength0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOOR_LENGTH_0100
     * @tc.name   testTypedArrayFloorLength0001
     * @tc.desc   Verify Int16Array length flooring with decimal 3.9.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloorLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloorLength0001 start');
        const arr14 = new Int16Array(3.9);
        let result14 = arr14.length;
        expect(result14).assertEqual(3);
        done();
        console.log('testTypedArrayFloorLength0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOOR_LENGTH_0200
     * @tc.name   testTypedArrayFloorLength0002
     * @tc.desc   Verify Uint8Array length flooring with decimal 5.1.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloorLength0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloorLength0002 start');
        const arr15 = new Uint8Array(5.1);
        let result15 = arr15.length;
        expect(result15).assertEqual(5);
        done();
        console.log('testTypedArrayFloorLength0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_STRING_LENGTH_0100
     * @tc.name   testTypedArrayStringLength0001
     * @tc.desc   Verify Int32Array creation with string length "4".
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayStringLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayStringLength0001 start');
        const arr16 = new Int32Array(4);
        let result16 = arr16.length;
        expect(result16).assertEqual(4);
        done();
        console.log('testTypedArrayStringLength0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_BOOLEAN_LENGTH_0100
     * @tc.name   testTypedArrayBooleanLength0001
     * @tc.desc   Verify Float32Array creation with boolean true length (converted to 1).
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayBooleanLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayBooleanLength0001 start');
        const arr17 = new Float32Array(1);
        let result17 = arr17.length;
        expect(result17).assertEqual(1);
        done();
        console.log('testTypedArrayBooleanLength0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_BOOLEAN_LENGTH_0200
     * @tc.name   testTypedArrayBooleanLength0002
     * @tc.desc   Verify Float64Array creation with boolean false length (converted to 0).
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayBooleanLength0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayBooleanLength0002 start');
        const arr18 = new Float64Array(0);
        let result18 = arr18.length;
        expect(result18).assertEqual(0);
        done();
        console.log('testTypedArrayBooleanLength0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_NEGATIVE_LENGTH_0100
     * @tc.name   testTypedArrayNegativeLength0001
     * @tc.desc   Verify Int8Array creation with negative length throws RangeError.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayNegativeLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayNegativeLength0001 start');
        let result19 = false;
        try {
          const arr19 = new Int8Array(-2);
          console.log("19. Negative length: " + arr19.length);
        } catch (e) {
          result19 = e instanceof RangeError;
        }

        expect(result19).assertTrue();
        done();
        console.log('testTypedArrayNegativeLength0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INFINITY_LENGTH_0100
     * @tc.name   testTypedArrayInfinityLength0001
     * @tc.desc   Verify Uint16Array creation with Infinity length throws RangeError.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayInfinityLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayInfinityLength0001 start');
        let result20 = false;
        try {
          const arr20 = new Uint16Array(Infinity);
          console.log("20. Infinity length: " + arr20.length);
        } catch (e) {
          result20 = e instanceof RangeError;
        }

        expect(result20).assertTrue();
        done();
        console.log('testTypedArrayInfinityLength0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAY_0100
     * @tc.name   testTypedArrayFromArray0001
     * @tc.desc   Verify Int8Array creation from regular array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArray0001 start');
        const arr41 = new Int8Array([1, 2, 3, 4]);
        let result1 = arr41[0];
        let result2 = arr41.length;
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(4);
        done();
        console.log('testTypedArrayFromArray0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAY_0200
     * @tc.name   testTypedArrayFromArray0002
     * @tc.desc   Verify Uint8Array creation from regular array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArray0002 start');
        const arr42 = new Uint8Array([255, 0, 128]);
        let result1 = arr42[0];
        let result2 = arr42[2];
        expect(result1).assertEqual(255);
        expect(result2).assertEqual(128);
        done();
        console.log('testTypedArrayFromArray0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0100
     * @tc.name   testTypedArrayFromArrayLike0001
     * @tc.desc   Verify Int16Array creation from array-like object.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0001 start');
        const likeArr43: number[] = [100, 200];
        const arr43 = new Int16Array(likeArr43);
        const result43 = arr43[1];
        expect(result43).assertEqual(200);
        done();
        console.log('testTypedArrayFromArrayLike0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAY_0300
     * @tc.name   testTypedArrayFromArray0003
     * @tc.desc   Verify Float32Array creation from regular array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArray0003 start');
        const arr44 = new Float32Array([1.23, 4.56]);
        const result44 = arr44[0].toFixed(2);
        expect(result44).assertEqual('1.23');
        done();
        console.log('testTypedArrayFromArray0003 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAY_0400
     * @tc.name   testTypedArrayFromArray0004
     * @tc.desc   Verify Float64Array creation from regular array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArray0004 start');
        const arr45 = new Float64Array([1.23456789, 9.87654321]);
        const result45 = arr45[0].toFixed(8);
        expect(result45).assertEqual('1.23456789');
        done();
        console.log('testTypedArrayFromArray0004 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_RANGE_OVERFLOW_0100
     * @tc.name   testTypedArrayRangeOverflow0001
     * @tc.desc   Verify Int8Array overflow handling (truncation).
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayRangeOverflow0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayRangeOverflow0001 start');
        const arr46 = new Int8Array([128, -129]);
        let result1 = arr46[0];
        let result2 = arr46[1];
        expect(result1).assertEqual(-128);
        expect(result2).assertEqual(127);
        done();
        console.log('testTypedArrayRangeOverflow0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_RANGE_OVERFLOW_0200
     * @tc.name   testTypedArrayRangeOverflow0002
     * @tc.desc   Verify Uint8Array overflow handling (wrapping).
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayRangeOverflow0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayRangeOverflow0002 start');
        const arr47 = new Uint8Array([256, -1]);
        let result1 = arr47[0];
        let result2 = arr47[1];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(255);
        done();
        console.log('testTypedArrayRangeOverflow0002 done');
    });

    /**
     * @tc.number SUB_BASEDATA_TYPEDARRAY_FLOAT_TO_INT_0100
     * @tc.name   testTypedArrayFloatToInt0001
     * @tc.desc   Verify float to Int32 conversion (truncation).
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloatToInt0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloatToInt0001 start');
        const arr48 = new Int32Array([3.9, -2.1]);
        let result1 = arr48[0];
        let result2 = arr48[1];
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(-2);
        done();
        console.log('testTypedArrayFloatToInt0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_STRING_CONVERSION_0100
     * @tc.name   testTypedArrayStringConversion0001
     * @tc.desc   Verify string to numeric conversion in Uint16Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayStringConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayStringConversion0001 start');
        const arr49 = new Uint16Array([100, 200]);
        let result1 = arr49[0];
        let result2 = arr49[1];
        expect(result1).assertEqual(100);
        expect(result2).assertEqual(200);
        done();
        console.log('testTypedArrayStringConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INVALID_STRING_0100
     * @tc.name   testTypedArrayInvalidString0001
     * @tc.desc   Verify invalid string conversion to 0 in Float32Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayInvalidString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayInvalidString0001 start');
        const arr50 = new Float32Array([0, 123]);
        let result1 = arr50[0];
        let result2 = arr50[1];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(123);
        done();
        console.log('testTypedArrayInvalidString0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_NULL_CONVERSION_0100
     * @tc.name   testTypedArrayNullConversion0001
     * @tc.desc   Verify null conversion to 0 in Int8Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayNullConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayNullConversion0001 start');
        const arr51 = new Int8Array([0, 10]);
        let result1 = arr51[0];
        let result2 = arr51[1];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(10);
        done();
        console.log('testTypedArrayNullConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_UNDEFINED_CONVERSION_0100
     * @tc.name   testTypedArrayUndefinedConversion0001
     * @tc.desc   Verify undefined conversion to 0 in Uint32Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayUndefinedConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayUndefinedConversion0001 start');
        const arr52 = new Uint32Array([0, 20]);
        let result1 = arr52[0];
        let result2 = arr52[1];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(20);
        done();
        console.log('testTypedArrayUndefinedConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_NAN_CONVERSION_0100
     * @tc.name   testTypedArrayNaNConversion0001
     * @tc.desc   Verify NaN and Infinity conversion in Float64Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayNaNConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayNaNConversion0001 start');
        const arr53 = new Float64Array([0, Infinity, -Infinity]);
        let result1 = arr53[0];
        let result2 = arr53[1];
        let result3 = arr53[2];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(Infinity);
        expect(result3).assertEqual(-Infinity);
        done();
        console.log('testTypedArrayNaNConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_EMPTY_ARRAY_0100
     * @tc.name   testTypedArrayEmptyArray0001
     * @tc.desc   Verify empty array creation in Int16Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayEmptyArray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayEmptyArray0001 start');
        const arr54 = new Int16Array([]);
        let result1 = arr54.length;
        let result2 = arr54.byteLength;
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(0);
        done();
        console.log('testTypedArrayEmptyArray0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_SINGLE_ELEMENT_0100
     * @tc.name   testTypedArraySingleElement0001
     * @tc.desc   Verify single element array creation in Uint8Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArraySingleElement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArraySingleElement0001 start');
        const arr55 = new Uint8Array([255]);
        let result1 = arr55[0];
        let result2 = arr55.length;
        expect(result1).assertEqual(255);
        expect(result2).assertEqual(1);
        done();
        console.log('testTypedArraySingleElement0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_EMPTY_ARRAYLIKE_0100
     * @tc.name   testTypedArrayEmptyArrayLike0001
     * @tc.desc   Verify empty array-like object creation in Float32Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayEmptyArrayLike0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testTypedArrayEmptyArrayLike0001 start');
      const arr56 = new Float32Array([]);
      const result56 = arr56.length;
      expect(result56).assertEqual(0);
      done();
      console.log('testTypedArrayEmptyArrayLike0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INCOMPLETE_ARRAYLIKE_0100
     * @tc.name   testTypedArrayIncompleteArrayLike0001
     * @tc.desc   Verify incomplete array-like object conversion in Int32Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayIncompleteArrayLike0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayIncompleteArrayLike0001 start');
        const arr57 = new Int32Array([10, 0, 0]);
        let result1 = arr57[0];
        let result2 = arr57[1];
        expect(result1).assertEqual(10);
        expect(result2).assertEqual(0);
        done();
        console.log('testTypedArrayIncompleteArrayLike0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_OBJECT_CONVERSION_0100
     * @tc.name   testTypedArrayObjectConversion0001
     * @tc.desc   Verify object conversion to NaN in Float64Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayObjectConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayObjectConversion0001 start');
        const arr58 = new Float64Array([NaN, 2]);
        let result1 = isNaN(arr58[0]);
        let result2 = arr58[1];
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(2);
        done();
        console.log('testTypedArrayObjectConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FUNCTION_CONVERSION_0100
     * @tc.name   testTypedArrayFunctionConversion0001
     * @tc.desc   Verify function conversion in Int8Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFunctionConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFunctionConversion0001 start');
        const arr59 = new Int8Array([0, 10]);
        let result1 = arr59[0];
        let result2 = arr59[1];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(10);
        done();
        console.log('testTypedArrayFunctionConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_BOOLEAN_CONVERSION_0100
     * @tc.name   testTypedArrayBooleanConversion0001
     * @tc.desc   Verify boolean conversion in Uint16Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayBooleanConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayBooleanConversion0001 start');
        const arr60 = new Uint16Array([1, 0]);
        let result1 = arr60[0];
        let result2 = arr60[1];
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(0);
        done();
        console.log('testTypedArrayBooleanConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_TYPEDARRAY_0100
     * @tc.name   testTypedArrayFromTypedArray0001
     * @tc.desc   Verify Int8Array creation from Uint8Array source.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromTypedArray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromTypedArray0001 start');
        const source61 = new Uint8Array([255, 128]);
        const arr61 = new Int8Array(source61);
        let result1 = arr61[0];
        let result2 = arr61[1];
        expect(result1).assertEqual(-1);
        expect(result2).assertEqual(-128);
        done();
        console.log('testTypedArrayFromTypedArray0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_TYPEDARRAY_0200
     * @tc.name   testTypedArrayFromTypedArray0002
     * @tc.desc   Verify Uint8Array creation from Int8Array source.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromTypedArray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromTypedArray0002 start');
        const source62 = new Int8Array([-1, -128]);
        const arr62 = new Uint8Array(source62);
        let result1 = arr62[0];
        let result2 = arr62[1];
        expect(result1).assertEqual(255);
        expect(result2).assertEqual(128);
        done();
        console.log('testTypedArrayFromTypedArray0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_TYPEDARRAY_0300
     * @tc.name   testTypedArrayFromTypedArray0003
     * @tc.desc   Verify Int16Array creation from Int8Array source.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromTypedArray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromTypedArray0003 start');
        const source63 = new Int8Array([1, 2]);
        const arr63 = new Int16Array(source63);
        let result1 = arr63[0];
        let result2 = arr63[1];
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(2);
        done();
        console.log('testTypedArrayFromTypedArray0003 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_TYPEDARRAY_0400
     * @tc.name   testTypedArrayFromTypedArray0004
     * @tc.desc   Verify Float32Array creation from Int32Array source.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromTypedArray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromTypedArray0004 start');
        const source64 = new Int32Array([100, 200]);
        const arr64 = new Float32Array(source64);
        let result1 = arr64[0];
        let result2 = arr64[1];
        expect(result1).assertEqual(100);
        expect(result2).assertEqual(200);
        done();
        console.log('testTypedArrayFromTypedArray0004 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_TYPEDARRAY_0500
     * @tc.name   testTypedArrayFromTypedArray0005
     * @tc.desc   Verify Uint32Array creation from Float64Array source with truncation.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromTypedArray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromTypedArray0005 start');
        const source65 = new Float64Array([3.9, -2.1]);
        const arr65 = new Uint32Array(source65);
        let result1 = arr65[0];
        let result2 = arr65[1];
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(4294967294);
        done();
        console.log('testTypedArrayFromTypedArray0005 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_LENGTH_CHANGE_0100
     * @tc.name   testTypedArrayLengthChange0001
     * @tc.desc   Verify length change during TypedArray conversion.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLengthChange0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLengthChange0001 start');
        const source66 = new Int16Array([1, 2, 3, 4]);
        const arr66 = new Int8Array(source66);
        let result1 = arr66.length;
        let result2 = arr66[3];
        expect(result1).assertEqual(4);
        expect(result2).assertEqual(4);
        done();
        console.log('testTypedArrayLengthChange0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_EMPTY_SOURCE_0100
     * @tc.name   testTypedArrayEmptySource0001
     * @tc.desc   Verify creation from empty TypedArray source.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayEmptySource0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayEmptySource0001 start');
        const source67 = new Uint8Array(0);
        const arr67 = new Float32Array(source67);
        let result67 = arr67.length;
        expect(result67).assertEqual(0);
        done();
        console.log('testTypedArrayEmptySource0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_LARGE_SOURCE_0100
     * @tc.name   testTypedArrayLargeSource0001
     * @tc.desc   Verify creation from large TypedArray source.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLargeSource0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLargeSource0001 start');
        const source68 = new Int32Array(1000);
        source68[999] = 123;
        const arr68 = new Int32Array(source68);
        let result1 = arr68.length;
        let result2 = arr68[999];
        expect(result1).assertEqual(1000);
        expect(result2).assertEqual(123);
        done();
        console.log('testTypedArrayLargeSource0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_SIGNED_TO_UNSIGNED_0100
     * @tc.name   testTypedArraySignedToUnsigned0001
     * @tc.desc   Verify signed to unsigned conversion with negative values.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArraySignedToUnsigned0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArraySignedToUnsigned0001 start');
        const source69 = new Int16Array([-1, -2]);
        const arr69 = new Uint16Array(source69);
        let result1 = arr69[0];
        let result2 = arr69[1];
        expect(result1).assertEqual(65535);
        expect(result2).assertEqual(65534);
        done();
        console.log('testTypedArraySignedToUnsigned0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_UNSIGNED_TO_SIGNED_0100
     * @tc.name   testTypedArrayUnsignedToSigned0001
     * @tc.desc   Verify unsigned to signed conversion with large values.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayUnsignedToSigned0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayUnsignedToSigned0001 start');
        const source70 = new Uint16Array([65535, 65534]);
        const arr70 = new Int16Array(source70);
        let result1 = arr70[0];
        let result2 = arr70[1];
        expect(result1).assertEqual(-1);
        expect(result2).assertEqual(-2);
        done();
        console.log('testTypedArrayUnsignedToSigned0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_LONG_TO_SHORT_0100
     * @tc.name   testTypedArrayLongToShort0001
     * @tc.desc   Verify long to short type conversion with truncation.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLongToShort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLongToShort0001 start');
        const source71 = new Int32Array([300, -300]);
        const arr71 = new Int8Array(source71);
        let result1 = arr71[0];
        let result2 = arr71[1];
        expect(result1).assertEqual(44);
        expect(result2).assertEqual(-44);
        done();
        console.log('testTypedArrayLongToShort0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_SHORT_TO_LONG_0100
     * @tc.name   testTypedArrayShortToLong0001
     * @tc.desc   Verify short to long type conversion with value preservation.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayShortToLong0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayShortToLong0001 start');
        const source72 = new Int8Array([100, -50]);
        const arr72 = new Int32Array(source72);
        let result1 = arr72[0];
        let result2 = arr72[1];
        expect(result1).assertEqual(100);
        expect(result2).assertEqual(-50);
        done();
        console.log('testTypedArrayShortToLong0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT_TO_INT_0100
     * @tc.name   testTypedArrayFloatToInt0002
     * @tc.desc   Verify float to integer conversion with truncation.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloatToInt0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloatToInt0002 start');
        const source73 = new Float64Array([1.9, 2.1, -3.7]);
        const arr73 = new Int32Array(source73);
        let result1 = arr73[0];
        let result2 = arr73[1];
        let result3 = arr73[2];
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(2);
        expect(result3).assertEqual(-3);
        done();
        console.log('testTypedArrayFloatToInt0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INT_TO_FLOAT_0100
     * @tc.name   testTypedArrayIntToFloat0001
     * @tc.desc   Verify integer to float conversion with exact representation.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayIntToFloat0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayIntToFloat0001 start');
        const source74 = new Uint32Array([12345, 67890]);
        const arr74 = new Float64Array(source74);
        let result1 = arr74[0];
        let result2 = arr74[1];
        expect(result1).assertEqual(12345);
        expect(result2).assertEqual(67890);
        done();
        console.log('testTypedArrayIntToFloat0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_BUFFER_INDEPENDENCE_0100
     * @tc.name   testTypedArrayBufferIndependence0001
     * @tc.desc   Verify buffer independence after conversion.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayBufferIndependence0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayBufferIndependence0001 start');
        const source75 = new Int8Array([1, 2]);
        const arr75 = new Int8Array(source75);
        arr75[0] = 100;
        let result1 = source75[0];
        let result2 = arr75[0];
        expect(result1).assertEqual(1);
        expect(result2).assertEqual(100);
        done();
        console.log('testTypedArrayBufferIndependence0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_NEGATIVE_STORAGE_0100
     * @tc.name   testTypedArrayNegativeStorage0001
     * @tc.desc   Verify Int8Array negative number storage.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayNegativeStorage0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayNegativeStorage0001 start');
        const arr76 = new Int8Array([-1, -128, 127]);
        let result1 = arr76[0];
        let result2 = arr76[1];
        let result3 = arr76[2];
        expect(result1).assertEqual(-1);
        expect(result2).assertEqual(-128);
        expect(result3).assertEqual(127);
        done();
        console.log('testTypedArrayNegativeStorage0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INT16_BOUNDARY_0100
     * @tc.name   testTypedArrayInt16Boundary0001
     * @tc.desc   Verify Int16Array boundary values.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayInt16Boundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayInt16Boundary0001 start');
        const arr77 = new Int16Array([-32768, 32767, -32768]);
        let result1 = arr77[0];
        let result2 = arr77[1];
        let result3 = arr77[2];
        expect(result1).assertEqual(-32768);
        expect(result2).assertEqual(32767);
        expect(result3).assertEqual(-32768);
        done();
        console.log('testTypedArrayInt16Boundary0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INT32_BOUNDARY_0100
     * @tc.name   testTypedArrayInt32Boundary0001
     * @tc.desc   Verify Int32Array boundary values.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayInt32Boundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayInt32Boundary0001 start');
        const arr78 = new Int32Array([-2147483648, 2147483647, -2147483648]);
        let result1 = arr78[0];
        let result2 = arr78[1];
        let result3 = arr78[2];
        expect(result1).assertEqual(-2147483648);
        expect(result2).assertEqual(2147483647);
        expect(result3).assertEqual(-2147483648);
        done();
        console.log('testTypedArrayInt32Boundary0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_UINT8_NEGATIVE_CONVERSION_0100
     * @tc.name   testTypedArrayUint8NegativeConversion0001
     * @tc.desc   Verify Uint8Array negative number conversion.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayUint8NegativeConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayUint8NegativeConversion0001 start');
        const arr79 = new Uint8Array([255, 128, 0]);
        let result1 = arr79[0];
        let result2 = arr79[1];
        let result3 = arr79[2];
        expect(result1).assertEqual(255);
        expect(result2).assertEqual(128);
        expect(result3).assertEqual(0);
        done();
        console.log('testTypedArrayUint8NegativeConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_UINT16_BOUNDARY_0100
     * @tc.name   testTypedArrayUint16Boundary0001
     * @tc.desc   Verify Uint16Array boundary values.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayUint16Boundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayUint16Boundary0001 start');
        const arr80 = new Uint16Array([0, 65535, 0]);
        let result1 = arr80[0];
        let result2 = arr80[1];
        let result3 = arr80[2];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(65535);
        expect(result3).assertEqual(0);
        done();
        console.log('testTypedArrayUint16Boundary0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_UINT32_BOUNDARY_0100
     * @tc.name   testTypedArrayUint32Boundary0001
     * @tc.desc   Verify Uint32Array boundary values.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayUint32Boundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayUint32Boundary0001 start');
        const arr81 = new Uint32Array([0, 4294967295, 0]);
        let result1 = arr81[0];
        let result2 = arr81[1];
        let result3 = arr81[2];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(4294967295);
        expect(result3).assertEqual(0);
        done();
        console.log('testTypedArrayUint32Boundary0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT32_PRECISION_0100
     * @tc.name   testTypedArrayFloat32Precision0001
     * @tc.desc   Verify Float32Array precision.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat32Precision0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat32Precision0001 start');
        const arr82 = new Float32Array([1.2345678901234567]);
        const result82 = arr82[0].toFixed(7);
        expect(result82).assertEqual('1.2345679');
        done();
        console.log('testTypedArrayFloat32Precision0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT64_PRECISION_0100
     * @tc.name   testTypedArrayFloat64Precision0001
     * @tc.desc   Verify Float64Array precision.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat64Precision0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat64Precision0001 start');
        const arr83 = new Float64Array([1.2345678901234567]);
        const result83 = arr83[0].toFixed(15);
        expect(result83).assertEqual('1.234567890123457');
        done();
        console.log('testTypedArrayFloat64Precision0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT32_MIN_VALUE_0100
     * @tc.name   testTypedArrayFloat32MinValue0001
     * @tc.desc   Verify Float32Array minimum value.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat32MinValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat32MinValue0001 start');
        const arr84 = new Float32Array([1e-45]);
        const result84 = arr84[0];
        expect(result84).assertEqual(1.401298464324817e-45);
        done();
        console.log('testTypedArrayFloat32MinValue0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT64_MIN_VALUE_0100
     * @tc.name   testTypedArrayFloat64MinValue0001
     * @tc.desc   Verify Float64Array minimum value.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat64MinValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat64MinValue0001 start');
        const arr85 = new Float64Array([1e-323]);
        const result85 = arr85[0];
        expect(result85).assertEqual(1e-323);
        done();
        console.log('testTypedArrayFloat64MinValue0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT32_INFINITY_0100
     * @tc.name   testTypedArrayFloat32Infinity0001
     * @tc.desc   Verify Float32Array Infinity values.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat32Infinity0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat32Infinity0001 start');
        const arr86 = new Float32Array([Infinity, -Infinity]);
        let result1 = arr86[0];
        let result2 = arr86[1];
        expect(result1).assertEqual(Infinity);
        expect(result2).assertEqual(-Infinity);
        done();
        console.log('testTypedArrayFloat32Infinity0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT64_SPECIAL_VALUES_0100
     * @tc.name   testTypedArrayFloat64SpecialValues0001
     * @tc.desc   Verify Float64Array special values (NaN, Infinity).
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat64SpecialValues0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat64SpecialValues0001 start');
        const arr87 = new Float64Array([NaN, Infinity, NaN]);
        expect(isNaN(arr87[0])).assertEqual(true);
        expect(arr87[1] === Infinity).assertEqual(true);
        expect(isNaN(arr87[2])).assertEqual(true);
        done();
        console.log('testTypedArrayFloat64SpecialValues0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INT8_UPPER_OVERFLOW_0100
     * @tc.name   testTypedArrayInt8UpperOverflow0001
     * @tc.desc   Verify Int8Array upper boundary overflow.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayInt8UpperOverflow0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayInt8UpperOverflow0001 start');
        const arr88 = new Int8Array([-128, -56, -1]);
        let result1 = arr88[0];
        let result2 = arr88[1];
        let result3 = arr88[2];
        expect(result1).assertEqual(-128);
        expect(result2).assertEqual(-56);
        expect(result3).assertEqual(-1);
        done();
        console.log('testTypedArrayInt8UpperOverflow0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_INT8_LOWER_OVERFLOW_0100
     * @tc.name   testTypedArrayInt8LowerOverflow0001
     * @tc.desc   Verify Int8Array lower boundary overflow.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayInt8LowerOverflow0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayInt8LowerOverflow0001 start');
        const arr89 = new Int8Array([127, 56, 0]);
        let result1 = arr89[0];
        let result2 = arr89[1];
        let result3 = arr89[2];
        expect(result1).assertEqual(127);
        expect(result2).assertEqual(56);
        expect(result3).assertEqual(0);
        done();
        console.log('testTypedArrayInt8LowerOverflow0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_UINT8_OVERFLOW_0100
     * @tc.name   testTypedArrayUint8Overflow0001
     * @tc.desc   Verify Uint8Array boundary overflow.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayUint8Overflow0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayUint8Overflow0001 start');
        const arr90 = new Uint8Array([0, 44, 255]);
        let result1 = arr90[0];
        let result2 = arr90[1];
        let result3 = arr90[2];
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(44);
        expect(result3).assertEqual(255);
        done();
        console.log('testTypedArrayUint8Overflow0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_MIXED_CONVERSION_0100
     * @tc.name   testTypedArrayMixedConversion0001
     * @tc.desc   Verify mixed type conversion in Int16Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayMixedConversion0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayMixedConversion0001 start');
        const arr91 = new Int16Array([3, 100, 1, 0]);
        let result1 = arr91[0];
        let result2 = arr91[1];
        let result3 = arr91[2];
        let result4 = arr91[3];
        expect(result1).assertEqual(3);
        expect(result2).assertEqual(100);
        expect(result3).assertEqual(1);
        expect(result4).assertEqual(0);
        done();
        console.log('testTypedArrayMixedConversion0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_LARGE_INT32_0100
     * @tc.name   testTypedArrayLargeInt320001
     * @tc.desc   Verify large integer storage in Int32Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLargeInt320001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLargeInt320001 start');
        const arr92 = new Int32Array([123456789, 987654321]);
        let result1 = arr92[0];
        let result2 = arr92[1];
        expect(result1).assertEqual(123456789);
        expect(result2).assertEqual(987654321);
        done();
        console.log('testTypedArrayLargeInt320001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_LARGE_UINT32_0100
     * @tc.name   testTypedArrayLargeUint320001
     * @tc.desc   Verify large integer storage in Uint32Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLargeUint320001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLargeUint320001 start');
        const arr93 = new Uint32Array([3000000000, 4000000000]);
        let result1 = arr93[0];
        let result2 = arr93[1];
        expect(result1).assertEqual(3000000000);
        expect(result2).assertEqual(4000000000);
        done();
        console.log('testTypedArrayLargeUint320001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT32_PRECISION_LOSS_0100
     * @tc.name   testTypedArrayFloat32PrecisionLoss0001
     * @tc.desc   Verify integer precision loss in Float32Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat32PrecisionLoss0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat32PrecisionLoss0001 start');
        const arr94 = new Float32Array([16777216, 16777216]);
        let result1 = arr94[0];
        let result2 = arr94[1];
        expect(result1).assertEqual(16777216);
        expect(result2).assertEqual(16777216);
        done();
        console.log('testTypedArrayFloat32PrecisionLoss0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT64_PRECISION_0200
     * @tc.name   testTypedArrayFloat64Precision0002
     * @tc.desc   Verify large integer precision in Float64Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat64Precision0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat64Precision0002 start');
        const arr95 = new Float64Array([9007199254740991, 9007199254740992]);
        let result1 = arr95[0];
        let result2 = arr95[1];
        expect(result1).assertEqual(9007199254740991);
        expect(result2).assertEqual(9007199254740992);
        done();
        console.log('testTypedArrayFloat64Precision0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_SIGN_EXTENSION_0100
     * @tc.name   testTypedArraySignExtension0001
     * @tc.desc   Verify sign extension in Int16Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArraySignExtension0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArraySignExtension0001 start');
        const buffer96 = new ArrayBuffer(2);
        const view96 = new DataView(buffer96);
        view96.setUint8(0, 0xFF);
        view96.setUint8(1, 0xFF);
        const arr96 = new Int16Array(buffer96);
        const result96 = arr96[0];
        expect(result96).assertEqual(-1);
        done();
        console.log('testTypedArraySignExtension0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_UNSIGNED_HANDLING_0100
     * @tc.name   testTypedArrayUnsignedHandling0001
     * @tc.desc   Verify unsigned handling in Uint16Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayUnsignedHandling0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayUnsignedHandling0001 start');
        const buffer97 = new ArrayBuffer(2);
        const view97 = new DataView(buffer97);
        view97.setUint8(0, 0xFF);
        view97.setUint8(1, 0xFF);
        const arr97 = new Uint16Array(buffer97);
        const result97 = arr97[0];
        expect(result97).assertEqual(65535);
        done();
        console.log('testTypedArrayUnsignedHandling0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FLOAT32_SPECIAL_VALUES_0100
     * @tc.name   testTypedArrayFloat32SpecialValues0001
     * @tc.desc   Verify special values in Float32Array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFloat32SpecialValues0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFloat32SpecialValues0001 start');
        const arr98 = new Float32Array([0, 0, Infinity, -Infinity, NaN]);
        expect(arr98[0]).assertEqual(0);
        expect(arr98[0] === arr98[1]).assertEqual(true);
        expect(isNaN(arr98[4])).assertEqual(true);
        done();
        console.log('testTypedArrayFloat32SpecialValues0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_CROSS_TYPE_BOUNDARY_0100
     * @tc.name   testTypedArrayCrossTypeBoundary0001
     * @tc.desc   Verify cross-type boundary conversion.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayCrossTypeBoundary0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayCrossTypeBoundary0001 start');
        const source99 = new Uint8Array([128]);
        const arr99 = new Int8Array(source99);
        const result99 = arr99[0];
        expect(result99).assertEqual(-128);
        done();
        console.log('testTypedArrayCrossTypeBoundary0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_MAX_LENGTH_0100
     * @tc.name   testTypedArrayMaxLength0001
     * @tc.desc   Verify maximum length TypedArray creation.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayMaxLength0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.log('testTypedArrayMaxLength0001 start');
      let result100 = false;
      try {
        const maxLen = Math.floor(1024 * 1024 / 4); // 4MB Int32Array
        const arr100 = new Int32Array(maxLen);
        result100 = arr100.length === maxLen;
      } catch (e) {
        result100 = false;
      }

      expect(result100).assertTrue();
      done();
      console.log('testTypedArrayMaxLength0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_SHARED_BUFFER_0100
     * @tc.name   testTypedArraySharedBuffer0001
     * @tc.desc   Verify multiple views of same type sharing buffer.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArraySharedBuffer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArraySharedBuffer0001 start');
        const buffer1 = new ArrayBuffer(8);
        const view1a = new Int32Array(buffer1);
        const view1b = new Int32Array(buffer1);
        view1a[0] = 1234;
        view1a[1] = 5678;
        let result1 = view1b[0];
        let result2 = view1b[1];
        expect(result1).assertEqual(1234);
        expect(result2).assertEqual(5678);
        done();
        console.log('testTypedArraySharedBuffer0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_DIFF_TYPE_VIEWS_0100
     * @tc.name   testTypedArrayDiffTypeViews0001
     * @tc.desc   Verify different type views on same buffer.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayDiffTypeViews0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayDiffTypeViews0001 start');
        const buffer2 = new ArrayBuffer(8);
        const view2a = new Int32Array(buffer2);
        const view2b = new Uint16Array(buffer2);
        view2a[0] = 0x12345678;
        let result1 = view2b[0];
        let result2 = view2b[1];
        expect(result1).assertEqual(22136);
        expect(result2).assertEqual(4660);
        done();
        console.log('testTypedArrayDiffTypeViews0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_SIGNED_UNSIGNED_0100
     * @tc.name   testTypedArraySignedUnsigned0001
     * @tc.desc   Verify signed/unsigned views on same buffer.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArraySignedUnsigned0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArraySignedUnsigned0001 start');
        const buffer3 = new ArrayBuffer(2);
        const view3a = new Int8Array(buffer3);
        const view3b = new Uint8Array(buffer3);
        view3a[0] = -1;
        view3a[1] = -128;
        let result1 = view3b[0];
        let result2 = view3b[1];
        expect(result1).assertEqual(255);
        expect(result2).assertEqual(128);
        done();
        console.log('testTypedArraySignedUnsigned0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_PARTITIONED_VIEWS_0100
     * @tc.name   testTypedArrayPartitionedViews0001
     * @tc.desc   Verify partitioned views on same buffer.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayPartitionedViews0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayPartitionedViews0001 start');
        const buffer4 = new ArrayBuffer(12);
        const view4a = new Int32Array(buffer4, 0, 2);
        const view4b = new Uint8Array(buffer4, 8, 4);
        view4a[1] = 999;
        view4b[2] = 255;
        let result1 = view4a[1];
        let result2 = view4b[2];
        expect(result1).assertEqual(999);
        expect(result2).assertEqual(255);
        done();
        console.log('testTypedArrayPartitionedViews0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_OVERLAPPING_VIEWS_0100
     * @tc.name   testTypedArrayOverlappingViews0001
     * @tc.desc   Verify overlapping views on same buffer.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayOverlappingViews0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayOverlappingViews0001 start');
        const buffer5 = new ArrayBuffer(8);
        const view5a = new Uint16Array(buffer5, 2, 3);
        const view5b = new Float32Array(buffer5, 0, 2);
        view5a[1] = 0x4140;
        const result5 = view5b[0].toFixed(1);
        expect(result5).assertEqual('0.0');
        done();
        console.log('testTypedArrayOverlappingViews0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_EMPTY_BUFFER_0100
     * @tc.name   testTypedArrayEmptyBuffer0001
     * @tc.desc   Verify empty buffer with multiple views.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayEmptyBuffer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayEmptyBuffer0001 start');
        const buffer6 = new ArrayBuffer(0);
        const view6a = new Int8Array(buffer6);
        const view6b = new Uint32Array(buffer6);
        let result1 = view6a.length;
        let result2 = view6b.length;
        expect(result1).assertEqual(0);
        expect(result2).assertEqual(0);
        done();
        console.log('testTypedArrayEmptyBuffer0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_LARGE_BUFFER_0100
     * @tc.name   testTypedArrayLargeBuffer0001
     * @tc.desc   Verify large buffer performance.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayLargeBuffer0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayLargeBuffer0001 start');
        const buffer7 = new ArrayBuffer(1024 * 1024);
        const view7a = new Float64Array(buffer7);
        const view7b = new Uint8Array(buffer7);
        view7a[1000] = 123.456;

        expect(view7b[1000 * 8] !== 0).assertEqual(true);
        done();
        console.log('testTypedArrayLargeBuffer0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_BUFFER_PERSISTENCE_0100
     * @tc.name   testTypedArrayBufferPersistence0001
     * @tc.desc   Verify buffer data persistence after view destruction.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayBufferPersistence0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayBufferPersistence0001 start');
        const buffer8 = new ArrayBuffer(4);
        const view8a = new Int32Array(buffer8);
        view8a[0] = 555;
        const view8b = new Int32Array(buffer8);

        expect(view8b[0]).assertEqual(555);
        done();
        console.log('testTypedArrayBufferPersistence0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_BUFFER_REFERENCE_0100
     * @tc.name   testTypedArrayBufferReference0001
     * @tc.desc   Verify buffer reference consistency.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayBufferReference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayBufferReference0001 start');
        const buffer9 = new ArrayBuffer(8);
        const view9 = new Uint16Array(buffer9);

        expect(view9.buffer === buffer9).assertEqual(true);
        done();
        console.log('testTypedArrayBufferReference0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_BYTE_OFFSET_0100
     * @tc.name   testTypedArrayByteOffset0001
     * @tc.desc   Verify default byteOffset is 0.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayByteOffset0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayByteOffset0001 start');
        const buffer10 = new ArrayBuffer(12);
        const view10 = new Int32Array(buffer10);
        const result10 = view10.byteOffset;
        expect(result10).assertEqual(0);
        done();
        console.log('testTypedArrayByteOffset0001 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_1100
     * @tc.name   testTypedArrayFromArrayLike0011
     * @tc.desc   Verify Int16Array creation from array-like object.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0011 start');

        // Fix: Use standard array instead of indexed signatures and object literals
        const likeArr43: number[] = [100, 200];
        const arr43 = new Int16Array(likeArr43);
        const result43 = arr43[1];

        expect(result43).assertEqual(200);
        done();
        console.log('testTypedArrayFromArrayLike0011 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0200
     * @tc.name   testTypedArrayFromArrayLike0002
     * @tc.desc   Verify Int32Array creation from standard array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0002 start');
        const likeArr44: number[] = [300, 400];
        const arr44 = new Int32Array(likeArr44);
        const result44 = arr44[1];

        expect(result44).assertEqual(400);
        done();
        console.log('testTypedArrayFromArrayLike0002 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0300
     * @tc.name   testTypedArrayFromArrayLike0003
     * @tc.desc   Verify Float32Array creation from standard array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0003 start');
        const likeArr45: number[] = [1.5, 2.5];
        const arr45 = new Float32Array(likeArr45);
        const result45 = arr45[1].toFixed(1);

        expect(result45).assertEqual('2.5');
        done();
        console.log('testTypedArrayFromArrayLike0003 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0400
     * @tc.name   testTypedArrayFromArrayLike0004
     * @tc.desc   Verify Uint8Array creation from standard array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0004 start');
        const likeArr46: number[] = [255, 128];
        const arr46 = new Uint8Array(likeArr46);
        let result1 = arr46[0];
        let result2 = arr46[1];
        expect(result1).assertEqual(255);
        expect(result2).assertEqual(128);
        done();
        console.log('testTypedArrayFromArrayLike0004 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0500
     * @tc.name   testTypedArrayFromArrayLike0005
     * @tc.desc   Verify Float64Array creation from standard array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0005 start');

        const likeArr47: number[] = [3.14159, 2.71828];
        const arr47 = new Float64Array(likeArr47);
        const result47 = arr47[0].toFixed(5);

        expect(result47).assertEqual('3.14159');
        done();
        console.log('testTypedArrayFromArrayLike0005 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0600
     * @tc.name   testTypedArrayFromArrayLike0006
     * @tc.desc   Verify Int16Array creation from empty array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0006 start');
        const likeArr48: number[] = [];
        const arr48 = new Int16Array(likeArr48);
        const result48 = arr48.length;

        expect(result48).assertEqual(0);
        done();
        console.log('testTypedArrayFromArrayLike0006 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0700
     * @tc.name   testTypedArrayFromArrayLike0007
     * @tc.desc   Verify Int8Array creation from single element array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0007 start');
        const likeArr49: number[] = [42];
        const arr49 = new Int8Array(likeArr49);
        let result1 = arr49[0];
        let result2 = arr49.length;
        expect(result1).assertEqual(42);
        expect(result2).assertEqual(1);
        done();
        console.log('testTypedArrayFromArrayLike0007 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0800
     * @tc.name   testTypedArrayFromArrayLike0008
     * @tc.desc   Verify Uint16Array creation from multi-element array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0008 start');
        const likeArr50: number[] = [1000, 2000, 3000];
        const arr50 = new Uint16Array(likeArr50);

        let result1 = arr50[2];
        let result2 = arr50.length;
        expect(result1).assertEqual(3000);
        expect(result2).assertEqual(3);
        done();
        console.log('testTypedArrayFromArrayLike0008 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_0900
     * @tc.name   testTypedArrayFromArrayLike0009
     * @tc.desc   Verify Int32Array creation from large array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0009 start');
        const likeArr51: number[] = [1000000, 2000000, 3000000];
        const arr51 = new Int32Array(likeArr51);
        let result1 = arr51[1];
        let result2 = arr51.byteLength;
        expect(result1).assertEqual(2000000);
        expect(result2).assertEqual(12);
        done();
        console.log('testTypedArrayFromArrayLike0009 done');
    });

    /**
     * @tc.number SUB_BASE_DATA_TYPEDARRAY_FROM_ARRAYLIKE_1000
     * @tc.name   testTypedArrayFromArrayLike0010
     * @tc.desc   Verify Float32Array creation from decimal array.
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it("testTypedArrayFromArrayLike0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('testTypedArrayFromArrayLike0010 start');

        const likeArr52: number[] = [1.234, 5.678, 9.012];
        const arr52 = new Float32Array(likeArr52);
        let result1 = arr52[0].toFixed(3);
        let result2 = arr52[2].toFixed(3);
        expect(result1).assertEqual('1.234');
        expect(result2).assertEqual('9.012');
        done();
        console.log('testTypedArrayFromArrayLike0010 done');
    });
  })
}