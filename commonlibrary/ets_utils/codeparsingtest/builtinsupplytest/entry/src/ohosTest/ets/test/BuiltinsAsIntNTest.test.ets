/*
* Copyright (C) 2025 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Level, Size } from "@ohos/hypium";
import { sleep } from '../testability/pages/Utils';


export default function BuiltinsAsIntNTest() {
  describe('BuiltinsAsIntNTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   BuiltinsAsIntNTest0100
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0100';
      console.info(`${caseName} test start`);
      const bits: number = 1;
      const int: bigint = 0n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest0200
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0200';
      console.info(`${caseName} test start`);
      const bits: number = 1;
      const int: bigint = 1n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(-1n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest0300
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0300';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = 127n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(127n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest0400
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0400';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = 128n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(-128n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest0500
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0500';
      console.info(`${caseName} test start`);
      const bits: number = 16;
      const int: bigint = 32767n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(32767n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest0600
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0600';
      console.info(`${caseName} test start`);
      const bits: number = 16;
      const int: bigint = -32768n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(-32768n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest0700
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0700';
      console.info(`${caseName} test start`);
      const bits: number = 32;
      const int: bigint = 2147483647n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(2147483647n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest0800
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0800';
      console.info(`${caseName} test start`);
      const bits: number = 32;
      const int: bigint = 2147483648n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(-2147483648n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest0900
     * @tc.number SUB_BUILTINS_ASINTN_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest0900';
      console.info(`${caseName} test start`);
      const bits: number = 64;
      const int: bigint = 9223372036854775807n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(9223372036854775807n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1000
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1000';
      console.info(`${caseName} test start`);
      const bits: number = 64;
      const int: bigint = 9223372036854775808n;
      const result: bigint = BigInt.asIntN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(-9223372036854775808n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1100
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1100';
      console.info(`${caseName} test start`);
      const bits: number = 0;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1200
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1200';
      console.info(`${caseName} test start`);
      const bits: number = -8;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1300
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1300';
      console.info(`${caseName} test start`);
      const bits: number = -0;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1400
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1400';
      console.info(`${caseName} test start`);
      const bits: number = NaN;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1500
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1500';
      console.info(`${caseName} test start`);
      const bits: number = Infinity;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1600
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1600';
      console.info(`${caseName} test start`);
      const bits: number = -Infinity;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1700
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1700';
      console.info(`${caseName} test start`);
      const bits: number = Math.floor(1.5);
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(-1n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1800
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1800';
      console.info(`${caseName} test start`);
      const bits: number = Number.MAX_VALUE;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest1900
     * @tc.number SUB_BUILTINS_ASINTN_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest1900';
      console.info(`${caseName} test start`);
      const bits: number = Number.MIN_VALUE;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2000
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2000';
      console.info(`${caseName} test start`);
      const bits: number = Number.EPSILON;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2100
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2100';
      console.info(`${caseName} test start`);
      const bits: number = 0x0102;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2200
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2200';
      console.info(`${caseName} test start`);
      const bits: number = 0x01020304;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2300
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2300';
      console.info(`${caseName} test start`);
      const bits: number = 0x3;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(3n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2400
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2400';
      console.info(`${caseName} test start`);
      const bits: number = 0x3E800000;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2500
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2500';
      console.info(`${caseName} test start`);
      const bits: number = 123.456;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2600
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2600';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = 127n;
      let result: bigint = 0n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(127n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2700
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2700';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = 255n;
      let result: bigint = 0n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(-1n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2800
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2800';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = -128n;
      let result: bigint = 0n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(-128n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest2900
     * @tc.number SUB_BUILTINS_ASINTN_TEST_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest2900';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = -129n;
      let result: bigint = 0n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(127n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest3000
     * @tc.number SUB_BUILTINS_ASINTN_TEST_3000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest3000';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = 0n;
      let result: bigint = 0n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest3100
     * @tc.number SUB_BUILTINS_ASINTN_TEST_3100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest3100';
      console.info(`${caseName} test start`);
      const bits: number = 64;
      const int: bigint = 123456789012345678901234567890n;
      let result: bigint = 0n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(-4362896299872285998n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsIntNTest3200
     * @tc.number SUB_BUILTINS_ASINTN_TEST_3200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsIntNTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsIntNTest3200';
      console.info(`${caseName} test start`);
      const bits: number = 64;
      const int: bigint = -123456789012345678901234567890n;
      let result: bigint = 0n;
      try {
        result = BigInt.asIntN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(4362896299872285998n);
      console.info(`${caseName} test end`);
      Done();
    });

  })
}