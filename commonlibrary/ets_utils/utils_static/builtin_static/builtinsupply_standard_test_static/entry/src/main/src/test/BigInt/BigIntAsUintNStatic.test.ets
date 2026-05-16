/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function BuiltinsAsUintNTest() {
  describe('BuiltinsAsUintNTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach( () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll( async() => {
      await sleep(50);
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0100
     * @tc.name BuiltinsAsUintNTest0100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0100';
      console.info(`${caseName} test start`);
      const bits = 1;
      const num = 0n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0200
     * @tc.name BuiltinsAsUintNTest0200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0200';
      console.info(`${caseName} test start`);
      const bits = 1;
      const num = 1n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(1n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0300
     * @tc.name BuiltinsAsUintNTest0300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0300';
      console.info(`${caseName} test start`);
      const bits = 8;
      const num = 128n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(128n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0400
     * @tc.name BuiltinsAsUintNTest0400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0400';
      console.info(`${caseName} test start`);
      const bits = 8;
      const num = 256n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0500
     * @tc.name BuiltinsAsUintNTest0500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0500';
      console.info(`${caseName} test start`);
      const bits = 16;
      const num = 32767n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(32767n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0600
     * @tc.name BuiltinsAsUintNTest0600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0600';
      console.info(`${caseName} test start`);
      const bits = 16;
      const num = 32768n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(32768n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0700
     * @tc.name BuiltinsAsUintNTest0700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0700';
      console.info(`${caseName} test start`);
      const bits = 16;
      const num = 65535n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(65535n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0800
     * @tc.name BuiltinsAsUintNTest0800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0800';
      console.info(`${caseName} test start`);
      const bits = 16;
      const num = 65536n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_0900
     * @tc.name BuiltinsAsUintNTest0900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest0900';
      console.info(`${caseName} test start`);
      const bits = 16;
      const num = -1n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(65535n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1000
     * @tc.name BuiltinsAsUintNTest1000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1000';
      console.info(`${caseName} test start`);
      const bits = 16;
      const num = -32768n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(32768n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1100
     * @tc.name BuiltinsAsUintNTest1100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1100';
      console.info(`${caseName} test start`);
      const bits = 32;
      const num = 2147483647n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(2147483647n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1200
     * @tc.name BuiltinsAsUintNTest1200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1200';
      console.info(`${caseName} test start`);
      const bits = 32;
      const num = 2147483648n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(2147483648n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1300
     * @tc.name BuiltinsAsUintNTest1300
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1300';
      console.info(`${caseName} test start`);
      const bits = 32;
      const num = 4294967295n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(4294967295n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1400
     * @tc.name BuiltinsAsUintNTest1400
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1400';
      console.info(`${caseName} test start`);
      const bits = 32;
      const num = 4294967296n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1500
     * @tc.name BuiltinsAsUintNTest1500
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1500';
      console.info(`${caseName} test start`);
      const bits = 32;
      const num = -1n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(4294967295n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1600
     * @tc.name BuiltinsAsUintNTest1600
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1600';
      console.info(`${caseName} test start`);
      const bits = 32;
      const num = -2147483648n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(2147483648n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1700
     * @tc.name BuiltinsAsUintNTest1700
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1700';
      console.info(`${caseName} test start`);
      const bits = 64;
      const num = 9223372036854775807n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(9223372036854775807n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1800
     * @tc.name BuiltinsAsUintNTest1800
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1800';
      console.info(`${caseName} test start`);
      const bits = 64;
      const num = 9223372036854775808n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(9223372036854775808n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_1900
     * @tc.name BuiltinsAsUintNTest1900
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest1900';
      console.info(`${caseName} test start`);
      const bits = 64;
      const num = 18446744073709551615n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(18446744073709551615n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2000
     * @tc.name BuiltinsAsUintNTest2000
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2000';
      console.info(`${caseName} test start`);
      const bits = 64;
      const num = 18446744073709551616n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2100
     * @tc.name BuiltinsAsUintNTest2100
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2100';
      console.info(`${caseName} test start`);
      const bits = 64;
      const num = -1n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(18446744073709551615n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });


    /**
     * @tc.number SUB_BUILTINS_ASUINTN_TEST_2200
     * @tc.name BuiltinsAsUintNTest2200
     * @tc.desc test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsAsUintNTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsAsUintNTest2200';
      console.info(`${caseName} test start`);
      const bits = 64;
      const num = -9223372036854775808n;
      const result = BigInt.asUintN(bits, num);
      console.log("result:" + result);
      expect(result).assertEqual(9223372036854775808n);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    });

  })
}
