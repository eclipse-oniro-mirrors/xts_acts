'use static'
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

class ClassWithMethod {
  m(): void {}
}

class ClassWithStaticMethod {
  static m(): void {}
}

interface ITest1 {}
interface ITest2 {}

class ClassWithInterfaces implements ITest1, ITest2 {}

class ClassWithValue {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }
}

class NestedClass {
  public value: number;
  public next: NestedClass | null;

  constructor(value: number, next: NestedClass | null = null) {
    this.value = value;
    this.next = next;
  }
}

function equ(a: Object, b: Object): boolean {
  return a == b;
}

function f(): void {}
function g(): void {}

enum E { A = 1, B = 2 }
enum S { A = "x", B = "y" }

type T = number | string;
type U = boolean | string;

export function EqualityTest001(): void {
  let caseName: string = "EqualityTest001";
  // 1. 核心逻辑
  if (!(true == true)) {
    console.info(`${caseName} Task execution failed： true == true should be true`);
    throw new Error("Test failed: true == true");
  }
  if (!(true === true)) {
    console.info(`${caseName} Task execution failed： true === true should be true`);
    throw new Error("Test failed: true === true");
  }
  if (true === false) {
    console.info(`${caseName} Task execution failed： true === false should be false`);
    throw new Error("Test failed: true === false should be false");
  }
  if (!(true != false)) {
    console.info(`${caseName} Task execution failed： true != false should be true`);
    throw new Error("Test failed: true != false");
  }
  if (!(true !== false)) {
    console.info(`${caseName} Task execution failed： true !== false should be true`);
    throw new Error("Test failed: true !== false");
  }
  if (!(false == false)) {
    console.info(`${caseName} Task execution failed： false == false should be true`);
    throw new Error("Test failed: false == false");
  }
}

export function EqualityTest002(): void {
  let caseName: string = "EqualityTest002";
  // 1. 核心逻辑
  if (!("abc" == "abc")) {
    console.info(`${caseName} Task execution failed： "abc" == "abc" should be true`);
    throw new Error("Test failed: \"abc\" == \"abc\"");
  }
  if (!("abc" === "abc")) {
    console.info(`${caseName} Task execution failed： "abc" === "abc" should be true`);
    throw new Error("Test failed: \"abc\" === \"abc\"");
  }
  if ("abc" == "def") {
    console.info(`${caseName} Task execution failed： "abc" == "def" should be false`);
    throw new Error("Test failed: \"abc\" == \"def\" should be false");
  }
  if (!("abc" != "def")) {
    console.info(`${caseName} Task execution failed： "abc" != "def" should be true`);
    throw new Error("Test failed: \"abc\" != \"def\"");
  }

  let s: "abc" = "abc";
  if (!(s == "abc")) {
    console.info(`${caseName} Task execution failed： s == "abc" should be true`);
    throw new Error("Test failed: s == \"abc\"");
  }
  if (!(s === "abc")) {
    console.info(`${caseName} Task execution failed： s === "abc" should be true`);
    throw new Error("Test failed: s === \"abc\"");
  }
}

export function EqualityTest003(): void {
  let caseName: string = "EqualityTest003";
  // 1. 核心逻辑
  if (!(5 == 5)) {
    console.info(`${caseName} Task execution failed： 5 == 5 should be true`);
    throw new Error("Test failed: 5 == 5");
  }
  if (!(5 == 5.0)) {
    console.info(`${caseName} Task execution failed： 5 == 5.0 should be true`);
    throw new Error("Test failed: 5 == 5.0");
  }
  if (!(5 === 5.0)) {
    console.info(`${caseName} Task execution failed： 5 === 5.0 should be true`);
    throw new Error("Test failed: 5 === 5.0");
  }
  if (!(5 != 6)) {
    console.info(`${caseName} Task execution failed： 5 != 6 should be true`);
    throw new Error("Test failed: 5 != 6");
  }
  if (!(5 !== 6)) {
    console.info(`${caseName} Task execution failed： 5 !== 6 should be true`);
    throw new Error("Test failed: 5 !== 6");
  }

  let a: int = 5;
  let b: double = 5.0;
  if (!(a == b)) {
    console.info(`${caseName} Task execution failed： a == b should be true`);
    throw new Error("Test failed: a == b");
  }
  if (!(a === b)) {
    console.info(`${caseName} Task execution failed： a === b should be true`);
    throw new Error("Test failed: a === b");
  }
}

export function EqualityTest004(): void {
  let caseName: string = "EqualityTest004";
  // 1. 核心逻辑
  let x: double = 0.0 / 0.0;
  if (x == x) {
    console.info(`${caseName} Task execution failed： NaN == NaN should be false`);
    throw new Error("Test failed: x == x should be false");
  }
  if (x === x) {
    console.info(`${caseName} Task execution failed： NaN === NaN should be false`);
    throw new Error("Test failed: x === x should be false");
  }
  if (!(x != x)) {
    console.info(`${caseName} Task execution failed： NaN != NaN should be true`);
    throw new Error("Test failed: x != x");
  }
  if (!(x !== x)) {
    console.info(`${caseName} Task execution failed： NaN !== NaN should be true`);
    throw new Error("Test failed: x !== x");
  }
}

export function EqualityTest005(): void {
  let caseName: string = "EqualityTest005";
  // 1. 核心逻辑
  let posZero: double = +0.0;
  let negZero: double = -0.0;
  if (!(posZero == negZero)) {
    console.info(`${caseName} Task execution failed： +0.0 == -0.0 should be true`);
    throw new Error("Test failed: posZero == negZero");
  }
  if (!(posZero === negZero)) {
    console.info(`${caseName} Task execution failed： +0.0 === -0.0 should be true`);
    throw new Error("Test failed: posZero === negZero");
  }
}

export function EqualityTest006(): void {
  let caseName: string = "EqualityTest006";
  // 1. 核心逻辑
  let posInf: double = 1.0 / 0.0;
  let negInf: double = -1.0 / 0.0;
  if (!(posInf == posInf)) {
    console.info(`${caseName} Task execution failed： +Infinity == +Infinity should be true`);
    throw new Error("Test failed: posInf == posInf");
  }
  if (!(posInf === posInf)) {
    console.info(`${caseName} Task execution failed： +Infinity === +Infinity should be true`);
    throw new Error("Test failed: posInf === posInf");
  }
  if (posInf == negInf) {
    console.info(`${caseName} Task execution failed： +Infinity == -Infinity should be false`);
    throw new Error("Test failed: posInf == negInf should be false");
  }
  if (!(posInf !== negInf)) {
    console.info(`${caseName} Task execution failed： +Infinity !== -Infinity should be true`);
    throw new Error("Test failed: posInf !== negInf");
  }
}

export function EqualityTest007(): void {
  let caseName: string = "EqualityTest007";
  // 1. 核心逻辑
  let c1: char = c'A';
  let c2: char = c'A';
  let c3: char = c'B';

  if (!(c1 == c2)) {
    console.info(`${caseName} Task execution failed： c'A' == c'A' should be true`);
    throw new Error("Test failed: c1 == c2");
  }
  if (!(c1 === c2)) {
    console.info(`${caseName} Task execution failed： c'A' === c'A' should be true`);
    throw new Error("Test failed: c1 === c2");
  }
  if (c1 == c3) {
    console.info(`${caseName} Task execution failed： c'A' == c'B' should be false`);
    throw new Error("Test failed: c1 == c3 should be false");
  }
  if (!(c1 !== c3)) {
    console.info(`${caseName} Task execution failed： c'A' !== c'B' should be true`);
    throw new Error("Test failed: c1 !== c3");
  }

  let chinese: char = c'中';
  let chinese2: char = c'中';
  if (!(chinese == chinese2)) {
    console.info(`${caseName} Task execution failed： c'中' == c'中' should be true`);
    throw new Error("Test failed: chinese == chinese2");
  }
}

export function EqualityTest008(): void {
  let caseName: string = "EqualityTest008";
  // 1. 核心逻辑
  let a: bigint = 10n;
  let b: bigint = 10n;
  let c: bigint = 11n;

  if (!(a == b)) {
    console.info(`${caseName} Task execution failed： 10n == 10n should be true`);
    throw new Error("Test failed: a == b");
  }
  if (!(a === b)) {
    console.info(`${caseName} Task execution failed： 10n === 10n should be true`);
    throw new Error("Test failed: a === b");
  }
  if (a == c) {
    console.info(`${caseName} Task execution failed： 10n == 11n should be false`);
    throw new Error("Test failed: a == c should be false");
  }
  if (!(a !== c)) {
    console.info(`${caseName} Task execution failed： 10n !== 11n should be true`);
    throw new Error("Test failed: a !== c");
  }
}

export function EqualityTest009(): void {
  let caseName: string = "EqualityTest009";
  // 1. 核心逻辑
  if (!(E.A == E.A)) {
    console.info(`${caseName} Task execution failed： E.A == E.A should be true`);
    throw new Error("Test failed: E.A == E.A");
  }
  if (!(E.A === E.A)) {
    console.info(`${caseName} Task execution failed： E.A === E.A should be true`);
    throw new Error("Test failed: E.A === E.A");
  }
  if (E.A == E.B) {
    console.info(`${caseName} Task execution failed： E.A == E.B should be false`);
    throw new Error("Test failed: E.A == E.B should be false");
  }
  if (!(E.A !== E.B)) {
    console.info(`${caseName} Task execution failed： E.A !== E.B should be true`);
    throw new Error("Test failed: E.A !== E.B");
  }
}

export function EqualityTest010(): void {
  let caseName: string = "EqualityTest010";
  // 1. 核心逻辑
  if (!(S.A == S.A)) {
    console.info(`${caseName} Task execution failed： S.A == S.A should be true`);
    throw new Error("Test failed: S.A == S.A");
  }
  if (!(S.A === S.A)) {
    console.info(`${caseName} Task execution failed： S.A === S.A should be true`);
    throw new Error("Test failed: S.A === S.A");
  }
  if (S.A == S.B) {
    console.info(`${caseName} Task execution failed： S.A == S.B should be false`);
    throw new Error("Test failed: S.A == S.B should be false");
  }
  if (!(S.A !== S.B)) {
    console.info(`${caseName} Task execution failed： S.A !== S.B should be true`);
    throw new Error("Test failed: S.A !== S.B");
  }
}

export function EqualityTest011(): void {
  let caseName: string = "EqualityTest011";
  // 1. 核心逻辑
  if (!(f == f)) {
    console.info(`${caseName} Task execution failed： f == f should be true`);
    throw new Error("Test failed: f == f");
  }
  if (!(f === f)) {
    console.info(`${caseName} Task execution failed： f === f should be true`);
    throw new Error("Test failed: f === f");
  }
  if (f == g) {
    console.info(`${caseName} Task execution failed： f == g should be false`);
    throw new Error("Test failed: f == g should be false");
  }
  if (!(f !== g)) {
    console.info(`${caseName} Task execution failed： f !== g should be true`);
    throw new Error("Test failed: f !== g");
  }
}

export function EqualityTest012(): void {
  let caseName: string = "EqualityTest012";
  // 1. 核心逻辑
  const a1 = new ClassWithMethod();
  const a2 = new ClassWithMethod();

  if (!(a1.m == a1.m)) {
    console.info(`${caseName} Task execution failed： a1.m == a1.m should be true`);
    throw new Error("Test failed: a1.m == a1.m");
  }
  if (!(a1.m === a1.m)) {
    console.info(`${caseName} Task execution failed： a1.m === a1.m should be true`);
    throw new Error("Test failed: a1.m === a1.m");
  }
  if (a1.m == a2.m) {
    console.info(`${caseName} Task execution failed： a1.m == a2.m should be false`);
    throw new Error("Test failed: a1.m == a2.m should be false");
  }
  if (!(a1.m !== a2.m)) {
    console.info(`${caseName} Task execution failed： a1.m !== a2.m should be true`);
    throw new Error("Test failed: a1.m !== a2.m");
  }
}

export function EqualityTest013(): void {
  let caseName: string = "EqualityTest013";
  // 1. 核心逻辑
  if (!(ClassWithStaticMethod.m == ClassWithStaticMethod.m)) {
    console.info(`${caseName} Task execution failed： ClassWithStaticMethod.m == ClassWithStaticMethod.m should be true`);
    throw new Error("Test failed: ClassWithStaticMethod.m == ClassWithStaticMethod.m");
  }
  if (!(ClassWithStaticMethod.m === ClassWithStaticMethod.m)) {
    console.info(`${caseName} Task execution failed： ClassWithStaticMethod.m === ClassWithStaticMethod.m should be true`);
    throw new Error("Test failed: ClassWithStaticMethod.m === ClassWithStaticMethod.m");
  }
}

export function EqualityTest014(): void {
  let caseName: string = "EqualityTest014";
  // 1. 核心逻辑
  let a = new Object();
  let b = new Object();
  let c = a;

  if (a == b) {
    console.info(`${caseName} Task execution failed： a == b should be false (different references)`);
    throw new Error("Test failed: a == b should be false");
  }
  if (a === b) {
    console.info(`${caseName} Task execution failed： a === b should be false (different references)`);
    throw new Error("Test failed: a === b should be false");
  }
  if (!(a == c)) {
    console.info(`${caseName} Task execution failed： a == c should be true (same reference)`);
    throw new Error("Test failed: a == c");
  }
  if (!(a === c)) {
    console.info(`${caseName} Task execution failed： a === c should be true (same reference)`);
    throw new Error("Test failed: a === c");
  }
}

export function EqualityTest015(): void {
  let caseName: string = "EqualityTest015";
  // 1. 核心逻辑
  let x: ITest1 = new ClassWithInterfaces();
  let y: ITest2 = x;

  if (!(x == y)) {
    console.info(`${caseName} Task execution failed： x == y should be true (same object, different interface types)`);
    throw new Error("Test failed: x == y");
  }
  if (!(x === y)) {
    console.info(`${caseName} Task execution failed： x === y should be true (same object, different interface types)`);
    throw new Error("Test failed: x === y");
  }
}

export function EqualityTest016(): void {
  let caseName: string = "EqualityTest016";
  // 1. 核心逻辑
  let x: null  = null;
  let y: undefined = undefined;

  if (!(x == y)) {
    console.info(`${caseName} Task execution failed： null == undefined should be true (abstract equality)`);
    throw new Error("Test failed: x == y");
  }
  if (x === y) {
    console.info(`${caseName} Task execution failed： null === undefined should be false (strict equality)`);
    throw new Error("Test failed: x === y should be false");
  }
  if (x != y) {
    console.info(`${caseName} Task execution failed： null != undefined should be false (abstract equality)`);
    throw new Error("Test failed: x != y should be false");
  }
  if (!(x !== y)) {
    console.info(`${caseName} Task execution failed： null !== undefined should be true (strict equality)`);
    throw new Error("Test failed: x !== y");
  }
}

export function EqualityTest017(): void {
  let caseName: string = "EqualityTest017";
  // 1. 核心逻辑
  let x: Object | null | undefined = null;
  let y: Object | null | undefined = undefined;

  if (!(x == y)) {
    console.info(`${caseName} Task execution failed： null == undefined should be true (union type)`);
    throw new Error("Test failed: x == y");
  }
  if (x === y) {
    console.info(`${caseName} Task execution failed： null === undefined should be false (strict equality)`);
    throw new Error("Test failed: x === y should be false");
  }
}

export function EqualityTest018(): void {
  let caseName: string = "EqualityTest018";
  // 1. 核心逻辑
  if (!equ(1, 1)) {
    console.info(`${caseName} Task execution failed： equ(1, 1) should be true`);
    throw new Error("Test failed: equ(1, 1)");
  }
  if (equ(1, 2)) {
    console.info(`${caseName} Task execution failed： equ(1, 2) should be false`);
    throw new Error("Test failed: equ(1, 2) should be false");
  }
  if (!equ("a", "a")) {
    console.info(`${caseName} Task execution failed： equ("a", "a") should be true`);
    throw new Error("Test failed: equ(\"a\", \"a\")");
  }
  if (equ("a", "b")) {
    console.info(`${caseName} Task execution failed： equ("a", "b") should be false`);
    throw new Error("Test failed: equ(\"a\", \"b\") should be false");
  }
}

export function EqualityTest019(): void {
  let caseName: string = "EqualityTest019";
  // 1. 核心逻辑
  let a: Object = NaN;
  let b: Object = NaN;
  if (a == a) {
    console.info(`${caseName} Task execution failed： NaN == NaN should be false`);
    throw new Error("Test failed: a == a should be false");
  }
  if (b == b) {
    console.info(`${caseName} Task execution failed： NaN == NaN should be false`);
    throw new Error("Test failed: b == b should be false");
  }
  if (a == b) {
    console.info(`${caseName} Task execution failed： NaN == NaN should be false`);
    throw new Error("Test failed: a == b should be false");
  }
}

export function EqualityTest020(): void {
  let caseName: string = "EqualityTest020";
  // 1. 核心逻辑
  let arr1: number[] = [1, 2, 3];
  let arr2: number[] = [1, 2, 3];
  let arr3 = arr1;
  if (arr1 == arr2) {
    console.info(`${caseName} Task execution failed： arr1 == arr2 should be false (different array references)`);
    throw new Error("Test failed: arr1 == arr2 should be false");
  }
  if (arr1 === arr2) {
    console.info(`${caseName} Task execution failed： arr1 === arr2 should be false (different array references)`);
    throw new Error("Test failed: arr1 === arr2 should be false");
  }
  if (!(arr1 == arr3)) {
    console.info(`${caseName} Task execution failed： arr1 == arr3 should be true (same array reference)`);
    throw new Error("Test failed: arr1 == arr3");
  }
  if (!(arr1 === arr3)) {
    console.info(`${caseName} Task execution failed： arr1 === arr3 should be true (same array reference)`);
    throw new Error("Test failed: arr1 === arr3");
  }
}

export function EqualityTest021(): void {
  let caseName: string = "EqualityTest021";
  // 1. 核心逻辑
  let byteVal: byte = 5;
  let shortVal: short = 5;
  let intVal: int = 5;
  let longVal: long = 5;
  let floatVal: float = 5.0f;
  let doubleVal: double = 5.0;

  if (!(byteVal == intVal)) {
    console.info(`${caseName} Task execution failed： byteVal == intVal should be true`);
    throw new Error("Test failed: byteVal == intVal");
  }
  if (!(shortVal == longVal)) {
    console.info(`${caseName} Task execution failed： shortVal == longVal should be true`);
    throw new Error("Test failed: shortVal == longVal");
  }
  if (!(intVal == floatVal)) {
    console.info(`${caseName} Task execution failed： intVal == floatVal should be true`);
    throw new Error("Test failed: intVal == floatVal");
  }
  if (!(floatVal == doubleVal)) {
    console.info(`${caseName} Task execution failed： floatVal == doubleVal should be true`);
    throw new Error("Test failed: floatVal == doubleVal");
  }
  if (!(doubleVal == byteVal)) {
    console.info(`${caseName} Task execution failed： doubleVal == byteVal should be true`);
    throw new Error("Test failed: doubleVal == byteVal");
  }
}

export function EqualityTest022(): void {
  let caseName: string = "EqualityTest022";
  // 1. 核心逻辑
  let result: boolean = true == true == true;
  if (!result) {
    console.info(`${caseName} Task execution failed： true == true == true should be true`);
    throw new Error("Test failed: true == true == true");
  }

  result = false == false == true;
  if (!result) {
    console.info(`${caseName} Task execution failed： false == false == true should be true`);
    throw new Error("Test failed: false == false == true");
  }
}

export function EqualityTest023(): void {
  let caseName: string = "EqualityTest023";
  // 1. 核心逻辑
  let r: boolean = 1 < 2 == 3 < 4;
  if (!r) {
    console.info(`${caseName} Task execution failed： 1 < 2 == 3 < 4 should be true`);
    throw new Error("Test failed: 1 < 2 == 3 < 4");
  }
}

export function EqualityTest024(): void {
  let caseName: string = "EqualityTest024";
  // 1. 核心逻辑
  let tuple1: [number, string] = [1, "a"];
  let tuple2: [number, string] = [1, "a"];
  let tuple3 = tuple1;

  if (tuple1 == tuple2) {
    console.info(`${caseName} Task execution failed： tuple1 == tuple2 should be false (different tuple references)`);
    throw new Error("Test failed: tuple1 == tuple2 should be false");
  }
  if (tuple1 === tuple2) {
    console.info(`${caseName} Task execution failed： tuple1 === tuple2 should be false (different tuple references)`);
    throw new Error("Test failed: tuple1 === tuple2 should be false");
  }
  if (!(tuple1 == tuple3)) {
    console.info(`${caseName} Task execution failed： tuple1 == tuple3 should be true (same tuple reference)`);
    throw new Error("Test failed: tuple1 == tuple3");
  }
  if (!(tuple1 === tuple3)) {
    console.info(`${caseName} Task execution failed： tuple1 === tuple3 should be true (same tuple reference)`);
    throw new Error("Test failed: tuple1 === tuple3");
  }
}

export function EqualityTest025(): void {
  let caseName: string = "EqualityTest025";
  // 1. 核心逻辑
  let a1: ClassWithValue = new ClassWithValue(5);
  let a2: ClassWithValue = new ClassWithValue(5);
  let a3: ClassWithValue = a1;

  if (a1 == a2) {
    console.info(`${caseName} Task execution failed： a1 == a2 should be false (different class instances)`);
    throw new Error("Test failed: a1 == a2 should be false");
  }
  if (a1 === a2) {
    console.info(`${caseName} Task execution failed： a1 === a2 should be false (different class instances)`);
    throw new Error("Test failed: a1 === a2 should be false");
  }
  if (!(a1 == a3)) {
    console.info(`${caseName} Task execution failed： a1 == a3 should be true (same class reference)`);
    throw new Error("Test failed: a1 == a3");
  }
  if (!(a1 === a3)) {
    console.info(`${caseName} Task execution failed： a1 === a3 should be true (same class reference)`);
    throw new Error("Test failed: a1 === a3");
  }
  if (!(a1.value == a2.value)) {
    console.info(`${caseName} Task execution failed： a1.value == a2.value should be true (same property value)`);
    throw new Error("Test failed: a1.value == a2.value");
  }
}

export function EqualityTest026(): void {
  let caseName: string = "EqualityTest026";
  // 1. 核心逻辑
  let x: T = "hello";
  let y: U = "hello";

  if (!(x == y)) {
    console.info(`${caseName} Task execution failed： x == y should be true (union types with overlapping type)`);
    throw new Error("Test failed: x == y");
  }
  if (!(x === y)) {
    console.info(`${caseName} Task execution failed： x === y should be true (union types with overlapping type)`);
    throw new Error("Test failed: x === y");
  }
}

export function EqualityTest027(): void {
  let caseName: string = "EqualityTest027";
  // 1. 核心逻辑
  let arr1: readonly number[] = [1, 2, 3];
  let arr2: readonly number[] = [1, 2, 3];
  let arr3 = arr1;

  if (arr1 == arr2) {
    console.info(`${caseName} Task execution failed： arr1 == arr2 should be false (different readonly array references)`);
    throw new Error("Test failed: arr1 == arr2 should be false");
  }
  if (arr1 === arr2) {
    console.info(`${caseName} Task execution failed： arr1 === arr2 should be false (different readonly array references)`);
    throw new Error("Test failed: arr1 === arr2 should be false");
  }
  if (!(arr1 == arr3)) {
    console.info(`${caseName} Task execution failed： arr1 == arr3 should be true (same readonly array reference)`);
    throw new Error("Test failed: arr1 == arr3");
  }
  if (!(arr1 === arr3)) {
    console.info(`${caseName} Task execution failed： arr1 === arr3 should be true (same readonly array reference)`);
    throw new Error("Test failed: arr1 === arr3");
  }
}

export function EqualityTest028(): void {
  let caseName: string = "EqualityTest028";
  // 1. 核心逻辑
  let a: number = 5;
  let b: number = 10;

  if (!(a != b)) {
    console.info(`${caseName} Task execution failed： 5 != 10 should be true`);
    throw new Error("Test failed: a != b");
  }
  if (!(a !== b)) {
    console.info(`${caseName} Task execution failed： 5 !== 10 should be true`);
    throw new Error("Test failed: a !== b");
  }
}

export function EqualityTest029(): void {
  let caseName: string = "EqualityTest029";
  // 1. 核心逻辑
  let numObj1: Object = 5;
  let numObj2: Object = 5;
  let strObj1: Object = "hello";
  let strObj2: Object = "hello";

  if (!(numObj1 == numObj2)) {
    console.info(`${caseName} Task execution failed： numObj1 == numObj2 should be true`);
    throw new Error("Test failed: numObj1 == numObj2");
  }
  if (!(numObj1 === numObj2)) {
    console.info(`${caseName} Task execution failed： numObj1 === numObj2 should be true`);
    throw new Error("Test failed: numObj1 === numObj2");
  }
  if (!(strObj1 == strObj2)) {
    console.info(`${caseName} Task execution failed： strObj1 == strObj2 should be true`);
    throw new Error("Test failed: strObj1 == strObj2");
  }
  if (!(strObj1 === strObj2)) {
    console.info(`${caseName} Task execution failed： strObj1 === strObj2 should be true`);
    throw new Error("Test failed: strObj1 === strObj2");
  }
}

export function EqualityTest030(): void {
  let caseName: string = "EqualityTest030";
  // 1. 核心逻辑
  let d1: double = 0.1;
  let d2: double = 0.2;
  let d3: double = 0.3;
  if (!(Math.abs((d1 + d2) - d3) < 0.0001)) {
    console.info(`${caseName} Task execution failed： floating point precision check failed`);
    throw new Error("Test failed: Math.abs((d1 + d2) - d3) < 0.0001");
  }

  let epsilon: double = 0.0001;
  let diff: double = (d1 + d2) - d3;
  if (!(Math.abs(diff) < epsilon)) {
    console.info(`${caseName} Task execution failed： floating point precision check failed`);
    throw new Error("Test failed: Math.abs(diff) < epsilon");
  }
}

export function EqualityTest031(): void {
  let caseName: string = "EqualityTest031";
  // 1. 核心逻辑
  let a: number = 5;
  let b: number = 5;
  let c: number = 10;

  if (a == b && b == c) {
    console.info(`${caseName} Task execution failed： a == b && b == c should be false`);
    throw new Error("Test failed: a == b && b == c should be false");
  }
  if (!(a == b || b == c)) {
    console.info(`${caseName} Task execution failed： a == b || b == c should be true`);
    throw new Error("Test failed: a == b || b == c");
  }
  if (!(a == b && b != c)) {
    console.info(`${caseName} Task execution failed： a == b && b != c should be true`);
    throw new Error("Test failed: a == b && b != c");
  }

  if (!((a == b) == (b != c))) {
    console.info(`${caseName} Task execution failed： (a == b) == (b != c) should be true`);
    throw new Error("Test failed: (a == b) == (b != c)");
  }
}

export function EqualityTest032(): void {
  let caseName: string = "EqualityTest032";
  // 1. 核心逻辑
  let intMax: int = 2147483647;
  let longVal: long = 2147483647;

  if (!(intMax == longVal)) {
    console.info(`${caseName} Task execution failed： intMax == longVal should be true`);
    throw new Error("Test failed: intMax == longVal");
  }
  if (!(intMax === longVal)) {
    console.info(`${caseName} Task execution failed： intMax === longVal should be true`);
    throw new Error("Test failed: intMax === longVal");
  }

  let longMax: long = 9223372036854775807;
  let intVal: int = 2147483647;

  if (longMax == intVal) {
    console.info(`${caseName} Task execution failed： longMax == intVal should be false`);
    throw new Error("Test failed: longMax == intVal should be false");
  }
  if (!(longMax !== intVal)) {
    console.info(`${caseName} Task execution failed： longMax !== intVal should be true`);
    throw new Error("Test failed: longMax !== intVal");
  }
}

export function EqualityTest033(): void {
  let caseName: string = "EqualityTest033";
  // 1. 核心逻辑
  let a1: NestedClass = new NestedClass(1);
  let a2: NestedClass = new NestedClass(1);
  let a3: NestedClass = a1;

  if (a1 == a2) {
    console.info(`${caseName} Task execution failed： a1 == a2 should be false (different nested class instances)`);
    throw new Error("Test failed: a1 == a2 should be false");
  }
  if (!(a1 == a3)) {
    console.info(`${caseName} Task execution failed： a1 == a3 should be true (same nested class reference)`);
    throw new Error("Test failed: a1 == a3");
  }

  let nested1: NestedClass = new NestedClass(1, new NestedClass(2));
  let nested2: NestedClass = new NestedClass(1, new NestedClass(2));

  if (nested1 == nested2) {
    console.info(`${caseName} Task execution failed： nested1 == nested2 should be false (different nested class instances)`);
    throw new Error("Test failed: nested1 == nested2 should be false");
  }
  if (nested1.next == nested2.next) {
    console.info(`${caseName} Task execution failed： nested1.next == nested2.next should be false (different nested references)`);
    throw new Error("Test failed: nested1.next == nested2.next should be false");
  }
}
