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

export default function ForEachTest() {
  describe("ForEachTest", (): void => {
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
     * @tc.number FOR_EACH_0200
     * @tc.name   testForEachbyte0002
     * @tc.desc   Test the forEach operation on an empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachbyte0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachbyte0002";
      try {
        const emptyArray: FixedArray<byte> = [] as FixedArray<byte>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0200
     * @tc.name   testForEachnumber0002
     * @tc.desc   Test the forEach behavior of empty FixedArray<number>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0002";
      try {
        let emptyArray: FixedArray<number> = [];
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0300
     * @tc.name   testForEachnumber0003
     * @tc.desc   Test FixedArray<number> containing special values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0003";
      try {
        let specialNumbers: FixedArray<number> = [0, -1, 1.5, 100];
        let results: Array<number> = [];
        forEach(specialNumbers, (value: number) => {
          results.push(value);
        });
        const expected = [0, -1, 1.5, 100];
        expect(results.length).assertEqual(expected.length);
        for (let i = 0; i < expected.length; i++) {
          expect(results[i]).assertEqual(expected[i]);
        }
      } catch (err: BusinessError) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_NUMBER_0500
     * @tc.name   testForEachnumber0005
     * @tc.desc   Testing forEach with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachnumber0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachnumber0005";
      try {
        let arr: FixedArray<number> = [];
        let count = 0;
        forEach(arr, () => {
          count++;
        });
        expect(count).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0100
     * @tc.name   testForEachdouble0001
     * @tc.desc   Test empty double precision floating-point array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachdouble0001";
      try {
        const emptyArray: FixedArray<double> = [] as FixedArray<double>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0200
     * @tc.name   testForEachdouble0002
     * @tc.desc   Testing Double Precision Floating Point Boundary Value Processing
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0002', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachdouble0002";
      try {
        const arr: FixedArray<double> = [
          Number.MIN_VALUE,
          Number.MAX_VALUE,
          Number.POSITIVE_INFINITY,
          Number.NEGATIVE_INFINITY
        ] as FixedArray<double>;
        const results: double[] = [];
        forEach(arr, (value) => {
          results.push(value);
        });
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(Number.MIN_VALUE);
        expect(results[1]).assertEqual(Number.MAX_VALUE);
        expect(results[2]).assertEqual(Number.POSITIVE_INFINITY);
        expect(results[3]).assertEqual(Number.NEGATIVE_INFINITY);
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0300
     * @tc.name   testForEachdouble0003
     * @tc.desc   Testing basic forEach functionality with double array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachdouble0003";
      try {
        let arr: FixedArray<double> = [1.1, 2.2, 3.3];
        let sum: double = 0.0;
        forEach(arr, (value: double) => {
          sum += value;
        });
        expect(sum).assertClose(6.6, 0.0001);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0600
     * @tc.name   testForEachdouble0006
     * @tc.desc   Testing forEach with empty double array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachdouble0006";
      try {
        let arr: FixedArray<double> = [];
        let callCount: number = 0;
        forEach(arr, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_DOUBLE_0700
     * @tc.name   testForEachdouble0007
     * @tc.desc   Testing double precision handling in forEach
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachdouble0007', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachdouble0007";
      try {
        let arr: FixedArray<double> = [0.3, 0.3333333333333333, 3.141592653589793];
        let results: Array<double> = new Array<double>(arr.length);
        let index = 0;
        forEach(arr, (value: double) => {
          results[index++] = value;
        });
        expect(results[0]).assertClose(0.3, 0.0000001);
        expect(results[1]).assertClose(0.333333, 0.000001);
        expect(results[2]).assertClose(3.141593, 0.000001);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0100
     * @tc.name   testForEachfloat0001
     * @tc.desc   Test the basic floating-point array traversal function
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG: string = "testForEachfloat0001";
      try {
        const arr: FixedArray<float> = [1.5 as float, 2.5 as float, 3.5 as float] as FixedArray<float>;
        let sum: float = 0.0 as float;
        forEach(arr, (value: float): void => {
          sum = (sum + value) as float;
        });
        expect(Math.abs(sum - 7.5) < 0.0001).assertTrue();
      } catch (err: BusinessError) {
        console.error(`${TAG} failed: ${err.message}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0300
     * @tc.name   testForEachfloat0003
     * @tc.desc   Test empty single precision floating-point array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachfloat0003";
      try {
        const emptyArray: FixedArray<float> = [] as FixedArray<float>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0400
     * @tc.name   testForEachfloat004
     * @tc.desc   Verify basic iteration over float array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachfloat004";
      try {
        let arr: FixedArray<float> = [1.5f, 2.5f, 3.5f];
        let sum: number = 0.0;
        forEach(arr, (value: float) => {
          sum += value as number;
        });
        expect(sum).assertClose(7.5, 0.000001);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0700
     * @tc.name   testForEachfloat007
     * @tc.desc   Verify behavior with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachfloat007";
      try {
        let arr: FixedArray<float> = [];
        let callCount: number = 0;
        forEach(arr, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_FLOAT_0800
     * @tc.name   testForEachfloat008
     * @tc.desc   Verify float precision handling
     * @tc.size   LARGETEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachfloat008', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachfloat008";
      try {
        let arr: FixedArray<float> = [0.5f, 1.5f, 2.5f];
        let sum: float = 0.0f;
        forEach(arr, (value: float) => {
          sum += value;
        });
        expect(sum as number).assertClose(4.5, 0.000001);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_INT_0100
     * @tc.name   testForEachint007
     * @tc.desc   Verify behavior with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachint007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachint007";
      try {
        let arr: FixedArray<int> = [];
        let callCount: number = 0;
        forEach(arr, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_LONG_0200
     * @tc.name   testForEachlong002
     * @tc.desc   Test the empty length integer array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachlong002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachlong002";
      try {
        const emptyArray: FixedArray<long> = [] as FixedArray<long>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0200
     * @tc.name   testForEachshort002
     * @tc.desc   Test the empty short integer array forEach
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachshort002";
      try {
        const emptyArray: FixedArray<short> = [] as FixedArray<short>;
        let callCount = 0;
        forEach(emptyArray, () => {
          callCount++;
        });
        expect(callCount).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0300
     * @tc.name   testForEachshort003
     * @tc.desc   Test negative short integer array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testForEachshort003";
      try {
        const negativeArray: FixedArray<short> = [-100, -200, -300] as FixedArray<short>;
        let sum = 0;
        forEach(negativeArray, (value: short) => {
          sum += value;
        });
        expect(sum).assertEqual(-600);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail, err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0400
     * @tc.name   testForEachshort0004
     * @tc.desc   Testing basic functionality of forEach with FixedArray<short>
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachshort0004";
      try {
        let arr: FixedArray<short> = [1, 2, 3] as FixedArray<short>;
        let sum: number = 0;
        forEach(arr, (value: short) => {
          sum += value;
        });
        expect(sum).assertEqual(6);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0600
     * @tc.name   testForEachshort0006
     * @tc.desc   Testing forEach with empty array
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachshort0006";
      try {
        let arr: FixedArray<short> = [] as FixedArray<short>;
        let count: number = 0;
        forEach(arr, (value: short) => {
          count++;
        });
        expect(count).assertEqual(0);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number FOR_EACH_SHORT_0700
     * @tc.name   testForEachshort0007
     * @tc.desc   Testing forEach with array containing negative values
     * @tc.size   MEDIUMTEST
     * @tc.type   FUNCTION
     * @tc.level  LEVEL1
     */
    it('testForEachshort0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let TAG = "testForEachshort0007";
      try {
        let arr: FixedArray<short> = [-1, -2, -3] as FixedArray<short>;
        let sum: number = 0;
        forEach(arr, (value: short) => {
          sum += value;
        });
        expect(sum).assertEqual(-6);
      } catch (err: BusinessError) {
        console.error(`${TAG} is fail,err is ${err}`);
        expect().assertFail();
      }
    });
  });
}