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

export default function NumericBigintRelationalTest(): void {
  describe("NumericBigintRelationalTest", () => {
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
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0100
     * @tc.name      testNumericBigintRelational0001
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [0n, -0n, BigInt(0), BigInt(0.0), BigInt(-0.0), BigInt(-BigInt(0))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0200
     * @tc.name      testNumericBigintRelational0002
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [+1n, BigInt(1), BigInt(1), BigInt(+1.0), BigInt(+1n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0300
     * @tc.name      testNumericBigintRelational0003
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-1n, BigInt(-1), BigInt(-1), BigInt(-1.0), BigInt(-1n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0400
     * @tc.name      testNumericBigintRelational0004
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [2147483647n, BigInt(2147483647), BigInt(BigInt(2147483647))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0500
     * @tc.name      testNumericBigintRelational0005
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [2147483646n, BigInt(2147483646), BigInt(BigInt(2147483646))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0600
     * @tc.name      testNumericBigintRelational0006
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [2147483645n, BigInt(2147483645), BigInt(BigInt(2147483645))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0700
     * @tc.name      testNumericBigintRelational0007
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-2147483648n, BigInt(-2147483648), BigInt(BigInt(-2147483648))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0800
     * @tc.name      testNumericBigintRelational0008
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-2147483647n, BigInt(-2147483647), BigInt(BigInt(-2147483647))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_0900
     * @tc.name      testNumericBigintRelational0009
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-2147483646n, BigInt(-2147483646), BigInt(BigInt(-2147483646))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1000
     * @tc.name      testNumericBigintRelational0010
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MAX_VALUE = 9223372036854775807n;
      const ba: bigint[] = [Long_MAX_VALUE, BigInt(Long_MAX_VALUE), BigInt(BigInt(Long_MAX_VALUE))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1100
     * @tc.name      testNumericBigintRelational0011
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MAX_VALUE = 9223372036854775807n;
      const ba: bigint[] = [Long_MAX_VALUE - 1n, BigInt(Long_MAX_VALUE - 1n), BigInt(BigInt(Long_MAX_VALUE - 1n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1200
     * @tc.name      testNumericBigintRelational0012
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MIN_VALUE = -9223372036854775808n;
      const ba: bigint[] = [Long_MIN_VALUE, BigInt(Long_MIN_VALUE), BigInt(BigInt(Long_MIN_VALUE))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1300
     * @tc.name      testNumericBigintRelational0013
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MIN_VALUE = -9223372036854775808n;
      const ba: bigint[] = [Long_MIN_VALUE + 1n, BigInt(Long_MIN_VALUE + 1n), BigInt(BigInt(Long_MIN_VALUE + 1n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1400
     * @tc.name      testNumericBigintRelational0014
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [16777215n, BigInt(16777215.0), BigInt(BigInt(16777215.0)), BigInt(16777215)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1500
     * @tc.name      testNumericBigintRelational0015
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-16777215n, BigInt(-167772.15e2), BigInt(BigInt(-16777.215e3)), BigInt(-16777215)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1600
     * @tc.name      testNumericBigintRelational0016
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [9007199254740991n, BigInt(9007199254.740991e6), BigInt(9007199254740991n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1700
     * @tc.name      testNumericBigintRelational0017
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [9007199254740990n, BigInt(BigInt(9007199254740990.0)), BigInt(9007199254740990n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1800
     * @tc.name      testNumericBigintRelational0018
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-9007199254740991n, BigInt(BigInt(-900719925474.0991e4)), BigInt(-9007199254740991n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_1900
     * @tc.name      testNumericBigintRelational0019
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-9007199254740989n, BigInt(-0.9007199254740989e16), BigInt(-9007199254740989n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2000
     * @tc.name      testNumericBigintRelational0020
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [94876543875610289630186594876592837465n, BigInt(94876543875610289630186594876592837465n), BigInt(BigInt(94876543875610289630186594876592837465n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2100
     * @tc.name      testNumericBigintRelational0021
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-10101010101010101010101n, BigInt(-10101010101010101010101n), BigInt(-BigInt(10101010101010101010101n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a >= b).assertTrue();
          expect(b >= a).assertTrue();
          expect(a - 1n >= b).assertFalse();
          expect(b - 1n >= a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2200
     * @tc.name      testNumericBigintRelational0022
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [0n, -0n, BigInt(0), BigInt(0.0), BigInt(-0.0), BigInt(-BigInt(0))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2300
     * @tc.name      testNumericBigintRelational0023
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [0n, -0n, BigInt(0), BigInt(0.0), BigInt(-0.0), BigInt(-BigInt(0))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2400
     * @tc.name      testNumericBigintRelational0024
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [0n, -0n, BigInt(0), BigInt(0.0), BigInt(-0.0), BigInt(-BigInt(0))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2500
     * @tc.name      testNumericBigintRelational0025
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [+1n, BigInt(1), BigInt(1), BigInt(+1.0), BigInt(+1n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2600
     * @tc.name      testNumericBigintRelational0026
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [+1n, BigInt(1), BigInt(1), BigInt(+1.0), BigInt(+1n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2700
     * @tc.name      testNumericBigintRelational0027
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [+1n, BigInt(1), BigInt(1), BigInt(+1.0), BigInt(+1n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2800
     * @tc.name      testNumericBigintRelational0028
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-1n, BigInt(-1), BigInt(-1), BigInt(-1.0), BigInt(-1n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_2900
     * @tc.name      testNumericBigintRelational0029
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-1n, BigInt(-1), BigInt(-1), BigInt(-1.0), BigInt(-1n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3000
     * @tc.name      testNumericBigintRelational0030
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-1n, BigInt(-1), BigInt(-1), BigInt(-1.0), BigInt(-1n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3100
     * @tc.name      testNumericBigintRelational0031
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [2147483647n, BigInt(2147483647), BigInt(BigInt(2147483647))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3200
     * @tc.name      testNumericBigintRelational0032
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [2147483647n, BigInt(2147483647), BigInt(BigInt(2147483647))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3300
     * @tc.name      testNumericBigintRelational0033
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [2147483647n, BigInt(2147483647), BigInt(BigInt(2147483647))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3400
     * @tc.name      testNumericBigintRelational0034
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-2147483648n, BigInt(-2147483648), BigInt(BigInt(-2147483648))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3500
     * @tc.name      testNumericBigintRelational0035
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-2147483648n, BigInt(-2147483648), BigInt(BigInt(-2147483648))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3600
     * @tc.name      testNumericBigintRelational0036
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-2147483648n, BigInt(-2147483648), BigInt(BigInt(-2147483648))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3700
     * @tc.name      testNumericBigintRelational0037
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MAX_VALUE = 9223372036854775807n;
      const ba: bigint[] = [Long_MAX_VALUE, BigInt(Long_MAX_VALUE), BigInt(BigInt(Long_MAX_VALUE))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3800
     * @tc.name      testNumericBigintRelational0038
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MAX_VALUE = 9223372036854775807n;
      const ba: bigint[] = [Long_MAX_VALUE, BigInt(Long_MAX_VALUE), BigInt(BigInt(Long_MAX_VALUE))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_3900
     * @tc.name      testNumericBigintRelational0039
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MAX_VALUE = 9223372036854775807n;
      const ba: bigint[] = [Long_MAX_VALUE, BigInt(Long_MAX_VALUE), BigInt(BigInt(Long_MAX_VALUE))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4000
     * @tc.name      testNumericBigintRelational0040
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MIN_VALUE = -9223372036854775808n;
      const ba: bigint[] = [Long_MIN_VALUE, BigInt(Long_MIN_VALUE), BigInt(BigInt(Long_MIN_VALUE))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4100
     * @tc.name      testNumericBigintRelational0041
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MIN_VALUE = -9223372036854775808n;
      const ba: bigint[] = [Long_MIN_VALUE, BigInt(Long_MIN_VALUE), BigInt(BigInt(Long_MIN_VALUE))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4200
     * @tc.name      testNumericBigintRelational0042
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const Long_MIN_VALUE = -9223372036854775808n;
      const ba: bigint[] = [Long_MIN_VALUE, BigInt(Long_MIN_VALUE), BigInt(BigInt(Long_MIN_VALUE))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4300
     * @tc.name      testNumericBigintRelational0043
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [9007199254740991n, BigInt(9007199254.740991e6), BigInt(9007199254740991n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4400
     * @tc.name      testNumericBigintRelational0044
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [9007199254740991n, BigInt(9007199254.740991e6), BigInt(9007199254740991n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4500
     * @tc.name      testNumericBigintRelational0045
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [9007199254740991n, BigInt(9007199254.740991e6), BigInt(9007199254740991n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4600
     * @tc.name      testNumericBigintRelational0046
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-9007199254740991n, BigInt(BigInt(-900719925474.0991e4)), BigInt(-9007199254740991n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4700
     * @tc.name      testNumericBigintRelational0047
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-9007199254740991n, BigInt(BigInt(-900719925474.0991e4)), BigInt(-9007199254740991n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4800
     * @tc.name      testNumericBigintRelational0048
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-9007199254740991n, BigInt(BigInt(-900719925474.0991e4)), BigInt(-9007199254740991n)];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_4900
     * @tc.name      testNumericBigintRelational0049
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [94876543875610289630186594876592837465n, BigInt(94876543875610289630186594876592837465n), BigInt(BigInt(94876543875610289630186594876592837465n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5000
     * @tc.name      testNumericBigintRelational0050
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [94876543875610289630186594876592837465n, BigInt(94876543875610289630186594876592837465n), BigInt(BigInt(94876543875610289630186594876592837465n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5100
     * @tc.name      testNumericBigintRelational0051
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [94876543875610289630186594876592837465n, BigInt(94876543875610289630186594876592837465n), BigInt(BigInt(94876543875610289630186594876592837465n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5200
     * @tc.name      testNumericBigintRelational0052
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-10101010101010101010101n, BigInt(-10101010101010101010101n), BigInt(-BigInt(10101010101010101010101n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a > b).assertFalse();
          expect(b > a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5300
     * @tc.name      testNumericBigintRelational0053
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-10101010101010101010101n, BigInt(-10101010101010101010101n), BigInt(-BigInt(10101010101010101010101n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a < b).assertFalse();
          expect(b < a).assertFalse();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5400
     * @tc.name      testNumericBigintRelational0054
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ba: bigint[] = [-10101010101010101010101n, BigInt(-10101010101010101010101n), BigInt(-BigInt(10101010101010101010101n))];
      for (let i = 0; i < ba.length; i++) {
        for (let j = 0; j < ba.length; j++) {
          if (i >= j) continue;
          const a = ba[i];
          const b = ba[j];
          expect(a <= b).assertTrue();
          expect(b <= a).assertTrue();
        }
      }
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5500
     * @tc.name      testNumericBigintRelational0055
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 0n;
      expect(a > b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5600
     * @tc.name      testNumericBigintRelational0056
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 0n;
      const b = 1n;
      expect(a > b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5700
     * @tc.name      testNumericBigintRelational0057
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 1n;
      expect(a > b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5800
     * @tc.name      testNumericBigintRelational0058
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = -1n;
      const b = -2n;
      expect(a > b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_5900
     * @tc.name      testNumericBigintRelational0059
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 2n;
      expect(a < b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6000
     * @tc.name      testNumericBigintRelational0060
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 2n;
      const b = 1n;
      expect(a < b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6100
     * @tc.name      testNumericBigintRelational0061
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 1n;
      expect(a < b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6200
     * @tc.name      testNumericBigintRelational0062
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = -2n;
      const b = -1n;
      expect(a < b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6300
     * @tc.name      testNumericBigintRelational0063
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 0n;
      expect(a >= b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6400
     * @tc.name      testNumericBigintRelational0064
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 0n;
      const b = 1n;
      expect(a >= b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6500
     * @tc.name      testNumericBigintRelational0065
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 1n;
      expect(a >= b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6600
     * @tc.name      testNumericBigintRelational0066
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = -1n;
      const b = -2n;
      expect(a >= b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6700
     * @tc.name      testNumericBigintRelational0067
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 2n;
      expect(a <= b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6800
     * @tc.name      testNumericBigintRelational0068
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 2n;
      const b = 1n;
      expect(a <= b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_6900
     * @tc.name      testNumericBigintRelational0069
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 1n;
      expect(a <= b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7000
     * @tc.name      testNumericBigintRelational0070
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = -2n;
      const b = -1n;
      expect(a <= b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7100
     * @tc.name      testNumericBigintRelational0071
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 0n;
      const b = -0n;
      expect(a == b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7200
     * @tc.name      testNumericBigintRelational0072
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 0n;
      const b = 1n;
      expect(a == b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7300
     * @tc.name      testNumericBigintRelational0073
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 0n;
      expect(a == b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7400
     * @tc.name      testNumericBigintRelational0074
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = -1n;
      const b = -1n;
      expect(a == b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7500
     * @tc.name      testNumericBigintRelational0075
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 0n;
      const b = -0n;
      expect(a != b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7600
     * @tc.name      testNumericBigintRelational0076
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 0n;
      const b = 1n;
      expect(a != b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7700
     * @tc.name      testNumericBigintRelational0077
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 1n;
      const b = 0n;
      expect(a != b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7800
     * @tc.name      testNumericBigintRelational0078
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = -1n;
      const b = -1n;
      expect(a != b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_7900
     * @tc.name      testNumericBigintRelational0079
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 9223372036854775807n;
      const b = -9223372036854775808n;
      expect(a > b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8000
     * @tc.name      testNumericBigintRelational0080
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = -9223372036854775808n;
      const b = 9223372036854775807n;
      expect(a < b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8100
     * @tc.name      testNumericBigintRelational0081
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 9223372036854775807n;
      const b = -9223372036854775808n;
      expect(a >= b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8200
     * @tc.name      testNumericBigintRelational0082
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = -9223372036854775808n;
      const b = 9223372036854775807n;
      expect(a <= b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8300
     * @tc.name      testNumericBigintRelational0083
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 9223372036854775807n;
      const b = -9223372036854775808n;
      expect(a == b).assertFalse();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8400
     * @tc.name      testNumericBigintRelational0084
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = 9223372036854775807n;
      const b = -9223372036854775808n;
      expect(a != b).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8500
     * @tc.name      testNumericBigintRelational0085
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8600
     * @tc.name      testNumericBigintRelational0086
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      expect(b > 1).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8700
     * @tc.name      testNumericBigintRelational0087
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b > 3).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8800
     * @tc.name      testNumericBigintRelational0088
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 10n;
      expect(b > 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_8900
     * @tc.name      testNumericBigintRelational0089
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 100n;
      expect(b > 50).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9000
     * @tc.name      testNumericBigintRelational0090
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 0n;
      expect(b < 1).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9100
     * @tc.name      testNumericBigintRelational0091
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b < 2).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9200
     * @tc.name      testNumericBigintRelational0092
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 3n;
      expect(b < 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9300
     * @tc.name      testNumericBigintRelational0093
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b < 10).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9400
     * @tc.name      testNumericBigintRelational0094
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 50n;
      expect(b < 100).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9500
     * @tc.name      testNumericBigintRelational0095
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b > 0.5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9600
     * @tc.name      testNumericBigintRelational0096
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      expect(b > 1.9).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9700
     * @tc.name      testNumericBigintRelational0097
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b > 3.7).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9800
     * @tc.name      testNumericBigintRelational0098
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 10n;
      expect(b > 5.2).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_9900
     * @tc.name      testNumericBigintRelational0099
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelational0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b < 1.1).assertTrue();
    });

  });
}