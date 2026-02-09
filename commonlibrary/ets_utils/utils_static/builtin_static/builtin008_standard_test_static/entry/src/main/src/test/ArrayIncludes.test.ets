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
export default function ArrayIncludesTest() {

  describe("ArrayIncludesTest", (): void => {
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_046
     * @tc.name    test_array_includes_046
     * @tc.desc    Test includes method with empty short array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_046";
      try {
        let arr: FixedArray<short> = [] as FixedArray<short>;
        let result = includes(arr, 10 as short);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_047
     * @tc.name    test_array_includes_047
     * @tc.desc    Test includes method with short array containing minimum value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_047";
      try {
        let minVal = -32768 as short;
        let arr: FixedArray<short> = [minVal, 0 as short, 100 as short] as FixedArray<short>;
        let result = includes(arr, minVal);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_048
     * @tc.name    test_array_includes_048
     * @tc.desc    Test includes method with short array containing maximum value
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_048";
      try {
        let maxVal = 32767 as short;
        let arr: FixedArray<short> = [maxVal, 0 as short, -100 as short] as FixedArray<short>;
        let result = includes(arr, maxVal);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_049
     * @tc.name    test_array_includes_049
     * @tc.desc    Test includes method with short array containing duplicate values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_049";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 10 as short, 30 as short] as FixedArray<short>;
        let result = includes(arr, 10 as short);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_050
     * @tc.name    test_array_includes_050
     * @tc.desc    Test includes method with short array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_050";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 20 as short] as FixedArray<short>;
        let result = includes(arr, 20 as short, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_051
     * @tc.name    test_array_includes_051
     * @tc.desc    Test includes method with short array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_051";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 30 as short, 40 as short] as FixedArray<short>;
        let result = includes(arr, 30 as short, -2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_052
     * @tc.name    test_array_includes_052
     * @tc.desc    Test includes method with short array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_052";
      try {
        let arr: FixedArray<short> = [10 as short, 20 as short, 30 as short] as FixedArray<short>;
        let result = includes(arr, 20 as short, 5);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_053
     * @tc.name    test_array_indexof_053
     * @tc.desc    Test indexOf method with boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_053";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_054
     * @tc.name    test_array_indexof_054
     * @tc.desc    Test indexOf method with boolean array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_054";
      try {
        let arr: FixedArray<boolean> = [false, false, false] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_055
     * @tc.name    test_array_indexof_055
     * @tc.desc    Test indexOf method with boolean array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_055";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true, 2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_056
     * @tc.name    test_array_indexof_056
     * @tc.desc    Test indexOf method with boolean array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_056";
      try {
        let arr: FixedArray<boolean> = [false, true, false, true] as FixedArray<boolean>;
        let result = indexOf(arr, true, -2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_057
     * @tc.name    test_array_indexof_057
     * @tc.desc    Test indexOf method with empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_057";
      try {
        let arr: FixedArray<boolean> = [] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_058
     * @tc.name    test_array_indexof_058
     * @tc.desc    Test indexOf method with boolean array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_058";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_059
     * @tc.name    test_array_indexof_059
     * @tc.desc    Test indexOf method with boolean array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_059";
      try {
        let arr: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_060
     * @tc.name    test_array_indexof_060
     * @tc.desc    Test indexOf method with boolean array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_060";
      try {
        let arr: FixedArray<boolean> = [false, false, true] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_061
     * @tc.name    test_array_indexof_061
     * @tc.desc    Test indexOf method with boolean array containing duplicate values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_061";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false, true] as FixedArray<boolean>;
        let result = indexOf(arr, true, 1);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_062
     * @tc.name    test_array_indexof_062
     * @tc.desc    Test indexOf method with boolean array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_062";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_063
     * @tc.name    test_array_indexof_063
     * @tc.desc    Test indexOf method with boolean array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_063";
      try {
        let arr: FixedArray<boolean> = [false, false, false] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_064
     * @tc.name    test_array_indexof_064
     * @tc.desc    Test indexOf method with boolean array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_064";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true, 2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_065
     * @tc.name    test_array_indexof_065
     * @tc.desc    Test indexOf method with empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_065";
      try {
        let arr: FixedArray<boolean> = [] as FixedArray<boolean>;
        let result = indexOf(arr, true);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_066
     * @tc.name    test_array_indexof_066
     * @tc.desc    Test indexOf method with boolean array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_066";
      try {
        let arr: FixedArray<boolean> = [false, true, false] as FixedArray<boolean>;
        let result = indexOf(arr, true, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_067
     * @tc.name    test_array_includes_067
     * @tc.desc    Test includes method with boolean array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_067";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_068
     * @tc.name    test_array_includes_068
     * @tc.desc    Test includes method with boolean array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_068";
      try {
        let arr: FixedArray<boolean> = [true, true, true] as FixedArray<boolean>;
        let result = includes(arr, false);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_069
     * @tc.name    test_array_includes_069
     * @tc.desc    Test includes method with boolean array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_069";
      try {
        let arr: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        let result = includes(arr, false, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_070
     * @tc.name    test_array_includes_070
     * @tc.desc    Test includes method with empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_070";
      try {
        let arr: FixedArray<boolean> = [] as FixedArray<boolean>;
        let result = includes(arr, true);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_071
     * @tc.name    test_array_indexof_071
     * @tc.desc    Test indexOf method with byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_071";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_072
     * @tc.name    test_array_indexof_072
     * @tc.desc    Test indexOf method with byte array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_072";
      try {
        let arr: FixedArray<byte> = [0x0A as byte, 0x0B as byte] as FixedArray<byte>;
        let result = indexOf(arr, (0xFF).toByte());
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_073
     * @tc.name    test_array_includes_073
     * @tc.desc    Test includes method with byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_073";
      try {
        let arr: FixedArray<byte> = [0x10 as byte, 0x20 as byte, 0x30 as byte] as FixedArray<byte>;
        let result = includes(arr, 0x20 as byte);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_075
     * @tc.name    test_array_indexof_075
     * @tc.desc    Test indexOf method with string array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_075";
      try {
        let arr: string[] = ['a', 'b', 'c'];
        let result = arr.indexOf('d');
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_076
     * @tc.name    test_array_includes_076
     * @tc.desc    Test includes method with string array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_076";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_077
     * @tc.name    test_array_includes_077
     * @tc.desc    Test includes method with string array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_077";
      try {
        let arr: string[] = ['a', 'b', 'a', 'b'];
        let result = arr.includes('a', 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_078
     * @tc.name    test_array_includes_078
     * @tc.desc    Test includes method with byte array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_078";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x01 as byte] as FixedArray<byte>;
        let result = includes(arr, 0x01 as byte, 1);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_080
     * @tc.name    test_array_indexof_080
     * @tc.desc    Test indexOf method with double array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_080";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3] as FixedArray<double>;
        let result = indexOf(arr, 2.2);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_081
     * @tc.name    test_array_includes_081
     * @tc.desc    Test includes method with double array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_081";
      try {
        let arr: FixedArray<double> = [0.1, 0.2, 0.3] as FixedArray<double>;
        let result = includes(arr, 0.2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_082
     * @tc.name    test_array_indexof_082
     * @tc.desc    Test indexOf method with float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_082";
      try {
        let arr: FixedArray<float> = [1.5 as float, 2.5 as float, 3.5 as float] as FixedArray<float>;
        let result = indexOf(arr, 2.5 as float);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_083
     * @tc.name    test_array_indexof_083
     * @tc.desc    Test indexOf method with float array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_083";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float] as FixedArray<float>;
        let result = indexOf(arr, 3.3 as float);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_084
     * @tc.name    test_array_includes_084
     * @tc.desc    Test includes method with float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_084";
      try {
        let arr: FixedArray<float> = [1.5 as float, 2.5 as float, 3.5 as float] as FixedArray<float>;
        let result = includes(arr, 2.5 as float);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_085
     * @tc.name    test_array_includes_085
     * @tc.desc    Test includes method with double array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_085";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3] as FixedArray<double>;
        let result = includes(arr, 4.4);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_086
     * @tc.name    test_array_includes_086
     * @tc.desc    Test includes method with float array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_086";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 1.1 as float] as FixedArray<float>;
        let result = includes(arr, 1.1 as float, 1);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_087
     * @tc.name    test_array_includes_087
     * @tc.desc    Test includes method with double array containing Infinity
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_087";
      try {
        let arr: FixedArray<double> = [1.1, Infinity, 3.3] as FixedArray<double>;
        let result = includes(arr, Infinity);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_088
     * @tc.name    test_array_indexof_088
     * @tc.desc    Test indexOf method with byte array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_088";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_089
     * @tc.name    test_array_indexof_089
     * @tc.desc    Test indexOf method with byte array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_089";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x05 as byte);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_090
     * @tc.name    test_array_indexof_090
     * @tc.desc    Test indexOf method with byte array and fromIndex parameter
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_090";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04, 0x03] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte, 3);
        expect(result).assertEqual(4);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_091
     * @tc.name    test_array_indexof_091
     * @tc.desc    Test indexOf method with byte array and fromIndex at array length
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_091";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte, arr.length);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_092
     * @tc.name    test_array_indexof_092
     * @tc.desc    Test indexOf method with byte array and fromIndex at 0
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_092";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x01 as byte, 0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_093
     * @tc.name    test_array_indexof_093
     * @tc.desc    Test indexOf method with empty byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_093";
      try {
        let arr: FixedArray<byte> = [] as FixedArray<byte>;
        let result = indexOf(arr, 0x01 as byte);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_094
     * @tc.name    test_array_indexof_094
     * @tc.desc    Test indexOf method with byte array containing duplicate values
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_094";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x02, 0x03] as FixedArray<byte>;
        let result = indexOf(arr, 0x02 as byte);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_095
     * @tc.name    test_array_indexof_095
     * @tc.desc    Test indexOf method with byte array and negative fromIndex
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_095";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte, -2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_096
     * @tc.name   test_array_indexof_096
     * @tc.desc   Test indexOf method with byte array and fromIndex larger than array length
     * @tc.level  LEVEL1
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     */
    it("test_array_indexof_096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_096";
      try {
        let arr: FixedArray<byte> = [0x01, 0x02, 0x03, 0x04] as FixedArray<byte>;
        let result = indexOf(arr, 0x03 as byte, 10);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_097
     * @tc.name    test_array_indexof_097
     * @tc.desc    Test indexOf method with byte array for existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_097";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_098
     * @tc.name    test_array_indexof_098
     * @tc.desc    Test indexOf method with byte array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_098";
      try {
        let arr: FixedArray<byte> = [(0x0A).toByte(), (0x0B).toByte()] as FixedArray<byte>;
        let result = indexOf(arr, (0xFF).toByte());
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_099
     * @tc.name    test_array_indexof_099
     * @tc.desc    Test indexOf method with byte array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_099";
      try {
        let arr: FixedArray<byte> = [0x10 as byte, 0x20 as byte, 0x10 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x10 as byte, 1);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_100
     * @tc.name    test_array_indexof_100
     * @tc.desc    Test indexOf method with empty byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_100";
      try {
        let arr: FixedArray<byte> = [] as FixedArray<byte>;
        let result = indexOf(arr, 0x01 as byte);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_101
     * @tc.name    test_array_indexof_101
     * @tc.desc    Test indexOf method with byte array and negative fromIndex
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_101";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x03 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x02 as byte, -2);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_102
     * @tc.name    test_array_indexof_102
     * @tc.desc    Test indexOf method with byte array and out of bounds fromIndex
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_102";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x01 as byte, 10);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_103
     * @tc.name    test_array_indexof_103
     * @tc.desc    Test indexOf method with byte array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_103";
      try {
        let arr: FixedArray<byte> = [(0xFF).toByte(), (0xEE).toByte(), (0xDD).toByte()] as FixedArray<byte>;
        let result = indexOf(arr, (0xFF).toByte());
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_104
     * @tc.name    test_array_indexof_104
     * @tc.desc    Test indexOf method with byte array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_104";
      try {
        let arr: FixedArray<byte> = [0x11 as byte, 0x22 as byte, 0x33 as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x33 as byte);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_105
     * @tc.name    test_array_indexof_105
     * @tc.desc    Test indexOf method with byte array and very negative fromIndex
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_105";
      try {
        let arr: FixedArray<byte> = [0x0A as byte, 0x0B as byte] as FixedArray<byte>;
        let result = indexOf(arr, 0x0A as byte, -10);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_112
     * @tc.name    test_array_includes_112
     * @tc.desc    Test includes method with float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_112";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 2.2 as float);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_113
     * @tc.name    test_array_includes_113
     * @tc.desc    Test includes method with float array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_113";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<float>;
        let result = includes(arr, 4.4 as float);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_114
     * @tc.name    test_array_includes_114
     * @tc.desc    Test includes method with float array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_114";
      try {
        let arr: FixedArray<float> = [1.0, 2.0, 3.0, 2.0] as FixedArray<float>;
        let result = includes(arr, 2.0 as float, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_115
     * @tc.name    test_array_includes_115
     * @tc.desc    Test includes method with empty float array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_115";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_116
     * @tc.name    test_array_includes_116
     * @tc.desc    Test includes method with float array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_116";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_117
     * @tc.name    test_array_includes_117
     * @tc.desc    Test includes method with float array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_117";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float] as FixedArray<float>;
        let result = includes(arr, 1.1 as float, 5);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_118
     * @tc.name    test_array_includes_118
     * @tc.desc    Test includes method with float array for first element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_118";
      try {
        let arr: FixedArray<float> = [9.9 as float, 8.8 as float, 7.7 as float] as FixedArray<float>;
        let result = includes(arr, 9.9 as float);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_119
     * @tc.name    test_array_includes_119
     * @tc.desc    Test includes method with float array for last element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_119";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_120
     * @tc.name    test_array_includes_120
     * @tc.desc    Test includes method with float array and very negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_120";
      try {
        let arr: FixedArray<float> = [1.1 as float, 2.2 as float] as FixedArray<float>;
        let result = includes(arr, 1.1 as float, -10);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_132
     * @tc.name    test_array_includes_132
     * @tc.desc    Test includes method with boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_132";
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
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_133
     * @tc.name    test_array_includes_133
     * @tc.desc    Test includes method with boolean array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_133";
      try {
        let arr: FixedArray<boolean> = [true, true, true] as FixedArray<boolean>;
        let result = includes(arr, false);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_134
     * @tc.name    test_array_includes_134
     * @tc.desc    Test includes method with boolean array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_134";
      try {
        let arr: FixedArray<boolean> = [false, true, false, true] as FixedArray<boolean>;
        let result = includes(arr, true, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_135
     * @tc.name    test_array_includes_135
     * @tc.desc    Test includes method with boolean array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_135";
      try {
        let arr: FixedArray<boolean> = [false, true, false, true] as FixedArray<boolean>;
        let result = includes(arr, true, -2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_136
     * @tc.name    test_array_includes_136
     * @tc.desc    Test includes method with empty boolean array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_136";
      try {
        let arr: FixedArray<boolean> = [] as FixedArray<boolean>;
        let result = includes(arr, true);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_137
     * @tc.name    test_array_includes_137
     * @tc.desc    Test includes method with byte array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_137";
      try {
        let arr: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte] as FixedArray<byte>;
        let result = includes(arr, 2 as byte);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_138
     * @tc.name    test_array_includes_138
     * @tc.desc    Test includes method with byte array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_138";
      try {
        let arr: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte] as FixedArray<byte>;
        let result = includes(arr, 4 as byte);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_139
     * @tc.name    test_array_includes_139
     * @tc.desc    Test includes method with byte array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_139";
      try {
        let arr: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte, 2 as byte] as FixedArray<byte>;
        let result = includes(arr, 2 as byte, 2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_140
     * @tc.name    test_array_includes_140
     * @tc.desc    Test includes method with byte array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_includes_140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_140";
      try {
        let arr: FixedArray<byte> = [0x01 as byte, 0x02 as byte, 0x03 as byte] as FixedArray<byte>;
        let result = includes(arr, 0x02 as byte, -2);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_146
     * @tc.name    test_array_indexof_146
     * @tc.desc    Test indexOf method with double array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_146";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<double>;
        let result = indexOf(arr, 2.2 as float, 0);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_147
     * @tc.name    test_array_indexof_147
     * @tc.desc    Test indexOf method with double array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_147";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<double>;
        let result = indexOf(arr, 4.4 as float, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_148
     * @tc.name    test_array_indexof_148
     * @tc.desc    Test indexOf method with double array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_148";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float, 2.2 as float] as FixedArray<double>;
        let result = indexOf(arr, 2.2 as float, 2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_149
     * @tc.name    test_array_indexof_149
     * @tc.desc    Test indexOf method with double array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_149";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<double>;
        let result = indexOf(arr, 1.1 as float, -3);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_150
     * @tc.name    test_array_indexof_150
     * @tc.desc    Test indexOf method with empty double array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_150";
      try {
        let arr: FixedArray<double> = [] as FixedArray<double>;
        let result = indexOf(arr, 1.1 as float, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_151
     * @tc.name    test_array_indexof_151
     * @tc.desc    Test indexOf method with double array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_151";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<double>;
        let result = indexOf(arr, 2.2 as float);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_152
     * @tc.name    test_array_indexof_152
     * @tc.desc    Test indexOf method with double array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_152";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<double>;
        let result = indexOf(arr, 4.4 as float);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_153
     * @tc.name    test_array_indexof_153
     * @tc.desc    Test indexOf method with double array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_153";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float, 2.2 as float] as FixedArray<double>;
        let result = indexOf(arr, 2.2 as float, 2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_154
     * @tc.name    test_array_indexof_154
     * @tc.desc    Test indexOf method with double array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_154";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<double>;
        let result = indexOf(arr, 1.1 as float, 10);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_155
     * @tc.name    test_array_indexof_155
     * @tc.desc    Test indexOf method with double array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_155";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float, 4.4 as float] as FixedArray<double>;
        let result = indexOf(arr, 3.3 as float, -2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_156
     * @tc.name    test_array_indexof_156
     * @tc.desc    Test indexOf method with double array and very negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_156";
      try {
        let arr: FixedArray<double> = [1.1 as float, 2.2 as float, 3.3 as float] as FixedArray<double>;
        let result = indexOf(arr, 1.1 as float, -10);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_157
     * @tc.name    test_array_indexof_157
     * @tc.desc    Test indexOf method with int array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_157";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40] as FixedArray<int>;
        let result = indexOf(arr, 30, 0);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_158
     * @tc.name    test_array_indexof_158
     * @tc.desc    Test indexOf method with int array for non-existing element
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_158";
      try {
        let arr: FixedArray<int> = [100, 200, 300] as FixedArray<int>;
        let result = indexOf(arr, 400, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_159
     * @tc.name    test_array_indexof_159
     * @tc.desc    Test indexOf method with int array and search from index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_159";
      try {
        let arr: FixedArray<int> = [5, 10, 15, 10, 20] as FixedArray<int>;
        let result = indexOf(arr, 10, 2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_160
     * @tc.name    test_array_indexof_160
     * @tc.desc    Test indexOf method with int array and out of bounds index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_160";
      try {
        let arr: FixedArray<int> = [1, 2, 3] as FixedArray<int>;
        let result = indexOf(arr, 2, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_161
     * @tc.name    test_array_indexof_161
     * @tc.desc    Test indexOf method with empty int array
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_161";
      try {
        let arr: FixedArray<int> = [] as FixedArray<int>;
        let result = indexOf(arr, 1, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_162
     * @tc.name    test_array_indexof_162
     * @tc.desc    Test indexOf method with int array and negative index
     * @tc.level   LEVEL1
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     */
    it("test_array_indexof_162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_162";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40] as FixedArray<int>;
        let result = indexOf(arr, 30, -2);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0163
     * @tc.name    test_array_indexof_int_0163
     * @tc.desc    Test basic indexOf functionality with FixedArray<int>
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0163";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40] as FixedArray<int>;
        let result = indexOf(arr, 30);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0164
     * @tc.name    test_array_indexof_int_0164
     * @tc.desc    Test indexOf with fromIndex parameter
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0164";
      try {
        let arr: FixedArray<int> = [5, 10, 15, 10, 20] as FixedArray<int>;
        let result = indexOf(arr, 10, 2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0165
     * @tc.name    test_array_indexof_int_0165
     * @tc.desc    Test indexOf with negative index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0165";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = indexOf(arr, 3, -3);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0166
     * @tc.name    test_array_indexof_int_0166
     * @tc.desc    Test indexOf for first element
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0166";
      try {
        let arr: FixedArray<int> = [100, 200, 300] as FixedArray<int>;
        let result = indexOf(arr, 100);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0167
     * @tc.name    test_array_indexof_int_0167
     * @tc.desc    Test indexOf for last element
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0167";
      try {
        let arr: FixedArray<int> = [5, 10, 15, 20] as FixedArray<int>;
        let result = indexOf(arr, 20);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0168
     * @tc.name    test_array_indexof_int_0168
     * @tc.desc    Test indexOf with empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0168";
      try {
        let arr: FixedArray<int> = [] as FixedArray<int>;
        let result = indexOf(arr, 100);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0169
     * @tc.name    test_array_indexof_int_0169
     * @tc.desc    Test indexOf with out of range index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0169";
      try {
        let arr: FixedArray<int> = [10, 20, 30] as FixedArray<int>;
        let result = indexOf(arr, 20, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0170
     * @tc.name    test_array_indexof_int_0170
     * @tc.desc    Test indexOf with duplicate values
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0170";
      try {
        let arr: FixedArray<int> = [5, 10, 5, 20, 5] as FixedArray<int>;
        let result = indexOf(arr, 5, 1);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0171
     * @tc.name    test_array_indexof_int_0171
     * @tc.desc    Test indexOf with negative index out of range
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0171";
      try {
        let arr: FixedArray<int> = [10, 20, 30] as FixedArray<int>;
        let result = indexOf(arr, 10, -5);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_INT_0172
     * @tc.name    test_array_indexof_int_0172
     * @tc.desc    Test indexOf with max integer value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_int_0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_int_0172";
      try {
        let maxVal = 2147483647;
        let arr: FixedArray<int> = [maxVal, 20, 30] as FixedArray<int>;
        let result = indexOf(arr, maxVal);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_INT_0173
     * @tc.name    test_array_includes_int_0173
     * @tc.desc    Test basic includes functionality with FixedArray<int>
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_includes_int_0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_int_0173";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40] as FixedArray<int>;
        let result = includes(arr, 30);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_INT_0174
     * @tc.name    test_array_includes_int_0174
     * @tc.desc    Test includes with value not found
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_includes_int_0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_int_0174";
      try {
        let arr: FixedArray<int> = [100, 200, 300] as FixedArray<int>;
        let result = includes(arr, 400);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_INT_0175
     * @tc.name    test_array_includes_int_0175
     * @tc.desc    Test includes with fromIndex parameter
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_includes_int_0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_int_0175";
      try {
        let arr: FixedArray<int> = [5, 10, 15, 10, 20] as FixedArray<int>;
        let result1 = includes(arr, 10, 2);
        let result2 = includes(arr, 5, 1);
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_INT_0176
     * @tc.name    test_array_includes_int_0176
     * @tc.desc    Test includes with negative index
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_includes_int_0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_int_0176";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4, 5] as FixedArray<int>;
        let result = includes(arr, 3, -3);
        expect(result).assertEqual(true);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INCLUDES_INT_0177
     * @tc.name    test_array_includes_int_0177
     * @tc.desc    Test includes with empty array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_includes_int_0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_includes_int_0177";
      try {
        let arr: FixedArray<int> = [] as FixedArray<int>;
        let result = includes(arr, 100);
        expect(result).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0178
     * @tc.name    test_array_indexof_long_0178
     * @tc.desc    Test basic indexOf with FixedArray<long>
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_long_0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_long_0178";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = indexOf(arr, 200, 0);
        expect(result).assertEqual(1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0179
     * @tc.name    test_array_indexof_long_0179
     * @tc.desc    Test indexOf with long value not found
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_long_0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_long_0179";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = indexOf(arr, 400, 0);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0180
     * @tc.name    test_array_indexof_long_0180
     * @tc.desc    Test indexOf with first element in long array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_long_0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_long_0180";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = indexOf(arr, 100, 0);
        expect(result).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0181
     * @tc.name    test_array_indexof_long_0181
     * @tc.desc    Test indexOf with last element in long array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_long_0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_long_0181";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = indexOf(arr, 300, 0);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0182
     * @tc.name    test_array_indexof_long_0182
     * @tc.desc    Test indexOf with fromIndex in long array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_long_0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_long_0182";
      try {
        let arr: FixedArray<long> = [100, 200, 300, 200] as FixedArray<long>;
        let result = indexOf(arr, 200, 2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0183
     * @tc.name    test_array_indexof_long_0183
     * @tc.desc    Test indexOf with out of range index in long array
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_long_0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_long_0183";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = indexOf(arr, 200, 5);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0184
     * @tc.name    test_array_indexof_long_0184
     * @tc.desc    Test indexOf with long array basic functionality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   LEVEL1
     */
    it('test_array_indexof_long_0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_array_indexof_long_0184";
      try {
        let arr: FixedArray<long> = [100, 200, 300, 400, 500] as FixedArray<long>;
        let result = indexOf(arr, 300);
        expect(result).assertEqual(2);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0185
     * @tc.name   test_sub_commonlibrary_array_indexof_long_0185
     * @tc.desc   Test indexOf with long array for non-existent value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('test_sub_commonlibrary_array_indexof_long_0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_sub_commonlibrary_array_indexof_long_0185";
      try {
        let arr: FixedArray<long> = [100, 200, 300] as FixedArray<long>;
        let result = indexOf(arr, 999);
        expect(result).assertEqual(-1);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0186
     * @tc.name   test_sub_commonlibrary_array_indexof_long_0186
     * @tc.desc   Test indexOf with long array and fromIndex parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     * */
    it('test_sub_commonlibrary_array_indexof_long_0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_sub_commonlibrary_array_indexof_long_0186";
      try {
        let arr: FixedArray<long> = [100, 200, 300, 200, 500] as FixedArray<long>;
        let result = indexOf(arr, 200, 2);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_ARRAY_INDEXOF_LONG_0187
     * @tc.name   test_sub_commonlibrary_array_indexof_long_0187
     * @tc.desc   Test indexOf with long array and negative fromIndex
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('test_sub_commonlibrary_array_indexof_long_0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_sub_commonlibrary_array_indexof_long_0187";
      try {
        let arr: FixedArray<long> = [100, 200, 300, 400] as FixedArray<long>;
        let result = indexOf(arr, 400, -1);
        expect(result).assertEqual(3);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_0188
     * @tc.name   test_sub_commonlibrary_util_array_copy_within_0188
     * @tc.desc   Test basic functionality of copyWithin with valid target index
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_sub_commonlibrary_util_array_copy_within_0188";
      try {
        let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        let result = copyWithin(self, 2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_0189
     * @tc.name   test_sub_commonlibrary_util_array_copy_within_0189
     * @tc.desc   Test copying to start boundary (target=0)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_sub_commonlibrary_util_array_copy_within_0189";
      try {
        let self: FixedArray<boolean> = [false, true, false, true] as FixedArray<boolean>;
        let result = copyWithin(self, 0);
        expect(JSON.stringify(result)).assertEqual(JSON.stringify([false, true, false, true]));
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_COPY_WITHIN_0190
     * @tc.name   test_sub_commonlibrary_util_array_copy_within_0190
     * @tc.desc   Test negative target index (relative to end)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('test_sub_commonlibrary_util_array_copy_within_0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "test_sub_commonlibrary_util_array_copy_within_0190";
      try {
        let self: FixedArray<boolean> = [true, false, true, false] as FixedArray<boolean>;
        let result = copyWithin(self, -2);
        expect(result[0]).assertEqual(true);
        expect(result[1]).assertEqual(false);
        expect(result[2]).assertEqual(true);
        expect(result[3]).assertEqual(false);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });
  })
}