/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
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
} from '../../../../hypium/index';

type Foo = () => int;

enum Color { Red, Green, Blue };

class A {
}

class B {
  public override toString(): string {
    return "B";
  }
}
interface I {}

interface J extends I {}

class A1 implements I {
  public override toString(): string {
    return super.toString() + " :> A";
  }
}

class B1 extends A1 implements J {
  public override toString(): string {
    return super.toString() + " :> B";
  }
}
function foo(): int {
  return 42;
};
interface I2 {}

interface J2 extends I2 {}

class A2 implements I2 {
  public override toString(): string {
    return super.toString() + " :> A";
  }
}

class B2 extends A2 implements J {
  public override toString(): string {
    return super.toString() + " :> B";
  }
}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
export default function StringOperatorContextsTest() {

  describe("StringOperatorContextsTest", () => {
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
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0100
     * @tc.name      testStringOperatorContexts0001
     * @tc.desc      Assignment contexts allow using aliases: from 'number' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: byte = 42 as byte;

      let res = p1 + "";
      let expected = "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0200
     * @tc.name      testStringOperatorContexts0002
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'Byte' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Byte = new Byte(42 as byte);
      let res = p1 + "";
      let expected = "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0300
     * @tc.name      testStringOperatorContexts0003
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'FixedArray<boolean>' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: FixedArray<boolean> = [true, false];
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0400
     * @tc.name      testStringOperatorContexts0004
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from '[boolean, number]' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: [boolean, number] = [true, 42];
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0500
     * @tc.name      testStringOperatorContexts0005
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'enum' to string (value)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let p1: Color = Color.Red;
      let res = p1 + "";
      let expected = "0";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0600
     * @tc.name      testStringOperatorContexts0006
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'enum' to string (toString)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let p1: Color = Color.Red;
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0700
     * @tc.name      testStringOperatorContexts0007
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'function type' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Foo = foo;
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0800
     * @tc.name      testStringOperatorContexts0008
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'class instance' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: A = new A();
      let res = p1 + "";
      let expected = "[object Object]";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_0900
     * @tc.name      testStringOperatorContexts0009
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'arrow function' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: (p: number) => number = (x: number): number => {
        return 2.0 * x;
      };
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1000
     * @tc.name      testStringOperatorContexts0010
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'Integral' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Integral = new Byte(42 as byte);
      let res = p1 + "";
      let expected = "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1100
     * @tc.name      testStringOperatorContexts0011
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'float' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
    */
    it("testStringOperatorContexts0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: float = 3.14f;
      let res = p1 + "";
      let expected = new Float(3.14).toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1200
     * @tc.name      testStringOperatorContexts0012
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'Float' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
    */
    it("testStringOperatorContexts0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: float = 3.14f;
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1300
     * @tc.name      testStringOperatorContexts0013
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'Floating' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: float = 3.14f;
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1400
     * @tc.name      testStringOperatorContexts0014
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'Object|null' to string (null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Object | null = null;
      let res = p1 + "";
      let expected = "null";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1500
     * @tc.name      testStringOperatorContexts0015
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'Object' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Object = new Object();
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1600
     * @tc.name      testStringOperatorContexts0016
     * @tc.desc      String contexts conversion. String operand at the end of the expression: from 'boolean[]' to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: boolean[] = [true, false];
      let res = p1 + "";
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1700
     * @tc.name      testStringOperatorContexts0017
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: multiple primitive types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: byte = 42 as byte;
      let p2: short = 42;
      let p3: int = 42;
      let p4: long = 42;
      let p5: char = c'\u0020';
      let p6: boolean = true;
      let p7: boolean = false;
      let p8: bigint = 42n;
      let res = p1 + p2 + p3 + p4 + "" + p5 + p6 + p7 + p8;
      let expected = 42 + 42 + 42 + 42 + " " + "true" + "false" + "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1800
     * @tc.name      testStringOperatorContexts0018
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: multiple wrapper types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Byte = new Byte(42 as byte);
      let p2: Short = new Short(42);
      let p3: Int = new Int(42);
      let p4: Long = new Long(42);
      let p5: Boolean = new Boolean(true);
      let p6: Boolean = new Boolean(false);
      let p7: bigint = new BigInt(42);
      let res = p1 + p2 + p3 + p4 + "" + p5 + p6 + p7;
      let expected = 42 + 42 + 42 + 42 + "true" + "false" + "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_1900
     * @tc.name      testStringOperatorContexts0019
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: FixedArray<char> + FixedArray<int>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: FixedArray<char> = [c'A', c'\uFAFA'];
      let p2: FixedArray<int> = [1431655765];
      let res = p1 + "" + p2;
      let expected = p1 + p2.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2000
     * @tc.name      testStringOperatorContexts0020
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: tuple types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: [byte, number] = [1 as byte, 2];
      let p2: [double, double, number] = [1.0, 2.0, 3.0];
      let res = p1 + "" + p2;
      let expected = p1 + p2.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2100
     * @tc.name      testStringOperatorContexts0021
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: enum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let p1: Color = Color.Red;
      let p2: Color = Color.Blue;
      let p3: Color = Color.Green;
      let res = p1 + p2 + "" + p3;
      let expected = 0 + 2 + "1";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2200
     * @tc.name      testStringOperatorContexts0022
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: enum with toString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let p1: Color = Color.Red;
      let p2: Color = Color.Blue;
      let p3: Color = Color.Green;
      let res = p1 + p2 + "" + p3;
      let expected = p1 + p2 + p3.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2300
     * @tc.name      testStringOperatorContexts0023
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: A = new A();
      let p2: B = new B();
      let res = p1 + "" + p2;
      let expected = "[object Object]" + "B";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2400
     * @tc.name      testStringOperatorContexts0024
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: Integral types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Integral = new Byte(42 as byte);
      let p2: Integral = new Short(42);
      let p3: Integral = new Int(42);
      let p4: Integral = new Long(42);
      let res = p1 + p2 + "" + p3 + p4;
      let expected = 42 + 42 + "42" + "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2500
     * @tc.name      testStringOperatorContexts0025
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: floating types with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: float = 3.14f;
      let p2: double = 3.14;
      let p3: float = 0.0f / 0.0f;
      let p4: double = 0.0 / 0.0;
      let p5: float = 1.0f / 0.0f;
      let p6: double = 1.0 / 0.0;
      let p7: float = -1.0f / 0.0f;
      let p8: double = -1.0 / 0.0;
      let res = p1 + p2 + p3 + p4 + "" + p5 + p6 + p7 + p8;
      let expected = new Float(3.14f
      )
      +new Double(3.14) + NaN + NaN + "Infinity" + "Infinity" + "-Infinity" + "-Infinity";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2600
     * @tc.name      testStringOperatorContexts0026
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: wrapper floating types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Float = new Float(3.14f
      )
      ;
      let p2: Double = new Double(3.14);
      let p3: Float = new Float(0.0f / 0.0f
      )
      ;
      let p4: Double = new Double(0.0 / 0.0);
      let p5: Float = new Float(1.0f / 0.0f
      )
      ;
      let p6: Double = new Double(1.0 / 0.0);
      let p7: Float = new Float(-1.0f / 0.0f
      )
      ;
      let p8: Double = new Double(-1.0 / 0.0);
      let res = p1 + p2 + p3 + p4 + "" + p5 + p6 + p7 + p8;
      let expected = p1 + p2 + NaN + NaN + "Infinity" + "Infinity" + "-Infinity" + "-Infinity";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2700
     * @tc.name      testStringOperatorContexts0027
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: Floating types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Floating = new Float(3.14f
      )
      ;
      let p2: Floating = new Double(3.14);
      let res = p1 + "" + p2;
      let expected = p1 + p2.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2800
     * @tc.name      testStringOperatorContexts0028
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: undefined and null types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Char | undefined = undefined;
      let p2: Error | null = null;
      let res = p1 + "" + p2;
      let expected = "undefined" + "null";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_2900
     * @tc.name      testStringOperatorContexts0029
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: Object and Boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Object = new Object();
      let p2: Boolean = new Boolean();
      let res = p1 + "" + p2;
      let expected = p1.toString() + p2.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3000
     * @tc.name      testStringOperatorContexts0030
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: char[] and float[]
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: char[] = [c'A', c'\uFAFA'];
      let p2: float[] = [0.1f, 0.2f, 0.3f];
      let res = p1 + "" + p2;
      let expected = p1 + p2.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3100
     * @tc.name      testStringOperatorContexts0031
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: multiple primitive types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: byte = 42 as byte;
      let p2: short = 42;
      let p3: int = 42;
      let p4: long = 42;
      let p5: char = c'\u0020';
      let p6: boolean = true;
      let p7: boolean = false;
      let p8: bigint = 42n;
      let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
      let expected = "42" + "42" + "42" + "42" + " " + "true" + "false" + "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3200
     * @tc.name      testStringOperatorContexts0032
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: multiple wrapper types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Byte = new Byte(42 as byte);
      let p2: Short = new Short(42);
      let p3: Int = new Int(42);
      let p4: Long = new Long(42);
      let p5: Boolean = new Boolean(true);
      let p6: Boolean = new Boolean(false);
      let p7: bigint = new BigInt(42);
      let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7;
      let expected = "42" + "42" + "42" + "42" + "true" + "false" + "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3300
     * @tc.name      testStringOperatorContexts0033
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: multiple FixedArray types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: FixedArray<boolean> = [true, false];
      let p2: FixedArray<byte> = [1, 2];
      let p3: FixedArray<char> = [c'A', c'\uFAFA'];
      let p4: FixedArray<short> = [5, 6];
      let p5: FixedArray<int> = [1431655765];
      let p6: FixedArray<long> = [6148914691236517];
      let p7: FixedArray<float> = [0.1f, 0.2f, 0.3f];
      let p8: FixedArray<double> = [1.0, 2.0, 3.0];
      let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
      let expected =
        p1.toString() + p2.toString() + p3.toString() + p4.toString() + p5.toString() + p6.toString() + p7.toString() +
        p8.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3400
     * @tc.name      testStringOperatorContexts0034
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: multiple tuple types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: [boolean, number] = [true, 42];
      let p2: [byte, number] = [1 as byte, 2];
      let p3: [number, char, char] = [42, c'A', c'\uFAFA'];
      let p4: [short, number] = [5, 6];
      let p5: [int, string] = [1431655765, 'abc'];
      let p6: [long, int] = [6148914691236517, 1431655765];
      let p7: [float, float, float] = [0.1f, 0.2f, 0.3f];
      let p8: [double, double, number] = [1.0, 2.0, 3.0];
      let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
      let expected =
        p1.toString() + p2.toString() + p3.toString() + p4.toString() + p5.toString() + p6.toString() + p7.toString() +
        p8.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3500
     * @tc.name      testStringOperatorContexts0035
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: enum values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let p1: Color = Color.Red;
      let p2: Color = Color.Blue;
      let p3: Color = Color.Green;
      let res = "" + p1 + p2 + p3;
      let expected = "0" + "2" + "1";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3600
     * @tc.name      testStringOperatorContexts0036
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: enum with toString
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      let p1: Color = Color.Red;
      let p2: Color = Color.Blue;
      let p3: Color = Color.Green;
      let res = "" + p1 + p2 + p3;
      let expected = p1.toString() + p2.toString() + p3.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3700
     * @tc.name      testStringOperatorContexts0037
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Foo = foo;
      let res = "" + p1;
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3800
     * @tc.name      testStringOperatorContexts0038
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: A = new A();
      let p2: B = new B();
      let res = "" + p1 + p2;
      let expected = "[object Object]" + "B";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_3900
     * @tc.name      testStringOperatorContexts0039
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: arrow function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: (p: number) => number = (x: number): number => {
        return 2.0 * x;
      };
      let res = "" + p1;
      let expected = p1.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4000
     * @tc.name      testStringOperatorContexts0040
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: Integral types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Integral = new Byte(42 as byte);
      let p2: Integral = new Short(42);
      let p3: Integral = new Int(42);
      let p4: Integral = new Long(42);
      let res = "" + p1 + p2 + p3 + p4;
      let expected = "42" + "42" + "42" + "42";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4100
     * @tc.name      testStringOperatorContexts0041
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: floating types with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: float = 3.14f;
      let p2: double = 3.14;
      let p3: float = 0.0f / 0.0f;
      let p4: double = 0.0 / 0.0;
      let p5: float = 1.0f / 0.0f;
      let p6: double = 1.0 / 0.0;
      let p7: float = -1.0f / 0.0f;
      let p8: double = -1.0 / 0.0;
      let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
      let expected = new Float(3.14f
      )
      .
      toString() + new Double(3.14).toString() + "NaN" + "NaN" + "Infinity" + "Infinity" + "-Infinity" + "-Infinity";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4200
     * @tc.name      testStringOperatorContexts0042
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: wrapper floating types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Float = new Float(3.14f
      )
      ;
      let p2: Double = new Double(3.14);
      let p3: Float = new Float(0.0f / 0.0f
      )
      ;
      let p4: Double = new Double(0.0 / 0.0);
      let p5: Float = new Float(1.0f / 0.0f
      )
      ;
      let p6: Double = new Double(1.0 / 0.0);
      let p7: Float = new Float(-1.0f / 0.0f
      )
      ;
      let p8: Double = new Double(-1.0 / 0.0);
      let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
      let expected =
        p1.toString() + p2.toString() + "NaN" + "NaN" + "Infinity" + "Infinity" + "-Infinity" + "-Infinity";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4300
     * @tc.name      testStringOperatorContexts0043
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: Floating types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Floating = new Float(3.14f
      )
      ;
      let p2: Floating = new Double(3.14);
      let res = "" + p1 + p2;
      let expected = p1.toString() + p2.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4400
     * @tc.name      testStringOperatorContexts0044
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: null and undefined types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Object | null = null;
      let p2: Char | undefined = undefined;
      let p3: Boolean | null = null;
      let p4: StringBuilder | undefined = undefined;
      let p5: Error | null = null;
      let res = "" + p1 + p2 + p3 + p4 + p5;
      let expected = "null" + "undefined" + "null" + "undefined" + "null";
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4500
     * @tc.name      testStringOperatorContexts0045
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: Object and wrapper types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Object = new Object();
      let p2: Char = new Char();
      let p3: Boolean = new Boolean();
      let p4: StringBuilder = new StringBuilder();
      let res = "" + p1 + p2 + p3 + p4;
      let expected = p1.toString() + p2.toString() + p3.toString() + p4.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4600
     * @tc.name      testStringOperatorContexts0046
     * @tc.desc      String contexts conversion. String operand at the beginning of the expression: multiple primitive arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: boolean[] = [true, false];
      let p2: byte[] = [1, 2];
      let p3: char[] = [c'A', c'\uFAFA'];
      let p4: short[] = [5, 6];
      let p5: int[] = [1431655765];
      let p6: long[] = [6148914691236517];
      let p7: float[] = [0.1f, 0.2f, 0.3f];
      let p8: double[] = [1.0, 2.0, 3.0];
      let res = "" + p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8;
      let expected =
        p1.toString() + p2.toString() + p3.toString() + p4.toString() + p5.toString() + p6.toString() + p7.toString() +
        p8.toString();
      expect(res).assertEqual(expected);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4700
     * @tc.name      testStringOperatorContexts0047
     * @tc.desc      String conversion: null type to string (string|null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: string | null = null;
      let dst: string = src + "";
      expect(dst).assertEqual("null");
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4800
     * @tc.name      testStringOperatorContexts0048
     * @tc.desc      String conversion: null type to string (Error|null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error | null = null;
      let dst: string = src + "";
      expect(dst).assertEqual("null");
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_4900
     * @tc.name      testStringOperatorContexts0049
     * @tc.desc      String conversion: null type to string (string|null at beginning)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: string | null = null;
      let dst: string = "" + src;
      expect(dst).assertEqual("null");
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5000
     * @tc.name      testStringOperatorContexts0050
     * @tc.desc      String conversion: null type to string (Error|null at beginning)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error | null = null;
      let dst: string = "" + src;
      expect(dst).assertEqual("null");
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5100
     * @tc.name      testStringOperatorContexts0051
     * @tc.desc      String conversion: primitive types to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: byte = -123;
      let dst_1: string = "" + src_1;
      let exp_1: string = (new Byte(src_1)).toString();
      expect(dst_1).assertEqual(exp_1);

      let src_2: short = -123;
      let dst_2: string = "" + src_2;
      let exp_2: string = (new Short(src_2)).toString();
      expect(dst_2).assertEqual(exp_2);

      let src_3: char = c'X';
      let dst_3: string = "" + src_3;
      let exp_3: string = (new Char(src_3)).toString();
      expect(dst_3).assertEqual(exp_3);

      let src_4: int = -123;
      let dst_4: string = "" + src_4;
      let exp_4: string = (new Int(src_4)).toString();
      expect(dst_4).assertEqual(exp_4);

      let src_5: long = -123;
      let dst_5: string = "" + src_5;
      let exp_5: string = (new Long(src_5)).toString();
      expect(dst_5).assertEqual(exp_5);

      let src_6: float = -123.0f;
      let dst_6: string = "" + src_6;
      let exp_6: string = (new Float(src_6)).toString();
      expect(dst_6).assertEqual(exp_6);

      let src_7: double = -123.0;
      let dst_7: string = "" + src_7;
      let exp_7: string = (new Double(src_7)).toString();
      expect(dst_7).assertEqual(exp_7);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5200
     * @tc.name      testStringOperatorContexts0052
     * @tc.desc      String conversion: primitive types to string (string at end)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: byte = -123;
      let dst_1: string = src_1 + "";
      let exp_1: string = (new Byte(src_1)).toString();
      expect(dst_1).assertEqual(exp_1);

      let src_2: short = -123;
      let dst_2: string = src_2 + "";
      let exp_2: string = (new Short(src_2)).toString();
      expect(dst_2).assertEqual(exp_2);

      let src_3: char = c'X';
      let dst_3: string = src_3 + "";
      let exp_3: string = (new Char(src_3)).toString();
      expect(dst_3).assertEqual(exp_3);

      let src_4: int = -123;
      let dst_4: string = src_4 + "";
      let exp_4: string = (new Int(src_4)).toString();
      expect(dst_4).assertEqual(exp_4);

      let src_5: long = -123;
      let dst_5: string = src_5 + "";
      let exp_5: string = (new Long(src_5)).toString();
      expect(dst_5).assertEqual(exp_5);

      let src_6: float = -123.0f;
      let dst_6: string = src_6 + "";
      let exp_6: string = (new Float(src_6)).toString();
      expect(dst_6).assertEqual(exp_6);

      let src_7: double = -123.0;
      let dst_7: string = src_7 + "";
      let exp_7: string = (new Double(src_7)).toString();
      expect(dst_7).assertEqual(exp_7);
    });
    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5300
     * @tc.name      testStringOperatorContexts0053
     * @tc.desc      String conversion: reference types to string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Object = new Object();
      let dst_1: string = "" + src_1;
      let exp_1: string = src_1.toString();
      expect(dst_1).assertEqual(exp_1);

      let src_2: string = new string();
      let dst_2: string = "" + src_2;
      let exp_2: string = src_2.toString();
      expect(dst_2).assertEqual(exp_2);

      let src_3: Error = new Error();
      let dst_3: string = "" + src_3;
      let exp_3: string = src_3.toString();
      expect(dst_3).assertEqual(exp_3);

      let src_4: A1 = new A1();
      let dst_4: string = "" + src_4;
      let exp_4: string = src_4.toString();
      expect(dst_4).assertEqual(exp_4);

      let src_5: B1 = new B1();
      let dst_5: string = "" + src_5;
      let exp_5: string = src_5.toString();
      expect(dst_5).assertEqual(exp_5);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5400
     * @tc.name      testStringOperatorContexts0054
     * @tc.desc      String conversion: reference types to string (string at end)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Object = new Object();
      let dst_1: string = src_1 + "";
      let exp_1: string = src_1.toString();
      expect(dst_1).assertEqual(exp_1);

      let src_2: string = new string();
      let dst_2: string = src_2 + "";
      let exp_2: string = src_2.toString();
      expect(dst_2).assertEqual(exp_2);

      let src_3: Error = new Error();
      let dst_3: string = src_3 + "";
      let exp_3: string = src_3.toString();
      expect(dst_3).assertEqual(exp_3);

      let src_4: A2 = new A2();
      let dst_4: string = src_4 + "";
      let exp_4: string = src_4.toString();
      expect(dst_4).assertEqual(exp_4);

      let src_5: B2 = new B2();
      let dst_5: string = src_5 + "";
      let exp_5: string = src_5.toString();
      expect(dst_5).assertEqual(exp_5);
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5500
     * @tc.name      testStringOperatorContexts0055
     * @tc.desc      String conversion: undefined type to string (string|undefined at end)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: string | undefined = undefined;
      let dst: string = src + "";
      expect(dst).assertEqual("undefined");
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5600
     * @tc.name      testStringOperatorContexts0056
     * @tc.desc      String conversion: undefined type to string (Error|undefined at end)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error | undefined = undefined;
      let dst: string = src + "";
      expect(dst).assertEqual("undefined");
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5700
     * @tc.name      testStringOperatorContexts0057
     * @tc.desc      String conversion: undefined type to string (string|undefined at beginning)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: string | undefined = undefined;
      let dst: string = "" + src;
      expect(dst).assertEqual("undefined");
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5800
     * @tc.name      testStringOperatorContexts0058
     * @tc.desc      String conversion: undefined type to string (Error|undefined at beginning)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Error | undefined = undefined;
      let dst: string = "" + src;
      expect(dst).assertEqual("undefined");
    });

    /**
     * @tc.number    SUB_STRING_OPERATOR_CONTEXTS_5900
     * @tc.name      testStringOperatorContexts0059
     * @tc.desc      String contexts conversion. String operand at the middle of the expression: Integral types with toShort/toInt/toLong
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStringOperatorContexts0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1: Integral = new Byte(42 as byte);
      let p2: Integral = new Short((42).toShort());
      let p3: Integral = new Int((42).toInt());
      let p4: Integral = new Long((42).toLong());
      let res = p1 + p2 + "" + p3 + p4;
      let expected = 42 + 42 + "42" + "42";
      expect(res).assertEqual(expected);
    });
  })
}
