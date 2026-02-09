/**
 * Copyright (c) 2025-2026 SwanLink (Jiangsu) Technology Development Co., LTD.
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
export default function EveryModulusTest() {

  describe("EveryModulusTest", (): void => {
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
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_212
     * @tc.name    test_type_of_212
     * @tc.desc    Testing Type.of with string type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_type_of_212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_type_of_212";
        try {
            let a = Type.of("OpenHarmony");
            expect(String(a)).assertEqual("string");
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_213
     * @tc.name    test_type_of_213
     * @tc.desc    Testing number type detection
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_type_of_213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_type_of_213";
        try {
            const num = 3.14;
            const typeDesc = String(Type.of(num));
            const validTypes = ["number", "double", "Number"];
            expect(validTypes.includes(typeDesc)).assertTrue();
            expect(typeof num === "number").assertTrue();
            expect(num > 3.13 && num < 3.15).assertTrue();
        } catch (err) {
            console.error(`${TAG} is fail, err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_214
     * @tc.name    test_type_of_214
     * @tc.desc    Testing Type.of with boolean type
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_type_of_214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_type_of_214";
        try {
            let a = Type.of(true);
            expect(String(a)).assertEqual("boolean");
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_215
     * @tc.name    test_type_of_215
     * @tc.desc    Testing Type.of with function type (specific signature)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_type_of_215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_type_of_215";
        try {
            let func = () => {
                console.log("test");
            };
            let a = Type.of(func);
            expect(String(a)).assertEqual("(): void");
        } catch (err) {
            console.error(`${TAG} is fail, err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_TYPE_OF_216
     * @tc.name    test_type_of_null_216
     * @tc.desc    Testing Type.of with null type
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_type_of_null_216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_type_of_null_216";
        try {
            let a = Type.of(null);
            expect(String(a)).assertEqual("null");
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_217
     * @tc.name    test_every_empty_array_217
     * @tc.desc    Test every() with empty array (should return true)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_empty_array_217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_every_empty_array_217";
        try {
            let arr: FixedArray<double> = [];
            let result = every(arr, (value) => value > 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_218
     * @tc.name    test_every_all_elements_satisfy_218
     * @tc.desc    Test every() with all elements satisfying condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_all_elements_satisfy_218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_every_all_elements_satisfy_218";
        try {
            let arr: FixedArray<double> = [1.0, 2.0, 3.0];
            let result = every(arr, (value) => value > 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_219
     * @tc.name    test_every_one_element_fails_219
     * @tc.desc    Test every() with one element not satisfying condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_one_element_fails_219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_every_one_element_fails_219";
        try {
            let arr: FixedArray<double> = [1.0, -2.0, 3.0];
            let result = every(arr, (value) => value > 0);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_220
     * @tc.name    test_every_with_index_220
     * @tc.desc    Test every() with index parameter usage
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_with_index_220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_every_with_index_220";
        try {
            let arr: FixedArray<double> = [10.0, 20.0, 30.0];
            let result = every(arr, (value, index) => value > index);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_221
     * @tc.name    test_every_with_array_param_221
     * @tc.desc    Test every() with array parameter usage
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_with_array_param_221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_every_with_array_param_221";
        try {
            let arr: FixedArray<double> = [5.0, 5.0, 5.0];
            let result = every(arr, (value, _, array) => value === array[0]);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_222
     * @tc.name    test_every_all_equal_222
     * @tc.desc    Test every() with all elements equal to specific value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_all_equal_222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        let TAG = "test_every_all_equal_222";
        try {
            let arr: FixedArray<float> = [5.0f, 5.0f, 5.0f, 5.0f];
            let result = every(arr, (value) => value === 5.0f);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} is fail,err is ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_223
     * @tc.name    test_every_complex_condition_223
     * @tc.desc    Test every() with elements meeting complex condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_complex_condition_223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_complex_condition_223';
        try {
            const arr: FixedArray<float> = [10.0f, 20.0f, 30.0f, 40.0f];
            const result = every(arr, (value) => value % 10 === 0f && value > 5.0f);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_224
     * @tc.name    test_every_elements_not_meet_224
     * @tc.desc    Test every() with elements not meeting condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_elements_not_meet_224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_elements_not_meet_224';
        try {
            const arr: FixedArray<float> = [1.5f, 2.5f, 3.0f, 4.5f];
            const result = every(arr, (value) => Math.floor(value) === value);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_225
     * @tc.name    test_every_index_based_225
     * @tc.desc    Test every() with index-based condition checking
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_index_based_225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_index_based_225';
        try {
            const arr: FixedArray<float> = [0.0f, 1.0f, 2.0f, 3.0f];
            const result = every(arr, (value, index) => value === index);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_226
     * @tc.name    test_every_empty_array_226
     * @tc.desc    Test every() with empty array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_empty_array_226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_empty_array_226';
        try {
            const arr: FixedArray<float> = [];
            const result = every(arr, (value) => value > 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_227
     * @tc.name    test_every_all_even_227
     * @tc.desc    Test every() with all elements meeting condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_all_even_227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_all_even_227';
        try {
            const arr: FixedArray<float> = [2.0f, 4.0f, 6.0f, 8.0f];
            const result = every(arr, (value) => value % 2 === 0f);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_228
     * @tc.name    test_every_one_fails_228
     * @tc.desc    Test every() with one element not meeting condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_one_fails_228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_one_fails_228';
        try {
            const arr: FixedArray<float> = [5.0f, 10.0f, 15.0f, 20.0f, 21.0f];
            const result = every(arr, (value) => value % 5 === 0f && value % 2 === 0f);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_229
     * @tc.name    test_every_array_param_229
     * @tc.desc    Test every() with condition using array parameter
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_array_param_229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_array_param_229';
        try {
            const arr: FixedArray<float> = [1.0f, 2.0f, 3.0f, 4.0f];
            const result = every(arr, (value, index, array) => value <= array[array.length - 1]);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_230
     * @tc.name    test_every_negative_numbers_230
     * @tc.desc    Test every() with negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_negative_numbers_230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_negative_numbers_230';
        try {
            const arr: FixedArray<float> = [-2.0f, -4.0f, -6.0f, -8.0f];
            const result = every(arr, (value) => value < 0f);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_231
     * @tc.name    test_every_empty_array_int_231
     * @tc.desc    Test every() with empty array should return true
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_empty_array_int_231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_empty_array_int_231';
        try {
            const arr: FixedArray<int> = [];
            const result = every(arr, (value) => value > 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_232
     * @tc.name    test_every_all_even_232
     * @tc.desc    Test every() with all elements passing the condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_all_even_232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_all_even_232';
        try {
            const arr: FixedArray<int> = [2, 4, 6, 8];
            const result = every(arr, (value) => value % 2 === 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_233
     * @tc.name    test_every_one_fails_233
     * @tc.desc    Test every() with one element failing the condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_one_fails_233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_one_fails_233';
        try {
            const arr: FixedArray<int> = [2, 3, 4, 6];
            const result = every(arr, (value) => value % 2 === 0);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_234
     * @tc.name    test_every_index_based_234
     * @tc.desc    Test every() with index-based condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_index_based_234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_index_based_234';
        try {
            const arr: FixedArray<int> = [0, 1, 2, 3];
            const result = every(arr, (value, index) => value === index);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_235
     * @tc.name    test_every_negative_numbers_235
     * @tc.desc    Test every() with negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_negative_numbers_235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_negative_numbers_235';
        try {
            const arr: FixedArray<int> = [-1, -2, -3, -4];
            const result = every(arr, (value) => value < 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_236
     * @tc.name    test_every_mixed_numbers_236
     * @tc.desc    Test every() with mixed positive and negative numbers
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_mixed_numbers_236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_mixed_numbers_236';
        try {
            const arr: FixedArray<int> = [1, -2, 3, -4];
            const result = every(arr, (value) => Math.abs(value) === value);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_237
     * @tc.name    test_every_abs_condition_237
     * @tc.desc    Test every() with absolute value condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_abs_condition_237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_abs_condition_237';
        try {
            const arr: FixedArray<int> = [-2, -1, 0, 1, 2];
            const result = every(arr, (value) => Math.abs(value) <= 2);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_238
     * @tc.name    test_every_early_termination_238
     * @tc.desc    Test every() with early termination when condition fails
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_early_termination_238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_early_termination_238';
        try {
            const arr: FixedArray<int> = [2, 4, 6, 7, 8, 10];
            let callCount = 0;
            const result = every(arr, (value) => {
                callCount++;
                return value % 2 === 0;
            });
            expect(result).assertEqual(false);
            expect(callCount).assertEqual(4);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_239
     * @tc.name    test_every_all_divisible_239
     * @tc.desc    Test every() with all elements meeting the condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_all_divisible_239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_all_divisible_239';
        try {
            const arr: FixedArray<int> = [10, 20, 30, 40];
            const result = every(arr, (value) => value % 10 === 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_240
     * @tc.name    test_every_one_not_divisible_240
     * @tc.desc    Test every() with one element not meeting the condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_one_not_divisible_240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_one_not_divisible_240';
        try {
            const arr: FixedArray<int> = [10, 25, 30, 40];
            const result = every(arr, (value) => value % 10 === 0);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_241
     * @tc.name    test_every_empty_array_int_241
     * @tc.desc    Test every() with empty array (should return true)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_empty_array_int_241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_empty_array_int_241';
        try {
            const arr: FixedArray<int> = [];
            const result = every(arr, (value) => value > 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_242
     * @tc.name    test_every_complex_condition_242
     * @tc.desc    Test every() with all elements meeting complex condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_complex_condition_242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_complex_condition_242';
        try {
            const arr: FixedArray<int> = [12, 24, 36, 48];
            const result = every(arr, (value) => value % 12 === 0 && value > 10);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_243
     * @tc.name    test_every_index_multiple_243
     * @tc.desc    Test every() with index-based condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_index_multiple_243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_index_multiple_243';
        try {
            const arr: FixedArray<int> = [0, 2, 4, 6];
            const result = every(arr, (value, index) => value === index * 2);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_244
     * @tc.name    test_every_all_odd_244
     * @tc.desc    Test every() with all elements not meeting the condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_all_odd_244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_all_odd_244';
        try {
            const arr: FixedArray<int> = [1, 3, 5, 7];
            const result = every(arr, (value) => value % 2 === 0);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_245
     * @tc.name    test_every_index_sequence_245
     * @tc.desc    Test every() with index-based comparison
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_index_sequence_245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_index_sequence_245';
        try {
            const arr: FixedArray<int> = [10, 20, 30, 40];
            const result = every(arr, (value, index) => value === (index + 1) * 10);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_246
     * @tc.name    test_every_array_length_246
     * @tc.desc    Test every() with array reference usage in predicate
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_array_length_246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_array_length_246';
        try {
            const arr: FixedArray<int> = [1, 2, 3, 4];
            const result = every(arr, (value, _, array) => value <= array.length);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_247
     * @tc.name    test_every_range_check_247
     * @tc.desc    Test every() with all elements passing a range check
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_range_check_247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_range_check_247';
        try {
            const arr: FixedArray<int> = [5, 7, 9, 11];
            const result = every(arr, (value) => value >= 5 && value <= 15);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_248
     * @tc.name    test_every_modulus_fail_248
     * @tc.desc    Test every() with one element failing a modulus check
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_modulus_fail_248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_modulus_fail_248';
        try {
            const arr: FixedArray<int> = [10, 15, 20, 25, 27];
            const result = every(arr, (value) => value % 5 === 0);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_249
     * @tc.name    test_every_string_length_249
     * @tc.desc    Test every() with all elements passing a string conversion check
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_string_length_249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_string_length_249';
        try {
            const arr: FixedArray<int> = [1, 2, 3, 4];
            const result = every(arr, (value) => String(value).length === 1);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_250
     * @tc.name    test_every_bitwise_check_250
     * @tc.desc    Test every() with all elements passing a bitwise check
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_bitwise_check_250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_bitwise_check_250';
        try {
            const arr: FixedArray<int> = [3, 7, 15, 31];
            const result = every(arr, (value) => (value & (value + 1)) === 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_251
     * @tc.name    test_every_all_fail_comparison_251
     * @tc.desc    Test every() with all elements failing a comparison check
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_all_fail_comparison_251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_all_fail_comparison_251';
        try {
            const arr: FixedArray<int> = [100, 200, 300];
            const result = every(arr, (value) => value < 100);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_252
     * @tc.name    test_every_empty_base_252
     * @tc.desc    Test every() with empty array (base case for empty collection)
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_empty_base_252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_empty_base_252';
        try {
            const arr: FixedArray<int> = [];
            const result = every(arr, (value) => value > 0);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_253
     * @tc.name    test_every_all_boolean_253
     * @tc.desc    Test every() with all boolean elements matching condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_all_boolean_253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_all_boolean_253';
        try {
            const arr: FixedArray<boolean> = [true, true, true];
            const result = every(arr, (value) => value === true);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_EVERY_254
     * @tc.name    test_every_partial_int_fail_254
     * @tc.desc    Test every() with partial int elements not matching condition
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_every_partial_int_fail_254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_every_partial_int_fail_254';
        try {
            const arr: FixedArray<int> = [1, 2, 3, 4, 5];
            const result = every(arr, (value) => value < 4);
            expect(result).assertEqual(false);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_255
     * @tc.name    test_fill_all_boolean_false_255
     * @tc.desc    Test fill() to set all boolean elements to false
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_fill_all_boolean_false_255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_fill_all_boolean_false_255';
        try {
            const arr: FixedArray<boolean> = [true, true, false, true];
            const filledArr = fill(arr, false, 0, arr.length);
            const result = every(filledArr, (value) => value === false);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_256
     * @tc.name    test_fill_partial_range_256
     * @tc.desc    Test fill() with partial range (start=1, end=3) for boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_fill_partial_range_256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_fill_partial_range_256';
        try {
            const arr: FixedArray<boolean> = [false, false, false, false];
            const filledArr = fill(arr, true, 1, 3);
            const result = filledArr[0] === false &&
                filledArr[1] === true &&
                filledArr[2] === true &&
                filledArr[3] === false;
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_257
     * @tc.name    test_fill_negative_start_257
     * @tc.desc    Test fill() with negative start index (-2) for boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_fill_negative_start_257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_fill_negative_start_257';
        try {
            const arr: FixedArray<boolean> = [true, false, true, false];
            const filledArr = fill(arr, true, -2, arr.length);
            const result = filledArr[2] === true && filledArr[3] === true;
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_258
     * @tc.name    test_fill_start_equal_end_258
     * @tc.desc    Test fill() with start equal to end (no fill) for boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_fill_start_equal_end_258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_fill_start_equal_end_258';
        try {
            const arr: FixedArray<boolean> = [true, false, true];
            const original = [...arr];
            const filledArr = fill(arr, false, 2, 2);
            const result = every(filledArr, (val, idx) => val === original[idx]);
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_259
     * @tc.name    test_fill_end_exceeding_length_259
     * @tc.desc    Test fill() with end exceeding length for boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_fill_end_exceeding_length_259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_fill_end_exceeding_length_259';
        try {
            const arr: FixedArray<boolean> = [false, false, false];
            const filledArr = fill(arr, true, 1, 10);
            const result = filledArr[1] === true && filledArr[2] === true;
            expect(result).assertEqual(true);
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_260
     * @tc.name    test_array_fill_partial_range_260
     * @tc.desc    Testing Array.fill() with partial range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_array_fill_partial_range_260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_array_fill_partial_range_260';
        try {
            const arr = [true, false, false, true];
            const filled = [...arr];
            filled.fill(true, 0, 1);
            expect(filled.join(',')).assertEqual(arr.join(','));
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_261
     * @tc.name    test_array_fill_multiple_ranges_261
     * @tc.desc    Testing Array.fill() with partial range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_array_fill_multiple_ranges_261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_array_fill_multiple_ranges_261';
        try {
            const arr = [false, false, false];
            arr.fill(true, 0, 1);
            arr.fill(true, 2);
            const expected = [true, false, true];
            expect(arr.join(',')).assertEqual(expected.join(','));
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_262
     * @tc.name    test_array_fill_from_index_262
     * @tc.desc    Testing Array.fill() with partial range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_array_fill_from_index_262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_array_fill_from_index_262';
        try {
            const arr = [false, false, false];
            arr.fill(true, 1);
            const expected = [false, true, true];
            expect(arr.join(',')).assertEqual(expected.join(','));
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_263
     * @tc.name    test_array_fill_from_middle_263
     * @tc.desc    Testing Array.fill() with partial range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_array_fill_from_middle_263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_array_fill_from_middle_263';
        try {
            const arr = [false, false, false, false];
            arr.fill(true, 2);
            const expected = [false, false, true, true];
            expect(arr.join(',')).assertEqual(expected.join(','));
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_264
     * @tc.name    test_array_fill_multiple_partial_264
     * @tc.desc    Testing Array.fill() with multiple partial ranges
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_array_fill_multiple_partial_264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_array_fill_multiple_partial_264';
        try {
            const arr = [false, false, false, false, false];
            arr.fill(true, 0, 2);
            arr.fill(true, 4);
            const expected = [true, true, false, false, true];
            expect(arr.join(',')).assertEqual(expected.join(','));
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_265
     * @tc.name    test_fill_number_partial_265
     * @tc.desc    Test fill() with partial range and number values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_fill_number_partial_265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_fill_number_partial_265';
        try {
            const arr = [10, 20, 30, 40, 50];
            arr.fill(99, 2, 4);
            const expected = [10, 20, 99, 99, 50];
            expect(arr.join(',')).assertEqual(expected.join(','));
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UTIL_BASE_FILL_266
     * @tc.name    test_fill_boolean_partial_266
     * @tc.desc    Test fill() with boolean values and partial range
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it('test_fill_boolean_partial_266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
        const TAG = 'test_fill_boolean_partial_266';
        try {
            const arr = [false, false, false, false];
            arr.fill(true, 0, 1);
            arr.fill(true, 2, 3);
            const expected = [true, false, true, false];
            expect(arr.join(',')).assertEqual(expected.join(','));
        } catch (err) {
            console.error(`${TAG} failed, error: ${err}`);
            expect().assertFail();
        }
    });

    });
}