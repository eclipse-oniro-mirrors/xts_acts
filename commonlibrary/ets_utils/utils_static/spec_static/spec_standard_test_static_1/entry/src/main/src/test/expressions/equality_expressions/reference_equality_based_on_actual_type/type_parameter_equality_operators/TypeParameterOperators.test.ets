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

function expectNotEqualTrue<P, Q>(p: P, q: Q, ps: string, qs: string): string {
  return p != q && q != p ? '' : `\n${ps} != ${qs}, expected true, got false`;
}

function expectEqualTrue<P, Q>(p: P, q: Q, ps: string, qs: string): string {
  return p == q && q == p ? '' : `\n${ps} == ${qs}, expected true, got false`;
}

function expectNotEqualFalse<P, Q>(p: P, q: Q, ps: string, qs: string): string {
  return p != q || q != p ? `\n${ps} != ${qs}, expected false, got true` : '';
}

function expectEqualFalse<P, Q>(p: P, q: Q, ps: string, qs: string): string {
  return p == q || q == p ? `\n${ps} == ${qs}, expected false, got true` : '';
}

function func_35_2<P, Q>(p: P, q: Q, ps: string, qs: string): string {
  return expectNotEqualTrue(p, q, ps, qs);
}

function func_18_1<P>(p: P, q: Object, ps: string, qs: string): string {
  return expectEqualTrue(p, q, ps, qs);
}

function func_7_1<P, Q>(p: P, q: Q, ps: string, qs: string): string {
  return expectEqualTrue(p, q, ps, qs);
}

function func_15_2<P>(p: P, q: Object, ps: string, qs: string): string {
  return expectNotEqualFalse(p, q, ps, qs);
}

function func_39_1<P, Q>(p: P, q: Q, ps: string, qs: string): string {
  return expectEqualFalse(p, q, ps, qs);
}

function func_1_2<P, Q>(p: P, q: Q, ps: string, qs: string): string {
  return expectNotEqualFalse(p, q, ps, qs);
}

function func_49_2<P>(p: P, q: Object, ps: string, qs: string): string {
  return expectNotEqualTrue(p, q, ps, qs);
}

function func_49_1<P>(p: P, q: Object, ps: string, qs: string): string {
  return expectEqualFalse(p, q, ps, qs);
}
enum Color { Red, Green = 0, Blue }
export default function TypeParameterOperatorsTest() {
  describe("TypeParameterOperatorsTest", () => {
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
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_0100
     * @tc.name      testTypeParameterOperators0001
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Object, Object>(-128 as byte, -128 as short, "-128 as byte", "-128 as short")
      failed += func_1_2<Object, Object>(-128 as byte, -128 as short, "-128 as byte", "-128 as short")
      failed += func_7_1<Object, Object>(-128 as byte, -128, "-128 as byte", "-128")
      failed += func_1_2<Object, Object>(-128 as byte, -128, "-128 as byte", "-128")
      failed += func_7_1<Object, Object>(-128 as byte, -128 as long, "-128 as byte", "-128 as long")
      failed += func_1_2<Object, Object>(-128 as byte, -128 as long, "-128 as byte", "-128 as long")
      failed += func_7_1<Object, Object>(-128 as byte, -128.0f, "-128 as byte", "-128.0f")
      failed += func_1_2<Object, Object>(-128 as byte, -128.0f, "-128 as byte", "-128.0f")
      failed += func_7_1<Object, Object>(-128 as byte, -128.0, "-128 as byte", "-128.0")
      failed += func_1_2<Object, Object>(-128 as byte, -128.0, "-128 as byte", "-128.0")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_0200
     * @tc.name      testTypeParameterOperators0002
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Object, Object>('abc def', `abc def`, "'abc def'", "`abc def`")
      failed += func_1_2<Object, Object>('abc def', `abc def`, "'abc def'", "`abc def`")
      failed += func_7_1<Object, Object>('abc def', new String('abc def'), "'abc def'", "new String('abc def')")
      failed += func_1_2<Object, Object>('abc def', new String('abc def'), "'abc def'", "new String('abc def')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_0300
     * @tc.name      testTypeParameterOperators0003
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Object, Object>('', new String(''), "''", "new String('')")
      failed += func_1_2<Object, Object>('', new String(''), "''", "new String('')")
      failed += func_7_1<Object, Object>(``, new String(''), "``", "new String('')")
      failed += func_1_2<Object, Object>(``, new String(''), "``", "new String('')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_0400
     * @tc.name      testTypeParameterOperators0004
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Object, Object>(true, new Boolean(true), "true", "new Boolean(true)")
      failed += func_1_2<Object, Object>(true, new Boolean(true), "true", "new Boolean(true)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_0500
     * @tc.name      testTypeParameterOperators0005
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Object, Object>(false, new Boolean(false), "false", "new Boolean(false)")
      failed += func_1_2<Object, Object>(false, new Boolean(false), "false", "new Boolean(false)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_0700
     * @tc.name      testTypeParameterOperators0007
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Object, Object>(12345n, new BigInt('12345'), "12345n", "new BigInt('12345')")
      failed += func_1_2<Object, Object>(12345n, new BigInt('12345'), "12345n", "new BigInt('12345')")
      failed += func_7_1<Object, Object>(new BigInt(12345), new BigInt('12345'), "new BigInt(12345)", "new BigInt('12345')")
      failed += func_1_2<Object, Object>(new BigInt(12345), new BigInt('12345'), "new BigInt(12345)", "new BigInt('12345')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_0800
     * @tc.name      testTypeParameterOperators0008
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Object, Object>(0n, new BigInt(), "0n", "new BigInt()")
      failed += func_1_2<Object, Object>(0n, new BigInt(), "0n", "new BigInt()")
      failed += func_7_1<Object, Object>(0n, new BigInt(0.0), "0n", "new BigInt(0.0)")
      failed += func_1_2<Object, Object>(0n, new BigInt(0.0), "0n", "new BigInt(0.0)")
      failed += func_7_1<Object, Object>(-0n, new BigInt(), "-0n", "new BigInt()")
      failed += func_1_2<Object, Object>(-0n, new BigInt(), "-0n", "new BigInt()")
      failed += func_7_1<Object, Object>(-0n, new BigInt(0.0), "-0n", "new BigInt(0.0)")
      failed += func_1_2<Object, Object>(-0n, new BigInt(0.0), "-0n", "new BigInt(0.0)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_0900
     * @tc.name      testTypeParameterOperators0009
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1<Number>(-128.0, -128 as byte, "-128.0", "-128 as byte")
      failed += func_15_2<Number>(-128.0, -128 as byte, "-128.0", "-128 as byte")
      failed += func_18_1<Number>(-128.0, -128, "-128.0", "-128")
      failed += func_15_2<Number>(-128.0, -128, "-128.0", "-128")
      failed += func_18_1<Number>(-128.0, -128.0f, "-128.0", "-128.0f")
      failed += func_15_2<Number>(-128.0, -128.0f, "-128.0", "-128.0f")
      failed += func_18_1<Number>(-128.0, new Short(-128 as short), "-128.0", "new Short(-128 as short)")
      failed += func_15_2<Number>(-128.0, new Short(-128 as short), "-128.0", "new Short(-128 as short)")
      failed += func_18_1<Number>(-128.0, new Long(-128 as long), "-128.0", "new Long(-128 as long)")
      failed += func_15_2<Number>(-128.0, new Long(-128 as long), "-128.0", "new Long(-128 as long)")
      failed += func_18_1<Number>(new Double(-128.0), -128 as byte, "new Double(-128.0)", "-128 as byte")
      failed += func_15_2<Number>(new Double(-128.0), -128 as byte, "new Double(-128.0)", "-128 as byte")
      failed += func_18_1<Number>(new Double(-128.0), -128, "new Double(-128.0)", "-128")
      failed += func_15_2<Number>(new Double(-128.0), -128, "new Double(-128.0)", "-128")
      failed += func_18_1<Number>(new Double(-128.0), -128.0f, "new Double(-128.0)", "-128.0f")
      failed += func_15_2<Number>(new Double(-128.0), -128.0f, "new Double(-128.0)", "-128.0f")
      failed += func_18_1<Number>(new Double(-128.0), new Short(-128 as short), "new Double(-128.0)", "new Short(-128 as short)")
      failed += func_15_2<Number>(new Double(-128.0), new Short(-128 as short), "new Double(-128.0)", "new Short(-128 as short)")
      failed += func_18_1<Number>(new Double(-128.0), new Long(-128 as long), "new Double(-128.0)", "new Long(-128 as long)")
      failed += func_15_2<Number>(new Double(-128.0), new Long(-128 as long), "new Double(-128.0)", "new Long(-128 as long)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1000
     * @tc.name      testTypeParameterOperators0010
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1<string>('abc def', `abc def`, "'abc def'", "`abc def`")
      failed += func_15_2<string>('abc def', `abc def`, "'abc def'", "`abc def`")
      failed += func_18_1<string>('abc def', new String('abc def'), "'abc def'", "new String('abc def')")
      failed += func_15_2<string>('abc def', new String('abc def'), "'abc def'", "new String('abc def')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1100
     * @tc.name      testTypeParameterOperators0011
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1<String>(new String(''), '', "new String('')", "''")
      failed += func_15_2<String>(new String(''), '', "new String('')", "''")
      failed += func_18_1<String>(new String(''), ``, "new String('')", "``")
      failed += func_15_2<String>(new String(''), ``, "new String('')", "``")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1200
     * @tc.name      testTypeParameterOperators0012
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1<Boolean>(new Boolean(true), true, "new Boolean(true)", "true")
      failed += func_15_2<Boolean>(new Boolean(true), true, "new Boolean(true)", "true")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1300
     * @tc.name      testTypeParameterOperators0013
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1<Boolean>(false, new Boolean(false), "false", "new Boolean(false)")
      failed += func_15_2<Boolean>(false, new Boolean(false), "false", "new Boolean(false)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1400
     * @tc.name      testTypeParameterOperators0014
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1<Color>(Color.Red, Color.values()[0], "Color.Red", "Color.values()[0]")
      failed += func_15_2<Color>(Color.Red, Color.values()[0], "Color.Red", "Color.values()[0]")
      failed += func_18_1<Color>(Color.Red, Color.getValueOf('Red'), "Color.Red", "Color.getValueOf('Red')")
      failed += func_15_2<Color>(Color.Red, Color.getValueOf('Red'), "Color.Red", "Color.getValueOf('Red')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1500
     * @tc.name      testTypeParameterOperators0015
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1<BigInt>(new BigInt(12345), 12345n, "new BigInt(12345)", "12345n")
      failed += func_15_2<BigInt>(new BigInt(12345), 12345n, "new BigInt(12345)", "12345n")
      failed += func_18_1<BigInt>(new BigInt(12345), new BigInt('12345'), "new BigInt(12345)", "new BigInt('12345')")
      failed += func_15_2<BigInt>(new BigInt(12345), new BigInt('12345'), "new BigInt(12345)", "new BigInt('12345')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1600
     * @tc.name      testTypeParameterOperators0016
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_18_1<BigInt>(-0n, 0n, "-0n", "0n")
      failed += func_15_2<BigInt>(-0n, 0n, "-0n", "0n")
      failed += func_18_1<BigInt>(-0n, new BigInt(), "-0n", "new BigInt()")
      failed += func_15_2<BigInt>(-0n, new BigInt(), "-0n", "new BigInt()")
      failed += func_18_1<BigInt>(-0n, new BigInt(0.0), "-0n", "new BigInt(0.0)")
      failed += func_15_2<BigInt>(-0n, new BigInt(0.0), "-0n", "new BigInt(0.0)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1700
     * @tc.name      testTypeParameterOperators0017
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<int|boolean, string|long>(-128, -128 as long, "-128", "-128 as long")
      failed += func_1_2<int|boolean, string|long>(-128, -128 as long, "-128", "-128 as long")
      failed += func_7_1<int|boolean, string|long>(-128, new Long(-128 as long), "-128", "new Long(-128 as long)")
      failed += func_1_2<int|boolean, string|long>(-128, new Long(-128 as long), "-128", "new Long(-128 as long)")
      failed += func_7_1<int|boolean, string|long>(new Int(-128), -128 as long, "new Int(-128)", "-128 as long")
      failed += func_1_2<int|boolean, string|long>(new Int(-128), -128 as long, "new Int(-128)", "-128 as long")
      failed += func_7_1<int|boolean, string|long>(new Int(-128), new Long(-128 as long), "new Int(-128)", "new Long(-128 as long)")
      failed += func_1_2<int|boolean, string|long>(new Int(-128), new Long(-128 as long), "new Int(-128)", "new Long(-128 as long)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1800
     * @tc.name      testTypeParameterOperators0018
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<number|string, Object|null>(127.0, 127 as byte, "127.0", "127 as byte")
      failed += func_1_2<number|string, Object|null>(127.0, 127 as byte, "127.0", "127 as byte")
      failed += func_7_1<number|string, Object|null>(127.0, 127 as short, "127.0", "127 as short")
      failed += func_1_2<number|string, Object|null>(127.0, 127 as short, "127.0", "127 as short")
      failed += func_7_1<number|string, Object|null>(127.0, 127 as long, "127.0", "127 as long")
      failed += func_1_2<number|string, Object|null>(127.0, 127 as long, "127.0", "127 as long")
      failed += func_7_1<number|string, Object|null>(127.0, 127.0f, "127.0", "127.0f")
      failed += func_1_2<number|string, Object|null>(127.0, 127.0f, "127.0", "127.0f")
      failed += func_7_1<number|string, Object|null>(127.0, new Byte(127 as byte), "127.0", "new Byte(127 as byte)")
      failed += func_1_2<number|string, Object|null>(127.0, new Byte(127 as byte), "127.0", "new Byte(127 as byte)")
      failed += func_7_1<number|string, Object|null>(127.0, new Int(127), "127.0", "new Int(127)")
      failed += func_1_2<number|string, Object|null>(127.0, new Int(127), "127.0", "new Int(127)")
      failed += func_7_1<number|string, Object|null>(127.0, new Float(127.0f), "127.0", "new Float(127.0f)")
      failed += func_1_2<number|string, Object|null>(127.0, new Float(127.0f), "127.0", "new Float(127.0f)")
      failed += func_7_1<number|string, Object|null>(new Double(127.0), 127 as byte, "new Double(127.0)", "127 as byte")
      failed += func_1_2<number|string, Object|null>(new Double(127.0), 127 as byte, "new Double(127.0)", "127 as byte")
      failed += func_7_1<number|string, Object|null>(new Double(127.0), 127 as short, "new Double(127.0)", "127 as short")
      failed += func_1_2<number|string, Object|null>(new Double(127.0), 127 as short, "new Double(127.0)", "127 as short")
      failed += func_7_1<number|string, Object|null>(new Double(127.0), 127 as long, "new Double(127.0)", "127 as long")
      failed += func_1_2<number|string, Object|null>(new Double(127.0), 127 as long, "new Double(127.0)", "127 as long")
      failed += func_7_1<number|string, Object|null>(new Double(127.0), 127.0f, "new Double(127.0)", "127.0f")
      failed += func_1_2<number|string, Object|null>(new Double(127.0), 127.0f, "new Double(127.0)", "127.0f")
      failed += func_7_1<number|string, Object|null>(new Double(127.0), new Byte(127 as byte), "new Double(127.0)", "new Byte(127 as byte)")
      failed += func_1_2<number|string, Object|null>(new Double(127.0), new Byte(127 as byte), "new Double(127.0)", "new Byte(127 as byte)")
      failed += func_7_1<number|string, Object|null>(new Double(127.0), new Int(127), "new Double(127.0)", "new Int(127)")
      failed += func_1_2<number|string, Object|null>(new Double(127.0), new Int(127), "new Double(127.0)", "new Int(127)")
      failed += func_7_1<number|string, Object|null>(new Double(127.0), new Float(127.0f), "new Double(127.0)", "new Float(127.0f)")
      failed += func_1_2<number|string, Object|null>(new Double(127.0), new Float(127.0f), "new Double(127.0)", "new Float(127.0f)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_1900
     * @tc.name      testTypeParameterOperators0019
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<number|string|boolean, char|Error|string|null>('abc def', `abc def`, "'abc def'", "`abc def`")
      failed += func_1_2<number|string|boolean, char|Error|string|null>('abc def', `abc def`, "'abc def'", "`abc def`")
      failed += func_7_1<number|string|boolean, char|Error|string|null>('abc def', new String('abc def'), "'abc def'", "new String('abc def')")
      failed += func_1_2<number|string|boolean, char|Error|string|null>('abc def', new String('abc def'), "'abc def'", "new String('abc def')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2000
     * @tc.name      testTypeParameterOperators0020
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Object|string, Error|string>('', new String(''), "''", "new String('')")
      failed += func_1_2<Object|string, Error|string>('', new String(''), "''", "new String('')")
      failed += func_7_1<Object|string, Error|string>(``, new String(''), "``", "new String('')")
      failed += func_1_2<Object|string, Error|string>(``, new String(''), "``", "new String('')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2100
     * @tc.name      testTypeParameterOperators0021
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Error|number|boolean, string|number|boolean>(true, new Boolean(true), "true", "new Boolean(true)")
      failed += func_1_2<Error|number|boolean, string|number|boolean>(true, new Boolean(true), "true", "new Boolean(true)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2200
     * @tc.name      testTypeParameterOperators0022
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<Color|string, number|Color|null>(Color.Red, Color.values()[0], "Color.Red", "Color.values()[0]")
      failed += func_1_2<Color|string, number|Color|null>(Color.Red, Color.values()[0], "Color.Red", "Color.values()[0]")
      failed += func_7_1<Color|string, number|Color|null>(Color.Red, Color.getValueOf('Red'), "Color.Red", "Color.getValueOf('Red')")
      failed += func_1_2<Color|string, number|Color|null>(Color.Red, Color.getValueOf('Red'), "Color.Red", "Color.getValueOf('Red')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2300
     * @tc.name      testTypeParameterOperators0023
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<long|bigint, bigint|int>(12345n, new BigInt(12345), "12345n", "new BigInt(12345)")
      failed += func_1_2<long|bigint, bigint|int>(12345n, new BigInt(12345), "12345n", "new BigInt(12345)")
      failed += func_7_1<long|bigint, bigint|int>(12345n, new BigInt('12345'), "12345n", "new BigInt('12345')")
      failed += func_1_2<long|bigint, bigint|int>(12345n, new BigInt('12345'), "12345n", "new BigInt('12345')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2400
     * @tc.name      testTypeParameterOperators0024
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_7_1<boolean|bigint, bigint|string>(0n, -0n, "0n", "-0n")
      failed += func_1_2<boolean|bigint, bigint|string>(0n, -0n, "0n", "-0n")
      failed += func_7_1<boolean|bigint, bigint|string>(0n, new BigInt(0.0), "0n", "new BigInt(0.0)")
      failed += func_1_2<boolean|bigint, bigint|string>(0n, new BigInt(0.0), "0n", "new BigInt(0.0)")
      failed += func_7_1<boolean|bigint, bigint|string>(new BigInt(), -0n, "new BigInt()", "-0n")
      failed += func_1_2<boolean|bigint, bigint|string>(new BigInt(), -0n, "new BigInt()", "-0n")
      failed += func_7_1<boolean|bigint, bigint|string>(new BigInt(), new BigInt(0.0), "new BigInt()", "new BigInt(0.0)")
      failed += func_1_2<boolean|bigint, bigint|string>(new BigInt(), new BigInt(0.0), "new BigInt()", "new BigInt(0.0)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2500
     * @tc.name      testTypeParameterOperators0025
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(127.0, '127.0', "127.0", "'127.0'")
      failed += func_35_2<Object, Object>(127.0, '127.0', "127.0", "'127.0'")
      failed += func_39_1<Object, Object>(127.0, 127n, "127.0", "127n")
      failed += func_35_2<Object, Object>(127.0, 127n, "127.0", "127n")
      failed += func_39_1<Object, Object>(127.0, true, "127.0", "true")
      failed += func_35_2<Object, Object>(127.0, true, "127.0", "true")
      failed += func_39_1<Object, Object>('127.0', 127.0, "'127.0'", "127.0")
      failed += func_35_2<Object, Object>('127.0', 127.0, "'127.0'", "127.0")
      failed += func_39_1<Object, Object>('127.0', 127n, "'127.0'", "127n")
      failed += func_35_2<Object, Object>('127.0', 127n, "'127.0'", "127n")
      failed += func_39_1<Object, Object>('127.0', true, "'127.0'", "true")
      failed += func_35_2<Object, Object>('127.0', true, "'127.0'", "true")
      failed += func_39_1<Object, Object>(127n, 127.0, "127n", "127.0")
      failed += func_35_2<Object, Object>(127n, 127.0, "127n", "127.0")
      failed += func_39_1<Object, Object>(127n, '127.0', "127n", "'127.0'")
      failed += func_35_2<Object, Object>(127n, '127.0', "127n", "'127.0'")
      failed += func_39_1<Object, Object>(127n, true, "127n", "true")
      failed += func_35_2<Object, Object>(127n, true, "127n", "true")
      failed += func_39_1<Object, Object>(true, 127.0, "true", "127.0")
      failed += func_35_2<Object, Object>(true, 127.0, "true", "127.0")
      failed += func_39_1<Object, Object>(true, '127.0', "true", "'127.0'")
      failed += func_35_2<Object, Object>(true, '127.0', "true", "'127.0'")
      failed += func_39_1<Object, Object>(true, 127n, "true", "127n")
      failed += func_35_2<Object, Object>(true, 127n, "true", "127n")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2600
     * @tc.name      testTypeParameterOperators0026
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(new Number(127.0), new String('127.0'), "new Number(127.0)", "new String('127.0')")
      failed += func_35_2<Object, Object>(new Number(127.0), new String('127.0'), "new Number(127.0)", "new String('127.0')")
      failed += func_39_1<Object, Object>(new Number(127.0), new BigInt(127), "new Number(127.0)", "new BigInt(127)")
      failed += func_35_2<Object, Object>(new Number(127.0), new BigInt(127), "new Number(127.0)", "new BigInt(127)")
      failed += func_39_1<Object, Object>(new Number(127.0), new Boolean(false), "new Number(127.0)", "new Boolean(false)")
      failed += func_35_2<Object, Object>(new Number(127.0), new Boolean(false), "new Number(127.0)", "new Boolean(false)")
      failed += func_39_1<Object, Object>(new String('127.0'), new Number(127.0), "new String('127.0')", "new Number(127.0)")
      failed += func_35_2<Object, Object>(new String('127.0'), new Number(127.0), "new String('127.0')", "new Number(127.0)")
      failed += func_39_1<Object, Object>(new String('127.0'), new BigInt(127), "new String('127.0')", "new BigInt(127)")
      failed += func_35_2<Object, Object>(new String('127.0'), new BigInt(127), "new String('127.0')", "new BigInt(127)")
      failed += func_39_1<Object, Object>(new String('127.0'), new Boolean(false), "new String('127.0')", "new Boolean(false)")
      failed += func_35_2<Object, Object>(new String('127.0'), new Boolean(false), "new String('127.0')", "new Boolean(false)")
      failed += func_39_1<Object, Object>(new BigInt(127), new Number(127.0), "new BigInt(127)", "new Number(127.0)")
      failed += func_35_2<Object, Object>(new BigInt(127), new Number(127.0), "new BigInt(127)", "new Number(127.0)")
      failed += func_39_1<Object, Object>(new BigInt(127), new String('127.0'), "new BigInt(127)", "new String('127.0')")
      failed += func_35_2<Object, Object>(new BigInt(127), new String('127.0'), "new BigInt(127)", "new String('127.0')")
      failed += func_39_1<Object, Object>(new BigInt(127), new Boolean(false), "new BigInt(127)", "new Boolean(false)")
      failed += func_35_2<Object, Object>(new BigInt(127), new Boolean(false), "new BigInt(127)", "new Boolean(false)")
      failed += func_39_1<Object, Object>(new Boolean(false), new Number(127.0), "new Boolean(false)", "new Number(127.0)")
      failed += func_35_2<Object, Object>(new Boolean(false), new Number(127.0), "new Boolean(false)", "new Number(127.0)")
      failed += func_39_1<Object, Object>(new Boolean(false), new String('127.0'), "new Boolean(false)", "new String('127.0')")
      failed += func_35_2<Object, Object>(new Boolean(false), new String('127.0'), "new Boolean(false)", "new String('127.0')")
      failed += func_39_1<Object, Object>(new Boolean(false), new BigInt(127), "new Boolean(false)", "new BigInt(127)")
      failed += func_35_2<Object, Object>(new Boolean(false), new BigInt(127), "new Boolean(false)", "new BigInt(127)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2700
     * @tc.name      testTypeParameterOperators0027
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(new Int(), '0', "new Int()", "'0'")
      failed += func_35_2<Object, Object>(new Int(), '0', "new Int()", "'0'")
      failed += func_39_1<Object, Object>(new Int(), new BigInt(0), "new Int()", "new BigInt(0)")
      failed += func_35_2<Object, Object>(new Int(), new BigInt(0), "new Int()", "new BigInt(0)")
      failed += func_39_1<Object, Object>('0', new Int(), "'0'", "new Int()")
      failed += func_35_2<Object, Object>('0', new Int(), "'0'", "new Int()")
      failed += func_39_1<Object, Object>('0', new BigInt(0), "'0'", "new BigInt(0)")
      failed += func_35_2<Object, Object>('0', new BigInt(0), "'0'", "new BigInt(0)")
      failed += func_39_1<Object, Object>(new BigInt(0), new Int(), "new BigInt(0)", "new Int()")
      failed += func_35_2<Object, Object>(new BigInt(0), new Int(), "new BigInt(0)", "new Int()")
      failed += func_39_1<Object, Object>(new BigInt(0), '0', "new BigInt(0)", "'0'")
      failed += func_35_2<Object, Object>(new BigInt(0), '0', "new BigInt(0)", "'0'")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_2900
     * @tc.name      testTypeParameterOperators0029
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(new Boolean(false), new Boolean(true), "new Boolean(false)", "new Boolean(true)")
      failed += func_35_2<Object, Object>(new Boolean(false), new Boolean(true), "new Boolean(false)", "new Boolean(true)")
      failed += func_39_1<Object, Object>(new Boolean(true), new Boolean(false), "new Boolean(true)", "new Boolean(false)")
      failed += func_35_2<Object, Object>(new Boolean(true), new Boolean(false), "new Boolean(true)", "new Boolean(false)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3000
     * @tc.name      testTypeParameterOperators0030
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(true, false, "true", "false")
      failed += func_35_2<Object, Object>(true, false, "true", "false")
      failed += func_39_1<Object, Object>(false, true, "false", "true")
      failed += func_35_2<Object, Object>(false, true, "false", "true")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3100
     * @tc.name      testTypeParameterOperators0031
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, "Double.POSITIVE_INFINITY", "Double.NEGATIVE_INFINITY")
      failed += func_35_2<Object, Object>(Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY, "Double.POSITIVE_INFINITY", "Double.NEGATIVE_INFINITY")
      failed += func_39_1<Object, Object>(Double.POSITIVE_INFINITY, 0.0, "Double.POSITIVE_INFINITY", "0.0")
      failed += func_35_2<Object, Object>(Double.POSITIVE_INFINITY, 0.0, "Double.POSITIVE_INFINITY", "0.0")
      failed += func_39_1<Object, Object>(Double.POSITIVE_INFINITY, Double.NaN, "Double.POSITIVE_INFINITY", "Double.NaN")
      failed += func_35_2<Object, Object>(Double.POSITIVE_INFINITY, Double.NaN, "Double.POSITIVE_INFINITY", "Double.NaN")
      failed += func_39_1<Object, Object>(Double.POSITIVE_INFINITY, Float.NaN, "Double.POSITIVE_INFINITY", "Float.NaN")
      failed += func_35_2<Object, Object>(Double.POSITIVE_INFINITY, Float.NaN, "Double.POSITIVE_INFINITY", "Float.NaN")
      failed += func_39_1<Object, Object>(Double.POSITIVE_INFINITY, new Double(Double.NaN), "Double.POSITIVE_INFINITY", "new Double(Double.NaN)")
      failed += func_35_2<Object, Object>(Double.POSITIVE_INFINITY, new Double(Double.NaN), "Double.POSITIVE_INFINITY", "new Double(Double.NaN)")
      failed += func_39_1<Object, Object>(Double.POSITIVE_INFINITY, new Float(Float.NaN), "Double.POSITIVE_INFINITY", "new Float(Float.NaN)")
      failed += func_35_2<Object, Object>(Double.POSITIVE_INFINITY, new Float(Float.NaN), "Double.POSITIVE_INFINITY", "new Float(Float.NaN)")
      failed += func_39_1<Object, Object>(Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY, "Double.NEGATIVE_INFINITY", "Double.POSITIVE_INFINITY")
      failed += func_35_2<Object, Object>(Double.NEGATIVE_INFINITY, Double.POSITIVE_INFINITY, "Double.NEGATIVE_INFINITY", "Double.POSITIVE_INFINITY")
      failed += func_39_1<Object, Object>(Double.NEGATIVE_INFINITY, 0.0, "Double.NEGATIVE_INFINITY", "0.0")
      failed += func_35_2<Object, Object>(Double.NEGATIVE_INFINITY, 0.0, "Double.NEGATIVE_INFINITY", "0.0")
      failed += func_39_1<Object, Object>(Double.NEGATIVE_INFINITY, Double.NaN, "Double.NEGATIVE_INFINITY", "Double.NaN")
      failed += func_35_2<Object, Object>(Double.NEGATIVE_INFINITY, Double.NaN, "Double.NEGATIVE_INFINITY", "Double.NaN")
      failed += func_39_1<Object, Object>(Double.NEGATIVE_INFINITY, Float.NaN, "Double.NEGATIVE_INFINITY", "Float.NaN")
      failed += func_35_2<Object, Object>(Double.NEGATIVE_INFINITY, Float.NaN, "Double.NEGATIVE_INFINITY", "Float.NaN")
      failed += func_39_1<Object, Object>(Double.NEGATIVE_INFINITY, new Double(Double.NaN), "Double.NEGATIVE_INFINITY", "new Double(Double.NaN)")
      failed += func_35_2<Object, Object>(Double.NEGATIVE_INFINITY, new Double(Double.NaN), "Double.NEGATIVE_INFINITY", "new Double(Double.NaN)")
      failed += func_39_1<Object, Object>(Double.NEGATIVE_INFINITY, new Float(Float.NaN), "Double.NEGATIVE_INFINITY", "new Float(Float.NaN)")
      failed += func_35_2<Object, Object>(Double.NEGATIVE_INFINITY, new Float(Float.NaN), "Double.NEGATIVE_INFINITY", "new Float(Float.NaN)")
      failed += func_39_1<Object, Object>(0.0, Double.POSITIVE_INFINITY, "0.0", "Double.POSITIVE_INFINITY")
      failed += func_35_2<Object, Object>(0.0, Double.POSITIVE_INFINITY, "0.0", "Double.POSITIVE_INFINITY")
      failed += func_39_1<Object, Object>(0.0, Double.NEGATIVE_INFINITY, "0.0", "Double.NEGATIVE_INFINITY")
      failed += func_35_2<Object, Object>(0.0, Double.NEGATIVE_INFINITY, "0.0", "Double.NEGATIVE_INFINITY")
      failed += func_39_1<Object, Object>(0.0, Double.NaN, "0.0", "Double.NaN")
      failed += func_35_2<Object, Object>(0.0, Double.NaN, "0.0", "Double.NaN")
      failed += func_39_1<Object, Object>(0.0, Float.NaN, "0.0", "Float.NaN")
      failed += func_35_2<Object, Object>(0.0, Float.NaN, "0.0", "Float.NaN")
      failed += func_39_1<Object, Object>(0.0, new Double(Double.NaN), "0.0", "new Double(Double.NaN)")
      failed += func_35_2<Object, Object>(0.0, new Double(Double.NaN), "0.0", "new Double(Double.NaN)")
      failed += func_39_1<Object, Object>(0.0, new Float(Float.NaN), "0.0", "new Float(Float.NaN)")
      failed += func_35_2<Object, Object>(0.0, new Float(Float.NaN), "0.0", "new Float(Float.NaN)")
      failed += func_39_1<Object, Object>(Double.NaN, Double.POSITIVE_INFINITY, "Double.NaN", "Double.POSITIVE_INFINITY")
      failed += func_35_2<Object, Object>(Double.NaN, Double.POSITIVE_INFINITY, "Double.NaN", "Double.POSITIVE_INFINITY")
      failed += func_39_1<Object, Object>(Double.NaN, Double.NEGATIVE_INFINITY, "Double.NaN", "Double.NEGATIVE_INFINITY")
      failed += func_35_2<Object, Object>(Double.NaN, Double.NEGATIVE_INFINITY, "Double.NaN", "Double.NEGATIVE_INFINITY")
      failed += func_39_1<Object, Object>(Double.NaN, 0.0, "Double.NaN", "0.0")
      failed += func_35_2<Object, Object>(Double.NaN, 0.0, "Double.NaN", "0.0")
      failed += func_39_1<Object, Object>(Double.NaN, Float.NaN, "Double.NaN", "Float.NaN")
      failed += func_35_2<Object, Object>(Double.NaN, Float.NaN, "Double.NaN", "Float.NaN")
      failed += func_39_1<Object, Object>(Double.NaN, new Double(Double.NaN), "Double.NaN", "new Double(Double.NaN)")
      failed += func_35_2<Object, Object>(Double.NaN, new Double(Double.NaN), "Double.NaN", "new Double(Double.NaN)")
      failed += func_39_1<Object, Object>(Double.NaN, new Float(Float.NaN), "Double.NaN", "new Float(Float.NaN)")
      failed += func_35_2<Object, Object>(Double.NaN, new Float(Float.NaN), "Double.NaN", "new Float(Float.NaN)")
      failed += func_39_1<Object, Object>(Float.NaN, Double.POSITIVE_INFINITY, "Float.NaN", "Double.POSITIVE_INFINITY")
      failed += func_35_2<Object, Object>(Float.NaN, Double.POSITIVE_INFINITY, "Float.NaN", "Double.POSITIVE_INFINITY")
      failed += func_39_1<Object, Object>(Float.NaN, Double.NEGATIVE_INFINITY, "Float.NaN", "Double.NEGATIVE_INFINITY")
      failed += func_35_2<Object, Object>(Float.NaN, Double.NEGATIVE_INFINITY, "Float.NaN", "Double.NEGATIVE_INFINITY")
      failed += func_39_1<Object, Object>(Float.NaN, 0.0, "Float.NaN", "0.0")
      failed += func_35_2<Object, Object>(Float.NaN, 0.0, "Float.NaN", "0.0")
      failed += func_39_1<Object, Object>(Float.NaN, Double.NaN, "Float.NaN", "Double.NaN")
      failed += func_35_2<Object, Object>(Float.NaN, Double.NaN, "Float.NaN", "Double.NaN")
      failed += func_39_1<Object, Object>(Float.NaN, new Double(Double.NaN), "Float.NaN", "new Double(Double.NaN)")
      failed += func_35_2<Object, Object>(Float.NaN, new Double(Double.NaN), "Float.NaN", "new Double(Double.NaN)")
      failed += func_39_1<Object, Object>(Float.NaN, new Float(Float.NaN), "Float.NaN", "new Float(Float.NaN)")
      failed += func_35_2<Object, Object>(Float.NaN, new Float(Float.NaN), "Float.NaN", "new Float(Float.NaN)")
      failed += func_39_1<Object, Object>(new Double(Double.NaN), Double.POSITIVE_INFINITY, "new Double(Double.NaN)", "Double.POSITIVE_INFINITY")
      failed += func_35_2<Object, Object>(new Double(Double.NaN), Double.POSITIVE_INFINITY, "new Double(Double.NaN)", "Double.POSITIVE_INFINITY")
      failed += func_39_1<Object, Object>(new Double(Double.NaN), Double.NEGATIVE_INFINITY, "new Double(Double.NaN)", "Double.NEGATIVE_INFINITY")
      failed += func_35_2<Object, Object>(new Double(Double.NaN), Double.NEGATIVE_INFINITY, "new Double(Double.NaN)", "Double.NEGATIVE_INFINITY")
      failed += func_39_1<Object, Object>(new Double(Double.NaN), 0.0, "new Double(Double.NaN)", "0.0")
      failed += func_35_2<Object, Object>(new Double(Double.NaN), 0.0, "new Double(Double.NaN)", "0.0")
      failed += func_39_1<Object, Object>(new Double(Double.NaN), Double.NaN, "new Double(Double.NaN)", "Double.NaN")
      failed += func_35_2<Object, Object>(new Double(Double.NaN), Double.NaN, "new Double(Double.NaN)", "Double.NaN")
      failed += func_39_1<Object, Object>(new Double(Double.NaN), Float.NaN, "new Double(Double.NaN)", "Float.NaN")
      failed += func_35_2<Object, Object>(new Double(Double.NaN), Float.NaN, "new Double(Double.NaN)", "Float.NaN")
      failed += func_39_1<Object, Object>(new Double(Double.NaN), new Float(Float.NaN), "new Double(Double.NaN)", "new Float(Float.NaN)")
      failed += func_35_2<Object, Object>(new Double(Double.NaN), new Float(Float.NaN), "new Double(Double.NaN)", "new Float(Float.NaN)")
      failed += func_39_1<Object, Object>(new Float(Float.NaN), Double.POSITIVE_INFINITY, "new Float(Float.NaN)", "Double.POSITIVE_INFINITY")
      failed += func_35_2<Object, Object>(new Float(Float.NaN), Double.POSITIVE_INFINITY, "new Float(Float.NaN)", "Double.POSITIVE_INFINITY")
      failed += func_39_1<Object, Object>(new Float(Float.NaN), Double.NEGATIVE_INFINITY, "new Float(Float.NaN)", "Double.NEGATIVE_INFINITY")
      failed += func_35_2<Object, Object>(new Float(Float.NaN), Double.NEGATIVE_INFINITY, "new Float(Float.NaN)", "Double.NEGATIVE_INFINITY")
      failed += func_39_1<Object, Object>(new Float(Float.NaN), 0.0, "new Float(Float.NaN)", "0.0")
      failed += func_35_2<Object, Object>(new Float(Float.NaN), 0.0, "new Float(Float.NaN)", "0.0")
      failed += func_39_1<Object, Object>(new Float(Float.NaN), Double.NaN, "new Float(Float.NaN)", "Double.NaN")
      failed += func_35_2<Object, Object>(new Float(Float.NaN), Double.NaN, "new Float(Float.NaN)", "Double.NaN")
      failed += func_39_1<Object, Object>(new Float(Float.NaN), Float.NaN, "new Float(Float.NaN)", "Float.NaN")
      failed += func_35_2<Object, Object>(new Float(Float.NaN), Float.NaN, "new Float(Float.NaN)", "Float.NaN")
      failed += func_39_1<Object, Object>(new Float(Float.NaN), new Double(Double.NaN), "new Float(Float.NaN)", "new Double(Double.NaN)")
      failed += func_35_2<Object, Object>(new Float(Float.NaN), new Double(Double.NaN), "new Float(Float.NaN)", "new Double(Double.NaN)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3200
     * @tc.name      testTypeParameterOperators0032
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(new BigInt(1), new BigInt(2), "new BigInt(1)", "new BigInt(2)")
      failed += func_35_2<Object, Object>(new BigInt(1), new BigInt(2), "new BigInt(1)", "new BigInt(2)")
      failed += func_39_1<Object, Object>(new BigInt(2), new BigInt(1), "new BigInt(2)", "new BigInt(1)")
      failed += func_35_2<Object, Object>(new BigInt(2), new BigInt(1), "new BigInt(2)", "new BigInt(1)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3300
     * @tc.name      testTypeParameterOperators0033
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(Size.SMALLTEST, Size.MEDIUMTEST, "Size.SMALLTEST", "Size.MEDIUMTEST")
      failed += func_35_2<Object, Object>(Size.SMALLTEST, Size.MEDIUMTEST, "Size.SMALLTEST", "Size.MEDIUMTEST")
      failed += func_39_1<Object, Object>(Size.MEDIUMTEST, Size.SMALLTEST, "Size.MEDIUMTEST", "Size.SMALLTEST")
      failed += func_35_2<Object, Object>(Size.MEDIUMTEST, Size.SMALLTEST, "Size.MEDIUMTEST", "Size.SMALLTEST")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3400
     * @tc.name      testTypeParameterOperators0034
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>('0', '\u0000', "'0'", "'\\u0000'")
      failed += func_35_2<Object, Object>('0', '\u0000', "'0'", "'\\u0000'")
      failed += func_39_1<Object, Object>('0', ' ', "'0'", "' '")
      failed += func_35_2<Object, Object>('0', ' ', "'0'", "' '")
      failed += func_39_1<Object, Object>('\u0000', '0', "'\\u0000'", "'0'")
      failed += func_35_2<Object, Object>('\u0000', '0', "'\\u0000'", "'0'")
      failed += func_39_1<Object, Object>('\u0000', ' ', "'\\u0000'", "' '")
      failed += func_35_2<Object, Object>('\u0000', ' ', "'\\u0000'", "' '")
      failed += func_39_1<Object, Object>(' ', '0', "' '", "'0'")
      failed += func_35_2<Object, Object>(' ', '0', "' '", "'0'")
      failed += func_39_1<Object, Object>(' ', '\u0000', "' '", "'\\u0000'")
      failed += func_35_2<Object, Object>(' ', '\u0000', "' '", "'\\u0000'")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3500
     * @tc.name      testTypeParameterOperators0035
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')")
      failed += func_39_1<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')")
      failed += func_35_2<Object, Object>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3600
     * @tc.name      testTypeParameterOperators0036
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<Number>(127.0, '127.0', "127.0", "'127.0'")
      failed += func_49_2<Number>(127.0, '127.0', "127.0", "'127.0'")
      failed += func_49_1<Number>(127.0, 127n, "127.0", "127n")
      failed += func_49_2<Number>(127.0, 127n, "127.0", "127n")
      failed += func_49_1<Number>(127.0, true, "127.0", "true")
      failed += func_49_2<Number>(127.0, true, "127.0", "true")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3700
     * @tc.name      testTypeParameterOperators0037
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<String>(new String('127.0'), new Number(127.0), "new String('127.0')", "new Number(127.0)")
      failed += func_49_2<String>(new String('127.0'), new Number(127.0), "new String('127.0')", "new Number(127.0)")
      failed += func_49_1<String>(new String('127.0'), new BigInt(127), "new String('127.0')", "new BigInt(127)")
      failed += func_49_2<String>(new String('127.0'), new BigInt(127), "new String('127.0')", "new BigInt(127)")
      failed += func_49_1<String>(new String('127.0'), new Boolean(false), "new String('127.0')", "new Boolean(false)")
      failed += func_49_2<String>(new String('127.0'), new Boolean(false), "new String('127.0')", "new Boolean(false)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_3800
     * @tc.name      testTypeParameterOperators0038
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<bigint>(new BigInt(0), new Int(), "new BigInt(0)", "new Int()")
      failed += func_49_2<bigint>(new BigInt(0), new Int(), "new BigInt(0)", "new Int()")
      failed += func_49_1<bigint>(new BigInt(0), '0', "new BigInt(0)", "'0'")
      failed += func_49_2<bigint>(new BigInt(0), '0', "new BigInt(0)", "'0'")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4000
     * @tc.name      testTypeParameterOperators0040
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<Boolean>(new Boolean(false), new Boolean(true), "new Boolean(false)", "new Boolean(true)")
      failed += func_49_2<Boolean>(new Boolean(false), new Boolean(true), "new Boolean(false)", "new Boolean(true)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4100
     * @tc.name      testTypeParameterOperators0041
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<Boolean>(true, false, "true", "false")
      failed += func_49_2<Boolean>(true, false, "true", "false")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4200
     * @tc.name      testTypeParameterOperators0042
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<Number>(0.0, Double.POSITIVE_INFINITY, "0.0", "Double.POSITIVE_INFINITY")
      failed += func_49_2<Number>(0.0, Double.POSITIVE_INFINITY, "0.0", "Double.POSITIVE_INFINITY")
      failed += func_49_1<Number>(0.0, Double.NEGATIVE_INFINITY, "0.0", "Double.NEGATIVE_INFINITY")
      failed += func_49_2<Number>(0.0, Double.NEGATIVE_INFINITY, "0.0", "Double.NEGATIVE_INFINITY")
      failed += func_49_1<Number>(0.0, Double.NaN, "0.0", "Double.NaN")
      failed += func_49_2<Number>(0.0, Double.NaN, "0.0", "Double.NaN")
      failed += func_49_1<Number>(0.0, Float.NaN, "0.0", "Float.NaN")
      failed += func_49_2<Number>(0.0, Float.NaN, "0.0", "Float.NaN")
      failed += func_49_1<Number>(0.0, new Double(Double.NaN), "0.0", "new Double(Double.NaN)")
      failed += func_49_2<Number>(0.0, new Double(Double.NaN), "0.0", "new Double(Double.NaN)")
      failed += func_49_1<Number>(0.0, new Float(Float.NaN), "0.0", "new Float(Float.NaN)")
      failed += func_49_2<Number>(0.0, new Float(Float.NaN), "0.0", "new Float(Float.NaN)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4300
     * @tc.name      testTypeParameterOperators0043
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<bigint>(new BigInt(1), new BigInt(2), "new BigInt(1)", "new BigInt(2)")
      failed += func_49_2<bigint>(new BigInt(1), new BigInt(2), "new BigInt(1)", "new BigInt(2)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4500
     * @tc.name      testTypeParameterOperators0045
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<number|Size|boolean>(Size.SMALLTEST, Size.MEDIUMTEST, "Size.SMALLTEST", "Size.MEDIUMTEST")
      failed += func_49_2<number|Size|boolean>(Size.SMALLTEST, Size.MEDIUMTEST, "Size.SMALLTEST", "Size.MEDIUMTEST")
      failed += func_49_1<number|Size|boolean>(Size.SMALLTEST, 'M', "Size.SMALLTEST", "'M'")
      failed += func_49_2<number|Size|boolean>(Size.SMALLTEST, 'M', "Size.SMALLTEST", "'M'")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4600
     * @tc.name      testTypeParameterOperators0046
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<string>('0', '\u0000', "'0'", "'\\u0000'")
      failed += func_49_2<string>('0', '\u0000', "'0'", "'\\u0000'")
      failed += func_49_1<string>('0', ' ', "'0'", "' '")
      failed += func_49_2<string>('0', ' ', "'0'", "' '")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4700
     * @tc.name      testTypeParameterOperators0047
     * @tc.desc      A value of type Object can be compared to a value of any reference type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_49_1<string>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')")
      failed += func_49_2<string>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ ')")
      failed += func_49_1<string>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')")
      failed += func_49_2<string>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  '), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ  ')")
      failed += func_49_1<string>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')")
      failed += func_49_2<string>(new String('ABCDEFGHIJKLMNOPRSTUVWXYZ'), new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\u0000'), "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ')", "new String('ABCDEFGHIJKLMNOPRSTUVWXYZ\\u0000')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4800
     * @tc.name      testTypeParameterOperators0048
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<int|boolean, string|long>(-128, -129 as long, "-128", "-129 as long")
      failed += func_35_2<int|boolean, string|long>(-128, -129 as long, "-128", "-129 as long")
      failed += func_39_1<int|boolean, string|long>(-128, new Long(-129 as long), "-128", "new Long(-129 as long)")
      failed += func_35_2<int|boolean, string|long>(-128, new Long(-129 as long), "-128", "new Long(-129 as long)")
      failed += func_39_1<int|boolean, string|long>(new Int(-128), -129 as long, "new Int(-128)", "-129 as long")
      failed += func_35_2<int|boolean, string|long>(new Int(-128), -129 as long, "new Int(-128)", "-129 as long")
      failed += func_39_1<int|boolean, string|long>(new Int(-128), new Long(-129 as long), "new Int(-128)", "new Long(-129 as long)")
      failed += func_35_2<int|boolean, string|long>(new Int(-128), new Long(-129 as long), "new Int(-128)", "new Long(-129 as long)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_4900
     * @tc.name      testTypeParameterOperators0049
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<number|string, Object|null>(-128.0, 127 as byte, "-128.0", "127 as byte")
      failed += func_35_2<number|string, Object|null>(-128.0, 127 as byte, "-128.0", "127 as byte")
      failed += func_39_1<number|string, Object|null>(-128.0, 127 as short, "-128.0", "127 as short")
      failed += func_35_2<number|string, Object|null>(-128.0, 127 as short, "-128.0", "127 as short")
      failed += func_39_1<number|string, Object|null>(-128.0, 127, "-128.0", "127")
      failed += func_35_2<number|string, Object|null>(-128.0, 127, "-128.0", "127")
      failed += func_39_1<number|string, Object|null>(-128.0, 127 as long, "-128.0", "127 as long")
      failed += func_35_2<number|string, Object|null>(-128.0, 127 as long, "-128.0", "127 as long")
      failed += func_39_1<number|string, Object|null>(-128.0, 127.0f, "-128.0", "127.0f")
      failed += func_35_2<number|string, Object|null>(-128.0, 127.0f, "-128.0", "127.0f")
      failed += func_39_1<number|string, Object|null>(-128.0, new Byte(127 as byte), "-128.0", "new Byte(127 as byte)")
      failed += func_35_2<number|string, Object|null>(-128.0, new Byte(127 as byte), "-128.0", "new Byte(127 as byte)")
      failed += func_39_1<number|string, Object|null>(-128.0, new Short(127 as short), "-128.0", "new Short(127 as short)")
      failed += func_35_2<number|string, Object|null>(-128.0, new Short(127 as short), "-128.0", "new Short(127 as short)")
      failed += func_39_1<number|string, Object|null>(-128.0, new Int(127), "-128.0", "new Int(127)")
      failed += func_35_2<number|string, Object|null>(-128.0, new Int(127), "-128.0", "new Int(127)")
      failed += func_39_1<number|string, Object|null>(-128.0, new Long(127 as long), "-128.0", "new Long(127 as long)")
      failed += func_35_2<number|string, Object|null>(-128.0, new Long(127 as long), "-128.0", "new Long(127 as long)")
      failed += func_39_1<number|string, Object|null>(-128.0, new Float(127.0f), "-128.0", "new Float(127.0f)")
      failed += func_35_2<number|string, Object|null>(-128.0, new Float(127.0f), "-128.0", "new Float(127.0f)")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), 127 as byte, "new Double(-128.0)", "127 as byte")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), 127 as byte, "new Double(-128.0)", "127 as byte")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), 127 as short, "new Double(-128.0)", "127 as short")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), 127 as short, "new Double(-128.0)", "127 as short")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), 127, "new Double(-128.0)", "127")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), 127, "new Double(-128.0)", "127")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), 127 as long, "new Double(-128.0)", "127 as long")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), 127 as long, "new Double(-128.0)", "127 as long")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), 127.0f, "new Double(-128.0)", "127.0f")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), 127.0f, "new Double(-128.0)", "127.0f")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), new Byte(127 as byte), "new Double(-128.0)", "new Byte(127 as byte)")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), new Byte(127 as byte), "new Double(-128.0)", "new Byte(127 as byte)")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), new Short(127 as short), "new Double(-128.0)", "new Short(127 as short)")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), new Short(127 as short), "new Double(-128.0)", "new Short(127 as short)")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), new Int(127), "new Double(-128.0)", "new Int(127)")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), new Int(127), "new Double(-128.0)", "new Int(127)")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), new Long(127 as long), "new Double(-128.0)", "new Long(127 as long)")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), new Long(127 as long), "new Double(-128.0)", "new Long(127 as long)")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), new Float(127.0f), "new Double(-128.0)", "new Float(127.0f)")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), new Float(127.0f), "new Double(-128.0)", "new Float(127.0f)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5000
     * @tc.name      testTypeParameterOperators0050
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as byte, 1 as long, "0 as byte", "1 as long")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as byte, 1 as long, "0 as byte", "1 as long")
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as byte, c'\u0001', "0 as byte", "c'\\u0001'")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as byte, c'\u0001', "0 as byte", "c'\\u0001'")
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as byte, new Long(1 as long), "0 as byte", "new Long(1 as long)")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as byte, new Long(1 as long), "0 as byte", "new Long(1 as long)")
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as byte, new Char(c'\u0001'), "0 as byte", "new Char(c'\\u0001')")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as byte, new Char(c'\u0001'), "0 as byte", "new Char(c'\\u0001')")
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as short, 1 as long, "0 as short", "1 as long")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as short, 1 as long, "0 as short", "1 as long")
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as short, c'\u0001', "0 as short", "c'\\u0001'")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as short, c'\u0001', "0 as short", "c'\\u0001'")
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as short, new Long(1 as long), "0 as short", "new Long(1 as long)")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as short, new Long(1 as long), "0 as short", "new Long(1 as long)")
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as short, new Char(c'\u0001'), "0 as short", "new Char(c'\\u0001')")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as short, new Char(c'\u0001'), "0 as short", "new Char(c'\\u0001')")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Byte(0 as byte), 1 as long, "new Byte(0 as byte)", "1 as long")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Byte(0 as byte), 1 as long, "new Byte(0 as byte)", "1 as long")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Byte(0 as byte), c'\u0001', "new Byte(0 as byte)", "c'\\u0001'")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Byte(0 as byte), c'\u0001', "new Byte(0 as byte)", "c'\\u0001'")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Byte(0 as byte), new Long(1 as long), "new Byte(0 as byte)", "new Long(1 as long)")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Byte(0 as byte), new Long(1 as long), "new Byte(0 as byte)", "new Long(1 as long)")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Byte(0 as byte), new Char(c'\u0001'), "new Byte(0 as byte)", "new Char(c'\\u0001')")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Byte(0 as byte), new Char(c'\u0001'), "new Byte(0 as byte)", "new Char(c'\\u0001')")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Short(0 as short), 1 as long, "new Short(0 as short)", "1 as long")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Short(0 as short), 1 as long, "new Short(0 as short)", "1 as long")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Short(0 as short), c'\u0001', "new Short(0 as short)", "c'\\u0001'")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Short(0 as short), c'\u0001', "new Short(0 as short)", "c'\\u0001'")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Short(0 as short), new Long(1 as long), "new Short(0 as short)", "new Long(1 as long)")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Short(0 as short), new Long(1 as long), "new Short(0 as short)", "new Long(1 as long)")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Short(0 as short), new Char(c'\u0001'), "new Short(0 as short)", "new Char(c'\\u0001')")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Short(0 as short), new Char(c'\u0001'), "new Short(0 as short)", "new Char(c'\\u0001')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5100
     * @tc.name      testTypeParameterOperators0051
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<int|boolean, string|long>(-128, '-128', "-128", "'-128'")
      failed += func_35_2<int|boolean, string|long>(-128, '-128', "-128", "'-128'")
      failed += func_39_1<int|boolean, string|long>(-128, '-128 as long', "-128", "'-128 as long'")
      failed += func_35_2<int|boolean, string|long>(-128, '-128 as long', "-128", "'-128 as long'")
      failed += func_39_1<int|boolean, string|long>(new Int(-128), '-128', "new Int(-128)", "'-128'")
      failed += func_35_2<int|boolean, string|long>(new Int(-128), '-128', "new Int(-128)", "'-128'")
      failed += func_39_1<int|boolean, string|long>(new Int(-128), '-128 as long', "new Int(-128)", "'-128 as long'")
      failed += func_35_2<int|boolean, string|long>(new Int(-128), '-128 as long', "new Int(-128)", "'-128 as long'")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5200
     * @tc.name      testTypeParameterOperators0052
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<number|string, Object|null>(-128.0, null, "-128.0", "null")
      failed += func_35_2<number|string, Object|null>(-128.0, null, "-128.0", "null")
      failed += func_39_1<number|string, Object|null>(-128.0, new Error(), "-128.0", "new Error()")
      failed += func_35_2<number|string, Object|null>(-128.0, new Error(), "-128.0", "new Error()")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), null, "new Double(-128.0)", "null")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), null, "new Double(-128.0)", "null")
      failed += func_39_1<number|string, Object|null>(new Double(-128.0), new Error(), "new Double(-128.0)", "new Error()")
      failed += func_35_2<number|string, Object|null>(new Double(-128.0), new Error(), "new Double(-128.0)", "new Error()")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5300
     * @tc.name      testTypeParameterOperators0053
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as byte, new Error(), "0 as byte", "new Error()")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as byte, new Error(), "0 as byte", "new Error()")
      failed += func_39_1<byte|short|Error, char|long|Error>(0 as short, new Error(), "0 as short", "new Error()")
      failed += func_35_2<byte|short|Error, char|long|Error>(0 as short, new Error(), "0 as short", "new Error()")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Byte(0 as byte), new Error(), "new Byte(0 as byte)", "new Error()")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Byte(0 as byte), new Error(), "new Byte(0 as byte)", "new Error()")
      failed += func_39_1<byte|short|Error, char|long|Error>(new Short(0 as short), new Error(), "new Short(0 as short)", "new Error()")
      failed += func_35_2<byte|short|Error, char|long|Error>(new Short(0 as short), new Error(), "new Short(0 as short)", "new Error()")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5400
     * @tc.name      testTypeParameterOperators0054
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<number|string|boolean, char|Error|string|null>('   ', `  `, "'   '", "`  `")
      failed += func_35_2<number|string|boolean, char|Error|string|null>('   ', `  `, "'   '", "`  `")
      failed += func_39_1<number|string|boolean, char|Error|string|null>('   ', new String(' '), "'   '", "new String(' ')")
      failed += func_35_2<number|string|boolean, char|Error|string|null>('   ', new String(' '), "'   '", "new String(' ')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5500
     * @tc.name      testTypeParameterOperators0055
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object|string, Error|string>('AA', new String('A'), "'AA'", "new String('A')")
      failed += func_35_2<Object|string, Error|string>('AA', new String('A'), "'AA'", "new String('A')")
      failed += func_39_1<Object|string, Error|string>(`AAA`, new String('A'), "`AAA`", "new String('A')")
      failed += func_35_2<Object|string, Error|string>(`AAA`, new String('A'), "`AAA`", "new String('A')")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5600
     * @tc.name      testTypeParameterOperators0056
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<number|string|boolean, char|Error|string|null>(1.0, new Error(), "1.0", "new Error()")
      failed += func_35_2<number|string|boolean, char|Error|string|null>(1.0, new Error(), "1.0", "new Error()")
      failed += func_39_1<number|string|boolean, char|Error|string|null>(1.0, null, "1.0", "null")
      failed += func_35_2<number|string|boolean, char|Error|string|null>(1.0, null, "1.0", "null")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5700
     * @tc.name      testTypeParameterOperators0057
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Object|string, Error|string>(new Number(), new Error(), "new Number()", "new Error()")
      failed += func_35_2<Object|string, Error|string>(new Number(), new Error(), "new Number()", "new Error()")
      failed += func_39_1<Object|string, Error|string>('', new Error(), "''", "new Error()")
      failed += func_35_2<Object|string, Error|string>('', new Error(), "''", "new Error()")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5800
     * @tc.name      testTypeParameterOperators0058
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Error|number|boolean, string|number|boolean>(true, new Boolean(false), "true", "new Boolean(false)")
      failed += func_35_2<Error|number|boolean, string|number|boolean>(true, new Boolean(false), "true", "new Boolean(false)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_5900
     * @tc.name      testTypeParameterOperators0059
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Error|number|boolean, string|number|boolean>(new Error(), new Boolean(false), "new Error()", "new Boolean(false)")
      failed += func_35_2<Error|number|boolean, string|number|boolean>(new Error(), new Boolean(false), "new Error()", "new Boolean(false)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_6000
     * @tc.name      testTypeParameterOperators0060
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<number|Size|boolean, number|Size|boolean>(Size.MEDIUMTEST, Size.LARGETEST, "Size.MEDIUMTEST", "Size.LARGETEST")
      failed += func_35_2<number|Size|boolean, number|Size|boolean>(Size.MEDIUMTEST, Size.LARGETEST, "Size.MEDIUMTEST", "Size.LARGETEST")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_6100
     * @tc.name      testTypeParameterOperators0061
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<Color|string, number|Color|null>(Color.Red, null, "Color.Red", "null")
      failed += func_35_2<Color|string, number|Color|null>(Color.Red, null, "Color.Red", "null")
      failed += func_39_1<Color|string, number|Color|null>(Color.Red, 111.0, "Color.Red", "111.0")
      failed += func_35_2<Color|string, number|Color|null>(Color.Red, 111.0, "Color.Red", "111.0")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_6200
     * @tc.name      testTypeParameterOperators0062
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<number|Size|boolean, number|Size|boolean>(Size.MEDIUMTEST, false, "Size.MEDIUMTEST", "false")
      failed += func_35_2<number|Size|boolean, number|Size|boolean>(Size.MEDIUMTEST, false, "Size.MEDIUMTEST", "false")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_6300
     * @tc.name      testTypeParameterOperators0063
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<long|bigint, bigint|int>(1n, new BigInt(-1), "1n", "new BigInt(-1)")
      failed += func_35_2<long|bigint, bigint|int>(1n, new BigInt(-1), "1n", "new BigInt(-1)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_6400
     * @tc.name      testTypeParameterOperators0064
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<boolean|bigint, bigint|string>(0n, -1n, "0n", "-1n")
      failed += func_35_2<boolean|bigint, bigint|string>(0n, -1n, "0n", "-1n")
      failed += func_39_1<boolean|bigint, bigint|string>(0n, new BigInt(1.0), "0n", "new BigInt(1.0)")
      failed += func_35_2<boolean|bigint, bigint|string>(0n, new BigInt(1.0), "0n", "new BigInt(1.0)")
      failed += func_39_1<boolean|bigint, bigint|string>(new BigInt(), -1n, "new BigInt()", "-1n")
      failed += func_35_2<boolean|bigint, bigint|string>(new BigInt(), -1n, "new BigInt()", "-1n")
      failed += func_39_1<boolean|bigint, bigint|string>(new BigInt(), new BigInt(1.0), "new BigInt()", "new BigInt(1.0)")
      failed += func_35_2<boolean|bigint, bigint|string>(new BigInt(), new BigInt(1.0), "new BigInt()", "new BigInt(1.0)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_6500
     * @tc.name      testTypeParameterOperators0065
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<long|bigint, bigint|int>(1n, new Int(1), "1n", "new Int(1)")
      failed += func_35_2<long|bigint, bigint|int>(1n, new Int(1), "1n", "new Int(1)")
      failed += func_39_1<long|bigint, bigint|int>(new BigInt(1), new Int(1), "new BigInt(1)", "new Int(1)")
      failed += func_35_2<long|bigint, bigint|int>(new BigInt(1), new Int(1), "new BigInt(1)", "new Int(1)")
      expect(failed).assertEqual('');
    })
    /**
     * @tc.number    SUB_TYPE_PARAMETER_EQUALITY_OPERATORS_6600
     * @tc.name      testTypeParameterOperators0066
     * @tc.desc      If actual types of values are compatible, then the corresponding evaluation of an equality operator is used.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTypeParameterOperators0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let failed: string = ''
      failed += func_39_1<boolean|bigint, bigint|string>(0n, '0', "0n", "'0'")
      failed += func_35_2<boolean|bigint, bigint|string>(0n, '0', "0n", "'0'")
      failed += func_39_1<boolean|bigint, bigint|string>(new BigInt(), '0', "new BigInt()", "'0'")
      failed += func_35_2<boolean|bigint, bigint|string>(new BigInt(), '0', "new BigInt()", "'0'")
      expect(failed).assertEqual('');
    })
  })
}
