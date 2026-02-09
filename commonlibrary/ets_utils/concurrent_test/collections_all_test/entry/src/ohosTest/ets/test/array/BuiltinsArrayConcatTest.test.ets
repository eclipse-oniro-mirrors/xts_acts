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
import { collections } from '@kit.ArkTS';


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
     * @tc.name   builtinsArrayConcatTest0100
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0100
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayConcatTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0100'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([4]))

      expect(ret.toString()).assertEqual('1,2,3,4')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest0200
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0200
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayConcatTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0200'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([4, 5]))

      expect(ret.toString()).assertEqual('1,2,3,4,5')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest0300
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0300
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayConcatTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0200'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([4, 5, 6]))
      expect(ret.toString()).assertEqual('1,2,3,4,5,6')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest0400
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0400
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0400'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([4, 5]), collections.Array.from([6, 7]))

      expect(ret.toString()).assertEqual('1,2,3,4,5,6,7')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest0500
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0500
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0500'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([4]), collections.Array.from([6, 7]))
      expect(ret.toString()).assertEqual('1,2,3,4,6,7')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest0600
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0600
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0600'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([4, 6, 7]))

      expect(ret.toString()).assertEqual('1,2,3,4,6,7')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest0700
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0700
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0700'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, , 3])
      let ret = arr.concat(collections.Array.from([4, 5]))
      expect(ret.toString()).assertEqual('1,,3,4,5')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest0800
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0800
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0800'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat()
      expect(ret.toString()).assertEqual('1,2,3')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest0900
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_0900
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest0900'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([]))
      expect(ret.toString()).assertEqual('1,2,3')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest1000
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1000
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1000'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from<number|DataTest>([1, 2, 3])
      let ret = arr.concat(collections.Array.from([
         4,  5
      ]))
      expect(JSON.stringify(ret)).assertEqual('[1,2,3,4,5]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest1100
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1100
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1100'
      console.info(`${caseName} test start`)
      const arrTemp = collections.Array.from([])
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(arrTemp)
      expect(JSON.stringify(ret)).assertEqual('[1,2,3]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest1400
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1400
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1400'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from<number|undefined>([1, 2, 3])
      let param = collections.Array.from<number | undefined>([undefined])
      let ret = arr.concat(param)

      expect(ret.toString()).assertEqual('1,2,3,')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest1500
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1500
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1500'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from<number|null>([1, 2, 3])
      let param = collections.Array.from<number | null>([null])
      let ret = arr.concat(param)

      expect(ret.toString()).assertEqual('1,2,3,')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest1600
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1600
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1600'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from<number | object>([1, 2, 3])
      console.info('====', Number('a'))
      let ret = arr.concat(collections.Array.from([Number('a')]))
      expect(ret.toString()).assertEqual('1,2,3,NaN')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest1700
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1700
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1700'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from<number | string>([1, 2, 3])
      let s = '特殊字符!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
      let param = collections.Array.from<number | string>([s])
      let ret = arr.concat(param)

      expect(ret.toString()).assertEqual('1,2,3,特殊字符!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest1800
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1800
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1800'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([5]))
      expect(ret.toString()).assertEqual('1,2,3,5')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest1900
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_1900
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest1900'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from<number|string>([1, 2, 3])
      let s = 'null'
      let param = collections.Array.from<number | string>([s])
      let ret = arr.concat(param)

      expect(ret.toString()).assertEqual('1,2,3,null')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest2000
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2000
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2000'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from<number|string>([1, 2, 3])
      let s = ''
      let param = collections.Array.from<number | string>([s])
      let ret = arr.concat(param)
      expect(ret.toString()).assertEqual('1,2,3,')

      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest2100
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2100
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2100'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from<number | string>([1, 2, 3])
      const encodedStr = encodeURIComponent('U+0021');
      let param = collections.Array.from<number | string>([encodedStr]);

      let ret = arr.concat(param)
      expect(ret.toString()).assertEqual('1,2,3,U%2B0021')

      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest2300
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2300
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2300'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from<number>([Math.floor(1.5)]))
      ret = ret.concat(collections.Array.from<number>([Math.floor(0)]))
      ret = ret.concat(collections.Array.from<number>([Math.floor(-0)]))
      expect(ret.toString()).assertEqual('1,2,3,1,0,0')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest2400
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2400
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2400'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from<number>([Number.EPSILON]))
      ret = ret.concat(collections.Array.from<number>([Number.MIN_VALUE]))
      ret = ret.concat(collections.Array.from<number>([Number.MAX_VALUE]))
      ret = ret.concat(collections.Array.from<number>([-Infinity]))
      ret = ret.concat(collections.Array.from<number>([Infinity]))
      expect(ret.toString())
        .assertEqual('1,2,3,2.220446049250313e-16,5e-324,1.7976931348623157e+308,-Infinity,Infinity')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayConcatTest2500
     * @tc.number SUB_BUILTINS_ARRAY_CONCAT_TEST_2500
     * @tc.desc   test Concat
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayConcatTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayConcatTest2500'
      console.info(`${caseName} test start`)
      let arr = collections.Array.from([1, 2, 3])
      let ret = arr.concat(collections.Array.from([123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3]))
      expect(ret.toString()).assertEqual('1,2,3,123.456,3405691582,258,16909060,3')
      console.info(`${caseName} test end`)
      Done()
    });

  })
}
