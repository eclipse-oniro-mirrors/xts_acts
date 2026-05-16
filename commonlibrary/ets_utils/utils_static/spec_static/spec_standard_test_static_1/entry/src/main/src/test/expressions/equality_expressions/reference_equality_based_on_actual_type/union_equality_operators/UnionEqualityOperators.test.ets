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
} from '../../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

enum Color { Red, Green, Blue }

function assertIsNotEqual(ps: string, qs: string): string {
    return `\n${ps} != ${qs}, expected true, got false`;
}

function assertIsEqual(ps: string, qs: string): string {
    return `\n${ps} == ${qs}, expected false, got true`;
}

function func_17_2(p: byte|short|Error, q: char|long|Error, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_10_2(p: long|bigint, q: bigint|int, ps: string, qs: string): string {
    return (p != q || q != p) ? assertIsEqual(ps, qs) : '';
}
function func_31_1(p: boolean|bigint, q: bigint|string, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_33_2(p: boolean|bigint, q: bigint|string, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_33_1(p: boolean|bigint, q: bigint|string, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_24_1(p: Error|number|boolean, q: string|number|boolean, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_5_1(p: Object|string, q: Error|string, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_29_1(p: number|Size|boolean, q: boolean|Size, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_12_1(p: int|boolean, q: string|long, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_6_2(p: Error|number|boolean, q: string|number|boolean, ps: string, qs: string): string {
    return (p != q || q != p) ? assertIsEqual(ps, qs) : '';
}
function func_29_2(p: number|Size|boolean, q: boolean|Size, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_12_2(p: int|boolean, q: string|long, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_14_2(p: byte|short|Error, q: char|long|Error, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_17_1(p: byte|short|Error, q: char|long|Error, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_22_2(p: Error|number|boolean, q: string|number|boolean, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_22_1(p: Error|number|boolean, q: string|number|boolean, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_9_1(p: number|Size|boolean, q: number|Size|boolean, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_32_1(p: long|bigint, q: bigint|int, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_30_2(p: long|bigint, q: bigint|int, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_27_1(p: number|Size|boolean, q: number|Size|boolean, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_20_1(p: number|string|boolean, q: char|Error|string|null, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_2_1(p: number|string, q: Object|null, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_10_1(p: long|bigint, q: bigint|int, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_1_1(p: int|boolean, q: string|long, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_5_2(p: Object|string, q: Error|string, ps: string, qs: string): string {
    return (p != q || q != p) ? assertIsEqual(ps, qs) : '';
}
function func_6_1(p: Error|number|boolean, q: string|number|boolean, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_4_2(p: number|string|boolean, q: char|Error|string|null, ps: string, qs: string): string {
    return (p != q || q != p) ? assertIsEqual(ps, qs) : '';
}
function func_4_1(p: number|string|boolean, q: char|Error|string|null, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_28_2(p: Color|string, q: number|Color|null, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_13_2(p: number|string, q: Object|null, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_30_1(p: long|bigint, q: bigint|int, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_8_2(p: Color|string, q: number|Color|null, ps: string, qs: string): string {
    return (p != q || q != p) ? assertIsEqual(ps, qs) : '';
}
function func_27_2(p: number|Size|boolean, q: number|Size|boolean, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_8_1(p: Color|string, q: number|Color|null, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_18_1(p: number|string|boolean, q: char|Error|string|null, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_21_1(p: Object|string, q: Error|string, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_14_1(p: byte|short|Error, q: char|long|Error, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_11_1(p: boolean|bigint, q: bigint|string, ps: string, qs: string): string {
    return (p == q && q == p) ? '' : assertIsNotEqual(ps, qs);
}
function func_28_1(p: Color|string, q: number|Color|null, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_13_1(p: number|string, q: Object|null, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_32_2(p: long|bigint, q: bigint|int, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_31_2(p: boolean|bigint, q: bigint|string, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_11_2(p: boolean|bigint, q: bigint|string, ps: string, qs: string): string {
    return (p != q || q != p) ? assertIsEqual(ps, qs) : '';
}
function func_18_2(p: number|string|boolean, q: char|Error|string|null, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_24_2(p: Error|number|boolean, q: string|number|boolean, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_21_2(p: Object|string, q: Error|string, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_20_2(p: number|string|boolean, q: char|Error|string|null, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_1_2(p: int|boolean, q: string|long, ps: string, qs: string): string {
    return (p != q || q != p) ? assertIsEqual(ps, qs) : '';
}
function func_16_1(p: number|string, q: Object|null, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_2_2(p: number|string, q: Object|null, ps: string, qs: string): string {
    return (p != q || q != p) ? assertIsEqual(ps, qs) : '';
}
function func_16_2(p: number|string, q: Object|null, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_26_2(p: Color|string, q: number|Color|null, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_26_1(p: Color|string, q: number|Color|null, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
function func_19_2(p: Object|string, q: Error|string, ps: string, qs: string): string {
    return (p != q && q != p) ? '' : assertIsNotEqual(ps, qs);
}
function func_19_1(p: Object|string, q: Error|string, ps: string, qs: string): string {
    return (p == q || q == p) ? assertIsEqual(ps, qs) : '';
}
export default function unionEqualityOperators() {
  describe("unionEqualityOperators", () => {
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
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0100
     * @tc.name      testUnionEqualityOperators0001
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_1_1(-128, -128 as long, "-128", "-128 as long")
      failed += func_1_2(-128, -128 as long, "-128", "-128 as long")
      failed += func_1_1(-128, new Long(-128 as long), "-128", "new Long(-128 as long)")
      failed += func_1_2(-128, new Long(-128 as long), "-128", "new Long(-128 as long)")
      failed += func_1_1(new Int(-128), -128 as long, "new Int(-128)", "-128 as long")
      failed += func_1_2(new Int(-128), -128 as long, "new Int(-128)", "-128 as long")
      failed += func_1_1(new Int(-128), new Long(-128 as long), "new Int(-128)", "new Long(-128 as long)")
      failed += func_1_2(new Int(-128), new Long(-128 as long), "new Int(-128)", "new Long(-128 as long)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0200
     * @tc.name      testUnionEqualityOperators0002
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_2_1(127.0, 127 as short, "127.0", "127 as short")
      failed += func_2_2(127.0, 127 as short, "127.0", "127 as short")
      failed += func_2_1(127.0, 127, "127.0", "127")
      failed += func_2_2(127.0, 127, "127.0", "127")
      failed += func_2_1(127.0, 127 as long, "127.0", "127 as long")
      failed += func_2_2(127.0, 127 as long, "127.0", "127 as long")
      failed += func_2_1(127.0, new Byte(127 as byte), "127.0", "new Byte(127 as byte)")
      failed += func_2_2(127.0, new Byte(127 as byte), "127.0", "new Byte(127 as byte)")
      failed += func_2_1(127.0, new Short(127 as short), "127.0", "new Short(127 as short)")
      failed += func_2_2(127.0, new Short(127 as short), "127.0", "new Short(127 as short)")
      failed += func_2_1(127.0, new Float(127.0f), "127.0", "new Float(127.0f)")
      failed += func_2_2(127.0, new Float(127.0f), "127.0", "new Float(127.0f)")
      failed += func_2_1(new Double(127.0), 127 as short, "new Double(127.0)", "127 as short")
      failed += func_2_2(new Double(127.0), 127 as short, "new Double(127.0)", "127 as short")
      failed += func_2_1(new Double(127.0), 127, "new Double(127.0)", "127")
      failed += func_2_2(new Double(127.0), 127, "new Double(127.0)", "127")
      failed += func_2_1(new Double(127.0), 127 as long, "new Double(127.0)", "127 as long")
      failed += func_2_2(new Double(127.0), 127 as long, "new Double(127.0)", "127 as long")
      failed += func_2_1(new Double(127.0), new Byte(127 as byte), "new Double(127.0)", "new Byte(127 as byte)")
      failed += func_2_2(new Double(127.0), new Byte(127 as byte), "new Double(127.0)", "new Byte(127 as byte)")
      failed += func_2_1(new Double(127.0), new Short(127 as short), "new Double(127.0)", "new Short(127 as short)")
      failed += func_2_2(new Double(127.0), new Short(127 as short), "new Double(127.0)", "new Short(127 as short)")
      failed += func_2_1(new Double(127.0), new Float(127.0f), "new Double(127.0)", "new Float(127.0f)")
      failed += func_2_2(new Double(127.0), new Float(127.0f), "new Double(127.0)", "new Float(127.0f)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0300
     * @tc.name      testUnionEqualityOperators0003
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_4_1('abc def', `abc def`, "'abc def'", "`abc def`")
      failed += func_4_2('abc def', `abc def`, "'abc def'", "`abc def`")
      failed += func_4_1('abc def', new String('abc def'), "'abc def'", "new String('abc def')")
      failed += func_4_2('abc def', new String('abc def'), "'abc def'", "new String('abc def')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0400
     * @tc.name      testUnionEqualityOperators0004
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_5_1('', new String(''), "''", "new String('')")
      failed += func_5_2('', new String(''), "''", "new String('')")
      failed += func_5_1(``, new String(''), "``", "new String('')")
      failed += func_5_2(``, new String(''), "``", "new String('')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0500
     * @tc.name      testUnionEqualityOperators0005
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_6_1(true, new Boolean(true), "true", "new Boolean(true)")
      failed += func_6_2(true, new Boolean(true), "true", "new Boolean(true)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0600
     * @tc.name      testUnionEqualityOperators0006
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_8_1(Color.Red, Color.values()[0], "Color.Red", "Color.values()[0]")
      failed += func_8_2(Color.Red, Color.values()[0], "Color.Red", "Color.values()[0]")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0700
     * @tc.name      testUnionEqualityOperators0007
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_10_1(12345n, new BigInt(12345), "12345n", "new BigInt(12345)")
      failed += func_10_2(12345n, new BigInt(12345), "12345n", "new BigInt(12345)")
      failed += func_10_1(12345n, new BigInt('12345'), "12345n", "new BigInt('12345')")
      failed += func_10_2(12345n, new BigInt('12345'), "12345n", "new BigInt('12345')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0800
     * @tc.name      testUnionEqualityOperators0008
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_11_1(0n, -0n, "0n", "-0n")
      failed += func_11_2(0n, -0n, "0n", "-0n")
      failed += func_11_1(0n, new BigInt(0.0), "0n", "new BigInt(0.0)")
      failed += func_11_2(0n, new BigInt(0.0), "0n", "new BigInt(0.0)")
      failed += func_11_1(new BigInt(), -0n, "new BigInt()", "-0n")
      failed += func_11_2(new BigInt(), -0n, "new BigInt()", "-0n")
      failed += func_11_1(new BigInt(), new BigInt(0.0), "new BigInt()", "new BigInt(0.0)")
      failed += func_11_2(new BigInt(), new BigInt(0.0), "new BigInt()", "new BigInt(0.0)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_0900
     * @tc.name      testUnionEqualityOperators0009
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_12_1(-128, -129 as long, "-128", "-129 as long")
      failed += func_12_2(-128, -129 as long, "-128", "-129 as long")
      failed += func_12_1(-128, new Long(-129 as long), "-128", "new Long(-129 as long)")
      failed += func_12_2(-128, new Long(-129 as long), "-128", "new Long(-129 as long)")
      failed += func_12_1(new Int(-128), -129 as long, "new Int(-128)", "-129 as long")
      failed += func_12_2(new Int(-128), -129 as long, "new Int(-128)", "-129 as long")
      failed += func_12_1(new Int(-128), new Long(-129 as long), "new Int(-128)", "new Long(-129 as long)")
      failed += func_12_2(new Int(-128), new Long(-129 as long), "new Int(-128)", "new Long(-129 as long)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1000
     * @tc.name      testUnionEqualityOperators0010
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_13_1(-128.0, 127 as byte, "-128.0", "127 as byte")
      failed += func_13_2(-128.0, 127 as byte, "-128.0", "127 as byte")
      failed += func_13_1(-128.0, 127, "-128.0", "127")
      failed += func_13_2(-128.0, 127, "-128.0", "127")
      failed += func_13_1(-128.0, 127.0f, "-128.0", "127.0f")
      failed += func_13_2(-128.0, 127.0f, "-128.0", "127.0f")
      failed += func_13_1(-128.0, new Byte(127 as byte), "-128.0", "new Byte(127 as byte)")
      failed += func_13_2(-128.0, new Byte(127 as byte), "-128.0", "new Byte(127 as byte)")
      failed += func_13_1(-128.0, new Short(127 as short), "-128.0", "new Short(127 as short)")
      failed += func_13_2(-128.0, new Short(127 as short), "-128.0", "new Short(127 as short)")
      failed += func_13_1(-128.0, new Long(127 as long), "-128.0", "new Long(127 as long)")
      failed += func_13_2(-128.0, new Long(127 as long), "-128.0", "new Long(127 as long)")
      failed += func_13_1(new Double(-128.0), 127 as byte, "new Double(-128.0)", "127 as byte")
      failed += func_13_2(new Double(-128.0), 127 as byte, "new Double(-128.0)", "127 as byte")
      failed += func_13_1(new Double(-128.0), 127, "new Double(-128.0)", "127")
      failed += func_13_2(new Double(-128.0), 127, "new Double(-128.0)", "127")
      failed += func_13_1(new Double(-128.0), 127.0f, "new Double(-128.0)", "127.0f")
      failed += func_13_2(new Double(-128.0), 127.0f, "new Double(-128.0)", "127.0f")
      failed += func_13_1(new Double(-128.0), new Byte(127 as byte), "new Double(-128.0)", "new Byte(127 as byte)")
      failed += func_13_2(new Double(-128.0), new Byte(127 as byte), "new Double(-128.0)", "new Byte(127 as byte)")
      failed += func_13_1(new Double(-128.0), new Short(127 as short), "new Double(-128.0)", "new Short(127 as short)")
      failed += func_13_2(new Double(-128.0), new Short(127 as short), "new Double(-128.0)", "new Short(127 as short)")
      failed += func_13_1(new Double(-128.0), new Long(127 as long), "new Double(-128.0)", "new Long(127 as long)")
      failed += func_13_2(new Double(-128.0), new Long(127 as long), "new Double(-128.0)", "new Long(127 as long)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1100
     * @tc.name      testUnionEqualityOperators0011
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_14_1(0 as byte, 1 as long, "0 as byte", "1 as long")
      failed += func_14_2(0 as byte, 1 as long, "0 as byte", "1 as long")
      failed += func_14_1(0 as byte, c'\u0001', "0 as byte", "c'\\u0001'")
      failed += func_14_2(0 as byte, c'\u0001', "0 as byte", "c'\\u0001'")
      failed += func_14_1(0 as byte, new Long(1 as long), "0 as byte", "new Long(1 as long)")
      failed += func_14_2(0 as byte, new Long(1 as long), "0 as byte", "new Long(1 as long)")
      failed += func_14_1(0 as byte, new Char(c'\u0001'), "0 as byte", "new Char(c'\\u0001')")
      failed += func_14_2(0 as byte, new Char(c'\u0001'), "0 as byte", "new Char(c'\\u0001')")
      failed += func_14_1(0 as short, 1 as long, "0 as short", "1 as long")
      failed += func_14_2(0 as short, 1 as long, "0 as short", "1 as long")
      failed += func_14_1(0 as short, c'\u0001', "0 as short", "c'\\u0001'")
      failed += func_14_2(0 as short, c'\u0001', "0 as short", "c'\\u0001'")
      failed += func_14_1(0 as short, new Long(1 as long), "0 as short", "new Long(1 as long)")
      failed += func_14_2(0 as short, new Long(1 as long), "0 as short", "new Long(1 as long)")
      failed += func_14_1(0 as short, new Char(c'\u0001'), "0 as short", "new Char(c'\\u0001')")
      failed += func_14_2(0 as short, new Char(c'\u0001'), "0 as short", "new Char(c'\\u0001')")
      failed += func_14_1(new Byte(0 as byte), 1 as long, "new Byte(0 as byte)", "1 as long")
      failed += func_14_2(new Byte(0 as byte), 1 as long, "new Byte(0 as byte)", "1 as long")
      failed += func_14_1(new Byte(0 as byte), c'\u0001', "new Byte(0 as byte)", "c'\\u0001'")
      failed += func_14_2(new Byte(0 as byte), c'\u0001', "new Byte(0 as byte)", "c'\\u0001'")
      failed += func_14_1(new Byte(0 as byte), new Long(1 as long), "new Byte(0 as byte)", "new Long(1 as long)")
      failed += func_14_2(new Byte(0 as byte), new Long(1 as long), "new Byte(0 as byte)", "new Long(1 as long)")
      failed += func_14_1(new Byte(0 as byte), new Char(c'\u0001'), "new Byte(0 as byte)", "new Char(c'\\u0001')")
      failed += func_14_2(new Byte(0 as byte), new Char(c'\u0001'), "new Byte(0 as byte)", "new Char(c'\\u0001')")
      failed += func_14_1(new Short(0 as short), 1 as long, "new Short(0 as short)", "1 as long")
      failed += func_14_2(new Short(0 as short), 1 as long, "new Short(0 as short)", "1 as long")
      failed += func_14_1(new Short(0 as short), c'\u0001', "new Short(0 as short)", "c'\\u0001'")
      failed += func_14_2(new Short(0 as short), c'\u0001', "new Short(0 as short)", "c'\\u0001'")
      failed += func_14_1(new Short(0 as short), new Long(1 as long), "new Short(0 as short)", "new Long(1 as long)")
      failed += func_14_2(new Short(0 as short), new Long(1 as long), "new Short(0 as short)", "new Long(1 as long)")
      failed += func_14_1(new Short(0 as short), new Char(c'\u0001'), "new Short(0 as short)", "new Char(c'\\u0001')")
      failed += func_14_2(new Short(0 as short), new Char(c'\u0001'), "new Short(0 as short)", "new Char(c'\\u0001')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1200
     * @tc.name      testUnionEqualityOperators0012
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_12_1(-128, '-128', "-128", "'-128'")
      failed += func_12_2(-128, '-128', "-128", "'-128'")
      failed += func_12_1(-128, '-128 as long', "-128", "'-128 as long'")
      failed += func_12_2(-128, '-128 as long', "-128", "'-128 as long'")
      failed += func_12_1(new Int(-128), '-128', "new Int(-128)", "'-128'")
      failed += func_12_2(new Int(-128), '-128', "new Int(-128)", "'-128'")
      failed += func_12_1(new Int(-128), '-128 as long', "new Int(-128)", "'-128 as long'")
      failed += func_12_2(new Int(-128), '-128 as long', "new Int(-128)", "'-128 as long'")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1300
     * @tc.name      testUnionEqualityOperators0013
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_16_1(-128.0, null, "-128.0", "null")
      failed += func_16_2(-128.0, null, "-128.0", "null")
      failed += func_16_1(-128.0, new Error(), "-128.0", "new Error()")
      failed += func_16_2(-128.0, new Error(), "-128.0", "new Error()")
      failed += func_16_1(new Double(-128.0), null, "new Double(-128.0)", "null")
      failed += func_16_2(new Double(-128.0), null, "new Double(-128.0)", "null")
      failed += func_16_1(new Double(-128.0), new Error(), "new Double(-128.0)", "new Error()")
      failed += func_16_2(new Double(-128.0), new Error(), "new Double(-128.0)", "new Error()")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1400
     * @tc.name      testUnionEqualityOperators0014
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_17_1(0 as byte, new Error(), "0 as byte", "new Error()")
      failed += func_17_2(0 as byte, new Error(), "0 as byte", "new Error()")
      failed += func_17_1(0 as short, new Error(), "0 as short", "new Error()")
      failed += func_17_2(0 as short, new Error(), "0 as short", "new Error()")
      failed += func_17_1(new Byte(0 as byte), new Error(), "new Byte(0 as byte)", "new Error()")
      failed += func_17_2(new Byte(0 as byte), new Error(), "new Byte(0 as byte)", "new Error()")
      failed += func_17_1(new Short(0 as short), new Error(), "new Short(0 as short)", "new Error()")
      failed += func_17_2(new Short(0 as short), new Error(), "new Short(0 as short)", "new Error()")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1500
     * @tc.name      testUnionEqualityOperators0015
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1('   ', `  `, "'   '", "`  `")
      failed += func_18_2('   ', `  `, "'   '", "`  `")
      failed += func_18_1('   ', new String(' '), "'   '", "new String(' ')")
      failed += func_18_2('   ', new String(' '), "'   '", "new String(' ')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1600
     * @tc.name      testUnionEqualityOperators0016
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_19_1('AA', new String('A'), "'AA'", "new String('A')")
      failed += func_19_2('AA', new String('A'), "'AA'", "new String('A')")
      failed += func_19_1(`AAA`, new String('A'), "`AAA`", "new String('A')")
      failed += func_19_2(`AAA`, new String('A'), "`AAA`", "new String('A')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1700
     * @tc.name      testUnionEqualityOperators0017
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_20_1(1.0, new Error(), "1.0", "new Error()")
      failed += func_20_2(1.0, new Error(), "1.0", "new Error()")
      failed += func_20_1(1.0, null, "1.0", "null")
      failed += func_20_2(1.0, null, "1.0", "null")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1800
     * @tc.name      testUnionEqualityOperators0018
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_21_1(new Number(), new Error(), "new Number()", "new Error()")
      failed += func_21_2(new Number(), new Error(), "new Number()", "new Error()")
      failed += func_21_1('', new Error(), "''", "new Error()")
      failed += func_21_2('', new Error(), "''", "new Error()")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_1900
     * @tc.name      testUnionEqualityOperators0019
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_22_1(true, new Boolean(false), "true", "new Boolean(false)")
      failed += func_22_2(true, new Boolean(false), "true", "new Boolean(false)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2000
     * @tc.name      testUnionEqualityOperators0020
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_24_1(new Error(), new Boolean(false), "new Error()", "new Boolean(false)")
      failed += func_24_2(new Error(), new Boolean(false), "new Error()", "new Boolean(false)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2100
     * @tc.name      testUnionEqualityOperators0021
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_26_1(Color.Red, Color.Green, "Color.Red", "Color.Green")
      failed += func_26_2(Color.Red, Color.Green, "Color.Red", "Color.Green")
      failed += func_26_1(Color.Red, Color.Blue, "Color.Red", "Color.Blue")
      failed += func_26_2(Color.Red, Color.Blue, "Color.Red", "Color.Blue")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2200
     * @tc.name      testUnionEqualityOperators0022
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_27_1(Size.MEDIUMTEST, Size.LARGETEST, "Size.MEDIUMTEST", "Size.LARGETEST")
      failed += func_27_2(Size.MEDIUMTEST, Size.LARGETEST, "Size.MEDIUMTEST", "Size.LARGETEST")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2300
     * @tc.name      testUnionEqualityOperators0023
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_28_1(Color.Red, null, "Color.Red", "null")
      failed += func_28_2(Color.Red, null, "Color.Red", "null")
      failed += func_28_1(Color.Red, 111.0, "Color.Red", "111.0")
      failed += func_28_2(Color.Red, 111.0, "Color.Red", "111.0")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2400
     * @tc.name      testUnionEqualityOperators0024
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_29_1(Size.MEDIUMTEST, false, "Size.MEDIUMTEST", "false")
      failed += func_29_2(Size.MEDIUMTEST, false, "Size.MEDIUMTEST", "false")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2500
     * @tc.name      testUnionEqualityOperators0025
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_30_1(1n, new BigInt(-1), "1n", "new BigInt(-1)")
      failed += func_30_2(1n, new BigInt(-1), "1n", "new BigInt(-1)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2600
     * @tc.name      testUnionEqualityOperators0026
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_31_1(0n, -1n, "0n", "-1n")
      failed += func_31_2(0n, -1n, "0n", "-1n")
      failed += func_31_1(0n, new BigInt(1.0), "0n", "new BigInt(1.0)")
      failed += func_31_2(0n, new BigInt(1.0), "0n", "new BigInt(1.0)")
      failed += func_31_1(new BigInt(), -1n, "new BigInt()", "-1n")
      failed += func_31_2(new BigInt(), -1n, "new BigInt()", "-1n")
      failed += func_31_1(new BigInt(), new BigInt(1.0), "new BigInt()", "new BigInt(1.0)")
      failed += func_31_2(new BigInt(), new BigInt(1.0), "new BigInt()", "new BigInt(1.0)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2700
     * @tc.name      testUnionEqualityOperators0027
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_32_1(1n, new Int(1), "1n", "new Int(1)")
      failed += func_32_2(1n, new Int(1), "1n", "new Int(1)")
      failed += func_32_1(new BigInt(1), new Int(1), "new BigInt(1)", "new Int(1)")
      failed += func_32_2(new BigInt(1), new Int(1), "new BigInt(1)", "new Int(1)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_UNION_EQUALITY_OPERATORS_2800
     * @tc.name      testUnionEqualityOperators0028
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testUnionEqualityOperators0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_33_1(0n, '0', "0n", "'0'")
      failed += func_33_2(0n, '0', "0n", "'0'")
      failed += func_33_1(new BigInt(), '0', "new BigInt()", "'0'")
      failed += func_33_2(new BigInt(), '0', "new BigInt()", "'0'")
      expect(failed).assertEqual('');
    })
  })
}
