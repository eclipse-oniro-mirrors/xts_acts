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

// 14
// 泛型基类、子类定义
class Pa_0<T> {
  p(v: T): T {
    return v;
  }
}

class Cl_0 extends Pa_0<string> {
  p(v: string): string {
    return v;
  }
}

class Ng_1 {
  id: number;

  constructor(id: number) {
    this.id = id;
  }

  g(): number {
    return this.id;
  }
}

class Ge_1<T> extends Ng_1 {
  d: T;

  constructor(id: number, d: T) {
    super(id);
    this.d = d;
  }

  getD(): T {
    return this.d;
  }
}

class Base_2<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }
}

class Middle_2<U> extends Base_2<U> {
  constructor(value: U) {
    super(value);
  }
}

class Bottom_2 extends Middle_2<string> {
  constructor(value: string) {
    super(value);
  }

  getValue(): string {
    return super.getValue().toUpperCase();
  }
}

class Root_3 {
  name: string = "root";

  getName(): string {
    return this.name;
  }
}

class Generic1_3<T> extends Root_3 {
  value1: T;

  constructor(value1: T) {
    super();
    this.value1 = value1;
  }
}

class Generic2_3<U, V> extends Generic1_3<U> {
  value2: V;

  constructor(value1: U, value2: V) {
    super(value1);
    this.value2 = value2;
  }

  getName(): string {
    return super.getName().toUpperCase();
  }
}

class GenericParent_4<T> {
  process(value: T): T {
    return value;
  }
}

class ConcreteChild_4 extends GenericParent_4<number> {
  process(value: number): number {
    return value * 2;
  }
}


class Generic_6<T> {
  items: T[] = [];

  add(item: T): void {
    this.items.push(item);
  }

  get(index: int): T {
    return this.items[index];
  }
}

class StringList_6 extends Generic_6<string> {
  constructor() {
    super();
  }

  join(separator: string): string {
    return this.items.join(separator);
  }
}

class GenericParent_7<T> {
  process(value: T): T {
    return value;
  }
}

class GenericChild_7<T> extends GenericParent_7<T> {
  process(value: T): T {
    return value;
  }
}

class Parent_8<T> {
  process(value: T): T {
    return value;
  }
}

class Child_8 extends Parent_8<string> {
  process(value: string): string {
    return value.charAt(1).toString();
  }
}

class Builder_9<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  build(): T {
    return this.value;
  }
}

class StringBuilder1_9 extends Builder_9<string> {
  constructor(value: string) {
    super(value);
  }

  build(): string {
    return super.build().toUpperCase();
  }
}

class NonGeneric_10 {
  count: number = 0;

  increment(): number {
    return ++this.count;
  }
}

class Generic_10<T> extends NonGeneric_10 {
  data: T;

  constructor(data: T) {
    super();
    this.data = data;
  }

  increment(): number {
    return this.count += 2;
  }
}

class GenericParent_11<T> {
  process(value: T): T {
    return value;
  }
}

class StringChild_11 extends GenericParent_11<string> {
  process(value: string): string {
    return value.toUpperCase();
  }
}

class Base_12<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  process(): T {
    return this.value;
  }
}

class Middle_12<T extends string> extends Base_12<T> {
  constructor(value: T) {
    super(value);
  }
}

class Bottom_12 extends Middle_12<string> {
  constructor(value: string) {
    super(value);
  }

  process(): string {
    return super.process().repeat(2);
  }
}

class Parent_13<T> {
  process(value: T): T {
    return value;
  }
}

class Child_13 extends Parent_13<string> {
  process(value: string): string {
    return value.toUpperCase();
  }
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericClassesBridgeTest() {
  describe("GenericClassesBridgeTest", () => {
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
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0100
     * @tc.name      testGenericClassesBridge0001
     * @tc.desc      Test that a generic subclass correctly overrides a method from a generic parent
     *               class when instantiated with a string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: Pa_0<string> = new Cl_0();
      expect(typeof c.p('string')).assertEqual('string');
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0200
     * @tc.name      testGenericClassesBridge0002
     * @tc.desc      Test generic class inheritance with constructor parameters and method access
     *               from both parent and child classes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c = new Ge_1<string>(1, 'test');
      expect(c.g()).assertEqual(1);
      expect(c.getD()).assertEqual('test');
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0300
     * @tc.name      testGenericClassesBridge0003
     * @tc.desc      Test multi-level generic inheritance with method overriding at the bottom non-generic
     *               class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new Bottom_2("test");
      expect(instance.getValue()).assertEqual("TEST");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0400
     * @tc.name      testGenericClassesBridge0004
     * @tc.desc      Verify method overriding in a multi-level generic inheritance chain with multiple
     *               type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new Generic2_3<number, string>(10, "test");
      expect(instance.getName()).assertEqual("ROOT");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0500
     * @tc.name      testGenericClassesBridge0005
     * @tc.desc      Test that a concrete subclass correctly overrides and modifies a method from
     *               a generic parent class with a specific type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new ConcreteChild_4();
      expect(child.process(5)).assertEqual(10);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0600
     * @tc.name      testGenericClassesBridge0006
     * @tc.desc      Verify that a specialized subclass can extend a generic class and add new methods
     *               while inheriting existing functionality.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const list = new StringList_6();
      list.add("a");
      list.add("b");
      expect(list.join("-")).assertEqual("a-b");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0700
     * @tc.name      testGenericClassesBridge0007
     * @tc.desc      Verify that a generic subclass correctly overrides a method from a generic parent
     *               class while maintaining the same behavior.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let child = new GenericChild_7<number>();
      expect(child.process(5)).assertEqual(5);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0800
     * @tc.name      testGenericClassesBridge0008
     * @tc.desc      Generic method override generates a bridged method(string charAt).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const child: Parent_8<string> = new Child_8();
      const result = child.process("hello");
      expect(result).assertEqual("e");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_0900
     * @tc.name      testGenericClassesBridge0009
     * @tc.desc      Verify that a concrete subclass can override and modify the behavior of a generic
     *               parent class's method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const builder = new StringBuilder1_9("construct");
      expect(builder.build()).assertEqual("CONSTRUCT");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_1000
     * @tc.name      testGenericClassesBridge0010
     * @tc.desc      Verify that a generic class correctly overrides a method from its non-generic
     *               parent class.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new Generic_10<boolean>(true);
      expect(instance.increment()).assertEqual(2);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_1100
     * @tc.name      testGenericClassesBridge0011
     * @tc.desc      Test that a generic subclass correctly overrides a method from a generic parent
     *               class when instantiated with a specific type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const child: GenericParent_11<string> = new StringChild_11();
      const result = child.process("test");
      expect(result).assertEqual("TEST");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_1200
     * @tc.name      testGenericClassesBridge0012
     * @tc.desc      Test method overriding in a multi-level generic inheritance chain with type
     *               constraints.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new Bottom_12("hi");
      expect(instance.process()).assertEqual("hihi");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_BRIDGE_1300
     * @tc.name      testGenericClassesBridge0013
     * @tc.desc      Verify that a child class correctly overrides a method from a generic parent
     *               class when accessed through the parent class type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesBridge0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const child: Parent_13<string> = new Child_13();
      const result = child.process("hello");
      expect(result).assertEqual("HELLO");
    })
  });
}