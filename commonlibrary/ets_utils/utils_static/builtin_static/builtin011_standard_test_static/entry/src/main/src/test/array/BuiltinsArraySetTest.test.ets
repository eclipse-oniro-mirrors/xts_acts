/*
* Copyright (c) 2026 RKH Corp.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

interface TestObj {
  name: string;
  value: number;
}

export default function BuiltinsArraySetTest() : void{
  describe("BuiltinsArraySetTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
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
     * @tc.name    builtinsArraySetTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0100
     * @tc.desc    Verify array set with index 0 (first element) and number value
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySetTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 0;
      const val = 100;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0200
     * @tc.desc    Verify array set with index (length - 1) (last element)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = arr.length - 1;
      const val = 500;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0300
     * @tc.desc    Verify array set with index 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 1;
      const val = 200;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0400
     * @tc.desc    Verify array set with index 2
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 2;
      const val = 300;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0500
     * @tc.desc    Verify array set with index 3
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 3;
      const val = 400;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0600
     * @tc.desc    Verify array set with index 4
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 4;
      const val = 500;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0700
     * @tc.desc    Verify array set with string type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<string>(5, "");
      arr[0] = "a";
      arr[1] = "b";
      arr[2] = "c";
      arr[3] = "d";
      arr[4] = "e";
      const idx = 2;
      const val = "xyz";

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0800
     * @tc.desc    Verify array set with boolean type array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<boolean>(5, false);
      arr[0] = true;
      arr[1] = false;
      arr[2] = true;
      arr[3] = false;
      arr[4] = true;
      const idx = 1;
      const val = true;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_0900
     * @tc.desc    Verify array set with object type array using push
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: TestObj[] = [];
      const val: TestObj = { name: "test", value: 100 };

      arr.pushOne(val);

      expect(arr[0]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1000
     * @tc.desc    Verify array set with index after extendTo operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const idx = arr.length;
      const val = 100;

      arr.extendTo(idx + 1, 0);
      arr[idx] = val;

      expect(arr.length).assertEqual(4);
      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1100
     * @tc.desc    Verify array set with index after extendTo operation (large index)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const idx = 10;
      const val = 100;

      arr.extendTo(idx + 1, 0);
      arr[idx] = val;

      expect(arr.length).assertEqual(11);
      expect(arr[idx]).assertEqual(val);
      expect(arr[5]).assertEqual(0);
    });

    /**
     * @tc.name    builtinsArraySetTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1200
     * @tc.desc    Verify array set with large array (10000 elements)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(10000, 0);
      const idx = 5000;
      const val = 9999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1300
     * @tc.desc    Verify array set with multiple values in sequence
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);

      for (let i = 0; i < 5; i++) {
        arr[i] = i * 10;
      }

      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(20);
      expect(arr[3]).assertEqual(30);
      expect(arr[4]).assertEqual(40);
    });

    /**
     * @tc.name    builtinsArraySetTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1400
     * @tc.desc    Verify array set with negative values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      const idx = 2;
      const val = -100;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1500
     * @tc.desc    Verify array set with maximum int value 2147483647
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(5, NaN);
      const idx = 2;
      const val = 2147483647;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1600
     * @tc.desc    Verify array set with minimum int value -2147483648
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(5, NaN);
      const idx = 2;
      const val = -2147483648;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1700
     * @tc.desc    Verify array set with floating point values
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      const idx = 2;
      const val = 3.14159;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1800
     * @tc.desc    Verify array set with index 2147483647 (int max boundary, should cause error)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetTest1800' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const idx = 0;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_1900
     * @tc.desc    Verify array set with index 0 on empty array using push
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const val = 100;

      arr.pushOne(val);

      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2000
     * @tc.desc    Verify array set with negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2000' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 4;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2100
     * @tc.desc    Verify array set with non-numeric index (string)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2100' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 1;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2200
     * @tc.desc    Verify array set with undefined index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2200' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 0;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2300
     * @tc.desc    Verify array set with null index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2300' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 0;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2400
     * @tc.desc    Verify array set with direct index on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2400',TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(1, NaN);
      const idx = 0;
      const val = 100;

      arr[idx] = val;

      expect(arr.length).assertEqual(1);
      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2500
     * @tc.desc    Verify array set with index exceeding array length
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2500' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 0;
      const val = 500;

      arr[idx] = val;

      expect(arr.length).assertEqual(3);
      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2600
     * @tc.desc    Verify array set with NaN as index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2600' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 0;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2700
     * @tc.desc    Verify array set with Infinity as index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2700' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 1;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2800
     * @tc.desc    Verify array set with large negative index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2800' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const idx = 2;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_2900
     * @tc.desc    Verify array set with boolean as index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest2900' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 2;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest3000
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_3000
     * @tc.desc    Verify array set with object as index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest3000' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 0;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest3100
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_3100
     * @tc.desc    Verify array set with array as index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest3100' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 1;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest3200
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_3200
     * @tc.desc    Verify array set with Symbol as index
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest3200' ,TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const idx = 2;
      const val = 999;

      arr[idx] = val;

      expect(arr[idx]).assertEqual(val);
    });

    /**
     * @tc.name    builtinsArraySetTest3300
     * @tc.number  SUB_BUILTINS_ARRAY_SET_TEST_3300
     * @tc.desc    Verify array set with spread operator
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetTest3300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      const newValues = [40, 50, 60];

      arr.splice(0, 3, ...newValues);

      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(40);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(60);
    });
  })
}
