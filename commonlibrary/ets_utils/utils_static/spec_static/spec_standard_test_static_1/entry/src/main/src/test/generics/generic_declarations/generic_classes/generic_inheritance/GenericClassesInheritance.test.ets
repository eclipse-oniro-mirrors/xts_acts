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
} from "../../../../../../../hypium"

// 22
// 泛型基类和接口定义
class GenericParent_0<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(): T {
    return this.data;
  }
}
class GenericParent_1<T> {
  private data:T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(): T {
    return this.data;
  }
}
class GenericParent_2<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(): T {
    return this.data;
  }
}
class GenericParent_3<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(): T {
    return this.data;
  }
}
class GenericParent_4<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(): T {
    return this.data;
  }
}
class GenericParent_5<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(): T {
    return this.data;
  }
}
class GenericParent_6<T> {
  private data:T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(): T {
    return this.data;
  }
}
class GenericParent_7<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(): T {
    return this.data;
  }
}
class GenericParentWithMethod_8<T> {
  protected data: T;
  constructor(data: T) {
    this.data = data;
  }
  public process<U>(value: U): [T, U] {
    return [this.data, value];
  }
}
class GenericMethodParent_9<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public processData(): boolean {
    return true;
  }
}
interface GenericInterface_10<T> {
  process(t: T): T;
}
class DefaultGenericType_11<T = number> {
  private data: T;
  constructor(data: T) {
    this.data = data
  }
  public getData(t: T): T {
    return this.data;
  }
}
class DefaultGenericType_12<T = string> {
  private data: T;
  constructor(data: T) {
    this.data = data
  }
  public getData(t: T): T {
    return this.data;
  }
}
class DefaultGenericType_13<T = boolean> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getData(t: T): T {
    return this.data;
  }
}
class MultiGenericType_14<T, U> {
  private first: T;
  private second: U;
  constructor(first: T, second: U) {
    this.first = first;
    this.second = second
  }
  public getFirst(t: T): T {
    return this.first;
  }
  public getSecond(u: U): U {
    return this.second;
  }
}
class MultiGenericType_15<T, U> {
  private first: T;
  private second: U;
  constructor(first: T, second: U) {
    this.first = first;
    this.second = second
  }
  public getFirst(): T {
    return this.first;
  }
  public getSecond(): U {
    return this.second;
  }
}
class MultiGenericType_16<T, U> {
  private first: T;
  private second: U;
  constructor(first: T, second: U) {
    this.first = first;
    this.second = second;
  }
  public getFirst(): T {
    return this.first;
  }
  public getSecond(): U {
    return this.second;
  }
}
class UnionGenericType_17<T extends number | string> {
  private data: T;
  constructor(data: T) {
    this.data = data
  }
  public getData(): T {
    return this.data;
  }
}
class ComplexTypeParent_18<T extends user_18> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getDataName(): string {
    return this.data.name;
  }
}
class ComplexTypeParent_19<T extends user_19> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getDataAge(): number {
    return this.data.age;
  }
}
class ComplexTypeParent_20<T extends user_20> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getDataAge(): number {
    return this.data.age;
  }
  public getDataName(): string {
    return this.data.name;
  }
}
class ComplexTypeParent_21<T extends user_21> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public getDataAge(): number {
    return this.data.age;
  }
  public getDataName(): string {
    return this.data.name;
  }
  public getDataMarriedNo(): boolean {
    return this.data.marriedNo;
  }
}
// 辅助类定义 (用于泛型约束)
class user_18 {
  name: string = '';
  age: number = 0;
}
class user_19 {
  name: string = '';
  age: number = 0;
}
class user_20 {
  name: string = '';
  age: number = 0;
}
class user_21 {
  name: string = '';
  age: number = 0;
  marriedNo: boolean = false;
}

class ChildClass extends GenericParent_0<number> {
  constructor(data: number) {
    super(data);
  }
}

class ChildClass1 extends GenericParent_1<number> {
  constructor(data: number) {
    super(data);
  }
}
class GrandChildClass extends ChildClass1 {
  constructor(data: number) {
    super(data);
  }
}
class AnotherChildClass extends GenericParent_2<string> {
  constructor(data: string){
    super(data);
  }
}
class ChildWithGenericMethod extends GenericParentWithMethod_8<number> {
  constructor(data: number){
    super(data);
  }
}
class ComplexChildClass extends ComplexTypeParent_18<user_18> {
  constructor(data: user_18) {
    super(data);
  }
}
class MethodOverrideChild<T> extends GenericMethodParent_9<T> {
  constructor(data: T){
    super(data);
  }
  public override processData(): boolean {
    return false;
  }
}
class InterfaceImplementer<T> implements GenericInterface_10<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public process(t: T): T {
    return this.data;
  }
}
class ChildInterfaceImplementer<T> extends InterfaceImplementer<T> {
  constructor(data: T){
    super(data);
  }
}
class WithDefaultChild<T> extends DefaultGenericType_11<number> {
  constructor(data: number) {
    super(data)
  }
}
class MultiGenericChild<T, U> extends MultiGenericType_14<number, string> {
  constructor(first: number, second: string){
    super(first, second)
  }
}
class UnionChildClass<T extends number | string> extends UnionGenericType_17<number | string> {
  constructor(data: number | string) {
    super(data)
  }
}
class ChildClass2 extends GenericParent_3<string> {
  constructor(data: string) {
    super(data);
  }
}
class ChildClass3 extends GenericParent_4<boolean> {
  constructor(data: boolean) {
    super(data);
  }
}
class ChildClass4 extends GenericParent_5<boolean> {
  constructor(data: boolean) {
    super(data);
  }
}
class GrandChildClass1 extends ChildClass4 {
  constructor(data: boolean) {
    super(data);
  }
}
class ComplexChildClass1 extends ComplexTypeParent_19<user_19> {
  constructor(data: user_19) {
    super(data);
  }
}
class ComplexChildClass2 extends ComplexTypeParent_20<user_20> {
  constructor(data: user_20) {
    super(data);
  }
}
class ComplexChildClass3 extends ComplexTypeParent_21<user_21> {
  constructor(data: user_21) {
    super(data);
  }
}
class InterfaceImplementer1<T> implements GenericInterface_10<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public process(t:T): T {
    return this.data;
  }
}
class ChildInterfaceImplementer1<T> extends InterfaceImplementer1<T> {
  constructor(data: T){
    super(data);
  }
}
class InterfaceImplementer2<T> implements GenericInterface_10<T> {
  private data: T;
  constructor(data: T) {
    this.data = data;
  }
  public process(t: T): T {
    return this.data;
  }
}
class ChildInterfaceImplementer2<T> extends InterfaceImplementer2<T> {
  constructor(data: T){
    super(data);
  }
}

class WithDefaultChild1<T> extends DefaultGenericType_12<string> {
  constructor(data: string) {
    super(data);
  }
}
class WithDefaultChild2<T> extends DefaultGenericType_13<boolean> {
  constructor(data: boolean) {
    super(data);
  }
}
class MultiGenericChild1<T, U> extends MultiGenericType_15<number, string> {
  constructor(first: number, second: string){
    super(first, second)
  }
}
class MultiGenericChild2<T, U> extends MultiGenericType_16<string, string> {
  constructor(first: string, second: string){
    super(first, second);
  }
}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericClassesInheritanceTest() {
  describe("GenericClassesInheritanceTest", () => {
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
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0100
     * @tc.name      testGenericClassesInheritance0001
     * @tc.desc      Test the generic implementation class to handle the integer zero.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childInstance = new ChildClass(5);
      const result = typeof childInstance.getData();
      expect(result).assertEqual("number");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0200
     * @tc.name      testGenericClassesInheritance0002
     * @tc.desc      Indirect inheritance-validates that subclasses of subclasses also follow generic
     *               constraints.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grandChildInstance = new GrandChildClass(10);
      const result = typeof grandChildInstance.getData();
      expect(result).assertEqual("number");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0300
     * @tc.name      testGenericClassesInheritance0003
     * @tc.desc      Use different types of generic parameters for testing.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grandChildInstance = new AnotherChildClass("data");
      const result = typeof grandChildInstance.getData();
      expect(result).assertEqual("string");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0400
     * @tc.name      testGenericClassesInheritance0004
     * @tc.desc      Generic methods combined with generic classes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new ChildWithGenericMethod(10);
      const result = instance.process<string>("test");
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual("test");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0500
     * @tc.name      testGenericClassesInheritance0005
     * @tc.desc      Generic class with complex type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childInstance = new ComplexChildClass({ name: "Alice", age: 30 });
      expect(childInstance.getDataName()).assertEqual("Alice");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0600
     * @tc.name      testGenericClassesInheritance0006
     * @tc.desc      Method rewriting and generic constraints.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new MethodOverrideChild<number>(10);
      expect(instance.processData()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0700
     * @tc.name      testGenericClassesInheritance0007
     * @tc.desc      Generic interface and implementation.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new ChildInterfaceImplementer<string>("test");
      const result = instance.process("aa");
      expect(result).assertEqual("test");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0800
     * @tc.name      testGenericClassesInheritance0008
     * @tc.desc      Generic constraints and default values.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new WithDefaultChild<number>(20);
      const result = instance.getData(1);
      expect(result).assertEqual(20)
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_0900
     * @tc.name      testGenericClassesInheritance0009
     * @tc.desc      Multi-generic parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new MultiGenericChild<number, string>(100, "hundred");
      const result = instance.getSecond("aa")
      expect(result).assertEqual("hundred")
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1000
     * @tc.name      testGenericClassesInheritance0010
     * @tc.desc      Use generics of union types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberInstance = new UnionChildClass<number>(10);
      const stringInstance = new UnionChildClass<string>("ten");
      const result = numberInstance.getData();
      const result1 = stringInstance.getData();
      expect(result).assertEqual(10);
      expect(result1).assertEqual('ten');
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1100
     * @tc.name      testGenericClassesInheritance0011
     * @tc.desc      Direct inheritance-verifies that the subclass correctly specifies generic parameters(string
     *               type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childInstance = new ChildClass2("str");
      const result = typeof childInstance.getData();
      expect(result).assertEqual("string");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1200
     * @tc.name      testGenericClassesInheritance0012
     * @tc.desc      Direct inheritance-verifies that the subclass correctly specifies generic parameters(boolean
     *               type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childInstance = new ChildClass3(true);
      const result = typeof childInstance.getData();
      expect(result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1300
     * @tc.name      testGenericClassesInheritance0013
     * @tc.desc      Indirect inheritance-validates that subclasses of subclasses also follow generic
     *               constraints(boolean type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grandChildInstance = new GrandChildClass1(true);
      const result = typeof grandChildInstance.getData();
      expect(result).assertEqual("boolean");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1400
     * @tc.name      testGenericClassesInheritance0014
     * @tc.desc      Generic class with complex type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childInstance = new ComplexChildClass1({ name: "Alice", age: 30 });
      expect(childInstance.getDataAge()).assertEqual(30);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1500
     * @tc.name      testGenericClassesInheritance0015
     * @tc.desc      Generic class with complex type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childInstance = new ComplexChildClass2({ name: "Alice", age: 30 });
      expect(childInstance.getDataName()).assertEqual("Alice");
      expect(childInstance.getDataAge()).assertEqual(30);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1600
     * @tc.name      testGenericClassesInheritance0016
     * @tc.desc      Generic class with complex type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const childInstance = new ComplexChildClass3({ name: "Alice", age: 30, marriedNo: false});
      expect(childInstance.getDataName()).assertEqual("Alice");
      expect(childInstance.getDataAge()).assertEqual(30);
      expect(childInstance.getDataMarriedNo()).assertEqual(false);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1700
     * @tc.name      testGenericClassesInheritance0017
     * @tc.desc      Generic interface and implementation(number type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new ChildInterfaceImplementer1<number>(10);
      const result = instance.process(1);
      expect(result).assertEqual(10);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1800
     * @tc.name      testGenericClassesInheritance0018
     * @tc.desc      Generic interface and implementation(boolean type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new ChildInterfaceImplementer2<boolean>(true);
      const result = instance.process(false);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_1900
     * @tc.name      testGenericClassesInheritance0019
     * @tc.desc      Generic constraints and default values(string type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new WithDefaultChild1<string>("str");
      const result = instance.getData("aa");
      expect(result).assertEqual("str");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_2000
     * @tc.name      testGenericClassesInheritance0020
     * @tc.desc      Generic constraints and default values(boolean type).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new WithDefaultChild2<boolean>(true);
      const result = instance.getData(false);
      expect(result).assertEqual(true);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_2100
     * @tc.name      testGenericClassesInheritance0021
     * @tc.desc      Multi-generic parameters-string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new MultiGenericChild1<number, string>(100, "hundred");
      const result = instance.getFirst();
      expect(result).assertEqual(100);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_INHERITANCE_2200
     * @tc.name      testGenericClassesInheritance0022
     * @tc.desc      Multi-generic parameters-string.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesInheritance0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const instance = new MultiGenericChild2<number, string>("100", "hundred");
      const result = instance.getFirst();
      expect(result).assertEqual("100");
    })
  });
}