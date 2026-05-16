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

enum int_enum_IntEnum {
    Neg = -1,
    Pos = 1,
    Min = -2147483648,
    Max = 2147483647
}

interface LongEnumInterface {
  Neg: long;
  Pos: long;
  Min: long;
  Max: long;
}
const long_enum_LongEnum: LongEnumInterface = {
  Neg: -0x1_1111_1111,
  Pos: 0x1_1111_1111,
  Min: -9223372036854775808,
  Max: 9223372036854775807
}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsUnaryPlus(): void {
  describe("ExpressionsUnaryPlus", () => {
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
     * @tc.number    SUB_EXPRESSIONS_UNARY_PLUS_0100
     * @tc.name      testExpressionsUnaryPlus0001
     * @tc.desc      Type of the operand expression with the unary operator + must be convertible
     *               (see Implicit Conversions) to a numeric type (see Numeric Types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryPlus0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let iNeg: int = int_enum_IntEnum.Neg
      let iPos: int = int_enum_IntEnum.Pos
      let iMin: int = int_enum_IntEnum.Min
      let iMax: int = int_enum_IntEnum.Max

      let n = +iNeg
      expect(n).assertEqual(-1)
      expect(+n).assertEqual(-1)

      let p = +iPos
      expect(p).assertEqual(1)
      expect(+p).assertEqual(1)

      expect(+iNeg).assertEqual(iNeg)
      expect(+iPos).assertEqual(iPos)

      expect(+iMin).assertEqual(iMin)
      expect(+iMax).assertEqual(iMax)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_PLUS_0200
     * @tc.name      testExpressionsUnaryPlus0002
     * @tc.desc      Type of the operand expression with the unary operator + must be convertible
     *               (see Implicit Conversions) to a numeric type (see Numeric Types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryPlus0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let l = +long_enum_LongEnum.Neg
      expect(l).assertEqual(-0x1_1111_1111)

      expect(+long_enum_LongEnum.Min).assertEqual(long_enum_LongEnum.Min)
      expect(+long_enum_LongEnum.Max).assertEqual(long_enum_LongEnum.Max)

      expect(+long_enum_LongEnum.Neg).assertEqual(long_enum_LongEnum.Neg)
      expect(+long_enum_LongEnum.Pos).assertEqual(long_enum_LongEnum.Pos)
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_UNARY_PLUS_0300
     * @tc.name      testExpressionsUnaryPlus0003
     * @tc.desc      Numeric widening occurs on the expression before a unary plus operator
     *               is applied. Unary plus operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsUnaryPlus0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(+42).assertEqual(42);
      expect(+2 + +2).assertEqual(4);
      expect(+(+(+(+13)))).assertEqual(13);
      expect(+1.5e+3).assertEqual(1500.0);
      expect(+0xff).assertEqual(0xff);
      expect(+0b10).assertEqual(0b10);
      expect(+0o70).assertEqual(0o70);
      expect(+0.5f).assertEqual(0.5f);

      let b: byte = 127
      expect(+b).assertEqual(b)
      expect(+b).assertEqual(127)
      expect(+b instanceof int).assertTrue()

      let s: short = 32767
      expect(+s).assertEqual(s)
      expect(+s).assertEqual(32767)
      expect(+s instanceof int).assertTrue()

      let i: int = +-2147483648
      expect(+i).assertEqual(i)
      expect(+i).assertEqual(-2147483648)
      expect(+i instanceof int).assertTrue()

      let l: long = +-9223372036854775808
      expect(+l).assertEqual(l);
      expect(+l).assertEqual(-9223372036854775808);
      expect(+l instanceof long).assertTrue()

      let d: double = 3.14;
      expect(+d).assertEqual(d);
      expect(+d).assertEqual(3.14);
      expect(+d instanceof double).assertTrue()

      let f: float = 3.14f;
      expect(+f).assertEqual(f);
      expect(+f).assertEqual(3.14f);
      expect(+f instanceof float).assertTrue()
    });
  });
}
