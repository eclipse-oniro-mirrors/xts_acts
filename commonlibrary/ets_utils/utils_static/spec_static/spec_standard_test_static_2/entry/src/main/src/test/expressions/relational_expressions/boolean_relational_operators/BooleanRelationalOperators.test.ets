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
export default function BooleanRelationalTest(): void {
  describe("BooleanRelationalTest", () => {
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
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0100
    * @tc.name      testBooleanRelationalOperators0001
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      let bx: Boolean = new Boolean(false)
      let y: boolean = false
      let by: Boolean = new Boolean(false)
      
      expect((false < false )).assertFalse()
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0200
    * @tc.name      testBooleanRelationalOperators0002
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      let bx: Boolean = new Boolean(false)
      let y: boolean = true
      let by: Boolean = new Boolean(true)
      
      expect((false < true )).assertTrue()
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0300
    * @tc.name      testBooleanRelationalOperators0003
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      let bx: Boolean = new Boolean(true)
      let y: boolean = false
      let by: Boolean = new Boolean(false)
      
      expect((true < false )).assertFalse()
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0400
    * @tc.name      testBooleanRelationalOperators0004
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      let bx: Boolean = new Boolean(true)
      let y: boolean = true
      let by: Boolean = new Boolean(true)
      
      expect((true < true )).assertFalse()
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0500
    * @tc.name      testBooleanRelationalOperators0005
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      let bx: Boolean = new Boolean(false)
      let y: boolean = false
      let by: Boolean = new Boolean(false)
      
      expect((false <= false )).assertTrue()
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0600
    * @tc.name      testBooleanRelationalOperators0006
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      let bx: Boolean = new Boolean(false)
      let y: boolean = true
      let by: Boolean = new Boolean(true)
      
      expect((false <= true )).assertTrue()
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0700
    * @tc.name      testBooleanRelationalOperators0007
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      let bx: Boolean = new Boolean(true)
      let y: boolean = false
      let by: Boolean = new Boolean(false)
      
      expect((true <= false )).assertFalse()
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0800
    * @tc.name      testBooleanRelationalOperators0008
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      let bx: Boolean = new Boolean(true)
      let y: boolean = true
      let by: Boolean = new Boolean(true)
      
      expect((true <= true )).assertTrue()
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_0900
    * @tc.name      testBooleanRelationalOperators0009
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      let bx: Boolean = new Boolean(false)
      let y: boolean = false
      let by: Boolean = new Boolean(false)
      
      expect((false > false )).assertFalse()
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_1000
    * @tc.name      testBooleanRelationalOperators0010
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      let bx: Boolean = new Boolean(false)
      let y: boolean = true
      let by: Boolean = new Boolean(true)
      
      expect((false > true )).assertFalse()
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_1100
    * @tc.name      testBooleanRelationalOperators0011
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      let bx: Boolean = new Boolean(true)
      let y: boolean = false
      let by: Boolean = new Boolean(false)
      
      expect((true > false )).assertTrue()
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_1200
    * @tc.name      testBooleanRelationalOperators0012
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      let bx: Boolean = new Boolean(true)
      let y: boolean = true
      let by: Boolean = new Boolean(true)
      
      expect((true > true )).assertFalse()
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_1300
    * @tc.name      testBooleanRelationalOperators0013
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      let bx: Boolean = new Boolean(false)
      let y: boolean = false
      let by: Boolean = new Boolean(false)
      
      expect((false >= false )).assertTrue()
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_1400
    * @tc.name      testBooleanRelationalOperators0014
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = false
      let bx: Boolean = new Boolean(false)
      let y: boolean = true
      let by: Boolean = new Boolean(true)
      
      expect((false >= true )).assertFalse()
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_1500
    * @tc.name      testBooleanRelationalOperators0015
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      let bx: Boolean = new Boolean(true)
      let y: boolean = false
      let by: Boolean = new Boolean(false)
      
      expect((true >= false )).assertTrue()
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_BOOLEAN_RELATIONAL_OPERATORS_1600
    * @tc.name      testBooleanRelationalOperators0016
    * @tc.desc      
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testBooleanRelationalOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: boolean = true
      let bx: Boolean = new Boolean(true)
      let y: boolean = true
      let by: Boolean = new Boolean(true)
      
      expect((true >= true )).assertTrue()
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
  })
}

