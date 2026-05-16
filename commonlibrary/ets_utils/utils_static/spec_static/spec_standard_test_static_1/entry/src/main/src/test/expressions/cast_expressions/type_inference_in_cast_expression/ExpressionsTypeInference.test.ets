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

interface I1 {}
interface J1 {}
interface K1 {}
class A1 implements I1 {}
class B1 extends A1 implements J1 {}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsTypeInferenceTest() {
  describe("ExpressionsTypeInferenceTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0100
     * @tc.name      testExpressionsTypeInference0001
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 as byte
      expect(a instanceof byte).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0200
     * @tc.name      testExpressionsTypeInference0002
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 as short
      expect(a instanceof short).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0300
     * @tc.name      testExpressionsTypeInference0003
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 as int
      expect(a instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0400
     * @tc.name      testExpressionsTypeInference0004
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 as long
      expect(a instanceof long).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0500
     * @tc.name      testExpressionsTypeInference0005
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 as float
      expect(a instanceof float).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0600
     * @tc.name      testExpressionsTypeInference0006
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 as double
      expect(a instanceof double).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0700
     * @tc.name      testExpressionsTypeInference0007
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 as Object
      expect(a instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0800
     * @tc.name      testExpressionsTypeInference0008
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = 1 as Any
      expect(a instanceof Any).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_0900
     * @tc.name      testExpressionsTypeInference0009
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2] as byte[]
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof byte).assertTrue()
      expect(a[1] instanceof byte).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1000
     * @tc.name      testExpressionsTypeInference0010
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2] as short[]
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof short).assertTrue()
      expect(a[1] instanceof short).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1100
     * @tc.name      testExpressionsTypeInference0011
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2] as int[]
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof int).assertTrue()
      expect(a[1] instanceof int).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1200
     * @tc.name      testExpressionsTypeInference0012
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2] as long[]
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof long).assertTrue()
      expect(a[1] instanceof long).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1300
     * @tc.name      testExpressionsTypeInference0013
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2] as float[]
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof float).assertTrue()
      expect(a[1] instanceof float).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1400
     * @tc.name      testExpressionsTypeInference0014
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2] as double[]
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof double).assertTrue()
      expect(a[1] instanceof double).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1500
     * @tc.name      testExpressionsTypeInference0015
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, new Object] as Object[]
      expect(a instanceof Array).assertTrue()
      expect(a[0] instanceof Object).assertTrue()
      expect(a[1] instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1600
     * @tc.name      testExpressionsTypeInference0016
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2, 3, 4] as [byte, short, int, long]
      expect(a instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1700
     * @tc.name      testExpressionsTypeInference0017
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 2] as [float, double]
      expect(a instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1800
     * @tc.name      testExpressionsTypeInference0018
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [c'a', 'ccc'] as [char, string]
      expect(a instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_1900
     * @tc.name      testExpressionsTypeInference0019
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = [1, 'cc', 1] as [double, string, Object]
      expect(a instanceof Object).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_2000
     * @tc.name      testExpressionsTypeInference0020
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = {1: 2} as Record<byte, short>
      expect(a instanceof Record).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_2100
     * @tc.name      testExpressionsTypeInference0021
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1() as A1
      expect(a instanceof A1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_2200
     * @tc.name      testExpressionsTypeInference0022
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new A1() as I1
      expect(a instanceof I1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_2300
     * @tc.name      testExpressionsTypeInference0023
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new B1() as A1
      expect(a instanceof A1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_2400
     * @tc.name      testExpressionsTypeInference0024
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new B1() as B1
      expect(a instanceof B1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_2500
     * @tc.name      testExpressionsTypeInference0025
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new B1() as I1
      expect(a instanceof I1).assertTrue()
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_INFERENCE_2600
     * @tc.name      testExpressionsTypeInference0026
     * @tc.desc      Type inference in cast expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeInference0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = new B1() as J1
      expect(a instanceof J1).assertTrue()
    });
  });
}