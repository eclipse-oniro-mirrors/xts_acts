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

// 3
// 接口、类和函数定义
interface Producer_0<T> {
  produce(): T;
}
class FruitProducer_0 implements Producer_0<Fruit_0> {
  produce(): Fruit_0 {
    return new Fruit_0();
  }
}
class AppleProducer_0 extends FruitProducer_0 {
  produce(): Apple_0 {
    return new Apple_0();
  }
}
class Fruit_0 {}
class Apple_0 extends Fruit_0 {}

interface A_1<T> {
  getValue(): T;
}
class C_1 implements A_1<string> {
  getValue(): string {
    return "Hello";
  }
}

interface Consumer_2<T> {
  consume(value: T): object;
}
class A_2 implements Consumer_2<object> {
  consume(value: object): object {
    return value;
  }
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericDeclarationsInOutTest() {
  describe("GenericDeclarationsInOutTest", () => {
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
     * @tc.number    SUB_GENERIC_DECLARATIONS_IN_OUT_0100
     * @tc.name      testGenericDeclarationsInOut0001
     * @tc.desc      Shows the covariant behavior of generics on return types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsInOut0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fruitProducer: Producer_0<Fruit_0> = new AppleProducer_0();
      const fruit: Fruit_0 = fruitProducer.produce();
      expect(fruit instanceof Apple_0).assertTrue();
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_IN_OUT_0200
     * @tc.name      testGenericDeclarationsInOut0002
     * @tc.desc      Show covariance of generic classes in return types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsInOut0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: A_1<string> = new C_1();
      const c: A_1<string> = a;
      expect(c.getValue()).assertEqual("Hello");
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_IN_OUT_0300
     * @tc.name      testGenericDeclarationsInOut0003
     * @tc.desc      Verify the invariability of the'in' keyword.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsInOut0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyConsumer: Consumer_2<object> = new A_2();
      const numberConsumer: Consumer_2<object> = anyConsumer;
      expect(numberConsumer.consume(42)).assertEqual(42);
    })
  });
}