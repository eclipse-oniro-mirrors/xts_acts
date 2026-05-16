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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function StringRelationalOperatorsOneTest(): void {
  describe("StringRelationalOperatorsOneTest", () => {
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
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0100
     * @tc.name      testStringRelationalOperatorsOne0001
     * @tc.desc      Verify binary string with different ending comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = "\xff\xfe\xac 1\x003\x00,\x005\x007\x00"
      let data2: string = "\xff\xfe\xac 1\x003\x00,\x005\x006\x00"
      let data3: string = new String("\xff\xfe\xac 1\x003\x00,\x005\x006\x00")
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0200
     * @tc.name      testStringRelationalOperatorsOne0002
     * @tc.desc      Verify high surrogate equality comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xD800)
      let data2: string = String.fromCharCode(0xD800)
      let data3: string = new String(String.fromCharCode(0xD800))
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0300
     * @tc.name      testStringRelationalOperatorsOne0003
     * @tc.desc      Verify high surrogate character order comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xD801)
      let data2: string = String.fromCharCode(0xD800)
      let data3: string = new String(String.fromCharCode(0xD800))
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0400
     * @tc.name      testStringRelationalOperatorsOne0004
     * @tc.desc      Verify high surrogate sequential comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xD800)
      let data2: string = String.fromCharCode(0xD801)
      let data3: string = new String(String.fromCharCode(0xD801))
      expect((data1 >= data2)).assertFalse()
      expect((data1 >= data3)).assertFalse()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0500
     * @tc.name      testStringRelationalOperatorsOne0005
     * @tc.desc      Verify low surrogate equality comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xDC00)
      let data2: string = String.fromCharCode(0xDC00)
      let data3: string = new String(String.fromCharCode(0xDC00))
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0600
     * @tc.name      testStringRelationalOperatorsOne0006
     * @tc.desc      Verify low surrogate character order comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xDC01)
      let data2: string = String.fromCharCode(0xDC00)
      let data3: string = new String(String.fromCharCode(0xDC00))
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0700
     * @tc.name      testStringRelationalOperatorsOne0007
     * @tc.desc      Verify low surrogate sequential comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xDC00)
      let data2: string = String.fromCharCode(0xDC01)
      let data3: string = new String(String.fromCharCode(0xDC01))
      expect((data1 >= data2)).assertFalse()
      expect((data1 >= data3)).assertFalse()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0800
     * @tc.name      testStringRelationalOperatorsOne0008
     * @tc.desc      Verify maximum unicode character equality comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xDBFF) + String.fromCharCode(0xDFFF)
      let data2: string = String.fromCharCode(0xDBFF) + String.fromCharCode(0xDFFF)
      let data3: string = new String(String.fromCharCode(0xDBFF) + String.fromCharCode(0xDFFF))
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_0900
     * @tc.name      testStringRelationalOperatorsOne0009
     * @tc.desc      Verify unicode supplementary character order comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xDBFF) + String.fromCharCode(0xDFFF)
      let data2: string = String.fromCharCode(0xDBFF) + String.fromCharCode(0xDFFA)
      let data3: string = new String(String.fromCharCode(0xDBFF) + String.fromCharCode(0xDFFA))
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_1000
     * @tc.name      testStringRelationalOperatorsOne0010
     * @tc.desc      Verify unicode multi-byte character comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = String.fromCharCode(0xDBFA) + String.fromCharCode(0xDFFF)
      let data2: string = String.fromCharCode(0xDBFF) + String.fromCharCode(0xDFFF)
      let data3: string = new String(String.fromCharCode(0xDBFF) + String.fromCharCode(0xDFFF))
      expect((data1 >= data2)).assertFalse()
      expect((data1 >= data3)).assertFalse()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_1100
     * @tc.name      testStringRelationalOperatorsOne0011
     * @tc.desc      Verify unicode character order comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = "\u{A123}"
      let data2: string = "\u{A122}"
      let data3: string = new String("\u{A122}")
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_1200
     * @tc.name      testStringRelationalOperatorsOne0012
     * @tc.desc      Verify unicode character equality comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = "\u{A123}"
      let data2: string = "\u{A123}"
      let data3: string = new String("\u{A123}")
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_1300
     * @tc.name      testStringRelationalOperatorsOne0013
     * @tc.desc      Verify unicode character sequential comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = "\u{A122}"
      let data2: string = "\u{A123}"
      let data3: string = new String("\u{A123}")
      expect((data1 >= data2)).assertFalse()
      expect((data1 >= data3)).assertFalse()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_1400
     * @tc.name      testStringRelationalOperatorsOne0014
     * @tc.desc      Verify English word string equality comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let data2: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let data3: string = new String("\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}")
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_1500
     * @tc.name      testStringRelationalOperatorsOne0015
     * @tc.desc      Verify English word character difference comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006d}\u{0000006f}"
      let data2: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let data3: string = new String("\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}")
      expect((data1 >= data2)).assertTrue()
      expect((data1 >= data3)).assertTrue()
    })
    /**
     * @tc.number    SUB_STRING_RELATIONAL_OPERATORS_ONE_1600
     * @tc.name      testStringRelationalOperatorsOne0016
     * @tc.desc      Verify English word sequential character comparison using >= operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringRelationalOperatorsOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1: string = "\u{00000067}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let data2: string = "\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}"
      let data3: string = new String("\u{00000068}\u{00000065}\u{0000006c}\u{0000006c}\u{0000006f}")
      expect((data1 >= data2)).assertFalse()
      expect((data1 >= data3)).assertFalse()
    })
  })
}
