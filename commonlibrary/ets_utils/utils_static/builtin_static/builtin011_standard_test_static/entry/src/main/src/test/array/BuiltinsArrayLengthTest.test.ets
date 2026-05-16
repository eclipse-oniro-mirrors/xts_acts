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

export default function BuiltinsArrayLengthTest() : void{
  describe("BuiltinsArrayLengthTest", () => {
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
     * @tc.name    builtinsArrayLengthTest0100
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0100
     * @tc.desc    Verify length getter with empty array (Level0 smoke test)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArrayLengthTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr: number[] = Array.create<number>(0, 0);

      const result = arr.length;
      const expected = 0;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest0200
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0200
     * @tc.desc    Verify length getter with array created by length parameter
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);

      const result = arr.length;
      const expected = 5;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest0300
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0300
     * @tc.desc    Verify length getter with array created by elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;

      const result = arr.length;
      const expected = 5;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest0400
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0400
     * @tc.desc    Verify length getter after push operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);

      const result = arr.length;
      const expected = 3;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest0500
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0500
     * @tc.desc    Verify length getter after pop operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      arr.pop();
      arr.pop();

      const result = arr.length;
      const expected = 3;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest0600
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0600
     * @tc.desc    Verify length getter after shift operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      arr.shift();
      arr.shift();

      const result = arr.length;
      const expected = 3;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest0700
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0700
     * @tc.desc    Verify length getter after unshift operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr.unshift(0);
      arr.unshift(-1, -2);

      const result = arr.length;
      const expected = 5;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest0800
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0800
     * @tc.desc    Verify length getter after splice operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      arr.splice(1, 2, 10, 20, 30);

      const result = arr.length;
      const expected = 6;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest0900
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_0900
     * @tc.desc    Verify length getter after delete operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      arr.length = 3;

      const result = arr.length;
      const expected = 3;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest1000
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_1000
     * @tc.desc    Verify length getter after extendTo operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr.extendTo(6, 0);

      const result = arr.length;
      const expected = 6;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest1100
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_1100
     * @tc.desc    Verify length getter after shrinkTo operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      arr.shrinkTo(2);

      const result = arr.length;
      const expected = 2;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest1200
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_1200
     * @tc.desc    Verify length getter after pushArray operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(2, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr.pushArray(3, 4, 5, 6);

      const result = arr.length;
      const expected = 6;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest1300
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_1300
     * @tc.desc    Verify length getter after fill operation
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArrayLengthTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, NaN);
      arr.fill(0);

      const result = arr.length;
      const expected = 5;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArrayLengthTest1400
     * @tc.number  SUB_BUILTINS_ARRAY_LENGTH_TEST_1400
     * @tc.desc    Verify length getter with large array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArrayLengthTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(10000, 0);
      for (let i = 0; i < 10000; i++) {
        arr[i] = i;
      }

      const result = arr.length;
      const expected = 10000;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArraySetLengthTest1500
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_1500
     * @tc.desc    Verify set length with parameter newLen = 0
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL0
     */
    it('builtinsArraySetLengthTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const newLen = 0;

      arr.length = newLen;
      const result = arr.length;
      const expected = newLen;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArraySetLengthTest1600
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_1600
     * @tc.desc    Verify set length with parameter newLen = 5
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(10, 0);
      for (let i = 0; i < 10; i++) {
        arr[i] = i + 1;
      }
      const newLen = 5;

      arr.length = newLen;
      const result = arr.length;
      const expected = newLen;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArraySetLengthTest1700
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_1700
     * @tc.desc    Verify set length with parameter newLen = current length (5)
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const newLen = arr.length;

      arr.length = newLen;
      const result = arr.length;
      const expected = 5;

      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name    builtinsArraySetLengthTest1800
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_1800
     * @tc.desc    Verify set length with parameter newLen = 5 (greater than current length 3) should throw RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const newLen = 5;
      let errorThrown = false;

      try {
        arr.length = newLen;
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertTrue();
        expect(e.message).assertEqual("can't change length to bigger or negative");
      }

      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsArraySetLengthTest1900
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_1900
     * @tc.desc    Verify set length with parameter newLen = -1 (negative) should throw RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const newLen = -1;
      let errorThrown = false;

      try {
        arr.length = newLen;
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertTrue();
        expect(e.message).assertEqual("can't change length to bigger or negative");
      }

      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsArraySetLengthTest2000
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2000
     * @tc.desc    Verify set length with parameter newLen = -2147483648 (int min boundary) should throw RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const newLen = -2147483648;
      let errorThrown = false;

      try {
        arr.length = newLen;
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertTrue();
        expect(e.message).assertEqual("can't change length to bigger or negative");
      }

      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsArraySetLengthTest2100
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2100
     * @tc.desc    Verify set length with parameter newLen = 2147483647 (int max boundary) greater than current length should throw RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const newLen = 2147483647;
      let errorThrown = false;

      try {
        arr.length = newLen;
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertTrue();
        expect(e.message).assertEqual("can't change length to bigger or negative");
      }

      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsArraySetLengthTest2200
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2200
     * @tc.desc    Verify set length with parameter newLen = 3 and verify elements are truncated
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      arr[4] = 50;
      const newLen = 3;

      arr.length = newLen;

      expect(arr.length).assertEqual(newLen);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);

    });

    /**
     * @tc.name    builtinsArraySetLengthTest2300
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2300
     * @tc.desc    Verify set length with parameter newLen = 1
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const newLen = 1;

      arr.length = newLen;
      const result = arr.length;
      const expected = newLen;

      expect(result).assertEqual(expected);
      expect(arr[0]).assertEqual(1);

    });

    /**
     * @tc.name    builtinsArraySetLengthTest2400
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2400
     * @tc.desc    Verify set length with multiple parameters: newLen = 8, then 5, then 2
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetLengthTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(10, 0);
      for (let i = 0; i < 10; i++) {
        arr[i] = i + 1;
      }

      let newLen = 8;
      arr.length = newLen;
      expect(arr.length).assertEqual(newLen);

      for (let i = 0; i < newLen; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }

      newLen = 5;
      arr.length = newLen;
      expect(arr.length).assertEqual(newLen);

      for (let i = 0; i < newLen; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }

      newLen = 2;
      arr.length = newLen;
      expect(arr.length).assertEqual(newLen);

      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.name    builtinsArraySetLengthTest2500
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2500
     * @tc.desc    Verify set length with parameter newLen = 0 and then push new elements
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetLengthTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(5, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      arr[3] = 4;
      arr[4] = 5;
      const newLen = 0;

      arr.length = newLen;
      expect(arr.length).assertEqual(newLen);

      arr.pushOne(100);
      arr.pushOne(200);

      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.name    builtinsArraySetLengthTest2600
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2600
     * @tc.desc    Verify set length with parameter newLen = 3, then try to set to larger value 5 should throw RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetLengthTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(10, 0);
      for (let i = 0; i < 10; i++) {
        arr[i] = i + 1;
      }

      let newLen = 3;
      arr.length = newLen;
      expect(arr.length).assertEqual(newLen);

      let errorThrown = false;
      try {
        arr.length = 5;
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertTrue();
        expect(e.message).assertEqual("can't change length to bigger or negative");
      }

      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsArraySetLengthTest2700
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2700
     * @tc.desc    Verify set length with parameter newLen = -2147483647 (close to min int boundary) should throw RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetLengthTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const newLen = -2147483647;
      let errorThrown = false;

      try {
        arr.length = newLen;
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertTrue();
        expect(e.message).assertEqual("can't change length to bigger or negative");
      }

      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsArraySetLengthTest2800
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2800
     * @tc.desc    Verify set length with parameter newLen = 2147483646 (close to max int boundary) greater than current length should throw RangeError
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL2
     */
    it('builtinsArraySetLengthTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const arr = Array.create<number>(3, 0);
      arr[0] = 1;
      arr[1] = 2;
      arr[2] = 3;
      const newLen = 2147483646;
      let errorThrown = false;

      try {
        arr.length = newLen;
      } catch (e) {
        errorThrown = true;
        expect(e instanceof RangeError).assertTrue();
        expect(e.message).assertEqual("can't change length to bigger or negative");
      }

      expect(errorThrown).assertTrue();
    });

    /**
     * @tc.name    builtinsArraySetLengthTest2900
     * @tc.number  SUB_BUILTINS_ARRAY_SET_LENGTH_TEST_2900
     * @tc.desc    Verify set length with parameter newLen = 0 on empty array
     * @tc.type    FUNCTION
     * @tc.size    SMALLTEST
     * @tc.level   LEVEL1
     */
    it('builtinsArraySetLengthTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const arr: number[] = Array.create<number>(0, 0);
      const newLen = 0;

      arr.length = newLen;
      const result = arr.length;
      const expected = newLen;

      expect(result).assertEqual(expected);
    });
  })
}