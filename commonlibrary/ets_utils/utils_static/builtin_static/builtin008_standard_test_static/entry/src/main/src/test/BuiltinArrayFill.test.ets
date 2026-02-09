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

export default function BuiltinArrayFillTest() {
  describe("BuiltinArrayFillTest", (): void => {
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

    console.log(domain, tag, '%{public}s', 'describe start');

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_1470
     * @tc.name    testBuiltinArrayFill1307
     * @tc.desc    Test fill() with start and end indices being negative and positive respectively
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1308";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, -3, 4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(5);
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14800_1
     * @tc.name    testBuiltinArrayFill1308
     * @tc.desc    Test fill() with start and end both exceeding array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1308";
      try {
        let arr: FixedArray<number> = [1, 2, 3];
        let result = fill(arr, 9, 5, 8);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result.length).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14900_01
     * @tc.name    testBuiltinArrayFill1309
     * @tc.desc    Test fill() with negative indices exceeding array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1309";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, -10, -8);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_15000
     * @tc.name    testBuiltinArrayFill1310
     * @tc.desc    Test fill() with start and end both 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1310";
      try {
        let arr: FixedArray<number> = [1, 2, 3];
        let result = fill(arr, 9, 0, 0);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result.length).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_15100
     * @tc.name    testBuiltinArrayFill1311
     * @tc.desc    Test fill() with start greater than end after normalization
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1311";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 3, -3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_15200
     * @tc.name    testBuiltinArrayFill1312
     * @tc.desc    Test fill() with empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1312";
      try {
        let arr: FixedArray<number> = [];
        let result = fill(arr, 9, 0, 1);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_15300
     * @tc.name    testBuiltinArrayFill1313
     * @tc.desc    Test fill() entire array using negative indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1313";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, -5, 5);
        expect(result[0]).assertEqual(9);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(9);
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14000
     * @tc.name    testBuiltinArrayFill1208
     * @tc.desc    Test fill() without start and end parameters
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1208";
      try {
        let arr: FixedArray<number> = [1, 2, 3];
        let result = fill(arr, 9);
        expect(result[0]).assertEqual(9);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14100_01
     * @tc.name    testBuiltinArrayFill1209
     * @tc.desc    Test fill() with only start parameter provided
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1209";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 2);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(9);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14200_01
     * @tc.name    testBuiltinArrayFill1210
     * @tc.desc    Test fill() with negative indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1210";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, -3, -1);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14300_01
     * @tc.name    testBuiltinArrayFill1211
     * @tc.desc    Test fill() with start and end both 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1211";
      try {
        let arr: FixedArray<number> = [1, 2, 3];
        let result = fill(arr, 9, 0, 0);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_1440
     * @tc.name    testBuiltinArrayFill1212
     * @tc.desc    Test fill() with start greater than end
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1212";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 3, 1);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_1450
     * @tc.name    testBuiltinArrayFill1213
     * @tc.desc    Test fill() with empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1213";
      try {
        let arr: FixedArray<number> = [];
        let result = fill(arr, 9, 0, 1);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14600_01
     * @tc.name    testBuiltinArrayFill1214
     * @tc.desc    Test fill() with mixed positive/negative indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1214";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 1, -1);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14800
     * @tc.name    testBuiltinArrayFill1216
     * @tc.desc    Test fill() with same start and end (negative)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1216";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, -2, -2);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_14900_02
     * @tc.name    testBuiltinArrayFill1217
     * @tc.desc    Test fill() with only end parameter provided (should use default start=0)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1217";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, undefined, 3);
        expect(result[0]).assertEqual(9);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_16000
     * @tc.name    testBuiltinArrayFill1007
     * @tc.desc    Test fill() entire array without specifying start/end
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1007";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 0, arr.length);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(9);
        }
        expect(result.length).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_16100
     * @tc.name    testBuiltinArrayFill1008
     * @tc.desc    Test fill() from start index to end of array (end default)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1008";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 2, arr.length);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(9);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_16200
     * @tc.name    testBuiltinArrayFill1009
     * @tc.desc    Test fill() from start of array to end index (start default)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1009";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 0, 3);
        expect(result[0]).assertEqual(9);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_16300
     * @tc.name    testBuiltinArrayFill1010
     * @tc.desc    Test fill() with negative start index (boundary case)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1010";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, -0, arr.length);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(9);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_16400
     * @tc.name    testBuiltinArrayFill1011
     * @tc.desc    Test fill() with negative end index (boundary case)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1011";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 0, -0);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_16500
     * @tc.name    testBuiltinArrayFill1012
     * @tc.desc    Test fill() with start index equal to array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1012";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, arr.length, arr.length);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_16600
     * @tc.name    testBuiltinArrayFill1013
     * @tc.desc    Test fill() with start > end after normalization
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1013";
      try {
        let arr: FixedArray<number> = [1, 2, 3, 4, 5];
        let result = fill(arr, 9, 3, -3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_16700
     * @tc.name    testBuiltinArrayFill1014
     * @tc.desc    Test fill() with negative indices on empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill1014";
      try {
        let arr: FixedArray<number> = [];
        let result = fill(arr, 9, -1, -1);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_12000
     * @tc.name    testBuiltinArrayFill0911
     * @tc.desc    Test fill() with special floating-point values (NaN Infinity)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0911', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0911";
      try {
        let arr: FixedArray<number> = [1.5, 2.5, 3.5, 4.5];
        let result = fill(arr, NaN, 0, 2);
        let result2 = fill(arr, Infinity, 2, 4);
        expect(Number.isNaN(result[0])).assertTrue();
        expect(Number.isNaN(result[1])).assertTrue();
        expect(result2[2]).assertEqual(Infinity);
        expect(result2[3]).assertEqual(Infinity);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_12100
     * @tc.name    testBuiltinArrayFill0912
     * @tc.desc    Test fill() with same start and end indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0912', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0912";
      try {
        let arr: FixedArray<number> = [0.1, 0.2, 0.3, 0.4];
        let original = [...arr];
        let result = fill(arr, 9.9, 2, 2);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(original[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_12200
     * @tc.name    testBuiltinArrayFill0913
     * @tc.desc    Test fill() with boundary indices (start=0 end=length)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0913', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0913";
      try {
        let arr: FixedArray<number> = [1.1, 2.2, 3.3];
        let fillValue = 5.55;
        let result = fill(arr, fillValue, 0, arr.length);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(fillValue);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_12300
     * @tc.name    testBuiltinArrayFill0914
     * @tc.desc    Test fill() with negative indices that exceed array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0914', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0914";
      try {
        let arr: FixedArray<number> = [0.5, 1.5, 2.5];
        let original = [...arr];
        let result = fill(arr, 9.9, -5, -4);
        for (let i = 0; i < result.length; i++) {
          expect(result[i]).assertEqual(original[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_1240
     * @tc.name    testBuiltinArrayFill0915
     * @tc.desc    Test fill() with floating-point zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0915', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0915";
      try {
        let arr: FixedArray<number> = [-0.0, 0.0, -1.0, 1.0];
        let result = fill(arr, 0.0, 0, 2);
        expect(1/result[0]).assertEqual(Infinity);
        expect(1/result[1]).assertEqual(Infinity);
        expect(result[2]).assertEqual(-1.0);
        expect(result[3]).assertEqual(1.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_12500_01
     * @tc.name    testBuiltinArrayFill0916
     * @tc.desc    Test fill() with very large floating-point numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0916', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0916";
      try {
        let arr: FixedArray<number> = [1e-10, 2e+20, 3.14159];
        let largeValue = 1.7976931348623157e+308;
        let result = fill(arr, largeValue, 1, 3);
        expect(result[0]).assertEqual(1e-10);
        expect(result[1]).assertEqual(largeValue);
        expect(result[2]).assertEqual(largeValue);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_12600_1
     * @tc.name    testBuiltinArrayFill0917
     * @tc.desc    Test fill() with very small floating-point numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0917', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0917";
      try {
        let arr: FixedArray<number> = [0.1, 0.2, 0.3];
        let smallValue = 5e-324;
        let result = fill(arr, smallValue, 0, 2);
        expect(result[0]).assertEqual(smallValue);
        expect(result[1]).assertEqual(smallValue);
        expect(result[2]).assertEqual(0.3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_12700_01
     * @tc.name    testBuiltinArrayFill0918
     * @tc.desc    Test fill() with floating-point values and exact equality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0918', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0918";
      try {
        let arr: FixedArray<number> = [0.1 + 0.2, 0.3 - 0.1, 0.4 * 0.5];
        let fillValue = 0.3;
        let result = fill(arr, fillValue, 0, arr.length);
        for (let i = 0; i < result.length; i++) {
          expect(Math.abs(result[i] - fillValue) < Number.EPSILON).assertTrue();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11000_01
     * @tc.name    testBuiltinArrayFill0809
     * @tc.desc    Test fill() with floating-point NaN values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0809', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0809";
      try {
        let arr: FixedArray<number> = [1.1, 2.2, 3.3];
        let result = fill(arr, NaN, 1);
        expect(Number.isNaN(result[0])).assertFalse();
        expect(Number.isNaN(result[1])).assertTrue();
        expect(Number.isNaN(result[2])).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11100_01
     * @tc.name    testBuiltinArrayFill0810
     * @tc.desc    Test fill() with floating-point Infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0810";
      try {
        let arr: FixedArray<number> = [0.1, 0.2, 0.3];
        let result = fill(arr, Infinity, 0, 2);
        expect(result[0]).assertEqual(Infinity);
        expect(result[1]).assertEqual(Infinity);
        expect(result[2]).assertEqual(0.3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11200
     * @tc.name    testBuiltinArrayFill0811
     * @tc.desc    Test fill() with floating-point zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0811', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0811";
      try {
        let arr: FixedArray<number> = [-0.0, -1.0, 1.0];
        let result = fill(arr, 0.0, 0, 1);
        expect(1/result[0]).assertEqual(Infinity);
        expect(result[1]).assertEqual(-1.0);
        expect(result[2]).assertEqual(1.0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11300
     * @tc.name    testBuiltinArrayFill0812
     * @tc.desc    Test fill() with large floating-point numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0812', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0812";
      try {
        let arr: FixedArray<number> = [1e-10, 2e+20, 3.14159];
        let largeValue = 1.7976931348623157e+308;
        let result = fill(arr, largeValue, 1);
        expect(result[0]).assertEqual(1e-10);
        expect(result[1]).assertEqual(largeValue);
        expect(result[2]).assertEqual(largeValue);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11400
     * @tc.name    testBuiltinArrayFill0813
     * @tc.desc    Test fill() with small floating-point numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0813', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0813";
      try {
        let arr: FixedArray<number> = [0.1, 0.2, 0.3];
        let smallValue = 5e-324;
        let result = fill(arr, smallValue, 0, 2);
        expect(result[0]).assertEqual(smallValue);
        expect(result[1]).assertEqual(smallValue);
        expect(result[2]).assertEqual(0.3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11500
     * @tc.name    testBuiltinArrayFill0814
     * @tc.desc    Test fill() with mixed positive/negative indices
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0814', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0814";
      try {
        let arr: FixedArray<number> = [1.1, 2.2, 3.3, 4.4, 5.5];
        let result = fill(arr, 9.9, -4, 4);
        expect(result[0]).assertEqual(1.1);
        expect(result[1]).assertEqual(9.9);
        expect(result[2]).assertEqual(9.9);
        expect(result[3]).assertEqual(9.9);
        expect(result[4]).assertEqual(5.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11600
     * @tc.name    testBuiltinArrayFill0815
     * @tc.desc    Test fill() with empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0815', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0815";
      try {
        let arr: FixedArray<number> = [];
        let result = fill(arr, 9.9, 0, 1);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11700
     * @tc.name    testBuiltinArrayFill0816
     * @tc.desc    Test fill() with indices beyond array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0816', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0816";
      try {
        let arr: FixedArray<number> = [1.5, 2.5, 3.5];
        let result = fill(arr, 9.9, 5, 10);
        expect(result[0]).assertEqual(1.5);
        expect(result[1]).assertEqual(2.5);
        expect(result[2]).assertEqual(3.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11800
     * @tc.name    testBuiltinArrayFill0817
     * @tc.desc    Test fill() with negative indices beyond array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0817', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0817";
      try {
        let arr: FixedArray<number> = [0.5, 1.5, 2.5];
        let result = fill(arr, 9.9, -10, -8);
        expect(result[0]).assertEqual(0.5);
        expect(result[1]).assertEqual(1.5);
        expect(result[2]).assertEqual(2.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11900
     * @tc.name    testBuiltinArrayFill0818
     * @tc.desc    Test fill() with floating-point values and exact equality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0818', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0818";
      try {
        let arr: FixedArray<number> = [0.1 + 0.2, 0.3 - 0.1, 0.4 * 0.5];
        let fillValue = 0.3;
        let result = fill(arr, fillValue, 0, arr.length);

        for (let i = 0; i < result.length; i++) {
          expect(Math.abs(result[i] - fillValue) < Number.EPSILON).assertTrue();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_10200
     * @tc.name    testBuiltinArrayFill0709
     * @tc.desc    Test fill() with floating-point NaN values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0709', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0709";
      try {
        let arr: FixedArray<number> = [1.1, 2.2, 3.3, 4.4];
        let result = fill(arr, NaN, 1, 3);
        expect(Number.isNaN(result[0])).assertFalse();
        expect(Number.isNaN(result[1])).assertTrue();
        expect(Number.isNaN(result[2])).assertTrue();
        expect(Number.isNaN(result[3])).assertFalse();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_10300
     * @tc.name    testBuiltinArrayFill0710
     * @tc.desc    Test fill() with floating-point Infinity values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0710";
      try {
        let arr: FixedArray<number> = [0.5, 1.5, 2.5, 3.5];
        let result = fill(arr, Infinity, 0, 2);
        expect(result[0]).assertEqual(Infinity);
        expect(result[1]).assertEqual(Infinity);
        expect(result[2]).assertEqual(2.5);
        expect(result[3]).assertEqual(3.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_10400
     * @tc.name    testBuiltinArrayFill0711
     * @tc.desc    Test fill() with floating-point zero values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0711', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0711";
      try {
        let arr: FixedArray<number> = [-0.0, -1.0, 1.0, -0.0];
        let result = fill(arr, 0.0, 1, 3);
        expect(1/result[0]).assertEqual(-Infinity);
        expect(1/result[1]).assertEqual(Infinity);
        expect(1/result[2]).assertEqual(Infinity);
        expect(1/result[3]).assertEqual(-Infinity);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_10500
     * @tc.name    testBuiltinArrayFill0712
     * @tc.desc    Test fill() with large floating-point numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0712', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0712";
      try {
        let arr: FixedArray<number> = [1e-100, 2e200, 3.1415926535];
        let largeValue = 1.7976931348623157e+308;
        let result = fill(arr, largeValue, 0, 2);
        expect(result[0]).assertEqual(largeValue);
        expect(result[1]).assertEqual(largeValue);
        expect(result[2]).assertEqual(3.1415926535);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_10600
     * @tc.name    testBuiltinArrayFill0713
     * @tc.desc    Test fill() with small floating-point numbers
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0713', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0713";
      try {
        let arr: FixedArray<number> = [0.000001, 0.000002, 0.000003];
        let smallValue = 5e-324;
        let result = fill(arr, smallValue, 1);
        expect(result[0]).assertEqual(0.000001);
        expect(result[1]).assertEqual(smallValue);
        expect(result[2]).assertEqual(smallValue);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_10700
     * @tc.name    testBuiltinArrayFill0714
     * @tc.desc    Test fill() with indices beyond array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0714', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0714";
      try {
        let arr: FixedArray<number> = [1.5, 2.5, 3.5];
        let result = fill(arr, 9.9, 5, 10);
        expect(result[0]).assertEqual(1.5);
        expect(result[1]).assertEqual(2.5);
        expect(result[2]).assertEqual(3.5);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_10800
     * @tc.name    testBuiltinArrayFill0715
     * @tc.desc    Test fill() with negative indices beyond array length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0715', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0715";
      try {
        let arr: FixedArray<number> = [0.1, 0.2, 0.3];
        let result = fill(arr, 9.9, -5, -4);
        expect(result[0]).assertEqual(0.1);
        expect(result[1]).assertEqual(0.2);
        expect(result[2]).assertEqual(0.3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_10900
     * @tc.name    testBuiltinArrayFill0716
     * @tc.desc    Test fill() with floating-point values and exact equality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0716', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0716";
      try {
        let arr: FixedArray<number> = [0.1 + 0.2, 0.3 - 0.1, 0.4 * 0.5];
        let fillValue = 0.3;
        let result = fill(arr, fillValue, 0, arr.length);

        for (let i = 0; i < result.length; i++) {
          expect(Math.abs(result[i] - fillValue) < Number.EPSILON).assertTrue();
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
	
    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11000_02
     * @tc.name    testBuiltinArrayFill0717
     * @tc.desc    Test fill() with empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0717', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0717";
      try {
        let arr: FixedArray<number> = [];
        let result = fill(arr, 9.9, 0, 1);
        expect(result.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_11100_02
     * @tc.name    testBuiltinArrayFill0718
     * @tc.desc    Test fill() with start index 0 and end index 0
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0718', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0718";
      try {
        let arr: FixedArray<number> = [1.1, 2.2, 3.3];
        let original = [...arr];
        let result = fill(arr, 9.9, 0, 0);
        expect(result[0]).assertEqual(original[0]);
        expect(result[1]).assertEqual(original[1]);
        expect(result[2]).assertEqual(original[2]);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9400
     * @tc.name    testBuiltinArrayFill0607
     * @tc.desc    Test negative indices handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0607', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0607";
      try {
        const arr = [1, 2, 3, 4, 5];
        const result = arr.fill(9, -3, -1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 9, 9, 5]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9500_01
     * @tc.name    testBuiltinArrayFill0608_01
     * @tc.desc    Test out-of-bound indices handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0608_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0608_01";
      try {
        const arr = [1, 2, 3];
        const result = arr.fill(9, 10, 15);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9600_01
     * @tc.name    testBuiltinArrayFill0609_01
     * @tc.desc    Test start index greater than end index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0609_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0609_01";
      try {
        const arr = [1, 2, 3, 4, 5];
        const result = arr.fill(9, 3, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9700
     * @tc.name    testBuiltinArrayFill0610
     * @tc.desc    Test default parameters behavior
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0610";
      try {
        const arr = [1, 2, 3];
        const result = arr.fill(9);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([9, 9, 9]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9500_02
     * @tc.name    testBuiltinArrayFill0608_02
     * @tc.desc    Test out-of-bound indices handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0608_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0608_02";
      try {
        const arr = [1, 2, 3];
        const result = arr.fill(9, 10, 15);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9600_02
     * @tc.name    testBuiltinArrayFill0609_02
     * @tc.desc    Test start index greater than end index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0609_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0609_02";
      try {
        const arr = [1, 2, 3, 4, 5];
        const result = arr.fill(9, 3, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9500_03
     * @tc.name    testBuiltinArrayFill068_02
     * @tc.desc    Test out-of-bound indices handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill068_02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill068_02";
      try {
        const arr = [1, 2, 3];
        const result = arr.fill(9, 10, 15);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9600_03
     * @tc.name    testBuiltinArrayFill0609_03
     * @tc.desc    Test start index greater than end index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0609_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0609_03";
      try {
        const arr = [1, 2, 3, 4, 5];
        const result = arr.fill(9, 3, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9500_04
     * @tc.name    testBuiltinArrayFill0608_03
     * @tc.desc    Test out-of-bound indices handling
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0608_03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0608_03";
      try {
        const arr = [1, 2, 3];
        const result = arr.fill(9, 10, 15);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_9600_04
     * @tc.name    testBuiltinArrayFill0609_04
     * @tc.desc    Test start index greater than end index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0609_04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testBuiltinArrayFill0609_04";
      try {
        const arr = [1, 2, 3, 4, 5];
        const result = arr.fill(9, 3, 1);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3, 4, 5]));
        expect(result === arr).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_7700
     * @tc.name    testBuiltinArrayFill0212
     * @tc.desc    Test fill with start > array length (no change)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0212";
      try {
        const arr = [false, false];
        const original = [...arr];
        arr.fill(true, 3);
        expect(arr.join(',')).assertEqual(original.join(','));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_7800
     * @tc.name    testBuiltinArrayFill0213
     * @tc.desc    Test fill on empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0213";
      try {
        const arr: boolean[] = [];
        arr.fill(true);
        expect(arr.length).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_7900
     * @tc.name    testBuiltinArrayFill0214
     * @tc.desc    Test fill with start == end (no change)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0214";
      try {
        const arr = [false, false, false];
        const original = [...arr];
        arr.fill(true, 1, 1);
        expect(arr.join(',')).assertEqual(original.join(','));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_8000
     * @tc.name    testBuiltinArrayFill0215
     * @tc.desc    Test fill with both negative start and end
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0215";
      try {
        const arr = [false, false, false, false];
        arr.fill(true, -3, -1);
        expect(arr.join(',')).assertEqual('false,true,true,false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_8200
     * @tc.name    testBuiltinArrayFill0217
     * @tc.desc    Test multiple fill operations on same array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0217";
      try {
        const arr = [false, false, false, false, false];
        arr.fill(true, 0, 2);
        arr.fill(false, 2, 4);
        arr.fill(true, 4);
        expect(arr.join(',')).assertEqual('true,true,false,false,true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_6600
     * @tc.name    testBuiltinArrayFill0109
     * @tc.desc    Test fill with start=0, end=0 (no change)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0109";
      try {
        let arr: boolean[] = [true, false, true];
        let original = [...arr];
        arr.fill(false, 0, 0);
        expect(arr.toString()).assertEqual(original.toString());
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_6700
     * @tc.name    testBuiltinArrayFill0110
     * @tc.desc    Test fill with negative start and end
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0110";
      try {
        let arr: boolean[] = [false, false, false, false];
        arr.fill(true, -3, -1);
        expect(arr.toString()).assertEqual('false,true,true,false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_6800
     * @tc.name    testBuiltinArrayFill0111
     * @tc.desc    Test fill with start > array length (no change)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0111";
      try {
        let arr: boolean[] = [true, false];
        let original = arr.toString();
        arr.fill(false, 3, 4);
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_6900
     * @tc.name    testBuiltinArrayFill0112
     * @tc.desc    Test fill with start=end (no change)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0112";
      try {
        let arr: boolean[] = [false, true, false];
        let original = arr.toString();
        arr.fill(true, 1, 1);
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_7000
     * @tc.name    testBuiltinArrayFill0113
     * @tc.desc    Test fill with large negative start (treated as 0)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0113";
      try {
        let arr: boolean[] = [false, false, false];
        arr.fill(true, -10, 2);
        expect(arr.toString()).assertEqual('true,true,false');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_7100
     * @tc.name    testBuiltinArrayFill0114
     * @tc.desc    Test fill with large negative end (treated as 0)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0114";
      try {
        let arr: boolean[] = [true, true, true];
        let original = arr.toString();
        arr.fill(false, 0, -10);
        expect(arr.toString()).assertEqual(original);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_7200
     * @tc.name    testBuiltinArrayFill0115
     * @tc.desc    Test fill with start=length-1, end=length
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0115";
      try {
        let arr: boolean[] = [false, false, false];
        arr.fill(true, 2, 3);
        expect(arr.toString()).assertEqual('false,false,true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_7300
     * @tc.name    testBuiltinArrayFill0116
     * @tc.desc    Test fill with start=-1, end=length (last element)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0116";
      try {
        let arr: boolean[] = [false, false, false];
        arr.fill(true, -1, 3);
        expect(arr.toString()).assertEqual('false,false,true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_7400
     * @tc.name    testBuiltinArrayFill0117
     * @tc.desc    Test fill with multiple operations on same array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0117";
      try {
        let arr: boolean[] = [false, false, false, false, false];
        arr.fill(true, 0, 2);
        arr.fill(true, 3, 5);
        arr.fill(false, 2, 3);
        expect(arr.toString()).assertEqual('true,true,false,true,true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_7500
     * @tc.name    testBuiltinArrayFill0118
     * @tc.desc    Test fill with start=0, end=length (full fill)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('testBuiltinArrayFill0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0118";
      try {
        let arr: boolean[] = [false, false, false];
        arr.fill(true, 0, 3);
        expect(arr.toString()).assertEqual('true,true,true');
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });
	
    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_12600
     * @tc.name   testBuiltinArrayFill0126
     * @tc.desc   Test every() with empty array (base case for empty collection)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0126";
      try {
        let arr: FixedArray<int> = [];
        let result = every(arr, (value) => value > 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_12700
     * @tc.name   testBuiltinArrayFill0127
     * @tc.desc   Test every() with all boolean elements matching condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0127";
      try {
        let arr: FixedArray<boolean> = [true, true, true];
        let result = every(arr, (value) => value === true);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_12800
     * @tc.name   testBuiltinArrayFill0128
     * @tc.desc   Test every() with partial int elements not matching condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0128";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5];
        let result = every(arr, (value) => value < 4);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_12900
     * @tc.name   testBuiltinArrayFill0129
     * @tc.desc   Test fill() to set all boolean elements to false
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0129";
      try {
        let arr: FixedArray<boolean> = [true, true, false, true];
        let filledArr = fill(arr, false, 0, arr.length);
        let result = every(filledArr, (value) => value === false);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_13000
     * @tc.name   testBuiltinArrayFill0130
     * @tc.desc   Test fill() with partial range (start=1, end=3) for boolean array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0130";
      try {
        let arr: FixedArray<boolean> = [false, false, false, false];
        let filledArr = fill(arr, true, 1, 3);
        let result = filledArr[0] === false &&
          filledArr[1] === true &&
          filledArr[2] === true &&
          filledArr[3] === false;
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_13100
     * @tc.name   testBuiltinArrayFill0131
     * @tc.desc   Test fill() with negative start index (-2) for boolean array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0131";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false];
        let filledArr = fill(arr, true, -2, arr.length);
        let result = filledArr[2] === true && filledArr[3] === true;
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_13200
     * @tc.name   testBuiltinArrayFill0132
     * @tc.desc   Test fill() with start equal to end (no fill) for boolean array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0132";
      try {
        let arr: FixedArray<boolean> = [true, false, true];
        let original = [...arr];
        let filledArr = fill(arr, false, 2, 2);
        let result = every(filledArr, (val, idx) => val === original[idx]);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_13300
     * @tc.name   testBuiltinArrayFill0133
     * @tc.desc   Test fill() with end exceeding length for boolean array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0133";
      try {
        let arr: FixedArray<boolean> = [false, false, false];
        let filledArr = fill(arr, true, 1, 10);
        let result = filledArr[1] === true && filledArr[2] === true;
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_13400
     * @tc.name   testBuiltinArrayFill0134
     * @tc.desc   Testing Array.fill() with partial range.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0134";
      try {
        const arr = [true, false, false, true];
        const filled = [...arr];
        filled.fill(true, 0, 1);
        expect(filled.join(',')).assertEqual(arr.join(','));
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_13500
     * @tc.name   testBuiltinArrayFill0135
     * @tc.desc   Testing Array.fill() with partial range.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0135";
      try {
        const arr = [false, false, false];
        arr.fill(true, 0, 1);
        arr.fill(true, 2);
        const expected = [true, false, true];
        expect(arr.join(',')).assertEqual(expected.join(','));
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FILL_13600
     * @tc.name   testBuiltinArrayFill0136
     * @tc.desc   Testing Array.fill() with partial range.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayFill0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayFill0136";
      try {
        const arr = [false, false, false];
        arr.fill(true, 1);
        const expected = [false, true, true];
        expect(arr.join(',')).assertEqual(expected.join(','));
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });
  });
}