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

async function sleep(time: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
        setTimeout(() => {
            resolve(0);
        }, time);
    });
}

export default function CompoundAssignmentOperatorsTest() {
  describe("CompoundAssignmentOperatorsTest", () => {
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
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0100
     * @tc.name      testCompoundAssignmentOperators0001
     * @tc.desc      Test compound assignment operator += for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 10;
      let b: byte = 20;
      a += b;
      expect(30 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0200
     * @tc.name      testCompoundAssignmentOperators0002
     * @tc.desc      Test compound assignment operator -= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 30;
      let b: byte = 10;
      a -= b;
      expect(20 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0300
     * @tc.name      testCompoundAssignmentOperators0003
     * @tc.desc      Test compound assignment operator *= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 10;
      let b: byte = 20;
      a *= b;
      expect(-56 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0400
     * @tc.name      testCompoundAssignmentOperators0004
     * @tc.desc      Test compound assignment operator /= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 20;
      let b: byte = 10;
      a /= b;
      expect(2 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0500
     * @tc.name      testCompoundAssignmentOperators0005
     * @tc.desc      Test compound assignment operator %= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 20;
      let b: byte = 3;
      a %= b;
      expect(2 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0600
     * @tc.name      testCompoundAssignmentOperators0006
     * @tc.desc      Test compound assignment operator <<= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 1;
      a <<= 3;
      expect(8 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0700
     * @tc.name      testCompoundAssignmentOperators0007
     * @tc.desc      Test compound assignment operator >>= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 8;
      a >>= 3;
      expect(1 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0800
     * @tc.name      testCompoundAssignmentOperators0008
     * @tc.desc      Test compound assignment operator >>>= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = -8;
      a >>>= 3;
      expect(-1 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_0900
     * @tc.name      testCompoundAssignmentOperators0009
     * @tc.desc      Test compound assignment operator &= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0b1111;
      let b: byte = 0b0101;
      a &= b;
      expect(5 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1000
     * @tc.name      testCompoundAssignmentOperators0010
     * @tc.desc      Test compound assignment operator |= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0b0101;
      let b: byte = 0b1010;
      a |= b;
      expect(15 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1100
     * @tc.name      testCompoundAssignmentOperators0011
     * @tc.desc      Test compound assignment operator ^= for byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: byte = 0b1111;
      let b: byte = 0b0101;
      a ^= b;
      expect(10 as byte).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1200
     * @tc.name      testCompoundAssignmentOperators0012
     * @tc.desc      Compound assignment += for byte type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 127; v1 += 1; expect(-128 as byte).assertEqual(v1);
      let v2:byte = -128; v2 += -1; expect(127 as byte).assertEqual(v2);
      let v3:byte = 0; v3 += 127; expect(127 as byte).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1300
     * @tc.name      testCompoundAssignmentOperators0013
     * @tc.desc      Compound assignment += for short type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 32767; v1 += 1; expect(-32768 as short).assertEqual(v1);
      let v2:short = -32768; v2 += -1; expect(32767 as short).assertEqual(v2);
      let v3:short = 0; v3 += 32767; expect(32767 as short).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1400
     * @tc.name      testCompoundAssignmentOperators0014
     * @tc.desc      Compound assignment += for int type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 2147483647; v1 += 1; expect(-2147483648).assertEqual(v1);
      let v2:int = -2147483648; v2 += -1; expect(2147483647).assertEqual(v2);
      let v3:int = 0; v3 += 2147483647; expect(2147483647).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1500
     * @tc.name      testCompoundAssignmentOperators0015
     * @tc.desc      Compound assignment += for long type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 9223372036854775807; v1 += 1; expect(-9223372036854775808).assertEqual(v1);
      let v2:long = -9223372036854775808; v2 += -1; expect(9223372036854775807).assertEqual(v2);
      let v3:long = 0; v3 += 9223372036854775807; expect(9223372036854775807).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1600
     * @tc.name      testCompoundAssignmentOperators0016
     * @tc.desc      Compound assignment += for float type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:float = 3.4028235e38f; v1 += 1.0f; expect(3.4028235e38f).assertEqual(v1);
      let v2:float = -3.4028235e38f; v2 += -1.0f; expect(-3.4028235e38f).assertEqual(v2);
      let v3:float = 0.0f; v3 += 3.4028235e38f; expect(3.4028235e38f).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1700
     * @tc.name      testCompoundAssignmentOperators0017
     * @tc.desc      Compound assignment += for double type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:double = 1.7976931348623157e308; v1 += 1.0; expect(1.7976931348623157e308).assertEqual(v1);
      let v2:double = -1.7976931348623157e308; v2 += -1.0; expect(-1.7976931348623157e308).assertEqual(v2);
      let v3:double = 0.0; v3 += 1.7976931348623157e308; expect(1.7976931348623157e308).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1800
     * @tc.name      testCompoundAssignmentOperators0018
     * @tc.desc      Compound assignment -= for byte type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 127; v1 -= 1; expect(126 as byte).assertEqual(v1);
      let v2:byte = -128; v2 -= 1; expect(127 as byte).assertEqual(v2);
      let v3:byte = 0; v3 -= 127; expect(-127 as byte).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_1900
     * @tc.name      testCompoundAssignmentOperators0019
     * @tc.desc      Compound assignment -= for short type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 32767; v1 -= 1; expect(32766 as short).assertEqual(v1);
      let v2:short = -32768; v2 -= 1; expect(32767 as short).assertEqual(v2);
      let v3:short = 0; v3 -= 32767; expect(-32767 as short).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2000
     * @tc.name      testCompoundAssignmentOperators0020
     * @tc.desc      Compound assignment -= for int type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 2147483647; v1 -= 1; expect(2147483646).assertEqual(v1);
      let v2:int = -2147483648; v2 -= 1; expect(2147483647).assertEqual(v2);
      let v3:int = 0; v3 -= 2147483647; expect(-2147483647).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2100
     * @tc.name      testCompoundAssignmentOperators0021
     * @tc.desc      Compound assignment -= for long type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 9223372036854775807; v1 -= 1; expect(9223372036854775806).assertEqual(v1);
      let v2:long = -9223372036854775808; v2 -= 1; expect(9223372036854775807).assertEqual(v2);
      let v3:long = 0; v3 -= 9223372036854775807; expect(-9223372036854775807).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2200
     * @tc.name      testCompoundAssignmentOperators0022
     * @tc.desc      Compound assignment -= for float type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:float = 3.4028235e38f; v1 -= 1.0f; expect(3.4028235e38f).assertEqual(v1);
      let v2:float = -3.4028235e38f; v2 -= 1.0f; expect(-3.4028235e38f).assertEqual(v2);
      let v3:float = 0.0f; v3 -= 3.4028235e38f; expect(-3.4028235e38f).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2300
     * @tc.name      testCompoundAssignmentOperators0023
     * @tc.desc      Compound assignment -= for double type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:double = 1.7976931348623157e308; v1 -= 1.0; expect(1.7976931348623157e308).assertEqual(v1);
      let v2:double = -1.7976931348623157e308; v2 -= 1.0; expect(-1.7976931348623157e308).assertEqual(v2);
      let v3:double = 0.0; v3 -= 1.7976931348623157e308; expect(-1.7976931348623157e308).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2400
     * @tc.name      testCompoundAssignmentOperators0024
     * @tc.desc      Compound assignment /= for byte type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 127; v1 /= 1; expect(127 as byte).assertEqual(v1);
      let v2:byte = -128; v2 /= -1; expect(-128 as byte).assertEqual(v2);
      let v3:byte = 64; v3 /= 2; expect(32 as byte).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2500
     * @tc.name      testCompoundAssignmentOperators0025
     * @tc.desc      Compound assignment /= for short type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 32767; v1 /= 1; expect(32767 as short).assertEqual(v1);
      let v2:short = -32768; v2 /= -1; expect(-32768 as short).assertEqual(v2);
      let v3:short = 16384; v3 /= 2; expect(8192 as short).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2600
     * @tc.name      testCompoundAssignmentOperators0026
     * @tc.desc      Verify integer overflow behavior of compound assignment /= for int boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 2147483647; v1 /= 1; expect(2147483647).assertEqual(v1);
      let v2:int = -2147483648; v2 /= -1; expect(-2147483648).assertEqual(v2);
      let v3:int = 1073741824; v3 /= 2; expect(536870912).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2700
     * @tc.name      testCompoundAssignmentOperators0027
     * @tc.desc      Verify integer overflow behavior of compound assignment /= for long boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 9223372036854775807; v1 /= 1; expect(9223372036854775807).assertEqual(v1);
      let v2:long = -9223372036854775808; v2 /= -1; expect(-9223372036854775808).assertEqual(v2);
      let v3:long = 4611686018427387904; v3 /= 2; expect(2305843009213693952).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2800
     * @tc.name      testCompoundAssignmentOperators0028
     * @tc.desc      Compound assignment /= for float type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:float = 3.4028235e38f; v1 /= 1.0f; expect(3.4028235e38f).assertEqual(v1);
      let v2:float = -3.4028235e38f; v2 /= -1.0f; expect(3.4028235e38f).assertEqual(v2);
      let v3:float = 2.0f; v3 /= 2.0f; expect(1.0f).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_2900
     * @tc.name      testCompoundAssignmentOperators0029
     * @tc.desc      Compound assignment /= for double type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:double = 1.7976931348623157e308; v1 /= 1.0; expect(1.7976931348623157e308).assertEqual(v1);
      let v2:double = -1.7976931348623157e308; v2 /= -1.0; expect(1.7976931348623157e308).assertEqual(v2);
      let v3:double = 2.0; v3 /= 2.0; expect(1.0).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3000
     * @tc.name      testCompoundAssignmentOperators0030
     * @tc.desc      Compound assignment %= for byte type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 127; v1 %= 64; expect(63 as byte).assertEqual(v1);
      let v2:byte = -128; v2 %= 64; expect(0 as byte).assertEqual(v2);
      let v3:byte = 10; v3 %= 3; expect(1 as byte).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3100
     * @tc.name      testCompoundAssignmentOperators0031
     * @tc.desc      Compound assignment %= for short type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 32767; v1 %= 16384; expect(16383 as short).assertEqual(v1);
      let v2:short = -32768; v2 %= 16384; expect(0 as short).assertEqual(v2);
      let v3:short = 10; v3 %= 3; expect(1 as short).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3200
     * @tc.name      testCompoundAssignmentOperators0032
     * @tc.desc      Compound assignment %= for int type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 2147483647; v1 %= 1073741824; expect(1073741823).assertEqual(v1);
      let v2:int = -2147483648; v2 %= 1073741824; expect(0).assertEqual(v2);
      let v3:int = 10; v3 %= 3; expect(1).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3300
     * @tc.name      testCompoundAssignmentOperators0033
     * @tc.desc      Compound assignment %= for long type boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 9223372036854775807; v1 %= 4611686018427387904; expect(4611686018427387903).assertEqual(v1);
      let v2:long = -9223372036854775808; v2 %= 4611686018427387904; expect(0).assertEqual(v2);
      let v3:long = 10; v3 %= 3; expect(1).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3400
     * @tc.name      testCompoundAssignmentOperators0034
     * @tc.desc      Compound assignment <<= for byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 1; v1 <<= 3; expect(8 as byte).assertEqual(v1);
      let v2:byte = 127; v2 <<= 1; expect(-2 as byte).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3500
     * @tc.name      testCompoundAssignmentOperators0035
     * @tc.desc      Compound assignment <<= for short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 1; v1 <<= 5; expect(32 as short).assertEqual(v1);
      let v2:short = 32767; v2 <<= 1; expect(-2 as short).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3600
     * @tc.name      testCompoundAssignmentOperators0036
     * @tc.desc      Compound assignment <<= for int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 1; v1 <<= 10; expect(1024).assertEqual(v1);
      let v2:int = 2147483647; v2 <<= 1; expect(-2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3700
     * @tc.name      testCompoundAssignmentOperators0037
     * @tc.desc      Compound assignment <<= for long type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 1; v1 <<= 20; expect(1048576).assertEqual(v1);
      let v2:long = 9223372036854775807; v2 <<= 1; expect(-2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3800
     * @tc.name      testCompoundAssignmentOperators0038
     * @tc.desc      Compound assignment >>= for byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 127; v1 >>= 2; expect(31 as byte).assertEqual(v1);
      let v2:byte = -128; v2 >>= 1; expect(-64 as byte).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_3900
     * @tc.name      testCompoundAssignmentOperators0039
     * @tc.desc      Compound assignment >>= for short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 32767; v1 >>= 3; expect(4095 as short).assertEqual(v1);
      let v2:short = -32768; v2 >>= 2; expect(-8192 as short).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4000
     * @tc.name      testCompoundAssignmentOperators0040
     * @tc.desc      Compound assignment >>= for int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 2147483647; v1 >>= 4; expect(134217727).assertEqual(v1);
      let v2:int = -2147483648; v2 >>= 3; expect(-268435456).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4100
     * @tc.name      testCompoundAssignmentOperators0041
     * @tc.desc      Compound assignment >>= for long type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 9223372036854775807; v1 >>= 5; expect(288230376151711743).assertEqual(v1);
      let v2:long = -9223372036854775808; v2 >>= 4; expect(-576460752303423488).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4200
     * @tc.name      testCompoundAssignmentOperators0042
     * @tc.desc      Compound assignment >>>= for byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = -1; v1 >>>= 4; expect(-1 as byte).assertEqual(v1);
      let v2:byte = 127; v2 >>>= 2; expect(31 as byte).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4300
     * @tc.name      testCompoundAssignmentOperators0043
     * @tc.desc      Compound assignment >>>= for short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = -1; v1 >>>= 5; expect(-1 as short).assertEqual(v1);
      let v2:short = 32767; v2 >>>= 3; expect(4095 as short).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4400
     * @tc.name      testCompoundAssignmentOperators0044
     * @tc.desc      Compound assignment >>>= for int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = -1; v1 >>>= 10; expect(4194303).assertEqual(v1);
      let v2:int = 2147483647; v2 >>>= 4; expect(134217727).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4500
     * @tc.name      testCompoundAssignmentOperators0045
     * @tc.desc      Compound assignment >>>= for long type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = -1; v1 >>>= 20; expect(17592186044415).assertEqual(v1);
      let v2:long = 9223372036854775807; v2 >>>= 5; expect(288230376151711743).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4600
     * @tc.name      testCompoundAssignmentOperators0046
     * @tc.desc      Compound assignment &= for byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 0b1111; v1 &= 0b0101; expect(5 as byte).assertEqual(v1);
      let v2:byte = -1; v2 &= 0; expect(0 as byte).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4700
     * @tc.name      testCompoundAssignmentOperators0047
     * @tc.desc      Compound assignment &= for short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 0x7FFF; v1 &= 0x0F0F; expect(0x0F0F as short).assertEqual(v1);
      let v2:short = -1; v2 &= 0; expect(0 as short).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4800
     * @tc.name      testCompoundAssignmentOperators0048
     * @tc.desc      Compound assignment &= for int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 0x7FFFFFFF; v1 &= 0x00FF00FF; expect(0x00FF00FF).assertEqual(v1);
      let v2:int = -1; v2 &= 0; expect(0).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_4900
     * @tc.name      testCompoundAssignmentOperators0049
     * @tc.desc      Compound assignment &= for long type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 0x7FFFFFFFFFFFFFFF; v1 &= 0x0000FFFF0000FFFF; expect(0x0000FFFF0000FFFF).assertEqual(v1);
      let v2:long = -1; v2 &= 0; expect(0).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5000
     * @tc.name      testCompoundAssignmentOperators0050
     * @tc.desc      Compound assignment |= for byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 0b0000; v1 |= 0b1010; expect(10 as byte).assertEqual(v1);
      let v2:byte = 0; v2 |= -1; expect(-1 as byte).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5100
     * @tc.name      testCompoundAssignmentOperators0051
     * @tc.desc      Compound assignment |= for short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 0x0000; v1 |= 0x0F0F; expect(0x0F0F as short).assertEqual(v1);
      let v2:short = 0; v2 |= -1; expect(-1 as short).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5200
     * @tc.name      testCompoundAssignmentOperators0052
     * @tc.desc      Compound assignment |= for int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 0x00000000; v1 |= 0x00FF00FF; expect(0x00FF00FF).assertEqual(v1);
      let v2:int = 0; v2 |= -1; expect(-1).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5300
     * @tc.name      testCompoundAssignmentOperators0053
     * @tc.desc      Compound assignment |= for long type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 0x0000000000000000; v1 |= 0x0000FFFF0000FFFF; expect(0x0000FFFF0000FFFF).assertEqual(v1);
      let v2:long = 0; v2 |= -1; expect(-1).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5400
     * @tc.name      testCompoundAssignmentOperators0054
     * @tc.desc      Compound assignment ^= for byte type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:byte = 0b1111; v1 ^= 0b0101; expect(10 as byte).assertEqual(v1);
      let v2:byte = -1; v2 ^= -1; expect(0 as byte).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5500
     * @tc.name      testCompoundAssignmentOperators0055
     * @tc.desc      Compound assignment ^= for short type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:short = 0x7FFF; v1 ^= 0x0F0F; expect(0x70F0 as short).assertEqual(v1);
      let v2:short = -1; v2 ^= -1; expect(0 as short).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5600
     * @tc.name      testCompoundAssignmentOperators0056
     * @tc.desc      Compound assignment ^= for int type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:int = 0x7FFFFFFF; v1 ^= 0x00FF00FF; expect(0x7F00FF00).assertEqual(v1);
      let v2:int = -1; v2 ^= -1; expect(0).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5700
     * @tc.name      testCompoundAssignmentOperators0057
     * @tc.desc      Compound assignment ^= for long type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1:long = 0x7FFFFFFFFFFFFFFF; v1 ^= 0x0000FFFF0000FFFF; expect(0x7FFF0000FFFF0000).assertEqual(v1);
      let v2:long = -1; v2 ^= -1; expect(0).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5800
     * @tc.name      testCompoundAssignmentOperators0058
     * @tc.desc      Mixed type compound assignment += long + int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:long = 100; let b:int = 50; a += b; expect(150).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_5900
     * @tc.name      testCompoundAssignmentOperators0059
     * @tc.desc      Mixed type compound assignment -= long + short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:long = 200; let b:short = 30; a -= b; expect(170).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6000
     * @tc.name      testCompoundAssignmentOperators0060
     * @tc.desc      Mixed type compound assignment *= int + byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 10; let b:byte = 8; a *= b; expect(80).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6100
     * @tc.name      testCompoundAssignmentOperators0061
     * @tc.desc      Mixed type compound assignment /= short + byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:short = 100; let b:byte = 5; a /= b; expect(20 as short).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6200
     * @tc.name      testCompoundAssignmentOperators0062
     * @tc.desc      Mixed type compound assignment %= int + short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 100; let b:short = 30; a %= b; expect(10).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6300
     * @tc.name      testCompoundAssignmentOperators0063
     * @tc.desc      Compound assignment with zero values all types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1:byte = 0; b1 += 0; expect(0 as byte).assertEqual(b1);
      let s1:short = 0; s1 *= 0; expect(0 as short).assertEqual(s1);
      let i1:int = 0; i1 -= 0; expect(0).assertEqual(i1);
      let l1:long = 0; l1 /= 1; expect(0).assertEqual(l1);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6400
     * @tc.name      testCompoundAssignmentOperators0064
     * @tc.desc      Float boundary compound assignment +=
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f:float = 1.17549435e-38f; f += 0.0f; expect(1.17549435e-38f).assertEqual(f);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6500
     * @tc.name      testCompoundAssignmentOperators0065
     * @tc.desc      Double boundary compound assignment +=
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let d:double = 2.2250738585072014e-308; d += 0.0; expect(2.2250738585072014e-308).assertEqual(d);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6600
     * @tc.name      testCompoundAssignmentOperators0066
     * @tc.desc      Compound assignment chain operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 10; a += 5; a *= 2; expect(30).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6700
     * @tc.name      testCompoundAssignmentOperators0067
     * @tc.desc      Negative value compound assignment all operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = -10; a += -5; expect(-15).assertEqual(a);
      let b:int = -10; b -= -5; expect(-5).assertEqual(b);
      let c:int = -10; c *= -5; expect(50).assertEqual(c);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6800
     * @tc.name      testCompoundAssignmentOperators0068
     * @tc.desc      Bitwise compound assignment edge cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 0; a |= 0; expect(0).assertEqual(a);
      let b:int = 0; b ^= 0; expect(0).assertEqual(b);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_6900
     * @tc.name      testCompoundAssignmentOperators0069
     * @tc.desc      Shift compound assignment full bit shift
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 1; a <<= 31; expect(-2147483648).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7000
     * @tc.name      testCompoundAssignmentOperators0070
     * @tc.desc      Long type full range compound assignment
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:long = 1; a <<= 63; expect(-9223372036854775808).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7100
     * @tc.name      testCompoundAssignmentOperators0071
     * @tc.desc      All operators combined test byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x:byte = 2; x += 3; x -= 1; x *= 2; x /= 2; expect(4 as byte).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7200
     * @tc.name      testCompoundAssignmentOperators0072
     * @tc.desc      All operators combined test int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x:int = 5; x += 5; x -= 3; x *= 2; x /= 3; expect(4).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7300
     * @tc.name      testCompoundAssignmentOperators0073
     * @tc.desc      Compound assignment implicit cast verification
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x:byte = 127; x += 1; expect(-128 as byte).assertEqual(x);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7400
     * @tc.name      testCompoundAssignmentOperators0074
     * @tc.desc      Final verification all compound operators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a:int = 0;
      a += 1; a -= 1; a *= 1; a /= 1; a %= 1;
      a <<= 1; a >>= 1; a >>>= 1;
      a &= 1; a |= 1; a ^= 1;
      expect(0).assertEqual(a);
    });

    /**
     * @tc.number    SUB_COMPOUND_ASSIGNMENT_OPERATORS_7500
     * @tc.name      testCompoundAssignmentOperators0075
     * @tc.desc      Full coverage compound assignment final test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testCompoundAssignmentOperators0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v_byte:byte = 64; v_byte <<= 1; expect(-128 as byte).assertEqual(v_byte);
      let v_short:short = 16384; v_short <<= 1; expect(-32768 as short).assertEqual(v_short);
      let v_int:int = 1073741824; v_int <<= 1; expect(-2147483648).assertEqual(v_int);
      let v_long:long = 4611686018427387904; v_long <<= 1; expect(-9223372036854775808).assertEqual(v_long);
    });
  })
}