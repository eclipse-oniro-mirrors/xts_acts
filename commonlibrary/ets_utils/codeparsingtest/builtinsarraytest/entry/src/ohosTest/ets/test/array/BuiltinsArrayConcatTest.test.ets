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
import { DataTest } from '../../testability/pages/DataTest';
import { sleep } from '../../testability/pages/Utils';


export default function builtinsArrayConcatTest() {
  describe('BuiltinsArrayConcatTest', () => {
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
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0100
     * @tc.name builtinsArrayConcatTest0100
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsArrayConcatTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0100'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat(4)

      expect(ret.toString()).assertEqual('1,2,3,4')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0200
     * @tc.name builtinsArrayConcatTest0200
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsArrayConcatTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0200'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat([4, 5])

      expect(ret.toString()).assertEqual('1,2,3,4,5')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0300
     * @tc.name builtinsArrayConcatTest0300
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('builtinsArrayConcatTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0200'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat(4, 5, 6)
      expect(ret.toString()).assertEqual('1,2,3,4,5,6')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0400
     * @tc.name builtinsArrayConcatTest0400
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0400'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat([4, 5], [6, 7])

      expect(ret.toString()).assertEqual('1,2,3,4,5,6,7')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0500
     * @tc.name builtinsArrayConcatTest0500
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0500'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat(4, [6, 7])
      expect(ret.toString()).assertEqual('1,2,3,4,6,7')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0600
     * @tc.name builtinsArrayConcatTest0600
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0600'
      console.info(`${caseName} test start`)
      let arr: Array<number | Array<number>> = [1, 2, 3]
      let ret = arr.concat([4, [6, 7]])

      expect(ret.toString()).assertEqual('1,2,3,4,6,7')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0700
     * @tc.name builtinsArrayConcatTest0700
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0700'
      console.info(`${caseName} test start`)
      let arr: Array<number | undefined> = [1, , 3]
      let ret = arr.concat([4, 5])
      expect(ret.toString()).assertEqual('1,,3,4,5')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0800
     * @tc.name builtinsArrayConcatTest0800
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0800'
      console.info(`${caseName} test start`)
      let arr: Array<number | undefined> = [1, 2, 3]
      let ret = arr.concat()
      expect(ret.toString()).assertEqual('1,2,3')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0900
     * @tc.name builtinsArrayConcatTest0900
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0900'
      console.info(`${caseName} test start`)
      let arr: Array<number | undefined> = [1, 2, 3]
      let ret = arr.concat([])
      expect(ret.toString()).assertEqual('1,2,3')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1000
     * @tc.name builtinsArrayConcatTest1000
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1000'
      console.info(`${caseName} test start`)
      let arr: Array<number | DataTest> = [1, 2, 3]
      let ret = arr.concat({
        a: 4, b: 5
      })
      expect(JSON.stringify(ret)).assertEqual('[1,2,3,{"a":4,"b":5}]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1100
     * @tc.name builtinsArrayConcatTest1100
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1100'
      console.info(`${caseName} test start`)
      const arrTemp = []
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat(arrTemp)
      expect(JSON.stringify(ret)).assertEqual('[1,2,3]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1200
     * @tc.name builtinsArrayConcatTest1200
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1200'
      console.info(`${caseName} test start`)
      const arrTemp: DataTest[] = [{
        aaa: 0
      }]
      arrTemp['aaa'] = 111
      console.info('=====', JSON.stringify(arrTemp))
      let arr: Array<number | DataTest> = [1, 2, 3]
      let ret = arr.concat(arrTemp)

      expect(JSON.stringify(ret)).assertEqual('[1,2,3,{"aaa":0}]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1300
     * @tc.name builtinsArrayConcatTest1300
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1300'
      console.info(`${caseName} test start`)
      const arrTemp: DataTest[] = [{
        abc: 0
      }]
      arrTemp['abc'] = 111
      console.info('=====', JSON.stringify(arrTemp))
      let arr: Array<number | DataTest> = [1, 2, 3]
      let ret = arr.concat(arrTemp)
      expect(JSON.stringify(ret)).assertEqual('[1,2,3,{"abc":0}]')

      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1400
     * @tc.name builtinsArrayConcatTest1400
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1400'
      console.info(`${caseName} test start`)
      let arr: Array<number | undefined> = [1, 2, 3]
      let ret = arr.concat(undefined)

      expect(ret.toString()).assertEqual('1,2,3,')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1500
     * @tc.name builtinsArrayConcatTest1500
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1500'
      console.info(`${caseName} test start`)
      let arr: Array<number | null> = [1, 2, 3]
      let ret = arr.concat(null)

      expect(ret.toString()).assertEqual('1,2,3,')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1600
     * @tc.name builtinsArrayConcatTest1600
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1600'
      console.info(`${caseName} test start`)
      let arr: Array<number | object> = [1, 2, 3]
      console.info('====', Number('a'))
      let ret = arr.concat(Number('a'))
      expect(ret.toString()).assertEqual('1,2,3,NaN')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1700
     * @tc.name builtinsArrayConcatTest1700
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1700'
      console.info(`${caseName} test start`)
      let arr: Array<number | string> = [1, 2, 3]
      let s = '特殊字符!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
      let ret = arr.concat(s)

      expect(ret.toString()).assertEqual('1,2,3,特殊字符!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1800
     * @tc.name builtinsArrayConcatTest1800
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1800'
      console.info(`${caseName} test start`)
      let arr: Array<number | string> = [1, 2, 3]
      let s = 'undefined'
      let ret = arr.concat(s)
      expect(ret.toString()).assertEqual('1,2,3,undefined')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1900
     * @tc.name builtinsArrayConcatTest1900
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1900'
      console.info(`${caseName} test start`)
      let arr: Array<number | string> = [1, 2, 3]
      let s = 'null'
      let ret = arr.concat(s)
      expect(ret.toString()).assertEqual('1,2,3,null')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2000
     * @tc.name builtinsArrayConcatTest2000
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2000'
      console.info(`${caseName} test start`)
      let arr: Array<number | string> = [1, 2, 3]
      let s = ''
      let ret = arr.concat(s)
      expect(ret.toString()).assertEqual('1,2,3,')

      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2100
     * @tc.name builtinsArrayConcatTest2100
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2100'
      console.info(`${caseName} test start`)
      let arr: Array<number | string> = [1, 2, 3]
      let ret = arr.concat(encodeURIComponent('\U+0021'))
      expect(ret.toString()).assertEqual('1,2,3,U%2B0021')

      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2300
     * @tc.name builtinsArrayConcatTest2300
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2300'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat(Math.floor(1.5))
      ret = ret.concat(Math.floor(0))
      ret = ret.concat(Math.floor(-0))
      expect(ret.toString()).assertEqual('1,2,3,1,0,0')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2400
     * @tc.name builtinsArrayConcatTest2400
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2400'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat(Number.EPSILON)
      ret = ret.concat(Number.MIN_VALUE)
      ret = ret.concat(Number.MAX_VALUE)
      ret = ret.concat(-Infinity)
      ret = ret.concat(Infinity)
      expect(ret.toString())
        .assertEqual('1,2,3,2.220446049250313e-16,5e-324,1.7976931348623157e+308,-Infinity,Infinity')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2500
     * @tc.name builtinsArrayConcatTest2500
     * @tc.desc test Concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('builtinsArrayConcatTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2500'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let ret = arr.concat(123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3)
      expect(ret.toString()).assertEqual('1,2,3,123.456,3405691582,258,16909060,3')
      console.info(`${caseName} test end`)
      Done()
    })
  })
}