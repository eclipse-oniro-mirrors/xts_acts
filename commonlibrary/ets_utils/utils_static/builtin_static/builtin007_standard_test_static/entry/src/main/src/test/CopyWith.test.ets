/**
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function CopyWithTest() {
  describe("CopyWithTest", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_5800
     * @tc.name    testBuiltinArrayEvery0808
     * @tc.desc    Test every() with single element array (true case)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0808', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0808";
      try {
        let arr: FixedArray<short> = [5];
        let result = every(arr, (value) => value > 0);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_5900
     * @tc.name    testBuiltinArrayEvery0809
     * @tc.desc    Test every() with single element array (false case)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0809', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0809";
      try {
        let arr: FixedArray<short> = [0];
        let result = every(arr, (value) => value !== 0);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_6000
     * @tc.name    testBuiltinArrayEvery0810
     * @tc.desc    Test every() with negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0810";
      try {
        let arr: FixedArray<short> = [-5, -3, -1, -7];
        let result = every(arr, (value) => value < 0);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_6100
     * @tc.name    testBuiltinArrayEvery0811
     * @tc.desc    Test every() with mixed positive and negative numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0811', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0811";
      try {
        let arr: FixedArray<short> = [-2, 4, -6, 8];
        let result = every(arr, (value) => Math.abs(value) % 2 === 0);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_6200
     * @tc.name    testBuiltinArrayEvery0812
     * @tc.desc    Test every() with large numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0812', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0812";
      try {
        let arr: FixedArray<short> = [32767, 10000, 20000];
        let result = every(arr, (value) => value > 9999);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_6300
     * @tc.name    testBuiltinArrayEvery0813
     * @tc.desc    Test every() with first element failing
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0813', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0813";
      try {
        let arr: FixedArray<short> = [1, 2, 3, 4];
        let result = every(arr, (value) => value > 1);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_6400
     * @tc.name    testBuiltinArrayEvery0814
     * @tc.desc    Test every() with last element failing
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0814', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0814";
      try {
        let arr: FixedArray<short> = [10, 20, 30, 5];
        let result = every(arr, (value) => value >= 10);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_6500_02
     * @tc.name    testBuiltinArrayEvery0815
     * @tc.desc    Test every() with index-based calculation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0815', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0815";
      try {
        let arr: FixedArray<short> = [0, 2, 4, 6];
        let result = every(arr, (value, index) => value === index * 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_6500_01
     * @tc.name    testBuiltinArrayEvery0815_01
     * @tc.desc    Test every() with index-based calculation
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayEvery0815_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0815_01";
      try {
        let arr: FixedArray<short> = [0, 2, 4, 6];
        let result = every(arr, (value, index) => value === index * 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0100_03
     * @tc.name    testBuiltinArraycopyWithin0017
     * @tc.desc    Testing basic copyWithin functionality with positive target
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArraycopyWithin0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0017";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = copyWithin(arr, 2);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(1);
        expect(result[3]).assertEqual(2);
        expect(result[4]).assertEqual(3);
        expect(arr === result).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0100_04
     * @tc.name    testCopyWithin0032BasicFunction_02
     * @tc.desc    Testing basic functionality of copyWithin method
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0032BasicFunction_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithin0032BasicFunction_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_02
     * @tc.name    testCopyWithinFullRange_1
     * @tc.desc    Test copying the full range of array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinFullRange_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullRange_1";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_030
     * @tc.name    testCopyWithinMiddleToStart_02
     * @tc.desc    Test copying middle elements to start
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinMiddleToStart_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinMiddleToStart_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0900_02
     * @tc.name    testCopyWithinTargetOutOfBounds_02
     * @tc.desc    Test copying with target index out of bounds
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinTargetOutOfBounds_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetOutOfBounds_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 10, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1000_02
     * @tc.name    testCopyWithinEmptyRange_02
     * @tc.desc    Test copying with empty range (start equals end)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinEmptyRange_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEmptyRange_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_03
     * @tc.name    testCopyWithinFromEnd0019
     * @tc.desc    Testing copyWithin by copying elements from the end of the array to the beginning
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinFromEnd0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFromEnd0019";
      try {
        let originalArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
        let expectedResult: FixedArray<float> = [4.4f, 5.5f, 3.3f, 4.4f, 5.5f];
        let result = copyWithin(originalArray, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
        expect(originalArray).assertEqual(result);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_101
     * @tc.name    testCopyWithinBasicForwardCopy
     * @tc.desc    Test forward copy (target < start)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinBasicForwardCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinBasicForwardCopy";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_102
     * @tc.name    testCopyWithinBasicBackwardCopy
     * @tc.desc    Test backward copy (target > start)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinBasicBackwardCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinBasicBackwardCopy";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0103_01
     * @tc.name    testCopyWithinNegativeIndices
     * @tc.desc    Test negative indices (counting from end)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinNegativeIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeIndices";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, -2, 1, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0104_01
     * @tc.name    testCopyWithinFullArrayCopy
     * @tc.desc    Test copying entire array to beginning
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinFullArrayCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullArrayCopy";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0105_01
     * @tc.name    testCopyWithinSingleElementCopy_01
     * @tc.desc    Test copying single element
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinSingleElementCopy_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSingleElementCopy_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 2, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 1, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_106
     * @tc.name    testCopyWithinTargetBeyondLength_01
     * @tc.desc    Test when target is beyond array length (no copy)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinTargetBeyondLength_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetBeyondLength_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 5, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0107_1
     * @tc.name    testCopyWithinStartBeyondEnd
     * @tc.desc    Test when start is beyond end (no copy)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinStartBeyondEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinStartBeyondEnd";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_108
     * @tc.name    testCopyWithinEmptyRange_03
     * @tc.desc    Test when start equals end (no copy)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinEmptyRange_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEmptyRange_03";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0109_01
     * @tc.name    testCopyWithinPartialOverlap
     * @tc.desc    Test with partially overlapping ranges
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinPartialOverlap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinPartialOverlap";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0110_01
     * @tc.name    testCopyWithinSamePosition_01
     * @tc.desc    Test copying to same position
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinSamePosition_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSamePosition_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0111_01
     * @tc.name    testCopyWithinLargeRange_01
     * @tc.desc    Test copying with range larger than remaining space
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinLargeRange_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinLargeRange_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 10);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0112
     * @tc.name    testCopyWithinFloatValues
     * @tc.desc    Test with float values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinFloatValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFloatValues";
      try {
        const originalArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
        const expectedResult: FixedArray<float> = [1.1f, 2.2f, 1.1f, 2.2f, 3.3f];
        const result = copyWithin(originalArray, 2, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0113
     * @tc.name    testCopyWithinEdgeCases
     * @tc.desc    Test edge cases (first and last elements)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinEdgeCases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEdgeCases";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [5, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 4, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0115
     * @tc.name    testCopyWithinZeroLengthArray
     * @tc.desc    Test with zero-length array (should do nothing)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinZeroLengthArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinZeroLengthArray";
      try {
        const originalArray: FixedArray<short> = [] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_03
     * @tc.name    testBuiltinArraycopyWithin0020
     * @tc.desc    Testing copyWithin with specified start and end positions
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArraycopyWithin0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0020";
      try {
        let originalArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
        let expectedResult: FixedArray<float> = [4.4f, 5.5f, 3.3f, 4.4f, 5.5f];
        let result = copyWithin(originalArray, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
        expect(originalArray).assertEqual(result);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_4
     * @tc.name    testCopyWithinNegativeIndex_01
     * @tc.desc    Testing copyWithin with negative target position
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinNegativeIndex_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeIndex_01";
      try {
        let originalArray: FixedArray<float> = [1.1f, 2.2f, 3.3f, 4.4f, 5.5f];
        let expectedResult: FixedArray<float> = [1.1f, 2.2f, 3.3f, 1.1f, 2.2f];
        let result = copyWithin(originalArray, -2, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0100_05
     * @tc.name    testCopyWithin0032BasicFunction_03
     * @tc.desc    Testing basic functionality of copyWithin method
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithin0032BasicFunction_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithin0032BasicFunction_03";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_04
     * @tc.name    testCopyWithinCopyToMiddle
     * @tc.desc    Testing copying elements to middle of array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinCopyToMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinCopyToMiddle";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 3, 4, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 1, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_3
     * @tc.name    testCopyWithinCopyToEnd
     * @tc.desc    Testing copying elements to end of array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinCopyToEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinCopyToEnd";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_04
     * @tc.name    testCopyWithinNegativeTarget
     * @tc.desc    Testing negative target index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinNegativeTarget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeTarget";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2] as FixedArray<short>;
        const result = copyWithin(originalArray, -2, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_01
     * @tc.name    testCopyWithinNegativeStart_01
     * @tc.desc    Testing negative start index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinNegativeStart_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeStart_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 5, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, -2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0700_02
     * @tc.name    testCopyWithinTargetGreaterThanLength
     * @tc.desc    Testing when target is greater than array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinTargetGreaterThanLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetGreaterThanLength";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 10, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0800_02
     * @tc.name    testCopyWithinStartGreaterThanEnd
     * @tc.desc    Testing when start is greater than end
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinStartGreaterThanEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinStartGreaterThanEnd";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0900_03
     * @tc.name    testCopyWithinEmptyRange_04
     * @tc.desc    Testing with empty range (start equals end)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinEmptyRange_04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEmptyRange_04";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1000_03
     * @tc.name    testCopyWithinOverlappingRanges
     * @tc.desc    Testing with overlapping source and target ranges
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinOverlappingRanges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverlappingRanges";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 1, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1100_02
     * @tc.name    testCopyWithinFullArrayCopy_01
     * @tc.desc    Testing copying entire array to start
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinFullArrayCopy_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullArrayCopy_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1200_02
     * @tc.name    testCopyWithinCopySingleElement
     * @tc.desc    Testing copying single element
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinCopySingleElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinCopySingleElement";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 2, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 1, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1300_02
     * @tc.name    testCopyWithinTargetAtStart
     * @tc.desc    Testing with target at start of array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinTargetAtStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetAtStart";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 5, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1400_02
     * @tc.name    testCopyWithinTargetAtEnd
     * @tc.desc    Testing with target at end of array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinTargetAtEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetAtEnd";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1500_02
     * @tc.name    testCopyWithinLargeArray
     * @tc.desc    Testing with larger array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinLargeArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinLargeArray";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 1, 2, 3, 4, 9, 10] as FixedArray<short>;
        const result = copyWithin(originalArray, 4, 0, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(10);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_401
     * @tc.name    testCopyWithinOverlappingRange0021
     * @tc.desc    Testing copyWithin with overlapping source and target ranges
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinOverlappingRange0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverlappingRange0021";
      try {
        let originalArray: FixedArray<int> = [1, 2, 3, 4, 5, 6];
        let expectedResult: FixedArray<int> = [1, 2, 1, 2, 3, 4];
        let result = copyWithin(originalArray, 2, 0, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(6);
        expect(originalArray).assertEqual(result);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_05
     * @tc.name    testCopyWithinFullArray
     * @tc.desc    Copy entire array to target index 2
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinFullArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullArray";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_7
     * @tc.name    testCopyWithinToStart
     * @tc.desc    Copy elements from index 3 to 4 to the beginning
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinToStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinToStart";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1300_03
     * @tc.name    testCopyWithinFullOverwrite
     * @tc.desc    Fully overwrite beginning of array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinFullOverwrite', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullOverwrite";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1400_03
     * @tc.name    testCopyWithinSingleToEnd
     * @tc.desc    Copy single element to the end
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinSingleToEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSingleToEnd";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 4] as FixedArray<short>;
        const result = copyWithin(originalArray, -1, -2, -1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1500_03
     * @tc.name    testCopyWithinMiddleNoFullOverwrite
     * @tc.desc    Copy to middle without full overwrite
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinMiddleNoFullOverwrite', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinMiddleNoFullOverwrite";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1600_02
     * @tc.name    testCopyWithinEntireArray
     * @tc.desc    Copy and overwrite entire array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinEntireArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEntireArray";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_05
     * @tc.name    testCopyWithinSingleElement
     * @tc.desc    Copy single element (index 1) to index 3
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinSingleElement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSingleElement";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 2, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 1, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_02
     * @tc.name    testCopyWithinToEnd
     * @tc.desc    Copy elements to the end (truncates if exceeds)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinToEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinToEnd";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2] as FixedArray<short>;
        const result = copyWithin(originalArray, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_02
     * @tc.name    testCopyWithinNegativeStart
     * @tc.desc    Copy from negative start index (-2)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinNegativeStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeStart";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 4] as FixedArray<short>;
        const result = copyWithin(originalArray, -1, -2, -1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0700_03
     * @tc.name    testCopyWithinEmptyRange_05
     * @tc.desc    No copy if start equals end
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinEmptyRange_05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEmptyRange_05";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0800_03
     * @tc.name    testCopyWithinTargetOutOfBounds_03
     * @tc.desc    No copy if target >= array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinTargetOutOfBounds_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetOutOfBounds_03";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0900_04
     * @tc.name    testCopyWithinRangeExceedsLength
     * @tc.desc    Copy range truncated if exceeds array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinRangeExceedsLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinRangeExceedsLength";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 10);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1000_04
     * @tc.name    testCopyWithinNegativeTarget_01
     * @tc.desc    Target index as negative (-3)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinNegativeTarget_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeTarget_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, -3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1100_03
     * @tc.name    testCopyWithinOverlapping
     * @tc.desc    Copy and overwrite overlapping region
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinOverlapping', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverlapping";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1200_03
     * @tc.name    testCopyWithinMiddlePartial
     * @tc.desc    Copy to middle with partial overlap
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinMiddlePartial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinMiddlePartial";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0401_02
     * @tc.name    testCopyWithinWithOverlappingRegions0023
     * @tc.desc    Testing copyWithin with overlapping source and target regions
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinWithOverlappingRegions0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinWithOverlappingRegions0023";
      try {
        let originalArray: FixedArray<int> = [10, 20, 30, 40, 50, 60];
        let expectedResult: FixedArray<int> = [10, 20, 10, 20, 30, 40];
        let result = copyWithin(originalArray, 2, 0, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(6);
        expect(originalArray).assertEqual(result);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_06
     * @tc.name    testCopyWithinBasicFunction2
     * @tc.desc    Testing copyWithin with full range copy
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinBasicFunction2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinBasicFunction2";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_06
     * @tc.name    testCopyWithinOverlappingR
     * @tc.desc    Testing copyWithin with overlapping ranges
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinOverlappingR', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverlappingR";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 1, 2, 3, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 1, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_03
     * @tc.name    testCopyWithinSamePosition
     * @tc.desc    Testing copyWithin with same target and start positions
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinSamePosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSamePosition";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_03
     * @tc.name    testCopyWithinNegativeStartEnd
     * @tc.desc    Testing copyWithin with negative start and end indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinNegativeStartEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeStartEnd";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, -3, -1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0700_04
     * @tc.name    testCopyWithinTargetBeyondLength_02
     * @tc.desc    Testing copyWithin with target beyond array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinTargetBeyondLength_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetBeyondLength_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 10, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1500_04
     * @tc.name    testCopyWithinEndLessThanStart
     * @tc.desc    Testing when end index is less than start index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinEndLessThanStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEndLessThanStart";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1600
     * @tc.name    testCopyWithinPartialOverwrite_01
     * @tc.desc    Testing partial overwrite during copy
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinPartialOverwrite_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinPartialOverwrite_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5, 6, 7, 8] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2, 6, 7, 8] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(8);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1800_02
     * @tc.name    testCopyWithinSameArrayReference
     * @tc.desc    Verify returned array is same reference
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinSameArrayReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSameArrayReference";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 4);
        expect(result === originalArray).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1900
     * @tc.name    testCopyWithinCircularCopy1
     * @tc.desc    Testing circular copy behavior
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinCircularCopy1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinCircularCopy1";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5, 6] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 1, 2] as FixedArray<short>;
        let result = copyWithin(originalArray, 2, 0, 2);
        result = copyWithin(result, 4, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_2000
     * @tc.name    testCopyWithinExtremeNegativeIndices
     * @tc.desc    Testing with extreme negative indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinExtremeNegativeIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinExtremeNegativeIndices";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, -100, -100, -50);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_2100
     * @tc.name    testCopyWithinSingleElementCopy_02
     * @tc.desc    Testing single element copy
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinSingleElementCopy_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSingleElementCopy_02";
      try {
        const originalArray: FixedArray<short> = [10, 20, 30, 40, 50] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [10, 20, 30, 30, 50] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 2, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_2200
     * @tc.name    testCopyWithinModifiedDuringCopy
     * @tc.desc    Testing array modification during copy
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinModifiedDuringCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinModifiedDuringCopy";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 2);
        result[3] = 2;
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_2300
     * @tc.name    testCopyWithinAllNegativeIndices_01
     * @tc.desc    Testing with all negative indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinAllNegativeIndices_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinAllNegativeIndices_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 4, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, -4, -2, -1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_2400
     * @tc.name    testCopyWithinNonSequentialCopy
     * @tc.desc    Testing non-sequential element copy
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinNonSequentialCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNonSequentialCopy";
      try {
        const originalArray: FixedArray<short> = [1, 0, 0, 0, 5, 0, 0, 8] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 0, 1, 0, 5, 0, 5, 8] as FixedArray<short>;
        let result = copyWithin(originalArray, 2, 0, 1);
        result = copyWithin(result, 6, 4, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_2500
     * @tc.name    testCopyWithinTypedArrayCompatibility
     * @tc.desc    Testing compatibility with TypedArray behavior
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinTypedArrayCompatibility', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTypedArrayCompatibility";
      try {
        const originalArray: FixedArray<short> = [100, 200, 300, 400, 500] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [100, 400, 300, 400, 500] as FixedArray<short>;
        const result = copyWithin(originalArray, 1, 3, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_1000_5
     * @tc.name    testCopyWithinEmptyRange_06
     * @tc.desc    Testing copyWithin with empty range (start equals end)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinEmptyRange_06', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEmptyRange_06";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0100_06
     * @tc.name    testBuiltinArraycopyWithin0024
     * @tc.desc    Testing basic copyWithin functionality with fixed array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArraycopyWithin0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0024";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 0, 3, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([4, 5, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0101
     * @tc.name    testCopyWithinBasicCase1
     * @tc.desc    Test copyWithin with target 0, start 1, end 3
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinBasicCase1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinBasicCase1";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 0, 1, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0102
     * @tc.name    testCopyWithinBasicCase2
     * @tc.desc    Test copyWithin with target 1, start 0, end 2
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testCopyWithinBasicCase2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinBasicCase2";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 1, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 1, 2, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0103_02
     * @tc.name      testCopyWithinBasicCase3
     * @tc.desc      Test copyWithin with target 2, start 0, end 4
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinBasicCase3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinBasicCase3";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 2, 0, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 1, 2, 3]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0104
     * @tc.name      testCopyWithinNegativeStart_00
     * @tc.desc      Test copyWithin with negative start index
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinNegativeStart_00', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeStart_00";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 0, -2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([4, 5, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0105_02
     * @tc.name      testCopyWithinFullCopy_01
     * @tc.desc      Test copying entire array to start
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinFullCopy_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullCopy_01";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 0, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0106
     * @tc.name      testCopyWithinOverlappingRegions_01
     * @tc.desc      Test with overlapping source and target regions
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinOverlappingRegions_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverlappingRegions_01";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 1, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 1, 2, 3, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0107
     * @tc.name      testCopyWithinZeroLengthCopy
     * @tc.desc      Test with start equals end (zero elements to copy)
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinZeroLengthCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinZeroLengthCopy";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 0, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0108
     * @tc.name      testCopyWithinTargetBeyondLength_03
     * @tc.desc      Test with target beyond array length
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinTargetBeyondLength_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetBeyondLength_03";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 6, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0109
     * @tc.name      testCopyWithinAllNegativeIndices
     * @tc.desc      Test with all negative indices
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinAllNegativeIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinAllNegativeIndices";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, -3, -2, -1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 4, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0110_02
     * @tc.name      testCopyWithinSingleElementCopy_03
     * @tc.desc      Test copying single element
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinSingleElementCopy_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSingleElementCopy_03";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 0, 3, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([4, 2, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0111_02
     * @tc.name      testCopyWithinTargetEqualsStart
     * @tc.desc      Test when target equals start position
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCopyWithinTargetEqualsStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetEqualsStart";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 2, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0118
     * @tc.name   testCopyWithinSameTargetAndSource
     * @tc.desc   Test when target equals source start position
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinSameTargetAndSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSameTargetAndSource";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 1, 1, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0119
     * @tc.name   testCopyWithinExtremeNegativeIndices1
     * @tc.desc   Test with extreme negative indices (beyond array length)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinExtremeNegativeIndices1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinExtremeNegativeIndices1";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, -10, -20, -15);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0121
     * @tc.name   testCopyWithinChainCalls
     * @tc.desc   Test chaining multiple copyWithin calls
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinChainCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinChainCalls";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(copyWithin(arr, 0, 1, 3), 3, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, 3, 3, 2, 3]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0125
     * @tc.name   testCopyWithinCircularCopy
     * @tc.desc   Test circular copy behavior
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinCircularCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinCircularCopy";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5, 6, 7, 8] as FixedArray<int>;
        let result = copyWithin(arr, 2, 0, 6);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 1, 2, 3, 4, 5, 6]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0126
     * @tc.name   testCopyWithinPartialOverwrite_02
     * @tc.desc   Test partial overwrite of original elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinPartialOverwrite_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinPartialOverwrite_02";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5, 6, 7, 8] as FixedArray<int>;
        let result = copyWithin(arr, 3, 1, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 2, 3, 4, 5, 8]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0127
     * @tc.name   testCopyWithinWithZeroElements
     * @tc.desc   Test operation on zero-value elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinWithZeroElements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinWithZeroElements";
      try {
        let arr: FixedArray<int> = [0, 0, 0, 0, 0] as FixedArray<int>;
        let result = copyWithin(arr, 1, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([0, 0, 0, 0, 0]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0128
     * @tc.name   testCopyWithinMaxValueElements
     * @tc.desc   Test with max int32 values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinMaxValueElements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinMaxValueElements";
      try {
        const maxInt = 2147483647;
        let arr: FixedArray<int> = [maxInt, maxInt - 1, maxInt - 2, maxInt - 3] as FixedArray<int>;
        let result = copyWithin(arr, 0, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([maxInt - 2, maxInt - 3, maxInt - 2, maxInt - 3]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0129
     * @tc.name   testCopyWithinMinValueElements
     * @tc.desc   Test with min int32 values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinMinValueElements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinMinValueElements";
      try {
        const minInt = -2147483648;
        let arr: FixedArray<int> = [minInt, minInt + 1, minInt + 2, minInt + 3] as FixedArray<int>;
        let result = copyWithin(arr, 1, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([minInt, minInt, minInt + 1, minInt + 3]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0130
     * @tc.name   testCopyWithinMixedSignValues
     * @tc.desc   Test with mixed positive/negative values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinMixedSignValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinMixedSignValues";
      try {
        let arr: FixedArray<int> = [-1, 2, -3, 4, -5] as FixedArray<int>;
        let result = copyWithin(arr, 0, 1, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([2, -3, 4, 4, -5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_07
     * @tc.name   testCopyWithinEdgeCase100
     * @tc.desc   Test copyWithin with target equals array length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinEdgeCase100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEdgeCase100";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = copyWithin(arr, 5, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0401_03
     * @tc.name   testCopyWithinWithNegativeTarget0025
     * @tc.desc   Testing copyWithin with a negative target index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinWithNegativeTarget0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinWithNegativeTarget0025";
      try {
        let originalArray: FixedArray<long> = [10, 20, 30, 40, 50];
        let expectedResult: FixedArray<long> = [10, 20, 30, 10, 20];
        let result = copyWithin(originalArray, -2, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
        expect(originalArray).assertEqual(result);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0401_04
     * @tc.name   testCopyWithinFromMiddleToEnd0026
     * @tc.desc   Testing copyWithin by copying elements from the middle of the array to the end
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinFromMiddleToEnd0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFromMiddleToEnd0026";
      try {
        let originalArray: FixedArray<number> = [10, 20, 30, 40, 50, 60];
        let expectedResult: FixedArray<number> = [10, 20, 30, 10, 20, 30];
        let result = copyWithin(originalArray, 3, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(6);
        expect(originalArray).assertEqual(result);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0401_05
     * @tc.name   testCopyWithinFromMiddleToEnd0027
     * @tc.desc   Testing copyWithin by copying elements from the middle of the array to the end
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinFromMiddleToEnd0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFromMiddleToEnd0027";
      try {
        let originalArray: FixedArray<int> = [10, 20, 30, 40, 50, 60];
        let expectedResult: FixedArray<int> = [10, 20, 30, 40, 10, 20];
        let result = copyWithin(originalArray, 4, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(6);
        expect(originalArray).assertEqual(result);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0100_07
     * @tc.name   testBuiltinArraycopyWithin0028
     * @tc.desc   Testing basic copyWithin operation within array bounds
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyWithin0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0028";
      try {
        const arr: FixedArray<long> = [1, 2, 3, 4, 5] as FixedArray<long>;
        const result = copyWithin(arr, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([4, 5, 3, 4, 5]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_08
     * @tc.name   testBuiltinArraycopyWithin0028NegativeIndex
     * @tc.desc   Testing copyWithin with negative indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyWithin0028NegativeIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0028NegativeIndex";
      try {
        const arr: FixedArray<long> = [1, 2, 3, 4, 5] as FixedArray<long>;
        const result = copyWithin(arr, -3, -2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 4, 5, 5]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_8
     * @tc.name   testBuiltinArraycopyWithin0028SpecifiedRange
     * @tc.desc   Testing copyWithin with specified start and end parameters
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyWithin0028SpecifiedRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0028SpecifiedRange";
      try {
        const arr: FixedArray<long> = [1, 2, 3, 4, 5, 6, 7] as FixedArray<long>;
        const result = copyWithin(arr, 0, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 4, 3, 4, 5, 6, 7]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0401
     * @tc.name   testCopyWithinWithNegativeIndices0029
     * @tc.desc   Testing copyWithin with negative indices to copy elements from the middle to the end
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinWithNegativeIndices0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinWithNegativeIndices0029";
      try {
        let originalArray: FixedArray<number> = [10, 20, 30, 40, 50, 60];
        let expectedResult: FixedArray<number> = [10, 20, 30, 40, 10, 20];
        let result = copyWithin(originalArray, -2, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(6);
        expect(originalArray).assertEqual(result);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPYWITHIN_0100
     * @tc.name   testBuiltinArraycopyWithin0030
     * @tc.desc   Test basic copyWithin operation within FixedArray<short>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyWithin0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0030";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([3, 4, 5, 4, 5]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_COPYWITHIN_0200
     * @tc.name   testBuiltinArraycopyWithin0030EdgeCase
     * @tc.desc   Test copyWithin with edge cases (negative indices)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyWithin0030EdgeCase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0030EdgeCase";
      try {
        const arr: FixedArray<short> = [10, 20, 30, 40, 50] as FixedArray<short>;
        const result = copyWithin(arr, -2, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([10, 20, 30, 10, 20]));
        console.log(`${TAG} success`);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_07
     * @tc.name   testBuiltinArraycopyWithin0031
     * @tc.desc   Testing copyWithin with overlapping source and target ranges
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArraycopyWithin0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArraycopyWithin0031";
      try {
        const arr: FixedArray<long> = [10, 20, 30, 40, 50] as FixedArray<long>;
        const result = copyWithin(arr, 2, 1, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([10, 20, 20, 30, 50]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_04
     * @tc.name   testCopyWithin0031EdgeCases
     * @tc.desc   Testing edge cases for copyWithin (empty range and full array copy)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithin0031EdgeCases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithin0031EdgeCases";
      try {
        const arr1: FixedArray<long> = [1, 2, 3] as FixedArray<long>;
        const result1 = copyWithin(arr1, 0, 1, 1);
        expect(JSON.stringify(result1)).assertEqual(JSON.stringify([1, 2, 3]));
        const arr2: FixedArray<long> = [10, 20, 30] as FixedArray<long>;
        const result2 = copyWithin(arr2, 0, 0);
        expect(JSON.stringify(result2)).assertEqual(JSON.stringify([10, 20, 30]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0100
     * @tc.name   testCopyWithin0032BasicFunction_04
     * @tc.desc   Testing basic functionality of copyWithin method
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithin0032BasicFunction_04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithin0032BasicFunction_04";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_09
     * @tc.name   testBuiltinArrayentriesFullCopy0001
     * @tc.desc   Testing full array copy within itself
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayentriesFullCopy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayentriesFullCopy0001";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_9
     * @tc.name   testCopyWithinOverwriteMiddle_01
     * @tc.desc   Testing overwriting middle elements with beginning elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinOverwriteMiddle_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverwriteMiddle_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 1, 2, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 1, 0, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_08
     * @tc.name   testCopyWithinNegativeIndex0084
     * @tc.desc   Testing negative index handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinNegativeIndex0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeIndex0084";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2] as FixedArray<short>;
        const result = copyWithin(originalArray, -2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_05
     * @tc.name   testCopyWithinPartialEndCopy
     * @tc.desc   Testing copying partial end of array to beginning
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinPartialEndCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinPartialEndCopy";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 5, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_04
     * @tc.name   testCopyWithinLargeRange
     * @tc.desc   Testing copying with range larger than array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinLargeRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinLargeRange";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 10);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_10
     * @tc.name   testBuiltinArrayentriesNegativeStart0002
     * @tc.desc   Testing copyWithin with negative start index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayentriesNegativeStart0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayentriesNegativeStart0002";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 5, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, -3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_10
     * @tc.name   testCopyWithinFullCopy_04
     * @tc.desc   Testing copyWithin to copy entire array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinFullCopy_04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullCopy_04";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_09
     * @tc.name   testCopyWithinPartialOverwrite_03
     * @tc.desc   Testing partial overwrite with copyWithin
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinPartialOverwrite_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinPartialOverwrite_03";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5, 6, 7] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2, 3, 7] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 0, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(7);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_06
     * @tc.name   testCopyWithinTargetGreaterThanStart
     * @tc.desc   Testing when target is greater than start index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinTargetGreaterThanStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinTargetGreaterThanStart";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5, 6] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 2, 3, 4] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 1, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(6);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_05
     * @tc.name   testCopyWithinOutOfBoundIndices
     * @tc.desc   Testing copyWithin with out of bound indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinOutOfBoundIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOutOfBoundIndices";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 5, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 3, 10);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_11
     * @tc.name   testBuiltinArrayentriesNegativeStart0003
     * @tc.desc   Testing copyWithin with negative start index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayentriesNegativeStart0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayentriesNegativeStart0003";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 5, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, -3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_11
     * @tc.name   testCopyWithinFullCopy_03
     * @tc.desc   Testing copyWithin to copy entire array section
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinFullCopy_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullCopy_03";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_10
     * @tc.name   testCopyWithinEndGreaterThanLength_1
     * @tc.desc   Testing copyWithin with end index greater than array length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinEndGreaterThanLength_1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEndGreaterThanLength_1";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 0, 10);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_07
     * @tc.name   testCopyWithinSameTargetAndStart_01
     * @tc.desc   Testing copyWithin with target equal to start position
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinSameTargetAndStart_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSameTargetAndStart_01";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_06
     * @tc.name   testCopyWithinOverlappingRegions_02
     * @tc.desc   Testing copyWithin with overlapping source and target regions
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinOverlappingRegions_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverlappingRegions_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 2, 3, 4] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 1, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0700
     * @tc.name   testBuiltinArrayentriesNegativeStart0004
     * @tc.desc   Testing negative start index handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayentriesNegativeStart0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayentriesNegativeStart0004";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [3, 4, 5, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, -3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_12
     * @tc.name   testCopyWithinNegativeIndex_02
     * @tc.desc   Testing negative start/end indices handling
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinNegativeIndex_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeIndex_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 3, 4] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, -3, -1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_11
     * @tc.name   testCopyWithinOverflowRange
     * @tc.desc   Testing overflow indices auto-adjustment
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinOverflowRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverflowRange";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 4] as FixedArray<short>;
        const result = copyWithin(originalArray, 4, 3, 10);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_08
     * @tc.name   testCopyWithinSelfOverwrite
     * @tc.desc   Testing overlapping source and target ranges
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinSelfOverwrite', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSelfOverwrite";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 2, 3, 4] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 1, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_07
     * @tc.name   testCopyWithinNoOp
     * @tc.desc   Testing no-operation when target exceeds length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinNoOp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNoOp";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 5, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_12
     * @tc.name   testBuiltinArrayentriesCopyToMiddle0005
     * @tc.desc   Testing copying elements to the middle of array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayentriesCopyToMiddle0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayentriesCopyToMiddle0005";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 4, 5, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 1, 3);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_13
     * @tc.name   testCopyWithinNegativeTarget_02
     * @tc.desc   Testing with negative target index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinNegativeTarget_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeTarget_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 1, 2] as FixedArray<short>;
        const result = copyWithin(originalArray, -2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400_12
     * @tc.name   testCopyWithinFullCopy_05
     * @tc.desc   Testing copying all elements to the beginning
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinFullCopy_05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinFullCopy_05";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_09
     * @tc.name   testCopyWithinPartialRange
     * @tc.desc   Testing with partial range specification
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinPartialRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinPartialRange";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5, 6, 7] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 3, 4, 5, 7] as FixedArray<short>;
        const result = copyWithin(originalArray, 3, 2, 5);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(7);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_08
     * @tc.name   testCopyWithinOverlapping1
     * @tc.desc   Testing with overlapping source and target ranges
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinOverlapping1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverlapping1";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 2, 3, 4] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 1, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0200_013
     * @tc.name   testBuiltinArrayentriesFullCopy0006
     * @tc.desc   Testing full array copy within itself
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayentriesFullCopy0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayentriesFullCopy0006";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0300_14
     * @tc.name   testCopyWithinNegativeIndex_03
     * @tc.desc   Testing copyWithin with negative start index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinNegativeIndex_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinNegativeIndex_03";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [4, 5, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 0, -2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0400
     * @tc.name   testCopyWithinOverwriteMiddle_02
     * @tc.desc   Testing overwriting middle elements
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinOverwriteMiddle_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinOverwriteMiddle_02";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 3, 4, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 1, 2, 4);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0500_10
     * @tc.name   testCopyWithinEndGreaterThanLength
     * @tc.desc   Testing when end parameter exceeds array length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinEndGreaterThanLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinEndGreaterThanLength";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 1, 2, 3] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 0, 10);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPYWITHIN_0600_09
     * @tc.name   testCopyWithinSameTargetAndStart
     * @tc.desc   Testing when target equals start position
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testCopyWithinSameTargetAndStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testCopyWithinSameTargetAndStart";
      try {
        const originalArray: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const expectedResult: FixedArray<short> = [1, 2, 3, 4, 5] as FixedArray<short>;
        const result = copyWithin(originalArray, 2, 2);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify(expectedResult));
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });
    });
}