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
export default function BooleanLogicalOperatorsTest() {
  describe("BooleanLogicalOperatorsTest", () => {
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
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0100
     * @tc.name      testBooleanLogicalOperators0001
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = false;
        let y: boolean = false;
        let dest: boolean = false;
        expect(x & y).assertEqual(dest);
        const a: boolean = false;
        const b: boolean = false;
        expect(a & b).assertEqual(dest);
        expect(false & false).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0200
     * @tc.name      testBooleanLogicalOperators0002
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = true;
        let y: boolean = false;
        let dest: boolean = false;
        expect(x & y).assertEqual(dest);
        const a: boolean = true;
        const b: boolean = false;
        expect(a & b).assertEqual(dest);
        expect(true & false).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0300
     * @tc.name      testBooleanLogicalOperators0003
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = false;
        let y: boolean = true;
        let dest: boolean = false;
        expect(x & y).assertEqual(dest);
        const a: boolean = false;
        const b: boolean = true;
        expect(a & b).assertEqual(dest);
        expect(false & true).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0400
     * @tc.name      testBooleanLogicalOperators0004
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = true;
        let y: boolean = true;
        let dest: boolean = true;
        expect(x & y).assertEqual(dest);
        const a: boolean = true;
        const b: boolean = true;
        expect(a & b).assertEqual(dest);
        expect(true & true).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0500
     * @tc.name      testBooleanLogicalOperators0005
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = false;
        let y: boolean = false;
        let dest: boolean = false;
        expect(x | y).assertEqual(dest);
        const a: boolean = false;
        const b: boolean = false;
        expect(a | b).assertEqual(dest);
        expect(false | false).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0600
     * @tc.name      testBooleanLogicalOperators0006
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = true;
        let y: boolean = false;
        let dest: boolean = true;
        expect(x | y).assertEqual(dest);
        const a: boolean = true;
        const b: boolean = false;
        expect(a | b).assertEqual(dest);
        expect(true | false).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0700
     * @tc.name      testBooleanLogicalOperators0007
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = false;
        let y: boolean = true;
        let dest: boolean = true;
        expect(x | y).assertEqual(dest);
        const a: boolean = false;
        const b: boolean = true;
        expect(a | b).assertEqual(dest);
        expect(false | true).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0800
     * @tc.name      testBooleanLogicalOperators0008
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = true;
        let y: boolean = true;
        let dest: boolean = true;
        expect(x | y).assertEqual(dest);
        const a: boolean = true;
        const b: boolean = true;
        expect(a | b).assertEqual(dest);
        expect(true | true).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_0900
     * @tc.name      testBooleanLogicalOperators0009
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = false;
        let y: boolean = false;
        let dest: boolean = false;
        expect(x ^ y).assertEqual(dest);
        const a: boolean = false;
        const b: boolean = false;
        expect(a ^ b).assertEqual(dest);
        expect(false ^ false).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_1000
     * @tc.name      testBooleanLogicalOperators0010
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = true;
        let y: boolean = false;
        let dest: boolean = true;
        expect(x ^ y).assertEqual(dest);
        const a: boolean = true;
        const b: boolean = false;
        expect(a ^ b).assertEqual(dest);
        expect(true ^ false).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_1100
     * @tc.name      testBooleanLogicalOperators0011
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = false;
        let y: boolean = true;
        let dest: boolean = true;
        expect(x ^ y).assertEqual(dest);
        const a: boolean = false;
        const b: boolean = true;
        expect(a ^ b).assertEqual(dest);
        expect(false ^ true).assertEqual(dest);
    })
    /**
     * @tc.number    SUB_BOOLEAN_LOGICAL_OPERATORS_1200
     * @tc.name      testBooleanLogicalOperators0012
     * @tc.desc      Bitwise logical operations (bool)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanLogicalOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let x: boolean = true;
        let y: boolean = true;
        let dest: boolean = false;
        expect(x ^ y).assertEqual(dest);
        const a: boolean = true;
        const b: boolean = true;
        expect(a ^ b).assertEqual(dest);
        expect(true ^ true).assertEqual(dest);
    })
  })
}
