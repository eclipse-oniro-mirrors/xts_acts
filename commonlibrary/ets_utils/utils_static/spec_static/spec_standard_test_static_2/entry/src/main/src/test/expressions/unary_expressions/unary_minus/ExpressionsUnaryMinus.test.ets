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

enum unary_minus_int_enum_IntEnum: int {
    Neg = -1,
    Pos = 1,
    Min = -2147483648,
    Max = 2147483647
}

enum unary_minus_long_enum_LongEnum: long {
    Neg = -0x1_1111_1111,
    Pos = 0x1_1111_1111,
    Min = -9223372036854775808,
    Max = 9223372036854775807
}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsUnaryMinus(): void {
  describe("ExpressionsUnaryMinus", () => {
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
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0100
     * @tc.name      testExpressionsUnaryMinus0001
     * @tc.desc      Numeric widening occurs on the expression before a unary plus operator
     *               is applied. The same maximum negative number results from the negation of the maximum
     *               negative int or long.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: byte = 127
      expect(-b).assertEqual(-127)
      expect((-b) instanceof int).assertTrue()

      let b2: byte = -128
      expect(-b2).assertEqual(128)
      expect((-b2) instanceof int).assertTrue()

      let s: short = 32767
      expect(-s).assertEqual(-32767)
      expect((-s) instanceof int).assertTrue()

      let s2: short = -32768
      expect(-s2).assertEqual(32768)
      expect((-s2) instanceof int).assertTrue()

      let i: int = 2147483647
      expect(-i).assertEqual(-2147483647)
      expect((-i) instanceof int).assertTrue()

      let i2: int = -2147483648
      expect(-i2).assertEqual(-2147483648)
      expect((-i2) instanceof int).assertTrue()

      let l: long = 9223372036854775807
      expect(-l).assertEqual(-9223372036854775807);
      expect((-l) instanceof long).assertTrue()

      let l2: long = -9223372036854775808
      expect(-l2).assertEqual(-9223372036854775808);
      expect((-l2) instanceof long).assertTrue()

      let bi: bigint = 42n
      expect(-bi).assertEqual(-42n);
      expect((-bi) instanceof bigint).assertTrue()

      let n: number = 3.14;
      expect(-n).assertEqual(-3.14);
      expect((-n) instanceof double).assertTrue()

      let d: double = -3.14;
      expect(-d).assertEqual(3.14);
      expect((-d) instanceof double).assertTrue()

      let f: float = 3.14f;
      expect(-f).assertEqual(-3.14f);
      expect((-f) instanceof float).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0200
     * @tc.name      testExpressionsUnaryMinus0002
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Math.sqrt(-1);
      expect(-a).not().assertEqual(Math.sqrt(-1));
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0300
     * @tc.name      testExpressionsUnaryMinus0003
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1.0/0.0;
      expect(-a).assertEqual(Math.log(0));
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0400
     * @tc.name      testExpressionsUnaryMinus0004
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Infinity;
      expect(-a).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0500
     * @tc.name      testExpressionsUnaryMinus0005
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = Math.log(0);
      expect(-a).assertEqual(1.0/0.0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0600
     * @tc.name      testExpressionsUnaryMinus0006
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = -Infinity;
      expect(-a).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0700
     * @tc.name      testExpressionsUnaryMinus0007
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0.0;
      expect(-a).assertEqual(-0.0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0800
     * @tc.name      testExpressionsUnaryMinus0008
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = -0.0;
      expect(-a).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_0900
     * @tc.name      testExpressionsUnaryMinus0009
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0;
      expect(-a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1000
     * @tc.name      testExpressionsUnaryMinus0010
     * @tc.desc      Unary minus operator (corner cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 0;
      expect(-a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1100
     * @tc.name      testExpressionsUnaryMinus0011
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 127;
      expect(-a).assertEqual(-127);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1200
     * @tc.name      testExpressionsUnaryMinus0012
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 32767;
      expect(-a).assertEqual(-32767);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1300
     * @tc.name      testExpressionsUnaryMinus0013
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 2147483647;
      expect(-a).assertEqual(-2147483647);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1400
     * @tc.name      testExpressionsUnaryMinus0014
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 9223372036854775807;
      expect(-a).assertEqual(-9223372036854775807);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1500
     * @tc.name      testExpressionsUnaryMinus0015
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: bigint = 42n;
      expect(-a).assertEqual(-42n);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1600
     * @tc.name      testExpressionsUnaryMinus0016
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0;
      expect(-a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1700
     * @tc.name      testExpressionsUnaryMinus0017
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = 0;
      expect(-a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1800
     * @tc.name      testExpressionsUnaryMinus0018
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = 0;
      expect(-a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_1900
     * @tc.name      testExpressionsUnaryMinus0019
     * @tc.desc      Unary minus operator (inbound)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = 0;
      expect(-a).assertEqual(0);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2000
     * @tc.name      testExpressionsUnaryMinus0020
     * @tc.desc      Type of the operand expression with the unary operator - must be convertible
     *               (see Widening Numeric Conversions) to a numeric type (see Numeric Types).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = -(unary_minus_int_enum_IntEnum.Neg.valueOf())
      expect(n).assertEqual(1)
      expect(-n).assertEqual(-1)

      let p: int = -(unary_minus_int_enum_IntEnum.Pos.valueOf())
      expect(p).assertEqual(-1)
      expect(-p).assertEqual(1)

      expect(-(unary_minus_int_enum_IntEnum.Neg.valueOf())).assertEqual(1)
      expect(-(unary_minus_int_enum_IntEnum.Pos.valueOf())).assertEqual(-1)

      expect(-(unary_minus_int_enum_IntEnum.Max.valueOf())).assertEqual(-2147483647)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2100
     * @tc.name      testExpressionsUnaryMinus0021
     * @tc.desc      Type of the operand expression with the unary operator - must be convertible
     *               (see Implicit Conversions) to a numeric type (see Numeric Types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: long = -(unary_minus_long_enum_LongEnum.Neg.valueOf())
      expect(n).assertEqual(0x1_1111_1111)
      expect(-n).assertEqual(-0x1_1111_1111)

      let p: long = -(unary_minus_long_enum_LongEnum.Pos.valueOf())
      expect(p).assertEqual(-0x1_1111_1111)
      expect(-p).assertEqual(0x1_1111_1111)

      expect(-(unary_minus_long_enum_LongEnum.Max.valueOf())).assertEqual(-9223372036854775807)

      expect(-(unary_minus_long_enum_LongEnum.Neg.valueOf())).assertEqual(0x1_1111_1111)
      expect(-(unary_minus_long_enum_LongEnum.Pos.valueOf())).assertEqual(-0x1_1111_1111)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2200
     * @tc.name      testExpressionsUnaryMinus0022
     * @tc.desc      Unary minus operator (onbound) (these are special cases for numeric overflow
     *               behavior. Special attention wanted).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -127;
      expect(-a).assertEqual(127);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2300
     * @tc.name      testExpressionsUnaryMinus0023
     * @tc.desc      Unary minus operator (onbound) (these are special cases for numeric overflow
     *               behavior. Special attention wanted).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: short = -32767;
      expect(-a).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2400
     * @tc.name      testExpressionsUnaryMinus0024
     * @tc.desc      Unary minus operator (onbound) (these are special cases for numeric overflow
     *               behavior. Special attention wanted).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -2147483647;
      expect(-a).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2500
     * @tc.name      testExpressionsUnaryMinus0025
     * @tc.desc      Unary minus operator (onbound) (these are special cases for numeric overflow
     *               behavior. Special attention wanted).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = -9223372036854775807;
      expect(-a).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2600
     * @tc.name      testExpressionsUnaryMinus0026
     * @tc.desc      "Unary minus operator. The range of two\u2019s-complement value is not symmetric.\
     *               \ The same maximum negative number results from the negation of the maximum negative\
     *               \ int or long."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: long = -9223372036854775808
      let b: long = -a
      expect(b).assertEqual(a)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2700
     * @tc.name      testExpressionsUnaryMinus0027
     * @tc.desc      "Unary minus operator. The range of two\u2019s-complement value is not symmetric.\
     *               \ The same maximum negative number results from the negation of the maximum negative\
     *               \ int or long."
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int = -2147483648
      let b: int = -a
      expect(b).assertEqual(a)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2800
     * @tc.name      testExpressionsUnaryMinus0028
     * @tc.desc      Unary minus operator. Operand NaN results in NaN (NaN has no sign).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: double =  Double.NaN
      expect(Double.isNaN(a)).assertEqual(Double.isNaN(-a))
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_MINUS_2900
     * @tc.name      testExpressionsUnaryMinus0029
     * @tc.desc      Unary minus operator. Operand NaN results in NaN (NaN has no sign).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryMinus0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: float =  Float.NaN
      expect(Float.isNaN(a)).assertEqual(Float.isNaN(-a))
    });
  });
}
