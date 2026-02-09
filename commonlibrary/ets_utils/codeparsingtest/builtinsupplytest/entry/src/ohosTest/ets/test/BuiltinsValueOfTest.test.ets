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

export default function BuiltinsValueOfTest() {
  describe('BuiltinsValueOfTest', () => {
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
     * @tc.name   BuiltinsValueOfTest0100
     * @tc.number SUB_BUILTINS_VALUEOF_TEST_0100
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsValueOfTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'BuiltinsValueOfTest0100';
      console.info(`${caseName} test start`);
      const bigIntValue = 123n;
      const bigIntObject: BigInt = Object(bigIntValue);
      const getOriginalBigIntValue = (bigIntObj: BigInt): bigint => {
        return bigIntObj.valueOf();
      };
      const result: bigint = getOriginalBigIntValue(bigIntObject);
      console.log("result:",result);
      expect(result).assertEqual(123n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsValueOfTest0200
     * @tc.number SUB_BUILTINS_VALUEOF_TEST_0200
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsValueOfTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'BuiltinsValueOfTest0200';
      console.info(`${caseName} test start`);
      const bigIntValue = -456n;
      const bigIntObject: BigInt = Object(bigIntValue);
      const getOriginalBigIntValue = (bigIntObj: BigInt): bigint => {
        return bigIntObj.valueOf();
      };
      const result: bigint = getOriginalBigIntValue(bigIntObject);
      console.log("result:",result);
      expect(result).assertEqual(-456n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsValueOfTest0300
     * @tc.number SUB_BUILTINS_VALUEOF_TEST_0300
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsValueOfTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'BuiltinsValueOfTest0300';
      console.info(`${caseName} test start`);
      const bigIntValue = 0n;
      const bigIntObject: BigInt = Object(bigIntValue);
      const getOriginalBigIntValue = (bigIntObj: BigInt): bigint => {
        return bigIntObj.valueOf();
      };
      const result: bigint = getOriginalBigIntValue(bigIntObject);
      console.log("result:",result);
      expect(result).assertEqual(0n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsValueOfTest0400
     * @tc.number SUB_BUILTINS_VALUEOF_TEST_0400
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsValueOfTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'BuiltinsValueOfTest0400';
      console.info(`${caseName} test start`);
      const bigIntValue = 9999999999999999999999999999999n;
      const bigIntObject: BigInt = Object(bigIntValue);
      const getOriginalBigIntValue = (bigIntObj: BigInt): bigint => {
        return bigIntObj.valueOf();
      };
      const result: bigint = getOriginalBigIntValue(bigIntObject);
      console.log("result:",result);
      expect(result).assertEqual(9999999999999999999999999999999n);
      console.info(`${caseName} test end`);
      Done();
    });


    /**
     * @tc.name   BuiltinsValueOfTest0500
     * @tc.number SUB_BUILTINS_VALUEOF_TEST_0500
     * @tc.desc   test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsValueOfTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:Function) => {
      const caseName = 'BuiltinsValueOfTest0500';
      console.info(`${caseName} test start`);
      const bigIntValue = -9999999999999999999999999999999n;
      const bigIntObject: BigInt = Object(bigIntValue);
      const getOriginalBigIntValue = (bigIntObj: BigInt): bigint => {
        return bigIntObj.valueOf();
      };
      const result: bigint = getOriginalBigIntValue(bigIntObject);
      console.log("result:",result);
      expect(result).assertEqual(-9999999999999999999999999999999n);
      console.info(`${caseName} test end`);
      Done();
    });

  })
}