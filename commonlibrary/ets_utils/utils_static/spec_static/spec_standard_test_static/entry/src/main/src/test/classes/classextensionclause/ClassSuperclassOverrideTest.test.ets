/*
* Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class Parent {
  greet(): string {
    return "Hello from Parent";
  }
}

class Child extends Parent {
  greet(): string {
    return "Hello from Child";
  }
}

class Child1 extends Parent {
  greet(): string {
    return super.greet() + " and Hello from Child";
  }
}

class Child2 extends Parent {
}

class Child3 extends Parent {
  greet(): string {
    return "Hello from Child";
  }

  newMethod(): string {
    return "This is a new method in Child";
  }
}

class Child4 extends Parent {
  greet(): string {
    let parentGreeting = super.greet();
    return parentGreeting + " and Hello from Child";
  }
}

class Child5 extends Parent {
  greet(): string {
    return this.getChildGreeting();
  }

  getChildGreeting(): string {
    return "Hello from Child";
  }
}

class Parent1 {
  greeting: string = "Hello from Parent";

  greet(): string {
    return this.greeting;
  }
}

class Child6 extends Parent1 {
  greet(): string {
    return this.greeting + " and Hello from Child";
  }
}

class Child7 extends Parent {
  childGreeting: string = "Hello from Child";

  greet(): string {
    return this.childGreeting;
  }
}

class Parent2 {
  greeting: string;

  constructor(greeting: string) {
    this.greeting = greeting;
  }

  greet(): string {
    return this.greeting;
  }
}

class Child8 extends Parent2 {
  constructor(greeting: string) {
    super(greeting + " and Hello from Child");
  }
}

class Parent3 {
  static staticGreet(): string {
    return "Hello from Parent (static)";
  }

  greet(): string {
    return Parent3.staticGreet();
  }
}

class Child9 extends Parent3 {
  greet(): string {
    return super.greet() + " and Hello from Child";
  }
}

class Parent4 {
  protected protectedGreet(): string {
    return "Hello from Parent (protected)";
  }

  greet(): string {
    return this.protectedGreet();
  }
}

class Child10 extends Parent4 {
  greet(): string {
    return super.greet() + " and Hello from Child";
  }
}

class Parent5 {
  greeting: string;

  constructor(greeting: string) {
    this.greeting = greeting;
  }

  greet(): string {
    return this.greeting;
  }
}

class Child11 extends Parent5 {
  constructor(greeting: string) {
    super(greeting);
  }

  greet(): string {
    return super.greet() + " and Hello from Child";
  }
}

class Parent6 {
  greet(name: string = "Parent"): string {
    return `Hello from ${name}`;
  }
}

class Child12 extends Parent6 {
  greet(name: string = "Child"): string {
    return super.greet(name) + " and Hello from Child";
  }
}

class Parent7 {
  static staticGreeting: string = "Hello from Parent (static)";

  greet(): string {
    return Parent7.staticGreeting;
  }
}

class Child13 extends Parent7 {
  greet(): string {
    return super.greet() + " and Hello from Child";
  }
}

class Child14 extends Parent1 {
  greet(): string {
    return super.greet() + " and Hello from Child";
  }
}

class Parent8 {
  private _greeting: string = "Hello from Parent";

  get greeting(): string {
    return this._greeting;
  }

  set greeting(value: string) {
    this._greeting = value;
  }

  greet(): string {
    return this.greeting;
  }
}

class Child15 extends Parent8 {
  greet(): string {
    return super.greet() + " and Hello from Child";
  }
}

class Parent9 {
  async greet(): Promise<string> {
    return "Hello from Parent";
  }
}

class Child16 extends Parent9 {
  async greet(): Promise<string> {
    const parentGreeting = await super.greet();
    return `${parentGreeting} and Hello from Child`;
  }
}

class Parent10 {
  greet(name?: string): string {
    return name ? `Hello from ${name}` : "Hello from Parent";
  }
}

class Child17 extends Parent10 {
  override greet(name?: string): string {
    const baseGreeting = super.greet(name);
    return `${baseGreeting} and Hello from Child`;
  }
}

class Parent11 {
  value: string = "";

  greet(): this {
    this.value += "Hello from Parent";
    return this;
  }

  getValue(): string {
    return this.value;
  }
}

class Child18 extends Parent11 {
  greet(): this {
    super.greet();
    this.value += " and Hello from Child";
    return this;
  }
}

interface Greetable {
  greet(): string;
}

class Parent12 implements Greetable {
  greet(): string {
    return "Hello from Parent";
  }
}

class Child19 extends Parent12 {
  override greet(): string {
    return super.greet() + " and Hello from Child";
  }
}

class Parent13 {
  greet<T>(message: T): string {
    return `Hello from Parent with message: ${message}`;
  }
}

class Child20 extends Parent13 {
  override greet<T>(message: T): string {
    return super.greet(message) + " and Hello from Child";
  }
}

class Base1 {}
class Base2 {}
class Child21 extends Base2 {
  childField = 111;
  constructor(a: Int) {
    this.childField = a;
  }
}
class TestBase1 {
  TestField: Base1 | Base2 | undefined = new Base2()
  foo(a: Base1 | Base2) {
    return 1;
  }
  bar(a: Int): Base1 | Base2 | undefined {
    return this.TestField;
  }
}
class Test1 extends TestBase1 {
  TestField2: Base1 | Base2 | undefined = new Base1()
  override foo(a: Base2 | Base1) {
    return 2;
  }
  override bar(a: Int): Base1 | Base2 | undefined {
    return this.TestField2;
  }
}

class TestBase2 {
  TestField: Base1 | Base2 | undefined = undefined
  foo(a: Base1 | Child21) {
    return 3;
  }
  bar(a: Int): Base1 | Base2 | undefined {
    return this.TestField;
  }
}

class Test2 extends TestBase2 {
  override foo(a: Base2 | Base1) {
    return 4;
  }
  override bar(a: Int): Child21 | Base1 | undefined {
    return new Child21(a);
  }
}

class Test2_1 extends TestBase2 {
  override foo(a: Base2 | Base1 | Test1) {
    return 5;
  }
}

interface I {}
class ChildI extends Base2 implements I {}

class TestBase3 {
  foo(a: ChildI) {
    return 6;
  }
  bar(a: Int): Base2 | I {
    if (a > 0) {
      return new C();
    } else {
      return new Base2();
    }
  }
}

class C implements I {}
class Test3 extends TestBase3 {
  override foo(a:  Base2 | I) {
    return 7;
  }
  override bar(a: Int): ChildI {
    return new ChildI();
  }
}

class Child22 extends Base2 {}
class TestBase4 {
  foo(a: Child21 | Child22) {
    return 8;
  }
  bar(a: Int): Base2 | undefined {
    if (a > 0) {
      return new Base2();
    }
    return undefined;
  }
}

class Test4 extends TestBase4 {
  override foo(a: Base2) {
    return 9;
  }
  override bar(a: Int): Child21 | Child22| undefined {
    if (a > 0) {
      return new Child22();
    }
    return new Child21(123);
  }
}

class TestBase5 {
  foo(a: Base2 | Child21) {
    return 10;
  }
  bar(a: Int): Base2 | undefined{
    if (a > 0) {
      return new Base2();
    }
    return undefined;
  }
}

class Test5 extends TestBase5 {
  override foo(a: Base2) {
    return 11;
  }
  override bar(a: Int): Base2 | Child21 | undefined{
    if (a > 0) {
      return new Child21(123);
    }
    return new Base2();
  }
}

export default function ClassSuperclassOverrideTest() {
  describe('ClassSuperclassOverrideTest', () => {
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
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0100
     * @tc.name      testClassSuperclassOverride0001
     * @tc.desc      A subclass overrides a method of its superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0001';
      console.log(TAG + ' start');

      let parent = new Parent();
      let child = new Child();
      expect(parent.greet()).assertEqual("Hello from Parent");
      expect(child.greet()).assertEqual("Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0200
     * @tc.name      testClassSuperclassOverride0002
     * @tc.desc      A subclass calls a method of its superclass
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0002';
      console.log(TAG + ' start');

      let child = new Child1();
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0300
     * @tc.name      testClassSuperclassOverride0003
     * @tc.desc      A subclasses do not override superclass methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0003';
      console.log(TAG + ' start');

      let child = new Child2();
      expect(child.greet()).assertEqual("Hello from Parent");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0400
     * @tc.name      testClassSuperclassOverride0004
     * @tc.desc      A subclass overrides parent method and adds new method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0004';
      console.log(TAG + ' start');

      let child = new Child3();
      expect(child.greet()).assertEqual("Hello from Child");
      expect(child.newMethod()).assertEqual("This is a new method in Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0500
     * @tc.name      testClassSuperclassOverride0005
     * @tc.desc      Subclass overrides parent method and calls parent method with super
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0005';
      console.log(TAG + ' start');

      let child = new Child4();
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0600
     * @tc.name      testClassSuperclassOverride0006
     * @tc.desc      Subclass overrides parent method and calls other methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0006';
      console.log(TAG + ' start');

      let child = new Child5();
      expect(child.greet()).assertEqual("Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0700
     * @tc.name      testClassSuperclassOverride0007
     * @tc.desc      The child class overrides the parent class method and uses the properties of the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0007';
      console.log(TAG + ' start');

      let child = new Child6();
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0800
     * @tc.name      testClassSuperclassOverride0008
     * @tc.desc      Subclass overrides parent method and uses subclass properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0008';
      console.log(TAG + ' start');

      let child = new Child7();
      expect(child.greet()).assertEqual("Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_0900
     * @tc.name      testClassSuperclassOverride0009
     * @tc.desc      The child class overrides the parent class method and uses the parent class's constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0009';
      console.log(TAG + ' start');

      let child = new Child8("Hello from Parent");
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1000
     * @tc.name      testClassSuperclassOverride0010
     * @tc.desc      The child class overrides the parent class method and uses the parent class's static method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0010';
      console.log(TAG + ' start');

      let child = new Child9();
      expect(child.greet()).assertEqual("Hello from Parent (static) and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1100
     * @tc.name      testClassSuperclassOverride0011
     * @tc.desc      The child class overrides the parent class method and uses the protected method of the parent class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0011';
      console.log(TAG + ' start');

      let child = new Child10();
      expect(child.greet()).assertEqual("Hello from Parent (protected) and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1200
     * @tc.name      testClassSuperclassOverride0012
     * @tc.desc      The child class overrides the parent class method and uses the parent class's constructor
     * parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0012';
      console.log(TAG + ' start');

      let child = new Child11("Hello from Parent");
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1300
     * @tc.name      testClassSuperclassOverride0013
     * @tc.desc      Subclass overrides parent method and uses default parameters of parent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0013';
      console.log(TAG + ' start');

      let parent = new Parent6();
      let child = new Child12();
      expect(parent.greet()).assertEqual("Hello from Parent");
      expect(child.greet()).assertEqual("Hello from Child and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1400
     * @tc.name      testClassSuperclassOverride0014
     * @tc.desc      The child class overrides the parent class method and uses the static properties of the parent
     * class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0014';
      console.log(TAG + ' start');

      let child = new Child13();
      expect(child.greet()).assertEqual("Hello from Parent (static) and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1500
     * @tc.name      testClassSuperclassOverride0015
     * @tc.desc      The child class overrides the parent class method and uses the parent class's instance properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0015';
      console.log(TAG + ' start');

      let child = new Child14();
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1600
     * @tc.name      testClassSuperclassOverride0016
     * @tc.desc      Subclass overrides parent method and uses parent's getter/setter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0016';
      console.log(TAG + ' start');

      let child = new Child15();
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1700
     * @tc.name      testClassSuperclassOverride0017
     * @tc.desc      Subclass overrides parent method and uses parent's asynchronous method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void):
      Promise<void> => {
      const TAG = 'testClassSuperclassOverride0017';
      console.log(TAG + ' start');

      let child = new Child16();
      expect(await child.greet()).assertEqual("Hello from Parent and Hello from Child");
      done();

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1800
     * @tc.name      testClassSuperclassOverride0018
     * @tc.desc      Subclasses override superclass methods and use superclass overloaded methods
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0018';
      console.log(TAG + ' start');

      let child = new Child17();
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child")
      expect(child.greet("Parent")).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_1900
     * @tc.name      testClassSuperclassOverride0019
     * @tc.desc      The child class overrides the parent class method and uses the chained invocation of the parent
     * class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0019';
      console.log(TAG + ' start');

      let child = new Child18();
      expect(child.greet().getValue()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_2000
     * @tc.name      testClassSuperclassOverride0020
     * @tc.desc      The child class overrides the parent class method and uses the parent class's interface
     * implementation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0020';
      console.log(TAG + ' start');

      let child = new Child19();
      expect(child.greet()).assertEqual("Hello from Parent and Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_2100
     * @tc.name      testClassSuperclassOverride0021
     * @tc.desc      The child class overrides the parent class method and uses the parent class's abstract method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0021';
      console.log(TAG + ' start');

      let parent: Parent = new Parent();
      let child: Parent = new Child();
      expect(parent.greet()).assertEqual("Hello from Parent")
      expect(child.greet()).assertEqual("Hello from Child");

    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_2200
     * @tc.name      testClassSuperclassOverride0022
     * @tc.desc      Subclasses override the parent method and use the parent's generic method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0022';
      console.log(TAG + ' start');

      const child = new Child20();
      console.log(child.greet("Default Message"));
      expect(child.greet("Test Message")).
      assertEqual("Hello from Parent with message: Test Message and Hello from Child");
    });

    /**
     * @tc.number    SUB_CLASS_SUPERCLASS_OVERRIDETEST_2300
     * @tc.name      testClassSuperclassOverride0023
     * @tc.desc      Subclasses override superclass methods with union type arguments and return type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testClassSuperclassOverride0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testClassSuperclassOverride0023';
      console.log(TAG + ' start');

      let test = new Test1();
      expect(test.foo(new Base1())).assertEqual(2);
      expect(test.foo(new Base2())).assertEqual(2);
      expect(test.foo(new Child21(123))).assertEqual(2);
      expect(test.bar(1) instanceof Base1).assertTrue();

      let test1 = new Test2();
      expect(test1.foo(new Base1())).assertEqual(4);
      expect(test1.foo(new Base2())).assertEqual(4);
      expect(test1.foo(new Child21(123))).assertEqual(4);
      expect(test1.bar(1) instanceof Child21)

      let test2 = new Test2_1();
      expect(test2.foo(new Base1())).assertEqual(5);
      expect(test2.foo(new Base2())).assertEqual(5);
      expect(test2.foo(new Child21(123))).assertEqual(5);
      expect(test2.foo(new Test1())).assertEqual(5)

      let test3 = new Test3();
      expect(test3.foo(new Base2())).assertEqual(7);
      expect(test3.foo(new C())).assertEqual(7);
      expect(test3.foo(new ChildI())).assertEqual(7);
      expect(test3.bar(1) instanceof ChildI).assertTrue();

      let test4 = new Test4();
      expect(test4.foo(new Base2())).assertEqual(9);
      expect(test4.foo(new Child21(123))).assertEqual(9);
      expect(test4.foo(new Child22())).assertEqual(9);
      expect(test4.bar(1) instanceof Child22).assertTrue();
      expect(test4.bar(-1) instanceof Child21).assertTrue();

      let test5 = new Test5();
      expect(test5.foo(new Base2())).assertEqual(11);
      expect(test5.foo(new Child21(123))).assertEqual(11);
      expect(test5.bar(1) instanceof Child21).assertTrue();
      expect(test5.bar(-1) instanceof Base2).assertTrue();

    });

  })
}