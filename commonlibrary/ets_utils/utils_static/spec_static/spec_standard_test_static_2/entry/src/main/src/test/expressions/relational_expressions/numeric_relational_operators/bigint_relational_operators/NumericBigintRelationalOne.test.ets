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

function getOperand1(): number { return 2; }
function getOperand2(): number { return 1; }
function getOperand3(): number { return 1; }
function getOperand4(): number { return -1; }
function getOperand5(): number { return 2.0; }
function getOperand6(): number { return 2.5; }
function getOperand7(): number { return 2.0; }

export default function NumericBigintRelationalOneTest(): void {
  describe("NumericBigintRelationalOneTest", () => {
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
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0100
     * @tc.name      testNumericBigintRelationalOne0001
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      expect(b < 2.5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0200
     * @tc.name      testNumericBigintRelationalOne0002
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b < 5.9).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0300
     * @tc.name      testNumericBigintRelationalOne0003
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 10n;
      expect(b < 10.5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0400
     * @tc.name      testNumericBigintRelationalOne0004
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 100n;
      expect(b < 100.9).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0500
     * @tc.name      testNumericBigintRelationalOne0005
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0600
     * @tc.name      testNumericBigintRelationalOne0006
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      expect(b >= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0700
     * @tc.name      testNumericBigintRelationalOne0007
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b >= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0800
     * @tc.name      testNumericBigintRelationalOne0008
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 10n;
      expect(b >= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_0900
     * @tc.name      testNumericBigintRelationalOne0009
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 100n;
      expect(b >= 100).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1000
     * @tc.name      testNumericBigintRelationalOne0010
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 0n;
      expect(b <= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1100
     * @tc.name      testNumericBigintRelationalOne0011
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b <= 2).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1200
     * @tc.name      testNumericBigintRelationalOne0012
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 3n;
      expect(b <= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1300
     * @tc.name      testNumericBigintRelationalOne0013
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b <= 5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1400
     * @tc.name      testNumericBigintRelationalOne0014
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 50n;
      expect(b <= 100).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1500
     * @tc.name      testNumericBigintRelationalOne0015
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      expect(b >= 0.5).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1600
     * @tc.name      testNumericBigintRelationalOne0016
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      expect(b >= 1.9).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1700
     * @tc.name      testNumericBigintRelationalOne0017
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      expect(b >= 5.0).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1800
     * @tc.name      testNumericBigintRelationalOne0018
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 10n;
      expect(b >= 5.2).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_1900
     * @tc.name      testNumericBigintRelationalOne0019
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const actual_outcome: boolean = (b < getOperand1());
      expect(actual_outcome).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2000
     * @tc.name      testNumericBigintRelationalOne0020
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const actual_outcome: boolean = (b < getOperand2());
      expect(actual_outcome).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2100
     * @tc.name      testNumericBigintRelationalOne0021
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const actual_outcome: boolean = (b < getOperand3());
      expect(actual_outcome).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2200
     * @tc.name      testNumericBigintRelationalOne0022
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -2n;
      const actual_outcome: boolean = (b < getOperand4());
      expect(actual_outcome).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2300
     * @tc.name      testNumericBigintRelationalOne0023
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const actual_outcome: boolean = (b < getOperand5());
      expect(actual_outcome).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2400
     * @tc.name      testNumericBigintRelationalOne0024
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const actual_outcome: boolean = (b < getOperand6());
      expect(actual_outcome).assertEqual(true);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2500
     * @tc.name      testNumericBigintRelationalOne0025
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const actual_outcome: boolean = (b < getOperand7());
      expect(actual_outcome).assertEqual(false);
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2600
     * @tc.name      testNumericBigintRelationalOne0026
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 2;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2700
     * @tc.name      testNumericBigintRelationalOne0027
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2800
     * @tc.name      testNumericBigintRelationalOne0028
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_2900
     * @tc.name      testNumericBigintRelationalOne0029
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -2n;
      const x_var: number = -1;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3000
     * @tc.name      testNumericBigintRelationalOne0030
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3100
     * @tc.name      testNumericBigintRelationalOne0031
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.5;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3200
     * @tc.name      testNumericBigintRelationalOne0032
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b < x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3300
     * @tc.name      testNumericBigintRelationalOne0033
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3400
     * @tc.name      testNumericBigintRelationalOne0034
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 0n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3500
     * @tc.name      testNumericBigintRelationalOne0035
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3600
     * @tc.name      testNumericBigintRelationalOne0036
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -1n;
      const x_var: number = -2;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3700
     * @tc.name      testNumericBigintRelationalOne0037
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0.5;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3800
     * @tc.name      testNumericBigintRelationalOne0038
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 1.9;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_3900
     * @tc.name      testNumericBigintRelationalOne0039
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      const x_var: number = 5.0;
      const actual_outcome: boolean = (b > x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4000
     * @tc.name      testNumericBigintRelationalOne0040
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4100
     * @tc.name      testNumericBigintRelationalOne0041
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 0n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4200
     * @tc.name      testNumericBigintRelationalOne0042
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4300
     * @tc.name      testNumericBigintRelationalOne0043
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -1n;
      const x_var: number = -2;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4400
     * @tc.name      testNumericBigintRelationalOne0044
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0.5;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4500
     * @tc.name      testNumericBigintRelationalOne0045
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 1.9;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4600
     * @tc.name      testNumericBigintRelationalOne0046
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 5n;
      const x_var: number = 5.0;
      const actual_outcome: boolean = (b >= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4700
     * @tc.name      testNumericBigintRelationalOne0047
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 2;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4800
     * @tc.name      testNumericBigintRelationalOne0048
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == false).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_4900
     * @tc.name      testNumericBigintRelationalOne0049
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_5000
     * @tc.name      testNumericBigintRelationalOne0050
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = -2n;
      const x_var: number = -1;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_5100
     * @tc.name      testNumericBigintRelationalOne0051
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1.1;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_5200
     * @tc.name      testNumericBigintRelationalOne0052
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.5;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_5300
     * @tc.name      testNumericBigintRelationalOne0053
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b <= x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_5400
     * @tc.name      testNumericBigintRelationalOne0054
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 0;
      const actual_outcome: boolean = (b != x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_5500
     * @tc.name      testNumericBigintRelationalOne0055
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 1;
      const actual_outcome: boolean = (b != x_var);
      expect(actual_outcome).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_5600
     * @tc.name      testNumericBigintRelationalOne0056
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 1n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b != x_var);
      expect(actual_outcome == true).assertTrue();
    });

    /**
     * @tc.number    SUB_NUMERIC_BIGINT_RELATIONAL_ONE_5700
     * @tc.name      testNumericBigintRelationalOne0057
     * @tc.desc      Bigint comparison, if type of both operands is bigint.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericBigintRelationalOne0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b: bigint = 2n;
      const x_var: number = 2.0;
      const actual_outcome: boolean = (b != x_var);
      expect(actual_outcome).assertTrue();
    });
  });
}
