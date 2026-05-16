'use static'

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

class Base1 {
}

class Base2 {
}

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

class ChildI extends Base2 implements I {
}

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

class C implements I {
}

class Test3 extends TestBase3 {
  override foo(a: Base2 | I) {
    return 7;
  }

  override bar(a: Int): ChildI {
    return new ChildI();
  }
}

class Child22 extends Base2 {
}

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

  override bar(a: Int): Child21 | Child22 | undefined {
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

  bar(a: Int): Base2 | undefined {
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

  override bar(a: Int): Base2 | Child21 | undefined {
    if (a > 0) {
      return new Child21(123);
    }
    return new Base2();
  }
}

export function testClassSuperclassOverride0001() {
  const TAG = 'testClassSuperclassOverride0001';

  let parent = new Parent();
  let child = new Child();
  if (parent.greet() !== "Hello from Parent") {
    console.info(`${TAG} Task execution failed: parent.greet(): ${parent.greet()}`);
    throw new Error('parent.greet() check failed, expected Hello from Parent');
  }

  if (child.greet() !== "Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Child');
  }
}

export function testClassSuperclassOverride0002() {
  const TAG = 'testClassSuperclassOverride0002';

  let child = new Child1();
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0003() {
  const TAG = 'testClassSuperclassOverride0003';

  let child = new Child2();
  if (child.greet() !== "Hello from Parent") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent');
  }
}

export function testClassSuperclassOverride0004() {
  const TAG = 'testClassSuperclassOverride0004';

  let child = new Child3();
  if (child.greet() !== "Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Child');
  }

  if (child.newMethod() !== "This is a new method in Child") {
    console.info(`${TAG} Task execution failed: child.newMethod(): ${child.newMethod()}`);
    throw new Error('child.newMethod() check failed, expected This is a new method in Child');
  }
}

export function testClassSuperclassOverride0005() {
  const TAG = 'testClassSuperclassOverride0005';

  let child = new Child4();
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0006() {
  const TAG = 'testClassSuperclassOverride0006';

  let child = new Child5();
  if (child.greet() !== "Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Child');
  }
}

export function testClassSuperclassOverride0007() {
  const TAG = 'testClassSuperclassOverride0007';

  let child = new Child6();
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0008() {
  const TAG = 'testClassSuperclassOverride0008';

  let child = new Child7();
  if (child.greet() !== "Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Child');
  }
}

export function testClassSuperclassOverride0009() {
  const TAG = 'testClassSuperclassOverride0009';

  let child = new Child8("Hello from Parent");
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0010() {
  const TAG = 'testClassSuperclassOverride0010';

  let child = new Child9();
  if (child.greet() !== "Hello from Parent (static) and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent (static) and Hello from Child');
  }
}

export function testClassSuperclassOverride0011() {
  const TAG = 'testClassSuperclassOverride0011';

  let child = new Child10();
  if (child.greet() !== "Hello from Parent (protected) and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent (protected) and Hello from Child');
  }
}

export function testClassSuperclassOverride0012() {
  const TAG = 'testClassSuperclassOverride0012';

  let child = new Child11("Hello from Parent");
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0013() {
  const TAG = 'testClassSuperclassOverride0013';

  let parent = new Parent6();
  let child = new Child12();
  if (parent.greet() !== "Hello from Parent") {
    console.info(`${TAG} Task execution failed: parent.greet(): ${parent.greet()}`);
    throw new Error('parent.greet() check failed, expected Hello from Parent');
  }

  if (child.greet() !== "Hello from Child and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Child and Hello from Child');
  }
}

export function testClassSuperclassOverride0014() {
  const TAG = 'testClassSuperclassOverride0014';

  let child = new Child13();
  if (child.greet() !== "Hello from Parent (static) and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent (static) and Hello from Child');
  }
}

export function testClassSuperclassOverride0015() {
  const TAG = 'testClassSuperclassOverride0015';

  let child = new Child14();
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0016() {
  const TAG = 'testClassSuperclassOverride0016';

  let child = new Child15();
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export async function testClassSuperclassOverride0017() {
  const TAG = 'testClassSuperclassOverride0017';

  let child = new Child16();
  const _actualValue = await child.greet();
  if (_actualValue !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: _actualValue: ${_actualValue}`);
    throw new Error('await child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0018() {
  const TAG = 'testClassSuperclassOverride0018';

  let child = new Child17();
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }

  if (child.greet("Parent") !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet("Parent"): ${child.greet("Parent")}`);
    throw new Error('child.greet("Parent") check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0019() {
  const TAG = 'testClassSuperclassOverride0019';

  let child = new Child18();
  if (child.greet().getValue() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet().getValue(): ${child.greet().getValue()}`);
    throw new Error('child.greet().getValue() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0020() {
  const TAG = 'testClassSuperclassOverride0020';

  let child = new Child19();
  if (child.greet() !== "Hello from Parent and Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Parent and Hello from Child');
  }
}

export function testClassSuperclassOverride0021() {
  const TAG = 'testClassSuperclassOverride0021';

  let parent: Parent = new Parent();
  let child: Parent = new Child();
  if (parent.greet() !== "Hello from Parent") {
    console.info(`${TAG} Task execution failed: parent.greet(): ${parent.greet()}`);
    throw new Error('parent.greet() check failed, expected Hello from Parent');
  }

  if (child.greet() !== "Hello from Child") {
    console.info(`${TAG} Task execution failed: child.greet(): ${child.greet()}`);
    throw new Error('child.greet() check failed, expected Hello from Child');
  }
}

export function testClassSuperclassOverride0022() {
  const TAG = 'testClassSuperclassOverride0022';

  const child = new Child20();
  console.log(child.greet("Default Message"));
  // expect(child.greet("Test Message")).
  // assertEqual("Hello from Parent with message: Test Message and Hello from Child");

}

export function testClassSuperclassOverride0023() {
  const TAG = 'testClassSuperclassOverride0023';

  let test = new Test1();

  let test1 = new Test2();
  // expect(test1.bar(1) instanceof Child21)

  let test2 = new Test2_1();

  let test3 = new Test3();

  let test4 = new Test4();

  let test5 = new Test5();
  if (test.foo(new Base1()) !== 2) {
    console.info(`${TAG} Task execution failed: test.foo(new Base1()): ${test.foo(new Base1())}`);
    throw new Error('test.foo(new Base1()) check failed, expected 2');
  }

  if (test.foo(new Base2()) !== 2) {
    console.info(`${TAG} Task execution failed: test.foo(new Base2()): ${test.foo(new Base2())}`);
    throw new Error('test.foo(new Base2()) check failed, expected 2');
  }

  if (test.foo(new Child21(123)) !== 2) {
    console.info(`${TAG} Task execution failed: test.foo(new Child21(123)): ${test.foo(new Child21(123))}`);
    throw new Error('test.foo(new Child21(123)) check failed, expected 2');
  }

  if (!test.bar(1) instanceof Base1) {
    console.info(`${TAG} Task execution failed: test.bar(1) instanceof Base1: ${test.bar(1) instanceof Base1}`);
    throw new Error('test.bar(1) instanceof Base1 is not true');
  }

  if (test1.foo(new Base1()) !== 4) {
    console.info(`${TAG} Task execution failed: test1.foo(new Base1()): ${test1.foo(new Base1())}`);
    throw new Error('test1.foo(new Base1()) check failed, expected 4');
  }

  if (test1.foo(new Base2()) !== 4) {
    console.info(`${TAG} Task execution failed: test1.foo(new Base2()): ${test1.foo(new Base2())}`);
    throw new Error('test1.foo(new Base2()) check failed, expected 4');
  }

  if (test1.foo(new Child21(123)) !== 4) {
    console.info(`${TAG} Task execution failed: test1.foo(new Child21(123)): ${test1.foo(new Child21(123))}`);
    throw new Error('test1.foo(new Child21(123)) check failed, expected 4');
  }

  if (test2.foo(new Base1()) !== 5) {
    console.info(`${TAG} Task execution failed: test2.foo(new Base1()): ${test2.foo(new Base1())}`);
    throw new Error('test2.foo(new Base1()) check failed, expected 5');
  }

  if (test2.foo(new Base2()) !== 5) {
    console.info(`${TAG} Task execution failed: test2.foo(new Base2()): ${test2.foo(new Base2())}`);
    throw new Error('test2.foo(new Base2()) check failed, expected 5');
  }

  if (test2.foo(new Child21(123)) !== 5) {
    console.info(`${TAG} Task execution failed: test2.foo(new Child21(123)): ${test2.foo(new Child21(123))}`);
    throw new Error('test2.foo(new Child21(123)) check failed, expected 5');
  }

  if (test2.foo(new Test1()) !== 5) {
    console.info(`${TAG} Task execution failed: test2.foo(new Test1()): ${test2.foo(new Test1())}`);
    throw new Error('test2.foo(new Test1()) check failed, expected 5');
  }

  if (test3.foo(new Base2()) !== 7) {
    console.info(`${TAG} Task execution failed: test3.foo(new Base2()): ${test3.foo(new Base2())}`);
    throw new Error('test3.foo(new Base2()) check failed, expected 7');
  }

  if (test3.foo(new C()) !== 7) {
    console.info(`${TAG} Task execution failed: test3.foo(new C()): ${test3.foo(new C())}`);
    throw new Error('test3.foo(new C()) check failed, expected 7');
  }

  if (test3.foo(new ChildI()) !== 7) {
    console.info(`${TAG} Task execution failed: test3.foo(new ChildI()): ${test3.foo(new ChildI())}`);
    throw new Error('test3.foo(new ChildI()) check failed, expected 7');
  }

  if (!test3.bar(1) instanceof ChildI) {
    console.info(`${TAG} Task execution failed: test3.bar(1) instanceof ChildI: ${test3.bar(1) instanceof ChildI}`);
    throw new Error('test3.bar(1) instanceof ChildI is not true');
  }

  if (test4.foo(new Base2()) !== 9) {
    console.info(`${TAG} Task execution failed: test4.foo(new Base2()): ${test4.foo(new Base2())}`);
    throw new Error('test4.foo(new Base2()) check failed, expected 9');
  }

  if (test4.foo(new Child21(123)) !== 9) {
    console.info(`${TAG} Task execution failed: test4.foo(new Child21(123)): ${test4.foo(new Child21(123))}`);
    throw new Error('test4.foo(new Child21(123)) check failed, expected 9');
  }

  if (test4.foo(new Child22()) !== 9) {
    console.info(`${TAG} Task execution failed: test4.foo(new Child22()): ${test4.foo(new Child22())}`);
    throw new Error('test4.foo(new Child22()) check failed, expected 9');
  }

  if (!test4.bar(1) instanceof Child22) {
    console.info(`${TAG} Task execution failed: test4.bar(1) instanceof Child22: ${test4.bar(1) instanceof Child22}`);
    throw new Error('test4.bar(1) instanceof Child22 is not true');
  }

  if (!test4.bar(-1) instanceof Child21) {
    console.info(`${TAG} Task execution failed: test4.bar(-1) instanceof Child21: ${test4.bar(-1) instanceof Child21}`);
    throw new Error('test4.bar(-1) instanceof Child21 is not true');
  }

  if (test5.foo(new Base2()) !== 11) {
    console.info(`${TAG} Task execution failed: test5.foo(new Base2()): ${test5.foo(new Base2())}`);
    throw new Error('test5.foo(new Base2()) check failed, expected 11');
  }

  if (test5.foo(new Child21(123)) !== 11) {
    console.info(`${TAG} Task execution failed: test5.foo(new Child21(123)): ${test5.foo(new Child21(123))}`);
    throw new Error('test5.foo(new Child21(123)) check failed, expected 11');
  }

  if (!test5.bar(1) instanceof Child21) {
    console.info(`${TAG} Task execution failed: test5.bar(1) instanceof Child21: ${test5.bar(1) instanceof Child21}`);
    throw new Error('test5.bar(1) instanceof Child21 is not true');
  }

  if (!test5.bar(-1) instanceof Base2) {
    console.info(`${TAG} Task execution failed: test5.bar(-1) instanceof Base2: ${test5.bar(-1) instanceof Base2}`);
    throw new Error('test5.bar(-1) instanceof Base2 is not true');
  }
}
