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


export default function BuiltinsAsUintNTest() {
  describe('BuiltinsAsUintNTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
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
     * @tc.name   BuiltinsAsUintNTest0100
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0100';
      console.info(`${caseName} test start`);
      const bits = 1;
      const int = 0n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest0200
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0200';
      console.info(`${caseName} test start`);
      const bits = 1;
      const int = 1n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(1n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest0300
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0300';
      console.info(`${caseName} test start`);
      const bits = 8;
      const int = 128n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(128n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest0400
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0400';
      console.info(`${caseName} test start`);
      const bits = 8;
      const int = 256n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest0500
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0500';
      console.info(`${caseName} test start`);
      const bits = 16;
      const int = 32767n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(32767n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest0600
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0600';
      console.info(`${caseName} test start`);
      const bits = 16;
      const int = 32768n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(32768n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest0700
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0700';
      console.info(`${caseName} test start`);
      const bits = 16;
      const int = 65535n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(65535n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest0800
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0800';
      console.info(`${caseName} test start`);
      const bits = 16;
      const int = 65536n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest0900
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0900';
      console.info(`${caseName} test start`);
      const bits = 16;
      const int = -1n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(65535n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1000
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1000';
      console.info(`${caseName} test start`);
      const bits = 16;
      const int = -32768n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(32768n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1100
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1100';
      console.info(`${caseName} test start`);
      const bits = 32;
      const int = 2147483647n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(2147483647n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1200
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1200';
      console.info(`${caseName} test start`);
      const bits = 32;
      const int = 2147483648n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(2147483648n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1300
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1300';
      console.info(`${caseName} test start`);
      const bits = 32;
      const int = 4294967295n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(4294967295n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1400
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1400';
      console.info(`${caseName} test start`);
      const bits = 32;
      const int = 4294967296n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1500
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1500';
      console.info(`${caseName} test start`);
      const bits = 32;
      const int = -1n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(4294967295n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1600
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1600';
      console.info(`${caseName} test start`);
      const bits = 32;
      const int = -2147483648n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(2147483648n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1700
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1700';
      console.info(`${caseName} test start`);
      const bits = 64;
      const int = 9223372036854775807n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(9223372036854775807n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1800
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1800';
      console.info(`${caseName} test start`);
      const bits = 64;
      const int = 9223372036854775808n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(9223372036854775808n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest1900
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1900';
      console.info(`${caseName} test start`);
      const bits = 64;
      const int = 18446744073709551615n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(18446744073709551615n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2000
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2000';
      console.info(`${caseName} test start`);
      const bits = 64;
      const int = 18446744073709551616n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2100
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2100';
      console.info(`${caseName} test start`);
      const bits = 64;
      const int = -1n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(18446744073709551615n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2200
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2200';
      console.info(`${caseName} test start`);
      const bits = 64;
      const int = -9223372036854775808n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(9223372036854775808n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2300
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2300';
      console.info(`${caseName} test start`);
      const bits: number = 0;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2400
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2400';
      console.info(`${caseName} test start`);
      const bits: number = -8;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2500
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2500';
      console.info(`${caseName} test start`);
      const bits: number = -0;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2600
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2600';
      console.info(`${caseName} test start`);
      const bits: number = NaN;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2700
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2700';
      console.info(`${caseName} test start`);
      const bits: number = Infinity;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2800
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2800';
      console.info(`${caseName} test start`);
      const bits: number = -Infinity;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest2900
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2900';
      console.info(`${caseName} test start`);
      const bits: number = Math.floor(1.5);
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(1n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3000
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3000';
      console.info(`${caseName} test start`);
      const bits: number = Number.MAX_VALUE;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3100
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3100';
      console.info(`${caseName} test start`);
      const bits: number = Number.MIN_VALUE;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3200
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3200';
      console.info(`${caseName} test start`);
      const bits: number = Number.EPSILON;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3300
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3300';
      console.info(`${caseName} test start`);
      const bits: number = 0x0102;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3400
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3400';
      console.info(`${caseName} test start`);
      const bits: number = 0x01020304;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3500
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3500';
      console.info(`${caseName} test start`);
      const bits: number = 0x3;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(3n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3600
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3600';
      console.info(`${caseName} test start`);
      const bits: number = 0x3E800000;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3700
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3700';
      console.info(`${caseName} test start`);
      const bits: number = 123.456;
      const int: bigint = 123n;
      let result: bigint = 123n;
      try {
        result = BigInt.asUintN(bits, int);
        console.log("result:" + result);
      } catch (error) {
        console.error(`An error occurred: ${error}`);
      }
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3800
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3800
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3800';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = 127n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(127n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest3900
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_3900
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest3900';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = 255n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(255n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest4000
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_4000
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest4000';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = -1n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(255n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest4100
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_4100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest4100';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = -128n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(128n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest4200
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_4200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest4200';
      console.info(`${caseName} test start`);
      const bits: number = 8;
      const int: bigint = 0n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest4300
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_4300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest4300';
      console.info(`${caseName} test start`);
      const bits: number = 16;
      const int: bigint = 0n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest4400
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_4400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest4400';
      console.info(`${caseName} test start`);
      const bits: number = 32;
      const int: bigint = 0n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest4500
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_4500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest4500';
      console.info(`${caseName} test start`);
      const bits: number = 64;
      const int: bigint = 0n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest4600
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_4600
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest4600';
      console.info(`${caseName} test start`);
      const bits: number = 64;
      const int: bigint = 123456789012345678901234567890n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(14083847773837265618n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsAsUintNTest4700
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_4700
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsAsUintNTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest4700';
      console.info(`${caseName} test start`);
      const bits: number = 64;
      const int: bigint = -123456789012345678901234567890n;
      const result = BigInt.asUintN(bits, int);
      console.log("result:" + result);
      expect(result).assertEqual(4362896299872285998n);
      console.info(`${caseName} test end`);
      Done();
    });

  })
}