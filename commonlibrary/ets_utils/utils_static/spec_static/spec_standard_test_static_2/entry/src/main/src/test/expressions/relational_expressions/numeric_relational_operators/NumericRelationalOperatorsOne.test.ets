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
export default function NumericRelationalOperatorsOneTest(): void {
  describe("NumericRelationalOperatorsOneTest", () => {
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
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0100
    * @tc.name      testNumericRelationalOperatorsOne0001
    * @tc.desc      Integer comparison 0 > -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = -1;
      let by: Byte = new Byte(-1);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0200
    * @tc.name      testNumericRelationalOperatorsOne0002
    * @tc.desc      Integer comparison 0 < 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0300
    * @tc.name      testNumericRelationalOperatorsOne0003
    * @tc.desc      Integer comparison 1 < 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0400
    * @tc.name      testNumericRelationalOperatorsOne0004
    * @tc.desc      Integer comparison -1 < 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0500
    * @tc.name      testNumericRelationalOperatorsOne0005
    * @tc.desc      Integer comparison 0 < -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0600
    * @tc.name      testNumericRelationalOperatorsOne0006
    * @tc.desc      Integer comparison 0 < 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = 1;
      let by: Byte = new Byte(1);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0700
    * @tc.name      testNumericRelationalOperatorsOne0007
    * @tc.desc      Integer comparison 1 < 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let bx: Byte = new Byte(1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0800
    * @tc.name      testNumericRelationalOperatorsOne0008
    * @tc.desc      Integer comparison -1 < 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -1;
      let bx: Byte = new Byte(-1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_0900
    * @tc.name      testNumericRelationalOperatorsOne0009
    * @tc.desc      Integer comparison 0 < -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = -1;
      let by: Byte = new Byte(-1);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1000
    * @tc.name      testNumericRelationalOperatorsOne0010
    * @tc.desc      Integer comparison 0 >= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1100
    * @tc.name      testNumericRelationalOperatorsOne0011
    * @tc.desc      Integer comparison 1 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1200
    * @tc.name      testNumericRelationalOperatorsOne0012
    * @tc.desc      Integer comparison -1 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1300
    * @tc.name      testNumericRelationalOperatorsOne0013
    * @tc.desc      Integer comparison 0 >= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1400
    * @tc.name      testNumericRelationalOperatorsOne0014
    * @tc.desc      Integer comparison 0 >= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: byte = 1;
      let by: Byte = new Byte(1);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1500
    * @tc.name      testNumericRelationalOperatorsOne0015
    * @tc.desc      Integer comparison 1 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1600
    * @tc.name      testNumericRelationalOperatorsOne0016
    * @tc.desc      Integer comparison -1 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1700
    * @tc.name      testNumericRelationalOperatorsOne0017
    * @tc.desc      Integer comparison 0 >= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: byte = -1;
      let by: Byte = new Byte(-1);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1800
    * @tc.name      testNumericRelationalOperatorsOne0018
    * @tc.desc      Integer comparison 0 <= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_1900
    * @tc.name      testNumericRelationalOperatorsOne0019
    * @tc.desc      Integer comparison 1 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2000
    * @tc.name      testNumericRelationalOperatorsOne0020
    * @tc.desc      Integer comparison -1 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2100
    * @tc.name      testNumericRelationalOperatorsOne0021
    * @tc.desc      Integer comparison 0 <= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2200
    * @tc.name      testNumericRelationalOperatorsOne0022
    * @tc.desc      Integer comparison 0 <= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = 1;
      let by: Byte = new Byte(1);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2300
    * @tc.name      testNumericRelationalOperatorsOne0023
    * @tc.desc      Integer comparison 1 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let bx: Byte = new Byte(1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2400
    * @tc.name      testNumericRelationalOperatorsOne0024
    * @tc.desc      Integer comparison -1 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -1;
      let bx: Byte = new Byte(-1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2500
    * @tc.name      testNumericRelationalOperatorsOne0025
    * @tc.desc      Integer comparison 0 <= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = -1;
      let by: Byte = new Byte(-1);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2600
    * @tc.name      testNumericRelationalOperatorsOne0026
    * @tc.desc      Integer comparison 0 >= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2700
    * @tc.name      testNumericRelationalOperatorsOne0027
    * @tc.desc      Integer comparison 0 <= 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2800
    * @tc.name      testNumericRelationalOperatorsOne0028
    * @tc.desc      Integer comparison 1 >= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_2900
    * @tc.name      testNumericRelationalOperatorsOne0029
    * @tc.desc      Integer comparison 1 <= 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_3000
    * @tc.name      testNumericRelationalOperatorsOne0030
    * @tc.desc      Integer comparison -1 >= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_ONE_3100
    * @tc.name      testNumericRelationalOperatorsOne0031
    * @tc.desc      Integer comparison -1 <= -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperatorsOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })

  })
}
