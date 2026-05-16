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
} from "../../../../../hypium";

enum EN1 { a, b, c }
enum ES1 { a = "a", b = "b", c = "c" }
interface I1 {}
class C1 implements I1 {}
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

function c() {}

const array1 = [ "a", "b", "c" ]
const array2 = [ 1, 2, 3, 4 ]
let a1: int = 4
let b1: int = 0
function foo1(): string|int { return a1 > b1 ? a1/b1 : "" }
function foo2(flag: boolean) { if (flag) { throw new Error() }; return flag }
class A1<T> { f: T; m() { return typeof this.f }; constructor(p: T) { this.f = p } }
class A2 {}
class B1 {}

function f1(o: Object) { return typeof o }
function f2(o: A2|B1) { return typeof o }

class AI1 implements I1 {}
let aa1 = 42
type F1 = (p: int) => int
function fooo1(p: int): int {
  return p + p
}
let ff1: F1 = (p: int): int => { return p * p }
enum Color1 { Red, Green, Blue }
enum Size1 { S, M, L, XL }
enum Color2 { Red = "red", Green = "green", Blue = "blue" }
enum Size2 { S = "small", M = "mid", L = "large", XL = "extra-large" }
class CC1<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
class B2 {}
class C2 {}
interface I2 {}
class A3 implements I2 {}
class B3 extends A3 {}
const g1: Comparable<Short> = new Short()
const g2: Comparable<Int> = new Int()
const g3: Comparable<Long> = new Long()
const g4: Comparable<Char> = new Char()
const g5: Floating = 3.14f
const g6: Integral = 42

interface I3 {}
class AA1 implements I1 {}
class A4 implements I3 {}
class A5 implements I3 {}
class BB3 extends A4 {}

class CC2 {}
type FF1 = (p: int) => int

function tof_func_0_foo1(p: number): string { return typeof p }
function tof_func_0_foo2(p: number): string { return typeof p }

function tof_func_1_foo1(p: double): string { return typeof p }
function tof_func_1_foo2(p: double): string { return typeof p }

function tof_func_2_foo1(p: string): string { return typeof p }
function tof_func_2_foo2(p: string): string { return typeof p }
function tof_func_2_foo3(p: string): string { return typeof p }
function tof_func_2_foo4(p: Comparable<String>): string { return typeof p }

function tof_func_3_foo1(p: boolean): string { return typeof p }
function tof_func_3_foo2(p: boolean): string { return typeof p }
function tof_func_3_foo3(p: Comparable<Boolean>): string { return typeof p }

function tof_func_4_foo1(p: bigint): string { return typeof p }
function tof_func_4_foo2(p: bigint): string { return typeof p }

function tof_func_5_foo1(p: AA1): string { return typeof p }
function tof_func_5_foo2(p: I1): string { return typeof p }

function tof_func_6_foo1(p: Numeric): string { return typeof p }

function tof_func_7_foo1(p: number[]): string { return typeof p }
function tof_func_7_foo2(p: number[]): string { return typeof p }

function tof_func_8_foo1(p: byte[]): string { return typeof p }
function tof_func_8_foo2(p: short[]): string { return typeof p }
function tof_func_8_foo3(p: int[]): string { return typeof p }
function tof_func_8_foo4(p: long[]): string { return typeof p }
function tof_func_8_foo5(p: float[]): string { return typeof p }
function tof_func_8_foo6(p: double[]): string { return typeof p }
function tof_func_8_foo7(p: char[]): string { return typeof p }

function tof_func_9_foo1(p: AA1[]): string { return typeof p }
function tof_func_9_foo2(p: I1[]): string { return typeof p }
function tof_func_9_foo3(p: Comparable<Float>[]): string { return typeof p }

function tof_func_10_foo1(p: Floating[]): string { return typeof p }
function tof_func_10_foo2(p: Integral[]): string { return typeof p }
function tof_func_10_foo3(p: Numeric[]): string { return typeof p }

function tof_func_11_foo1(p: FF1): string { return typeof p }
function tof_func_11_foo2(p: ((p: int) => int)): string { return typeof p }
function tof_func_11_foo3(p: FF1): string { return typeof p }
function tof_func_11_foo4(p: ((p: int) => int)): string { return typeof p }
function tof_func_11_foo5(p: (() => void)): string { return typeof p }

function tof_func_12_foo1(p: undefined): string { return typeof p }

function tof_func_13_foo1(p: null): string { return typeof p }

function tof_func_14_foo1(p: A2|null): string { return typeof p }
function tof_func_14_foo2(p: A2|null): string { return typeof p }
function tof_func_14_foo3(p: I3|null): string { return typeof p }
function tof_func_14_foo4(p: I3|null): string { return typeof p }
function tof_func_14_foo5(p: A2[]|null): string { return typeof p }
function tof_func_14_foo6(p: A2[]|null): string { return typeof p }
function tof_func_14_foo7(p: I3[]|null): string { return typeof p }
function tof_func_14_foo8(p: I3[]|null): string { return typeof p }

function tof_func_15_foo1(p: Color1): string { return typeof p }
function tof_func_15_foo2(p: Size1): string { return typeof p }

function tof_func_16_foo1(p: Color2): string { return typeof p }
function tof_func_16_foo2(p: Size2): string { return typeof p }

function tof_func_17_foo1(p: number|string|boolean): string { return typeof p }
function tof_func_17_foo2(p: number|boolean): string { return typeof p }
function tof_func_17_foo3(p: boolean|never|long): string { return typeof p }

function tof_func_18_foo1(p: number|string|boolean): string { return typeof p }
function tof_func_18_foo2(p: number|string): string { return typeof p }
function tof_func_18_foo3(p: boolean|never|long|string): string { return typeof p }

function tof_func_19_foo1(p: A3|B2|CC2): string { return typeof p }
function tof_func_19_foo2(p: B2|never|undefined|A3): string { return typeof p }

function tof_func_20_foo1(p: CC1<A2>): string { return typeof p }
function tof_func_20_foo2(p: CC1<B1>): string { return typeof p }
function tof_func_20_foo3(p: CC1<I3>): string { return typeof p }

function tof_func_21_foo1(p: Comparable<Double>): string { return typeof p }

function tof_func_22_foo1(p: byte): string { return typeof p }
function tof_func_22_foo2(p: byte): string { return typeof p }

function tof_func_23_foo1(p: short): string { return typeof p }
function tof_func_23_foo2(p: short): string { return typeof p }

function tof_func_24_foo1(p: int): string { return typeof p }
function tof_func_24_foo2(p: int): string { return typeof p }

function tof_func_25_foo1(p: long): string { return typeof p }
function tof_func_25_foo2(p: long): string { return typeof p }

function tof_func_26_foo1(p: float): string { return typeof p }
function tof_func_26_foo2(p: float): string { return typeof p }

function tof_func_27_foo1(p: char): string { return typeof p }
function tof_func_27_foo2(p: char): string { return typeof p }

function tof_func_28_foo1(p: Comparable<Float>): string { return typeof p }

function tof_func_29_foo1(p: Comparable<Byte>): string { return typeof p }

function tof_func_30_foo1(p: Comparable<Short>): string { return typeof p }

function tof_func_31_foo1(p: Comparable<Int>): string { return typeof p }

function tof_func_32_foo1(p: Comparable<Long>): string { return typeof p }

function tof_func_33_foo1(p: Comparable<Char>): string { return typeof p }

function tof_func_34_foo1(p: Floating): string { return typeof p }

function tof_func_35_foo1(p: Integral): string { return typeof p }

function tof_func_11_original_foo(p: int): int { return p + p }

class tof_meth_0_Z1 {
  fld: string = ""
  constructor(p: number) {
    this.fld = typeof p
  }
  meth(p: number): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_0_Z2 {
  fld: string = ""
  constructor(p: number) {
    this.fld = typeof p
  }
  meth(p: number): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_1_Z1 {
  fld: string = ""
  constructor(p: double) {
    this.fld = typeof p
  }
  meth(p: double): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_1_Z2 {
  fld: string = ""
  constructor(p: double) {
    this.fld = typeof p
  }
  meth(p: double): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

let tof_meth_2_a = 42
class tof_meth_2_Z1 {
  fld: string = ""
  constructor(p: string) {
    this.fld = typeof p
  }
  meth(p: string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z2 {
  fld: string = ""
  constructor(p: string) {
    this.fld = typeof p
  }
  meth(p: string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z3 {
  fld: string = ""
  constructor(p: string) {
    this.fld = typeof p
  }
  meth(p: string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z4 {
  fld: string = ""
  constructor(p: String) {
    this.fld = typeof p
  }
  meth(p: String): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z5 {
  fld: string = ""
  constructor(p: String) {
    this.fld = typeof p
  }
  meth(p: String): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z6 {
  fld: string = ""
  constructor(p: String) {
    this.fld = typeof p
  }
  meth(p: String): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_2_Z7 {
  fld: string = ""
  constructor(p: Comparable<String>) {
    this.fld = typeof p
  }
  meth(p: Comparable<String>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_3_Z1 {
  fld: string = ""
  constructor(p: boolean) {
    this.fld = typeof p
  }
  meth(p: boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_3_Z2 {
  fld: string = ""
  constructor(p: boolean) {
    this.fld = typeof p
  }
  meth(p: boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_3_Z3 {
  fld: string = ""
  constructor(p: Comparable<Boolean>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Boolean>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_4_Z1 {
  fld: string = ""
  constructor(p: bigint) {
    this.fld = typeof p
  }
  meth(p: bigint): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_4_Z2 {
  fld: string = ""
  constructor(p: bigint) {
    this.fld = typeof p
  }
  meth(p: bigint): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

interface tof_meth_5_I {}
class tof_meth_5_A implements tof_meth_5_I {}
class tof_meth_5_Z1 {
  fld: string = ""
  constructor(p: tof_meth_5_A) {
    this.fld = typeof p
  }
  meth(p: tof_meth_5_A): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_5_Z2 {
  fld: string = ""
  constructor(p: tof_meth_5_I) {
    this.fld = typeof p
  }
  meth(p: tof_meth_5_I): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_6_Z1 {
  fld: string = ""
  constructor(p: Numeric) {
    this.fld = typeof p
  }
  meth(p: Numeric): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_7_Z1 {
  fld: string = ""
  constructor(p: number[]) {
    this.fld = typeof p
  }
  meth(p: number[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_7_Z2 {
  fld: string = ""
  constructor(p: number[]) {
    this.fld = typeof p
  }
  meth(p: number[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_8_Z1 {
  fld: string = ""
  constructor(p: byte[]) {
    this.fld = typeof p
  }
  meth(p: byte[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z2 {
  fld: string = ""
  constructor(p: short[]) {
    this.fld = typeof p
  }
  meth(p: short[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z3 {
  fld: string = ""
  constructor(p: int[]) {
    this.fld = typeof p
  }
  meth(p: int[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z4 {
  fld: string = ""
  constructor(p: long[]) {
    this.fld = typeof p
  }
  meth(p: long[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z5 {
  fld: string = ""
  constructor(p: float[]) {
    this.fld = typeof p
  }
  meth(p: float[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z6 {
  fld: string = ""
  constructor(p: double[]) {
    this.fld = typeof p
  }
  meth(p: double[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_8_Z7 {
  fld: string = ""
  constructor(p: char[]) {
    this.fld = typeof p
  }
  meth(p: char[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

interface tof_meth_9_I {}
class tof_meth_9_A implements tof_meth_9_I {}
class tof_meth_9_Z1 {
  fld: string = ""
  constructor(p: tof_meth_9_A[]) {
    this.fld = typeof p
  }
  meth(p: tof_meth_9_A[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_9_Z2 {
  fld: string = ""
  constructor(p: tof_meth_9_I[]) {
    this.fld = typeof p
  }
  meth(p: tof_meth_9_I[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_9_Z3 {
  fld: string = ""
  constructor(p: Comparable<Float>[]) {
    this.fld = typeof p
  }
  meth(p: Comparable<Float>[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_10_Z1 {
  fld: string = ""
  constructor(p: Floating[]) {
    this.fld = typeof p
  }
  meth(p: Floating[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_10_Z2 {
  fld: string = ""
  constructor(p: Integral[]) {
    this.fld = typeof p
  }
  meth(p: Integral[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_10_Z3 {
  fld: string = ""
  constructor(p: Numeric[]) {
    this.fld = typeof p
  }
  meth(p: Numeric[]): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

type tof_meth_11_F = (p: int) => int
function tof_meth_11_foo(p: int): int {
  return p + p
}
let tof_meth_11_f: tof_meth_11_F = (p: int): int => { return p * p }
class tof_meth_11_Z1 {
  fld: string = ""
  constructor(p: tof_meth_11_F) {
    this.fld = typeof p
  }
  meth(p: tof_meth_11_F): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_11_Z2 {
  fld: string = ""
  constructor(p: ((p: int) => int)) {
    this.fld = typeof p
  }
  meth(p: ((p: int) => int)): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_11_Z3 {
  fld: string = ""
  constructor(p: tof_meth_11_F) {
    this.fld = typeof p
  }
  meth(p: tof_meth_11_F): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_11_Z4 {
  fld: string = ""
  constructor(p: ((p: int) => int)) {
    this.fld = typeof p
  }
  meth(p: ((p: int) => int)): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_11_Z5 {
  fld: string = ""
  constructor(p: (() => void)) {
    this.fld = typeof p
  }
  meth(p: (() => void)): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_12_Z1 {
  fld: string = ""
  constructor(p: undefined) {
    this.fld = typeof p
  }
  meth(p: undefined): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_13_Z1 {
  fld: string = ""
  constructor(p: null) {
    this.fld = typeof p
  }
  meth(p: null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

interface tof_meth_14_I {}
class tof_meth_14_A implements tof_meth_14_I {}
class tof_meth_14_Z1 {
  fld: string = ""
  constructor(p: tof_meth_14_A|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_A|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z2 {
  fld: string = ""
  constructor(p: tof_meth_14_A|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_A|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z3 {
  fld: string = ""
  constructor(p: tof_meth_14_I|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_I|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z4 {
  fld: string = ""
  constructor(p: tof_meth_14_I|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_I|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z5 {
  fld: string = ""
  constructor(p: tof_meth_14_A[]|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_A[]|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z6 {
  fld: string = ""
  constructor(p: tof_meth_14_A[]|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_A[]|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z7 {
  fld: string = ""
  constructor(p: tof_meth_14_I[]|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_I[]|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_14_Z8 {
  fld: string = ""
  constructor(p: tof_meth_14_I[]|null) {
    this.fld = typeof p
  }
  meth(p: tof_meth_14_I[]|null): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

enum tof_meth_15_Color { Red, Green, Blue }
enum tof_meth_15_Size { S, M, L, XL }
class tof_meth_15_Z1 {
  fld: string = ""
  constructor(p: tof_meth_15_Color) {
    this.fld = typeof p
  }
  meth(p: tof_meth_15_Color): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_15_Z2 {
  fld: string = ""
  constructor(p: tof_meth_15_Size) {
    this.fld = typeof p
  }
  meth(p: tof_meth_15_Size): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

enum tof_meth_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_meth_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
class tof_meth_16_Z1 {
  fld: string = ""
  constructor(p: tof_meth_16_Color) {
    this.fld = typeof p
  }
  meth(p: tof_meth_16_Color): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_16_Z2 {
  fld: string = ""
  constructor(p: tof_meth_16_Size) {
    this.fld = typeof p
  }
  meth(p: tof_meth_16_Size): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_17_Z1 {
  fld: string = ""
  constructor(p: number|string|boolean) {
    this.fld = typeof p
  }
  meth(p: number|string|boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_17_Z2 {
  fld: string = ""
  constructor(p: number|boolean) {
    this.fld = typeof p
  }
  meth(p: number|boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_17_Z3 {
  fld: string = ""
  constructor(p: boolean|never|long) {
    this.fld = typeof p
  }
  meth(p: boolean|never|long): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_18_Z1 {
  fld: string = ""
  constructor(p: number|string|boolean) {
    this.fld = typeof p
  }
  meth(p: number|string|boolean): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_18_Z2 {
  fld: string = ""
  constructor(p: number|string) {
    this.fld = typeof p
  }
  meth(p: number|string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_18_Z3 {
  fld: string = ""
  constructor(p: boolean|never|long|string) {
    this.fld = typeof p
  }
  meth(p: boolean|never|long|string): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_19_A {}
class tof_meth_19_B {}
class tof_meth_19_C {}
class tof_meth_19_Z1 {
  fld: string = ""
  constructor(p: tof_meth_19_A|tof_meth_19_B|tof_meth_19_C) {
    this.fld = typeof p
  }
  meth(p: tof_meth_19_A|tof_meth_19_B|tof_meth_19_C): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_19_Z2 {
  fld: string = ""
  constructor(p: tof_meth_19_B|never|undefined|tof_meth_19_A) {
    this.fld = typeof p
  }
  meth(p: tof_meth_19_B|never|undefined|tof_meth_19_A): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

interface tof_meth_20_I {}
class tof_meth_20_A implements tof_meth_20_I {}
class tof_meth_20_B extends tof_meth_20_A {}
class tof_meth_20_C<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
class tof_meth_20_Z1 {
  fld: string = ""
  constructor(p: tof_meth_20_C<tof_meth_20_A>) {
    this.fld = typeof p
  }
  meth(p: tof_meth_20_C<tof_meth_20_A>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_20_Z2 {
  fld: string = ""
  constructor(p: tof_meth_20_C<tof_meth_20_B>) {
    this.fld = typeof p
  }
  meth(p: tof_meth_20_C<tof_meth_20_B>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_20_Z3 {
  fld: string = ""
  constructor(p: tof_meth_20_C<tof_meth_20_I>) {
    this.fld = typeof p
  }
  meth(p: tof_meth_20_C<tof_meth_20_I>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_21_Z1 {
  fld: string = ""
  constructor(p: Comparable<Double>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Double>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_22_Z1 {
  fld: string = ""
  constructor(p: byte) {
    this.fld = typeof p
  }
  meth(p: byte): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_22_Z2 {
  fld: string = ""
  constructor(p: byte) {
    this.fld = typeof p
  }
  meth(p: byte): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_23_Z1 {
  fld: string = ""
  constructor(p: short) {
    this.fld = typeof p
  }
  meth(p: short): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_23_Z2 {
  fld: string = ""
  constructor(p: short) {
    this.fld = typeof p
  }
  meth(p: short): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_24_Z1 {
  fld: string = ""
  constructor(p: int) {
    this.fld = typeof p
  }
  meth(p: int): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_24_Z2 {
  fld: string = ""
  constructor(p: int) {
    this.fld = typeof p
  }
  meth(p: int): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_25_Z1 {
  fld: string = ""
  constructor(p: long) {
    this.fld = typeof p
  }
  meth(p: long): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_25_Z2 {
  fld: string = ""
  constructor(p: long) {
    this.fld = typeof p
  }
  meth(p: long): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_26_Z1 {
  fld: string = ""
  constructor(p: float) {
    this.fld = typeof p
  }
  meth(p: float): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_26_Z2 {
  fld: string = ""
  constructor(p: float) {
    this.fld = typeof p
  }
  meth(p: float): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_27_Z1 {
  fld: string = ""
  constructor(p: char) {
    this.fld = typeof p
  }
  meth(p: char): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}
class tof_meth_27_Z2 {
  fld: string = ""
  constructor(p: char) {
    this.fld = typeof p
  }
  meth(p: char): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_28_Z1 {
  fld: string = ""
  constructor(p: Comparable<Float>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Float>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_29_Z1 {
  fld: string = ""
  constructor(p: Comparable<Byte>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Byte>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_30_Z1 {
  fld: string = ""
  constructor(p: Comparable<Short>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Short>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_31_Z1 {
  fld: string = ""
  constructor(p: Comparable<Int>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Int>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_32_Z1 {
  fld: string = ""
  constructor(p: Comparable<Long>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Long>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_33_Z1 {
  fld: string = ""
  constructor(p: Comparable<Char>) {
    this.fld = typeof p
  }
  meth(p: Comparable<Char>): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_34_Z1 {
  fld: string = ""
  constructor(p: Floating) {
    this.fld = typeof p
  }
  meth(p: Floating): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_meth_35_Z1 {
  fld: string = ""
  constructor(p: Integral) {
    this.fld = typeof p
  }
  meth(p: Integral): string {
    return this.fld == typeof p ? this.fld : "error"
  }
}

class tof_obj_0_Z1 {
  fld: number
}
class tof_obj_0_Z2 {
  fld: number
}

class tof_obj_1_Z1 {
  fld: double
}
class tof_obj_1_Z2 {
  fld: double
}

let tof_obj_2_a = 42
class tof_obj_2_Z1 {
  fld: string = ""
}
class tof_obj_2_Z2 {
  fld: string = ""
}
class tof_obj_2_Z3 {
  fld: string = ""
}
class tof_obj_2_Z4 {
  fld: Comparable<String> = ""
}

class tof_obj_3_Z1 {
  fld: boolean
}
class tof_obj_3_Z2 {
  fld: boolean
}
class tof_obj_3_Z3 {
  fld: Comparable<Boolean> = false
}

class tof_obj_4_Z1 {
  fld: bigint = 0n
}
class tof_obj_4_Z2 {
  fld: bigint = 0n
}

interface tof_obj_5_I {}
class tof_obj_5_A implements tof_obj_5_I {}
class tof_obj_5_Z1 {
  fld: tof_obj_5_A = new tof_obj_5_A()
}
class tof_obj_5_Z2 {
  fld: tof_obj_5_I = new tof_obj_5_A()
}

class tof_obj_6_Z1 {
  fld: Numeric = 0
}

class tof_obj_7_Z1 {
  fld: number[] = []
}
class tof_obj_7_Z2 {
  fld: number[] = []
}

class tof_obj_8_Z1 {
  fld: byte[] = []
}
class tof_obj_8_Z2 {
  fld: short[] = []
}
class tof_obj_8_Z3 {
  fld: int[] = []
}
class tof_obj_8_Z4 {
  fld: long[] = []
}
class tof_obj_8_Z5 {
  fld: float[] = []
}
class tof_obj_8_Z6 {
  fld: double[] = []
}
class tof_obj_8_Z7 {
  fld: char[] = []
}

interface tof_obj_9_I {}
class tof_obj_9_A implements tof_obj_9_I {}
class tof_obj_9_Z1 {
  fld: tof_obj_9_A[] = []
}
class tof_obj_9_Z2 {
  fld: tof_obj_9_I[] = []
}
class tof_obj_9_Z3 {
  fld: Comparable<Float>[] = []
}

class tof_obj_10_Z1 {
  fld: Floating[] = []
}
class tof_obj_10_Z2 {
  fld: Integral[] = []
}
class tof_obj_10_Z3 {
  fld: Numeric[] = []
}

type tof_obj_11_F = (p: int) => int
function tof_obj_11_foo(p: int): int {
  return p + p
}
let tof_obj_11_f: tof_obj_11_F = (p: int): int => { return p * p }
class tof_obj_11_Z1 {
  fld: tof_obj_11_F = (p: int) => 0
}
class tof_obj_11_Z2 {
  fld: ((p: int) => int) = (p: int) => 0
}
class tof_obj_11_Z3 {
  fld: tof_obj_11_F = (p: int) => 0
}
class tof_obj_11_Z4 {
  fld: ((p: int) => int) = (p: int) => 0
}
class tof_obj_11_Z5 {
  fld: (() => void) = () => {}
}

class tof_obj_12_Z1 {
  fld: undefined
}

class tof_obj_13_Z1 {
  fld: null = null
}

interface tof_obj_14_I {}
class tof_obj_14_A implements tof_obj_14_I {}
class tof_obj_14_Z1 {
  fld: tof_obj_14_A|null = null
}
class tof_obj_14_Z2 {
  fld: tof_obj_14_A|null = null
}
class tof_obj_14_Z3 {
  fld: tof_obj_14_I|null = null
}
class tof_obj_14_Z4 {
  fld: tof_obj_14_I|null = null
}
class tof_obj_14_Z5 {
  fld: tof_obj_14_A[]|null = null
}
class tof_obj_14_Z6 {
  fld: tof_obj_14_A[]|null = null
}
class tof_obj_14_Z7 {
  fld: tof_obj_14_I[]|null = null
}
class tof_obj_14_Z8 {
  fld: tof_obj_14_I[]|null = null
}

enum tof_obj_15_Color { Red, Green, Blue }
enum tof_obj_15_Size { S, M, L, XL }
class tof_obj_15_Z1 {
  fld: tof_obj_15_Color = tof_obj_15_Color.Red
}
class tof_obj_15_Z2 {
  fld: tof_obj_15_Size = tof_obj_15_Size.S
}

enum tof_obj_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_obj_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
class tof_obj_16_Z1 {
  fld: tof_obj_16_Color = tof_obj_16_Color.Red
}
class tof_obj_16_Z2 {
  fld: tof_obj_16_Size = tof_obj_16_Size.S
}

class tof_obj_17_Z1 {
  fld: number|string|boolean = 0
}
class tof_obj_17_Z2 {
  fld: number|boolean = 0
}
class tof_obj_17_Z3 {
  fld: boolean|never|long = false
}

class tof_obj_18_Z1 {
  fld: number|string|boolean = 0
}
class tof_obj_18_Z2 {
  fld: number|string = 0
}
class tof_obj_18_Z3 {
  fld: boolean|never|long|string = false
}

class tof_obj_19_A {}
class tof_obj_19_B {}
class tof_obj_19_C {}
class tof_obj_19_Z1 {
  fld: tof_obj_19_A|tof_obj_19_B|tof_obj_19_C = new tof_obj_19_A()
}
class tof_obj_19_Z2 {
  fld: tof_obj_19_B|never|undefined|tof_obj_19_A
}

interface tof_obj_20_I {}
class tof_obj_20_A implements tof_obj_20_I {}
class tof_obj_20_B extends tof_obj_20_A {}
class tof_obj_20_C<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
class tof_obj_20_Z1 {
  fld: tof_obj_20_C<tof_obj_20_A> = new tof_obj_20_C<tof_obj_20_A>(new tof_obj_20_A())
}
class tof_obj_20_Z2 {
  fld: tof_obj_20_C<tof_obj_20_B> = new tof_obj_20_C<tof_obj_20_B>(new tof_obj_20_B())
}
class tof_obj_20_Z3 {
  fld: tof_obj_20_C<tof_obj_20_I> = new tof_obj_20_C<tof_obj_20_I>(new tof_obj_20_A())
}

class tof_obj_21_Z1 {
  fld: Comparable<Double> = new Double()
}

class tof_obj_22_Z1 {
  fld: byte
}
class tof_obj_22_Z2 {
  fld: byte
}

class tof_obj_23_Z1 {
  fld: short
}
class tof_obj_23_Z2 {
  fld: short
}

class tof_obj_24_Z1 {
  fld: int
}
class tof_obj_24_Z2 {
  fld: int
}

class tof_obj_25_Z1 {
  fld: long
}
class tof_obj_25_Z2 {
  fld: long
}

class tof_obj_26_Z1 {
  fld: float
}
class tof_obj_26_Z2 {
  fld: float
}

class tof_obj_27_Z1 {
  fld: char
}
class tof_obj_27_Z2 {
  fld: char
}

class tof_obj_28_Z1 {
  fld: Comparable<Float> = new Float()
}

class tof_obj_29_Z1 {
  fld: Comparable<Byte> = new Byte()
}

class tof_obj_30_Z1 {
  fld: Comparable<Short> = new Short()
}

class tof_obj_31_Z1 {
  fld: Comparable<Int> = new Int()
}

class tof_obj_32_Z1 {
  fld: Comparable<Long> = new Long()
}

class tof_obj_33_Z1 {
  fld: Comparable<Char> = new Char()
}

class tof_obj_34_Z1 {
  fld: Floating = 3.14f
}

class tof_obj_35_Z1 {
  fld: Integral = 42
}

let tof_vars_0_g1:number = Number.MIN_VALUE
let tof_vars_0_g2:number = Number.MAX_VALUE

let tof_vars_1_g1:double = Double.MIN_VALUE
let tof_vars_1_g2:double = Double.MAX_VALUE

let tof_vars_2_a = 42
let tof_vars_2_g1:string = "ABC"
let tof_vars_2_g2:string = '' + '' + 'CDE'
let tof_vars_2_g3:string = `a = ${tof_vars_2_a}` + '' + "CDE"
let tof_vars_2_g4:Comparable<String> = "X"

let tof_vars_3_g1:boolean = true
let tof_vars_3_g2:boolean = false
let tof_vars_3_g3:Comparable<Boolean> = new Boolean()

let tof_vars_4_g1:bigint = 123456789012345678901234567890n
let tof_vars_4_g2:bigint = 999999999999999999999999999999n

interface tof_vars_5_I {}
class tof_vars_5_A implements tof_vars_5_I {}
let tof_vars_5_g1:tof_vars_5_A = {}
let tof_vars_5_g2:tof_vars_5_I = new tof_vars_5_A()

let tof_vars_6_g1:Numeric = 3.14

let tof_vars_7_g1:number[] = [Number.MIN_VALUE]
let tof_vars_7_g2:number[] = [Number.MAX_VALUE]

let tof_vars_8_g1:byte[] = [Byte.MIN_VALUE]
let tof_vars_8_g2:short[] = [Short.MIN_VALUE]
let tof_vars_8_g3:int[] = [Int.MAX_VALUE]
let tof_vars_8_g4:long[] = [Long.MIN_VALUE]
let tof_vars_8_g5:float[] = [Float.MIN_VALUE]
let tof_vars_8_g6:double[] = [Double.MIN_VALUE]
let tof_vars_8_g7:char[] = [Char.MIN_VALUE as char]

interface tof_vars_9_I {}
class tof_vars_9_A implements tof_vars_9_I {}
let tof_vars_9_g1:tof_vars_9_A[] = [new tof_vars_9_A]
let tof_vars_9_g2:tof_vars_9_I[] = [new tof_vars_9_A]
let tof_vars_9_g3:Comparable<Float>[] = [3.14f]

let tof_vars_10_g1:Floating[] = [3.14f]
let tof_vars_10_g2:Integral[] = [42]
let tof_vars_10_g3:Numeric[] = [3.14]

type tof_vars_11_F = (p: int) => int
function tof_vars_11_foo(p: int): int {
  return p + p
}
let tof_vars_11_f: tof_vars_11_F = (p: int): int => { return p * p }
let tof_vars_11_g1:tof_vars_11_F = tof_vars_11_foo
let tof_vars_11_g2:((p: int) => int) = tof_vars_11_foo
let tof_vars_11_g3:tof_vars_11_F = tof_vars_11_f
let tof_vars_11_g4:((p: int) => int) = tof_vars_11_f
let tof_vars_11_g5:(() => void) = () => { console.log(1) }

let tof_vars_12_g1:undefined = undefined

let tof_vars_13_g1:null = null

interface tof_vars_14_I {}
class tof_vars_14_A implements tof_vars_14_I {}
let tof_vars_14_g1:tof_vars_14_A|null = new tof_vars_14_A()
let tof_vars_14_g2:tof_vars_14_A|null = null
let tof_vars_14_g3:tof_vars_14_I|null = new tof_vars_14_A()
let tof_vars_14_g4:tof_vars_14_I|null = null
let tof_vars_14_g5:tof_vars_14_A[]|null = [new tof_vars_14_A()]
let tof_vars_14_g6:tof_vars_14_A[]|null = null
let tof_vars_14_g7:tof_vars_14_I[]|null = [new tof_vars_14_A()]
let tof_vars_14_g8:tof_vars_14_I[]|null = null

enum tof_vars_15_Color { Red, Green, Blue }
enum tof_vars_15_Size { S, M, L, XL }
let tof_vars_15_g1:tof_vars_15_Color = tof_vars_15_Color.Red
let tof_vars_15_g2:tof_vars_15_Size = tof_vars_15_Size.XL

enum tof_vars_16_Color { Red = "red", Green = "green", Blue = "blue" }
enum tof_vars_16_Size { S = "small", M = "mid", L = "large", XL = "extra-large" }
let tof_vars_16_g1:tof_vars_16_Color = tof_vars_16_Color.Blue
let tof_vars_16_g2:tof_vars_16_Size = tof_vars_16_Size.L

let tof_vars_17_g1:number|string|boolean = false
let tof_vars_17_g2:number|boolean = true
let tof_vars_17_g3:boolean|never|long = true

let tof_vars_18_g1:number|string|boolean = "false"
let tof_vars_18_g2:number|string = "3.14"
let tof_vars_18_g3:boolean|never|long|string = "1234567890"

class tof_vars_19_A {}
class tof_vars_19_B {}
class tof_vars_19_C {}
let tof_vars_19_g1:tof_vars_19_A|tof_vars_19_B|tof_vars_19_C = new tof_vars_19_A()
let tof_vars_19_g2:tof_vars_19_B|never|undefined|tof_vars_19_A = new tof_vars_19_A()

interface tof_vars_20_I {}
class tof_vars_20_A implements tof_vars_20_I {}
class tof_vars_20_B extends tof_vars_20_A {}
class tof_vars_20_C<T> {
  fld: T
  constructor(p: T) {
    this.fld = p
  }
}
let tof_vars_20_g1:tof_vars_20_C<tof_vars_20_A> = new tof_vars_20_C<tof_vars_20_A>(new tof_vars_20_A())
let tof_vars_20_g2:tof_vars_20_C<tof_vars_20_B> = new tof_vars_20_C<tof_vars_20_B>(new tof_vars_20_B())
let tof_vars_20_g3:tof_vars_20_C<tof_vars_20_I> = new tof_vars_20_C<tof_vars_20_I>(new tof_vars_20_B())

let tof_vars_21_g1:Comparable<Double> = new Double()

let tof_vars_22_g1:byte = Byte.MIN_VALUE
let tof_vars_22_g2:byte = Byte.MAX_VALUE

let tof_vars_23_g1:short = Short.MIN_VALUE
let tof_vars_23_g2:short = Short.MAX_VALUE

let tof_vars_24_g1:int = Int.MIN_VALUE
let tof_vars_24_g2:int = Int.MAX_VALUE

let tof_vars_25_g1:long = Long.MIN_VALUE
let tof_vars_25_g2:long = Long.MAX_VALUE

let tof_vars_26_g1:float = Float.MIN_VALUE
let tof_vars_26_g2:float = Float.MAX_VALUE

let tof_vars_27_g1:char = Char.MIN_VALUE as char
let tof_vars_27_g2:char = Char.MAX_VALUE as char

let tof_vars_28_g1:Comparable<Float> = new Float()

let tof_vars_29_g1:Comparable<Byte> = new Byte()

let tof_vars_30_g1:Comparable<Short> = new Short()

let tof_vars_31_g1:Comparable<Int> = new Int()

let tof_vars_32_g1:Comparable<Long> = new Long()

let tof_vars_33_g1:Comparable<Char> = new Char()

let tof_vars_34_g1:Floating = 3.14f

let tof_vars_35_g1:Integral = 42

export default function ExpressionsTypeTwoTest(): void {
  describe("ExpressionsTypeTwoTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0100
     * @tc.name      testExpressionsTypeTwo0001
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_14_A|null = new tof_vars_14_A()
      expect(typeof data1).assertEqual("object")
      expect(typeof tof_vars_14_g1).assertEqual("object")
      let data2:tof_vars_14_A|null = null
      expect(typeof data2).assertEqual("object")
      expect(typeof tof_vars_14_g2).assertEqual("object")
      let data3:tof_vars_14_I|null = new tof_vars_14_A()
      expect(typeof data3).assertEqual("object")
      expect(typeof tof_vars_14_g3).assertEqual("object")
      let data4:tof_vars_14_I|null = null
      expect(typeof data4).assertEqual("object")
      expect(typeof tof_vars_14_g4).assertEqual("object")
      let data5:tof_vars_14_A[]|null = [new tof_vars_14_A()]
      expect(typeof data5).assertEqual("object")
      expect(typeof tof_vars_14_g5).assertEqual("object")
      let data6:tof_vars_14_A[]|null = null
      expect(typeof data6).assertEqual("object")
      expect(typeof tof_vars_14_g6).assertEqual("object")
      let data7:tof_vars_14_I[]|null = [new tof_vars_14_A()]
      expect(typeof data7).assertEqual("object")
      expect(typeof tof_vars_14_g7).assertEqual("object")
      let data8:tof_vars_14_I[]|null = null
      expect(typeof data8).assertEqual("object")
      expect(typeof tof_vars_14_g8).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0200
     * @tc.name      testExpressionsTypeTwo0002
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_15_Color = tof_vars_15_Color.Red
      expect(typeof data1).assertEqual("int")
      expect(typeof tof_vars_15_g1).assertEqual("int")
      let data2:tof_vars_15_Size = tof_vars_15_Size.XL
      expect(typeof data2).assertEqual("int")
      expect(typeof tof_vars_15_g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0300
     * @tc.name      testExpressionsTypeTwo0003
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_16_Color = tof_vars_16_Color.Blue
      expect(typeof data1).assertEqual("string")
      expect(typeof tof_vars_16_g1).assertEqual("string")
      let data2:tof_vars_16_Size = tof_vars_16_Size.L
      expect(typeof data2).assertEqual("string")
      expect(typeof tof_vars_16_g2).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0400
     * @tc.name      testExpressionsTypeTwo0004
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:number|string|boolean = false
      expect(typeof data1).assertEqual("boolean")
      expect(typeof tof_vars_17_g1).assertEqual("boolean")
      let data2:number|boolean = true
      expect(typeof data2).assertEqual("boolean")
      expect(typeof tof_vars_17_g2).assertEqual("boolean")
      let data3:boolean|never|long = true
      expect(typeof data3).assertEqual("boolean")
      expect(typeof tof_vars_17_g3).assertEqual("boolean")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0500
     * @tc.name      testExpressionsTypeTwo0005
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:number|string|boolean = "false"
      expect(typeof data1).assertEqual("string")
      expect(typeof tof_vars_18_g1).assertEqual("string")
      let data2:number|string = "3.14"
      expect(typeof data2).assertEqual("string")
      expect(typeof tof_vars_18_g2).assertEqual("string")
      let data3:boolean|never|long|string = "1234567890"
      expect(typeof data3).assertEqual("string")
      expect(typeof tof_vars_18_g3).assertEqual("string")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0600
     * @tc.name      testExpressionsTypeTwo0006
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_19_A|tof_vars_19_B|tof_vars_19_C = new tof_vars_19_A()
      expect(typeof data1).assertEqual("object")
      expect(typeof tof_vars_19_g1).assertEqual("object")
      let data2:tof_vars_19_B|never|undefined|tof_vars_19_A = new tof_vars_19_A()
      expect(typeof data2).assertEqual("object")
      expect(typeof tof_vars_19_g2).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0700
     * @tc.name      testExpressionsTypeTwo0007
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:tof_vars_20_C<tof_vars_20_A> = new tof_vars_20_C<tof_vars_20_A>(new tof_vars_20_A())
      expect(typeof data1).assertEqual("object")
      expect(typeof tof_vars_20_g1).assertEqual("object")
      let data2:tof_vars_20_C<tof_vars_20_B> = new tof_vars_20_C<tof_vars_20_B>(new tof_vars_20_B())
      expect(typeof data2).assertEqual("object")
      expect(typeof tof_vars_20_g2).assertEqual("object")
      let data3:tof_vars_20_C<tof_vars_20_I> = new tof_vars_20_C<tof_vars_20_I>(new tof_vars_20_B())
      expect(typeof data3).assertEqual("object")
      expect(typeof tof_vars_20_g3).assertEqual("object")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0800
     * @tc.name      testExpressionsTypeTwo0008
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Double> = new Double()
      expect(typeof data1).assertEqual("number")
      expect(typeof tof_vars_21_g1).assertEqual("number")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_0900
     * @tc.name      testExpressionsTypeTwo0009
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:byte = Byte.MIN_VALUE
      expect(typeof data1).assertEqual("byte")
      expect(typeof tof_vars_22_g1).assertEqual("byte")
      let data2:byte = Byte.MAX_VALUE
      expect(typeof data2).assertEqual("byte")
      expect(typeof tof_vars_22_g2).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1000
     * @tc.name      testExpressionsTypeTwo0010
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:short = Short.MIN_VALUE
      expect(typeof data1).assertEqual("short")
      expect(typeof tof_vars_23_g1).assertEqual("short")
      let data2:short = Short.MAX_VALUE
      expect(typeof data2).assertEqual("short")
      expect(typeof tof_vars_23_g2).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1100
     * @tc.name      testExpressionsTypeTwo0011
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:int = Int.MIN_VALUE
      expect(typeof data1).assertEqual("int")
      expect(typeof tof_vars_24_g1).assertEqual("int")
      let data2:int = Int.MAX_VALUE
      expect(typeof data2).assertEqual("int")
      expect(typeof tof_vars_24_g2).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1200
     * @tc.name      testExpressionsTypeTwo0012
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:long = Long.MIN_VALUE
      expect(typeof data1).assertEqual("long")
      expect(typeof tof_vars_25_g1).assertEqual("long")
      let data2:long = Long.MAX_VALUE
      expect(typeof data2).assertEqual("long")
      expect(typeof tof_vars_25_g2).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1300
     * @tc.name      testExpressionsTypeTwo0013
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:float = Float.MIN_VALUE
      expect(typeof data1).assertEqual("float")
      expect(typeof tof_vars_26_g1).assertEqual("float")
      let data2:float = Float.MAX_VALUE
      expect(typeof data2).assertEqual("float")
      expect(typeof tof_vars_26_g2).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1400
     * @tc.name      testExpressionsTypeTwo0014
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:char = Char.MIN_VALUE as char
      expect(typeof data1).assertEqual("char")
      expect(typeof tof_vars_27_g1).assertEqual("char")
      let data2:char = Char.MAX_VALUE as char
      expect(typeof data2).assertEqual("char")
      expect(typeof tof_vars_27_g2).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1500
     * @tc.name      testExpressionsTypeTwo0015
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Float> = new Float()
      expect(typeof data1).assertEqual("float")
      expect(typeof tof_vars_28_g1).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1600
     * @tc.name      testExpressionsTypeTwo0016
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Byte> = new Byte()
      expect(typeof data1).assertEqual("byte")
      expect(typeof tof_vars_29_g1).assertEqual("byte")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1700
     * @tc.name      testExpressionsTypeTwo0017
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Short> = new Short()
      expect(typeof data1).assertEqual("short")
      expect(typeof tof_vars_30_g1).assertEqual("short")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1800
     * @tc.name      testExpressionsTypeTwo0018
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Int> = new Int()
      expect(typeof data1).assertEqual("int")
      expect(typeof tof_vars_31_g1).assertEqual("int")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_1900
     * @tc.name      testExpressionsTypeTwo0019
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Long> = new Long()
      expect(typeof data1).assertEqual("long")
      expect(typeof tof_vars_32_g1).assertEqual("long")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_2000
     * @tc.name      testExpressionsTypeTwo0020
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Comparable<Char> = new Char()
      expect(typeof data1).assertEqual("char")
      expect(typeof tof_vars_33_g1).assertEqual("char")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_2100
     * @tc.name      testExpressionsTypeTwo0021
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Floating = 3.14f
      expect(typeof data1).assertEqual("float")
      expect(typeof tof_vars_34_g1).assertEqual("float")
    });

    /**
     * @tc.number    SUB_EXPRESSIONS_TYPE_TWO_2200
     * @tc.name      testExpressionsTypeTwo0022
     * @tc.desc      Chapter 3.0 states table of Aliases for predefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsTypeTwo0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data1:Integral = 42
      expect(typeof data1).assertEqual("int")
      expect(typeof tof_vars_35_g1).assertEqual("int")
    });
  });
}