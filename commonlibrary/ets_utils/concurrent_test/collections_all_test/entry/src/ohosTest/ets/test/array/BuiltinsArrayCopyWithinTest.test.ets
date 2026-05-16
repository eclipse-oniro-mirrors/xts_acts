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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { sleep } from '../../testability/pages/Utils';
import { collections } from '@kit.ArkTS';


export default function builtinsArrayCopyWithinTest() {
  describe('BuiltinsArrayCopyWithinTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.-
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
     * @tc.name   builtinsArrayCopyWithinTest0100
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0100
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayCopyWithinTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(2, 0, 3)
      expect(arr.toString()).assertEqual('1,2,1,2,3')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest0200
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0200
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayCopyWithinTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(2, 0)
      expect(arr.toString()).assertEqual('1,2,1,2,3')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest0300
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0300
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('builtinsArrayCopyWithinTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2)
      expect(arr.toString()).assertEqual('3,4,5,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest2400
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_2400
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2)
      expect(arr.toString()).assertEqual('3,4,5,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest0400
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0400
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(1, 2, 4)
      expect(arr.toString()).assertEqual('1,3,4,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest0500
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0500
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 3)
      expect(arr.toString()).assertEqual('4,5,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest0600
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0600
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(-3, 0, 3)
      expect(arr.toString()).assertEqual('1,2,1,2,3')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest0700
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0700
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, -3, -1)
      expect(arr.toString()).assertEqual('3,4,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest0800
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0800
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, -2)
      expect(arr.toString()).assertEqual('2,3,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest0900
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_0900
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(5, 0, 3)
      expect(arr.toString()).assertEqual('1,2,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1000
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1000
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 5, 6)
      expect(arr.toString()).assertEqual('1,2,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1100
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1100
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 6)
      expect(arr.toString()).assertEqual('3,4,5,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1200
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1200
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(-6, 0, 3)
      expect(arr.toString()).assertEqual('1,2,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1300
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1300
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, -6, -3)
      expect(arr.toString()).assertEqual('1,2,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1400
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1400
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 1, -6)
      expect(arr.toString()).assertEqual('1,2,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1500
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1500
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(2, 2, 4)
      expect(arr.toString()).assertEqual('1,2,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1600
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1600
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(3, 2, 4)
      expect(arr.toString()).assertEqual('1,2,3,3,4')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1700
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1700
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(0, 2, 2)
      expect(arr.toString()).assertEqual('1,2,3,4,5')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1800
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1800
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(1, 2, 3, 4, 5);
      arr.copyWithin(2.5, 0.5, 3.5)
      expect(arr.toString()).assertEqual('1,2,1,2,3')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest1900
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_1900
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number> = new collections.Array<number>(Math.floor(1.5), 0, -0);
      arr.copyWithin(Math.floor(1.5), 0, -0)
      expect(arr.toString()).assertEqual('1,0,0')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest2000
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_2000
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number | undefined> = new collections.Array<number | undefined>(NaN, undefined);
      arr.copyWithin(0, 0)
      expect(JSON.stringify(arr)).assertEqual('[null,null]')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest2100
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_2100
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number | undefined> = new collections.Array<number | undefined>(Number.EPSILON, Number.MIN_VALUE, Number.MAX_VALUE, -Infinity, Infinity);
      arr.copyWithin(0, 0, 1)
      expect(JSON.stringify(arr)).assertEqual('[2.220446049250313e-16,5e-324,1.7976931348623157e+308,null,null]')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest2200
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_2200
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number | undefined> = new collections.Array<number | undefined>(123.456, 0xcafebabe, 0x0102, 0x01020304, 0x3);
      arr.copyWithin(0, 0, 1)
      expect(JSON.stringify(arr)).assertEqual('[123.456,3405691582,258,16909060,3]')
      Done()
    })

    /**
     * @tc.name   builtinsArrayCopyWithinTest2300
     * @tc.number SUB_BUILTINS_ARRAY_COPY_WITHIN_TEST_2300
     * @tc.desc   test copyWithin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('builtinsArrayCopyWithinTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      let arr: collections.Array<number | undefined> = new collections.Array<number | undefined>();
      arr.copyWithin(0, 0)
      expect(JSON.stringify(arr)).assertEqual('[]')
      Done()
    })

  })
}