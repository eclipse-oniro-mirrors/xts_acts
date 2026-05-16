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
export default function StringEqualityOperatorsTest() {
  describe("StringEqualityOperatorsTest", () => {
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
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0100
     * @tc.name      testStringEqualityOperators0001
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "a";
        let b: String = "a";
        expect((a == b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0200
     * @tc.name      testStringEqualityOperators0002
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aa";
        let b: String = "aa";
        expect((a == b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0300
     * @tc.name      testStringEqualityOperators0003
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aaa";
        let b: String = "aaa";
        expect((a == b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0400
     * @tc.name      testStringEqualityOperators0004
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "a";
        let b: String = "b";
        expect((a == b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0500
     * @tc.name      testStringEqualityOperators0005
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aa";
        let b: String = "ba";
        expect((a == b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0600
     * @tc.name      testStringEqualityOperators0006
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aaa";
        let b: String = "aba";
        expect((a == b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0700
     * @tc.name      testStringEqualityOperators0007
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "a";
        let b: String = "a";
        expect((a != b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0800
     * @tc.name      testStringEqualityOperators0008
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aa";
        let b: String = "aa";
        expect((a != b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_0900
     * @tc.name      testStringEqualityOperators0009
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aaa";
        let b: String = "aaa";
        expect((a != b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1000
     * @tc.name      testStringEqualityOperators0010
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "a";
        let b: String = "b";
        expect((a != b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1100
     * @tc.name      testStringEqualityOperators0011
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aa";
        let b: String = "ba";
        expect((a != b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1200
     * @tc.name      testStringEqualityOperators0012
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aaa";
        let b: String = "ab" + "a";
        expect((a != b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1300
     * @tc.name      testStringEqualityOperators0013
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "a";
        let b: String = "a";
        expect((a === b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1400
     * @tc.name      testStringEqualityOperators0014
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aa";
        let b: String = "aa";
        expect((a === b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1500
     * @tc.name      testStringEqualityOperators0015
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aaa";
        let b: String = "aa" + "a";
        expect((a === b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1600
     * @tc.name      testStringEqualityOperators0016
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "a";
        let b: String = "b";
        expect((a === b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1700
     * @tc.name      testStringEqualityOperators0017
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aa";
        let b: String = "ba";
        expect((a === b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1800
     * @tc.name      testStringEqualityOperators0018
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aaa";
        let b: String = "aba";
        expect((a === b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_1900
     * @tc.name      testStringEqualityOperators0019
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "a";
        let b: String = "a";
        expect((a !== b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_2000
     * @tc.name      testStringEqualityOperators0020
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aa";
        let b: String = "aa";
        expect((a !== b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_2100
     * @tc.name      testStringEqualityOperators0021
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aaa";
        let b: String = "aa" + "a";
        expect((a !== b)).assertEqual(false );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_2200
     * @tc.name      testStringEqualityOperators0022
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "a";
        let b: String = "b";
        expect((a !== b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_2300
     * @tc.name      testStringEqualityOperators0023
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aa";
        let b: String = "ba";
        expect((a !== b)).assertEqual(true );
    })
    /**
     * @tc.number    SUB_STRING_EQUALITY_OPERATORS_2400
     * @tc.name      testStringEqualityOperators0024
     * @tc.desc      String equality '
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringEqualityOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let a: String = "aaa";
        let b: String = "ab" + "a";
        expect((a !== b)).assertEqual(true );
    })
  })
}
