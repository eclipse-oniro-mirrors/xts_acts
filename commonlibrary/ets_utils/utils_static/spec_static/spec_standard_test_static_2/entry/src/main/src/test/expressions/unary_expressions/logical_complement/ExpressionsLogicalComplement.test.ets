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


enum logical_complement_enum_Color { Red, Green, Blue }
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsLogicalComplement(): void {
  describe("ExpressionsLogicalComplement", () => {
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
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0100
     * @tc.name      testExpressionsLogicalComplement0001
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = true;
      expect(!a).assertEqual(false);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0200
     * @tc.name      testExpressionsLogicalComplement0002
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = false;
      expect(!a).assertEqual(true);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0300
     * @tc.name      testExpressionsLogicalComplement0003
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0;
      expect(!a).assertEqual(true);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0400
     * @tc.name      testExpressionsLogicalComplement0004
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1;
      expect(!a).assertEqual(false);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0500
     * @tc.name      testExpressionsLogicalComplement0005
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1.0;
      expect(!a).assertEqual(false);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0600
     * @tc.name      testExpressionsLogicalComplement0006
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1n;
      expect(!a).assertEqual(false);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0700
     * @tc.name      testExpressionsLogicalComplement0007
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = undefined;
      expect(!a).assertEqual(true);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0800
     * @tc.name      testExpressionsLogicalComplement0008
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = null;
      expect(!a).assertEqual(true);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_0900
     * @tc.name      testExpressionsLogicalComplement0009
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 注意：在TypeScript/JavaScript中没有字符字面量语法c'v'，我们使用字符串'v'代替
      let a = 'v';
      expect(!a).assertEqual(false);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_1000
     * @tc.name      testExpressionsLogicalComplement0010
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new Object();
      expect(!a).assertEqual(false);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_1100
     * @tc.name      testExpressionsLogicalComplement0011
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = '';
      expect(!a).assertEqual(true);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_1200
     * @tc.name      testExpressionsLogicalComplement0012
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 'fghdm';
      expect(!a).assertEqual(false);
      expect((!a) instanceof boolean).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_1300
     * @tc.name      testExpressionsLogicalComplement0013
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = logical_complement_enum_Color.Red
      expect(!c).assertEqual(true)
      c = logical_complement_enum_Color.Green
      expect(!c).assertEqual(false)
      c = logical_complement_enum_Color.Blue
      expect(!c).assertEqual(false)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_1400
     * @tc.name      testExpressionsLogicalComplement0014
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: int | null = null
      expect(!b).assertEqual(true)
      b = 3
      expect(!b).assertEqual(false)
      b = 0
      expect(!b).assertEqual(true)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_LOGICAL_COMPLEMENT_1500
     * @tc.name      testExpressionsLogicalComplement0015
     * @tc.desc      Logical complement operator. Logical complement operator yields a boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsLogicalComplement0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = "";
      expect(!a).assertEqual(true)
      a = "non empty string"
      expect(!a).assertEqual(false)
    });

  });
}