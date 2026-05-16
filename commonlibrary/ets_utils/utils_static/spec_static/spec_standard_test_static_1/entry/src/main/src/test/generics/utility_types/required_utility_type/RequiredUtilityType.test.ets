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

class A_0 {
  i?: number
  j?: string
}
interface A_1 {
  i?: number
  j?: string
}

let c_0: int = 0
abstract class C_0 {
  _i?: number
  set i(i: number|undefined) { c_0 += 1; this._i = i; }
  get i(): number|undefined { c_0 += 2; return this._i; }
}
function reset_c_0() { c_0 = 0; }

let c_1: int = 0
class C_1 {
  _i?: number
  set i(i: number|undefined) { c_1 += 1; this._i = i; }
  get i(): number|undefined { c_1 += 2; return this._i; }
}
function reset_c_1() { c_1 = 0; }

let c_2: int = 0
abstract class C_2 {
  _i?: number
  set i(i: number|undefined) { c_2 += 1; this._i = i; }
  get i(): number|undefined { c_2 += 2; return this._i; }
}
function reset_c_2() { c_2 = 0; }

let c_3: int = 0
class C_3 {
  _i?: number
  set i(i: number|undefined) { c_3 += 1; this._i = i; }
  get i(): number|undefined { c_3 += 2; return this._i; }
}
function reset_c_3() { c_3 = 0; }

interface I_0 {
  set i(i: number|undefined)
  get i(): number|undefined
}

class C_4 {
  i: number = 0
  j: string = ""
}
function foo_2(i: Required<C_4>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}
class C_5 {
  i?: number
  j: string = ""
}
function foo_3(i: Required<C_5>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}
class C_6 {
  i?: number
  j?: string
}
function foo_4(i: Required<C_6>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}
class C_7 {
  i: number = 0
  j?: string
}
function foo_5(i: Required<C_7>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}
class C_8 {
  i?: number
  j?: string
}
function foo_6(i: Required<C_8>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}
class C_9 {
  i: number = 0
  j: string = ""
}
function foo_7(i: Required<C_9>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}
class C_10 {
  i?: number
  j?: string
}
function foo_8(i: Required<C_10>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}
class C_11 {
  i?: number
  j?: string
}
function foo_9(i: Required<C_11>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}
class C_12 {
  i: number = 0
  j: string = ""
}
function foo_10(i: Required<C_12>) {
  let v: int = 0;
  if(i.j != undefined) {
    v += 1;
  }
  if(i.i != 0) {
    v += 2;
  }
  return v;
}

class A_2 {
  i?: number;
  j?: string;
}
type T_0 = Required<A_2>
type R_0 = A_2
type RP_0 = Required<R_0>
function foo_11(i: Required<A_2>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
function foo_12(i: Required<A_2>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
interface A_3 {
  i?: number;
  j?: string;
}
type T_1 = Required<A_3>
type R_1 = A_3
type RP_1 = Required<R_1>
function foo_13(i: Required<A_3>) {
  let a: int = 0;
  if(i.i != null) {
    a += 1;
  }
  if(i.j != undefined) {
    a += 2;
  }
  return a;
}
function foo_14(i: Required<A_3>) {
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

export default function RequiredUtilityTypeTest() {
  describe("RequiredUtilityTypeTest", () => {
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
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0100
     * @tc.name      testRequiredUtilityType0001
     * @tc.desc      Type T is not compatible (see Type Compatibility) with Required<T>, and variables
     *               of Required<T> are to be initialized with valid object literals.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Required<A_0> = {i: 1.9, j: "some str"}
      expect(a.i).assertEqual(1.9)
      expect(a.j).assertEqual("some str")
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0200
     * @tc.name      testRequiredUtilityType0002
     * @tc.desc      Type T is not compatible (see Type Compatibility) with Required<T>, and variables
     *               of Required<T> are to be initialized with valid object literals.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Required<A_1> = {i: 1.9, j: "some str"}
      expect(a.i).assertEqual(1.9)
      expect(a.j).assertEqual("some str")
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0300
     * @tc.name      testRequiredUtilityType0003
     * @tc.desc      No method (including any getter or setter) of T is part of the Required<T> type.
     *               If class T has a user-defined getter, setter, or both, then none of those is called
     *               when object literal is used with Required<T> variables. Object literal has its own
     *               built-in getters and setters to modify its variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      reset_c_0();
      let a: Required<C_0> = {_i: 1.9}
      expect(a._i).assertEqual(1.9)
      expect(c_0).assertEqual(0)
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0400
     * @tc.name      testRequiredUtilityType0004
     * @tc.desc      No method (including any getter or setter) of T is part of the Required<T> type.
     *               If class T has a user-defined getter, setter, or both, then none of those is called
     *               when object literal is used with Required<T> variables. Object literal has its own
     *               built-in getters and setters to modify its variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      reset_c_1();
      let a: Required<C_1> = {_i: 1.9}
      expect(a._i).assertEqual(1.9)
      expect(c_1).assertEqual(0)
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0500
     * @tc.name      testRequiredUtilityType0005
     * @tc.desc      No method (including any getter or setter) of T is part of the Required<T> type.
     *               If class T has a user-defined getter, setter, or both, then none of those is called
     *               when object literal is used with Required<T> variables. Object literal has its own
     *               built-in getters and setters to modify its variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      reset_c_2();
      let a: Required<C_2> = {_i: 1.9}
      a._i = 1.2
      expect(c_2).assertEqual(0)
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0600
     * @tc.name      testRequiredUtilityType0006
     * @tc.desc      No method (including any getter or setter) of T is part of the Required<T> type.
     *               If class T has a user-defined getter, setter, or both, then none of those is called
     *               when object literal is used with Required<T> variables. Object literal has its own
     *               built-in getters and setters to modify its variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      reset_c_3();
      let a: Required<C_3> = {_i: 1.9}
      a._i = 1.2
      expect(c_3).assertEqual(0)
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0700
     * @tc.name      testRequiredUtilityType0007
     * @tc.desc      No method (including any getter or setter) of T is part of the Required<T> type.
     *               Note. If class T has a user-defined getter, setter, or both, then none of those
     *               is called when object literal is used with Required<T> variables. Object literal
     *               has its own built-in getters and setters to modify its variables.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Required<I_0> = {i: 1.9}
      a.i = 1.9
      expect(a.i).assertEqual(1.9)
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0800
     * @tc.name      testRequiredUtilityType0008
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_2({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_0900
     * @tc.name      testRequiredUtilityType0009
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_3({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1000
     * @tc.name      testRequiredUtilityType0010
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_4({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1100
     * @tc.name      testRequiredUtilityType0011
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_5({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1200
     * @tc.name      testRequiredUtilityType0012
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_6({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1300
     * @tc.name      testRequiredUtilityType0013
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_7({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1400
     * @tc.name      testRequiredUtilityType0014
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_8({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1500
     * @tc.name      testRequiredUtilityType0015
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_9({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1600
     * @tc.name      testRequiredUtilityType0016
     * @tc.desc      Type Required<T> constructs a type with all properties of T set to required.
     *               T must be a class or an interface type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(foo_10({i: 1.9, j: "some str"}) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1700
     * @tc.name      testRequiredUtilityType0017
     * @tc.desc      Using custom type of Required<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_0 = {i: 1.9, j: "some str"}
      expect(foo_11(f) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1800
     * @tc.name      testRequiredUtilityType0018
     * @tc.desc      Using custom type of Required<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: RP_0 = {i: 1.9, j: "some str"}
      expect(foo_12(f) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_1900
     * @tc.name      testRequiredUtilityType0019
     * @tc.desc      Using custom type of Required<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: T_1 = {i: 1.9, j: "some str"}
      expect(foo_13(f) == 3).assertTrue()
    })

    /**
     * @tc.number    SUB_REQUIRED_UTILITY_TYPE_2000
     * @tc.name      testRequiredUtilityType0020
     * @tc.desc      Using custom type of Required<T>
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testRequiredUtilityType0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: RP_1 = {i: 1.9, j: "some str"}
      expect(foo_14(f) == 3).assertTrue()
    })
  });
}