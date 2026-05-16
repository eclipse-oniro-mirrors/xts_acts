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

function fun1_0(): string {
    return 'ok';
}
function fun2_0(i: int): undefined {
    return undefined;
}
function funGeneric_0<T>(x: T): T {
    return x;
}
function sum_0(a: int, b: int): int {
    return a + b;
}
function fooE_0(): void {}
function fooS_0(x: string): string { return x; }
class TestFR_0 {
    cfoo = fooS_0;
    call(): string {
        return this.cfoo('Test');
    }
    static fr = fooS_0;
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function ExpressionsFunctionReferenceTest(): void {
  describe("ExpressionsFunctionReferenceTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_REFERENCE_0100
     * @tc.name      testExpressionsFunctionReference0001
     * @tc.desc      A function reference refers to a declared or imported function. Type of a function
     *               reference is derived from the function signature
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionReference0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ref1 = fun1_0;
      expect(ref1()).assertEqual('ok');

      let ref2 = fun2_0;
      expect(ref2(1)).assertEqual(undefined);

      let ref3 = sum_0;
      expect(ref3(1, 2)).assertEqual(3);

      let ref4 = ref1;
      expect(ref4()).assertEqual('ok');

      let refGeneric = funGeneric_0<string>; // 泛型函数引用
      expect(refGeneric('yes')).assertEqual('yes');
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_FUNCTION_REFERENCE_0200
     * @tc.name      testExpressionsFunctionReference0002
     * @tc.desc      A function reference refers to a declared or imported function. A compile-time
     *               error occurs if an overload alias is used in a named reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsFunctionReference0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fr0: Function = fooE_0; // 类型为Function
      let fr1 = (() => fooS_0)(); // 返回fooS函数的匿名函数
      fr0(); // 调用fooE
      expect(fr1('Test')).assertEqual('Test');

      let tc = new TestFR_0();
      expect(tc.call()).assertEqual('Test');
      expect(TestFR_0.fr('Test')).assertEqual('Test');
    })
  });
}