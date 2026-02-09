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
export default function BuiltinArrayFill02Test() {

  describe("BuiltinArrayFill02Test", (): void => {
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
     * @tc.number   SUB_COMMONLIBRARY_UTIL_BASE_FILL_278
     * @tc.name     test_builtin_array_fill_278
     * @tc.desc     Test basic array fill functionality
     * @tc.level    LEVEL1
     * @tc.size     MEDIUMTEST
     * @tc.type     FUNCTION
     */
    it('test_builtin_array_fill_278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_278';
        try {
            const arr = [1, 2, 3];
            const result = arr.fill(1, 0, 3);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 1, 1]));
            expect(result === arr).assertTrue();
            expect(arr.length).assertEqual(3);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_279
     * @tc.name    test_builtin_array_fill_279
     * @tc.desc    Test partial array fill functionality
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_279';
        try {
            const arr = [1, 2, 3, 4, 5];
            const result = arr.fill(9, 2, 4);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 9, 9, 5]));
            expect(result === arr).assertTrue();
            expect(arr.length).assertEqual(5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_280
     * @tc.name    test_builtin_array_fill_280
     * @tc.desc    Test array fill with start index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_280';
        try {
            const arr = [1, 2, 3];
            const result = arr.fill(9, 1);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 9, 9]));
            expect(result === arr).assertTrue();
            expect(arr.length).assertEqual(3);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_281
     * @tc.name    test_builtin_array_fill_281
     * @tc.desc    Test array fill with no replacement
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_281';
        try {
            const arr = [1, 2, 3];
            const result = arr.fill(1, 0, 0);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify([1, 2, 3]));
            expect(result === arr).assertTrue();
            expect(arr.length).assertEqual(3);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_282
     * @tc.name    test_builtin_array_fill_282
     * @tc.desc    Test full array fill
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_282';
        try {
            const arr = [10, 20, 30];
            const result = arr.fill(10, 0, 3);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(10);
            expect(result[2]).assertEqual(10);
            expect(result === arr).assertTrue();
            expect(arr.length).assertEqual(3);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_283
     * @tc.name    test_builtin_array_fill_283
     * @tc.desc    Test boolean array fill
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_283';
        try {
            const arr = [true, false, false];
            const result = arr.fill(true, 0, 1);
            expect(JSON.stringify(result)).assertEqual(JSON.stringify([true, false, false]));
            expect(result === arr).assertTrue();
            expect(arr.length).assertEqual(3);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_284
     * @tc.name    test_builtin_array_fill_284
     * @tc.desc    Test fill with negative start index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_284';
        try {
            const arr: FixedArray<number> = [1, 2, 3, 4, 5];
            const result = fill(arr, 9, -2);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(9);
            expect(result[4]).assertEqual(9);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_285
     * @tc.name    test_builtin_array_fill_285
     * @tc.desc    Test fill with negative end index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_285';
        try {
            const arr: FixedArray<number> = [1.1, 2.2, 3.3, 4.4, 5.5];
            const result = fill(arr, 9.9, 0, -1);
            expect(result[0]).assertEqual(9.9);
            expect(result[1]).assertEqual(9.9);
            expect(result[2]).assertEqual(9.9);
            expect(result[3]).assertEqual(9.9);
            expect(result[4]).assertEqual(5.5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_286
     * @tc.name    test_builtin_array_fill_286
     * @tc.desc    Test fill with positive start and negative end indices
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_286';
        try {
            const arr: FixedArray<number> = [10, 20, 30, 40, 50];
            const result = fill(arr, 0.5, 1, -2);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(0.5);
            expect(result[2]).assertEqual(0.5);
            expect(result[3]).assertEqual(40);
            expect(result[4]).assertEqual(50);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_287
     * @tc.name    test_builtin_array_fill_287
     * @tc.desc    Test fill with start index equal to end index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_287';
        try {
            const arr: FixedArray<number> = [2.5, 3.5, 4.5, 5.5];
            const result = fill(arr, 1.0, 2, 2);
            expect(result[0]).assertEqual(2.5);
            expect(result[1]).assertEqual(3.5);
            expect(result[2]).assertEqual(4.5);
            expect(result[3]).assertEqual(5.5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_288
     * @tc.name    test_builtin_array_fill_288
     * @tc.desc    Test fill with end index exceeding array length
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_288';
        try {
            const arr: FixedArray<number> = [100, 200, 300];
            const result = fill(arr, 50.5, 1, 10);
            expect(result[0]).assertEqual(100);
            expect(result[1]).assertEqual(50.5);
            expect(result[2]).assertEqual(50.5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_289
     * @tc.name    test_builtin_array_fill_289
     * @tc.desc    Test fill with full array range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_builtin_array_fill_289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_builtin_array_fill_289';
        try {
            const arr: FixedArray<number> = [1, 2, 3, 4];
            const result = fill(arr, 9.9, 0, arr.length);
            expect(result[0]).assertEqual(9.9);
            expect(result[1]).assertEqual(9.9);
            expect(result[2]).assertEqual(9.9);
            expect(result[3]).assertEqual(9.9);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_290
     * @tc.name    testBuiltinArrayFill290
     * @tc.desc    Test fill() with both negative start and end indices
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayFill290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill290';
        try {
            const arr: FixedArray<boolean> = [true, false, true, false, true];
            const result = fill(arr, true, -4, -1);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(true);
            expect(result[3]).assertEqual(true);
            expect(result[4]).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_291
     * @tc.name    testBuiltinArrayFill291
     * @tc.desc    Test fill() with partial range in large array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayFill291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill291';
        try {
            const arr: FixedArray<number> = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
            const result = fill(arr, 0, 3, 7);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
            expect(result[3]).assertEqual(0);
            expect(result[4]).assertEqual(0);
            expect(result[5]).assertEqual(0);
            expect(result[6]).assertEqual(0);
            expect(result[7]).assertEqual(8);
            expect(result[8]).assertEqual(9);
            expect(result[9]).assertEqual(10);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_292
     * @tc.name    testBuiltinArrayFill292
     * @tc.desc    Test fill() with full array using default start and end
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayFill292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill292';
        try {
            const arr: FixedArray<number> = [1.1, 2.2, 3.3];
            const result = fill(arr, 5.5);
            expect(result[0]).assertEqual(5.5);
            expect(result[1]).assertEqual(5.5);
            expect(result[2]).assertEqual(5.5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_293
     * @tc.name    testBuiltinArrayFill293
     * @tc.desc    Test fill() with specified start and default end
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayFill293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill293';
        try {
            const arr: FixedArray<number> = [10, 20, 30, 40];
            const result = fill(arr, 0.5, 2);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(0.5);
            expect(result[3]).assertEqual(0.5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_294
     * @tc.name    testBuiltinArrayFill294
     * @tc.desc    Test fill() with negative end index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayFill294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill294';
        try {
            const arr: FixedArray<number> = [1, 2, 3, 4, 5];
            const result = fill(arr, 9, 0, -2);
            expect(result[0]).assertEqual(9);
            expect(result[1]).assertEqual(9);
            expect(result[2]).assertEqual(9);
            expect(result[3]).assertEqual(4);
            expect(result[4]).assertEqual(5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_295
     * @tc.name    testBuiltinArrayFill295
     * @tc.desc    Test fill() with both negative start and end indices
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('testBuiltinArrayFill295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill295';
        try {
            const arr: FixedArray<number> = [10, 20, 30, 40, 50];
            const result = fill(arr, 0.0, -4, -1);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(0.0);
            expect(result[2]).assertEqual(0.0);
            expect(result[3]).assertEqual(0.0);
            expect(result[4]).assertEqual(50);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_296
     * @tc.name   testBuiltinArrayFill296
     * @tc.desc   Test fill() with end index exceeding array length
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill296';
        try {
            const arr: FixedArray<number> = [2.5, 3.5, 4.5];
            const result = fill(arr, 1.0, 1, 10);
            expect(result[0]).assertEqual(2.5);
            expect(result[1]).assertEqual(1.0);
            expect(result[2]).assertEqual(1.0);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_297
     * @tc.name   testBuiltinArrayFill297
     * @tc.desc   Test fill() with start index greater than array length
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill297';
        try {
            const arr: FixedArray<number> = [1, 2, 3];
            const result = fill(arr, 9, 5);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_298
     * @tc.name   testBuiltinArrayFill298
     * @tc.desc   Test fill() with start index equals end index
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill298';
        try {
            const arr: FixedArray<number> = [10, 20, 30, 40];
            const result = fill(arr, 99, 2, 2);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(30);
            expect(result[3]).assertEqual(40);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_299
     * @tc.name   testBuiltinArrayFill299
     * @tc.desc   Test fill() with floating-point numbers
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill299';
        try {
            const arr: FixedArray<double> = [1.1, 2.2, 3.3];
            const result = fill(arr, 5.5, 1);
            expect(result[0]).assertEqual(1.1);
            expect(result[1]).assertEqual(5.5);
            expect(result[2]).assertEqual(5.5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_300
     * @tc.name   testBuiltinArrayFill300
     * @tc.desc   Test fill() with negative start index
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill300';
        try {
            const arr: FixedArray<number> = [1, 2, 3, 4, 5];
            const result = fill(arr, 9, -3);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(9);
            expect(result[3]).assertEqual(9);
            expect(result[4]).assertEqual(9);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_301
     * @tc.name   testBuiltinArrayFill301
     * @tc.desc   Test fill() with negative end index
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill301';
        try {
            const arr: FixedArray<number> = [10, 20, 30, 40, 50];
            const result = fill(arr, 9.5, 0, -2);
            expect(result[0]).assertEqual(9.5);
            expect(result[1]).assertEqual(9.5);
            expect(result[2]).assertEqual(9.5);
            expect(result[3]).assertEqual(40);
            expect(result[4]).assertEqual(50);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_302
     * @tc.name   testBuiltinArrayFill302
     * @tc.desc   Test fill() with positive start and negative end indices
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill302';
        try {
            const arr: FixedArray<number> = [1.1, 2.2, 3.3, 4.4, 5.5];
            const result = fill(arr, 0.0, 1, -1);
            expect(result[0]).assertEqual(1.1);
            expect(result[1]).assertEqual(0.0);
            expect(result[2]).assertEqual(0.0);
            expect(result[3]).assertEqual(0.0);
            expect(result[4]).assertEqual(5.5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_303
     * @tc.name   testBuiltinArrayFill303
     * @tc.desc   Test fill() with start index greater than end index
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill303';
        try {
            const arr: FixedArray<number> = [3, 6, 9, 12];
            const result = fill(arr, 1.5, 3, 1);
            expect(result[0]).assertEqual(3);
            expect(result[1]).assertEqual(6);
            expect(result[2]).assertEqual(9);
            expect(result[3]).assertEqual(12);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_304
     * @tc.name   testBuiltinArrayFill304
     * @tc.desc   Test fill() with end index exceeding array length
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill304';
        try {
            const arr: FixedArray<number> = [2.5, 5.0, 7.5];
            const result = fill(arr, 0.0, 1, 10);
            expect(result[0]).assertEqual(2.5);
            expect(result[1]).assertEqual(0.0);
            expect(result[2]).assertEqual(0.0);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_305
     * @tc.name   testBuiltinArrayFill305
     * @tc.desc   Test fill() with full array range (default start and end)
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill305';
        try {
            const arr: FixedArray<number> = [10, 20, 30, 40];
            const result = fill(arr, 5.5);
            expect(result[0]).assertEqual(5.5);
            expect(result[1]).assertEqual(5.5);
            expect(result[2]).assertEqual(5.5);
            expect(result[3]).assertEqual(5.5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_306
     * @tc.name   testBuiltinArrayFill306
     * @tc.desc   Test fill() with default parameters (fill entire array)
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill306';
        try {
            const arr: FixedArray<boolean> = [false, true, false];
            const result = fill(arr, true);
            expect(result[0]).assertEqual(true);
            expect(result[1]).assertEqual(true);
            expect(result[2]).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_307
     * @tc.name   testBuiltinArrayFill307
     * @tc.desc   Test fill() with start index greater than end index
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill307';
        try {
            const arr: FixedArray<number> = [10, 20, 30];
            const result = fill(arr, 5, 2, 1);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(30);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_308
     * @tc.name   testBuiltinArrayFill308
     * @tc.desc   Test fill() with out-of-bound indices
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill308';
        try {
            const arr: FixedArray<number> = [1, 2, 3];
            const result = fill(arr, 9, -10, 10);
            expect(result[0]).assertEqual(9);
            expect(result[1]).assertEqual(9);
            expect(result[2]).assertEqual(9);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_309
     * @tc.name   testBuiltinArrayFill309
     * @tc.desc   Test fill() with end index equal to start index
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill309';
        try {
            const arr: FixedArray<number> = [10, 20, 30, 40];
            const result = fill(arr, 99, 2, 2);
            expect(result[0]).assertEqual(10);
            expect(result[1]).assertEqual(20);
            expect(result[2]).assertEqual(30);
            expect(result[3]).assertEqual(40);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_310
     * @tc.name   testBuiltinArrayFill310
     * @tc.desc   Test fill() with negative start and end indices
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill310';
        try {
            const arr: FixedArray<number> = [1, 2, 3, 4, 5];
            const result = fill(arr, 9, -3, -1);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(9);
            expect(result[3]).assertEqual(9);
            expect(result[4]).assertEqual(5);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_311
     * @tc.name   testBuiltinArrayFill311
     * @tc.desc   Test fill() with end index exceeding array length
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill311';
        try {
            const arr: FixedArray<number> = [1, 2, 3];
            const result = fill(arr, 9, 1, 10);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(9);
            expect(result[2]).assertEqual(9);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_312
     * @tc.name   testBuiltinArrayFill312
     * @tc.desc   Test fill() with both start and end indices exceeding array length
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it('testBuiltinArrayFill312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'testBuiltinArrayFill312';
        try {
            const arr: FixedArray<number> = [1, 2, 3];
            const result = fill(arr, 9, 5, 10);
            expect(result[0]).assertEqual(1);
            expect(result[1]).assertEqual(2);
            expect(result[2]).assertEqual(3);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_12300_01
     * @tc.name   testBuiltinArrayFill1005
     * @tc.desc   Test fill() with start index equal to array length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1005';
      try {
        const arr: FixedArray<number> = [1, 2, 3];
        const result = fill(arr, 9, arr.length);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_12400
     * @tc.name   testBuiltinArrayFill1006
     * @tc.desc   Test fill() with NaN values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1006';
      try {
        const arr: FixedArray<number> = [1, 2, 3];
        const result = fill(arr, NaN, 1);
        expect(isNaN(result[1])).assertTrue();
        expect(isNaN(result[2])).assertTrue();
        expect(result[0]).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_12500_02
     * @tc.name   testBuiltinArrayFill1101
     * @tc.desc   Test fill() with default start/end (entire array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1101';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 0);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(0);
        expect(result[2]).assertEqual(0);
        expect(result[3]).assertEqual(0);
        expect(result[4]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_12600
     * @tc.name   testBuiltinArrayFill1102
     * @tc.desc   Test fill() with specified start and default end
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1102';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, 3);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_12700_02
     * @tc.name   testBuiltinArrayFill1103
     * @tc.desc   Test fill() with default start and specified end
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1103';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, undefined, 2);
        expect(result[0]).assertEqual(9);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_12800
     * @tc.name   testBuiltinArrayFill1104
     * @tc.desc   Test fill() with negative start index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1104';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, -2);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_12900
     * @tc.name   testBuiltinArrayFill1105
     * @tc.desc   Test fill() with negative end index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1105';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, 0, -2);
        expect(result[0]).assertEqual(9);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_13000
     * @tc.name   testBuiltinArrayFill1106
     * @tc.desc   Test fill() with start greater than end (no change)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1106';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, 3, 1);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(4);
        expect(result[4]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_13300
     * @tc.name   testBuiltinArrayFill1201
     * @tc.desc   Test fill() with partial range (middle section)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1201';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, 1, 4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_13400
     * @tc.name   testBuiltinArrayFill1202
     * @tc.desc   Test fill() with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1202';
      try {
        const arr: FixedArray<number> = [];
        const result = fill(arr, 1);
        expect(result.length).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_13500
     * @tc.name   testBuiltinArrayFill1203
     * @tc.desc   Test fill() with negative start and end indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1203';
      try {
        const arr: FixedArray<number> = [10, 20, 30, 40, 50];
        const result = fill(arr, 99, -4, -1);
        expect(result[0]).assertEqual(10);
        expect(result[1]).assertEqual(99);
        expect(result[2]).assertEqual(99);
        expect(result[3]).assertEqual(99);
        expect(result[4]).assertEqual(50);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_13600
     * @tc.name   testBuiltinArrayFill1204
     * @tc.desc   Test fill() with start index equal to end index (no fill)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1204';
      try {
        const arr: FixedArray<number> = [1, 3, 5, 7];
        const result = fill(arr, 0, 2, 2);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(3);
        expect(result[2]).assertEqual(5);
        expect(result[3]).assertEqual(7);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_13700
     * @tc.name   testBuiltinArrayFill1205
     * @tc.desc   Test fill() with end index exceeding array length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1205';
      try {
        const arr: FixedArray<number> = [2, 4, 6];
        const result = fill(arr, 8, 1, 10);
        expect(result[0]).assertEqual(2);
        expect(result[1]).assertEqual(8);
        expect(result[2]).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_13800
     * @tc.name   testBuiltinArrayFill1206
     * @tc.desc   Test fill() with start=0 and specified end index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1206';
      try {
        const arr: FixedArray<number> = [100, 200, 300, 400];
        const result = fill(arr, 50, 0, 2);
        expect(result[0]).assertEqual(50);
        expect(result[1]).assertEqual(50);
        expect(result[2]).assertEqual(300);
        expect(result[3]).assertEqual(400);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_14100
     * @tc.name   testBuiltinArrayFill1301
     * @tc.desc   Test fill() entire array with default parameters
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1301';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 0);
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(0);
        expect(result[2]).assertEqual(0);
        expect(result[3]).assertEqual(0);
        expect(result[4]).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_14200_02
     * @tc.name   testBuiltinArrayFill1302
     * @tc.desc   Test fill() with partial range using positive indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1302';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, 1, 4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_14300_02
     * @tc.name   testBuiltinArrayFill1303
     * @tc.desc   Test fill() with negative start index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1303';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, -2);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(3);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(9);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_14400
     * @tc.name   testBuiltinArrayFill1304
     * @tc.desc   Test fill() with both negative indices
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1304';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, -3, -1);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(2);
        expect(result[2]).assertEqual(9);
        expect(result[3]).assertEqual(9);
        expect(result[4]).assertEqual(5);
        expect(result.length).assertEqual(5);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_14500
     * @tc.name   testBuiltinArrayFill1305
     * @tc.desc   Test fill() with end index exceeding array length
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1305';
      try {
        const arr: FixedArray<number> = [1, 2, 3];
        const result = fill(arr, 9, 1, 10);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertEqual(9);
        expect(result[2]).assertEqual(9);
        expect(result.length).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE_FILL_14600
     * @tc.name   testBuiltinArrayFill1306
     * @tc.desc   Test fill() with invalid range (start > end)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayFill1306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFill1306';
      try {
        const arr: FixedArray<number> = [1, 2, 3, 4, 5];
        const result = fill(arr, 9, 3, 1);
        expect(result.toString()).assertEqual('1,2,3,4,5');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_BYTE_0100
     * @tc.name    testBuiltinArrayFind10001
     * @tc.desc    Test finding first matching element in byte array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind10001';
      try {
        const arr: FixedArray<byte> = [10, 20, 30, 40, 50];
        const result = find(arr, (v: byte) => v > 25);
        expect(result).assertEqual(30);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_BYTE_0200
     * @tc.name    testBuiltinArrayFind10002
     * @tc.desc    Test finding element at boundary value (127)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind10002';
      try {
        const arr: FixedArray<byte> = [126, 127, -128];
        const result = find(arr, (v: byte) => v === 127);
        expect(result).assertEqual(127);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_BYTE_0300
     * @tc.name    testBuiltinArrayFind10003
     * @tc.desc    Test returning undefined when no match found
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind10003';
      try {
        const arr: FixedArray<byte> = [1, 2, 3, 4, 5];
        const result = find(arr, (v: byte) => v > 10);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_BYTE_0500
     * @tc.name    testBuiltinArrayFind10005
     * @tc.desc    Test finding element in empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind10005';
      try {
        const arr: FixedArray<byte> = [];
        const result = find(arr, (v: byte) => v === 1);
        expect(result).assertUndefined();
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_BYTE_0700
     * @tc.name    testBuiltinArrayFind10007
     * @tc.desc    Test finding first negative value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind10007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind10007';
      try {
        const arr: FixedArray<byte> = [5, -3, 10, -1, 8];
        const result = find(arr, (v: byte) => v < 0);
        expect(result).assertEqual(-3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_BYTE_0900
     * @tc.name    testBuiltinArrayFind10009
     * @tc.desc    Test finding minimum byte value (-128)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind10009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind10009';
      try {
        const arr: FixedArray<byte> = [127, -128, -1];
        const result = find(arr, (v: byte) => v === -128);
        expect(result).assertEqual(-128);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_DOUBLE_0800
     * @tc.name    testBuiltinArrayFind30008
     * @tc.desc    Test special double values (NaN, Infinity)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind30008';
      try {
        const arr: FixedArray<double> = [NaN, Infinity, -Infinity, 1.1];
        const foundNaN = find(arr, (v: double) => isNaN(v));
        const foundInf = find(arr, (v: double) => v === Infinity || v === -Infinity);
        expect(foundNaN).assertNaN();
        expect(foundInf).assertEqual(Infinity);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_LONG_1000
     * @tc.name    testBuiltinArrayFind60010
     * @tc.desc    Test near-boundary long values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind60010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind60010';
      try {
        const arr: FixedArray<long> = [9223372036854775806, 9223372036854775807];
        const found = find(arr, (v: long) => v > 9223372036854775806);
        expect(found).assertEqual(9223372036854775807);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_LONG_1300
     * @tc.name    testBuiltinArrayFind60013
     * @tc.desc    Test null,undefined array elements
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFind60013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFind60013';
      try {
        const maxLong: long = 9223372036854775807;
        const minLong: long = -9223372036854775808;
        const arr: FixedArray<long> = [maxLong, minLong];
        const result = find(arr, (v: long) => v === maxLong);
        expect(result).assertEqual(maxLong);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_0800
     * @tc.name    testBuiltinArrayFindShort70008
     * @tc.desc    Test short boundary values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFindShort70008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFindShort70008';
      try {
        const arr: FixedArray<short> = [32767, -32768, 0];
        const maxShortResult = find(arr, (v) => v === 32767);
        const minShortResult = find(arr, (v) => v === -32768);
        const zeroResult = find(arr, (v) => v === 0);
        expect(maxShortResult).assertEqual(32767);
        expect(minShortResult).assertEqual(-32768);
        expect(zeroResult).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_1000
     * @tc.name    testBuiltinArrayFindShort70010
     * @tc.desc    Test callback function throwing exception
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFindShort70010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFindShort70010';
      let hasThrown = false;
      try {
        const arr: FixedArray<short> = [10, 20, 30];
        find(arr, (val, idx) => {
          if (idx === 1) {
            throw new Error('Callback error');
          }
          return val === 20;
        });
      } catch (e) {
        hasThrown = true;
        expect((e as Error).message).assertEqual('Callback error');
      }
      expect(hasThrown).assertTrue();
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_FIND_SHORT_1100
     * @tc.name    testBuiltinArrayFindShort70011
     * @tc.desc    Test array with null values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testBuiltinArrayFindShort70011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayFindShort70011';
      try {
        const arr: FixedArray<short | null> = [1, null, 3];
        expect(arr[1]).assertEqual(null);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_1200
     * @tc.name   testBuiltinArrayAt120013
     * @tc.desc   Testing at() with index = -0.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayAt120013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayAt120013';
      try {
        const arr: FixedArray<long> = [42, 43];
        const result = at(arr, -0);
        expect(result).assertEqual(42);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_AT_0700
     * @tc.name   testBuiltinArrayAt130007
     * @tc.desc   Test at() with const array view
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayAt130007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayAt130007';
      try {
        const arr: FixedArray<int> = [7, 8, 9];
        expect(at(arr, 2)).assertEqual(9);
        expect(at(arr, -2)).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FIXEDARRAY_AT_0700
     * @tc.name   testBuiltinArrayAt140007
     * @tc.desc   Testing at() with negative zero index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testBuiltinArrayAt140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testBuiltinArrayAt140007';
      try {
        const arr: FixedArray<short> = [10, 20, 30, 40];
        const result = at(arr, -0);
        expect(result).assertEqual(10);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INCLUDES_0100
     * @tc.name   testFixedArrayBooleanIncludes0001
     * @tc.desc   Testing at() with single element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayBooleanIncludes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayBooleanIncludes0001';
      try {
        const arr: FixedArray<boolean> = [false, true, false];
        expect(includes(arr, true)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INCLUDES_0200
     * @tc.name   testFixedArrayBooleanIncludes0002
     * @tc.desc   Testing at() with single element array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayBooleanIncludes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayBooleanIncludes0002';
      try {
        const arr: FixedArray<boolean> = [true, true, true];
        expect(includes(arr, false)).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INCLUDES_0300
     * @tc.name   testFixedArrayBooleanIncludes0003
     * @tc.desc   Test includes method of FixedArray<boolean> with search element false starting from index 2
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayBooleanIncludes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayBooleanIncludes0003';
      try {
        const arr: FixedArray<boolean> = [true, false, true, false];
        expect(includes(arr, false, 2)).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_0100
     * @tc.name   testFixedArrayBooleanIndexOf0001
     * @tc.desc   Test indexOf method of FixedArray<boolean> to find first occurrence of true
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayBooleanIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayBooleanIndexOf0001';
      try {
        const arr: FixedArray<boolean> = [false, true, false];
        expect(indexOf(arr, true)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_0800
     * @tc.name   testFixedArrayShortIndexOf0001
     * @tc.desc   Test indexOf method of FixedArray<short> to find first occurrence of value 100
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayShortIndexOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayShortIndexOf0001';
      try {
        const arr: FixedArray<short> = [100 as short, 200 as short, 300 as short];
        expect(indexOf(arr, 100 as short)).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_0801
     * @tc.name   testFixedArrayShortIndexOf0002
     * @tc.desc   Test indexOf method of FixedArray<short> to find first occurrence of value 20
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayShortIndexOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayShortIndexOf0002';
      try {
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short];
        expect(indexOf(arr, 20 as short)).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_0802
     * @tc.name   testFixedArrayShortIndexOf0003
     * @tc.desc   Test indexOf method of FixedArray<short> to find non-existent value 5
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayShortIndexOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayShortIndexOf0003';
      try {
        const arr: FixedArray<short> = [1 as short, 2 as short, 3 as short];
        expect(indexOf(arr, 5 as short)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_0803
     * @tc.name   testFixedArrayShortIndexOf0004
     * @tc.desc   Test indexOf method of FixedArray<short> to find value 10 starting from index 1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayShortIndexOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayShortIndexOf0004';
      try {
        const arr: FixedArray<short> = [10 as short, 20 as short, 10 as short, 30 as short];
        expect(indexOf(arr, 10 as short, 1)).assertEqual(2);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_0804
     * @tc.name   testFixedArrayShortIndexOf0005
     * @tc.desc   Test indexOf method of FixedArray<short> to find value 20 with negative fromIndex
     * @tc.size   MEDIUMTESTMEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayShortIndexOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayShortIndexOf0005';
      try {
        const arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 20 as short];
        expect(indexOf(arr, 20 as short, -2)).assertEqual(3);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_0805
     * @tc.name   testFixedArrayShortIndexOf0006
     * @tc.desc   Test indexOf method of FixedArray<short> to find value 200 starting beyond array length
     * @tc.size   MEDIUMTESTMEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  Level 1
     */
    it('testFixedArrayShortIndexOf0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testFixedArrayShortIndexOf0006';
      try {
        const arr: FixedArray<short> = [100 as short, 200 as short, 300 as short];
        expect(indexOf(arr, 200 as short, 5)).assertEqual(-1);
      } catch (err) {
        console.error(`${TAG} failed: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_001
     * @tc.name    test_array_includes_001
     * @tc.desc    Test includes method with float array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_001";
      try {
        let arr: FixedArray<float> = [1.1 as float,2.2 as float,3.3 as float,2.2 as float] as FixedArray<float>;
        let result = includes(arr, 2.2 as float, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_002
     * @tc.name    test_array_includes_002
     * @tc.desc    Test includes method with float array and search from index 1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_002";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 1.1 as float, 1);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_003
     * @tc.name    test_array_includes_003
     * @tc.desc    Test includes method with empty float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_003";
      try {
        let arr: FixedArray<float> = [] as FixedArray<float>;
        let result = includes(arr, 1.1 as float);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_004
     * @tc.name    test_array_includes_004
     * @tc.desc    Test includes method with float array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_004";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 2.2 as float, -2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_005
     * @tc.name    test_array_includes_005
     * @tc.desc    Test includes method with float array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_005";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 2.2 as float, 5);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_006
     * @tc.name    test_array_includes_006
     * @tc.desc    Test includes method with float array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_006";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 1.1 as float);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_007
     * @tc.name    test_array_includes_007
     * @tc.desc    Test includes method with float array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_007";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 3.3 as float);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_008
     * @tc.name    test_array_includes_008
     * @tc.desc    Test includes method with int array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_008";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = includes(arr, 3);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_009
     * @tc.name    test_array_includes_009
     * @tc.desc    Test includes method with int array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_009";
      try {
        let arr: FixedArray<int> = [10, 20, 30] as FixedArray<int>;
        let result = includes(arr, 40);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_010
     * @tc.name    test_array_includes_010
     * @tc.desc    Test includes method with int array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_010";
      try {
        let arr: FixedArray<int> = [5, 10, 15, 10, 20] as FixedArray<int>;
        let result = includes(arr, 10, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_011
     * @tc.name    test_array_includes_011
     * @tc.desc    Test includes method with int array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_011";
      try {
        let arr: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
        let result = includes(arr, 2, 5);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_012
     * @tc.name    test_array_includes_012
     * @tc.desc    Test includes method with empty int array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_012";
      try {
        let arr: FixedArray<int> = [] as FixedArray<int>;
        let result = includes(arr, 1);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_013
     * @tc.name    test_array_includes_013
     * @tc.desc    Test includes method with int array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_013";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40, 50] as FixedArray<int>;
        let result = includes(arr, 30, -3);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_014
     * @tc.name    test_array_includes_014
     * @tc.desc    Test includes method with int array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_014";
      try {
        let arr: FixedArray<int> = [100, 200, 300] as FixedArray<int>;
        let result = includes(arr, 100);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_015
     * @tc.name    test_array_includes_015
     * @tc.desc    Test includes method with int array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_015";
      try {
        let arr: FixedArray<int> = [5, 10, 15, 20] as FixedArray<int>;
        let result = includes(arr, 20);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_016
     * @tc.name    test_array_includes_016
     * @tc.desc    Test includes method with int array and search from index 0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_016";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = includes(arr, 1, 0);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_017
     * @tc.name    test_array_indexof_017
     * @tc.desc    Test indexOf method with float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_017";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = indexOf(arr, 2.2 as float);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_018
     * @tc.name    test_array_indexof_018
     * @tc.desc    Test indexOf method with float array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_018";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = indexOf(arr, 4.4 as float);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_019
     * @tc.name    test_array_indexof_019
     * @tc.desc    Test indexOf method with float array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_019";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float, 2.2 as float] as FixedArray<float>;
        let result = indexOf(arr, 2.2 as float, 2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_020
     * @tc.name    test_array_indexof_020
     * @tc.desc    Test indexOf method with float array and search from index 1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_020";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = indexOf(arr, 1.1 as float, 1);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_021
     * @tc.name    test_array_indexof_021
     * @tc.desc    Test indexOf method with empty float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_021";
      try {
        let arr: FixedArray<float> = [] as FixedArray<float>;
        let result = indexOf(arr, 1.1 as float);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_022
     * @tc.name    test_array_indexof_022
     * @tc.desc    Test indexOf method with float array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_022";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = indexOf(arr, 2.2 as float, -2);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_023
     * @tc.name    test_array_indexof_023
     * @tc.desc    Test indexOf method with float array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_023";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = indexOf(arr, 2.2 as float, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_024
     * @tc.name    test_array_indexof_024
     * @tc.desc    Test indexOf method with float array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_024";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = indexOf(arr, 1.1 as float);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_025
     * @tc.name    test_array_indexof_025
     * @tc.desc    Test indexOf method with float array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_025";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = indexOf(arr, 3.3 as float);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_026
     * @tc.name    test_array_includes_026
     * @tc.desc    Test includes method with int array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_026";
      try {
        let arr: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
        let result = includes(arr, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_027
     * @tc.name    test_array_indexof_027
     * @tc.desc    Test indexOf method with int array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_027";
      try {
        let arr: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
        let result = indexOf(arr, 2);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_028
     * @tc.name    test_array_includes_028
     * @tc.desc    Test indexOf method with int array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_028";
      try {
        let arr: string[] = ['a', 'b', 'c'];
        let result = arr.includes('b');
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_029
     * @tc.name    test_array_indexof_029
     * @tc.desc    Test indexOf method with char array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_029";
      try {
        let arr: Array<string> = ['a', 'b', 'c'];
        let result = arr.indexOf('b');
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_030
     * @tc.name    test_array_includes_030
     * @tc.desc    Test includes method with boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_030";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = includes(arr, true);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_031
     * @tc.name    test_array_indexof_031
     * @tc.desc    Test indexOf method with boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_031";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_032
     * @tc.name    test_array_includes_032
     * @tc.desc    Test includes method with byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_032";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x03 as byte] as FixedArray<byte>;
        let result = includes(arr, 0x02 as byte);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_033
     * @tc.name    test_array_indexof_033
     * @tc.desc    Test indexOf method with byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_033";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x03 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x02 as byte);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_034
     * @tc.name    test_array_includes_034
     * @tc.desc    Test includes method with long array containing large values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_034";
      try {
        let arr: FixedArray<long> = [10000000000, 20000000000, 30000000000] as FixedArray<long>;
        let result = includes(arr, 20000000000);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_035
     * @tc.name    test_array_includes_035
     * @tc.desc    Test includes method with long array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_035";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = includes(arr, 200);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_036
     * @tc.name    test_array_includes_036
     * @tc.desc    Test includes method with long array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_036";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = includes(arr, 400);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_037
     * @tc.name    test_array_includes_037
     * @tc.desc    Test includes method with long array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_037";
      try {
        let arr: FixedArray<long> = [100, 200, 300, 200] as FixedArray<long>;
        let result = includes(arr, 200, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_038
     * @tc.name    test_array_includes_038
     * @tc.desc    Test includes method with long array and search from index 1
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_038";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = includes(arr, 100, 1);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_039
     * @tc.name    test_array_includes_039
     * @tc.desc    Test includes method with long array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_039";
      try {
        let arr: FixedArray<long> = [100, 200, 300, 400] as FixedArray<long>;
        let result = includes(arr, 300, -2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_040
     * @tc.name    test_array_includes_040
     * @tc.desc    Test includes method with empty long array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_040";
      try {
        let arr: FixedArray<long> = [] as FixedArray<long>;
        let result = includes(arr, 100);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_041
     * @tc.name    test_array_includes_041
     * @tc.desc    Test includes method with long array containing minimum value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_041";
      try {
        let arr: FixedArray<long> = [-9007199254740991, 0, 100] as FixedArray<long>;
        let result = includes(arr, -9007199254740991 as long);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_042
     * @tc.name    test_array_includes_042
     * @tc.desc    Test includes method with long array containing maximum value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_042";
      try {
        let arr: FixedArray<long> = [0, 9007199254740991, 100] as FixedArray<long>;
        let result = includes(arr, 9007199254740991 as long);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_043
     * @tc.name    test_array_includes_043
     * @tc.desc    Test includes method with long array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_043";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = includes(arr, 200 as long, 5);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_044
     * @tc.name    test_array_includes_044
     * @tc.desc    Test includes method with short array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_044";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 30 as short] as FixedArray<short>;
        let result = includes(arr, 20 as short);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_045
     * @tc.name    test_array_includes_045
     * @tc.desc    Test includes method with short array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_045";
      try {
        let arr: FixedArray<short> = [100 as short, 200 as short, 300 as short] as FixedArray<short>;
        let result = includes(arr, 400 as short);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}