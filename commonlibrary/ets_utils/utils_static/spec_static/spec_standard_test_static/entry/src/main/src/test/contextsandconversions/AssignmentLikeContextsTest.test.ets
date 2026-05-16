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
} from '../../../../hypium/index';

class A {
  public fld_1: boolean;
  public fld_2: boolean;

  public constructor(p1: boolean, p2: boolean) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }

  public foo(p1: boolean, p2: boolean): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}

enum Color {
  Red,
  Green,
  Blue
}
class A1 {
  public fld_1: byte;
  public fld_2: byte;
  public fld_3: byte;
  public constructor(p1: byte, p2: byte, p3: byte) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: byte, p2: byte, p3: byte): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A2 {
  public fld_1: char;
  public fld_2: char;
  public fld_3: char;
  public constructor(p1: char, p2: char, p3: char) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: char, p2: char, p3: char): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A3 {
  public fld_1: short;
  public fld_2: short;
  public constructor(p1: short, p2: short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: short, p2: short): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A4 {
  public fld_1: int;
  public fld_2: int;
  public fld_3: int;
  public constructor(p1: int, p2: int, p3: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: int, p2: int, p3: int): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A5 {
  public fld_1: long;
  public fld_2: long;
  public constructor(p1: long, p2: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: long, p2: long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A6 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A7 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A8 {
  public fld_1: short;
  public fld_2: short;
  public fld_3: short;
  public constructor(p1: short, p2: short, p3: short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: short, p2: short, p3: short): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A9 {
  public fld_1: int;
  public fld_2: int;
  public fld_3: int;
  public constructor(p1: int, p2: int, p3: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: int, p2: int, p3: int): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A10 {
  public fld_1: long;
  public fld_2: long;
  public fld_3: long;
  public constructor(p1: long, p2: long, p3: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: long, p2: long, p3: long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A11 {
  public fld_1: float;
  public fld_2: float;
  public fld_3: float;
  public constructor(p1: float, p2: float, p3: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: float, p2: float, p3: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A12 {
  public fld_1: double;
  public fld_2: double;
  public fld_3: double;
  public constructor(p1: double, p2: double, p3: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: double, p2: double, p3: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A13 {
  public fld_1: int;
  public fld_2: int;
  public constructor(p1: int, p2: int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: int, p2: int): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A14 {
  public fld_1: long;
  public fld_2: long;
  public constructor(p1: long, p2: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: long, p2: long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A15 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A16 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A17 {
  public fld_1: long;
  public fld_2: long;
  public fld_3: long;
  public constructor(p1: long, p2: long, p3: long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: long, p2: long, p3: long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A18 {
  public fld_1: float;
  public fld_2: float;
  public fld_3: float;
  public constructor(p1: float, p2: float, p3: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: float, p2: float, p3: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A19 {
  public fld_1: double;
  public fld_2: double;
  public fld_3: double;
  public constructor(p1: double, p2: double, p3: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: double, p2: double, p3: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A20 {
  public fld_1: float;
  public fld_2: float;
  public constructor(p1: float, p2: float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: float, p2: float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A21 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A22 {
  public fld_1: double;
  public fld_2: double;
  public constructor(p1: double, p2: double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: double, p2: double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A23 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A24 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
    expect(this.fld_3).not().assertNull();
  }
}
class A25 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A26 {
  public fld_1: Floating;
  public fld_2: Floating;
  public constructor(p1: Floating, p2: Floating) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Floating, p2: Floating): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A27 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A28 {
  public fld_1: Floating;
  public fld_2: Floating;
  public constructor(p1: Floating, p2: Floating) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Floating, p2: Floating): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A29 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
    expect(this.fld_3).not().assertNull();
  }
}
class A30 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A31 {
  public fld_1: Integral;
  public fld_2: Integral;
  public constructor(p1: Integral, p2: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Integral, p2: Integral): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A32 {
  public fld_1: Object;
  public fld_2: Object;
  public fld_3: Object;
  public constructor(p1: Object, p2: Object, p3: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Object, p2: Object, p3: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
    expect(this.fld_3).not().assertNull();
  }
}
class A33 {
  public fld_1: Integral;
  public fld_2: Integral;
  public fld_3: Integral;
  public constructor(p1: Integral, p2: Integral, p3: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Integral, p2: Integral, p3: Integral): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
    expect(this.fld_3).not().assertNull();
  }
}
class A34 {
  public fld_1: Object;
  public fld_2: Object;
  public constructor(p1: Object, p2: Object) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Object, p2: Object): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A35 {
  public fld_1: Integral;
  public fld_2: Integral;
  public constructor(p1: Integral, p2: Integral) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Integral, p2: Integral): void {
    expect(this.fld_1).not().assertNull();
    expect(this.fld_2).not().assertNull();
  }
}
class A36 {
  public fld_1: Boolean;
  public fld_2: Boolean;
  public constructor(p1: Boolean, p2: Boolean) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Boolean, p2: Boolean): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A37 {
  public fld_1: Byte;
  public fld_2: Byte;
  public fld_3: Byte;
  public constructor(p1: Byte, p2: Byte, p3: Byte) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Byte, p2: Byte, p3: Byte): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A38 {
  public fld_1: Char;
  public fld_2: Char;
  public fld_3: Char;
  public constructor(p1: Char, p2: Char, p3: Char) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Char, p2: Char, p3: Char): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A39 {
  public fld_1: Short;
  public fld_2: Short;
  public constructor(p1: Short, p2: Short) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Short, p2: Short): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A40 {
  public fld_1: Int;
  public fld_2: Int;
  public fld_3: Int;
  public constructor(p1: Int, p2: Int, p3: Int) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
  }
  public foo(p1: Int, p2: Int, p3: Int): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
  }
}
class A41 {
  public fld_1: Long;
  public fld_2: Long;
  public constructor(p1: Long, p2: Long) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Long, p2: Long): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A42 {
  public fld_1: Float;
  public fld_2: Float;
  public constructor(p1: Float, p2: Float) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Float, p2: Float): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
class A43 {
  public fld_1: Double;
  public fld_2: Double;
  public constructor(p1: Double, p2: Double) {
    this.fld_1 = p1;
    this.fld_2 = p2;
  }
  public foo(p1: Double, p2: Double): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
  }
}
interface I {}
class A44 implements I {}
class A45 {}
class B<A45> {}
class B1<T extends A45> {}
type Barfunc = (a: Object) => Object;
function bar(a: Object): Object {
  return new Object();
}

class A46 {
  public fld_1: boolean;
  public fld_2: byte;
  public fld_3: short;
  public fld_4: int;
  public fld_5: long;
  public fld_6: float;
  public fld_7: double;
  public fld_8: char;
  public fld_9: Boolean|null;
  public fld_10: Byte|null;
  public fld_11: Char|null;
  public fld_12: Error|null;
  public fld_13: Barfunc|null;
  public fld_14: Barfunc[]|null;

  public constructor(
    p1: boolean,
    p2: byte,
    p3: short,
    p4: int,
    p5: long,
    p6: float,
    p7: double,
    p8: char,
    p9: Boolean|null,
    p10: Byte|null,
    p11: Char|null,
    p12: Error|null,
    p13: Barfunc|null,
    p14: Barfunc[]|null
  ) {
    this.fld_1 = p1;
    this.fld_2 = p2;
    this.fld_3 = p3;
    this.fld_4 = p4;
    this.fld_5 = p5;
    this.fld_6 = p6;
    this.fld_7 = p7;
    this.fld_8 = p8;
    this.fld_9 = p9;
    this.fld_10 = p10;
    this.fld_11 = p11;
    this.fld_12 = p12;
    this.fld_13 = p13;
    this.fld_14 = p14;
  }

  public foo(
    p1: boolean,
    p2: byte,
    p3: short,
    p4: int,
    p5: long,
    p6: float,
    p7: double,
    p8: char,
    p9: Boolean|null,
    p10: Byte|null,
    p11: Char|null,
    p12: Error|null,
    p13: Barfunc|null,
    p14: Barfunc[]|null
  ): void {
    expect(this.fld_1).assertEqual(p1);
    expect(this.fld_2).assertEqual(p2);
    expect(this.fld_3).assertEqual(p3);
    expect(this.fld_4).assertEqual(p4);
    expect(this.fld_5).assertEqual(p5);
    expect(this.fld_6).assertEqual(p6);
    expect(this.fld_7).assertEqual(p7);
    expect(this.fld_8).assertEqual(p8);
    expect(this.fld_9).assertEqual(p9);
    expect(this.fld_10).assertEqual(p10);
    expect(this.fld_11).assertEqual(p11);
    expect(this.fld_12).assertEqual(p12);
    expect(this.fld_13).assertEqual(p13);
    expect(this.fld_14).assertEqual(p14);
  }
}
class B2<T> {}
class C<T> extends B2<T> {}
class C1<T> extends B<B<T>> {}
interface J {}
type Func = (a: int, b: string) => Boolean|null;
class C3<T> extends B2<A45> {}
class C4<T> {}
function foo<T extends Byte>(p: T): byte {
  let src: T = p;
  let dst: byte = src;
  return dst;
}
function foo1<T extends Short>(p: T): short {
  let src: T = p;
  let dst: short = src;
  return dst;
}
function foo2<T extends Int>(p: T): int {
  let src: T = p;
  let dst: int = src;
  return dst;
}
function foo3<T extends Long>(p: T): long {
  let src: T = p;
  let dst: long = src;
  return dst;
}
class A47 {
  public fld: short;
  constructor(p: Short) {
    this.fld = p;
  }
  public foo(p: Short): void {
    this.fld = p;
  }
}
class A48 {
  public fld: int;
  constructor(p: Int) {
    this.fld = p;
  }
  public foo(p: Int): void {
    this.fld = p;
  }
}
class A49 {
  public fld: long;
  constructor(p: Long) {
    this.fld = p;
  }
  public foo(p: Long): void {
    this.fld = p;
  }
}
function foo5(p: Object): void {
  expect(p).not().assertNull();
}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function AssignmentLikeContextsTest() {

  describe("AssignmentLikeContextsTest", () => {
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
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0100
     * @tc.name      testAssignmentLikeContexts0001
     * @tc.desc      Assignment contexts allow using aliases: from 'Boolean' to 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Boolean = new Boolean(true);
      let dst_1: boolean = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Boolean = new Boolean(false);
      let dst_2: boolean = src_2;
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0200
     * @tc.name      testAssignmentLikeContexts0002
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Boolean' to 'boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Boolean = new Boolean(true);
      let v2: Boolean = new Boolean(false);
      let c: A = new A(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0300
     * @tc.name      testAssignmentLikeContexts0003
     * @tc.desc      Assignment contexts: Conversion from boolean to Boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: boolean = true;
      let dst_1: Boolean = new Boolean(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: boolean = false;
      let dst_2: Boolean = new Boolean(src_2);
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0400
     * @tc.name      testAssignmentLikeContexts0004
     * @tc.desc      Assignment contexts allow the use of conversion followed by a widening reference conversion: from 'boolean' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: boolean = true;
      let dst_1: Object = src_1 as Object;
      expect(dst_1).not().assertUndefined();

      let src_2: boolean = false;
      let dst_2: Object = src_2 as Object;
      expect(dst_2).not().assertUndefined();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0500
     * @tc.name      testAssignmentLikeContexts0005
     * @tc.desc      A widening reference conversion exists from any reference type S to any reference type T (S is subtype of T)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Object[] = [];
      let dst: Object = src as Object;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0600
     * @tc.name      testAssignmentLikeContexts0006
     * @tc.desc      Widening reference conversion: Object[][] to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Object[][] = [[], []];
      let dst: Object = src as Object;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0700
     * @tc.name      testAssignmentLikeContexts0007
     * @tc.desc      Assignment contexts allow conversion followed by a widening reference conversion (from 'boolean' to 'Object')
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: boolean = true;
      let dst_1: Object = src_1 as Object;
      expect(dst_1).not().assertNull();

      let src_2: boolean = false;
      let dst_2: Object = src_2 as Object;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0800
     * @tc.name      testAssignmentLikeContexts0008
     * @tc.desc      Assignment contexts allow the use of conversion followed by a widening reference conversion: from 'string' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: string = '\u0000';
      let dst_1: Object = src_1 as Object;
      expect(dst_1).not().assertNull();

      let src_2: string = 'X';
      let dst_2: Object = src_2 as Object;
      expect(dst_2).not().assertNull();

      let src_3: string = '\uffff';
      let dst_3: Object = src_3 as Object;
      expect(dst_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_0900
     * @tc.name      testAssignmentLikeContexts0009
     * @tc.desc      A conversion from a type to that same type is permitted for any type: enum
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Color = Color.Red;
      let dst: Color = src;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1000
     * @tc.name      testAssignmentLikeContexts0010
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Short = new Short(src_1.toShort());
      expect(dst_1).assertEqual(src_1.toShort());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Short = new Short(src_2.toShort());
      expect(dst_2).assertEqual(src_2.toShort());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Short = new Short(src_3.toShort());
      expect(dst_3).assertEqual(src_3.toShort());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1100
     * @tc.name      testAssignmentLikeContexts0011
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Int = new Int(src_1.toInt());
      expect(dst_1).assertEqual(src_1.toInt());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Int = new Int(src_2.toInt());
      expect(dst_2).assertEqual(src_2.toInt());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Int = new Int(src_3.toInt());
      expect(dst_3).assertEqual(src_3.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1200
     * @tc.name      testAssignmentLikeContexts0012
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Long = new Long(src_1.toLong());
      expect(dst_1).assertEqual(src_1.toLong());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Long = new Long(src_2.toLong());
      expect(dst_2).assertEqual(src_2.toLong());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Long = new Long(src_3.toLong());
      expect(dst_3).assertEqual(src_3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1300
     * @tc.name      testAssignmentLikeContexts0013
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Float = new Float(src_3.toFloat());
      expect(dst_3).assertEqual(src_3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1400
     * @tc.name      testAssignmentLikeContexts0014
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Byte' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: Double = new Double(src_3.toDouble());
      expect(dst_3).assertEqual(src_3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1500
     * @tc.name      testAssignmentLikeContexts0015
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: Int = new Int(src_1.toInt());
      expect(dst_1).assertEqual(src_1.toInt());

      let src_2: Short = new Short((-128).toShort());
      let dst_2: Int = new Int(src_2.toInt());
      expect(dst_2).assertEqual(src_2.toInt());

      let src_3: Short = new Short((0).toShort());
      let dst_3: Int = new Int(src_3.toInt());
      expect(dst_3).assertEqual(src_3.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1600
     * @tc.name      testAssignmentLikeContexts0016
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: Long = new Long(src_1.toLong());
      expect(dst_1).assertEqual(src_1.toLong());

      let src_2: Short = new Short((-128).toShort());
      let dst_2: Long = new Long(src_2.toLong());
      expect(dst_2).assertEqual(src_2.toLong());

      let src_3: Short = new Short((0).toShort());
      let dst_3: Long = new Long(src_3.toLong());
      expect(dst_3).assertEqual(src_3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1700
     * @tc.name      testAssignmentLikeContexts0017
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Short = new Short((-128).toShort());
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());

      let src_3: Short = new Short((0).toShort());
      let dst_3: Float = new Float(src_3.toFloat());
      expect(dst_3).assertEqual(src_3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1800
     * @tc.name      testAssignmentLikeContexts0018
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Short' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Short = new Short((-128).toShort());
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());

      let src_3: Short = new Short((0).toShort());
      let dst_3: Double = new Double(src_3.toDouble());
      expect(dst_3).assertEqual(src_3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_1900
     * @tc.name      testAssignmentLikeContexts0019
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Int = new Int(127);
      let dst_1: Long = new Long(src_1.toLong());
      expect(dst_1).assertEqual(src_1.toLong());

      let src_2: Int = new Int(32767);
      let dst_2: Long = new Long(src_2.toLong());
      expect(dst_2).assertEqual(src_2.toLong());

      let src_3: Int = new Int(2147483647);
      let dst_3: Long = new Long(src_3.toLong());
      expect(dst_3).assertEqual(src_3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2000
     * @tc.name      testAssignmentLikeContexts0020
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Int = new Int(127);
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Int = new Int(32767);
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2100
     * @tc.name      testAssignmentLikeContexts0021
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Int' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Int = new Int(127);
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Int = new Int(32768);
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2200
     * @tc.name      testAssignmentLikeContexts0022
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Long' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Long = new Long((-1).toLong());
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Long = new Long((0).toLong());
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());

      let src_3: Long = new Long((1).toLong());
      let dst_3: Float = new Float(src_3.toFloat());
      expect(dst_3).assertEqual(src_3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2300
     * @tc.name      testAssignmentLikeContexts0023
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Long' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Long = new Long((-128).toLong());
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Long = new Long((127).toLong());
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2400
     * @tc.name      testAssignmentLikeContexts0024
     * @tc.desc      Assignment contexts followed by a widening primitive conversion: from 'Float' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Float = new Float(1.4e-10f);
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Float = new Float(0.0000001f);
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2500
     * @tc.name      testAssignmentLikeContexts0025
     * @tc.desc      Assignment contexts allow using aliases: from 'Byte' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Byte = new Byte(-128 as byte);
      let dst_1: byte = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Byte = new Byte(0 as byte);
      let dst_2: byte = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Byte = new Byte(127 as byte);
      let dst_3: byte = src_3;
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2600
     * @tc.name      testAssignmentLikeContexts0026
     * @tc.desc      Assignment contexts allow using aliases: from 'Char' to 'char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Char = new Char(c'\u0000');
      let dst_1: char = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Char = new Char(c'X');
      let dst_2: char = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Char = new Char(c'\uffff');
      let dst_3: char = src_3;
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2700
     * @tc.name      testAssignmentLikeContexts0027
     * @tc.desc      Assignment contexts allow using aliases: from 'Short' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Short = new Short((-32768).toShort());
      let dst_1: short = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Short = new Short((-128).toShort());
      let dst_2: short = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Short = new Short((0).toShort());
      let dst_3: short = src_3;
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2800
     * @tc.name      testAssignmentLikeContexts0028
     * @tc.desc      Assignment contexts allow using aliases: from 'Int' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Int = new Int(127);
      let dst_1: int = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Int = new Int(32767);
      let dst_2: int = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Int = new Int(2147483647);
      let dst_3: int = src_3;
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_2900
     * @tc.name      testAssignmentLikeContexts0029
     * @tc.desc      Assignment contexts allow using aliases: from 'Long' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Long = new Long((-9223372036854775808).toLong());
      let dst_1: long = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Long = new Long((9223372036854775807).toLong());
      let dst_2: long = src_2;
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3000
     * @tc.name      testAssignmentLikeContexts0030
     * @tc.desc      Assignment contexts allow using aliases: from 'Float' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Float = new Float(1.401298464324817e-45f);
      let dst_1: float = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Float = new Float(0.00000001f);
      let dst_2: float = src_2;
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3100
     * @tc.name      testAssignmentLikeContexts0031
     * @tc.desc      Assignment contexts allow using aliases: from 'Double' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Double = new Double(-1.401298464324817e-45);
      let dst_1: double = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Double = new Double(1.000000000000001);
      let dst_2: double = src_2;
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3200
     * @tc.name      testAssignmentLikeContexts0032
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Byte' to 'byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A1 = new A1(v1, v2, v3);
      c.foo(v1, v2, v3);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
      expect(c.fld_3).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3300
     * @tc.name      testAssignmentLikeContexts0033
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Char' to 'char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Char = new Char(c'\u0000');
      let v2: Char = new Char(c'X');
      let v3: Char = new Char(c'\uffff');
      let c: A2 = new A2(v1, v2, v3);
      c.foo(v1, v2, v3);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
      expect(c.fld_3).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3400
     * @tc.name      testAssignmentLikeContexts0034
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Short' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A3 = new A3(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3500
     * @tc.name      testAssignmentLikeContexts0035
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Int' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Int = new Int(127);
      let v2: Int = new Int(32767);
      let v3: Int = new Int(Int.MAX_VALUE);
      let c: A4 = new A4(v1, v2, v3);
      c.foo(v1, v2, v3);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
      expect(c.fld_3).assertEqual(v3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3600
     * @tc.name      testAssignmentLikeContexts0036
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Long' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(Long.MIN_VALUE);
      let v2: Long = new Long((9223372036854775807).toLong());
      let c: A5 = new A5(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3700
     * @tc.name      testAssignmentLikeContexts0037
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Float' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Float = new Float(1.401298464324817e-45f);
      let v2: Float = new Float(Float.MAX_VALUE);
      let c: A6 = new A6(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3800
     * @tc.name      testAssignmentLikeContexts0038
     * @tc.desc      Invocation contexts allow using aliases: Aliases 'Double' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Double = new Double(-1.401298464324817e-45);
      let v2: Double = new Double(Double.MAX_VALUE);
      let c: A7 = new A7(v1, v2);
      c.foo(v1, v2);
      expect(c.fld_1).assertEqual(v1);
      expect(c.fld_2).assertEqual(v2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_3900
     * @tc.name      testAssignmentLikeContexts0039
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A8 = new A8(v1.toShort(), v2.toShort(), v3.toShort());
      c.foo(v1.toShort(), v2.toShort(), v3.toShort());
      expect(c.fld_1).assertEqual(v1.toShort());
      expect(c.fld_2).assertEqual(v2.toShort());
      expect(c.fld_3).assertEqual(v3.toShort());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4000
     * @tc.name      testAssignmentLikeContexts0040
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A9 = new A9(v1.toInt(), v2.toInt(), v3.toInt());
      c.foo(v1.toInt(), v2.toInt(), v3.toInt());
      expect(c.fld_1).assertEqual(v1.toInt());
      expect(c.fld_2).assertEqual(v2.toInt());
      expect(c.fld_3).assertEqual(v3.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4100
     * @tc.name      testAssignmentLikeContexts0041
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A10 = new A10(v1.toLong(), v2.toLong(), v3.toLong());
      c.foo(v1.toLong(), v2.toLong(), v3.toLong());
      expect(c.fld_1).assertEqual(v1.toLong());
      expect(c.fld_2).assertEqual(v2.toLong());
      expect(c.fld_3).assertEqual(v3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4200
     * @tc.name      testAssignmentLikeContexts0042
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A11 = new A11(v1.toFloat(), v2.toFloat(), v3.toFloat());
      c.foo(v1.toFloat(), v2.toFloat(), v3.toFloat());
      expect(c.fld_1).assertEqual(v1.toFloat());
      expect(c.fld_2).assertEqual(v2.toFloat());
      expect(c.fld_3).assertEqual(v3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4300
     * @tc.name      testAssignmentLikeContexts0043
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Byte' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Byte = new Byte(-128 as byte);
      let v2: Byte = new Byte(0 as byte);
      let v3: Byte = new Byte(127 as byte);
      let c: A12 = new A12(v1.toDouble(), v2.toDouble(), v3.toDouble());
      c.foo(v1.toDouble(), v2.toDouble(), v3.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
      expect(c.fld_3).assertEqual(v3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4400
     * @tc.name      testAssignmentLikeContexts0044
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A13 = new A13(v1.toInt(), v2.toInt());
      c.foo(v1.toInt(), v2.toInt());
      expect(c.fld_1).assertEqual(v1.toInt());
      expect(c.fld_2).assertEqual(v2.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4500
     * @tc.name      testAssignmentLikeContexts0045
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A14 = new A14(v1.toLong(), v2.toLong());
      c.foo(v1.toLong(), v2.toLong());
      expect(c.fld_1).assertEqual(v1.toLong());
      expect(c.fld_2).assertEqual(v2.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4600
     * @tc.name      testAssignmentLikeContexts0046
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A15 = new A15(v1.toFloat(), v2.toFloat());
      c.foo(v1.toFloat(), v2.toFloat());
      expect(c.fld_1).assertEqual(v1.toFloat());
      expect(c.fld_2).assertEqual(v2.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4700
     * @tc.name      testAssignmentLikeContexts0047
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Short' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Short = new Short(Short.MIN_VALUE);
      let v2: Short = new Short((255).toShort());
      let c: A16 = new A16(v1.toDouble(), v2.toDouble());
      c.foo(v1.toDouble(), v2.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4800
     * @tc.name      testAssignmentLikeContexts0048
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Int = new Int(127);
      let v2: Int = new Int(32767);
      let v3: Int = new Int(Int.MAX_VALUE);
      let c: A17 = new A17(v1.toLong(), v2.toLong(), v3.toLong());
      c.foo(v1.toLong(), v2.toLong(), v3.toLong());
      expect(c.fld_1).assertEqual(v1.toLong());
      expect(c.fld_2).assertEqual(v2.toLong());
      expect(c.fld_3).assertEqual(v3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_4900
     * @tc.name      testAssignmentLikeContexts0049
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Int = new Int(127);
      let v2: Int = new Int(32767);
      let v3: Int = new Int(Int.MAX_VALUE);
      let c: A18 = new A18(v1.toFloat(), v2.toFloat(), v3.toFloat());
      c.foo(v1.toFloat(), v2.toFloat(), v3.toFloat());
      expect(c.fld_1).assertEqual(v1.toFloat());
      expect(c.fld_2).assertEqual(v2.toFloat());
      expect(c.fld_3).assertEqual(v3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5000
     * @tc.name      testAssignmentLikeContexts0050
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Int' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Int = new Int(127);
      let v2: Int = new Int(32767);
      let v3: Int = new Int(Int.MAX_VALUE);
      let c: A19 = new A19(v1.toDouble(), v2.toDouble(), v3.toDouble());
      c.foo(v1.toDouble(), v2.toDouble(), v3.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
      expect(c.fld_3).assertEqual(v3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5100
     * @tc.name      testAssignmentLikeContexts0051
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Long' to 'float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(Long.MIN_VALUE);
      let v2: Long = new Long((9223372036854775807).toLong());
      let c: A20 = new A20(v1.toFloat(), v2.toFloat());
      c.foo(v1.toFloat(), v2.toFloat());
      expect(c.fld_1).assertEqual(v1.toFloat());
      expect(c.fld_2).assertEqual(v2.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5200
     * @tc.name      testAssignmentLikeContexts0052
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Long' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Long = new Long(Long.MIN_VALUE);
      let v2: Long = new Long((9223372036854775807).toLong());
      let c: A21 = new A21(v1.toDouble(), v2.toDouble());
      c.foo(v1.toDouble(), v2.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5300
     * @tc.name      testAssignmentLikeContexts0053
     * @tc.desc      Invocation contexts followed by a widening primitive conversion: from 'Float' to 'double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: Float = new Float(1.401298464324817e-45f);
      let v2: Float = new Float(Float.MAX_VALUE);
      let c: A22 = new A22(v1.toDouble(), v2.toDouble());
      c.foo(v1.toDouble(), v2.toDouble());
      expect(c.fld_1).assertEqual(v1.toDouble());
      expect(c.fld_2).assertEqual(v2.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5400
     * @tc.name      testAssignmentLikeContexts0054
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Char = new Char(c'\u0000');
      let dst_1: Int = new Int(src_1.toInt());
      expect(dst_1).assertEqual(src_1.toInt());

      let src_2: Char = new Char(c'X');
      let dst_2: Int = new Int(src_2.toInt());
      expect(dst_2).assertEqual(src_2.toInt());

      let src_3: Char = new Char(c'\uffff');
      let dst_3: Int = new Int(src_3.toInt());
      expect(dst_3).assertEqual(src_3.toInt());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5500
     * @tc.name      testAssignmentLikeContexts0055
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Char = new Char(c'\u0000');
      let dst_1: Long = new Long(src_1.toLong());
      expect(dst_1).assertEqual(src_1.toLong());

      let src_2: Char = new Char(c'X');
      let dst_2: Long = new Long(src_2.toLong());
      expect(dst_2).assertEqual(src_2.toLong());

      let src_3: Char = new Char(c'\uffff');
      let dst_3: Long = new Long(src_3.toLong());
      expect(dst_3).assertEqual(src_3.toLong());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5600
     * @tc.name      testAssignmentLikeContexts0056
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Char = new Char(c'\u0000');
      let dst_1: Float = new Float(src_1.toFloat());
      expect(dst_1).assertEqual(src_1.toFloat());

      let src_2: Char = new Char(c'X');
      let dst_2: Float = new Float(src_2.toFloat());
      expect(dst_2).assertEqual(src_2.toFloat());

      let src_3: Char = new Char(c'\uffff');
      let dst_3: Float = new Float(src_3.toFloat());
      expect(dst_3).assertEqual(src_3.toFloat());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5700
     * @tc.name      testAssignmentLikeContexts0057
     * @tc.desc      Assignment contexts followed by a widening primitive conversion (negative): from 'Char' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Char = new Char(c'\u0000');
      let dst_1: Double = new Double(src_1.toDouble());
      expect(dst_1).assertEqual(src_1.toDouble());

      let src_2: Char = new Char(c'X');
      let dst_2: Double = new Double(src_2.toDouble());
      expect(dst_2).assertEqual(src_2.toDouble());

      let src_3: Char = new Char(c'\uffff');
      let dst_3: Double = new Double(src_3.toDouble());
      expect(dst_3).assertEqual(src_3.toDouble());
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5800
     * @tc.name      testAssignmentLikeContexts0058
     * @tc.desc      Assignment contexts allow the assignment for arrays if they are same primitive types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: Boolean[] = new Boolean[1](false);
      let dst_1: Boolean[] = src_1;
      expect(dst_1).assertEqual(src_1);

      let src_2: Byte[] = new Byte[1](0);
      let dst_2: Byte[] = src_2;
      expect(dst_2).assertEqual(src_2);

      let src_3: Char[] = new Char[1]((0).toChar());
      let dst_3: Char[] = src_3;
      expect(dst_3).assertEqual(src_3);

      let src_4: Short[] = new Short[1](0);
      let dst_4: Short[] = src_4;
      expect(dst_4).assertEqual(src_4);

      let src_5: Int[] = new Int[1](0);
      let dst_5: Int[] = src_5;
      expect(dst_5).assertEqual(src_5);

      let src_6: Long[] = new Long[1](0);
      let dst_6: Long[] = src_6;
      expect(dst_6).assertEqual(src_6);

      let src_7: Float[] = new Float[1](0);
      let dst_7: Float[] = src_7;
      expect(dst_7).assertEqual(src_7);

      let src_8: Double[] = new Double[1](0);
      let dst_8: Double[] = src_8;
      expect(dst_8).assertEqual(src_8);

      let src_9: boolean[] = new boolean[1](false);
      let dst_9: boolean[] = src_9;
      expect(dst_9).assertEqual(src_9);

      let src_10: byte[] = new byte[1](0);
      let dst_10: byte[] = src_10;
      expect(dst_10).assertEqual(src_10);

      let src_11: char[] = new char[1]((0).toChar());
      let dst_11: char[] = src_11;
      expect(dst_11).assertEqual(src_11);

      let src_12: short[] = new short[1](0);
      let dst_12: short[] = src_12;
      expect(dst_12).assertEqual(src_12);

      let src_13: int[] = new int[1](0);
      let dst_13: int[] = src_13;
      expect(dst_13).assertEqual(src_13);

      let src_14: long[] = new long[1](0);
      let dst_14: long[] = src_14;
      expect(dst_14).assertEqual(src_14);

      let src_15: float[] = new float[1](0);
      let dst_15: float[] = src_15;
      expect(dst_15).assertEqual(src_15);

      let src_16: double[] = new double[1](0);
      let dst_16: double[] = src_16;
      expect(dst_16).assertEqual(src_16);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_5900
     * @tc.name      testAssignmentLikeContexts0059
     * @tc.desc      Assignment contexts of a primitive types: Assignment from Boolean to boolean (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: FixedArray<Boolean> = new FixedArray<Boolean>(1);
      let dst_1: FixedArray<boolean> = new FixedArray<boolean>(1);
      // 预期编译阶段校验类型兼容性
      dst_1 = src_1 as FixedArray<boolean>;
      expect(dst_1.length).assertEqual(src_1.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6000
     * @tc.name      testAssignmentLikeContexts0060
     * @tc.desc      Assignment contexts of a primitive types: Assignment from Byte to byte (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_2: FixedArray<Byte> = new FixedArray<Byte>(1);
      let dst_2: FixedArray<byte> = new FixedArray<byte>(1);
      dst_2 = src_2 as FixedArray<byte>;
      expect(dst_2.length).assertEqual(src_2.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6100
     * @tc.name      testAssignmentLikeContexts0061
     * @tc.desc      Assignment contexts of a primitive types: Assignment from char to Char (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_11: FixedArray<char> = new FixedArray<char>(1);
      let dst_11: FixedArray<Char> = new FixedArray<Char>(1);
      dst_11 = src_11 as FixedArray<Char>;
      expect(dst_11.length).assertEqual(src_11.length);
    });
    
    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6200
     * @tc.name      testAssignmentLikeContexts0062
     * @tc.desc     Assignment contexts of a primitive types: Assignment from short to Short (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_12: FixedArray<short> = new FixedArray<short>(1);
      let dst_12: FixedArray<Short> = new FixedArray<Short>(1);
      dst_12 = src_12 as FixedArray<Short>;
      expect(dst_12.length).assertEqual(src_12.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6300
     * @tc.name      testAssignmentLikeContexts0063
     * @tc.desc     Assignment contexts of a primitive types: Assignment from int to Int (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_13: FixedArray<int> = new FixedArray<int>(1);
      let dst_13: FixedArray<Int> = new FixedArray<Int>(1);
      dst_13 = src_13 as FixedArray<Int>;
      expect(dst_13.length).assertEqual(src_13.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6400
     * @tc.name      testAssignmentLikeContexts0064
     * @tc.desc     Assignment contexts of a primitive types: Assignment from long to Long (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_14: FixedArray<long> = new FixedArray<long>(1);
      let dst_14: FixedArray<Long> = new FixedArray<Long>(1);
      dst_14 = src_14 as FixedArray<Long>;
      expect(dst_14.length).assertEqual(src_14.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6500
     * @tc.name      testAssignmentLikeContexts0065
     * @tc.desc     Assignment contexts of a primitive types: Assignment from float to Float (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_15: FixedArray<float> = new FixedArray<float>(1);
      let dst_15: FixedArray<Float> = new FixedArray<Float>(1);
      dst_15 = src_15 as FixedArray<Float>;
      expect(dst_15.length).assertEqual(src_15.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6600
     * @tc.name      testAssignmentLikeContexts0066
     * @tc.desc     Assignment contexts of a primitive types: Assignment from double to Double (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_16: FixedArray<double> = new FixedArray<double>(1);
      let dst_16: FixedArray<Double> = new FixedArray<Double>(1);
      dst_16 = src_16 as FixedArray<Double>;
      expect(dst_16.length).assertEqual(src_16.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6700
     * @tc.name      testAssignmentLikeContexts0067
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Char to char (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_3: FixedArray<Char> = new FixedArray<Char>(1);
      let dst_3: FixedArray<char> = new FixedArray<char>(1);
      dst_3 = src_3 as FixedArray<char>;
      expect(dst_3.length).assertEqual(src_3.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6800
     * @tc.name      testAssignmentLikeContexts0068
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Short to short (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_4: FixedArray<Short> = new FixedArray<Short>(1);
      let dst_4: FixedArray<short> = new FixedArray<short>(1);
      dst_4 = src_4 as FixedArray<short>;
      expect(dst_4.length).assertEqual(src_4.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_6900
     * @tc.name      testAssignmentLikeContexts0069
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Int to int (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_5: FixedArray<Int> = new FixedArray<Int>(1);
      let dst_5: FixedArray<int> = new FixedArray<int>(1);
      dst_5 = src_5 as FixedArray<int>;
      expect(dst_5.length).assertEqual(src_5.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7000
     * @tc.name      testAssignmentLikeContexts0070
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Long to long (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_6: FixedArray<Long> = new FixedArray<Long>(1);
      let dst_6: FixedArray<long> = new FixedArray<long>(1);
      dst_6 = src_6 as FixedArray<long>;
      expect(dst_6.length).assertEqual(src_6.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7100
     * @tc.name      testAssignmentLikeContexts0071
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Float to float (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_7: FixedArray<Float> = new FixedArray<Float>(1);
      let dst_7: FixedArray<float> = new FixedArray<float>(1);
      dst_7 = src_7 as FixedArray<float>;
      expect(dst_7.length).assertEqual(src_7.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7200
     * @tc.name      testAssignmentLikeContexts0072
     * @tc.desc     Assignment contexts of a primitive types: Assignment from Double to double (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_8: FixedArray<Double> = new FixedArray<Double>(1);
      let dst_8: FixedArray<double> = new FixedArray<double>(1);
      dst_8 = src_8 as FixedArray<double>;
      expect(dst_8.length).assertEqual(src_8.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7300
     * @tc.name      testAssignmentLikeContexts0073
     * @tc.desc     Assignment contexts of a primitive types: Assignment from boolean to Boolean (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_9: FixedArray<boolean> = new FixedArray<boolean>(1);
      let dst_9: FixedArray<Boolean> = new FixedArray<Boolean>(1);
      dst_9 = src_9 as FixedArray<Boolean>;
      expect(dst_9.length).assertEqual(src_9.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7400
     * @tc.name      testAssignmentLikeContexts0074
     * @tc.desc     Assignment contexts of a primitive types: Assignment from byte to Byte (FixedArray)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     * @tc.tags      compile-only
     */
    it("testAssignmentLikeContexts0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_10: FixedArray<byte> = new FixedArray<byte>(1);
      let dst_10: FixedArray<Byte> = new FixedArray<Byte>(1);
      dst_10 = src_10 as FixedArray<Byte>;
      expect(dst_10.length).assertEqual(src_10.length);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7500
     * @tc.name      testAssignmentLikeContexts0075
     * @tc.desc     Assignment contexts: Conversion from byte to Byte
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: byte = -128 as byte;
      let dst_1: Byte = new Byte(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: byte = 0 as byte;
      let dst_2: Byte = new Byte(src_2);
      expect(dst_2).assertEqual(src_2);

      let src_3: byte = 127 as byte;
      let dst_3: Byte = new Byte(src_3);
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7600
     * @tc.name      testAssignmentLikeContexts0076
     * @tc.desc     Assignment contexts: Conversion from char to Char
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: char = c'\u0000';
      let dst_1: Char = new Char(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: char = c'X';
      let dst_2: Char = new Char(src_2);
      expect(dst_2).assertEqual(src_2);

      let src_3: char = c'\uffff';
      let dst_3: Char = new Char(src_3);
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7700
     * @tc.name      testAssignmentLikeContexts0077
     * @tc.desc     Assignment contexts: Conversion from short to Short
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: short = Short.MIN_VALUE;
      let dst_1: Short = new Short(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: short = (255).toShort();
      let dst_2: Short = new Short(src_2);
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7800
     * @tc.name      testAssignmentLikeContexts0078
     * @tc.desc     Assignment contexts: Conversion from int to Int
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: int = 127;
      let dst_1: Int = new Int(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: int = 32767;
      let dst_2: Int = new Int(src_2);
      expect(dst_2).assertEqual(src_2);

      let src_3: int = Int.MAX_VALUE;
      let dst_3: Int = new Int(src_3);
      expect(dst_3).assertEqual(src_3);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_7900
     * @tc.name      testAssignmentLikeContexts0079
     * @tc.desc     Assignment contexts: Conversion from long to Long
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: long = Long.MIN_VALUE;
      let dst_1: Long = new Long(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: long = (9223372036854775807).toLong();
      let dst_2: Long = new Long(src_2);
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8000
     * @tc.name      testAssignmentLikeContexts0080
     * @tc.desc     Assignment contexts: Conversion from float to Float
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: float = 1.401298464324817e-45f;
      let dst_1: Float = new Float(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: float = Float.MAX_VALUE;
      let dst_2: Float = new Float(src_2);
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8100
     * @tc.name      testAssignmentLikeContexts0081
     * @tc.desc     Assignment contexts: Conversion from double to Double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: double = -1.401298464324817e-45;
      let dst_1: Double = new Double(src_1);
      expect(dst_1).assertEqual(src_1);

      let src_2: double = Double.MAX_VALUE;
      let dst_2: Double = new Double(src_2);
      expect(dst_2).assertEqual(src_2);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8200
     * @tc.name      testAssignmentLikeContexts0082
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'boolean' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: boolean = true;
      let v2: boolean = false;
      let c: A23 = new A23(new Boolean(v1), new Boolean(v2));
      c.foo(new Boolean(v1), new Boolean(v2));
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8300
     * @tc.name      testAssignmentLikeContexts0083
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'byte' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: byte = -128 as byte;
      let v2: byte = 0 as byte;
      let v3: byte = 127 as byte;
      let c: A24 = new A24(new Byte(v1), new Byte(v2), new Byte(v3));
      c.foo(new Byte(v1), new Byte(v2), new Byte(v3));
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
      expect(c.fld_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8400
     * @tc.name      testAssignmentLikeContexts0084
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'float' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: float = 1.401298464324817e-45f;
      let v2: float = Float.MAX_VALUE;
      let c: A25 = new A25(new Float(v1), new Float(v2));
      c.foo(new Float(v1), new Float(v2));
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8500
     * @tc.name      testAssignmentLikeContexts0085
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'float' to 'Floating'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: float = 1.401298464324817e-45f;
      let v2: float = Float.MAX_VALUE;
      let c: A26 = new A26(new Float(v1) as Floating, new Float(v2) as Floating);
      c.foo(new Float(v1) as Floating, new Float(v2) as Floating);
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8600
     * @tc.name      testAssignmentLikeContexts0086
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'double' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = -1.401298464324817e-45;
      let v2: double = Double.MAX_VALUE;
      let c: A27 = new A27(new Double(v1), new Double(v2));
      c.foo(new Double(v1), new Double(v2));
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8700
     * @tc.name      testAssignmentLikeContexts0087
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'double' to 'Floating'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = -1.401298464324817e-45;
      let v2: double = Double.MAX_VALUE;
      let c: A28 = new A28(new Double(v1) as Floating, new Double(v2) as Floating);
      c.foo(new Double(v1) as Floating, new Double(v2) as Floating);
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8800
     * @tc.name      testAssignmentLikeContexts0088
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'char' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: char = c'\u0000';
      let v2: char = c'X';
      let v3: char = c'\uffff';
      let c: A29 = new A29(new Char(v1), new Char(v2), new Char(v3));
      c.foo(new Char(v1), new Char(v2), new Char(v3));
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
      expect(c.fld_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_8900
     * @tc.name      testAssignmentLikeContexts0089
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'short' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: short = Short.MIN_VALUE;
      let v2: short = (255).toShort();
      let c: A30 = new A30(new Short(v1), new Short(v2));
      c.foo(new Short(v1), new Short(v2));
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9000
     * @tc.name      testAssignmentLikeContexts0090
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'short' to 'Integral'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: short = Short.MIN_VALUE;
      let v2: short = (255).toShort();
      let c: A31 = new A31(new Short(v1) as Integral, new Short(v2) as Integral);
      c.foo(new Short(v1) as Integral, new Short(v2) as Integral);
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9100
     * @tc.name      testAssignmentLikeContexts0091
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'int' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: int = 127;
      let v2: int = 32767;
      let v3: int = Int.MAX_VALUE;
      let c: A32 = new A32(new Int(v1), new Int(v2), new Int(v3));
      c.foo(new Int(v1), new Int(v2), new Int(v3));
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
      expect(c.fld_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9200
     * @tc.name      testAssignmentLikeContexts0092
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'int' to 'Integral'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: int = 127;
      let v2: int = 32767;
      let v3: int = Int.MAX_VALUE;
      let c: A33 = new A33(new Int(v1) as Integral, new Int(v2) as Integral, new Int(v3) as Integral);
      c.foo(new Int(v1) as Integral, new Int(v2) as Integral, new Int(v3) as Integral);
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
      expect(c.fld_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9300
     * @tc.name      testAssignmentLikeContexts0093
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'long' to 'Object'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: long = Long.MIN_VALUE;
      let v2: long = (9223372036854775807).toLong();
      let c: A34 = new A34(new Long(v1), new Long(v2));
      c.foo(new Long(v1), new Long(v2));
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9400
     * @tc.name      testAssignmentLikeContexts0094
     * @tc.desc     Invocation contexts allow a boxing conversion followed by a widening reference conversion: Boxing conversion from 'long' to 'Integral'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: long = Long.MIN_VALUE;
      let v2: long = (9223372036854775807).toLong();
      let c: A35 = new A35(new Long(v1) as Integral, new Long(v2) as Integral);
      c.foo(new Long(v1) as Integral, new Long(v2) as Integral);
      expect(c.fld_1).not().assertNull();
      expect(c.fld_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9500
     * @tc.name      testAssignmentLikeContexts0095
     * @tc.desc     Invocation call contexts: call assignment from 'boolean' to 'Boolean'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: boolean = true;
      let v2: boolean = false;
      let c: A36 = new A36(new Boolean(v1), new Boolean(v2));
      c.foo(new Boolean(v1), new Boolean(v2));
      expect(c.fld_1).assertEqual(new Boolean(v1));
      expect(c.fld_2).assertEqual(new Boolean(v2));
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9600
     * @tc.name      testAssignmentLikeContexts0096
     * @tc.desc     Invocation call contexts: call assignment from 'byte' to 'Byte'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: byte = -128 as byte;
      let v2: byte = 0 as byte;
      let v3: byte = 127 as byte;
      let c: A37 = new A37(new Byte(v1), new Byte(v2), new Byte(v3));
      c.foo(new Byte(v1), new Byte(v2), new Byte(v3));
      expect(c.fld_1).assertEqual(new Byte(v1));
      expect(c.fld_2).assertEqual(new Byte(v2));
      expect(c.fld_3).assertEqual(new Byte(v3));
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9700
     * @tc.name      testAssignmentLikeContexts0097
     * @tc.desc     Invocation call contexts: call assignment from 'char' to 'Char'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: char = c'\u0000';
      let v2: char = c'X';
      let v3: char = c'\uffff';
      let c: A38 = new A38(new Char(v1), new Char(v2), new Char(v3));
      c.foo(new Char(v1), new Char(v2), new Char(v3));
      expect(c.fld_1).assertEqual(new Char(v1));
      expect(c.fld_2).assertEqual(new Char(v2));
      expect(c.fld_3).assertEqual(new Char(v3));
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9800
     * @tc.name      testAssignmentLikeContexts0098
     * @tc.desc     Invocation call contexts: call assignment from 'short' to 'Short'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: short = Short.MIN_VALUE;
      let v2: short = (255).toShort();
      let c: A39 = new A39(new Short(v1), new Short(v2));
      c.foo(new Short(v1), new Short(v2));
      expect(c.fld_1).assertEqual(new Short(v1));
      expect(c.fld_2).assertEqual(new Short(v2));
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_9900
     * @tc.name      testAssignmentLikeContexts0099
     * @tc.desc     Invocation call contexts: call assignment from 'int' to 'Int'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: int = 127;
      let v2: int = 32767;
      let v3: int = Int.MAX_VALUE;
      let c: A40 = new A40(new Int(v1), new Int(v2), new Int(v3));
      c.foo(new Int(v1), new Int(v2), new Int(v3));
      expect(c.fld_1).assertEqual(new Int(v1));
      expect(c.fld_2).assertEqual(new Int(v2));
      expect(c.fld_3).assertEqual(new Int(v3));
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10000
     * @tc.name      testAssignmentLikeContexts0100
     * @tc.desc     Invocation call contexts: call assignment from 'long' to 'Long'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: long = Long.MIN_VALUE;
      let v2: long = (9223372036854775807).toLong();
      let c: A41 = new A41(new Long(v1), new Long(v2));
      c.foo(new Long(v1), new Long(v2));
      expect(c.fld_1).assertEqual(new Long(v1));
      expect(c.fld_2).assertEqual(new Long(v2));
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10100
     * @tc.name      testAssignmentLikeContexts0101
     * @tc.desc     Invocation call contexts: call assignment from 'float' to 'Float'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: float = 1.401298464324817e-45f;
      let v2: float = Float.MAX_VALUE;
      let c: A42 = new A42(new Float(v1), new Float(v2));
      c.foo(new Float(v1), new Float(v2));
      expect(c.fld_1).assertEqual(new Float(v1));
      expect(c.fld_2).assertEqual(new Float(v2));
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10200
     * @tc.name      testAssignmentLikeContexts0102
     * @tc.desc     Invocation call contexts: call assignment from 'double' to 'Double'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v1: double = -1.401298464324817e-45;
      let v2: double = Double.MAX_VALUE;
      let c: A43 = new A43(new Double(v1), new Double(v2));
      c.foo(new Double(v1), new Double(v2));
      expect(c.fld_1).assertEqual(new Double(v1));
      expect(c.fld_2).assertEqual(new Double(v2));
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10300
     * @tc.name      testAssignmentLikeContexts0103
     * @tc.desc     Assignment contexts allow the use of the identity conversion (basic types and objects)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 基本类型身份转换
      let src_1: boolean = false;
      let dst_1: boolean = src_1;
      expect(src_1).assertEqual(dst_1);

      let src_2: byte = 127;
      let dst_2: byte = src_2;
      expect(src_2).assertEqual(dst_2);

      let src_3: short = 32767;
      let dst_3: short = src_3;
      expect(src_3).assertEqual(dst_3);

      let src_4: int = 2147483647;
      let dst_4: int = src_4;
      expect(src_4).assertEqual(dst_4);

      let src_5: long = 9223372036854775807;
      let dst_5: long = src_5;
      expect(src_5).assertEqual(dst_5);

      let src_6: float = 3.40282346e38f;
      let dst_6: float = src_6;
      expect(src_6).assertEqual(dst_6);

      let src_7: double = 1.7976931348623157e308;
      let dst_7: double = src_7;
      expect(src_7).assertEqual(dst_7);

      let src_8: char = c'A';
      let dst_8: char = src_8;
      expect(src_8).assertEqual(dst_8);

      // 包装类型身份转换
      let src_9: Boolean = new Boolean(false);
      let dst_9: Boolean = src_9;
      expect(src_9).assertEqual(dst_9);

      let src_10: Byte = new Byte(new Int(1).toByte());
      let dst_10: Byte = src_10;
      expect(src_10).assertEqual(dst_10);

      let src_11: Char = new Char(c'A');
      let dst_11: Char = src_11;
      expect(src_11).assertEqual(dst_11);

      // 引用类型身份转换
      let src_12: Error = new Error("msg");
      let dst_12: Error = src_12;
      expect(src_12).assertEqual(dst_12);

      let src_13: char[] = [c'A', c'B'];
      let dst_13: char[] = src_13;
      expect(src_13).assertEqual(dst_13);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10400
     * @tc.name      testAssignmentLikeContexts0104
     * @tc.desc     A conversion from a type to that same type is permitted for any type (extended cases)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 数值类型身份转换
      let src_1: long = Long.MAX_VALUE;
      let dst_1: long = src_1;
      expect(src_1).assertEqual(dst_1);

      let src_2: float = Float.POSITIVE_INFINITY;
      let dst_2: float = src_2;
      expect(src_2).assertEqual(dst_2);

      // 函数类型身份转换
      let src_3: (a: Boolean) => Object[] = (a: Boolean): Object[] => { return [a]; };
      let dst_3: (a: Boolean) => Object[] = src_3;
      expect(src_3).assertEqual(dst_3);

      // 可空类型身份转换
      let src_4: String|null = null;
      let dst_4: String|null = src_4;
      expect(src_4).assertEqual(dst_4);

      let src_5: ((a: Object) => Object)[]|null = [];
      let dst_5: ((a: Object) => Object)[]|null = src_5;
      expect(src_5).assertEqual(dst_5);

      // 多维数组身份转换
      let src_6: (double|null)[][] = [[1.0, 2.0, null]];
      let dst_6: (double|null)[][] = src_6;
      expect(src_6).assertEqual(dst_6);

      // 接口类型身份转换

      let src_7: I = new A44();
      let dst_7: I = src_7;
      expect(src_7).assertEqual(dst_7);

      // 枚举类型身份转换
      let src_8: Color = Color.Red;
      let dst_8: Color = src_8;
      expect(src_8).assertEqual(dst_8);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10500
     * @tc.name      testAssignmentLikeContexts0105
     * @tc.desc     A conversion from a type to that same type is permitted for any type (generic class with type parameter as class)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: B<A45> = new B<A45>();
      let dst: B<A45> = src;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10600
     * @tc.name      testAssignmentLikeContexts0106
     * @tc.desc     A conversion from a type to that same type is permitted for any type (generic class with bounded type parameter)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: B1<A45> = new B1<A45>();
      let dst: B1<A45> = src;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10700
     * @tc.name      testAssignmentLikeContexts0107
     * @tc.desc     Invocation contexts allow an identity conversion (multiple types including functions and arrays)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: A46 = new A46(
        false,
        127 as byte,
        (32767).toShort(),
        2147483647,
        (9223372036854775807).toLong(),
        3.40282346e38f,
      1.7976931348623157e308,
      c'A',
      new Boolean(false),
      new Byte(new Int(1).toByte()),
      new Char(c'A'),
      new Error("msg"),
      bar,
      [bar]
      );
      c.foo(
        c.fld_1,
        c.fld_2,
        c.fld_3,
        c.fld_4,
        c.fld_5,
        c.fld_6,
        c.fld_7,
        c.fld_8,
        c.fld_9,
        c.fld_10,
        c.fld_11,
        c.fld_12,
        c.fld_13,
        c.fld_14
      );
      expect(c.fld_1).assertEqual(false);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10800
     * @tc.name      testAssignmentLikeContexts0108
     * @tc.desc     A value of the null type may be assigned to any reference type (basic reference types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 包装类型及数组、函数类型的 null 赋值
      let v_Boolean: Boolean|null = null;
      expect(v_Boolean).assertEqual(null);
      let a_Boolean: (Boolean[])|null = null;
      expect(a_Boolean).assertEqual(null);
      let f_Boolean: ((p: Boolean) => Boolean)|null = null;
      expect(f_Boolean).assertEqual(null);

      let v_Byte: Byte|null = null;
      expect(v_Byte).assertEqual(null);
      let a_Byte: (Byte[])|null = null;
      expect(a_Byte).assertEqual(null);
      let f_Byte: ((p: Byte) => Byte)|null = null;
      expect(f_Byte).assertEqual(null);

      let v_Char: Char|null = null;
      expect(v_Char).assertEqual(null);
      let a_Char: (Char[])|null = null;
      expect(a_Char).assertEqual(null);
      let f_Char: ((p: Char) => Char)|null = null;
      expect(f_Char).assertEqual(null);

      let v_Double: Double|null = null;
      expect(v_Double).assertEqual(null);
      let a_Double: (Double[])|null = null;
      expect(a_Double).assertEqual(null);
      let f_Double: ((p: Double) => Double)|null = null;
      expect(f_Double).assertEqual(null);

      let v_Float: Float|null = null;
      expect(v_Float).assertEqual(null);
      let a_Float: (Float[])|null = null;
      expect(a_Float).assertEqual(null);
      let f_Float: ((p: Float) => Float)|null = null;
      expect(f_Float).assertEqual(null);

      let v_Int: Int|null = null;
      expect(v_Int).assertEqual(null);
      let a_Int: (Int[])|null = null;
      expect(a_Int).assertEqual(null);
      let f_Int: ((p: Int) => Int)|null = null;
      expect(f_Int).assertEqual(null);

      let v_Long: Long|null = null;
      expect(v_Long).assertEqual(null);
      let a_Long: (Long[])|null = null;
      expect(a_Long).assertEqual(null);
      let f_Long: ((p: Long) => Long)|null = null;
      expect(f_Long).assertEqual(null);

      let v_Short: Short|null = null;
      expect(v_Short).assertEqual(null);
      let a_Short: (Short[])|null = null;
      expect(a_Short).assertEqual(null);
      let f_Short: ((p: Short) => Short)|null = null;
      expect(f_Short).assertEqual(null);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_10900
     * @tc.name      testAssignmentLikeContexts0109
     * @tc.desc     A value of the null type may be assigned to any reference type (system classes and error types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v_Console: Console|null = null;
      expect(v_Console).assertEqual(null);
      let a_Console: (Console[])|null = null;
      expect(a_Console).assertEqual(null);
      let f_Console: ((p: Console) => Console)|null = null;
      expect(f_Console).assertEqual(null);

      let v_Floating: Floating|null = null;
      expect(v_Floating).assertEqual(null);
      let a_Floating: (Floating[])|null = null;
      expect(a_Floating).assertEqual(null);
      let f_Floating: ((p: Floating) => Floating)|null = null;
      expect(f_Floating).assertEqual(null);

      let v_Integral: Integral|null = null;
      expect(v_Integral).assertEqual(null);
      let a_Integral: (Integral[])|null = null;
      expect(a_Integral).assertEqual(null);
      let f_Integral: ((p: Integral) => Integral)|null = null;
      expect(f_Integral).assertEqual(null);

      let v_OutOfMemoryError: OutOfMemoryError|null = null;
      expect(v_OutOfMemoryError).assertEqual(null);
      let a_OutOfMemoryError: (OutOfMemoryError[])|null = null;
      expect(a_OutOfMemoryError).assertEqual(null);
      let f_OutOfMemoryError: ((p: OutOfMemoryError) => OutOfMemoryError)|null = null;
      expect(f_OutOfMemoryError).assertEqual(null);

      let v_AssertionError: AssertionError|null = null;
      expect(v_AssertionError).assertEqual(null);
      let a_AssertionError: (AssertionError[])|null = null;
      expect(a_AssertionError).assertEqual(null);
      let f_AssertionError: ((p: AssertionError) => AssertionError)|null = null;
      expect(f_AssertionError).assertEqual(null);

      let v_DivideByZeroError: DivideByZeroError|null = null;
      expect(v_DivideByZeroError).assertEqual(null);
      let a_DivideByZeroError: (DivideByZeroError[])|null = null;
      expect(a_DivideByZeroError).assertEqual(null);
      let f_DivideByZeroError: ((p: DivideByZeroError) => DivideByZeroError)|null = null;
      expect(f_DivideByZeroError).assertEqual(null);

      let v_NullPointerError: NullPointerError|null = null;
      expect(v_NullPointerError).assertEqual(null);
      let a_NullPointerError: (NullPointerError[])|null = null;
      expect(a_NullPointerError).assertEqual(null);
      let f_NullPointerError: ((p: NullPointerError) => NullPointerError)|null = null;
      expect(f_NullPointerError).assertEqual(null);

      let v_Error: Error|null = null;
      expect(v_Error).assertEqual(null);
      let a_Error: (Error[])|null = null;
      expect(a_Error).assertEqual(null);
      let f_Error: ((p: Error) => Error)|null = null;
      expect(f_Error).assertEqual(null);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11000
     * @tc.name      testAssignmentLikeContexts0110
     * @tc.desc     A value of the null type may be assigned to any reference type (string and utility classes)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v_String: String|null = null;
      expect(v_String).assertEqual(null);
      let a_String: (String[])|null = null;
      expect(a_String).assertEqual(null);
      let f_String: ((p: String) => String)|null = null;
      expect(f_String).assertEqual(null);

      let v_StringBuilder: StringBuilder|null = null;
      expect(v_StringBuilder).assertEqual(null);
      let a_StringBuilder: (StringBuilder[])|null = null;
      expect(a_StringBuilder).assertEqual(null);
      let f_StringBuilder: ((p: StringBuilder) => StringBuilder)|null = null;
      expect(f_StringBuilder).assertEqual(null);

      let v_Type: Type|null = null;
      expect(v_Type).assertEqual(null);
      let a_Type: (Type[])|null = null;
      expect(a_Type).assertEqual(null);
      let f_Type: ((p: Type) => Type)|null = null;
      expect(f_Type).assertEqual(null);

      let v_Date: Date|null = null;
      expect(v_Date).assertEqual(null);
      let a_Date: (Date[])|null = null;
      expect(a_Date).assertEqual(null);
      let f_Date: ((p: Date) => Date)|null = null;
      expect(f_Date).assertEqual(null);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11100
     * @tc.name      testAssignmentLikeContexts0111
     * @tc.desc     Widening primitive type: byte to short/int/long/float/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let origin: byte = 0 as byte;
      let xshort: short = origin;
      let xint: int = origin;
      let xlong: long = origin;
      let xfloat: float = origin;
      let xdouble: double = origin;

      expect(xshort).assertEqual(origin);
      expect(xint).assertEqual(origin);
      expect(xlong).assertEqual(origin);
      expect(xfloat).assertEqual(origin);
      expect(xdouble).assertEqual(origin);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11200
     * @tc.name      testAssignmentLikeContexts0112
     * @tc.desc     Widening primitive type: short to int/long/float/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let origin: short = 0 as short;
      let xint: int = origin;
      let xlong: long = origin;
      let xfloat: float = origin;
      let xdouble: double = origin;

      expect(xint).assertEqual(origin);
      expect(xlong).assertEqual(origin);
      expect(xfloat).assertEqual(origin);
      expect(xdouble).assertEqual(origin);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11300
     * @tc.name      testAssignmentLikeContexts0113
     * @tc.desc     Widening primitive type: int to long/float/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let origin: int = 0;
      let xlong: long = origin;
      let xfloat: float = origin;
      let xdouble: double = origin;

      expect(xlong).assertEqual(origin);
      expect(xfloat).assertEqual(origin);
      expect(xdouble).assertEqual(origin);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11400
     * @tc.name      testAssignmentLikeContexts0114
     * @tc.desc     Widening primitive type: long to float/double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let origin: long = 0 as long;
      let xfloat: float = origin;
      let xdouble: double = origin;

      expect(xfloat).assertEqual(origin);
      expect(xdouble).assertEqual(origin);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11500
     * @tc.name      testAssignmentLikeContexts0115
     * @tc.desc     Widening primitive type: float to double
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let origin: float = 0.0f;
      let xdouble: double = origin;

      expect(xdouble).assertEqual(origin);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11600
     * @tc.name      testAssignmentLikeContexts0116
     * @tc.desc     Widening reference conversion: array to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Object[] = new Object[1](new Object());
      let dst: Object = src as Object;
      expect(src).assertEqual(dst); // 引用相等性校验
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11800
     * @tc.name      testAssignmentLikeContexts0118
     * @tc.desc     Widening reference conversion: wrapper type array to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0118", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_Byte: Byte[] = new Byte[1](0);
      let dst_Byte: Object = src_Byte as Object;
      expect(src_Byte).assertEqual(dst_Byte);

      let src_Short: Short[] = new Short[1](0);
      let dst_Short: Object = src_Short as Object;
      expect(src_Short).assertEqual(dst_Short);

      let src_Char: Char[] = new Char[1]((0).toChar());
      let dst_Char: Object = src_Char as Object;
      expect(src_Char).assertEqual(dst_Char);

      let src_Int: Int[] = new Int[1](0);
      let dst_Int: Object = src_Int as Object;
      expect(src_Int).assertEqual(dst_Int);

      let src_Long: Long[] = new Long[1](0);
      let dst_Long: Object = src_Long as Object;
      expect(src_Long).assertEqual(dst_Long);

      let src_Float: Float[] = new Float[1](0);
      let dst_Float: Object = src_Float as Object;
      expect(src_Float).assertEqual(dst_Float);

      let src_Double: Double[] = new Double[1](0);
      let dst_Double: Object = src_Double as Object;
      expect(src_Double).assertEqual(dst_Double);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_11900
     * @tc.name      testAssignmentLikeContexts0119
     * @tc.desc     Widening reference conversion: wrapper type to Object/Integral/Floating/Comparable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0119", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 到 Object 的拓宽转换
      let src_Double: Double = new Double();
      let dst_Object: Object = src_Double as Object;
      expect(src_Double).assertEqual(dst_Object);

      // 到 Integral 的拓宽转换

      let src_Byte: Byte = new Byte();
      let dst_Integral_Byte: Integral = src_Byte as Integral;
      expect(src_Byte).assertEqual(dst_Integral_Byte as Byte);

      let src_Short: Short = new Short();
      let dst_Integral_Short: Integral = src_Short as Integral;
      expect(src_Short).assertEqual(dst_Integral_Short as Short);

      let src_Int: Int = new Int();
      let dst_Integral_Int: Integral = src_Int as Integral;
      expect(src_Int).assertEqual(dst_Integral_Int as Int);

      let src_Long: Long = new Long();
      let dst_Integral_Long: Integral = src_Long as Integral;
      expect(src_Long).assertEqual(dst_Integral_Long as Long);

      // 到 Floating 的拓宽转换

      let src_Float: Float = new Float();
      let dst_Floating_Float: Floating = src_Float as Floating;
      expect(src_Float).assertEqual(dst_Floating_Float as Float);

      let src_Double2: Double = new Double();
      let dst_Floating_Double: Floating = src_Double2 as Floating;
      expect(src_Double2).assertEqual(dst_Floating_Double as Double);

      // 到 Comparable 的拓宽转换
      let src_Byte_Comp: Byte = new Byte();
      let dst_Comp_Byte: Comparable<Byte> = src_Byte_Comp as Comparable<Byte>;
      expect(src_Byte_Comp).assertEqual(dst_Comp_Byte as Byte);

      let src_Char_Comp: Char = new Char();
      let dst_Comp_Char: Comparable<Char> = src_Char_Comp as Comparable<Char>;
      expect(src_Char_Comp).assertEqual(dst_Comp_Char as Char);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12000
     * @tc.name      testAssignmentLikeContexts0120
     * @tc.desc     Widening reference conversion: function and function array to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0120", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_Func: () => void = () => { return; };
      let dst_Func_Object: Object = src_Func as Object;
      expect(src_Func).assertEqual(dst_Func_Object);

      let src_FuncArray: (() => void)[] = [];
      let dst_FuncArray_Object: Object = src_FuncArray as Object;
      expect(src_FuncArray).assertEqual(dst_FuncArray_Object);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12100
     * @tc.name      testAssignmentLikeContexts0121
     * @tc.desc     Widening reference conversion: enum and enum array to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0121", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_Enum: Color = Color.Red;
      let dst_Enum_Object: Object = src_Enum as Object;
      expect(src_Enum).assertEqual(dst_Enum_Object);

      let src_EnumArray: Color[] = [Color.Red, Color.Blue];
      let dst_EnumArray_Object: Object = src_EnumArray as Object;
      expect(src_EnumArray).assertEqual(dst_EnumArray_Object);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12200
     * @tc.name      testAssignmentLikeContexts0122
     * @tc.desc     Widening reference conversion: interface implementation to Object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0122", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_Interface: I = new A44();
      let dst_Interface_Object: Object = src_Interface as Object;
      expect(src_Interface).assertEqual(dst_Interface_Object);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12300
     * @tc.name      testAssignmentLikeContexts0123
     * @tc.desc     Widening reference conversion: multi-dimensional function array to Object array (nullable)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0123", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: ((a: Double) => double)[][]|null = null;
      let dst: Object[]|null = src as Object[]|null;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12400
     * @tc.name      testAssignmentLikeContexts0124
     * @tc.desc     Widening reference conversion: generic class with interface type parameter to super generic class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0124", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: C<I> = new C<I>();
      let dst: B2<I> = src as B2<I>;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12500
     * @tc.name      testAssignmentLikeContexts0125
     * @tc.desc     Identity conversion for generic class with nested type parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0125", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: C1<A> = new C1<A>();
      let dst: C1<A> = src;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12600
     * @tc.name      testAssignmentLikeContexts0126
     * @tc.desc     Identity conversion for nullable function type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0126", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Func|null = (x: int, y: string) => new Boolean(x > 0);
      let dst: Func|null = src;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12700
     * @tc.name      testAssignmentLikeContexts0127
     * @tc.desc     Widening reference conversion for nested generic class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0127", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: C3<A45> = new C3<A45>();
      let dst: B2<A45> = src as B2<A45>;
      expect(src).assertEqual(dst);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12800
     * @tc.name      testAssignmentLikeContexts0128
     * @tc.desc     Identity conversion for array of generic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0128", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: B2<A45>[] = [new B2<A45>(), new B2<A45>()];
      let dst: B2<A45>[] = src;
      expect(src).assertEqual(dst);
      expect(src.length).assertEqual(dst.length);
      expect(src[0]).assertEqual(dst[0]);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_12900
     * @tc.name      testAssignmentLikeContexts0129
     * @tc.desc     Assignment contexts allow widening reference conversion followed by unboxing (Byte to byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0129", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1: byte = foo<Byte>(new Byte(1 as byte));
      expect(res1).assertEqual(1);

      let res2: byte = foo<Byte>(new Byte(-128 as byte));
      expect(res2).assertEqual(-128);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13000
     * @tc.name      testAssignmentLikeContexts0130
     * @tc.desc     Assignment contexts allow widening reference conversion followed by unboxing (Short to short)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0130", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1: short = foo1<Short>(new Short(1));
      expect(res1).assertEqual(1);

      let res2: short = foo1<Short>(new Short(Short.MAX_VALUE));
      expect(res2).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13100
     * @tc.name      testAssignmentLikeContexts0131
     * @tc.desc     Assignment contexts allow widening reference conversion followed by unboxing (Int to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0131", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1: int = foo2<Int>(new Int(-1));
      expect(res1).assertEqual(-1);

      let res2: int = foo2<Int>(new Int(Int.MAX_VALUE));
      expect(res2).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13200
     * @tc.name      testAssignmentLikeContexts0132
     * @tc.desc     Assignment contexts allow widening reference conversion followed by unboxing (Long to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0132", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let res1: long = foo3<Long>(new Long(Long.MIN_VALUE));
      expect(res1).assertEqual(Long.MIN_VALUE);

      let res2: long = foo3<Long>(new Long(Long.MAX_VALUE));
      expect(res2).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13300
     * @tc.name      testAssignmentLikeContexts0133
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (boolean to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0133", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: boolean = true;
      let dst_1: Object = src_1;
      expect(dst_1).not().assertNull();

      let src_2: boolean = false;
      let dst_2: Object = src_2;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13400
     * @tc.name      testAssignmentLikeContexts0134
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (byte to Integral)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0134", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: byte = -128 as byte;
      let dst_1: Integral = src_1 as Integral;
      expect(dst_1).not().assertNull();

      let src_2: byte = 0 as byte;
      let dst_2: Integral = src_2 as Integral;
      expect(dst_2).not().assertNull();

      let src_3: byte = 127 as byte;
      let dst_3: Integral = src_3 as Integral;
      expect(dst_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13500
     * @tc.name      testAssignmentLikeContexts0135
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (char to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0135", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: char = c'\u0000';
      let dst_1: Object = src_1;
      expect(dst_1).not().assertNull();

      let src_2: char = c'X';
      let dst_2: Object = src_2;
      expect(dst_2).not().assertNull();

      let src_3: char = c'\uffff';
      let dst_3: Object = src_3;
      expect(dst_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13600
     * @tc.name      testAssignmentLikeContexts0136
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (short to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0136", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: short = Short.MIN_VALUE;
      let dst_1: Object = src_1;
      expect(dst_1).not().assertNull();

      let src_2: short = (255).toShort();
      let dst_2: Object = src_2;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13700
     * @tc.name      testAssignmentLikeContexts0137
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (int to Integral)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0137", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: int = 127;
      let dst_1: Integral = src_1 as Integral;
      expect(dst_1).not().assertNull();

      let src_2: int = 32767;
      let dst_2: Integral = src_2 as Integral;
      expect(dst_2).not().assertNull();

      let src_3: int = Int.MAX_VALUE;
      let dst_3: Integral = src_3 as Integral;
      expect(dst_3).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13800
     * @tc.name      testAssignmentLikeContexts0138
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (long to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0138", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: long = Long.MIN_VALUE;
      let dst_1: Object = src_1;
      expect(dst_1).not().assertNull();

      let src_2: long = (9223372036854775807).toLong();
      let dst_2: Object = src_2;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_13900
     * @tc.name      testAssignmentLikeContexts0139
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (float to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0139", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: float = 1.401298464324817e-45f;
      let dst_1: Object = src_1;
      expect(dst_1).not().assertNull();

      let src_2: float = Float.MAX_VALUE;
      let dst_2: Object = src_2;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14000
     * @tc.name      testAssignmentLikeContexts0140
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (double to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0140", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: double = -1.401298464324817e-45;
      let dst_1: Object = src_1;
      expect(dst_1).not().assertNull();

      let src_2: double = Double.MAX_VALUE;
      let dst_2: Object = src_2;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14100
     * @tc.name      testAssignmentLikeContexts0141
     * @tc.desc     Invocation contexts allow widening reference conversion followed by unboxing (Short to short)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0141", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let param: Short = new Short(32767);
      let obj: A47 = new A47(param);
      obj.foo(param);
      expect(obj.fld).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14200
     * @tc.name      testAssignmentLikeContexts0142
     * @tc.desc     Invocation contexts allow widening reference conversion followed by unboxing (Int to int)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0142", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let param: Int = new Int(Int.MAX_VALUE);
      let obj: A48 = new A48(param);
      obj.foo(param);
      expect(obj.fld).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14300
     * @tc.name      testAssignmentLikeContexts0143
     * @tc.desc     Invocation contexts allow widening reference conversion followed by unboxing (Long to long)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0143", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let param: Long = new Long(Long.MAX_VALUE);
      let obj: A49 = new A49(param);
      obj.foo(param);
      expect(obj.fld).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14400
     * @tc.name      testAssignmentLikeContexts0144
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (float to Floating)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0144", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: float = 0.0f;
      let dst_1: Floating = src_1 as Floating;
      expect(dst_1).not().assertNull();

      let src_2: float = Float.MIN_VALUE;
      let dst_2: Floating = src_2 as Floating;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14500
     * @tc.name      testAssignmentLikeContexts0145
     * @tc.desc     Assignment contexts allow conversion followed by widening reference conversion (double to Floating)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0145", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src_1: double = 0.0;
      let dst_1: Floating = src_1 as Floating;
      expect(dst_1).not().assertNull();

      let src_2: double = Double.MAX_VALUE;
      let dst_2: Floating = src_2 as Floating;
      expect(dst_2).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14600
     * @tc.name      testAssignmentLikeContexts0146
     * @tc.desc     Invocation contexts allow conversion followed by widening reference conversion (byte to Integral)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0146", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let param: byte = 64 as byte;
      expect(param as Integral).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14700
     * @tc.name      testAssignmentLikeContexts0147
     * @tc.desc     Invocation contexts allow conversion followed by widening reference conversion (char to Object)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0147", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let param: char = c'\u767D'; // 字符 '白'
      foo5(param);
      expect(param).not().assertNull();
    });

    /**
     * @tc.number    SUB_ASSIGNMENT_LIKE_CONTEXTS_14800
     * @tc.name      testAssignmentLikeContexts0148
     * @tc.desc     Compile-time error for narrowing primitive conversion (int to byte)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testAssignmentLikeContexts0148", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int = 300;
      let dst: byte = src.toByte();
      expect(dst).assertEqual(44);
    });
  })
}