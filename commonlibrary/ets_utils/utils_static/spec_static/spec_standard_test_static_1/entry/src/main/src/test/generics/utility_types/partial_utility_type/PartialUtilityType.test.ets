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

//  (29)
// 接口定义
interface I_0 {
  i: number |undefined
}
interface I_1 {
}
interface Issue_0 {
  title: string
  description: string
}
interface I_2 {
  i: number;
  j: string;
}
interface I_3 {
  i: number;
}

// 类定义
class C_0 implements I_0 {
  _i: number|undefined
  set i(i: number|undefined) { this._i = 1; }
  get i(): number|undefined { return this._i; }
}
abstract class C_1 implements I_1 {
  _i: number|undefined
  set i(i: number|undefined) { this._i = 1; }
  get i(): number|undefined { return this._i; }
}
class A_0 implements I_2 {
  _i:number = 0;
  _j:string = "";
  set i(i: number) { z_0 += 1; this._i = i; }
  get i() { z_0 += 10; return this._i; }
  set j(j: string) { z_0 += 5; this._j = j; }
  get j() { z_0 += 50; return this._j; }
}
class C_2 {
  _i: number = 0;
  _j: string = "";
  set i(i: number) { z_1 += 1; this._i = i; }
  get i() { z_1 += 10; return this._i; }
  set j(j: string) { z_1 += 5; this._j = j; }
  get j() { z_1 += 50; return this._j; }
}
class C_3 implements I_2 {
  _i:number = 0;
  _j:string = "";
  set i(i: number) { z_2 += 1; this._i = i; }
  get i() { z_2 += 10; return this._i; }
  set j(j: string) { z_2 += 5; this._j = j; }
  get j() { z_2 += 50; return this._j; }
}
class A_2 implements I_3 {
  j: string = "";
  i: number = 1;
}
class B_0 extends A_2 {
  k: boolean = false;
}

let z_0: int = 0;
let z_1: int = 0;
let z_2: int = 0;
let i_0: int = 0;
interface I {
  i: number
  j: string
}
function foo_3(param: Partial<I>) {
  let v: int = 0;
  if(param.j != null) {
    v += 1;
  }
  if(param.i != 0) {
    v += 2;
  }
  return v;
}
function foo_4(param: Partial<C_2>) {
  let v: int = 0;
  if(param._j != undefined) {
    v += 1;
  }
  if(param._i != 0) {
    v += 2;
  }
  return v;
}
function fooI_0(param: Partial<I_2>) {
  let v: int = 0;
  if(param.j != null) {
    v += 1;
  }
  if(param.i != 0) {
    v += 2;
  }
  return v;
}
function fooC_0(param: Partial<C_3>) {
  let v: int = 0;
  if(param.j != null) {
    v += 1;
  }
  if(param.i != 0) {
    v += 2;
  }
  return v;
}
function process_0(issue: Partial<Issue_0>) {
  if (issue.title != undefined) {
    return 0
  }
  return 1
}
class A_28 {
  i: number = 0
  j: string = ""
}
function foo_28(i: Partial<A_28>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != null) {
    v += 2;
  }
  return v;
}

class A_29 {
  i: number = 0
  j: string = ""
}
function foo_29(i: Partial<A_29>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_30 {
  i: number = 0
  j: string = ""
}
function foo_30(i: Partial<A_30>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_31 {
  i: number = 0
  j: string = ""
}
function foo_31(i: Partial<A_31>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_32 {
  i?: number = 0
  j: string = ""
}
function foo_32(i: Partial<A_32>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_33 {
  i?: number = 0
  j: string = ""
}
function foo_33(i: Partial<A_33>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_34 {
  i?: number = 0
  j: string = ""
}
function foo_34(i: Partial<A_34>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_35 {
  i?: number = 0
  j: string = ""
}
function foo_35(i: Partial<A_35>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_36 {
  i?: number = 0
  j?: string = ""
}
function foo_36(i: Partial<A_36>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_37 {
  i?: number = 0
  j?: string = ""
}
function foo_37(i: Partial<A_37>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_38 {
  i?: number = 0
  j?: string = ""
}
function foo_38(i: Partial<A_38>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_39 {
  i?: number = 0
  j?: string = ""
}
function foo_39(i: Partial<A_39>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_40 {
  i: number = 0
  j?: string = ""
}
function foo_40(i: Partial<A_40>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_41 {
  i: number = 0
  j?: string = ""
}
function foo_41(i: Partial<A_41>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_42 {
  i: number = 0
  j?: string = ""
}
function foo_42(i: Partial<A_42>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_43 {
  i: number = 0
  j?: string = ""
}
function foo_43(i: Partial<A_43>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_44 {
  i: number = 0
  j: string = ""
}
function foo_44(i: Partial<A_44>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_45 {
  i: number = 0
  j: string = ""
}
function foo_45(i: Partial<A_45>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_46 {
  i: number = 0
  j: string = ""
}
function foo_46(i: Partial<A_46>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_47 {
  i: number = 0
  j: string = ""
}
function foo_47(i: Partial<A_47>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_48 {
  i: number = 0
  j: string = ""
}
function foo_48(i: Partial<A_48>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_49 {
  i: number = 0
  j: string = ""
}
function foo_49(i: Partial<A_49>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_50 {
  i: number = 0
  j: string = ""
}
function foo_50(i: Partial<A_50>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_51 {
  i: number = 0
  j: string = ""
}
function foo_51(i: Partial<A_51>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_52 {
  i: number = 0
  j: string = ""
}
function foo_52(i: Partial<A_52>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_53 {
  i: number = 0
  j: string = ""
}
function foo_53(i: Partial<A_53>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_54 {
  i: number = 0
  j: string = ""
}
function foo_54(i: Partial<A_54>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_55 {
  i: number = 0
  j: string = ""
}
function foo_55(i: Partial<A_55>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_56 {
  i: number
  j: string
}
function foo_56(i: Partial<I_56>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_57 {
  i: number
  j: string
}
function foo_57(i: Partial<I_57>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_58 {
  i: number
  j: string
}
function foo_58(i: Partial<I_58>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_59 {
  i: number
  j: string
}
function foo_59(i: Partial<I_59>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_60 {
  i?: number
  j: string
}
function foo_60(i: Partial<I_60>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_61 {
  i?: number
  j: string
}
function foo_61(i: Partial<I_61>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_62 {
  i?: number
  j: string
}
function foo_62(i: Partial<I_62>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_63 {
  i?: number
  j: string
}
function foo_63(i: Partial<I_63>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_64 {
  i?: number
  j?: string
}
function foo_64(i: Partial<I_64>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_65 {
  i?: number
  j?: string
}
function foo_65(i: Partial<I_65>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_66 {
  i?: number
  j?: string
}
function foo_66(i: Partial<I_66>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_67 {
  i?: number
  j?: string
}
function foo_67(i: Partial<I_67>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_68 {
  i: number
  j?: string
}
function foo_68(i: Partial<I_68>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_69 {
  i: number
  j?: string
}
function foo_69(i: Partial<I_69>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_70 {
  i: number
  j?: string
}
function foo_70(i: Partial<I_70>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_71 {
  i: number
  j?: string
}
function foo_71(i: Partial<I_71>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_72 {
  i: number
  j: string
}
function foo_72(i: Partial<I_72>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_73 {
  i: number
  j: string
}
function foo_73(i: Partial<I_73>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_74 {
  i: number
  j: string
}
function foo_74(i: Partial<I_74>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_75 {
  i: number
  j: string
}
function foo_75(i: Partial<I_75>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_76 {
  i: number
  j: string
}
function foo_76(i: Partial<I_76>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_77 {
  i: number
  j: string
}
function foo_77(i: Partial<I_77>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_78 {
  i: number
  j: string
}
function foo_78(i: Partial<I_78>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_79 {
  i: number
  j: string
}
function foo_79(i: Partial<I_79>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_80 {
  i: number
  j: string
}
function foo_80(i: Partial<I_80>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_81 {
  i: number
  j: string
}
function foo_81(i: Partial<I_81>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_82 {
  i: number
  j: string
}
function foo_82(i: Partial<I_82>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

interface I_83 {
  i: number
  j: string
}
function foo_83(i: Partial<I_83>): int {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_84 {
  static i: int = 0
  j: int = 0
}
abstract class AC_85 {
  static i: int = 0
  j: int = 0
}
let firstrun_0 = true
class A_86 {
  static i: int = 1
  j: int = 0
}
type P_0 = Partial<A_86>
function resetFirstrun_0() { firstrun_0 = true; }
let firstrun_1 = true
abstract class AC_87 {
  static i: int = 2
  j: int = 0
}
type P_1 = Partial<AC_87>
function resetFirstrun_1() { firstrun_1 = true; }

class A_88 {
  i: number  = 0
  j: string  = ""
}
type T_88 = Partial<A_88>
type R_88 = A_88
type RP_88 = Partial<R_88>
function foo_88(i: Partial<A_88>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
class A_89 {
  i: number  = 0
  j: string  = ""
}
type T_89 = Partial<A_89>
type R_89 = A_89
type RP_89 = Partial<R_89>
function foo_89(i: Partial<A_89>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
class A_90 {
  i: number  = 0
  j: string  = ""
}
type T_90 = Partial<A_90>
type R_90 = A_90
type RP_90 = Partial<R_90>
function foo_90(i: Partial<A_90>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
class A_91 {
  i: number  = 0
  j: string  = ""
}
type T_91 = Partial<A_91>
type R_91 = A_91
type RP_91 = Partial<R_91>
function foo_91(i: Partial<A_91>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
abstract class A_92 {
  i: number  = 0
  j: string  = ""
}
type T_92 = Partial<A_92>
type R_92 = A_92
type RP_92 = Partial<R_92>
function foo_92(i: Partial<A_92>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
abstract class A_93 {
  i: number  = 0
  j: string  = ""
}
type T_93 = Partial<A_93>
type R_93 = A_93
type RP_93 = Partial<R_93>
function foo_93(i: Partial<A_93>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
abstract class A_94 {
  i: number  = 0
  j: string  = ""
}
type T_94 = Partial<A_94>
type R_94 = A_94
type RP_94 = Partial<R_94>
function foo_94(i: Partial<A_94>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
abstract class A_95 {
  i: number  = 0
  j: string  = ""
}
type T_95 = Partial<A_95>
type R_95 = A_95
type RP_95 = Partial<R_95>
function foo_95(i: Partial<A_95>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
interface A_96 {
  i: number
  j: string
}
type T_96 = Partial<A_96>
type R_96 = A_96
type RP_96 = Partial<R_96>
function foo_96(i: Partial<A_96>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
interface A_97 {
  i: number
  j: string
}
type T_97 = Partial<A_97>
type R_97 = A_97
type RP_97 = Partial<R_97>
function foo_97(i: Partial<A_97>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
interface A_98 {
  i: number
  j: string
}
type T_98 = Partial<A_98>
type R_98 = A_98
type RP_98 = Partial<R_98>
function foo_98(i: Partial<A_98>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
interface A_99 {
  i: number
  j: string
}
type T_99 = Partial<A_99>
type R_99 = A_99
type RP_99 = Partial<R_99>
function foo_99(i: Partial<A_99>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function PartialUtilityTypeTest() {
  describe("PartialUtilityTypeTest", () => {
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
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0100
     * @tc.name      testPartialUtilityType0001
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Partial<C_0> = {i: 1.9}
      expect( a.i ).assertEqual(1.9)
      a.i = 2.1
      expect( a.i ).assertEqual(2.1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0200
     * @tc.name      testPartialUtilityType0002
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Partial<C_1> = {i: 1.9}
      expect( a.i ).assertEqual(1.9)
      a.i = 2.1
      expect( a.i ).assertEqual(2.1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0300
     * @tc.name      testPartialUtilityType0003
     * @tc.desc      Use imported interface with mandatory fields as T for Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_3( {i: 1.9, j: "some str"} ) ).assertEqual(3)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0400
     * @tc.name      testPartialUtilityType0004
     * @tc.desc      Use imported interface with mandatory fields as T for Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_3( {i: 1.9} ) ).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0500
     * @tc.name      testPartialUtilityType0005
     * @tc.desc      Use imported interface with mandatory fields as T for Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_3( {j: "some str"} ) ).assertEqual(3)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0600
     * @tc.name      testPartialUtilityType0006
     * @tc.desc      Use imported interface with mandatory fields as T for Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_3( {} ) ).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0700
     * @tc.name      testPartialUtilityType0007
     * @tc.desc      "In the example above, type Partial<Issue> is transformed to a distinct but
     *               analogous type as follows: interface SomeName {\n  title?: string\n  description?:
     *               string\n}"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(process_0({title: "aa"})).assertEqual(0) // description is undefined
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0800
     * @tc.name      testPartialUtilityType0008
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_1 = 0;
      expect( foo_4( {_i: 1.9, _j: "some str"} ) ).assertEqual(3)
      expect( z_1 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_0900
     * @tc.name      testPartialUtilityType0009
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_1 = 0;
      expect( foo_4( {_i: 1.9} ) ).assertEqual(2)
      expect( z_1 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1000
     * @tc.name      testPartialUtilityType0010
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_1 = 0;
      expect( foo_4( {_j: "some str"} ) ).assertEqual(3)
      expect( z_1 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1100
     * @tc.name      testPartialUtilityType0011
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_1 = 0;
      expect( foo_4( {} ) ).assertEqual(2)
      expect( z_1 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1200
     * @tc.name      testPartialUtilityType0012
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_2 = 0;
      expect( fooC_0( {j: "some str", i: 1.9} ) ).assertEqual(3)
      expect( z_2 ).assertEqual(0);
      expect( fooI_0( {j: "some str", i: 1.9} ) ).assertEqual(3)
      expect( z_2 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1300
     * @tc.name      testPartialUtilityType0013
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_2 = 0;
      expect( fooC_0( {i: 1.9} ) ).assertEqual(2)
      expect( z_2 ).assertEqual(0);
      expect( fooI_0( {i: 1.9} ) ).assertEqual(2)
      expect( z_2 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1400
     * @tc.name      testPartialUtilityType0014
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_2 = 0;
      expect( fooC_0( {j: "some str"} ) ).assertEqual(3)
      expect( z_2 ).assertEqual(0);
      expect( fooI_0( {j: "some str"} ) ).assertEqual(3)
      expect( z_2 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1500
     * @tc.name      testPartialUtilityType0015
     * @tc.desc      If class T has a user-defined getter, setter, or both, then none of those is
     *               called when object literal is used with Partial<T> variables. Object literal has
     *               its own built-in getters and setters to modify its variables
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      z_2 = 0;
      expect( fooC_0( {} ) ).assertEqual(2)
      expect( z_2 ).assertEqual(0);
      expect( fooI_0( {} ) ).assertEqual(2)
      expect( z_2 ).assertEqual(0);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1600
     * @tc.name      testPartialUtilityType0016
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_28({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1700
     * @tc.name      testPartialUtilityType0017
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_29({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1800
     * @tc.name      testPartialUtilityType0018
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_30({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_1900
     * @tc.name      testPartialUtilityType0019
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_31({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2000
     * @tc.name      testPartialUtilityType0020
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_32({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2100
     * @tc.name      testPartialUtilityType0021
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_33({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2200
     * @tc.name      testPartialUtilityType0022
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_34({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2300
     * @tc.name      testPartialUtilityType0023
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_35({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2400
     * @tc.name      testPartialUtilityType0024
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_36({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2500
     * @tc.name      testPartialUtilityType0025
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_37({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2600
     * @tc.name      testPartialUtilityType0026
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_38({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2700
     * @tc.name      testPartialUtilityType0027
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_39({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2800
     * @tc.name      testPartialUtilityType0028
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_40({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_2900
     * @tc.name      testPartialUtilityType0029
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_41({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3000
     * @tc.name      testPartialUtilityType0030
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_42({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3100
     * @tc.name      testPartialUtilityType0031
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_43({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3200
     * @tc.name      testPartialUtilityType0032
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_44({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3300
     * @tc.name      testPartialUtilityType0033
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_45({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3400
     * @tc.name      testPartialUtilityType0034
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_46({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3500
     * @tc.name      testPartialUtilityType0035
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_47({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3600
     * @tc.name      testPartialUtilityType0036
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_48({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3700
     * @tc.name      testPartialUtilityType0037
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_49({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3800
     * @tc.name      testPartialUtilityType0038
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_50({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_3900
     * @tc.name      testPartialUtilityType0039
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_51({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4000
     * @tc.name      testPartialUtilityType0040
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_52({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4100
     * @tc.name      testPartialUtilityType0041
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_53({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4200
     * @tc.name      testPartialUtilityType0042
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_54({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4300
     * @tc.name      testPartialUtilityType0043
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_55({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4400
     * @tc.name      testPartialUtilityType0044
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_56({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4500
     * @tc.name      testPartialUtilityType0045
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_57({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4600
     * @tc.name      testPartialUtilityType0046
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_58({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4700
     * @tc.name      testPartialUtilityType0047
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_59({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4800
     * @tc.name      testPartialUtilityType0048
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_60({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_4900
     * @tc.name      testPartialUtilityType0049
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_61({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5000
     * @tc.name      testPartialUtilityType0050
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_62({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5100
     * @tc.name      testPartialUtilityType0051
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_63({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5200
     * @tc.name      testPartialUtilityType0052
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_64({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5300
     * @tc.name      testPartialUtilityType0053
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_65({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5400
     * @tc.name      testPartialUtilityType0054
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_66({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5500
     * @tc.name      testPartialUtilityType0055
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_67({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5600
     * @tc.name      testPartialUtilityType0056
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_68({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5700
     * @tc.name      testPartialUtilityType0057
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_69({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5800
     * @tc.name      testPartialUtilityType0058
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_70({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_5900
     * @tc.name      testPartialUtilityType0059
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_71({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6000
     * @tc.name      testPartialUtilityType0060
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_72({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6100
     * @tc.name      testPartialUtilityType0061
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_73({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6200
     * @tc.name      testPartialUtilityType0062
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_74({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6300
     * @tc.name      testPartialUtilityType0063
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_75({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6400
     * @tc.name      testPartialUtilityType0064
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_76({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6500
     * @tc.name      testPartialUtilityType0065
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_77({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6600
     * @tc.name      testPartialUtilityType0066
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_78({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6700
     * @tc.name      testPartialUtilityType0067
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_79({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6800
     * @tc.name      testPartialUtilityType0068
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_80({i: 1.9, j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_6900
     * @tc.name      testPartialUtilityType0069
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_81({i: 1.9})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7000
     * @tc.name      testPartialUtilityType0070
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_82({j: "some str"})).assertEqual(3);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7100
     * @tc.name      testPartialUtilityType0071
     * @tc.desc      Type Partial<T> constructs a type with all properties of T set to optional.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect( foo_83({})).assertEqual(2);
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7200
     * @tc.name      testPartialUtilityType0072
     * @tc.desc      Type Partial<T> with static fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Partial<A_84> = {j:2}
      expect(a.j).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7300
     * @tc.name      testPartialUtilityType0073
     * @tc.desc      Type Partial<T> with static fields.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Partial<AC_85> = {j:2}
      expect(a.j).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7400
     * @tc.name      testPartialUtilityType0074
     * @tc.desc      'Type Partial<T> with static fields.

    Static field is a part of Partial<T> class. Field becomes optional and, thus, gets
    undefined value.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      resetFirstrun_0();
      let a: P_0 = {j:2}
      if(firstrun_0) {
        expect(P_0.i).assertEqual(undefined)
        P_0.i = 3
        firstrun_0 = false
      }
      expect(P_0.i).assertEqual(3)
      expect(A_86.i).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7500
     * @tc.name      testPartialUtilityType0075
     * @tc.desc      'Type Partial<T> with static fields.

    Static field is a part of Partial<T> class. Field becomes optional and, thus, gets
    undefined value.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      resetFirstrun_1();
      let a: P_1 = {j:2}
      if(firstrun_1) {
        expect(P_1.i).assertEqual(undefined)
        P_1.i = 3
        firstrun_1 = false
      }
      expect(P_1.i).assertEqual(3)
      expect(AC_87.i).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7600
     * @tc.name      testPartialUtilityType0076
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_88 = {i: 1.9, j: "some str"}
      let g: RP_88 = {i: 1.9, j: "some str"}
      expect(foo_88(f)).assertEqual(3)
      expect(foo_88(g)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7700
     * @tc.name      testPartialUtilityType0077
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_89 = {i: 1.9}
      let g: RP_89 = {i: 1.9}
      expect(foo_89(f)).assertEqual(1)
      expect(foo_89(g)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7800
     * @tc.name      testPartialUtilityType0078
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_90 = {j: "some str"}
      let g: RP_90 = {j: "some str"}
      expect(foo_90(f)).assertEqual(2)
      expect(foo_90(g)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_7900
     * @tc.name      testPartialUtilityType0079
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_91 = {}
      let g: RP_91 = {}
      expect(foo_91(f)).assertEqual(0)
      expect(foo_91(g)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8000
     * @tc.name      testPartialUtilityType0080
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_92 = {i: 1.9, j: "some str"}
      let g: RP_92 = {i: 1.9, j: "some str"}
      expect(foo_92(f)).assertEqual(3)
      expect(foo_92(g)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8100
     * @tc.name      testPartialUtilityType0081
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_93 = {i: 1.9}
      let g: RP_93 = {i: 1.9}
      expect(foo_93(f)).assertEqual(1)
      expect(foo_93(g)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8200
     * @tc.name      testPartialUtilityType0082
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_94 = {j: "some str"}
      let g: RP_94 = {j: "some str"}
      expect(foo_94(f)).assertEqual(2)
      expect(foo_94(g)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8300
     * @tc.name      testPartialUtilityType0083
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_95 = {}
      let g: RP_95 = {}
      expect(foo_95(f)).assertEqual(0)
      expect(foo_95(g)).assertEqual(0)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8400
     * @tc.name      testPartialUtilityType0084
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_96 = {i: 1.9, j: "some str"}
      let g: RP_96 = {i: 1.9, j: "some str"}
      expect(foo_96(f)).assertEqual(3)
      expect(foo_96(g)).assertEqual(3)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8500
     * @tc.name      testPartialUtilityType0085
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_97 = {i: 1.9}
      let g: RP_97 = {i: 1.9}
      expect(foo_97(f)).assertEqual(1)
      expect(foo_97(g)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8600
     * @tc.name      testPartialUtilityType0086
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_98 = {j: "some str"}
      let g: RP_98 = {j: "some str"}
      expect(foo_98(f)).assertEqual(2)
      expect(foo_98(g)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_PARTIAL_UTILITY_TYPE_8700
     * @tc.name      testPartialUtilityType0087
     * @tc.desc      Using custom type of Partial<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPartialUtilityType0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_99 = {}
      let g: RP_99 = {}
      expect(foo_99(f)).assertEqual(0)
      expect(foo_99(g)).assertEqual(0)
    })
  });
}