/*
* Copyright (C) 2024 HiHope Open Source Organization.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { animal, MyObjects, Person, sleep, task, update } from '../../testability/pages/Utils';

export default function builtinsStatementForTest() {
  describe('BuiltinsStatementForTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1000
     * @tc.name builtinsStatementForTest_1000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsStatementForInitTest_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1000'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let i = 0
        let count: number = 0
        for (i; i < 10; i++) {
          count++
        }
        expect(10).assertEqual(i);
        expect(10).assertEqual(count)
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1100
     * @tc.name builtinsStatementForTest_1100
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsStatementForInitTest_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1100'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0
        for (let i = 0; i < 10; i++) {
          count++
        }
        expect(10).assertEqual(count)
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1200
     * @tc.name builtinsStatementForTest_1200
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsStatementForInitTest_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1200'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0
        for (let i: number = 0; i < 10; i++) {
          count++
        }
        expect(10).assertEqual(count)
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1300
     * @tc.name builtinsStatementForTest_1300
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsStatementForInitTest_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1300'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        for (let i = 0, j = 0; i < 10 && j < 15; i++, j++) { // 初始化并递增两个变量
          count++;
        }
        expect(10).assertEqual(count); // 因为i<10是决定性条件，所以count应该是10
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1400
     * @tc.name builtinsStatementForTest_1400
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1400'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (; i < 10; ) { // 没有初始化部分
          count++;
          i++; // 在循环体内递增
        }
        expect(10).assertEqual(count);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1500
     * @tc.name builtinsStatementForTest_1500
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1600'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i; 0; i++) { // 没有初始化部分
          count++;
          ; // 在循环体内递增
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1600
     * @tc.name builtinsStatementForTest_1600
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1600'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i; NaN; i++) { // 没有初始化部分
          count++;
          ; // 在循环体内递增
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1700
     * @tc.name builtinsStatementForTest_1700
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1700'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i; ''; i++) { // 没有初始化部分
          count++;
          ; // 在循环体内递增
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1800
     * @tc.name builtinsStatementForTest_1800
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1800'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i; null; i++) { // 没有初始化部分
          count++;
          ; // 在循环体内递增
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_1900
     * @tc.name builtinsStatementForTest_1900
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_1900'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i; undefined; i++) { // 没有初始化部分
          count++;
          ; // 在循环体内递增
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2000
     * @tc.name builtinsStatementForTest_2000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2000'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i;!'s'; i++) { // 没有初始化部分
          count++;
          ; // 在循环体内递增
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2100
     * @tc.name builtinsStatementForTest_2100
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2100'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i;!0; i++) { // 没有初始化部分
          count++; // 在循环体内递增
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2200
     * @tc.name builtinsStatementForTest_2200
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2200'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i; true; i++) { // 没有初始化部分
          count++; // 在循环体内递增
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2300
     * @tc.name builtinsStatementForTest_2300
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2300'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0; // 在循环外初始化
        for (i; false; i++) { // 没有初始化部分
          count++; // 在循环体内递增
          break
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2400
     * @tc.name builtinsStatementForTest_2400
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2400'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        const getFlag = () => {
          return i < 10;
        }
        let count: number = 0;
        let i = 0;
        for (i; getFlag(); i++) {
          count++;
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2500
     * @tc.name builtinsStatementForTest_2500
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2500'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        let j = 0; // 在循环外初始化
        for (i = 0, j = 0; i < 10 && j < 5; i++, j++) {
          count++
        }
        expect(5).assertEqual(count);
        expect(5).assertEqual(i);
        expect(5).assertEqual(j);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2600
     * @tc.name builtinsStatementForTest_2600
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2600'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        let j = 0; // 在循环外初始化
        for (i = 0, j = 0; i < 10 || j < 5; i++, j++) {
          count++
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(i);
        expect(10).assertEqual(j);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2700
     * @tc.name builtinsStatementForTest_2700
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2700'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; i < 10; i++) {
          if (i < 5) {
            count++
          }
        }
        expect(5).assertEqual(count);
        expect(10).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2800
     * @tc.name builtinsStatementForTest_2800
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2800'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0;; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_2900
     * @tc.name builtinsStatementForTest_2900
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_2900'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; 2; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3000
     * @tc.name builtinsStatementForTest_3000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3000'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; [1]; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3100
     * @tc.name builtinsStatementForTest_3100
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3100'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; 'string'; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3200
     * @tc.name builtinsStatementForTest_3200
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3200'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let s: MyObjects = {
          a: 1
        }
        let i = 0;
        for (i = 0; s; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3300
     * @tc.name builtinsStatementForTest_3300
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3300'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; BigInt; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3400
     * @tc.name builtinsStatementForTest_3400
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3400'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; Person; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3500
     * @tc.name builtinsStatementForTest_3500
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3500'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; Color; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3600
     * @tc.name builtinsStatementForTest_3600
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3600'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; Array; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3700
     * @tc.name builtinsStatementForTest_3700
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3600'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; task(); i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3800
     * @tc.name builtinsStatementForTest_3800
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3800'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let direction: "up" | "down" | "left" | "right" = "right"
        let i = 0;
        for (i = 0; direction; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_3900
     * @tc.name builtinsStatementForTest_3900
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_3900'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let direction: [string, number, null] = ['hello', 1, null]
        let i = 0;
        for (i = 0; direction; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4000
     * @tc.name builtinsStatementForTest_4000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4000'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let direction: string | number = 0
        let i = 0;
        for (i = 0; direction; i++) {
          count++
          break
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4200
     * @tc.name builtinsStatementForTest_4200
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4200'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let direction = animal<string>('mysd')
        let i = 0;
        for (i = 0; direction; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4300
     * @tc.name builtinsStatementForTest_4300
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4300'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; 0; i++) {
          count++
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4400
     * @tc.name builtinsStatementForTest_4400
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4400'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; +0.0; i++) {
          count++
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4500
     * @tc.name builtinsStatementForTest_4500
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4500'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; false; i++) {
          count++
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4600
     * @tc.name builtinsStatementForTest_4600
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4600'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        let def: string = 'hello world'
        let objectStr = new String(def)
        for (i = 0; objectStr; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4700
     * @tc.name builtinsStatementForTest_4700
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4700'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        let def: number = 0
        let objectStr = new Number(def)
        for (i = 0; objectStr; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4800
     * @tc.name builtinsStatementForTest_4800
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4800'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        let def: string = 'hello world'
        let objectStr = Boolean(def)
        for (i = 0; objectStr; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_4900
     * @tc.name builtinsStatementForTest_4900
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_4900'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        let def: number = 1
        let objectStr = BigInt(def)
        for (i = 0; objectStr; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5000
     * @tc.name builtinsStatementForTest_5000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5000'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; 0 && false; i++) {
          count++
          break
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5100
     * @tc.name builtinsStatementForTest_5100
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5100'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        for (i = 0; 0 || false; i++) {
          count++
          break
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5200
     * @tc.name builtinsStatementForTest_5200
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5200'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        let def: number = 1
        let objectStr = BigInt(def)
        for (i = 0;!objectStr; i++) {
          count++
          break
        }
        expect(0).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5300
     * @tc.name builtinsStatementForTest_5300
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5300'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        let def: string = 'ssddsd'
        //异常场景表达式为函数返回值
        for (i = 0; Object(def); i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5400
     * @tc.name builtinsStatementForTest_5400
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5400'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        //不带括号异常场景
        for (i = 0; task; i++) {
          count++
          break
        }
        expect(1).assertEqual(count);
        expect(0).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5500
     * @tc.name builtinsStatementForTest_5500
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5500'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        //forUpDate正常场景i++
        for (i = 0; i < 15; i++) {
          count++
        }
        expect(15).assertEqual(count);
        expect(15).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5600
     * @tc.name builtinsStatementForTest_5600
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5600'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 15;
        //forUpDate正常场景i--
        for (i = 15; i > 10; i--) {
          count++
        }
        expect(5).assertEqual(count);
        expect(10).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5700
     * @tc.name builtinsStatementForTest_5700
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5700'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        //forUpDate正常场景i+=2
        for (i = 0; i < 10; i += 2) {
          count++
        }
        expect(5).assertEqual(count);
        expect(10).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5800
     * @tc.name builtinsStatementForTest_5800
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5800'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 20;
        //forUpDate正常场景i-=2
        for (i = 20; i > 10; i -= 2) {
          count++
        }
        expect(5).assertEqual(count);
        expect(10).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_5900
     * @tc.name builtinsStatementForTest_5900
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_5900'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        //forUpDate正常场景i-=2
        for (i = 0; i < 10; i = i * 2 + 1) {
          count++
        }
        expect(4).assertEqual(count);
        expect(15).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6000
     * @tc.name builtinsStatementForTest_6000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6000'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        //forUpDate正常场景i=函数返回值
        for (i = 0; i < 10; i = update(i)) {
          count++
        }
        expect(2).assertEqual(count);
        expect(10).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6100
     * @tc.name builtinsStatementForTest_6100
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6100'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 0;
        //forUpDate正常场景缺省forUpDate
        for (i = 0; i < 10; ) {
          count++
          i++
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6200
     * @tc.name builtinsStatementForTest_6200
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6200'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        //forUpDate正常场景多个参数
        let i = 0, j = 0
        for (i = 0, j = 10; i < 10; i++, j--) {
          count++
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(i);
        expect(0).assertEqual(j);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6300
     * @tc.name builtinsStatementForTest_6300
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6300'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        //forUpDate正常场景多个参数
        let i = 0, j = 0, k = 0, l = 0, z = 0
        for (i = 0, j = 10, k = 10, l = 10, z = 10; i < 10; i++, j--, k--, l--, z--) {
          count++
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(i);
        expect(0).assertEqual(j);
        expect(0).assertEqual(k);
        expect(0).assertEqual(l);
        expect(0).assertEqual(z);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6400
     * @tc.name builtinsStatementForTest_6400
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6400'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        //forUpDate正常场景多个参数
        let i = 0, j = 0, k = 0, l = 0, z = 0, h = 0, g = 0, f = 0, d = 0, a = 0
        for (i = 0, j = 10, k = 10, l = 10, z = 10, h = 10, g = 10, f = 10, d = 10, a = 10; i < 10;
          j--, k--, l--, z--, h--, g--, f--, d--, a--, i++) {
          count++
        }
        while (i < 10) {
          await sleep(100)
        }
        expect(10).assertEqual(count);
        expect(10).assertEqual(i);
        expect(0).assertEqual(j);
        expect(0).assertEqual(k);
        expect(0).assertEqual(l);
        expect(0).assertEqual(z);
        expect(0).assertEqual(h);
        expect(0).assertEqual(g);
        expect(0).assertEqual(f);
        expect(0).assertEqual(d);
        expect(0).assertEqual(a);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6500
     * @tc.name builtinsStatementForTest_6500
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6500'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        //作用域，测试外部定义变量，for内部赋值，能否拿到
        let i = 0
        for (i = 10; i < 10; ) {
          count++
        }
        while (i < 10) {
          await sleep(100)
        }
        expect(0).assertEqual(count);
        expect(10).assertEqual(i);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6600
     * @tc.name builtinsStatementForTest_6600
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6600'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        //作用域，循环体的变量只有局部可用
        for (let i = 1; i < 10; ) {
          count++
          expect(1).assertEqual(i);
          break
        }
        expect(1).assertEqual(count);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6700
     * @tc.name builtinsStatementForTest_6700
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6700'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 1
        //无标签break
        for (i = 1; i < 10; i++) {
          count++
          break
        }
        expect(1).assertEqual(i)
        expect(1).assertEqual(count);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6800
     * @tc.name builtinsStatementForTest_6800
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6800'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 1
        //无标签continue
        for (i = 1; i < 10; i++) {
          continue
          count++
        }
        expect(10).assertEqual(i)
        expect(0).assertEqual(count);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_6900
     * @tc.name builtinsStatementForTest_6900
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_6900'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 1
        //无标签break
        for (i = 1; i < 10; i++) {
          count++
          break
        }
        expect(1).assertEqual(i)
        expect(1).assertEqual(count);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7000
     * @tc.name builtinsStatementForTest_7000
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_7000'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 1
        //无标签嵌套循环continue
        for (i = 1; i < 10; i++) {
          if (i == 5) {
            continue
          }
          count++
        }
        expect(10).assertEqual(i)
        expect(8).assertEqual(count);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7100
     * @tc.name builtinsStatementForTest_7100
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_7100'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 1
        //无标签嵌套循环break
        for (i = 1; i < 10; i++) {
          if (i == 5) {
            break
          }
          count++
        }
        expect(5).assertEqual(i)
        expect(4).assertEqual(count);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7200
     * @tc.name builtinsStatementForTest_7200
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_7200'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 1
        //有标签嵌套循环break
        outerLoop: for (i = 1; i < 10; i++) {
          if (i == 5) {
            break outerLoop
          }
          count++
        }
        expect(5).assertEqual(i)
        expect(4).assertEqual(count);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7300
     * @tc.name builtinsStatementForTest_7300
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForTest_7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag = 'builtinsStatementForTest_7300';
        console.info(`${Tag}`, '%{public}s', 'Test begin');
        let outerLoopCounter = 0;
        let innerLoopCounter = 0;
        let shouldBreakAtIEquals1JEquals1 = false; //带标签指定外部循环
        outerLoop: for (let i = 0; i < 5; i++) {
          outerLoopCounter++;
          for (let j = 0; j < 5; j++) {
            innerLoopCounter++;
            if (i === 1 && j === 1) {
              // 当i等于1且j等于1时，使用break语句加上标签跳出整个外部循环
              shouldBreakAtIEquals1JEquals1 = true;
              break outerLoop;
            }
          }
        }
        // 验证是否在预期的位置（i=1,j=1）中断了循环
        expect(true).assertEqual(shouldBreakAtIEquals1JEquals1);
        expect(2).assertEqual(outerLoopCounter);
        expect(7).assertEqual(innerLoopCounter);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7400
     * @tc.name builtinsStatementForTest_7400
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForInitTest_7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag: string = 'builtinsStatementForInitTest_7400'
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count: number = 0;
        let i = 1
        //有标签嵌套循环break
        outerLoop: for (i = 1; i < 10; i++) {
          if (i == 5) {
            continue outerLoop
          }
          count++
        }
        expect(10).assertEqual(i)
        expect(8).assertEqual(count);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7500
     * @tc.name builtinsStatementForTest_7500
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForTest_7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag = 'builtinsStatementForTest_7500';
        console.info(`${Tag}`, '%{public}s', 'Test begin');
        let outerLoopCounter = 0;
        let innerLoopCounter = 0;
        let shouldBreakAtIEquals1JEquals1 = false; //多层循环中使用标签，是否跳到标签层
        outerLoop: for (let i = 0; i < 5; i++) {
          outerLoopCounter++;
          for (let j = 0; j < 5; j++) {
            innerLoopCounter++;
            shouldBreakAtIEquals1JEquals1 = true;
            break
          }
        }
        // 验证是否在预期的位置（i=1,j=1）中断了循环
        expect(true).assertEqual(shouldBreakAtIEquals1JEquals1);
        expect(5).assertEqual(outerLoopCounter);
        expect(5).assertEqual(innerLoopCounter);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7600
     * @tc.name builtinsStatementForTest_7600
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForTest_7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        // Defines a test case. This API supports three parameters: test case name, filter parameter, and test case function.
        console.info('testTag', '%{public}s', 'it begin');
        let total = 0;
        outerLoop: for (let i = 0; i < 3; i++) {
          middleLoop: for (let j = 0; j < 3; j++) {
            innerLoop: for (let k = 0; k < 3; k++) {
              if (i === 1 && j === 1 && k === 1) {
                continue innerLoop;
              }
              if (i === 1 && j === 1) {
                continue middleLoop;
              }
              if (i === 1) {
                continue outerLoop;
              }
              total += i + j + k;
            }
          }
        }
        expect(total).assertEqual(54);
        Done()
      })


    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7700
     * @tc.name builtinsStatementForTest_7700
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForTest_7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag = 'builtinsStatementForTest_7700';
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let outerCount = 0;
        let middleCount = 0;
        let innerCount = 0;
        for (let i = 1; i <= 3; i++) {
          outerCount++;
          for (let j = 1; j <= 3; j++) {
            middleCount++;
            for (let k = 1; k <= 3; k++) {
              innerCount++;
            }
          }
        }
        expect(3).assertEqual(outerCount);
        expect(9).assertEqual(middleCount);
        expect(27).assertEqual(innerCount);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7800
     * @tc.name builtinsStatementForTest_7800
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForTest_7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag = 'builtinsStatementForTest_7800';
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let count1 = 0;
        let count2 = 0;
        let count3 = 0;
        let count4 = 0;
        let count5 = 0;
        for (let i = 1; i <= 3; i++) {
          count1++;
          for (let j = 1; j <= 3; j++) {
            count2++;
            for (let k = 1; k <= 3; k++) {
              count3++;
              for (let l = 1; l <= 3; l++) {
                count4++;
                for (let m = 1; m <= 3; m++) {
                  count5++;
                }
              }
            }
          }
        }
        expect(count1).assertEqual(3);
        expect(count2).assertEqual(9);
        expect(count3).assertEqual(27);
        expect(count4).assertEqual(81);
        expect(count5).assertEqual(243);
        Done();
      });

    /**
     * @tc.number SUB_BUILTINS_STATEMENT_FOR_TEST_7900
     * @tc.name builtinsStatementForTest_7900
     * @tc.desc test builtins
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsStatementForTest_7900_extended', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (Done: Function) => {
        const Tag = 'builtinsStatementForTest_7900_extended';
        console.info(`${Tag}`, '%{public}s', 'it begin');
        let counts: number[] = new Array(10).fill(0);
        for (let i1 = 1; i1 <= 3; i1++) {
          counts[0]++;
          for (let i2 = 1; i2 <= 3; i2++) {
            counts[1]++;
            for (let i3 = 1; i3 <= 3; i3++) {
              counts[2]++;
              for (let i4 = 1; i4 <= 3; i4++) {
                counts[3]++;
                for (let i5 = 1; i5 <= 3; i5++) {
                  counts[4]++;
                  for (let i6 = 1; i6 <= 3; i6++) {
                    counts[5]++;
                    for (let i7 = 1; i7 <= 3; i7++) {
                      counts[6]++;
                      for (let i8 = 1; i8 <= 3; i8++) {
                        counts[7]++;
                        for (let i9 = 1; i9 <= 3; i9++) {
                          counts[8]++;
                          for (let i10 = 1; i10 <= 3; i10++) {
                            counts[9]++;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        expect(counts[0]).assertEqual(3)
        expect(counts[1]).assertEqual(9)
        expect(counts[2]).assertEqual(27)
        expect(counts[3]).assertEqual(81)
        expect(counts[4]).assertEqual(243)
        expect(counts[5]).assertEqual(729)
        expect(counts[6]).assertEqual(2187)
        expect(counts[7]).assertEqual(6561)
        expect(counts[8]).assertEqual(19683)
        expect(counts[9]).assertEqual(59049)
        Done();
      });
  })
}