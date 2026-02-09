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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

export default function IndexedCollections04Test() {
  describe('IndexedCollections04Test', () => {
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
     * @tc.number    SUB_TYPEDARRAY_SOME_NO_SATISFY_0001
     * @tc.name      test_TypedArray_SomeNoSatisfy_0001
     * @tc.desc      Test some() with no elements satisfying the condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SomeNoSatisfy_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SomeNoSatisfy_0001 start');
        const uint8: Uint8Array = new Uint8Array([1, 2, 3, 4]);
        const result: boolean = uint8.some(x => x > 10);
        expect(result).assertFalse();

        done();
        console.log('test_TypedArray_SomeNoSatisfy_0001 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_REDUCE_SUM_0002
     * @tc.name      test_TypedArray_ReduceSum_0002
     * @tc.desc      Test reduce() to sum elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReduceSum_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReduceSum_0002 start');
        const int16: Int16Array = new Int16Array([10, 20, 30, 40]);
        const sum: number = int16.reduce((acc, val) => acc + val, 0);
        let result: boolean = sum === 100;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReduceSum_0002 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_REDUCERIGHT_PRODUCT_0003
     * @tc.name      test_TypedArray_ReduceRightProduct_0003
     * @tc.desc      Test reduceRight() to product elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ReduceRightProduct_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ReduceRightProduct_0003 start');
        const uint32: Uint32Array = new Uint32Array([2, 3, 4]);
        const product: number = uint32.reduceRight((acc, val) => acc * val, 1);
        let result: boolean = product === 24;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ReduceRightProduct_0003 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_JOIN_DEFAULT_0004
     * @tc.name      test_TypedArray_JoinDefault_0004
     * @tc.desc      Test join() with default separator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_JoinDefault_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_JoinDefault_0004 start');
        const float32: Float32Array = new Float32Array([1, 2, 3]);
        const str: string = float32.join();
        let result: boolean = str === '1,2,3';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_JoinDefault_0004 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_JOIN_CUSTOM_0005
     * @tc.name      test_TypedArray_JoinCustom_0005
     * @tc.desc      Test join() with custom separator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_JoinCustom_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_JoinCustom_0005 start');
        const int8: Int8Array = new Int8Array([10, 20, 30]);
        const str: string = int8.join('-');
        let result: boolean = str === '10-20-30';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_JoinCustom_0005 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INCLUDES_EXISTS_0006
     * @tc.name      test_TypedArray_IncludeExists_0006
     * @tc.desc      Test includes() with existing element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_IncludeExists_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_IncludeExists_0006 start');
        const uint16: Uint16Array = new Uint16Array([5, 10, 15, 20]);
        const result: boolean = uint16.includes(15);
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_IncludeExists_0006 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INCLUDES_NOT_EXISTS_0007
     * @tc.name      test_TypedArray_IncludeNotExists_0007
     * @tc.desc      Test includes() with non-existing element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_IncludeNotExists_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_IncludeNotExists_0007 start');
        const int32: Int32Array = new Int32Array([5, 10, 15, 20]);
        const result: boolean = int32.includes(25);
        expect(result).assertFalse();

        done();
        console.log('test_TypedArray_IncludeNotExists_0007 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INCLUDES_NAN_0008
     * @tc.name      test_TypedArray_IncludeNaN_0008
     * @tc.desc      Test includes() with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_IncludeNaN_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_IncludeNaN_0008 start');
        const float64: Float64Array = new Float64Array([1, NaN, 3]);
        const result: boolean = float64.includes(NaN);
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_IncludeNaN_0008 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INCLUDES_FROM_INDEX_0009
     * @tc.name      test_TypedArray_IncludeFromIndex_0009
     * @tc.desc      Test includes() from a specific index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_IncludeFromIndex_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_IncludeFromIndex_0009 start');
        const uint8: Uint8Array = new Uint8Array([1, 2, 3, 2, 1]);
        const result: boolean = uint8.includes(2, 3);
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_IncludeFromIndex_0009 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INDEXOF_FOUND_0010
     * @tc.name      test_TypedArray_IndexOfFound_0010
     * @tc.desc      Test indexOf() with found element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_IndexOfFound_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_IndexOfFound_0010 start');
        const int16: Int16Array = new Int16Array([10, 20, 30, 20]);
        const index: number = int16.indexOf(20);
        let result: boolean = index === 1;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_IndexOfFound_0010 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INDEXOF_NOT_FOUND_0011
     * @tc.name      test_TypedArray_IndexOfNotFound_0011
     * @tc.desc      Test indexOf() with not found element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_IndexOfNotFound_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_IndexOfNotFound_0011 start');
        const uint32: Uint32Array = new Uint32Array([10, 20, 30]);
        const index: number = uint32.indexOf(40);
        let result: boolean = index === -1;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_IndexOfNotFound_0011 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INDEXOF_NAN_0012
     * @tc.name      test_TypedArray_IndexOfNaN_0012
     * @tc.desc      Test indexOf() with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_IndexOfNaN_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_IndexOfNaN_0012 start');
        const float32: Float32Array = new Float32Array([1, NaN, 3]);
        const index: number = float32.indexOf(NaN);
        let result: boolean = index === -1;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_IndexOfNaN_0012 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_LASTINDEXOF_FOUND_0013
     * @tc.name      test_TypedArray_LastIndexOfFound_0013
     * @tc.desc      Test lastIndexOf() with found element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_LastIndexOfFound_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_LastIndexOfFound_0013 start');
        const int8: Int8Array = new Int8Array([10, 20, 30, 20]);
        const index: number = int8.lastIndexOf(20);
        let result: boolean = index === 3;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_LastIndexOfFound_0013 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONCAT_SAME_TYPE_0014
     * @tc.name      test_TypedArray_ConcatSameType_0014
     * @tc.desc      Test concat() with same type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ConcatSameType_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ConcatSameType_0014 start');
        const a: Int32Array = new Int32Array([1, 2]);
        const b: Int32Array = new Int32Array([3, 4]);

        const totalLength = a.length + b.length;
        const resultBuffer = new ArrayBuffer(totalLength * Int32Array.BYTES_PER_ELEMENT);
        const resultArray = new Int32Array(resultBuffer);

        resultArray.set(a, 0);
        resultArray.set(b, a.length);

        let result: boolean = resultArray.join(',') === '1,2,3,4' && resultArray instanceof Int32Array;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ConcatSameType_0014 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_CONCAT_DIFFERENT_TYPES_0015
     * @tc.name      test_TypedArray_ConcatDifferentTypes_0015
     * @tc.desc      Test concat() with different type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_ConcatDifferentTypes_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_ConcatDifferentTypes_0015 start');
        const a: Int16Array = new Int16Array([1, 2]);
        const b: Uint16Array = new Uint16Array([3, 4]);

        const totalLength = a.length + b.length;
        const resultBuffer = new ArrayBuffer(totalLength * Int16Array.BYTES_PER_ELEMENT);
        const resultArray = new Int16Array(resultBuffer);

        resultArray.set(a, 0);
        resultArray.set(b, a.length);

        let result: boolean = resultArray.join(',') === '1,2,3,4';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_ConcatDifferentTypes_0015 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FIND_0016
     * @tc.name      test_TypedArray_Find_0016
     * @tc.desc      Test find() to find an element that satisfies the condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Find_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Find_0016 start');
        const uint8: Uint8Array = new Uint8Array([5, 10, 15, 20]);
        const found: number | undefined = uint8.find(x => x > 12);
        let result: boolean = found === 15;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Find_0016 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FINDINDEX_0017
     * @tc.name      test_TypedArray_FindIndex_0017
     * @tc.desc      Test findIndex() to find the index of an element that satisfies the condition
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_FindIndex_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_FindIndex_0017 start');
        const float64: Float64Array = new Float64Array([1.5, 2.5, 3.5]);
        const index: number = float64.findIndex(x => x > 2);
        let result: boolean = index === 1;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_FindIndex_0017 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FILL_SINGLE_VALUE_0018
     * @tc.name      test_TypedArray_FillSingleValue_0018
     * @tc.desc      Test fill() with a single value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_FillSingleValue_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_FillSingleValue_0018 start');
        const int32: Int32Array = new Int32Array(3);
        int32.fill(5);
        let result: boolean = int32.join(',') === '5,5,5';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_FillSingleValue_0018 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FILL_RANGE_0019
     * @tc.name      test_TypedArray_FillRange_0019
     * @tc.desc      Test fill() with a specified range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_FillRange_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_FillRange_0019 start');
        const uint16: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
        uint16.fill(0, 1, 4);
        let result: boolean = uint16.join(',') === '1,0,0,0,5';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_FillRange_0019 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_REVERSE_0020
     * @tc.name      test_TypedArray_Reverse_0020
     * @tc.desc      Test reverse() to reverse the array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Reverse_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Reverse_0020 start');
        const int8: Int8Array = new Int8Array([1, 2, 3, 4]);
        int8.reverse();
        let result: boolean = int8.join(',') === '4,3,2,1';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Reverse_0020 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_FROM_ARRAY_0001
     * @tc.name      test_TypedArray_SetFromArray_0001
     * @tc.desc      Test set() from a regular array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetFromArray_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetFromArray_0001 start');
        const arr1: Int8Array = new Int8Array(3);
        arr1.set([1, 2, 3]);
        let result: boolean = arr1.toString() === '1,2,3';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetFromArray_0001 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_FROM_TYPEDARRAY_0002
     * @tc.name      test_TypedArray_SetFromTypedArray_0002
     * @tc.desc      Test set() from another TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetFromTypedArray_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetFromTypedArray_0002 start');
        const sourceArr2: Int8Array = new Int8Array([4, 5, 6]);
        const arr2: Int8Array = new Int8Array(3);
        arr2.set(sourceArr2);
        let result: boolean = arr2.toString() === '4,5,6';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetFromTypedArray_0002 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_WITH_OFFSET_0003
     * @tc.name      test_TypedArray_SetWithOffset_0003
     * @tc.desc      Test set() with an offset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetWithOffset_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetWithOffset_0003 start');
        const arr3: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
        arr3.set([4, 5], 2);
        let result: boolean = arr3.toString() === '0,0,4,5,0';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetWithOffset_0003 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_EXCEEDS_LENGTH_0004
     * @tc.name      test_TypedArray_SetExceedsLength_0004
     * @tc.desc      Test set() with a source array that exceeds the target array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetExceedsLength_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetExceedsLength_0004 start');
        const arr4: Int8Array = new Int8Array(5);
        let result: boolean = false;

        try {
          arr4.set([1, 2, 3, 4, 5, 6, 7]);
        } catch (e) {
          result = e instanceof RangeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetExceedsLength_0004 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_INVALID_SOURCE_0005
     * @tc.name      test_TypedArray_SetInvalidSource_0005
     * @tc.desc      Test set() with an invalid source (not an array or array-like object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetInvalidSource_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetInvalidSource_0005 start');
        const arr5: Int8Array = new Int8Array(3);
        let result: boolean = false;

        interface InvalidSource {
          toString: () => string;
        }

        const invalidSource: InvalidSource = { toString: () => "invalid" };

        try {
          arr5.set(invalidSource as ArrayLike<number>);
        } catch (e) {
          result = e instanceof TypeError;
        }

        expect(result).assertFalse();

        done();
        console.log('test_TypedArray_SetInvalidSource_0005 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_0006
     * @tc.name      test_TypedArray_Subarray_0006
     * @tc.desc      Test subarray() to extract a subarray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Subarray_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Subarray_0006 start');
        const arr6: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const subArr6: Int8Array = arr6.subarray(1, 3);
        let result: boolean = subArr6.toString() === '2,3';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Subarray_0006 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_NEGATIVE_PARAMS_0007
     * @tc.name      test_TypedArray_SubarrayNegativeParams_0007
     * @tc.desc      Test subarray() with negative parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarrayNegativeParams_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarrayNegativeParams_0007 start');
        const arr7: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const subArr7: Int8Array = arr7.subarray(-3, -1);
        let result: boolean = subArr7.toString() === '3,4';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarrayNegativeParams_0007 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_SHARED_BUFFER_0008
     * @tc.name      test_TypedArray_SubarraySharedBuffer_0008
     * @tc.desc      Test subarray() sharing the same buffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarraySharedBuffer_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarraySharedBuffer_0008 start');
        const arr8: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const subArr8: Int8Array = arr8.subarray(1, 3);
        subArr8[0] = 9;
        let result: boolean = arr8.toString() === '1,9,3,4,5';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarraySharedBuffer_0008 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_VS_SLICE_0009
     * @tc.name      test_TypedArray_SubarrayVsSlice_0009
     * @tc.desc      Test the difference between subarray() and slice() - subarray() view modifies the original array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarrayVsSlice_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarrayVsSlice_0009 start');
        const arr9: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const subArr9: Int8Array = arr9.subarray(1, 3);
        subArr9[0] = 10;
        let result: boolean = arr9.toString() === '1,10,3,4,5';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarrayVsSlice_0009 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SLICE_VS_SUBARRAY_0010
     * @tc.name      test_TypedArray_SliceVsSubarray_0010
     * @tc.desc      Test the difference between subarray() and slice() - slice() new array modification does not affect the original array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SliceVsSubarray_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SliceVsSubarray_0010 start');
        const arr10: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const sliceArr10: Int8Array = arr10.slice(1, 3);
        sliceArr10[0] = 11;
        let result: boolean = arr10.toString() === '1,2,3,4,5';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SliceVsSubarray_0010 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_FROM_EMPTY_ARRAY_0011
     * @tc.name      test_TypedArray_SetFromEmptyArray_0011
     * @tc.desc      Test set() from an empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetFromEmptyArray_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetFromEmptyArray_0011 start');
        const arr11: Int8Array = new Int8Array(3);
        arr11.set([]);
        let result: boolean = arr11.toString() === '0,0,0';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetFromEmptyArray_0011 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_FROM_EMPTY_TYPEDARRAY_0012
     * @tc.name      test_TypedArray_SetFromEmptyTypedArray_0012
     * @tc.desc      Test set() from an empty TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetFromEmptyTypedArray_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetFromEmptyTypedArray_0012 start');
        const sourceArr12: Int8Array = new Int8Array([]);
        const arr12: Int8Array = new Int8Array(3);
        arr12.set(sourceArr12);
        let result: boolean = arr12.toString() === '0,0,0';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetFromEmptyTypedArray_0012 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_OFFSET_EQUAL_LENGTH_0013
     * @tc.name      test_TypedArray_SetOffsetEqualLength_0013
     * @tc.desc      Test set() with an offset equal to the array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetOffsetEqualLength_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetOffsetEqualLength_0013 start');
        const arr13: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
        let result: boolean = false;

        try {
          arr13.set([1], 5);
        } catch (e) {
          result = e instanceof RangeError;
        }

        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetOffsetEqualLength_0013 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_OFFSET_EXCEEDS_LENGTH_0014
     * @tc.name      test_TypedArray_SetOffsetExceedsLength_0014
     * @tc.desc      Test set() with an offset that exceeds the array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetOffsetExceedsLength_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetOffsetExceedsLength_0014 start');
        const arr14: Int8Array = new Int8Array(3);
        let result: boolean = false;
        try {
          arr14.set([1], 4);
        } catch (e) {
          result = e instanceof RangeError;
        }
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetOffsetExceedsLength_0014 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_START_EQUAL_LENGTH_0015
     * @tc.name      test_TypedArray_SubarrayStartEqualLength_0015
     * @tc.desc      Test subarray() with a start index equal to the array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarrayStartEqualLength_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarrayStartEqualLength_0015 start');
        const arr15: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const subArr15: Int8Array = arr15.subarray(5);
        let result: boolean = subArr15.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarrayStartEqualLength_0015 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_END_EQUAL_LENGTH_0016
     * @tc.name      test_TypedArray_SubarrayEndEqualLength_0016
     * @tc.desc      Test subarray() with an end index equal to the array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarrayEndEqualLength_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarrayEndEqualLength_0016 start');
        const arr16: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const subArr16: Int8Array = arr16.subarray(1, 5);
        let result: boolean = subArr16.toString() === '2,3,4,5';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarrayEndEqualLength_0016 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_START_END_EQUAL_0017
     * @tc.name      test_TypedArray_SubarrayStartEndEqual_0017
     * @tc.desc      Test subarray() with start and end indices equal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarrayStartEndEqual_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarrayStartEndEqual_0017 start');
        const arr17: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const subArr17: Int8Array = arr17.subarray(2, 2);
        let result: boolean = subArr17.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarrayStartEndEqual_0017 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_START_GREATER_THAN_END_0018
     * @tc.name      test_TypedArray_SubarrayStartGreaterThanEnd_0018
     * @tc.desc      Test subarray() with start index greater than end index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarrayStartGreaterThanEnd_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarrayStartGreaterThanEnd_0018 start');
        const arr18: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
        const subArr18: Int8Array = arr18.subarray(3, 1);
        let result: boolean = subArr18.length === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarrayStartGreaterThanEnd_0018 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SET_MULTIPLE_TIMES_0019
     * @tc.name      test_TypedArray_SetMultipleTimes_0019
     * @tc.desc      Test set() multiple times from different arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SetMultipleTimes_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SetMultipleTimes_0019 start');
        const arr19: Int8Array = new Int8Array([0, 0, 0, 0, 0]);
        arr19.set([1, 2], 0);
        arr19.set([3, 4], 2);
        let result: boolean = arr19.toString() === '1,2,3,4,0';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SetMultipleTimes_0019 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SUBARRAY_MULTIPLE_TIMES_0020
     * @tc.name      test_TypedArray_SubarrayMultipleTimes_0020
     * @tc.desc      Test subarray() multiple times to extract different parts
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SubarrayMultipleTimes_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SubarrayMultipleTimes_0020 start');
        const arr20: Int8Array = new Int8Array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
        const subArr20_1: Int8Array = arr20.subarray(1, 3);
        const subArr20_2: Int8Array = arr20.subarray(4, 6);
        let result: boolean = subArr20_1.toString() === '2,3' && subArr20_2.toString() === '5,6';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SubarrayMultipleTimes_0020 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_READ_WRITE_0001
     * @tc.name      test_TypedArray_Int8ReadWrite_0001
     * @tc.desc      Test basic read and write operations on Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8ReadWrite_0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8ReadWrite_0001 start');
        const arr1: Int8Array = new Int8Array(2);
        arr1[0] = 42;
        arr1[1] = -15;
        let result: boolean = arr1[0] === 42 && arr1[1] === -15;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8ReadWrite_0001 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_READ_WRITE_0002
     * @tc.name      test_TypedArray_Uint8ReadWrite_0002
     * @tc.desc      Test basic read and write operations on Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8ReadWrite_0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8ReadWrite_0002 start');
        const arr2: Uint8Array = new Uint8Array(2);
        arr2[0] = 200;
        arr2[1] = 55;
        let result: boolean = arr2[0] === 200 && arr2[1] === 55;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8ReadWrite_0002 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_READ_WRITE_0003
     * @tc.name      test_TypedArray_Int16ReadWrite_0003
     * @tc.desc      Test basic read and write operations on Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16ReadWrite_0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16ReadWrite_0003 start');
        const arr3: Int16Array = new Int16Array(2);
        arr3[0] = 3200;
        arr3[1] = -1500;
        let result: boolean = arr3[0] === 3200 && arr3[1] === -1500;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16ReadWrite_0003 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_READ_WRITE_0004
     * @tc.name      test_TypedArray_Uint16ReadWrite_0004
     * @tc.desc      Test basic read and write operations on Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16ReadWrite_0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16ReadWrite_0004 start');
        const arr4: Uint16Array = new Uint16Array(2);
        arr4[0] = 65000;
        arr4[1] = 1234;
        let result: boolean = arr4[0] === 65000 && arr4[1] === 1234;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16ReadWrite_0004 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_READ_WRITE_0005
     * @tc.name      test_TypedArray_Int32ReadWrite_0005
     * @tc.desc      Test basic read and write operations on Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32ReadWrite_0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32ReadWrite_0005 start');
        const arr5: Int32Array = new Int32Array(2);
        arr5[0] = 123456;
        arr5[1] = -789012;
        let result: boolean = arr5[0] === 123456 && arr5[1] === -789012;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32ReadWrite_0005 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_READ_WRITE_0006
     * @tc.name      test_TypedArray_Uint32ReadWrite_0006
     * @tc.desc      Test basic read and write operations on Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32ReadWrite_0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32ReadWrite_0006 start');
        const arr6: Uint32Array = new Uint32Array(2);
        arr6[0] = 3000000000;
        arr6[1] = 500000000;
        let result: boolean = arr6[0] === 3000000000 && arr6[1] === 500000000;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32ReadWrite_0006 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_READ_WRITE_0007
     * @tc.name      test_TypedArray_Float32ReadWrite_0007
     * @tc.desc      Test basic read and write operations on Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32ReadWrite_0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32ReadWrite_0007 start');
        const arr7: Float32Array = new Float32Array(2);
        arr7[0] = 3.1415;
        arr7[1] = -2.718;
        let result: boolean = arr7[0].toFixed(4) === '3.1415' && arr7[1].toFixed(3) === '-2.718';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32ReadWrite_0007 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT64_READ_WRITE_0008
     * @tc.name      test_TypedArray_Float64ReadWrite_0008
     * @tc.desc      Test basic read and write operations on Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float64ReadWrite_0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float64ReadWrite_0008 start');
        const arr8: Float64Array = new Float64Array(2);
        arr8[0] = 1.23456789;
        arr8[1] = -9.87654321;
        let result: boolean = arr8[0].toFixed(8) === '1.23456789' && arr8[1].toFixed(8) === '-9.87654321';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float64ReadWrite_0008 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_INITIAL_VALUES_0009
     * @tc.name      test_TypedArray_Int8InitialValues_0009
     * @tc.desc      Test initial values of Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8InitialValues_0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8InitialValues_0009 start');
        const arr9: Int8Array = new Int8Array(3);
        let result: boolean = arr9[0] === 0 && arr9[1] === 0 && arr9[2] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8InitialValues_0009 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_INITIAL_VALUES_0010
     * @tc.name      test_TypedArray_Uint32InitialValues_0010
     * @tc.desc      Test initial values of Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32InitialValues_0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32InitialValues_0010 start');
        const arr10: Uint32Array = new Uint32Array(3);
        let result: boolean = arr10[0] === 0 && arr10[1] === 0 && arr10[2] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32InitialValues_0010 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_INITIAL_VALUES_0011
     * @tc.name      test_TypedArray_Float32InitialValues_0011
     * @tc.desc      Test initial values of Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32InitialValues_0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32InitialValues_0011 start');
        const arr11: Float32Array = new Float32Array(3);
        let result: boolean = arr11[0] === 0 && arr11[1] === 0 && arr11[2] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32InitialValues_0011 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_SINGLE_ELEMENT_ACCESS_0012
     * @tc.name      test_TypedArray_SingleElementAccess_0012
     * @tc.desc      Test accessing a single element in a TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_SingleElementAccess_0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_SingleElementAccess_0012 start');
        const arr12: Int16Array = new Int16Array(1);
        arr12[0] = 123;
        let result: boolean = arr12[0] === 123;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_SingleElementAccess_0012 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_BUFFER_VIEW_ACCESS_0013
     * @tc.name      test_TypedArray_BufferViewAccess_0013
     * @tc.desc      Test accessing elements via a buffer view
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_BufferViewAccess_0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_BufferViewAccess_0013 start');
        const buffer13: ArrayBuffer = new ArrayBuffer(4);
        const arr13: Int32Array = new Int32Array(buffer13);
        arr13[0] = 456;
        let result: boolean = arr13[0] === 456;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_BufferViewAccess_0013 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_OFFSET_VIEW_ACCESS_0014
     * @tc.name      test_TypedArray_OffsetViewAccess_0014
     * @tc.desc      Test accessing elements via an offset view
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_OffsetViewAccess_0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_OffsetViewAccess_0014 start');
        const buffer14: ArrayBuffer = new ArrayBuffer(8);
        const arr14: Int16Array = new Int16Array(buffer14, 2, 3);
        arr14[1] = 789;
        let result: boolean = arr14[1] === 789;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_OffsetViewAccess_0014 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_UPPER_BOUND_ACCESS_0015
     * @tc.name      test_TypedArray_Int8UpperBoundAccess_0015
     * @tc.desc      Test accessing the upper bound value of Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8UpperBoundAccess_0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8UpperBoundAccess_0015 start');
        const arr15: Int8Array = new Int8Array(1);
        arr15[0] = 127;
        let result: boolean = arr15[0] === 127;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8UpperBoundAccess_0015 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_LOWER_BOUND_ACCESS_0016
     * @tc.name      test_TypedArray_Int8LowerBoundAccess_0016
     * @tc.desc      Test accessing the lower bound value of Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8LowerBoundAccess_0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8LowerBoundAccess_0016 start');
        const arr16: Int8Array = new Int8Array(1);
        arr16[0] = -128;
        let result: boolean = arr16[0] === -128;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8LowerBoundAccess_0016 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_BOUND_ACCESS_0017
     * @tc.name      test_TypedArray_Uint8BoundAccess_0017
     * @tc.desc      Test accessing the boundary value of Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8BoundAccess_0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8BoundAccess_0017 start');
        const arr17: Uint8Array = new Uint8Array(1);
        arr17[0] = 255;
        let result: boolean = arr17[0] === 255;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8BoundAccess_0017 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_BOUND_ACCESS_0018
     * @tc.name      test_TypedArray_Int16BoundAccess_0018
     * @tc.desc      Test accessing the boundary value of Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16BoundAccess_0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16BoundAccess_0018 start');
        const arr18: Int16Array = new Int16Array(1);
        arr18[0] = 32767;
        let result: boolean = arr18[0] === 32767;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16BoundAccess_0018 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_BOUND_ACCESS_0019
     * @tc.name      test_TypedArray_Uint16BoundAccess_0019
     * @tc.desc      Test accessing the boundary value of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16BoundAccess_0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16BoundAccess_0019 start');
        const arr19: Uint16Array = new Uint16Array(1);
        arr19[0] = 65535;
        let result: boolean = arr19[0] === 65535;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16BoundAccess_0019 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT64_SPECIAL_VALUES_0020
     * @tc.name      test_TypedArray_Float64SpecialValues_0020
     * @tc.desc      Test accessing special values of Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float64SpecialValues_0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float64SpecialValues_0020 start');
        const arr20: Float64Array = new Float64Array(2);
        arr20[0] = Infinity;
        arr20[1] = -Infinity;
        let result: boolean = arr20[0] === Infinity && arr20[1] === -Infinity;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float64SpecialValues_0020 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_UPPER_OVERFLOW_0021
     * @tc.name      test_TypedArray_Int8UpperOverflow_0021
     * @tc.desc      Test upper bound overflow of Int8Array (128 → -128)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8UpperOverflow_0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8UpperOverflow_0021 start');
        const arr21: Int8Array = new Int8Array(1);
        arr21[0] = 128;
        let result: boolean = arr21[0] === -128;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8UpperOverflow_0021 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_LOWER_OVERFLOW_0022
     * @tc.name      test_TypedArray_Int8LowerOverflow_0022
     * @tc.desc      Test lower bound overflow of Int8Array (-129 → 127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8LowerOverflow_0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8LowerOverflow_0022 start');
        const arr22: Int8Array = new Int8Array(1);
        arr22[0] = -129;
        let result: boolean = arr22[0] === 127;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8LowerOverflow_0022 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_UPPER_OVERFLOW_0023
     * @tc.name      test_TypedArray_Uint8UpperOverflow_0023
     * @tc.desc      Test upper bound overflow of Uint8Array (256 → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8UpperOverflow_0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8UpperOverflow_0023 start');
        const arr23: Uint8Array = new Uint8Array(1);
        arr23[0] = 256;
        let result: boolean = arr23[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8UpperOverflow_0023 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_NEGATIVE_CONVERSION_0024
     * @tc.name      test_TypedArray_Uint8NegativeConversion_0024
     * @tc.desc      Test negative conversion of Uint8Array (-1 → 255)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8NegativeConversion_0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8NegativeConversion_0024 start');
        const arr24: Uint8Array = new Uint8Array(1);
        arr24[0] = -1;
        let result: boolean = arr24[0] === 255;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8NegativeConversion_0024 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_UPPER_OVERFLOW_0025
     * @tc.name      test_TypedArray_Int16UpperOverflow_0025
     * @tc.desc      Test upper bound overflow of Int16Array (32768 → -32768)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16UpperOverflow_0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16UpperOverflow_0025 start');
        const arr25: Int16Array = new Int16Array(1);
        arr25[0] = 32768;
        let result: boolean = arr25[0] === -32768;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16UpperOverflow_0025 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_LOWER_OVERFLOW_0026
     * @tc.name      test_TypedArray_Int16LowerOverflow_0026
     * @tc.desc      Test lower bound overflow of Int16Array (-32769 → 32767)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16LowerOverflow_0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16LowerOverflow_0026 start');
        const arr26: Int16Array = new Int16Array(1);
        arr26[0] = -32769;
        let result: boolean = arr26[0] === 32767;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16LowerOverflow_0026 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_UPPER_OVERFLOW_0027
     * @tc.name      test_TypedArray_Uint16UpperOverflow_0027
     * @tc.desc      Test upper bound overflow of Uint16Array (65536 → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16UpperOverflow_0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16UpperOverflow_0027 start');
        const arr27: Uint16Array = new Uint16Array(1);
        arr27[0] = 65536;
        let result: boolean = arr27[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16UpperOverflow_0027 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_NEGATIVE_CONVERSION_0028
     * @tc.name      test_TypedArray_Uint16NegativeConversion_0028
     * @tc.desc      Test negative conversion of Uint16Array (-2 → 65534)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16NegativeConversion_0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16NegativeConversion_0028 start');
        const arr28: Uint16Array = new Uint16Array(1);
        arr28[0] = -2;
        let result: boolean = arr28[0] === 65534;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16NegativeConversion_0028 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_UPPER_OVERFLOW_0029
     * @tc.name      test_TypedArray_Int32UpperOverflow_0029
     * @tc.desc      Test upper bound overflow of Int32Array (2147483648 → -2147483648)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32UpperOverflow_0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32UpperOverflow_0029 start');
        const arr29: Int32Array = new Int32Array(1);
        arr29[0] = 2147483648;
        let result: boolean = arr29[0] === -2147483648;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32UpperOverflow_0029 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_LOWER_OVERFLOW_0030
     * @tc.name      test_TypedArray_Int32LowerOverflow_0030
     * @tc.desc      Test lower bound overflow of Int32Array (-2147483649 → 2147483647)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32LowerOverflow_0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32LowerOverflow_0030 start');
        const arr30: Int32Array = new Int32Array(1);
        arr30[0] = -2147483649;
        let result: boolean = arr30[0] === 2147483647;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32LowerOverflow_0030 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_UPPER_OVERFLOW_0031
     * @tc.name      test_TypedArray_Uint32UpperOverflow_0031
     * @tc.desc      Test upper bound overflow of Uint32Array (4294967296 → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32UpperOverflow_0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32UpperOverflow_0031 start');
        const arr31: Uint32Array = new Uint32Array(1);
        arr31[0] = 4294967296;
        let result: boolean = arr31[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32UpperOverflow_0031 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_NEGATIVE_CONVERSION_0032
     * @tc.name      test_TypedArray_Uint32NegativeConversion_0032
     * @tc.desc      Test negative conversion of Uint32Array (-5 → 4294967291)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32NegativeConversion_0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32NegativeConversion_0032 start');
        const arr32: Uint32Array = new Uint32Array(1);
        arr32[0] = -5;
        let result: boolean = arr32[0] === 4294967291;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32NegativeConversion_0032 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_FLOAT_TRUNCATION_0033
     * @tc.name      test_TypedArray_Int8FloatTruncation_0033
     * @tc.desc      Test float truncation of Int8Array (3.9 → 3)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8FloatTruncation_0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8FloatTruncation_0033 start');
        const arr33: Int8Array = new Int8Array(1);
        arr33[0] = 3.9;
        let result: boolean = arr33[0] === 3;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8FloatTruncation_0033 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_FLOAT_TRUNCATION_0034
     * @tc.name      test_TypedArray_Uint16FloatTruncation_0034
     * @tc.desc      Test float truncation of Uint16Array (123.5 → 123)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16FloatTruncation_0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16FloatTruncation_0034 start');
        const arr34: Uint16Array = new Uint16Array(1);
        arr34[0] = 123.5;
        let result: boolean = arr34[0] === 123;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16FloatTruncation_0034 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_FLOAT_TRUNCATION_0035
     * @tc.name      test_TypedArray_Int32FloatTruncation_0035
     * @tc.desc      Test float truncation of Int32Array (-456.9 → -456)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32FloatTruncation_0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32FloatTruncation_0035 start');
        const arr35: Int32Array = new Int32Array(1);
        arr35[0] = -456.9;
        let result: boolean = arr35[0] === -456;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32FloatTruncation_0035 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_NAN_CONVERSION_0036
     * @tc.name      test_TypedArray_Int8NanConversion_0036
     * @tc.desc      Test NaN conversion of Int8Array (NaN → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8NanConversion_0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8NanConversion_0036 start');
        const arr36: Int8Array = new Int8Array(1);
        arr36[0] = NaN;
        let result: boolean = arr36[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8NanConversion_0036 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_NAN_CONVERSION_0037
     * @tc.name      test_TypedArray_Uint32NanConversion_0037
     * @tc.desc      Test NaN conversion of Uint32Array (NaN → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32NanConversion_0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32NanConversion_0037 start');
        const arr37: Uint32Array = new Uint32Array(1);
        arr37[0] = NaN;
        let result: boolean = arr37[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32NanConversion_0037 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_INFINITY_CONVERSION_0038
     * @tc.name      test_TypedArray_Int16InfinityConversion_0038
     * @tc.desc      Test Infinity conversion of Int16Array (Infinity → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16InfinityConversion_0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16InfinityConversion_0038 start');
        const arr38: Int16Array = new Int16Array(1);
        arr38[0] = Infinity;
        let result: boolean = arr38[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16InfinityConversion_0038 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_NEGATIVE_INFINITY_CONVERSION_0039
     * @tc.name      test_TypedArray_Uint8NegativeInfinityConversion_0039
     * @tc.desc      Test -Infinity conversion of Uint8Array (-Infinity → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8NegativeInfinityConversion_0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8NegativeInfinityConversion_0039 start');
        const arr39: Uint8Array = new Uint8Array(1);
        arr39[0] = -Infinity;
        let result: boolean = arr39[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8NegativeInfinityConversion_0039 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_STRING_NUMBER_CONVERSION_0040
     * @tc.name      test_TypedArray_Float32StringNumberConversion_0040
     * @tc.desc      Test string number conversion of Float32Array ("3.14" → 3.14)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32StringNumberConversion_0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32StringNumberConversion_0040 start');
        const arr40: Float32Array = new Float32Array(1);
        arr40[0] = parseFloat("3.14");
        let result: boolean = arr40[0].toFixed(2) === '3.14';
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32StringNumberConversion_0040 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_STRING_INTEGER_CONVERSION_0041
     * @tc.name      test_TypedArray_Int32StringIntegerConversion_0041
     * @tc.desc      Test string integer conversion of Int32Array ("1234" → 1234)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32StringIntegerConversion_0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32StringIntegerConversion_0041 start');
        const arr41: Int32Array = new Int32Array(1);
        arr41[0] = Number("1234");
        let result: boolean = arr41[0] === 1234;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32StringIntegerConversion_0041 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_INVALID_STRING_CONVERSION_0042
     * @tc.name      test_TypedArray_Uint16InvalidStringConversion_0042
     * @tc.desc      Test invalid string conversion of Uint16Array ("abc" → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16InvalidStringConversion_0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16InvalidStringConversion_0042 start');
        const arr42: Uint16Array = new Uint16Array(1);
        arr42[0] = Number("abc");
        let result: boolean = arr42[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16InvalidStringConversion_0042 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_BOOLEAN_TRUE_CONVERSION_0043
     * @tc.name      test_TypedArray_Int8BooleanTrueConversion_0043
     * @tc.desc      Test boolean true conversion of Int8Array (true → 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8BooleanTrueConversion_0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8BooleanTrueConversion_0043 start');
        const arr43: Int8Array = new Int8Array(1);
        arr43[0] = Number(true);
        let result: boolean = arr43[0] === 1;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8BooleanTrueConversion_0043 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT32_BOOLEAN_FALSE_CONVERSION_0044
     * @tc.name      test_TypedArray_Uint32BooleanFalseConversion_0044
     * @tc.desc      Test boolean false conversion of Uint32Array (false → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint32BooleanFalseConversion_0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint32BooleanFalseConversion_0044 start');
        const arr44: Uint32Array = new Uint32Array(1);
        arr44[0] = Number(false);
        let result: boolean = arr44[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint32BooleanFalseConversion_0044 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT64_NULL_CONVERSION_0045
     * @tc.name      test_TypedArray_Float64NullConversion_0045
     * @tc.desc      Test null conversion of Float64Array (null → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float64NullConversion_0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float64NullConversion_0045 start');
        const arr45: Float64Array = new Float64Array(1);
        arr45[0] = Number(null);
        let result: boolean = arr45[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float64NullConversion_0045 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT16_UNDEFINED_CONVERSION_0046
     * @tc.name      test_TypedArray_Int16UndefinedConversion_0046
     * @tc.desc      Test undefined conversion of Int16Array (undefined → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int16UndefinedConversion_0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int16UndefinedConversion_0046 start');
        const arr46: Int16Array = new Int16Array(1);
        arr46[0] = Number(undefined);
        let result: boolean = arr46[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int16UndefinedConversion_0046 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_OBJECT_CONVERSION_0047
     * @tc.name      test_TypedArray_Uint8ObjectConversion_0047
     * @tc.desc      Test object conversion of Uint8Array (object → 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8ObjectConversion_0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8ObjectConversion_0047 start');
        const arr47: Uint8Array = new Uint8Array(1);
        arr47[0] = Number({ value: 5 });
        let result: boolean = arr47[0] === 0;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8ObjectConversion_0047 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_FUNCTION_CONVERSION_0048
     * @tc.name      test_TypedArray_Float32FunctionConversion_0048
     * @tc.desc      Test function conversion of Float32Array (function → NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32FunctionConversion_0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32FunctionConversion_0048 start');
        const arr48: Float32Array = new Float32Array(1);
        arr48[0] = Number(() => 10);
        let result: boolean = isNaN(arr48[0]);
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32FunctionConversion_0048 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_DATE_CONVERSION_0049
     * @tc.name      test_TypedArray_Int32DateConversion_0049
     * @tc.desc      Test date conversion of Int32Array (Date → timestamp)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32DateConversion_0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32DateConversion_0049 start');
        const arr49: Int32Array = new Int32Array(1);
        const date = new Date(2023, 0, 1);
        arr49[0] = date.getTime();
        let result: boolean = arr49[0] === 1760121856;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32DateConversion_0049 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT64_LARGE_INTEGER_CONVERSION_0050
     * @tc.name      test_TypedArray_Float64LargeIntegerConversion_0050
     * @tc.desc      Test large integer conversion of Float64Array (9007199254740991 → 9007199254740991)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float64LargeIntegerConversion_0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float64LargeIntegerConversion_0050 start');
        const arr50: Float64Array = new Float64Array(1);
        arr50[0] = 9007199254740991;
        let result: boolean = arr50[0] === 9007199254740991;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float64LargeIntegerConversion_0050 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT8_OUT_OF_BOUNDS_READ_0051
     * @tc.name      test_TypedArray_Int8OutOfBoundsRead_0051
     * @tc.desc      Test reading out-of-bounds index in Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int8OutOfBoundsRead_0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int8OutOfBoundsRead_0051 start');
        const arr51: Int8Array = new Int8Array(3);
        arr51[0] = 10;
        let result: boolean = arr51[5] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int8OutOfBoundsRead_0051 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT16_OUT_OF_BOUNDS_READ_0052
     * @tc.name      test_TypedArray_Uint16OutOfBoundsRead_0052
     * @tc.desc      Test reading out-of-bounds index in Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint16OutOfBoundsRead_0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint16OutOfBoundsRead_0052 start');
        const arr52: Uint16Array = new Uint16Array(2);
        arr52[1] = 200;
        let result: boolean = arr52[3] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint16OutOfBoundsRead_0052 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_FLOAT32_OUT_OF_BOUNDS_READ_0053
     * @tc.name      test_TypedArray_Float32OutOfBoundsRead_0053
     * @tc.desc      Test reading out-of-bounds index in Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Float32OutOfBoundsRead_0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Float32OutOfBoundsRead_0053 start');
        const arr53: Float32Array = new Float32Array(4);
        arr53[2] = 3.14;
        let result: boolean = arr53[10] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Float32OutOfBoundsRead_0053 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_INT32_OUT_OF_BOUNDS_WRITE_0054
     * @tc.name      test_TypedArray_Int32OutOfBoundsWrite_0054
     * @tc.desc      Test writing out-of-bounds index in Int32Array (no effect)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Int32OutOfBoundsWrite_0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Int32OutOfBoundsWrite_0054 start');
        const arr54: Int32Array = new Int32Array(2);
        arr54[0] = 100;
        arr54[5] = 200;
        let result: boolean = arr54.length === 2 && arr54[5] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Int32OutOfBoundsWrite_0054 end');
      });

    /**
     * @tc.number    SUB_TYPEDARRAY_UINT8_OUT_OF_BOUNDS_WRITE_0055
     * @tc.name      test_TypedArray_Uint8OutOfBoundsWrite_0055
     * @tc.desc      Test writing out-of-bounds index in Uint8Array (no effect)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it("test_TypedArray_Uint8OutOfBoundsWrite_0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.log('test_TypedArray_Uint8OutOfBoundsWrite_0055 start');
        const arr55: Uint8Array = new Uint8Array(3);
        arr55[2] = 255;
        arr55[10] = 100;
        let result: boolean = arr55.length === 3 && arr55[10] === undefined;
        expect(result).assertTrue();

        done();
        console.log('test_TypedArray_Uint8OutOfBoundsWrite_0055 end');
      });
  })
}