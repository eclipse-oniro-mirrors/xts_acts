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


export default function builtinsArrayEntriesTest() {
  describe('BuiltinsArrayEntriesTest', () => {
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
     * @tc.name   builtinsArrayEntriesTest0100
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0100
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayEntriesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0100'
      console.info(`${caseName} test start`)
      let arr: Array<number | string> = [1, '2']
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,1]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,"2"]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest0200
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0200
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayEntriesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0200'
      console.info(`${caseName} test start`)
      let arr: Array<undefined | string | null> = [undefined, "", null]
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,null]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,""]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[2,null]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest0300
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0300
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0300'
      console.info(`${caseName} test start`)
      let arr: Array<undefined | string | null> = ['!"#$%&\'()* +,-./:;<=>?@[\\]^_`{|}~']
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,"!\\"#$%&\'()* +,-./:;<=>?@[\\\\]^_`{|}~"]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest0400
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0400
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0400'
      console.info(`${caseName} test start`)
      let arr: Array<undefined | string | null> =
        ['!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~']
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value))
        .assertEqual(
          '[0,"!\\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"]'
        )
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest0500
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0500
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0500'
      console.info(`${caseName} test start`)
      let arr: Array<undefined | string | null> =
        ['!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~']
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value))
        .assertEqual(
          '[0,"!!\\"\\"##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\\\\\]]^^__``{{||}}~~"]'
        )
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest0600
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0600
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0600'
      console.info(`${caseName} test start`)
      let arr: Array<undefined | string | null> =
        ["\a", "\b", "\f", "\n", "\r", "\t", "\v", "\\", "\'", "\?", "\0", "\d12", "\x1d"]
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,"a"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,"\\b"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[2,"\\f"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[3,"\\n"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[4,"\\r"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[5,"\\t"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[6,"\\u000b"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[7,"\\\\"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[8,"\'"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[9,"?"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[10,"\\u0000"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[11,"d12"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[12,"\\u001d"]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest0700
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0700
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0700'
      console.info(`${caseName} test start`)
      let arr: Array<undefined | string | null> =
        ["", "\ud83d\udc46", "\ud83d"]
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,""]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,"👆"]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[2,"\\ud83d"]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest0800
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0800
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0800'
      console.info(`${caseName} test start`)
      let arr: Array<number> =
        [Math.floor(1.5)]
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,1]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest0900
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_0900
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest0900'
      console.info(`${caseName} test start`)
      let arr: Array<number> =
        [Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE, -Infinity, Infinity]
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,2.220446049250313e-16]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,5e-324]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[2,1.7976931348623157e+308]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[3,null]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[4,null]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest1000
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_1000
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest1000'
      console.info(`${caseName} test start`)
      let x = 1
      let arr: Array<number> =
        [x + x, x * x]
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,2]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,1]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest1100
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_1100
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest1100'
      console.info(`${caseName} test start`)
      let arr: Array<number> =
        [123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3]
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,123.456]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,3405691582]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[2,258]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[3,16909060]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[4,3]')
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest1200
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_1200
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest1200'
      console.info(`${caseName} test start`)
      let arr: Array<number> = []
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual(undefined)
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest1300
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_1300
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest1300'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      arr.length = 2
      let temp = arr.entries()
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,1]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,2]')
      expect(JSON.stringify(temp.next().value)).assertEqual(undefined)
      console.info(`${caseName} test end`)
      Done()
    })

    /**
     * @tc.name   builtinsArrayEntriesTest1400
     * @tc.number SUB_BUILTINS_ARRAY_ENTRIES_TEST_1400
     * @tc.desc   test entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayEntriesTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsArrayEntriesTest1400'
      console.info(`${caseName} test start`)
      let arr: Array<number> = [1, 2, 3]
      let temp = arr.entries()
      arr.length = 2
      expect(JSON.stringify(temp.next().value)).assertEqual('[0,1]')
      expect(JSON.stringify(temp.next().value)).assertEqual('[1,2]')
      expect(JSON.stringify(temp.next().value)).assertEqual(undefined)
      console.info(`${caseName} test end`)
      Done()
    })

  })
}