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
export default function BooleanEqualityOperatorsTest() {
  describe("BooleanEqualityOperatorsTest", () => {
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
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0100
     * @tc.name      testBooleanEqualityOperators0001
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true == true)).assertTrue();
      expect((true == false)).assertFalse();
      expect((false == true)).assertFalse();
      expect((false == false)).assertTrue();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0200
     * @tc.name      testBooleanEqualityOperators0002
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true != true)).assertFalse();
      expect((true != false)).assertTrue();
      expect((false != true)).assertTrue();
      expect((false != false)).assertFalse();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0300
     * @tc.name      testBooleanEqualityOperators0003
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true == new Boolean(true))).assertTrue();
      expect((true == new Boolean(false))).assertFalse();
      expect((false == new Boolean(true))).assertFalse();
      expect((false == new Boolean(false))).assertTrue();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0400
     * @tc.name      testBooleanEqualityOperators0004
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((true != new Boolean(true))).assertFalse();
      expect((true != new Boolean(false))).assertTrue();
      expect((false != new Boolean(true))).assertTrue();
      expect((false != new Boolean(false))).assertFalse();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0500
     * @tc.name      testBooleanEqualityOperators0005
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((new Boolean(true) != new Boolean(true))).assertFalse();
      expect((new Boolean(true) != new Boolean(false))).assertTrue();
      expect((new Boolean(false) != new Boolean(true))).assertTrue();
      expect((new Boolean(false) != new Boolean(false))).assertFalse();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0600
     * @tc.name      testBooleanEqualityOperators0006
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((new Boolean(true) == new Boolean(true))).assertTrue();
      expect((new Boolean(true) == new Boolean(false))).assertFalse();
      expect((new Boolean(false) == new Boolean(true))).assertFalse();
      expect((new Boolean(false) == new Boolean(false))).assertTrue();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0700
     * @tc.name      testBooleanEqualityOperators0007
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(((true==false)==false == false==(false==true))).assertTrue();
      expect(((true!=false)==true == true==(false!=true))).assertTrue();
      expect((true === true)).assertTrue();
      expect((true === false)).assertFalse();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0800
     * @tc.name      testBooleanEqualityOperators0008
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false === true)).assertFalse();
      expect((false === false)).assertTrue();
      expect((true !== true)).assertFalse();
      expect((true !== false)).assertTrue();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_0900
     * @tc.name      testBooleanEqualityOperators0009
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false !== true)).assertTrue();
      expect((false !== false)).assertFalse();
      expect((true === new Boolean(true))).assertTrue();
      expect((true === new Boolean(false))).assertFalse();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_1000
     * @tc.name      testBooleanEqualityOperators0010
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false === new Boolean(true))).assertFalse();
      expect((false === new Boolean(false))).assertTrue();
      expect((true !== new Boolean(true))).assertFalse();
      expect((true !== new Boolean(false))).assertTrue();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_1100
     * @tc.name      testBooleanEqualityOperators0011
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((false !== new Boolean(true))).assertTrue();
      expect((false !== new Boolean(false))).assertFalse();
      expect((new Boolean(true) !== new Boolean(true))).assertFalse();
      expect((new Boolean(true) !== new Boolean(false))).assertTrue();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_1200
     * @tc.name      testBooleanEqualityOperators0012
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((new Boolean(false) !== new Boolean(true))).assertTrue();
      expect((new Boolean(false) !== new Boolean(false))).assertFalse();
      expect((new Boolean(true) === new Boolean(true))).assertTrue();
      expect((new Boolean(true) === new Boolean(false))).assertFalse();
    })

    /**
     * @tc.number    SUB_BOOLEAN_EQUALITY_OPERATORS_1300
     * @tc.name      testBooleanEqualityOperators0013
     * @tc.desc      Boolean equality
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testBooleanEqualityOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((new Boolean(false) === new Boolean(true))).assertFalse();
      expect((new Boolean(false) === new Boolean(false))).assertTrue();
      expect(((true===false)===false === false===(false===true))).assertTrue();
      expect(((true!==false)===true === true===(false!==true))).assertTrue();
    })
  })
}
