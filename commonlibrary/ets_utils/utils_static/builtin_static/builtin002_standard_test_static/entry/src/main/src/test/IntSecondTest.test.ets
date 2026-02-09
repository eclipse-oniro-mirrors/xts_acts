/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function IntSecondTest() {
  describe('IntSecondTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(100)
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })


    /**
     * @tc.number INT_SECOND_TEST_0100
     * @tc.name IntSecondTest0100
     * @tc.desc test Int.valueOf(value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0100'
        console.info(`${caseName}, test start`);
        const result = Int.valueOf(0);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_0200
     * @tc.name IntSecondTest0200
     * @tc.desc test Int.valueOf(value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0200'
        console.info(`${caseName}, test start`);
        const result = Int.valueOf(10);
        expect(result).assertEqual(10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_0300
     * @tc.name IntSecondTest0300
     * @tc.desc test Int.valueOf(value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0300'
        console.info(`${caseName}, test start`);
        const result = Int.valueOf(-10);
        expect(result).assertEqual(-10);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_0400
     * @tc.name IntSecondTest0400
     * @tc.desc test Int.valueOf(value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0400'
        console.info(`${caseName}, test start`);
        const result = Int.valueOf(Int.MAX_VALUE);
        expect(result).assertEqual(Int.MAX_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_0500
     * @tc.name IntSecondTest0500
     * @tc.desc test Int.valueOf(value: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0500'
        console.info(`${caseName}, test start`);
        const result = Int.valueOf(Int.MIN_VALUE);
        expect(result).assertEqual(Int.MIN_VALUE);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_0600
     * @tc.name IntSecondTest0600
     * @tc.desc test Int.sub(other: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0600'
        console.info(`${caseName}, test start`);
        const a = new Int(5);
        const b = new Int(2);
        const result = a.sub(b);
        expect(result).assertEqual(3);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_0700
     * @tc.name IntSecondTest0700
     * @tc.desc test Int.sub(other: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0700'
        console.info(`${caseName}, test start`);
        const a = new Int(-5);
        const b = new Int(2);
        const result = a.sub(b);
        expect(result).assertEqual(-7);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_0800
     * @tc.name IntSecondTest0800
     * @tc.desc test Int.sub(other: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0800'
        console.info(`${caseName}, test start`);
        const a = new Int(5);
        const b = new Int(-2);
        const result = a.sub(b);
        expect(result).assertEqual(7);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_0900
     * @tc.name IntSecondTest0900
     * @tc.desc test Int.sub(other: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest0900'
        console.info(`${caseName}, test start`);
        const a = new Int(5);
        const b = new Int(0);
        const result = a.sub(b);
        expect(result).assertEqual(5);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_1000
     * @tc.name IntSecondTest1000
     * @tc.desc test Int.sub(other: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest1000'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MAX_VALUE);
        const b = new Int(Int.MAX_VALUE);
        const result = a.sub(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_1100
     * @tc.name IntSecondTest1100
     * @tc.desc test Int.sub(other: int) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest1100'
        console.info(`${caseName}, test start`);
        const a = new Int(Int.MIN_VALUE);
        const b = new Int(Int.MIN_VALUE);
        const result = a.sub(b);
        expect(result).assertEqual(0);
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_1200
     * @tc.name IntSecondTest1200
     * @tc.desc test Int.toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest1200'
        console.info(`${caseName}, test start`);
        const a = new Int(42);
        const result = a.toString(10);
        expect(result).assertEqual('42');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_1300
     * @tc.name IntSecondTest1300
     * @tc.desc test Int.toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest1300'
        console.info(`${caseName}, test start`);
        const a = new Int(5);
        const result = a.toString(2);
        expect(result).assertEqual('101');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_1400
     * @tc.name IntSecondTest1400
     * @tc.desc test Int.toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest1400'
        console.info(`${caseName}, test start`);
        const a = new Int(64);
        const result = a.toString(8);
        expect(result).assertEqual('100');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_1500
     * @tc.name IntSecondTest1500
     * @tc.desc test Int.toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest1500'
        console.info(`${caseName}, test start`);
        const a = new Int(-123);
        const result = a.toString(10);
        expect(result).assertEqual('-123');
        console.info(`${caseName}, test end`);
        Done();
      })


    /**
     * @tc.number INT_SECOND_TEST_1600
     * @tc.name IntSecondTest1600
     * @tc.desc test Int.toString(radix: number) return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('IntSecondTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: () => void): Promise<void> => {
        const caseName = 'IntSecondTest1600'
        console.info(`${caseName}, test start`);
        const a = new Int(0);
        const result = a.toString(10);
        expect(result).assertEqual('0');
        console.info(`${caseName}, test end`);
        Done();
      })
  })
}