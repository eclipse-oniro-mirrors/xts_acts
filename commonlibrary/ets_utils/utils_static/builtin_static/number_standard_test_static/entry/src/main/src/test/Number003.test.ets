/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import  Utils  from "./Util.test";

export default function BuiltinsNumberIsIntegerTest() {
  describe('BuiltinsNumberIsIntegerTest', () => {
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
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0100
     * @tc.name builtinsNumberIsIntegerTest0100
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest0100';
      console.log(`${caseName} test start`);
      const num = Number.isInteger(0);
      console.log(`${num}`);
      expect(true).assertEqual(num);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0200
     * @tc.name builtinsNumberIsIntegerTest0200
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest0200';
      console.log(`${caseName} test start`);
      const num1 = Number.isInteger(1);
      console.log(`${num1}`);
      expect(true).assertEqual(num1);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0300
     * @tc.name builtinsNumberIsIntegerTest0300
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest0300';
      console.log(`${caseName} test start`);
      const num2 = Number.isInteger(-100000);
      console.log(`${num2}`);
      expect(true).assertEqual(num2);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0400
     * @tc.name builtinsNumberIsIntegerTest0400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    // it('builtinsNumberIsIntegerTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
    //   const caseName = 'builtinsNumberIsIntegerTest0400';
    //   console.log(`${caseName} test start`);
    //   const num3 = Number.isInteger(999999999999999999999999999999999999n);
    //   console.log(`${num3}`);
    //   expect(true).assertEqual(num3);
    //   console.log(`${caseName} test end`);
    //   Done();
    // })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0500
     * @tc.name builtinsNumberIsIntegerTest0500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest0500';
      console.log(`${caseName} test start`);
      const num4 = Number.isInteger(0.1);
      console.log(`${num4}`);
      expect(false).assertEqual(num4);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0600
     * @tc.name builtinsNumberIsIntegerTest0600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest0600';
      console.log(`${caseName} test start`);
      const num5 = Number.isInteger(Math.PI);
      console.log(`${num5}`);
      expect(false).assertEqual(num5);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0700
     * @tc.name builtinsNumberIsIntegerTest0700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest0700';
      console.log(`${caseName} test start`);
      const num6 = Number.isInteger(NaN);
      console.log(`${num6}`);
      expect(false).assertEqual(num6);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0800
     * @tc.name builtinsNumberIsIntegerTest0800
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest0800';
      console.log(`${caseName} test start`);
      const num7 = Number.isInteger(Infinity);
      console.log(`${num7}`);
      expect(false).assertEqual(num7);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_0900
     * @tc.name builtinsNumberIsIntegerTest0900
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest0900';
      console.log(`${caseName} test start`);
      const num8 = Number.isInteger(-Infinity);
      console.log(`${num8}`);
      expect(false).assertEqual(num8);
      console.log(`${caseName} test end`);
      Done();
    })












    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_1400
     * @tc.name builtinsNumberIsIntegerTest1400
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest1400';
      console.log(`${caseName} test start`);
      const num13 = Number.isInteger(5.0);
      console.log(`${num13}`);
      expect(true).assertEqual(num13);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_1500
     * @tc.name builtinsNumberIsIntegerTest1500
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest1500';
      console.log(`${caseName} test start`);
      const num14 = Number.isInteger(5.000000000000001);
      console.log(`${num14}`);
      expect(false).assertEqual(num14);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_1600
     * @tc.name builtinsNumberIsIntegerTest1600
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest1600';
      console.log(`${caseName} test start`);
      const num15 = Number.isInteger(5.0000000000000001);
      console.log(`${num15}`);
      expect(true).assertEqual(num15);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_NUMBER_ISINTEGER_TEST_1700
     * @tc.name builtinsNumberIsIntegerTest1700
     * @tc.desc Testing Task
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNumberIsIntegerTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,  async (Done: () => void): Promise<void> => {
      const caseName = 'builtinsNumberIsIntegerTest1700';
      console.log(`${caseName} test start`);
      const num16 = Number.isInteger(4500000000000000.1);
      console.log(`${num16}`);
      expect(true).assertEqual(num16);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}