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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { DataTest } from '../testability/pages/DataTest';
import { sleep } from '../testability/pages/Utils';


export default function builtinsArrayEveryTest() {
  describe('BuiltinsArrayEveryTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0100
     * @tc.name builtinsArrayEveryTest0100
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0100'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let flg = arr.every((x) => {
        return x > 0
      })
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0200
     * @tc.name builtinsArrayEveryTest0200
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0200'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let flg = arr.every((x) => {
        return x > 2
      })
      expect(flg).assertFalse()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0300
     * @tc.name builtinsArrayEveryTest0300
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0300'
      console.info(`${caseName} test start`)
      let arr: Array<number> = []
      let flg = arr.every(x => x > 0)
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0400
     * @tc.name builtinsArrayEveryTest0400
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0400'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [5]
      let flg = arr.every(x => x > 0)
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0500
     * @tc.name builtinsArrayEveryTest0500
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0500'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [5]
      let flg = arr.every(x => x > 5)
      expect(flg).assertFalse()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0600
     * @tc.name builtinsArrayEveryTest0600
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0600'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3, 4, 5]
      let flg = arr.every(x => x < 5)
      expect(flg).assertFalse()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0700
     * @tc.name builtinsArrayEveryTest0700
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0700'
      console.info(`${caseName} test start`)
      let arr: Array<number | undefined> = [1, 2, , 4, 5]
      let flg = arr.every(x => Number(x) > 0)
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0800
     * @tc.name builtinsArrayEveryTest0800
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0800'
      console.info(`${caseName} test start`)
      let arr: Array<number | undefined> = [1, 2, , 4, 5]
      let flg = arr.every(x => Number(x) < 5)
      expect(flg).assertFalse()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_0900
     * @tc.name builtinsArrayEveryTest0900
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest0900'
      console.info(`${caseName} test start`)
      let arr: Array<number | undefined> = [1, 2, 3]
      let flg = arr.every(x => {
        arr.push(4);
        return true;
      })
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1000
     * @tc.name builtinsArrayEveryTest1000
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest1000'
      console.info(`${caseName} test start`)
      let arr: Array<number | undefined> = [1, 2, 3]
      let flg = arr.every(x => {
        arr.pop();
        return true;
      })
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1100
     * @tc.name builtinsArrayEveryTest1100
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest1100'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let flg = arr.every((x) => {
        return x > 0;
      }, { x: 1 })
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1200
     * @tc.name builtinsArrayEveryTest1200
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest1200'
      console.info(`${caseName} test start`)
      let arr: Array<string> = ['a', 'b', 'c']
      let flg = arr.every(x => x.length > 0)
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1300
     * @tc.name builtinsArrayEveryTest1300
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest1300'
      console.info(`${caseName} test start`)
      let arr: Array<DataTest> = [ { a: 1 }, { a: 2 }, { a: 3 } ]
      let flg = arr.every(obj => obj.a! > 0)
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1400
     * @tc.name builtinsArrayEveryTest1400
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      hilog.info(0x0000, 'testTag', '%{public}s', 'it begin');
      const caseName = 'builtinsArrayEveryTest1400'
      console.info(`${caseName} test start`)
      let arr: Array<number> = Array(1000000).fill(1)
      console.info('====', arr.length)
      let flg = arr.every(x => x > 0)
      expect(flg).assertTrue()
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_EVERY_TEST_1500
     * @tc.name builtinsArrayEveryTest1500
     * @tc.desc test every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsArrayEveryTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEveryTest1500'
      console.info(`${caseName} test start`)
      let flg = [null, undefined, 3].every((element) => element !== null)
      expect(flg).assertFalse()
      console.info(`${caseName} test end`)
      Done()
    })
  })
}
