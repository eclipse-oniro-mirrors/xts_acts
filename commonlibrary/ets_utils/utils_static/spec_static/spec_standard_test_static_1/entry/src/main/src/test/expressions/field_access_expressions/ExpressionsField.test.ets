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
} from "../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A_access {
  public x: int
}

class A_access_by_super {
  private _x: Int
  final get x(): Int {
    return this._x
  }
}

final class B_access_by_super extends A_access_by_super {
  public bar(): Int {
    return super.x
  }
}

class Base_field_access_to_override {
  id: int = 1
}
class Derive_field_access_to_override extends Base_field_access_to_override {
  id: int = 2
}

class A_lazy_reference_evaluation {
  b: number[] = [1.2345]
}
type NullableA_lazy_reference_evaluation = A_lazy_reference_evaluation | null

class A_safe_field_access_0 {
  public x: Int = 1
}

class A_safe_field_access_1 {
  public x: int
}

final class B_safe_field_access_chain {
  public x: Int = 12345
}

final class A_safe_field_access_chain {
  public bin: TNullableB_safe_field_access_chain = null
  constructor(initB: boolean = false) {
    if(!initB) return
    this.bin = new B_safe_field_access_chain
  }
}
type TNullableB_safe_field_access_chain = B_safe_field_access_chain | null
type TNullableA_safe_field_access_chain = A_safe_field_access_chain | null

export default function ExpressionsFieldTestSuite() {
  describe("ExpressionsFieldTestSuite", () => {
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
     * @tc.number    SUB_EXPRESSIONS_FIELD_TEST_0100
     * @tc.name      testExpressionsField0001
     * @tc.desc      A field access expression may access a field of an object which is referred
     *               to by the value of the object reference.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsField0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_access = new A_access()
      expect(instance.x).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FIELD_TEST_0200
     * @tc.name      testExpressionsField0002
     * @tc.desc      A field access expression may access a field of an object which is referenced
     *               by the value of either an expression or the special keyword super.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsField0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = new B_access_by_super()
      expect(instance.bar()).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FIELD_TEST_0300
     * @tc.name      testExpressionsField0003
     * @tc.desc      Access to field
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsField0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let test = new Derive_field_access_to_override()
      expect(test.id).assertEqual(2)
      expect((test as Base_field_access_to_override).id).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FIELD_TEST_0400
     * @tc.name      testExpressionsField0004
     * @tc.desc      If object reference evaluation completes abruptly, then so does the entire field
     *               access expression.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsField0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = ((returnA: Boolean = true): NullableA_lazy_reference_evaluation => { 
        return returnA ? new A_lazy_reference_evaluation : null 
      })(false)  // Prevent evaluate value of a statically at compile time...

      let rb = a?.b
      let rb0 = a?.b[0]
      expect(rb).assertEqual(undefined)
      expect(rb0).assertEqual(undefined)

      a = ((returnA: Boolean = true): NullableA_lazy_reference_evaluation => { 
        return returnA ? new A_lazy_reference_evaluation : null 
      })()  // Prevent evaluate value of a statically at compile time...

      rb0 = a?.b[0]
      expect(rb0).assertEqual(1.2345)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FIELD_TEST_0500
     * @tc.name      testExpressionsField0005
     * @tc.desc      A field access in which objectReference contains '?.' is called
     *               safe field access because it handles null safely.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsField0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_safe_field_access_0|null = new A_safe_field_access_0()
      let result = ((value: A_safe_field_access_0|null): Int|undefined => { 
        return value?.x 
      })(instance)
      expect(result instanceof Int).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FIELD_TEST_0600
     * @tc.name      testExpressionsField0006
     * @tc.desc      A field access in which objectReference contains '?.' is called
     *               safe field access because it handles null safely. The type of "a?." is never,
     *               because "?." removes null and undefined from the type, only never is remained.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsField0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance: A_safe_field_access_1|null = null
      let result = ((value: A_safe_field_access_1|null): Int|undefined => { 
        return value?.x 
      })(instance)
      expect(result instanceof undefined).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FIELD_TEST_0700
     * @tc.name      testExpressionsField0007
     * @tc.desc      A field access in which objectReference contains '?.' is called
     *               safe field access because it handles null safely.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsField0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testX = new A_safe_field_access_chain()
      let resultX = ((value: A_safe_field_access_chain|null): Int|undefined => { 
        return value?.bin?.x 
      })(testX)
      expect(resultX).assertEqual(undefined)
      
      let testY = new A_safe_field_access_chain(false)
      let resultY = ((value: A_safe_field_access_chain|null): Int|undefined => { 
        return value?.bin?.x 
      })(testY)
      expect(resultY).assertEqual(undefined)
      
      let testZ = new A_safe_field_access_chain(true)
      let resultZ = ((value: A_safe_field_access_chain|null): Int|undefined => { 
        return value?.bin?.x 
      })(testZ)
      expect(resultZ).assertEqual(12345)
    })
  })
}