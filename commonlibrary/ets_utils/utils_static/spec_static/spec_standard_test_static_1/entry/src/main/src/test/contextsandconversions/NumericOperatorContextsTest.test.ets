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
} from '../../../../hypium/index';

enum IntEnum {One = 1, Two, Three}

enum IntEnum2 {One, Two, Three}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function NumericOperatorContextsTest() {
  describe("NumericOperatorContextsTest", () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await sleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0100
     * @tc.name      testNumericOperatorContexts0001
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Byte = new Byte(127 as byte);
      let arr: Byte[] = new Byte[127 + 1](0);
      arr[v.toInt()] = v;
      expect(v.toInt()).assertEqual(127);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0200
     * @tc.name      testNumericOperatorContexts0002
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Short = new Short(0x1ff);
      let arr: Short[] = new Short[511 + 1](0);
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(511);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0300
     * @tc.name      testNumericOperatorContexts0003
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(129);
      let arr: Int[] = new Int[129 + 1](0);
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(129);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0400
     * @tc.name      testNumericOperatorContexts0004
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Short = new Short(0x1ff);
      let arr: Short[] = new Short[511 + 1](0);
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(511);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0500
     * @tc.name      testNumericOperatorContexts0005
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Int = new Int(129);
      let arr: Int[] = new Int[129 + 1](0);
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(129);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0600
     * @tc.name      testNumericOperatorContexts0006
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with float type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: float = 10.0f;
      let arr: float[] = new float[10 + 1](0);
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(10);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0700
     * @tc.name      testNumericOperatorContexts0007
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: double = 20.0;
      let arr: double[] = new double[20 + 1](0);
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(20);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0800
     * @tc.name      testNumericOperatorContexts0008
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Float type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Float = new Float(1.0f);
      let arr: Float[] = new Float[1 + 1](0);
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_0900
     * @tc.name      testNumericOperatorContexts0009
     * @tc.desc      Unary numeric promotion is performed on the index expression in an array access expression with Double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Double = new Double(2.0);
      let arr: Double[] = new Double[2 + 1](0);
      arr[v.toInt()] = v;
      expect(arr[v.toInt()]).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1000
     * @tc.name      testNumericOperatorContexts0010
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 1e-23;
      let v2: double = 1e-23;
      expect(v1 - v2).assertEqual(0.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1100
     * @tc.name      testNumericOperatorContexts0011
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: byte = 1;
      let v2: short = 1;
      expect(v1 * v2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1200
     * @tc.name      testNumericOperatorContexts0012
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: short = 100;
      let v2: double = 100.0;
      expect(v1 + v2).assertEqual(200.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1300
     * @tc.name      testNumericOperatorContexts0013
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with double and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = 100.0;
      let v2: long = 2;
      expect(v1 / v2).assertEqual(50.0);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1400
     * @tc.name      testNumericOperatorContexts0014
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with IntEnum and IntEnum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: IntEnum = IntEnum.One;
      let v2: IntEnum = IntEnum.Two;
      expect(v1 + v2).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1500
     * @tc.name      testNumericOperatorContexts0015
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with IntEnum and IntEnum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: IntEnum = IntEnum.One;
      let v2: IntEnum = IntEnum.Three;
      expect(v1 * v2).assertEqual(3);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1600
     * @tc.name      testNumericOperatorContexts0016
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with IntEnum and IntEnum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: IntEnum = IntEnum.Two;
      let v2: IntEnum = IntEnum.One;
      expect(v1 / v2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1700
     * @tc.name      testNumericOperatorContexts0017
     * @tc.desc      Numeric contexts apply to the operands of an arithmetic operator with IntEnum and IntEnum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: IntEnum2 = IntEnum2.Two;
      let v2: IntEnum2 = IntEnum2.One;
      expect(v1 > v2).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1800
     * @tc.name      testNumericOperatorContexts0018
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_1900
     * @tc.name      testNumericOperatorContexts0019
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2000
     * @tc.name      testNumericOperatorContexts0020
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2100
     * @tc.name      testNumericOperatorContexts0021
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2200
     * @tc.name      testNumericOperatorContexts0022
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2300
     * @tc.name      testNumericOperatorContexts0023
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2400
     * @tc.name      testNumericOperatorContexts0024
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2500
     * @tc.name      testNumericOperatorContexts0025
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2600
     * @tc.name      testNumericOperatorContexts0026
     * @tc.desc      Widening numeric operands to the largest type with bigint and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: long = 1;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2700
     * @tc.name      testNumericOperatorContexts0027
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2800
     * @tc.name      testNumericOperatorContexts0028
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_2900
     * @tc.name      testNumericOperatorContexts0029
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3000
     * @tc.name      testNumericOperatorContexts0030
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3100
     * @tc.name      testNumericOperatorContexts0031
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3200
     * @tc.name      testNumericOperatorContexts0032
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3300
     * @tc.name      testNumericOperatorContexts0033
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3400
     * @tc.name      testNumericOperatorContexts0034
     * @tc.desc      Widening numeric operands to the largest type with bigint and bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: bigint = 1n;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3500
     * @tc.name      testNumericOperatorContexts0035
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3600
     * @tc.name      testNumericOperatorContexts0036
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3700
     * @tc.name      testNumericOperatorContexts0037
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3800
     * @tc.name      testNumericOperatorContexts0038
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_3900
     * @tc.name      testNumericOperatorContexts0039
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4000
     * @tc.name      testNumericOperatorContexts0040
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    // ----------------- conversions_byte 系列 -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4100
     * @tc.name      testNumericOperatorContexts0041
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4200
     * @tc.name      testNumericOperatorContexts0042
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4300
     * @tc.name      testNumericOperatorContexts0043
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4400
     * @tc.name      testNumericOperatorContexts0044
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4500
     * @tc.name      testNumericOperatorContexts0045
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4600
     * @tc.name      testNumericOperatorContexts0046
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4700
     * @tc.name      testNumericOperatorContexts0047
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4800
     * @tc.name      testNumericOperatorContexts0048
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_4900
     * @tc.name      testNumericOperatorContexts0049
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5000
     * @tc.name      testNumericOperatorContexts0050
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5100
     * @tc.name      testNumericOperatorContexts0051
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5200
     * @tc.name      testNumericOperatorContexts0052
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5300
     * @tc.name      testNumericOperatorContexts0053
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5400
     * @tc.name      testNumericOperatorContexts0054
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5500
     * @tc.name      testNumericOperatorContexts0055
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5600
     * @tc.name      testNumericOperatorContexts0056
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5700
     * @tc.name      testNumericOperatorContexts0057
     * @tc.desc      Widening numeric operands to the largest type with byte and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: int = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5800
     * @tc.name      testNumericOperatorContexts0058
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_5900
     * @tc.name      testNumericOperatorContexts0059
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6000
     * @tc.name      testNumericOperatorContexts0060
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6100
     * @tc.name      testNumericOperatorContexts0061
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6200
     * @tc.name      testNumericOperatorContexts0062
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6300
     * @tc.name      testNumericOperatorContexts0063
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6400
     * @tc.name      testNumericOperatorContexts0064
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6500
     * @tc.name      testNumericOperatorContexts0065
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6600
     * @tc.name      testNumericOperatorContexts0066
     * @tc.desc      Widening numeric operands to the largest type with byte and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: long = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6700
     * @tc.name      testNumericOperatorContexts0067
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6800
     * @tc.name      testNumericOperatorContexts0068
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_6900
     * @tc.name      testNumericOperatorContexts0069
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7000
     * @tc.name      testNumericOperatorContexts0070
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7100
     * @tc.name      testNumericOperatorContexts0071
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7200
     * @tc.name      testNumericOperatorContexts0072
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7300
     * @tc.name      testNumericOperatorContexts0073
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7400
     * @tc.name      testNumericOperatorContexts0074
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7500
     * @tc.name      testNumericOperatorContexts0075
     * @tc.desc      Widening numeric operands to the largest type with bigint and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: short = 1;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7600
     * @tc.name      testNumericOperatorContexts0076
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x > new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) > x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7700
     * @tc.name      testNumericOperatorContexts0077
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x >= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) >= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7800
     * @tc.name      testNumericOperatorContexts0078
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_7900
     * @tc.name      testNumericOperatorContexts0079
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x <= new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) <= x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8000
     * @tc.name      testNumericOperatorContexts0080
     * @tc.desc      Widening numeric operands to the largest type with bigint and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: byte = 1;
      expect(x < new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) < x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8100
     * @tc.name      testNumericOperatorContexts0081
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x == new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) == x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8200
     * @tc.name      testNumericOperatorContexts0082
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x === new BigInt(y)).assertEqual(true);
      expect(new BigInt(y) === x).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8300
     * @tc.name      testNumericOperatorContexts0083
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x != new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) != x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8400
     * @tc.name      testNumericOperatorContexts0084
     * @tc.desc      Widening numeric operands to the largest type with bigint and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: bigint = 1n;
      let y: int = 1;
      expect(x !== new BigInt(y)).assertEqual(false);
      expect(new BigInt(y) !== x).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8500
     * @tc.name      testNumericOperatorContexts0085
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8600
     * @tc.name      testNumericOperatorContexts0086
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8700
     * @tc.name      testNumericOperatorContexts0087
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8800
     * @tc.name      testNumericOperatorContexts0088
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_8900
     * @tc.name      testNumericOperatorContexts0089
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9000
     * @tc.name      testNumericOperatorContexts0090
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9100
     * @tc.name      testNumericOperatorContexts0091
     * @tc.desc      Widening numeric operands to the largest type with byte and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: float = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9200
     * @tc.name      testNumericOperatorContexts0092
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9300
     * @tc.name      testNumericOperatorContexts0093
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9400
     * @tc.name      testNumericOperatorContexts0094
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9500
     * @tc.name      testNumericOperatorContexts0095
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9600
     * @tc.name      testNumericOperatorContexts0096
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9700
     * @tc.name      testNumericOperatorContexts0097
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9800
     * @tc.name      testNumericOperatorContexts0098
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_9900
     * @tc.name      testNumericOperatorContexts0099
     * @tc.desc      Widening numeric operands to the largest type with byte and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: double = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10000
     * @tc.name      testNumericOperatorContexts0100
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10100
     * @tc.name      testNumericOperatorContexts0101
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10200
     * @tc.name      testNumericOperatorContexts0102
     * @tc.desc      Widening numeric operands to the largest type with byte and byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: byte = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10300
     * @tc.name      testNumericOperatorContexts0103
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10400
     * @tc.name      testNumericOperatorContexts0104
     * @tc.desc      Widening numeric operands to the largest type with byte and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = 1;
      let y: short = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    // ----------------- conversions_double 系列 (共8个用例) -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10500
     * @tc.name      testNumericOperatorContexts0105
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10600
     * @tc.name      testNumericOperatorContexts0106
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10700
     * @tc.name      testNumericOperatorContexts0107
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10800
     * @tc.name      testNumericOperatorContexts0108
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_10900
     * @tc.name      testNumericOperatorContexts0109
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11000
     * @tc.name      testNumericOperatorContexts0110
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11100
     * @tc.name      testNumericOperatorContexts0111
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11200
     * @tc.name      testNumericOperatorContexts0112
     * @tc.desc      Widening numeric operands to the largest type with double and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: double = 1;
      let y: double = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    // ----------------- conversions_float 系列 (共16个用例) -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11300
     * @tc.name      testNumericOperatorContexts0113
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11400
     * @tc.name      testNumericOperatorContexts0114
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11500
     * @tc.name      testNumericOperatorContexts0115
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11600
     * @tc.name      testNumericOperatorContexts0116
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11700
     * @tc.name      testNumericOperatorContexts0117
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0117", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11800
     * @tc.name      testNumericOperatorContexts0118
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_11900
     * @tc.name      testNumericOperatorContexts0119
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12000
     * @tc.name      testNumericOperatorContexts0120
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12100
     * @tc.name      testNumericOperatorContexts0121
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12200
     * @tc.name      testNumericOperatorContexts0122
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12300
     * @tc.name      testNumericOperatorContexts0123
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12400
     * @tc.name      testNumericOperatorContexts0124
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12500
     * @tc.name      testNumericOperatorContexts0125
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12600
     * @tc.name      testNumericOperatorContexts0126
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12700
     * @tc.name      testNumericOperatorContexts0127
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12800
     * @tc.name      testNumericOperatorContexts0128
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    // ----------------- conversions_int 系列 (共32个用例) -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_12900
     * @tc.name      testNumericOperatorContexts0129
     * @tc.desc      Widening numeric operands to the largest type with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13000
     * @tc.name      testNumericOperatorContexts0130
     * @tc.desc      Widening numeric operands to the largest type with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13100
     * @tc.name      testNumericOperatorContexts0131
     * @tc.desc      Widening numeric operands to the largest type with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: long = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13200
     * @tc.name      testNumericOperatorContexts0132
     * @tc.desc      Widening numeric operands to the largest type with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: long = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13300
     * @tc.name      testNumericOperatorContexts0133
     * @tc.desc      Widening numeric operands to the largest type with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: long = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13400
     * @tc.name      testNumericOperatorContexts0134
     * @tc.desc      Widening numeric operands to the largest type with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13500
     * @tc.name      testNumericOperatorContexts0135
     * @tc.desc      Widening numeric operands to the largest type with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13600
     * @tc.name      testNumericOperatorContexts0136
     * @tc.desc      Widening numeric operands to the largest type with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: long = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13700
     * @tc.name      testNumericOperatorContexts0137
     * @tc.desc      Widening numeric operands to the largest type with int and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: float = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13800
     * @tc.name      testNumericOperatorContexts0138
     * @tc.desc      Widening numeric operands to the largest type with int and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: float = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_13900
     * @tc.name      testNumericOperatorContexts0139
     * @tc.desc      Widening numeric operands to the largest type with int and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: float = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14000
     * @tc.name      testNumericOperatorContexts0140
     * @tc.desc      Widening numeric operands to the largest type with int and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: float = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14100
     * @tc.name      testNumericOperatorContexts0141
     * @tc.desc      Widening numeric operands to the largest type with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14200
     * @tc.name      testNumericOperatorContexts0142
     * @tc.desc      Widening numeric operands to the largest type with int and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: float = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14300
     * @tc.name      testNumericOperatorContexts0143
     * @tc.desc      Widening numeric operands to the largest type with int and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14400
     * @tc.name      testNumericOperatorContexts0144
     * @tc.desc      Widening numeric operands to the largest type with int and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14500
     * @tc.name      testNumericOperatorContexts0145
     * @tc.desc      Widening numeric operands to the largest type with int and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: float = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14600
     * @tc.name      testNumericOperatorContexts0146
     * @tc.desc      Widening numeric operands to the largest type with int and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: double = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14700
     * @tc.name      testNumericOperatorContexts0147
     * @tc.desc      Widening numeric operands to the largest type with int and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: double = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14800
     * @tc.name      testNumericOperatorContexts0148
     * @tc.desc      Widening numeric operands to the largest type with int and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_14900
     * @tc.name      testNumericOperatorContexts0149
     * @tc.desc      Widening numeric operands to the largest type with int and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0149", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15000
     * @tc.name      testNumericOperatorContexts0150
     * @tc.desc      Widening numeric operands to the largest type with int and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0150", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15100
     * @tc.name      testNumericOperatorContexts0151
     * @tc.desc      Widening numeric operands to the largest type with int and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0151", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15200
     * @tc.name      testNumericOperatorContexts0152
     * @tc.desc      Widening numeric operands to the largest type with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0152", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15300
     * @tc.name      testNumericOperatorContexts0153
     * @tc.desc      Widening numeric operands to the largest type with int and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0153", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15400
     * @tc.name      testNumericOperatorContexts0154
     * @tc.desc      Widening numeric operands to the largest type with int and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0154", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: double = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15500
     * @tc.name      testNumericOperatorContexts0155
     * @tc.desc      Widening numeric operands to the largest type with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0155", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15600
     * @tc.name      testNumericOperatorContexts0156
     * @tc.desc      Widening numeric operands to the largest type with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0156", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15700
     * @tc.name      testNumericOperatorContexts0157
     * @tc.desc      Widening numeric operands to the largest type with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0157", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15800
     * @tc.name      testNumericOperatorContexts0158
     * @tc.desc      Widening numeric operands to the largest type with int and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0158", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: int = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_15900
     * @tc.name      testNumericOperatorContexts0159
     * @tc.desc      Widening numeric operands to the largest type with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0159", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: long = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16000
     * @tc.name      testNumericOperatorContexts0160
     * @tc.desc      Widening numeric operands to the largest type with int and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0160", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1;
      let y: long = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    // ----------------- conversions_long 系列 (共32个用例) -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16100
     * @tc.name      testNumericOperatorContexts0161
     * @tc.desc      Widening numeric operands to the largest type with long and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0161", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16200
     * @tc.name      testNumericOperatorContexts0162
     * @tc.desc      Widening numeric operands to the largest type with long and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0162", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16300
     * @tc.name      testNumericOperatorContexts0163
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0163", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16400
     * @tc.name      testNumericOperatorContexts0164
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0164", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16500
     * @tc.name      testNumericOperatorContexts0165
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0165", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16600
     * @tc.name      testNumericOperatorContexts0166
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0166", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16700
     * @tc.name      testNumericOperatorContexts0167
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0167", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16800
     * @tc.name      testNumericOperatorContexts0168
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0168", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_16900
     * @tc.name      testNumericOperatorContexts0169
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0169", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17000
     * @tc.name      testNumericOperatorContexts0170
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0170", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17100
     * @tc.name      testNumericOperatorContexts0171
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0171", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17200
     * @tc.name      testNumericOperatorContexts0172
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0172", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17300
     * @tc.name      testNumericOperatorContexts0173
     * @tc.desc      Widening numeric operands to the largest type with long and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0173", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17400
     * @tc.name      testNumericOperatorContexts0174
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0174", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17500
     * @tc.name      testNumericOperatorContexts0175
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0175", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17600
     * @tc.name      testNumericOperatorContexts0176
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0176", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17700
     * @tc.name      testNumericOperatorContexts0177
     * @tc.desc      Widening numeric operands to the largest type with long and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0177", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: double = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17800
     * @tc.name      testNumericOperatorContexts0178
     * @tc.desc      Widening numeric operands to the largest type with long and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0178", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_17900
     * @tc.name      testNumericOperatorContexts0179
     * @tc.desc      Widening numeric operands to the largest type with long and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0179", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18000
     * @tc.name      testNumericOperatorContexts0180
     * @tc.desc      Widening numeric operands to the largest type with long and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0180", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18100
     * @tc.name      testNumericOperatorContexts0181
     * @tc.desc      Widening numeric operands to the largest type with long and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0181", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18200
     * @tc.name      testNumericOperatorContexts0182
     * @tc.desc      Widening numeric operands to the largest type with long and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0182", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: long = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18300
     * @tc.name      testNumericOperatorContexts0183
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0183", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18400
     * @tc.name      testNumericOperatorContexts0184
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0184", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18500
     * @tc.name      testNumericOperatorContexts0185
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0185", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18600
     * @tc.name      testNumericOperatorContexts0186
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0186", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18700
     * @tc.name      testNumericOperatorContexts0187
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0187", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18800
     * @tc.name      testNumericOperatorContexts0188
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0188", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_18900
     * @tc.name      testNumericOperatorContexts0189
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0189", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19000
     * @tc.name      testNumericOperatorContexts0190
     * @tc.desc      Widening numeric operands to the largest type with long and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0190", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: long = 1;
      let y: float = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    // ----------------- conversions_short 系列 (共40个用例) -----------------
    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19100
     * @tc.name      testNumericOperatorContexts0191
     * @tc.desc      Widening numeric operands to the largest type with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0191", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: short = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19200
     * @tc.name      testNumericOperatorContexts0192
     * @tc.desc      Widening numeric operands to the largest type with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0192", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: short = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19300
     * @tc.name      testNumericOperatorContexts0193
     * @tc.desc      Widening numeric operands to the largest type with short and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0193", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: int = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19400
     * @tc.name      testNumericOperatorContexts0194
     * @tc.desc      Widening numeric operands to the largest type with short and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0194", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: int = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19500
     * @tc.name      testNumericOperatorContexts0195
     * @tc.desc      Widening numeric operands to the largest type with short and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0195", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: int = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19600
     * @tc.name      testNumericOperatorContexts0196
     * @tc.desc      Widening numeric operands to the largest type with short and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0196", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: int = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19700
     * @tc.name      testNumericOperatorContexts0197
     * @tc.desc      Widening numeric operands to the largest type with short and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0197", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: int = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19800
     * @tc.name      testNumericOperatorContexts0198
     * @tc.desc      Widening numeric operands to the largest type with short and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0198", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: int = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_19900
     * @tc.name      testNumericOperatorContexts0199
     * @tc.desc      Widening numeric operands to the largest type with short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0199", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: long = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20000
     * @tc.name      testNumericOperatorContexts0200
     * @tc.desc      Widening numeric operands to the largest type with short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: long = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20100
     * @tc.name      testNumericOperatorContexts0201
     * @tc.desc      Widening numeric operands to the largest type with short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0201", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: long = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20200
     * @tc.name      testNumericOperatorContexts0202
     * @tc.desc      Widening numeric operands to the largest type with short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0202", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: long = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20300
     * @tc.name      testNumericOperatorContexts0203
     * @tc.desc      Widening numeric operands to the largest type with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0203", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: short = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20400
     * @tc.name      testNumericOperatorContexts0204
     * @tc.desc      Widening numeric operands to the largest type with short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0204", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: long = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20500
     * @tc.name      testNumericOperatorContexts0205
     * @tc.desc      Widening numeric operands to the largest type with short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0205", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20600
     * @tc.name      testNumericOperatorContexts0206
     * @tc.desc      Widening numeric operands to the largest type with short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0206", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: long = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20700
     * @tc.name      testNumericOperatorContexts0207
     * @tc.desc      Widening numeric operands to the largest type with short and long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0207", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: long = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20800
     * @tc.name      testNumericOperatorContexts0208
     * @tc.desc      Widening numeric operands to the largest type with short and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0208", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: float = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_20900
     * @tc.name      testNumericOperatorContexts0209
     * @tc.desc      Widening numeric operands to the largest type with short and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0209", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: float = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21000
     * @tc.name      testNumericOperatorContexts0210
     * @tc.desc      Widening numeric operands to the largest type with short and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0210", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: float = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21100
     * @tc.name      testNumericOperatorContexts0211
     * @tc.desc      Widening numeric operands to the largest type with short and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0211", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: float = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21200
     * @tc.name      testNumericOperatorContexts0212
     * @tc.desc      Widening numeric operands to the largest type with short and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0212", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: float = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21300
     * @tc.name      testNumericOperatorContexts0213
     * @tc.desc      Widening numeric operands to the largest type with short and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0213", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21400
     * @tc.name      testNumericOperatorContexts0214
     * @tc.desc      Widening numeric operands to the largest type with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0214", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: short = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21500
     * @tc.name      testNumericOperatorContexts0215
     * @tc.desc      Widening numeric operands to the largest type with short and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0215", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: float = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21600
     * @tc.name      testNumericOperatorContexts0216
     * @tc.desc      Widening numeric operands to the largest type with short and float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0216", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: float = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21700
     * @tc.name      testNumericOperatorContexts0217
     * @tc.desc      Widening numeric operands to the largest type with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0217", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: double = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21800
     * @tc.name      testNumericOperatorContexts0218
     * @tc.desc      Widening numeric operands to the largest type with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0218", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: double = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_21900
     * @tc.name      testNumericOperatorContexts0219
     * @tc.desc      Widening numeric operands to the largest type with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0219", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: double = 1;
      expect((x < y)).assertEqual(false);
      expect((y < x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22000
     * @tc.name      testNumericOperatorContexts0220
     * @tc.desc      Widening numeric operands to the largest type with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0220", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: double = 1;
      expect((x <= y)).assertEqual(true);
      expect((y <= x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22100
     * @tc.name      testNumericOperatorContexts0221
     * @tc.desc      Widening numeric operands to the largest type with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0221", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: double = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22200
     * @tc.name      testNumericOperatorContexts0222
     * @tc.desc      Widening numeric operands to the largest type with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0222", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: double = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22300
     * @tc.name      testNumericOperatorContexts0223
     * @tc.desc      Widening numeric operands to the largest type with short and double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0223", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: double = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22400
     * @tc.name      testNumericOperatorContexts0224
     * @tc.desc      Widening numeric operands to the largest type with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0224", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: short = 1;
      expect((x == y)).assertEqual(true);
      expect((y == x)).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22500
     * @tc.name      testNumericOperatorContexts0225
     * @tc.desc      Widening numeric operands to the largest type with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0225", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: short = 1;
      expect((x != y)).assertEqual(false);
      expect((y != x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22600
     * @tc.name      testNumericOperatorContexts0226
     * @tc.desc      Widening numeric operands to the largest type with short and short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0226", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: short = 1;
      expect((x !== y)).assertEqual(false);
      expect((y !== x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22700
     * @tc.name      testNumericOperatorContexts0227
     * @tc.desc      Widening numeric operands to the largest type with short and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0227", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: int = 1;
      expect((x > y)).assertEqual(false);
      expect((y > x)).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_OPERATOR_CONTEXTS_22800
     * @tc.name      testNumericOperatorContexts0228
     * @tc.desc      Widening numeric operands to the largest type with short and int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericOperatorContexts0228", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = 1;
      let y: int = 1;
      expect((x >= y)).assertEqual(true);
      expect((y >= x)).assertEqual(true);
    });

  });
}