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
} from "../../../../../../hypium"

// 8
// 泛型函数定义
function processType_0<T>(input: T): T {
  if (typeof input === "string") {
    return (input as string).toUpperCase() as T;
  }
    return input;
}
function processType_1<T>(input: T): T {
  if (typeof input === "string") {
    return (input + "1") as T;
  }
    return input;
}
function processType_2<T>(input: T): T {
  return input as T;
}
function processType_3<T>(input: T): T {
  return input as T;
}
function processType_4<T>(input: T): T {
  return input as T;
}
function processType_5<T>(input: T): T {
  let output: T = input;
  return output as T;
}
function processType_6<T>(input: T): T {
  let output: T = input;
  return output as T;
}
function processType_7<T>(input: T): T {
  return input as T;
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericDeclarationsFunctionTest() {
  describe("GenericDeclarationsFunctionTest", () => {
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
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0100
     * @tc.name      testGenericDeclarationsFunction0001
     * @tc.desc      Tests that when the generic is of type string, the method converts the string
     *               to uppercase and returns.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_0<string>("hello");
      expect(result).assertEqual("HELLO");
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0200
     * @tc.name      testGenericDeclarationsFunction0002
     * @tc.desc      Tests that when the generic is int of string type, supporting + operation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_1<string>("hello");
      expect(result).assertEqual("hello1");
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0300
     * @tc.name      testGenericDeclarationsFunction0003
     * @tc.desc      Tests that when the generic is int of number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_2<number>(2);
      expect(result).assertEqual(2);
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0400
     * @tc.name      testGenericDeclarationsFunction0004
     * @tc.desc      Tests that when the generic is float of number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_3<number>(2.1f);
      expect(result).assertEqual(2.1f);
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0500
     * @tc.name      testGenericDeclarationsFunction0005
     * @tc.desc      Tests that when the generic is double of number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_4<number>(2.0001);
      expect(result).assertEqual(2.0001);
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0600
     * @tc.name      testGenericDeclarationsFunction0006
     * @tc.desc      Tests that when the generic is of type float.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_5<float>(2.1f);
      expect(result).assertEqual(2.1f);
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0700
     * @tc.name      testGenericDeclarationsFunction0007
     * @tc.desc      Tests that when the generic is of type double.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = processType_6<double>(2.0001);
      expect(result).assertEqual(2.0001);
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_FUNCTIONS_0800
     * @tc.name      testGenericDeclarationsFunction0008
     * @tc.desc      Tests that when the generic is of type Date.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsFunction0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const date1 = new Date('2023-01-01');
      let result = processType_7<Date>(date1);
      expect(result.getTime()).assertEqual(date1.getTime());
    })
  });
}