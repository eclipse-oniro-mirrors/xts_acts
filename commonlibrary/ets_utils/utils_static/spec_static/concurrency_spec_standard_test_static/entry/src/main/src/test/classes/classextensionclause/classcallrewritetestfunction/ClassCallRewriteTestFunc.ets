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

class Animal {
  name: string = "Generic Animal";

  introduce() {
    return `I'm ${this.name}`;
  }
}

class Dog extends Animal {
  name: string = "Dog";

  introduce() {
    return `I'm a ${this.name}`;
  }
}

class A {
  method(): string {
    return "Method from A";
  }
}

class B extends A {
  method(): string {
    return "Method from B";
  }
}

class C extends B {
  method(): string {
    return "Method from C";
  }
}

class B1 extends A {
  method(): string {
    return super.method() + " and B";
  }
}

export function testClassCallRewrite0001() {
  const TAG = 'testClassCallRewrite0001';

  let animal: Animal = new Dog();
  let a = animal.introduce();
  let b = animal.name;

  if (a !== "I'm a Dog") {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected I\'m a Dog');
  }

  if (b !== "Dog") {
    console.info(`${TAG} Task execution failed: b: ${b}`);
    throw new Error('b check failed, expected Dog');
  }
}

export function testClassCallRewrite0002() {
  const TAG = 'testClassCallRewrite0002';

  let aInstance: A = new A();
  let a = aInstance.method();

  if (a !== "Method from A") {
    console.info(`${TAG} Task execution failed: a: ${a}`);
    throw new Error('a check failed, expected Method from A');
  }
}

export function testClassCallRewrite0003() {
  const TAG = 'testClassCallRewrite0003';

  let bInstance: A = new B();
  let b = bInstance.method();
  if (b !== "Method from B") {
    console.info(`${TAG} Task execution failed: b: ${b}`);
    throw new Error('b check failed, expected Method from B');
  }
}

export function testClassCallRewrite0004() {
  const TAG = 'testClassCallRewrite0004';

  let cInstance: A = new C();
  let c = cInstance.method();
  if (c !== "Method from C") {
    console.info(`${TAG} Task execution failed: c: ${c}`);
    throw new Error('c check failed, expected Method from C');
  }
}

export function testClassCallRewrite0005() {
  const TAG = 'testClassCallRewrite0005';

  let bInstance: A = new B1();
  let b = bInstance.method();
  if (b !== "Method from A and B") {
    console.info(`${TAG} Task execution failed: b: ${b}`);
    throw new Error('b check failed, expected Method from A and B');
  }
}
