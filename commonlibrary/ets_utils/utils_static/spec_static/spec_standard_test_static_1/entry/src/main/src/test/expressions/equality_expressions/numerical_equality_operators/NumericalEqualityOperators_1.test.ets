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

export default function NumericalEqualityOperatorsOneTest() {
  describe("NumericalEqualityOperatorsOneTest", () => {
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
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0100
     * @tc.name      testNumericalEqualityOperatorsOne0001
     * @tc.desc      Integer and double infinity equality params: Double.POSITIVE_INFINITY === 0.3 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = 0.3
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0200
     * @tc.name      testNumericalEqualityOperatorsOne0002
     * @tc.desc      Integer and double infinity equality params: Double.NEGATIVE_INFINITY !== 0.3 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = 0.3
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0300
     * @tc.name      testNumericalEqualityOperatorsOne0003
     * @tc.desc      Integer and double infinity equality params: Double.NEGATIVE_INFINITY === 0.3 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = 0.3
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0400
     * @tc.name      testNumericalEqualityOperatorsOne0004
     * @tc.desc      Integer and double infinity equality params: 0.3 !== Double.NEGATIVE_INFINITY is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.3
      let right = Double.NEGATIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0500
     * @tc.name      testNumericalEqualityOperatorsOne0005
     * @tc.desc      Integer and double infinity equality params: 0.3 === Double.NEGATIVE_INFINITY is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.3
      let right = Double.NEGATIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0600
     * @tc.name      testNumericalEqualityOperatorsOne0006
     * @tc.desc      Integer and double infinity equality params: Double.NEGATIVE_INFINITY == Double.NEGATIVE_INFINITY is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = Double.NEGATIVE_INFINITY
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0700
     * @tc.name      testNumericalEqualityOperatorsOne0007
     * @tc.desc      Integer and double infinity equality params: Double.NEGATIVE_INFINITY != Double.NEGATIVE_INFINITY is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = Double.NEGATIVE_INFINITY
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0800
     * @tc.name      testNumericalEqualityOperatorsOne0008
     * @tc.desc      Integer and double infinity equality params: Double.POSITIVE_INFINITY == Double.POSITIVE_INFINITY is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = Double.POSITIVE_INFINITY
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_0900
     * @tc.name      testNumericalEqualityOperatorsOne0009
     * @tc.desc      Integer and double infinity equality params: Double.POSITIVE_INFINITY != Double.POSITIVE_INFINITY is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = Double.POSITIVE_INFINITY
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1000
     * @tc.name      testNumericalEqualityOperatorsOne0010
     * @tc.desc      Integer and double infinity equality params: Double.NEGATIVE_INFINITY == Double.POSITIVE_INFINITY is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = Double.POSITIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1100
     * @tc.name      testNumericalEqualityOperatorsOne0011
     * @tc.desc      Integer and double infinity equality params: Double.POSITIVE_INFINITY != Double.NEGATIVE_INFINITY is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = Double.NEGATIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1200
     * @tc.name      testNumericalEqualityOperatorsOne0012
     * @tc.desc      Integer and double infinity equality params: Double.NEGATIVE_INFINITY === Double.NEGATIVE_INFINITY is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = Double.NEGATIVE_INFINITY
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1300
     * @tc.name      testNumericalEqualityOperatorsOne0013
     * @tc.desc      Integer and double infinity equality params: Double.NEGATIVE_INFINITY !== Double.NEGATIVE_INFINITY is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = Double.NEGATIVE_INFINITY
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1400
     * @tc.name      testNumericalEqualityOperatorsOne0014
     * @tc.desc      Integer and double infinity equality params: Double.POSITIVE_INFINITY === Double.POSITIVE_INFINITY is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = Double.POSITIVE_INFINITY
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1500
     * @tc.name      testNumericalEqualityOperatorsOne0015
     * @tc.desc      Integer and double infinity equality params: Double.POSITIVE_INFINITY !== Double.POSITIVE_INFINITY is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = Double.POSITIVE_INFINITY
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1600
     * @tc.name      testNumericalEqualityOperatorsOne0016
     * @tc.desc      Integer and double infinity equality params: Double.NEGATIVE_INFINITY === Double.POSITIVE_INFINITY is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NEGATIVE_INFINITY
      let right = Double.POSITIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1700
     * @tc.name      testNumericalEqualityOperatorsOne0017
     * @tc.desc      Integer and double infinity equality params: Double.POSITIVE_INFINITY !== Double.NEGATIVE_INFINITY is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.POSITIVE_INFINITY
      let right = Double.NEGATIVE_INFINITY
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1800
     * @tc.name      testNumericalEqualityOperatorsOne0018
     * @tc.desc      Integer and double infinity equality params: Double.NaN != Double.NaN is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NaN
      let right = Double.NaN
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_1900
     * @tc.name      testNumericalEqualityOperatorsOne0019
     * @tc.desc      Integer and double infinity equality params: Double.NaN == Double.NaN is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NaN
      let right = Double.NaN
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2000
     * @tc.name      testNumericalEqualityOperatorsOne0020
     * @tc.desc      Integer and double infinity equality params: Double.NaN == 0.1 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NaN
      let right = 0.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2100
     * @tc.name      testNumericalEqualityOperatorsOne0021
     * @tc.desc      Integer and double infinity equality params: Double.NaN != 0.1 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NaN
      let right = 0.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2200
     * @tc.name      testNumericalEqualityOperatorsOne0022
     * @tc.desc      Integer and double infinity equality params: Double.NaN !== Double.NaN is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NaN
      let right = Double.NaN
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2300
     * @tc.name      testNumericalEqualityOperatorsOne0023
     * @tc.desc      Integer and double infinity equality params: Double.NaN === Double.NaN is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NaN
      let right = Double.NaN
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2400
     * @tc.name      testNumericalEqualityOperatorsOne0024
     * @tc.desc      Integer and double infinity equality params: Double.NaN === 0.1 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NaN
      let right = 0.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2500
     * @tc.name      testNumericalEqualityOperatorsOne0025
     * @tc.desc      Integer and double infinity equality params: Double.NaN !== 0.1 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = Double.NaN
      let right = 0.1
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2600
     * @tc.name      testNumericalEqualityOperatorsOne0026
     * @tc.desc      Integer and double infinity equality params: 0.1 != 0.0 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.1
      let right = 0.0
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2700
     * @tc.name      testNumericalEqualityOperatorsOne0027
     * @tc.desc      Integer and double infinity equality params: 0.1 == 0.0 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.1
      let right = 0.0
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2800
     * @tc.name      testNumericalEqualityOperatorsOne0028
     * @tc.desc      Integer and double infinity equality params: +0.0 == -0.0 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = +0.0
      let right = -0.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_2900
     * @tc.name      testNumericalEqualityOperatorsOne0029
     * @tc.desc      Integer and double infinity equality params: -0.0 == +0.0 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = -0.0
      let right = +0.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3000
     * @tc.name      testNumericalEqualityOperatorsOne0030
     * @tc.desc      Integer and double infinity equality params: +0.0 != -0.0 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = +0.0
      let right = -0.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3100
     * @tc.name      testNumericalEqualityOperatorsOne0031
     * @tc.desc      Integer and double infinity equality params: -0.0 != +0.0 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = -0.0
      let right = +0.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3200
     * @tc.name      testNumericalEqualityOperatorsOne0032
     * @tc.desc      Integer and double infinity equality params: 0.1 !== 0.0 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.1
      let right = 0.0
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3300
     * @tc.name      testNumericalEqualityOperatorsOne0033
     * @tc.desc      Integer and double infinity equality params: 0.1 === 0.0 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 0.1
      let right = 0.0
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3400
     * @tc.name      testNumericalEqualityOperatorsOne0034
     * @tc.desc      Integer and double infinity equality params: +0.0 === -0.0 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = +0.0
      let right = -0.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3500
     * @tc.name      testNumericalEqualityOperatorsOne0035
     * @tc.desc      Integer and double infinity equality params: -0.0 === +0.0 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = -0.0
      let right = +0.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3600
     * @tc.name      testNumericalEqualityOperatorsOne0036
     * @tc.desc      Integer and double infinity equality params: +0.0 !== -0.0 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = +0.0
      let right = -0.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3700
     * @tc.name      testNumericalEqualityOperatorsOne0037
     * @tc.desc      Integer and double infinity equality params: -0.0 !== +0.0 is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = -0.0
      let right = +0.0
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3800
     * @tc.name      testNumericalEqualityOperatorsOne0038
     * @tc.desc      Integer and double infinity equality params: new Number(5) === 5 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = new Number(5)
      let right = 5
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_3900
     * @tc.name      testNumericalEqualityOperatorsOne0039
     * @tc.desc      Integer and double infinity equality params: 1 == new Long(1) is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = 1
      let right = new Long(1)
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_4000
     * @tc.name      testNumericalEqualityOperatorsOne0040
     * @tc.desc      Integer and double infinity equality params: new Short(11) == new Long(11) is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = new Short(11)
      let right = new Long(11)
      expect(left).assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_4100
     * @tc.name      testNumericalEqualityOperatorsOne0041
     * @tc.desc      Integer and double infinity equality params: new Double(0.5) !== 0.6 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = new Double(0.5)
      let right = 0.6
      expect(left).not().assertEqual(right);
    })
    /**
     * @tc.number    SUB_NUMERICAL_EQUALITY_OPERATORS_ONE_4200
     * @tc.name      testNumericalEqualityOperatorsOne0042
     * @tc.desc      Integer and double infinity equality params: new Byte(127) + 1 == 128 is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testNumericalEqualityOperatorsOne0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left = new Byte(127) + 1
      let right = 128
      expect(left).assertEqual(right);
    })
  })
}