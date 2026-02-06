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
let domain: number = 0x0000;
let tag: string = 'testTag';

export default function BuiltinArrayEveryTest() {
  describe("BuiltinArrayEveryTest", (): void => {
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_FOREACH_BOOL_6500
     * @tc.name   testBuiltinArrayforEach0065
     * @tc.desc   Test basic forEach operation with boolean array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayforEach0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayforEach0065";
      try {
        const boolArray: FixedArray<boolean> = [true, false, true] as FixedArray<boolean>;
        let countTrue = 0;
        forEach(boolArray, (value: boolean) => {
          if (value) {
            countTrue++;
          }
        });
        expect(countTrue).assertEqual(2);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FOREACH_BOOL_6700
     * @tc.name   testBuiltinArrayforEach0067
     * @tc.desc   Test forEach on empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayforEach0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayforEach0067";
      try {
        const emptyArray: FixedArray<boolean> = [] as FixedArray<boolean>;
        let called = false;
        forEach(emptyArray, () => {
          called = true;
        });
        expect(called).assertFalse();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FOREACH_BOOL_6800
     * @tc.name   testBuiltinArrayforEach0068
     * @tc.desc   Test edge cases (single element array)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayforEach0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayforEach0068";
      try {
        const singleArray: FixedArray<boolean> = [true] as FixedArray<boolean>;
        let val = false;
        forEach(singleArray, (value) => {
          val = value;
        });
        expect(val).assertTrue();
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_FOREACH_BOOL_6900
     * @tc.name   testBuiltinArrayforEach0069
     * @tc.desc   Test when all elements are processed
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayforEach0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayforEach0069";
      try {
        const boolArray: FixedArray<boolean> = [true, true, true] as FixedArray<boolean>;
        let count = 0;
        forEach(boolArray, () => {
          count++;
        });
        expect(count).assertEqual(3);
        console.log(`${TAG} success`);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_7100
     * @tc.name   testBuiltinArrayTypeOf0071
     * @tc.desc   Testing Type.of with string.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0071";
      try {
        let a = Type.of("ArkTS");
        expect(String(a)).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_7200
     * @tc.name   testBuiltinArrayTypeOf0072
     * @tc.desc   Testing Type.of with boolean.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0072";
      try {
        let a = Type.of(true);
        expect(String(a)).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_7400
     * @tc.name   testBuiltinArrayTypeOf0074
     * @tc.desc   Testing Type.of with number.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0074";
      try {
        let num = 123;
        let typeStr = String(Type.of(num));
        expect(typeStr === "number" || typeStr === "int").assertTrue();
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_7500
     * @tc.name   testBuiltinArrayTypeOf0075
     * @tc.desc   Testing Type.of with string.
     * @tc.size    MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0075";
      try {
        let str = "Hello World";
        let a = Type.of(str);
        expect(String(a)).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_7600
     * @tc.name   testBuiltinArrayTypeOf0076
     * @tc.desc   Testing Type.of with boolean.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0076";
      try {
        let bool = true;
        let a = Type.of(bool);
        expect(String(a)).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_7700
     * @tc.name   testBuiltinArrayTypeOf0077
     * @tc.desc   Testing Type.of with null.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0077";
      try {
        let a = Type.of(null);
        expect(String(a)).assertEqual("null");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_7800
     * @tc.name   testBuiltinArrayTypeOf0078
     * @tc.desc   Testing Type.of with undefined.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0078";
      try {
        let val = undefined;
        let a = Type.of(val);
        expect(String(a)).assertEqual("undefined");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_7900
     * @tc.name   testBuiltinArrayTypeOf0079
     * @tc.desc   Testing Type.of with string type.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0079";
      try {
        let a = Type.of("Hello");
        expect(String(a)).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_8100
     * @tc.name   testBuiltinArrayTypeOf0081
     * @tc.desc   Testing Type.of with boolean type.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0081";
      try {
        let a = Type.of(true);
        expect(String(a)).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_8200
     * @tc.name   testBuiltinArrayTypeOf0082
     * @tc.desc   Testing Type.of with null.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0082";
      try {
        let a = Type.of(null);
        expect(String(a)).assertEqual("null");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_8300
     * @tc.name   testBuiltinArrayTypeOf0083
     * @tc.desc   Testing Type.of with undefined.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0083";
      try {
        let a = Type.of(undefined);
        expect(String(a)).assertEqual("undefined");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_8600
     * @tc.name   testBuiltinArrayTypeOf0086
     * @tc.desc   Testing Type.of with string type.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0086";
      try {
        let a = Type.of("OpenHarmony");
        expect(String(a)).assertEqual("string");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_8700
     * @tc.name   testBuiltinArrayTypeOf0087
     * @tc.desc   Testing number type detection
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0087";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_8800
     * @tc.name   testBuiltinArrayTypeOf0088
     * @tc.desc   Testing Type.of with boolean type.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0088";
      try {
        let a = Type.of(true);
        expect(String(a)).assertEqual("boolean");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_8900
     * @tc.name   testBuiltinArrayTypeOf0089
     * @tc.desc   Testing Type.of with function type (specific signature).
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0089";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_TYPE_OF_9000
     * @tc.name   testBuiltinArrayTypeOf0090
     * @tc.desc   Testing Type.of with null type.
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayTypeOf0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayTypeOf0090";
      try {
        let a = Type.of(null);
        expect(String(a)).assertEqual("null");
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9100
     * @tc.name   testBuiltinArrayEvery0091
     * @tc.desc   Test every() with empty array (should return true)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0091";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9200
     * @tc.name   testBuiltinArrayEvery0092
     * @tc.desc   Test every() with all elements satisfying condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0092";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9300
     * @tc.name   testBuiltinArrayEvery0093
     * @tc.desc   Test every() with one element not satisfying condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0093";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9400
     * @tc.name   testBuiltinArrayEvery0094
     * @tc.desc   Test every() with index parameter usage
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0094";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9500
     * @tc.name   testBuiltinArrayEvery0095
     * @tc.desc   Test every() with array parameter usage
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0095";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9600
     * @tc.name   testBuiltinArrayEvery0096
     * @tc.desc   Test every() with all elements equal to specific value
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0096";
      try {
        let arr: FixedArray<float> = [5.0, 5.0, 5.0, 5.0];
        let result = every(arr, (value) => value === 5.0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9700
     * @tc.name   testBuiltinArrayEvery0097
     * @tc.desc   Test every() with elements meeting complex condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0097";
      try {
        let arr: FixedArray<float> = [10.0, 20.0, 30.0, 40.0];
        let result = every(arr, (value) => value % 10 === 0 && value > 5.0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9800
     * @tc.name   testBuiltinArrayEvery0098
     * @tc.desc   Test every() with elements not meeting condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0098";
      try {
        let arr: FixedArray<float> = [1.5, 2.5, 3.0, 4.5];
        let result = every(arr, (value) => Math.floor(value) === value);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_9900
     * @tc.name   testBuiltinArrayEvery0099
     * @tc.desc   Test every() with index-based condition checking
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0099";
      try {
        let arr: FixedArray<float> = [0.0f, 1.0f, 2.0f, 3.0f];
        let result = every(arr, (value, index) => value === index);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10000
     * @tc.name   testBuiltinArrayEvery0100
     * @tc.desc   Test every() with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0100";
      try {
        let arr: FixedArray<float> = [];
        let result = every(arr, (value) => value > 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10100
     * @tc.name   testBuiltinArrayEvery0101
     * @tc.desc   Test every() with all elements meeting condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0101";
      try {
        let arr: FixedArray<float> = [2.0f, 4.0f, 6.0f, 8.0f];
        let result = every(arr, (value) => value % 2 === 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10200
     * @tc.name   testBuiltinArrayEvery0102
     * @tc.desc   Test every() with one element not meeting condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0102";
      try {
        let arr: FixedArray<float> = [5.0f, 10.0f, 15.0f, 20.0f, 21.0f];
        let result = every(arr, (value) => value % 5 === 0 && value % 2 === 0);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10300
     * @tc.name   testBuiltinArrayEvery0103
     * @tc.desc   Test every() with condition using array parameter
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0103";
      try {
        let arr: FixedArray<float> = [1.0f, 2.0f, 3.0f, 4.0f];
        let result = every(arr, (value, index, array) => value <= array[array.length - 1]);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10400
     * @tc.name   testBuiltinArrayEvery0104
     * @tc.desc   Test every() with negative numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0104";
      try {
        let arr: FixedArray<float> = [-2.0f, -4.0f, -6.0f, -8.0f];
        let result = every(arr, (value) => value < 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10500
     * @tc.name   testBuiltinArrayEvery0105
     * @tc.desc   Test every() with empty array should return true
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0105";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10600
     * @tc.name   testBuiltinArrayEvery0106
     * @tc.desc   Test every() with all elements passing the condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0106";
      try {
        let arr: FixedArray<int> = [2, 4, 6, 8];
        let result = every(arr, (value) => value % 2 === 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10700
     * @tc.name   testBuiltinArrayEvery0107
     * @tc.desc   Test every() with one element failing the condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0107";
      try {
        let arr: FixedArray<int> = [2, 3, 4, 6];
        let result = every(arr, (value) => value % 2 === 0);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10800
     * @tc.name   testBuiltinArrayEvery0108
     * @tc.desc   Test every() with index-based condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0108";
      try {
        let arr: FixedArray<int> = [0, 1, 2, 3];
        let result = every(arr, (value, index) => value === index);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_10900
     * @tc.name   testBuiltinArrayEvery0109
     * @tc.desc   Test every() with negative numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0109";
      try {
        let arr: FixedArray<int> = [-1, -2, -3, -4];
        let result = every(arr, (value) => value < 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11000
     * @tc.name   testBuiltinArrayEvery0110
     * @tc.desc   Test every() with mixed positive and negative numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0110";
      try {
        let arr: FixedArray<int> = [1, -2, 3, -4];
        let result = every(arr, (value) => Math.abs(value) === value);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11100
     * @tc.name   testBuiltinArrayEvery0111
     * @tc.desc   Test every() with mixed positive and negative numbers
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0111";
      try {
        let arr: FixedArray<int> = [-2, -1, 0, 1, 2];
        let result = every(arr, (value) => Math.abs(value) <= 2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11200
     * @tc.name   testBuiltinArrayEvery0112
     * @tc.desc   Test every() with early termination when condition fails
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0112";
      try {
        let arr: FixedArray<int> = [2, 4, 6, 7, 8, 10];
        let callCount = 0;
        let result = every(arr, (value) => {
          callCount++;
          return value % 2 === 0;
        });
        expect(result).assertEqual(false);
        expect(callCount).assertEqual(4);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11300
     * @tc.name   testBuiltinArrayEvery0113
     * @tc.desc   Test every() with all elements meeting the condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0113";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40];
        let result = every(arr, (value) => value % 10 === 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11400
     * @tc.name   testBuiltinArrayEvery0114
     * @tc.desc   Test every() with one element not meeting the condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0114";
      try {
        let arr: FixedArray<int> = [10, 25, 30, 40];
        let result = every(arr, (value) => value % 10 === 0);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11500
     * @tc.name   testBuiltinArrayEvery0115
     * @tc.desc   Test every() with empty array (should return true)
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0115";
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
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11600
     * @tc.name   testBuiltinArrayEvery0116
     * @tc.desc   Test every() with all elements meeting complex condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0116";
      try {
        let arr: FixedArray<int> = [12, 24, 36, 48];
        let result = every(arr, (value) => value % 12 === 0 && value > 10);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11700
     * @tc.name   testBuiltinArrayEvery0117
     * @tc.desc   Test every() with index-based condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0117";
      try {
        let arr: FixedArray<int> = [0, 2, 4, 6];
        let result = every(arr, (value, index) => value === index * 2);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11800
     * @tc.name   testBuiltinArrayEvery0118
     * @tc.desc   Test every() with all elements not meeting the condition
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0118";
      try {
        let arr: FixedArray<int> = [1, 3, 5, 7];
        let result = every(arr, (value) => value % 2 === 0);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_11900
     * @tc.name   testBuiltinArrayEvery0119
     * @tc.desc   Test every() with index-based comparison
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0119";
      try {
        let arr: FixedArray<int> = [10, 20, 30, 40];
        let result = every(arr, (value, index) => value === (index + 1) * 10);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_12000
     * @tc.name   testBuiltinArrayEvery0120
     * @tc.desc   Test every() with array reference usage in predicate
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0120";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4];
        let result = every(arr, (value, _, array) => value <= array.length);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_12100
     * @tc.name   testBuiltinArrayEvery0121
     * @tc.desc   Test every() with all elements passing a range check
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0121";
      try {
        let arr: FixedArray<int> = [5, 7, 9, 11];
        let result = every(arr, (value) => value >= 5 && value <= 15);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_12200
     * @tc.name   testBuiltinArrayEvery0122
     * @tc.desc   Test every() with one element failing a modulus check
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0122";
      try {
        let arr: FixedArray<int> = [10, 15, 20, 25, 27];
        let result = every(arr, (value) => value % 5 === 0);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_12300
     * @tc.name   testBuiltinArrayEvery0123
     * @tc.desc   Test every() with all elements passing a string conversion check
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0123";
      try {
        let arr: FixedArray<int> = [1, 2, 3, 4];
        let result = every(arr, (value) => String(value).length === 1);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_12400
     * @tc.name   testBuiltinArrayEvery0124
     * @tc.desc   Test every() with all elements passing a bitwise check
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0124";
      try {
        let arr: FixedArray<int> = [3, 7, 15, 31];
        let result = every(arr, (value) => (value & (value + 1)) === 0);
        expect(result).assertEqual(true);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number COMMONLIBRARY_UTIL_BASE_EVERY_12500
     * @tc.name   testBuiltinArrayEvery0125
     * @tc.desc   Test every() with all elements failing a comparison check
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testBuiltinArrayEvery0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testBuiltinArrayEvery0125";
      try {
        let arr: FixedArray<int> = [100, 200, 300];
        let result = every(arr, (value) => value < 100);
        expect(result).assertEqual(false);
      } catch (err) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}