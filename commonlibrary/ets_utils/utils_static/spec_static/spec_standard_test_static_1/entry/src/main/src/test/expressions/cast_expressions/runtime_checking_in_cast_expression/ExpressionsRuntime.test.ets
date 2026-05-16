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

export default function ExpressionsRuntimeTest() {
  describe("ExpressionsRuntimeTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0100
     * @tc.name      testExpressionsRuntime0001
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new A1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0200
     * @tc.name      testExpressionsRuntime0002
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new A1();
      let errorCaught = false;
      try {
        let x: B1 = v as B1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0300
     * @tc.name      testExpressionsRuntime0003
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new A1();
      let x: I1 = v as I1;
      expect(x instanceof I1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0400
     * @tc.name      testExpressionsRuntime0004
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new A1();
      let errorCaught = false;
      try {
        let x: J1 = v as J1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0500
     * @tc.name      testExpressionsRuntime0005
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new A1();
      let errorCaught = false;
      try {
        let x: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0600
     * @tc.name      testExpressionsRuntime0006
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new A1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0700
     * @tc.name      testExpressionsRuntime0007
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new A1();
      let errorCaught = false;
      try {
        let x: B1 = v as B1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0800
     * @tc.name      testExpressionsRuntime0008
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new A1();
      let x: I1 = v as I1;
      expect(x instanceof I1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_0900
     * @tc.name      testExpressionsRuntime0009
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new A1();
      let errorCaught = false;
      try {
        let x: J1 = v as J1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1000
     * @tc.name      testExpressionsRuntime0010
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: Object = new A1();
      let errorCaught = false;
      try {
        let x: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1100
     * @tc.name      testExpressionsRuntime0011
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new A1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1200
     * @tc.name      testExpressionsRuntime0012
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new A1();
      let errorCaught = false;
      try {
        let x: B1 = v as B1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1300
     * @tc.name      testExpressionsRuntime0013
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new A1();
      let x: I1 = v as I1;
      expect(x instanceof I1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1400
     * @tc.name      testExpressionsRuntime0014
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new A1();
      let errorCaught = false;
      try {
        let x: J1 = v as J1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1500
     * @tc.name      testExpressionsRuntime0015
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new A1();
      let errorCaught = false;
      try {
        let x: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1600
     * @tc.name      testExpressionsRuntime0016
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B1 = new B1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1700
     * @tc.name      testExpressionsRuntime0017
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B1 = new B1();
      let x: B1 = v as B1;
      expect(x instanceof B1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1800
     * @tc.name      testExpressionsRuntime0018
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B1 = new B1();
      let x: I1 = v as I1;
      expect(x instanceof I1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_1900
     * @tc.name      testExpressionsRuntime0019
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B1 = new B1();
      let x: J1 = v as J1;
      expect(x instanceof J1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2000
     * @tc.name      testExpressionsRuntime0020
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: B1 = new B1();
      let errorCaught = false;
      try {
        let x: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2100
     * @tc.name      testExpressionsRuntime0021
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new B1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2200
     * @tc.name      testExpressionsRuntime0022
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new B1();
      let x: B1 = v as B1;
      expect(x instanceof B1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2300
     * @tc.name      testExpressionsRuntime0023
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new B1();
      let x: I1 = v as I1;
      expect(x instanceof I1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2400
     * @tc.name      testExpressionsRuntime0024
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new B1();
      let x: J1 = v as J1;
      expect(x instanceof J1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2500
     * @tc.name      testExpressionsRuntime0025
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: A1 = new B1();
      let errorCaught = false;
      try {
        let x: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2600
     * @tc.name      testExpressionsRuntime0026
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new B1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2700
     * @tc.name      testExpressionsRuntime0027
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new B1();
      let x: B1 = v as B1;
      expect(x instanceof B1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2800
     * @tc.name      testExpressionsRuntime0028
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new B1();
      let x: I1 = v as I1;
      expect(x instanceof I1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_2900
     * @tc.name      testExpressionsRuntime0029
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new B1();
      let x: J1 = v as J1;
      expect(x instanceof J1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_3000
     * @tc.name      testExpressionsRuntime0030
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: I1 = new B1();
      let errorCaught = false;
      try {
        let x: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_3100
     * @tc.name      testExpressionsRuntime0031
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: J1 = new B1();
      let x: A1 = v as A1;
      expect(x instanceof A1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_3200
     * @tc.name      testExpressionsRuntime0032
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: J1 = new B1();
      let x: B1 = v as B1;
      expect(x instanceof B1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_3300
     * @tc.name      testExpressionsRuntime0033
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: J1 = new B1();
      let x: I1 = v as I1;
      expect(x instanceof I1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_3400
     * @tc.name      testExpressionsRuntime0034
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: J1 = new B1();
      let x: J1 = v as J1;
      expect(x instanceof J1).assertTrue();
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_RUNTIME_TEST_3500
     * @tc.name      testExpressionsRuntime0035
     * @tc.desc      The result of an as expression is the result of the evaluated expr if the actual
     *               type of expr is a subtype of target (see Subtyping). Otherwise, ClassCastError is
     *               thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsRuntime0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: J1 = new B1();
      let errorCaught = false;
      try {
        let x: K1 = v as K1;
      } catch (e) {
        errorCaught = true;
        expect(e instanceof ClassCastError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

  });
}