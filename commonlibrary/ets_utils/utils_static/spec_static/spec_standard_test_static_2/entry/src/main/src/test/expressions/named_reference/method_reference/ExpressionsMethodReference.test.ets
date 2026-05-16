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

let x_0: string
class Aliases_0 {
    static foo(): string {
        return x_0
    }
}
class Aliases_1<T> {
    foo(par: T): T { return par }
}
class Aliases_2 {
    foo<T>(par: T): T { return par }
}
class C_3 {
    static fooVal: number = 13;
    static foo(): number {
        return C_3.fooVal;
    }
    barVal: number = 42;
    bar(): number {
        return this.barVal;
    }
}
class Aliases_4 {
    field: int
    constructor (val: int) {
        this.field = val
    }
    foo(): int { return this.field }
}
class Aliases_5 {
    field: int
    constructor (val: int) {
        this.field = val
    }
    foo = () => { return this.field }
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsMethodReferenceTest(): void {
  describe("ExpressionsMethodReferenceTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_METHOD_REFERENCE_0100
     * @tc.name      testExpressionsMethodReference0001
     * @tc.desc      A method reference refers to a static or instance method of a class or an interface.
     *               Type of a method reference is derived from the method signature
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodReference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const aRef = Aliases_0.foo
      x_0 = 'One'
      expect(aRef()).assertEqual('One')
      x_0 = 'Two'
      expect(aRef()).assertEqual('Two')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_REFERENCE_0200
     * @tc.name      testExpressionsMethodReference0002
     * @tc.desc      A method reference refers to a static or instance method of a class or an interface.
     *               A compile-time error occurs if a method overload alias is used in a named reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodReference0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let alias: Aliases_1<string> = new Aliases_1<string>()
      let ref = alias.foo
      expect(ref('Test')).assertEqual('Test')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_REFERENCE_0300
     * @tc.name      testExpressionsMethodReference0003
     * @tc.desc      A method reference refers to a static or instance method of a class or an interface.
     *               A compile-time error occurs if a method overload alias is used in a named reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodReference0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let alias: Aliases_2 = new Aliases_2()
      let ref = alias.foo<string> // 泛型方法引用
      expect(ref('Test')).assertEqual('Test')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_METHOD_REFERENCE_0400
     * @tc.name      testExpressionsMethodReference0004
     * @tc.desc      A method reference refers to a static or instance method of a class or an interface.
     *               If method reference refers to an instance method, that the named reference is bounded
     *               with the used instance of that class or interface.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsMethodReference0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Aliases_5 = new Aliases_5(30);
      let ref = a.foo // 箭头函数属性，已自动绑定this
      a = new Aliases_5(100)
      expect(ref()).assertEqual(30) // 仍然返回原始实例的field值
    })
  });
}