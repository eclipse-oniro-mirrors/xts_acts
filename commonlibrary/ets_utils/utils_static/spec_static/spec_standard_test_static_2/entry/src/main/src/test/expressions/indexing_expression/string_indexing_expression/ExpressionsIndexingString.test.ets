/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let str_shared: string = "\x17\x2b\xef\0\u1f48\u2331\u2b03\u2eec \n \u{CAFE}\n\uBABF生日快乐!С Днём рождения!"

let str_simple: string = "abcdefg"

export default function ExpressionsIndexingStringTest(): void {
  describe("ExpressionsIndexingStringTest", () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0100
     * @tc.name      testExpressionsIndexingString0001
     * @tc.desc      The result of a string indexing expression is a value of string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: int = 0
      expect(str_shared[index]).assertEqual('\x17')
      expect(typeof str_shared[index]).assertEqual("string")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0200
     * @tc.name      testExpressionsIndexingString0002
     * @tc.desc      The result of a string indexing expression is a value of string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: short = 4
      expect(str_shared[index]).assertEqual('\u1f48')
      expect(typeof str_shared[index]).assertEqual("string")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0300
     * @tc.name      testExpressionsIndexingString0003
     * @tc.desc      The result of a string indexing expression is a value of string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: byte = 9
      expect(str_shared[index]).assertEqual('\n')
      expect(typeof str_shared[index]).assertEqual("string")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0400
     * @tc.name      testExpressionsIndexingString0004
     * @tc.desc      The result of a string indexing expression is a value of string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: int = 11
      expect(str_shared[index]).assertEqual('\u{CAFE}')
      expect(typeof str_shared[index]).assertEqual("string")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0500
     * @tc.name      testExpressionsIndexingString0005
     * @tc.desc      The result of a string indexing expression is a value of string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: short = 14
      expect(str_shared[index]).assertEqual('生')
      expect(typeof str_shared[index]).assertEqual("string")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0600
     * @tc.name      testExpressionsIndexingString0006
     * @tc.desc      The result of a string indexing expression is a value of string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: byte = 19
      expect(str_shared[index]).assertEqual('С')
      expect(typeof str_shared[index]).assertEqual("string")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0700
     * @tc.name      testExpressionsIndexingString0007
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(str_simple[0]).assertEqual('a')
      expect("abcdefg"[0]).assertEqual('a')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0800
     * @tc.name      testExpressionsIndexingString0008
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(str_simple[1 as byte]).assertEqual('b')
      expect("abcdefg"[1 as byte]).assertEqual('b')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_0900
     * @tc.name      testExpressionsIndexingString0009
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(str_simple[2 as short]).assertEqual('c')
      expect("abcdefg"[2 as short]).assertEqual('c')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1000
     * @tc.name      testExpressionsIndexingString0010
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(str_simple[3 as int]).assertEqual('d')
      expect("abcdefg"[3 as int]).assertEqual('d')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1100
     * @tc.name      testExpressionsIndexingString0011
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(str_simple[new Byte(4 as byte)]).assertEqual('e')
      expect("abcdefg"[new Byte(4 as byte)]).assertEqual('e')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1200
     * @tc.name      testExpressionsIndexingString0012
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(str_simple[new Short(5 as short)]).assertEqual('f')
      expect("abcdefg"[new Short(5 as short)]).assertEqual('f')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1300
     * @tc.name      testExpressionsIndexingString0013
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(str_simple[new Int(6)]).assertEqual('g')
      expect("abcdefg"[new Int(6)]).assertEqual('g')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1400
     * @tc.name      testExpressionsIndexingString0014
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: byte = 0
      expect(str_simple[i]).assertEqual('a')
      expect("abcdefg"[i]).assertEqual('a')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1500
     * @tc.name      testExpressionsIndexingString0015
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: short = 1
      expect(str_simple[i]).assertEqual('b')
      expect("abcdefg"[i]).assertEqual('b')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1600
     * @tc.name      testExpressionsIndexingString0016
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: int = 2
      expect(str_simple[i]).assertEqual('c')
      expect("abcdefg"[i]).assertEqual('c')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1700
     * @tc.name      testExpressionsIndexingString0017
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Byte = new Byte(3 as byte)
      expect(str_simple[i]).assertEqual('d')
      expect("abcdefg"[i]).assertEqual('d')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1800
     * @tc.name      testExpressionsIndexingString0018
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Short = new Short(4 as short)
      expect(str_simple[i]).assertEqual('e')
      expect("abcdefg"[i]).assertEqual('e')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_STRING_1900
     * @tc.name      testExpressionsIndexingString0019
     * @tc.desc      Index expression for string indexing must be of one of integer types, namely
     *               byte, short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingString0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i: Int = new Int(5)
      expect(str_simple[i]).assertEqual('f')
      expect("abcdefg"[i]).assertEqual('f')
    })
  })
}