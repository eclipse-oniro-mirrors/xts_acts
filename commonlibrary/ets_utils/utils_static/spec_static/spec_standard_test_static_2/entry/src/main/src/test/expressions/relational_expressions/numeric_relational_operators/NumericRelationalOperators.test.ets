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
export default function NumericRelationalOperatorsTest(): void {
  describe("NumericRelationalOperatorsTest", () => {
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
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0100
    * @tc.name      testNumericRelationalOperators0001
    * @tc.desc      comparison with literals - decimal literal
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one: int = 1
      
      expect(one < 2).assertTrue()
      expect(-2 < one).assertTrue()
      expect(one < 2_1).assertTrue()
      expect(-2_1 < one).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0200
    * @tc.name      testNumericRelationalOperators0002
    * @tc.desc      comparison with literals - hex literal
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one: int = 1
      
      expect(one < 765234).assertTrue()
      expect(-765234 < one).assertTrue()
      expect(one < 0xBAD_3).assertTrue()
      expect(-0xBAD_3 < one).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0300
    * @tc.name      testNumericRelationalOperators0003
    * @tc.desc      comparison with literals - octal literal
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one: int = 1
      
      expect(one < 0o777).assertTrue()
      expect(-0o777 < one).assertTrue()
      expect(one < 0o777_1).assertTrue()
      expect(-0o777_1 < one).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0400
    * @tc.name      testNumericRelationalOperators0004
    * @tc.desc      comparison with literals - binary literal
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one: int = 1
      
      expect(one < 5).assertTrue()
      expect(-5 < one).assertTrue()
      expect(one < 0b101_1).assertTrue()
      expect(-0b101_1 < one).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0500
    * @tc.name      testNumericRelationalOperators0005
    * @tc.desc      comparison with literals - NaN
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const one: int = 1
      
      expect(one > NaN).assertFalse()
      expect(one < NaN).assertFalse()
      expect(one > -NaN).assertFalse()
      expect(one < -NaN).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0600
    * @tc.name      testNumericRelationalOperators0006
    * @tc.desc      comparison with utility types and local smart types
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let one: NonNullable<int> = 1
      let two: Readonly<int> = 2
      let three: Required<Readonly<number>> = 3.1
      let four: Required<NonNullable<Readonly<number>>> = 4.0
      //local smart type, effectively number
      let five: number|string = 5
      
      expect(one > 0).assertTrue()
      expect(two <= 3).assertTrue()
      expect(three >= 3).assertTrue()
      expect(four < 5).assertTrue()
      expect(five <= 5).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0700
    * @tc.name      testNumericRelationalOperators0007
    * @tc.desc      Integer comparison 0.0 > 1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0.toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0800
    * @tc.name      testNumericRelationalOperators0008
    * @tc.desc      Integer comparison 1.0 > 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_0900
    * @tc.name      testNumericRelationalOperators0009
    * @tc.desc      Integer comparison -1.0 > 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1000
    * @tc.name      testNumericRelationalOperators0010
    * @tc.desc      Integer comparison 0.0 > -1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -1.0.toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1100
    * @tc.name      testNumericRelationalOperators0011
    * @tc.desc      Integer comparison 0.0f > 1.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f.toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1200
    * @tc.name      testNumericRelationalOperators0012
    * @tc.desc      Integer comparison 1.0f > 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1300
    * @tc.name      testNumericRelationalOperators0013
    * @tc.desc      Integer comparison -1.0f > 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = -1.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1400
    * @tc.name      testNumericRelationalOperators0014
    * @tc.desc      Integer comparison 0.0f > -1.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = -1.0f.toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1500
    * @tc.name      testNumericRelationalOperators0015
    * @tc.desc      Integer comparison 0.0 < 1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0.toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1600
    * @tc.name      testNumericRelationalOperators0016
    * @tc.desc      Integer comparison 1.0 < 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1700
    * @tc.name      testNumericRelationalOperators0017
    * @tc.desc      Integer comparison -1.0 < 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1800
    * @tc.name      testNumericRelationalOperators0018
    * @tc.desc      Integer comparison 0.0 < -1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -1.0.toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_1900
    * @tc.name      testNumericRelationalOperators0019
    * @tc.desc      Integer comparison 0.0f < 1.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f.toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2000
    * @tc.name      testNumericRelationalOperators0020
    * @tc.desc      Integer comparison 1.0f < 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2100
    * @tc.name      testNumericRelationalOperators0021
    * @tc.desc      Integer comparison -1.0f < 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = -1.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2200
    * @tc.name      testNumericRelationalOperators0022
    * @tc.desc      Integer comparison 0.0f < -1.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = -1.0f.toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2300
    * @tc.name      testNumericRelationalOperators0023
    * @tc.desc      Integer comparison 0.0 >= 1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2400
    * @tc.name      testNumericRelationalOperators0024
    * @tc.desc      Integer comparison 1.0 >= 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2500
    * @tc.name      testNumericRelationalOperators0025
    * @tc.desc      Integer comparison -1.0 >= 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2600
    * @tc.name      testNumericRelationalOperators0026
    * @tc.desc      Integer comparison 0.0 >= -1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -1.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2700
    * @tc.name      testNumericRelationalOperators0027
    * @tc.desc      Integer comparison 0.0 >= 1.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: float = 1.0f.toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2800
    * @tc.name      testNumericRelationalOperators0028
    * @tc.desc      Integer comparison 1.0 >= 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0.toDouble();
      let bx: Double = new Double(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_2900
    * @tc.name      testNumericRelationalOperators0029
    * @tc.desc      Integer comparison -1.0 >= 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0.toDouble();
      let bx: Double = new Double(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3000
    * @tc.name      testNumericRelationalOperators0030
    * @tc.desc      Integer comparison 0.0 >= -1.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: float = -1.0f.toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3100
    * @tc.name      testNumericRelationalOperators0031
    * @tc.desc      Integer comparison 0.0 <= 1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3200
    * @tc.name      testNumericRelationalOperators0032
    * @tc.desc      Integer comparison 1.0 <= 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3300
    * @tc.name      testNumericRelationalOperators0033
    * @tc.desc      Integer comparison -1.0 <= 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3400
    * @tc.name      testNumericRelationalOperators0034
    * @tc.desc      Integer comparison 0.0 <= -1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -1.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3500
    * @tc.name      testNumericRelationalOperators0035
    * @tc.desc      Integer comparison 0.0f <= 1.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f.toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3600
    * @tc.name      testNumericRelationalOperators0036
    * @tc.desc      Integer comparison 1.0f <= 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 1.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3700
    * @tc.name      testNumericRelationalOperators0037
    * @tc.desc      Integer comparison -1.0f <= 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = -1.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3800
    * @tc.name      testNumericRelationalOperators0038
    * @tc.desc      Integer comparison 0.0f <= -1.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = -1.0f.toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_3900
    * @tc.name      testNumericRelationalOperators0039
    * @tc.desc      Integer comparison (0.0) >= (-0.0)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Double = (0.0).toDouble();
      let bx: Double = new Double(x);
      let y: Float = (-0.0).toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4000
    * @tc.name      testNumericRelationalOperators0040
    * @tc.desc      Integer comparison (0.0) <= (-0.0)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Double = (0.0).toDouble();
      let bx: Double = new Double(x);
      let y: Float = (-0.0).toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4100
    * @tc.name      testNumericRelationalOperators0041
    * @tc.desc      Integer comparison (1.0) >= (1.0)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Double = (1.0).toDouble();
      let bx: Double = new Double(x);
      let y: Float = (1.0).toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4200
    * @tc.name      testNumericRelationalOperators0042
    * @tc.desc      Integer comparison (1.0) <= (1.0)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Double = (1.0).toDouble();
      let bx: Double = new Double(x);
      let y: Float = (1.0).toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4300
    * @tc.name      testNumericRelationalOperators0043
    * @tc.desc      Integer comparison (-1.0) >= (-1.0)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Double = (-1.0).toDouble();
      let bx: Double = new Double(x);
      let y: Float = (-1.0).toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4400
    * @tc.name      testNumericRelationalOperators0044
    * @tc.desc      Integer comparison (-1.0) <= (-1.0)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Double = (-1.0).toDouble();
      let bx: Double = new Double(x);
      let y: Float = (-1.0).toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4500
    * @tc.name      testNumericRelationalOperators0045
    * @tc.desc      Integer comparison 0.0 >= -0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -0.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4600
    * @tc.name      testNumericRelationalOperators0046
    * @tc.desc      Integer comparison 0.0 <= -0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -0.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4700
    * @tc.name      testNumericRelationalOperators0047
    * @tc.desc      Integer comparison 1.0 >= 1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4800
    * @tc.name      testNumericRelationalOperators0048
    * @tc.desc      Integer comparison 1.0 <= 1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_4900
    * @tc.name      testNumericRelationalOperators0049
    * @tc.desc      Integer comparison -1.0 >= -1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -1.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertTrue()
      expect((bx >= by)).assertTrue()
      expect((x >= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5000
    * @tc.name      testNumericRelationalOperators0050
    * @tc.desc      Integer comparison -1.0 <= -1.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = -1.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -1.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5100
    * @tc.name      testNumericRelationalOperators0051
    * @tc.desc      Integer comparison sqrt(-1.0f) > 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = sqrt(-1.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5200
    * @tc.name      testNumericRelationalOperators0052
    * @tc.desc      Integer comparison 0.0f > sqrt(-1.0f)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = sqrt(-1.0f).toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5300
    * @tc.name      testNumericRelationalOperators0053
    * @tc.desc      Integer comparison sqrt(-1.0f) < 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = sqrt(-1.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5400
    * @tc.name      testNumericRelationalOperators0054
    * @tc.desc      Integer comparison 0.0f < sqrt(-1.0f)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = sqrt(-1.0f).toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5500
    * @tc.name      testNumericRelationalOperators0055
    * @tc.desc      Integer comparison sqrt(-1.0f) >= 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = sqrt(-1.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5600
    * @tc.name      testNumericRelationalOperators0056
    * @tc.desc      Integer comparison 0.0f >= sqrt(-1.0f)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = sqrt(-1.0f).toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5700
    * @tc.name      testNumericRelationalOperators0057
    * @tc.desc      Integer comparison sqrt(-1) <= 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = sqrt(-1).toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5800
    * @tc.name      testNumericRelationalOperators0058
    * @tc.desc      Integer comparison 0.0f <= sqrt(-1.0f)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = sqrt(-1.0f).toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_5900
    * @tc.name      testNumericRelationalOperators0059
    * @tc.desc      Integer comparison sqrt(-1) > 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = sqrt(-1).toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6000
    * @tc.name      testNumericRelationalOperators0060
    * @tc.desc      Integer comparison 0.0 > sqrt(-1)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = sqrt(-1).toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6100
    * @tc.name      testNumericRelationalOperators0061
    * @tc.desc      Integer comparison sqrt(-1) < 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = sqrt(-1).toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6200
    * @tc.name      testNumericRelationalOperators0062
    * @tc.desc      Integer comparison 0.0 < sqrt(-1)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = sqrt(-1).toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertFalse()
      expect((bx < by)).assertFalse()
      expect((x < by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6300
    * @tc.name      testNumericRelationalOperators0063
    * @tc.desc      Integer comparison sqrt(-1) >= 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = sqrt(-1).toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6400
    * @tc.name      testNumericRelationalOperators0064
    * @tc.desc      Integer comparison 0.0 >= sqrt(-1)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = sqrt(-1).toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6500
    * @tc.name      testNumericRelationalOperators0065
    * @tc.desc      Integer comparison sqrt(-1) <= 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = sqrt(-1).toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6600
    * @tc.name      testNumericRelationalOperators0066
    * @tc.desc      Integer comparison 0.0 <= sqrt(-1)
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = sqrt(-1).toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertFalse()
      expect((bx <= by)).assertFalse()
      expect((x <= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6700
    * @tc.name      testNumericRelationalOperators0067
    * @tc.desc      Integer comparison log(0.0f) < 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = log(0.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6800
    * @tc.name      testNumericRelationalOperators0068
    * @tc.desc      Integer comparison log(0.0f) <= 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = log(0.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_6900
    * @tc.name      testNumericRelationalOperators0069
    * @tc.desc      Integer comparison log(0.0f) > 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = log(0.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7000
    * @tc.name      testNumericRelationalOperators0070
    * @tc.desc      Integer comparison log(0.0f) >= 0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = log(0.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7100
    * @tc.name      testNumericRelationalOperators0071
    * @tc.desc      Integer comparison 0.0f < 1.0f/0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f/0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7200
    * @tc.name      testNumericRelationalOperators0072
    * @tc.desc      Integer comparison 0.0f <= 1.0f/0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f/0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7300
    * @tc.name      testNumericRelationalOperators0073
    * @tc.desc      Integer comparison 0.0f > 1.0f/0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f/0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7400
    * @tc.name      testNumericRelationalOperators0074
    * @tc.desc      Integer comparison 0.0f >= 1.0f/0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f/0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7500
    * @tc.name      testNumericRelationalOperators0075
    * @tc.desc      Integer comparison log(0.0f) < 1.0f/0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = log(0.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f/0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7600
    * @tc.name      testNumericRelationalOperators0076
    * @tc.desc      Integer comparison log(0.0f) <= 1.0f/0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = log(0.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f/0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7700
    * @tc.name      testNumericRelationalOperators0077
    * @tc.desc      Integer comparison log(0.0f) > 1.0f/0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = log(0.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f/0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7800
    * @tc.name      testNumericRelationalOperators0078
    * @tc.desc      Integer comparison log(0.0f) >= 1.0f/0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = log(0.0f).toFloat();
      let bx: Float = new Float(x);
      let y: float = 1.0f/0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_7900
    * @tc.name      testNumericRelationalOperators0079
    * @tc.desc      Integer comparison log(0) < 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = log(0).toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8000
    * @tc.name      testNumericRelationalOperators0080
    * @tc.desc      Integer comparison log(0) <= 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = log(0).toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8100
    * @tc.name      testNumericRelationalOperators0081
    * @tc.desc      Integer comparison log(0) > 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = log(0).toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8200
    * @tc.name      testNumericRelationalOperators0082
    * @tc.desc      Integer comparison log(0) >= 0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = log(0).toDouble();
      let bx: Double = new Double(x);
      let y: double = 0.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8300
    * @tc.name      testNumericRelationalOperators0083
    * @tc.desc      Integer comparison 0.0 < 1.0/0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0/0.0.toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8400
    * @tc.name      testNumericRelationalOperators0084
    * @tc.desc      Integer comparison 0.0 <= 1.0/0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0/0.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8500
    * @tc.name      testNumericRelationalOperators0085
    * @tc.desc      Integer comparison 0.0 > 1.0/0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0/0.0.toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8600
    * @tc.name      testNumericRelationalOperators0086
    * @tc.desc      Integer comparison 0.0 >= 1.0/0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0/0.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8700
    * @tc.name      testNumericRelationalOperators0087
    * @tc.desc      Integer comparison log(0) < 1.0/0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = log(0).toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0/0.0.toDouble();
      let by: Double = new Double(y);
      expect((x < y)).assertTrue()
      expect((bx < by)).assertTrue()
      expect((x < by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8800
    * @tc.name      testNumericRelationalOperators0088
    * @tc.desc      Integer comparison log(0) <= 1.0/0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = log(0).toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0/0.0.toDouble();
      let by: Double = new Double(y);
      expect((x <= y)).assertTrue()
      expect((bx <= by)).assertTrue()
      expect((x <= by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_8900
    * @tc.name      testNumericRelationalOperators0089
    * @tc.desc      Integer comparison log(0) > 1.0/0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = log(0).toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0/0.0.toDouble();
      let by: Double = new Double(y);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9000
    * @tc.name      testNumericRelationalOperators0090
    * @tc.desc      Integer comparison log(0) >= 1.0/0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = log(0).toDouble();
      let bx: Double = new Double(x);
      let y: double = 1.0/0.0.toDouble();
      let by: Double = new Double(y);
      expect((x >= y)).assertFalse()
      expect((bx >= by)).assertFalse()
      expect((x >= by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9100
    * @tc.name      testNumericRelationalOperators0091
    * @tc.desc      Integer comparison 0.0 == -0.0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 0.0.toDouble();
      let bx: Double = new Double(x);
      let y: double = -0.0.toDouble();
      let by: Double = new Double(y);
      expect((x == y)).assertTrue()
      expect((bx == by)).assertTrue()
      expect((x == by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9200
    * @tc.name      testNumericRelationalOperators0092
    * @tc.desc      Integer comparison 0.0f == -0.0f
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: float = 0.0f.toFloat();
      let bx: Float = new Float(x);
      let y: float = -0.0f.toFloat();
      let by: Float = new Float(y);
      expect((x == y)).assertTrue()
      expect((bx == by)).assertTrue()
      expect((x == by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9300
    * @tc.name      testNumericRelationalOperators0093
    * @tc.desc      Integer comparison 0 > 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = 1;
      let by: Int = new Int(1);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9400
    * @tc.name      testNumericRelationalOperators0094
    * @tc.desc      Integer comparison 1 > 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let bx: Int = new Int(1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9500
    * @tc.name      testNumericRelationalOperators0095
    * @tc.desc      Integer comparison -1 > 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = -1;
      let bx: Int = new Int(-1);
      let y: int = 0;
      let by: Int = new Int(0);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9600
    * @tc.name      testNumericRelationalOperators0096
    * @tc.desc      Integer comparison 0 > -1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 0;
      let bx: Int = new Int(0);
      let y: int = -1;
      let by: Int = new Int(-1);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9700
    * @tc.name      testNumericRelationalOperators0097
    * @tc.desc      Integer comparison 0 > 1
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 0;
      let bx: Byte = new Byte(0);
      let y: byte = 1;
      let by: Byte = new Byte(1);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9800
    * @tc.name      testNumericRelationalOperators0098
    * @tc.desc      Integer comparison 1 > 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let bx: Byte = new Byte(1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x > y)).assertTrue()
      expect((bx > by)).assertTrue()
      expect((x > by)).assertTrue()
    })
    /**
    * @tc.number    SUB_NUMERIC_RELATIONAL_OPERATORS_9900
    * @tc.name      testNumericRelationalOperators0099
    * @tc.desc      Integer comparison -1 > 0
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testNumericRelationalOperators0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = -1;
      let bx: Byte = new Byte(-1);
      let y: byte = 0;
      let by: Byte = new Byte(0);
      expect((x > y)).assertFalse()
      expect((bx > by)).assertFalse()
      expect((x > by)).assertFalse()
    })
  })
}

