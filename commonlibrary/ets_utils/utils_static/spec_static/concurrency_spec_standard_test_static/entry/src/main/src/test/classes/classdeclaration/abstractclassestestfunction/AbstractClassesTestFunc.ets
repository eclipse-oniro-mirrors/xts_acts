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


abstract class Base {
  field: number = 10 + 5
}

class Derived extends Base {
  constructor() {
  }
}

class A {
  a: string = 'a'

  foo(b: B): A {
    return b as A;
  }
}

class B extends A {
  b: string = 'b'

  foo(a: A): B {
    return new B()
  }
}

abstract class C {
  c1: int;
  c2: string;

  constructor() {
    this.c1 = 1
    this.c2 = 'c'
  }

  foo(f: int): string | number {
    return f + 1
  }
}

class A1 {
  a: string = 'a'

  foo(b: B1): A1 {
    return b as A1;
  }
}

class B1 extends A1 {
  b: string = 'b'

  foo(a: A1): B1 {
    return new B1()
  }
}

abstract class C1 {
  c1: A1;
  c2: B1;

  constructor() {
    this.c1 = new A1()
    this.c2 = new B1()
  }

  foo(f: A1): string {
    return f.a
  }
}

abstract class A2 {
  static a1: int = 1
  static a2: string = 'a2'
}

class B2 extends A2 {
  static a1: int = 2
  static a2: string = 'b2'
}

abstract class A3 {
  static foo(): int {
    return 1
  }

  static bar(b: int): int {
    return b + 1
  }
}

class B3 extends A3 {
  static foo(): int {
    return 3
  }

  static bar(b: int): int {
    return b - 1
  }
}

abstract class A4 {
  static a1: int = 1
  static a2: string = 'a2'
}

class B4 extends A4 {
  static a1: string = 'a1'
  static a2: int = 2
}

abstract class A5 {
  static foo(): int {
    return 1
  }

  static bar(b: int): int {
    return b + 1
  }
}

class B5 extends A5 {
  static foo(): string {
    return 'a1'
  }

  static bar(b: string): string {
    return b + 2
  }
}

abstract class A6 {
  f: int;

  constructor() {
    this.f = 3;
  }
}

class B6 extends A6 {
  f1: int;

  constructor() {
    this.f1 = this.f + 2;
  }
}

export function testAbstractClasses0001() {
  const TAG = 'testAbstractClasses0001';

  let d: Derived = new Derived();
  if (d.field !== 15) {
    console.info(`${TAG} Task execution failed: d.field: ${d.field}`);
    throw new Error('d.field check failed, expected 15');
  }
}

export function testAbstractClasses0002() {
  const TAG = 'testAbstractClasses0002';

  let c: C = {
    c1: 2,
    c2: 'c2'
  }
  if (c.c1 !== 2) {
    console.info(`${TAG} Task execution failed: c.c1: ${c.c1}`);
    throw new Error('c.c1 check failed, expected 2');
  }

  if (c.c2 !== 'c2') {
    console.info(`${TAG} Task execution failed: c.c2: ${c.c2}`);
    throw new Error('c.c2 check failed, expected c2');
  }

  if (c.foo(1) !== 2) {
    console.info(`${TAG} Task execution failed: c.foo(1): ${c.foo(1)}`);
    throw new Error('c.foo(1) check failed, expected 2');
  }
}

export function testAbstractClasses0003() {
  const TAG = 'testAbstractClasses0003';

  let c: C1 = {
    c1: { a: 'aa' },
    c2: { a: 'aaa', b: 'bb' }
  }
  if (c.c1.a !== 'aa') {
    console.info(`${TAG} Task execution failed: c.c1.a: ${c.c1.a}`);
    throw new Error('c.c1.a check failed, expected aa');
  }

  if (c.c2.a !== 'aaa') {
    console.info(`${TAG} Task execution failed: c.c2.a: ${c.c2.a}`);
    throw new Error('c.c2.a check failed, expected aaa');
  }

  if (c.c2.b !== 'bb') {
    console.info(`${TAG} Task execution failed: c.c2.b: ${c.c2.b}`);
    throw new Error('c.c2.b check failed, expected bb');
  }

  if (c.foo(c.c1) !== 'aa') {
    console.info(`${TAG} Task execution failed: c.foo(c.c1): ${c.foo(c.c1)}`);
    throw new Error('c.foo(c.c1) check failed, expected aa');
  }

  if (c.foo(c.c2) !== 'aaa') {
    console.info(`${TAG} Task execution failed: c.foo(c.c2): ${c.foo(c.c2)}`);
    throw new Error('c.foo(c.c2) check failed, expected aaa');
  }
}

export function testAbstractClasses0004() {
  const TAG = 'testAbstractClasses0004';

  if (A2.a1 !== 1) {
    console.info(`${TAG} Task execution failed: A2.a1: ${A2.a1}`);
    throw new Error('A2.a1 check failed, expected 1');
  }

  if (A2.a2 !== 'a2') {
    console.info(`${TAG} Task execution failed: A2.a2: ${A2.a2}`);
    throw new Error('A2.a2 check failed, expected a2');
  }

  if (B2.a1 !== 2) {
    console.info(`${TAG} Task execution failed: B2.a1: ${B2.a1}`);
    throw new Error('B2.a1 check failed, expected 2');
  }

  if (B2.a2 !== 'b2') {
    console.info(`${TAG} Task execution failed: B2.a2: ${B2.a2}`);
    throw new Error('B2.a2 check failed, expected b2');
  }
}

export function testAbstractClasses0005() {
  const TAG = 'testAbstractClasses0005';

  if (A3.foo() !== 1) {
    console.info(`${TAG} Task execution failed: A3.foo(): ${A3.foo()}`);
    throw new Error('A3.foo() check failed, expected 1');
  }

  if (A3.bar(1) !== 2) {
    console.info(`${TAG} Task execution failed: A3.bar(1): ${A3.bar(1)}`);
    throw new Error('A3.bar(1) check failed, expected 2');
  }

  if (B3.foo() !== 3) {
    console.info(`${TAG} Task execution failed: B3.foo(): ${B3.foo()}`);
    throw new Error('B3.foo() check failed, expected 3');
  }

  if (B3.bar(1) !== 0) {
    console.info(`${TAG} Task execution failed: B3.bar(1): ${B3.bar(1)}`);
    throw new Error('B3.bar(1) check failed, expected 0');
  }
}

export function testAbstractClasses0006() {
  const TAG = 'testAbstractClasses0006';

  if (A4.a1 !== 1) {
    console.info(`${TAG} Task execution failed: A4.a1: ${A4.a1}`);
    throw new Error('A4.a1 check failed, expected 1');
  }

  if (A4.a2 !== 'a2') {
    console.info(`${TAG} Task execution failed: A4.a2: ${A4.a2}`);
    throw new Error('A4.a2 check failed, expected a2');
  }

  if (B4.a1 !== 'a1') {
    console.info(`${TAG} Task execution failed: B4.a1: ${B4.a1}`);
    throw new Error('B4.a1 check failed, expected a1');
  }

  if (B4.a2 !== 2) {
    console.info(`${TAG} Task execution failed: B4.a2: ${B4.a2}`);
    throw new Error('B4.a2 check failed, expected 2');
  }
}

export function testAbstractClasses0007() {
  const TAG = 'testAbstractClasses0007';

  if (A5.foo() !== 1) {
    console.info(`${TAG} Task execution failed: A5.foo(): ${A5.foo()}`);
    throw new Error('A5.foo() check failed, expected 1');
  }

  if (A5.bar(1) !== 2) {
    console.info(`${TAG} Task execution failed: A5.bar(1): ${A5.bar(1)}`);
    throw new Error('A5.bar(1) check failed, expected 2');
  }

  if (B5.foo() !== 'a1') {
    console.info(`${TAG} Task execution failed: B5.foo(): ${B5.foo()}`);
    throw new Error('B5.foo() check failed, expected a1');
  }

  if (B5.bar('a') !== 'a2') {
    console.info(`${TAG} Task execution failed: B5.bar('a'): ${B5.bar('a')}`);
    throw new Error('B5.bar("a") check failed, expected a2');
  }
}

export function testAbstractClasses0008() {
  const TAG = 'testAbstractClasses0008';

  let c: B6 = new B6();
  if (c.f1 !== 5) {
    console.info(`${TAG} Task execution failed: c.f1: ${c.f1}`);
    throw new Error('c.f1 check failed, expected 5');
  }
}
