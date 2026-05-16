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

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class C_number_constructor_param_array_default<T> extends Array<T> {
  i: number
  constructor(i: number) {
    super()
    this.i = i
  }
}

class C_byte_constructor_param_array_default<T> extends Array<T> {
  i: byte
  constructor(i: byte) {
    super()
    this.i = i
  }
}

class C_short_constructor_param_array_default<T> extends Array<T> {
  i: short
  constructor(i: short) {
    super()
    this.i = i
  }
}

class C_int_constructor_param_array_default<T> extends Array<T> {
  i: int
  constructor(i: int) {
    super()
    this.i = i
  }
}

class C_long_constructor_param_array_default<T> extends Array<T> {
  i: long
  constructor(i: long) {
    super()
    this.i = i
  }
}

class C_float_constructor_param_array_default<T> extends Array<T> {
  i: float
  constructor(i: float) {
    super()
    this.i = i
  }
}

class C_double_constructor_param_array_default<T> extends Array<T> {
  i: double
  constructor(i: double) {
    super()
    this.i = i
  }
}

class C_char_constructor_param_array_default<T> extends Array<T> {
  i: char
  constructor(i: char) {
    super()
    this.i = i
  }
}

class C_boolean_constructor_param_array_default<T> extends Array<T> {
  i: boolean
  constructor(i: boolean) {
    super()
    this.i = i
  }
}

class A_constructor_param_array_gen<T> extends Array<T> {
  i: number
  constructor(i: number) {
    super()
    this.i = i
  }
}

class A_byte_constructor_param_array_gen<T> extends Array<T> {
  i: byte
  constructor(i: byte) {
    super()
    this.i = i
  }
}

class A_short_constructor_param_array_gen<T> extends Array<T> {
  i: short
  constructor(i: short) {
    super()
    this.i = i
  }
}

class A_int_constructor_param_array_gen<T> extends Array<T> {
  i: int
  constructor(i: int) {
    super()
    this.i = i
  }
}

class A_long_constructor_param_array_gen<T> extends Array<T> {
  i: long
  constructor(i: long) {
    super()
    this.i = i
  }
}

class A_float_constructor_param_array_gen<T> extends Array<T> {
  i: float
  constructor(i: float) {
    super()
    this.i = i
  }
}

class A_double_constructor_param_array_gen<T> extends Array<T> {
  i: double
  constructor(i: double) {
    super()
    this.i = i
  }
}

class A_char_constructor_param_array_gen<T> extends Array<T> {
  i: char
  constructor(i: char) {
    super()
    this.i = i
  }
}

class A_boolean_constructor_param_array_gen<T> extends Array<T> {
  i: boolean
  constructor(i: boolean) {
    super()
    this.i = i
  }
}

class C_constructor_param_array_gen<T> {
  foo(): Object[] {
    let arr: Object[] = [
      new Object(),
      new Object(),
      new Object(),
      new Object(),
      new Object()
    ];
    return arr
  }
}

class C_local<T> extends Array<T> {
  j: T
  constructor(j: T) {
    super()
    this.j = j
  }
  static foo() {
    let arr: C_local<number>[] = [
      new C_local<number>(0),
      new C_local<number>(0),
      new C_local<number>(0),
      new C_local<number>(0),
      new C_local<number>(0)
    ];
    arr[0] = new C_local<number>(1)
    expect(arr.length).assertEqual(5)
    expect(arr.at(0)?.j).assertEqual(1)
  }
}
class A_local<T> extends Array<T> {
  constructor() { super() }
  constructor(j: Object) { super() }
}
class C_local1<T> {
  foo() {
    let arr: Object[] = [
      new Object(),
      new Object(),
      new Object(),
      new Object(),
      new Object()
    ];
    expect(arr.length).assertEqual(5)
    return true
  }
}
enum ENUM_optional { Red, Green, Blue }

type TPL_optional = [number, string]

class A_number_optional<T> extends Array<T> {
  i?: number
  constructor(i?: number) {
    super()
    this.i = i
  }
}

class A_byte_optional<T> extends Array<T> {
  i?: byte
  constructor(i?: byte) {
    super()
    this.i = i
  }
}

class A_short_optional<T> extends Array<T> {
  i?: short
  constructor(i?: short) {
    super()
    this.i = i
  }
}

class A_int_optional<T> extends Array<T> {
  i?: int
  constructor(i?: int) {
    super()
    this.i = i
  }
}

class A_long_optional<T> extends Array<T> {
  i?: long
  constructor(i?: long) {
    super()
    this.i = i
  }
}

class A_float_optional<T> extends Array<T> {
  i?: float
  constructor(i?: float) {
    super()
    this.i = i
  }
}

class A_double_optional<T> extends Array<T> {
  i?: double
  constructor(i?: double) {
    super()
    this.i = i
  }
}

class A_char_optional<T> extends Array<T> {
  i?: char
  constructor(i?: char) {
    super()
    this.i = i
  }
}

class A_boolean_optional<T> extends Array<T> {
  i?: boolean
  constructor(i?: boolean) {
    super()
    this.i = i
  }
}

class A_string_optional<T> extends Array<T> {
  i?: string
  constructor(i?: string) {
    super()
    this.i = i
  }
}

class A_null_optional<T> extends Array<T> {
  i?: null
  constructor(i?: null) {
    super()
    this.i = i
  }
}

class A_undefined_optional<T> extends Array<T> {
  i?: undefined
  constructor(i?: undefined) {
    super()
    this.i = i
  }
}

class A_enum_optional<T> extends Array<T> {
  i?: ENUM_optional
  constructor(i?: ENUM_optional) {
    super()
    this.i = i
  }
}

class A_tuple_optional<T> extends Array<T> {
  i?: TPL_optional
  constructor(i?: TPL_optional) {
    super()
    this.i = i
  }
}

class A_number_array_optional<T> extends Array<T> {
  i?: number[]
  constructor(i?: number[]) {
    super()
    this.i = i
  }
}

type foo_lambda = (i: Object|undefined) => Object|undefined

class A_lambda_optional<T> extends Array<T> {
  i: Object|undefined
  constructor(i?: foo_lambda, j?: Object) {
    super()
    if (i == undefined) {
      this.i = undefined
    } else {
      this.i = i(j)
    }
  }
}

class C_optional<T> {
  foo(): Object[] {
    let arr: Object[] = [
      new Object(),
      new Object(),
      new Object(),
      new Object(),
      new Object()
    ];
    return arr
  }
}
enum ENUM_array_optional { Red, Green, Blue }
type TPL_array_optional = [number, string]

class C_number_optional<T> extends Array<T> {
  i?: number
  constructor(i?: number) {
    super()
    this.i = i
  }
}

class C_byte_optional<T> extends Array<T> {
  i?: byte
  constructor(i?: byte) {
    super()
    this.i = i
  }
}

class C_short_optional<T> extends Array<T> {
  i?: short
  constructor(i?: short) {
    super()
    this.i = i
  }
}

class C_int_optional<T> extends Array<T> {
  i?: int
  constructor(i?: int) {
    super()
    this.i = i
  }
}

class C_long_optional<T> extends Array<T> {
  i?: long
  constructor(i?: long) {
    super()
    this.i = i
  }
}

class C_float_optional<T> extends Array<T> {
  i?: float
  constructor(i?: float) {
    super()
    this.i = i
  }
}

class C_double_optional<T> extends Array<T> {
  i?: double
  constructor(i?: double) {
    super()
    this.i = i
  }
}

class C_char_optional<T> extends Array<T> {
  i?: char
  constructor(i?: char) {
    super()
    this.i = i
  }
}

class C_boolean_optional<T> extends Array<T> {
  i?: boolean
  constructor(i?: boolean) {
    super()
    this.i = i
  }
}

class C_string_optional<T> extends Array<T> {
  i?: string
  constructor(i?: string) {
    super()
    this.i = i
  }
}

class C_null_optional<T> extends Array<T> {
  i?: null
  constructor(i?: null) {
    super()
    this.i = i
  }
}

class C_undefined_optional<T> extends Array<T> {
  i?: undefined
  constructor(i?: undefined) {
    super()
    this.i = i
  }
}

class C_enum_optional<T> extends Array<T> {
  i?: ENUM_array_optional
  constructor(i?: ENUM_array_optional) {
    super()
    this.i = i
  }
}

class C_tuple_optional<T> extends Array<T> {
  i?: TPL_array_optional
  constructor(i?: TPL_array_optional) {
    super()
    this.i = i
  }
}

class C_number_array_optional<T> extends Array<T> {
  i?: number[]
  constructor(i?: number[]) {
    super()
    this.i = i
  }
}

class C_lambda_optional<T> extends Array<T> {
  i: Object|undefined
  constructor(i?: foo_lambda, j?: Object) {
    super()
    if (i == undefined) {
      this.i = undefined
    } else {
      this.i = i(j)
    }
  }
}

class C_custom_1 {
  constructor() { }
  constructor(j: Object) { }
}

class C_custom_2 {
  j: number
  constructor(i: String) { }
  private constructor(j: number) {
    this.j = j
  }
  static foo() {
  }
}

class C_default_0 {
  i: number
  constructor(i: number) {
    this.i = i
  }
}

class C_default_1 {
  i: byte
  constructor(i: byte) {
    this.i = i
  }
}

class C_default_2 {
  i: short
  constructor(i: short) {
    this.i = i
  }
}

class C_default_3 {
  i: int
  constructor(i: int) {
    this.i = i
  }
}

class C_default_4 {
  i: long
  constructor(i: long) {
    this.i = i
  }
}

class C_default_5 {
  i: float
  constructor(i: float) {
    this.i = i
  }
}

class C_default_6 {
  i: double
  constructor(i: double) {
    this.i = i
  }
}

class C_default_7 {
  i: char
  constructor(i: char) {
    this.i = i
  }
}

class C_default_8 {
  i: boolean
  constructor(i: boolean) {
    this.i = i
  }
}

class C_custom_2_local {
  j: number
  constructor(i: String) {
    this.j = 0
  }
  private constructor(j: number) {
    this.j = j
  }
  static foo() {
      let arr: C_custom_2_local[] = [
        new C_custom_2_local(""),
        new C_custom_2_local(""),
        new C_custom_2_local(""),
        new C_custom_2_local(""),
        new C_custom_2_local("")
      ];
    // 由于私有构造函数无法在外部调用，我们创建公共构造函数版本
    arr[0] = new C_custom_2_local("")
    arr[0].j = 1
    expect(arr.length).assertEqual(5)
    expect(arr.at(0)?.j).assertEqual(1)
  }
}
enum ENUM_gen_optional { Red, Green, Blue }
type TPL_gen_optional = [number, string]

class A_gen_custom {
  constructor() { }
  constructor(j: Object) { }
}

class C_gen_custom<T> {
  foo(): Object[] {
    let arr: Object[] = [
      new Object(),
      new Object(),
      new Object(),
      new Object(),
      new Object()
    ];
    return arr
  }
}

class A_number_gen_default {
  i: number
  constructor(i: number) {
    this.i = i
  }
}

class A_byte_gen_default {
  i: byte
  constructor(i: byte) {
    this.i = i
  }
}

class A_short_gen_default {
  i: short
  constructor(i: short) {
    this.i = i
  }
}

class A_int_gen_default {
  i: int
  constructor(i: int) {
    this.i = i
  }
}

class A_long_gen_default {
  i: long
  constructor(i: long) {
    this.i = i
  }
}

class A_float_gen_default {
  i: float
  constructor(i: float) {
    this.i = i
  }
}

class A_double_gen_default {
  i: double
  constructor(i: double) {
    this.i = i
  }
}

class A_char_gen_default {
  i: char
  constructor(i: char) {
    this.i = i
  }
}

class A_boolean_gen_default {
  i: boolean
  constructor(i: boolean) {
    this.i = i
  }
}

class A_number_gen_optional {
  i?: number
  constructor(i?: number) {
    this.i = i
  }
}

class A_byte_gen_optional {
  i?: byte
  constructor(i?: byte) {
    this.i = i
  }
}

class A_short_gen_optional {
  i?: short
  constructor(i?: short) {
    this.i = i
  }
}

class A_int_gen_optional {
  i?: int
  constructor(i?: int) {
    this.i = i
  }
}

class A_long_gen_optional {
  i?: long
  constructor(i?: long) {
    this.i = i
  }
}

class A_float_gen_optional {
  i?: float
  constructor(i?: float) {
    this.i = i
  }
}

class A_double_gen_optional {
  i?: double
  constructor(i?: double) {
    this.i = i
  }
}

class A_char_gen_optional {
  i?: char
  constructor(i?: char) {
    this.i = i
  }
}

class A_boolean_gen_optional {
  i?: boolean
  constructor(i?: boolean) {
    this.i = i
  }
}

class A_string_gen_optional {
  i?: string
  constructor(i?: string) {
    this.i = i
  }
}

class A_null_gen_optional {
  i?: null
  constructor(i?: null) {
    this.i = i
  }
}

class A_undefined_gen_optional {
  i?: undefined
  constructor(i?: undefined) {
    this.i = i
  }
}

class A_enum_gen_optional {
  i?: ENUM_gen_optional
  constructor(i?: ENUM_gen_optional) {
    this.i = i
  }
}

class A_tuple_gen_optional {
  i?: TPL_gen_optional
  constructor(i?: TPL_gen_optional) {
    this.i = i
  }
}

class A_number_array_gen_optional {
  i?: number[]
  constructor(i?: number[]) {
    this.i = i
  }
}

type foo_lambda_gen = (i: Object|undefined) => Object|undefined

class C_lambda_gen_optional {
  i: Object|undefined
  constructor(i?: foo_lambda_gen, j?: Object) {
    if (i == undefined) {
      this.i = undefined
    } else {
      this.i = i(j)
    }
  }
}

class C_gen_container<T> {
  foo(): Object[] {
    let arr: Object[] = [
      new Object(),
      new Object(),
      new Object(),
      new Object(),
      new Object()
    ];
    return arr
  }
}
class C_number_optional1 {
  i?: number
  constructor(i?: number) {
    this.i = i
  }
}

class C_byte_optional1 {
  i?: byte
  constructor(i?: byte) {
    this.i = i
  }
}

class C_short_optional1 {
  i?: short
  constructor(i?: short) {
    this.i = i
  }
}

class C_int_optional1 {
  i?: int
  constructor(i?: int) {
    this.i = i
  }
}

class C_long_optional1 {
  i?: long
  constructor(i?: long) {
    this.i = i
  }
}

class C_float_optional1 {
  i?: float
  constructor(i?: float) {
    this.i = i
  }
}

class C_double_optional1 {
  i?: double
  constructor(i?: double) {
    this.i = i
  }
}

class C_char_optional1 {
  i?: char
  constructor(i?: char) {
    this.i = i
  }
}

class C_boolean_optional1 {
  i?: boolean
  constructor(i?: boolean) {
    this.i = i
  }
}

class C_string_optional1 {
  i?: string
  constructor(i?: string) {
    this.i = i
  }
}

class C_null_optional1 {
  i?: null
  constructor(i?: null) {
    this.i = i
  }
}

class C_undefined_optional1 {
  i?: undefined
  constructor(i?: undefined) {
    this.i = i
  }
}

export default function ExpressionsNewTest(): void {
  describe("ExpressionsNewTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0100
     * @tc.name      testExpressionsNew0001
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.

     *               Class derived from array is used Access to a private constructor from static class
     *               method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      C_local.foo()
      let arr: C_local<number>[] = [
        new C_local<number>(0),
        new C_local<number>(0),
        new C_local<number>(0),
        new C_local<number>(0),
        new C_local<number>(0)
      ];
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0200
     * @tc.name      testExpressionsNew0002
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_number_constructor_param_array_default<Object>[] = [
        new C_number_constructor_param_array_default<Object>(0),
        new C_number_constructor_param_array_default<Object>(0),
        new C_number_constructor_param_array_default<Object>(0),
        new C_number_constructor_param_array_default<Object>(0),
        new C_number_constructor_param_array_default<Object>(0)
      ];
      arr[0] = new C_number_constructor_param_array_default<Object>(1)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0300
     * @tc.name      testExpressionsNew0003
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_byte_constructor_param_array_default<Object>[] = [
        new C_byte_constructor_param_array_default<Object>(0 as byte),
        new C_byte_constructor_param_array_default<Object>(0 as byte),
        new C_byte_constructor_param_array_default<Object>(0 as byte),
        new C_byte_constructor_param_array_default<Object>(0 as byte),
        new C_byte_constructor_param_array_default<Object>(0 as byte)
      ];
      arr[0] = new C_byte_constructor_param_array_default<Object>(2 as byte)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0400
     * @tc.name      testExpressionsNew0004
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_short_constructor_param_array_default<Object>[] = [
        new C_short_constructor_param_array_default<Object>(0 as short),
        new C_short_constructor_param_array_default<Object>(0 as short),
        new C_short_constructor_param_array_default<Object>(0 as short),
        new C_short_constructor_param_array_default<Object>(0 as short),
        new C_short_constructor_param_array_default<Object>(0 as short)
      ];
      arr[0] = new C_short_constructor_param_array_default<Object>(3 as short)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0500
     * @tc.name      testExpressionsNew0005
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_int_constructor_param_array_default<Object>[] = [
        new C_int_constructor_param_array_default<Object>(0),
        new C_int_constructor_param_array_default<Object>(0),
        new C_int_constructor_param_array_default<Object>(0),
        new C_int_constructor_param_array_default<Object>(0),
        new C_int_constructor_param_array_default<Object>(0)
      ];
      arr[0] = new C_int_constructor_param_array_default<Object>(4)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(4)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0600
     * @tc.name      testExpressionsNew0006
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_long_constructor_param_array_default<Object>[] = [
        new C_long_constructor_param_array_default<Object>(0 as long),
        new C_long_constructor_param_array_default<Object>(0 as long),
        new C_long_constructor_param_array_default<Object>(0 as long),
        new C_long_constructor_param_array_default<Object>(0 as long),
        new C_long_constructor_param_array_default<Object>(0 as long)
      ];
      arr[0] = new C_long_constructor_param_array_default<Object>(5 as long)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0700
     * @tc.name      testExpressionsNew0007
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_float_constructor_param_array_default<Object>[] = [
        new C_float_constructor_param_array_default<Object>(0.0.toFloat()),
        new C_float_constructor_param_array_default<Object>(0.0.toFloat()),
        new C_float_constructor_param_array_default<Object>(0.0.toFloat()),
        new C_float_constructor_param_array_default<Object>(0.0.toFloat()),
        new C_float_constructor_param_array_default<Object>(0.0.toFloat())
      ];
      arr[0] = new C_float_constructor_param_array_default<Object>(6.7.toFloat())
      expect(arr.length).assertEqual(5)
      expect((arr.at(0)?.i).toString()).assertEqual('6.7')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0800
     * @tc.name      testExpressionsNew0008
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_double_constructor_param_array_default<Object>[] = [
        new C_double_constructor_param_array_default<Object>(0.0),
        new C_double_constructor_param_array_default<Object>(0.0),
        new C_double_constructor_param_array_default<Object>(0.0),
        new C_double_constructor_param_array_default<Object>(0.0),
        new C_double_constructor_param_array_default<Object>(0.0)
      ];
      arr[0] = new C_double_constructor_param_array_default<Object>(8.9)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(8.9)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_0900
     * @tc.name      testExpressionsNew0009
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_boolean_constructor_param_array_default<Object>[] = [
        new C_boolean_constructor_param_array_default<Object>(false),
        new C_boolean_constructor_param_array_default<Object>(false),
        new C_boolean_constructor_param_array_default<Object>(false),
        new C_boolean_constructor_param_array_default<Object>(false),
        new C_boolean_constructor_param_array_default<Object>(false)
      ];
      arr[0] = new C_boolean_constructor_param_array_default<Object>(false)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(false)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1000
     * @tc.name      testExpressionsNew0010
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.

     *               Parameterless constructor used
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_local1<A_local<Object>>().foo()
      expect(arr).assertEqual(true)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1100
     * @tc.name      testExpressionsNew0011
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1200
     * @tc.name      testExpressionsNew0012
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_byte_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1300
     * @tc.name      testExpressionsNew0013
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_short_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1400
     * @tc.name      testExpressionsNew0014
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_int_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1500
     * @tc.name      testExpressionsNew0015
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_long_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1600
     * @tc.name      testExpressionsNew0016
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_float_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1700
     * @tc.name      testExpressionsNew0017
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_double_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1800
     * @tc.name      testExpressionsNew0018
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_char_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_1900
     * @tc.name      testExpressionsNew0019
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_constructor_param_array_gen<A_boolean_constructor_param_array_gen<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2000
     * @tc.name      testExpressionsNew0020
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_number_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2100
     * @tc.name      testExpressionsNew0021
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_byte_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2200
     * @tc.name      testExpressionsNew0022
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_short_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2300
     * @tc.name      testExpressionsNew0023
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_int_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2400
     * @tc.name      testExpressionsNew0024
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_long_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2500
     * @tc.name      testExpressionsNew0025
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_float_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2600
     * @tc.name      testExpressionsNew0026
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_double_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2700
     * @tc.name      testExpressionsNew0027
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_char_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2800
     * @tc.name      testExpressionsNew0028
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_boolean_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_2900
     * @tc.name      testExpressionsNew0029
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_string_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3000
     * @tc.name      testExpressionsNew0030
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_null_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3100
     * @tc.name      testExpressionsNew0031
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_undefined_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3200
     * @tc.name      testExpressionsNew0032
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_enum_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3300
     * @tc.name      testExpressionsNew0033
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_tuple_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3400
     * @tc.name      testExpressionsNew0034
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_number_array_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3500
     * @tc.name      testExpressionsNew0035
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_optional<A_lambda_optional<Object>>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3600
     * @tc.name      testExpressionsNew0036
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_number_optional<Object>[] = [
        new C_number_optional<Object>(),
        new C_number_optional<Object>(),
        new C_number_optional<Object>(),
        new C_number_optional<Object>(),
        new C_number_optional<Object>()
      ];
      arr[0] = new C_number_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3700
     * @tc.name      testExpressionsNew0037
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_byte_optional<Object>[] = [
        new C_byte_optional<Object>(),
        new C_byte_optional<Object>(),
        new C_byte_optional<Object>(),
        new C_byte_optional<Object>(),
        new C_byte_optional<Object>()
      ];
      arr[0] = new C_byte_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3800
     * @tc.name      testExpressionsNew0038
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_short_optional<Object>[] = [
        new C_short_optional<Object>(),
        new C_short_optional<Object>(),
        new C_short_optional<Object>(),
        new C_short_optional<Object>(),
        new C_short_optional<Object>()
      ];
      arr[0] = new C_short_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_3900
     * @tc.name      testExpressionsNew0039
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_int_optional<Object>[] = [
        new C_int_optional<Object>(),
        new C_int_optional<Object>(),
        new C_int_optional<Object>(),
        new C_int_optional<Object>(),
        new C_int_optional<Object>()
      ];
      arr[0] = new C_int_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4000
     * @tc.name      testExpressionsNew0040
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_long_optional<Object>[] = [
        new C_long_optional<Object>(),
        new C_long_optional<Object>(),
        new C_long_optional<Object>(),
        new C_long_optional<Object>(),
        new C_long_optional<Object>()
      ];
      arr[0] = new C_long_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4100
     * @tc.name      testExpressionsNew0041
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_float_optional<Object>[] = [
        new C_float_optional<Object>(),
        new C_float_optional<Object>(),
        new C_float_optional<Object>(),
        new C_float_optional<Object>(),
        new C_float_optional<Object>()
      ];
      arr[0] = new C_float_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4200
     * @tc.name      testExpressionsNew0042
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_double_optional<Object>[] = [
        new C_double_optional<Object>(),
        new C_double_optional<Object>(),
        new C_double_optional<Object>(),
        new C_double_optional<Object>(),
        new C_double_optional<Object>()
      ];
      arr[0] = new C_double_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4300
     * @tc.name      testExpressionsNew0043
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_char_optional<Object>[] = [
        new C_char_optional<Object>(),
        new C_char_optional<Object>(),
        new C_char_optional<Object>(),
        new C_char_optional<Object>(),
        new C_char_optional<Object>()
      ];
      arr[0] = new C_char_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4400
     * @tc.name      testExpressionsNew0044
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_boolean_optional<Object>[] = [
        new C_boolean_optional<Object>(),
        new C_boolean_optional<Object>(),
        new C_boolean_optional<Object>(),
        new C_boolean_optional<Object>(),
        new C_boolean_optional<Object>()
      ];
      arr[0] = new C_boolean_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4500
     * @tc.name      testExpressionsNew0045
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_string_optional<Object>[] = [
        new C_string_optional<Object>(),
        new C_string_optional<Object>(),
        new C_string_optional<Object>(),
        new C_string_optional<Object>(),
        new C_string_optional<Object>()
      ];
      arr[0] = new C_string_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4600
     * @tc.name      testExpressionsNew0046
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_null_optional<Object>[] = [
        new C_null_optional<Object>(),
        new C_null_optional<Object>(),
        new C_null_optional<Object>(),
        new C_null_optional<Object>(),
        new C_null_optional<Object>()
      ];
      arr[0] = new C_null_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4700
     * @tc.name      testExpressionsNew0047
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_undefined_optional<Object>[] = [
        new C_undefined_optional<Object>(),
        new C_undefined_optional<Object>(),
        new C_undefined_optional<Object>(),
        new C_undefined_optional<Object>(),
        new C_undefined_optional<Object>()
      ];
      arr[0] = new C_undefined_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4800
     * @tc.name      testExpressionsNew0048
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_enum_optional<Object>[] = [
        new C_enum_optional<Object>(),
        new C_enum_optional<Object>(),
        new C_enum_optional<Object>(),
        new C_enum_optional<Object>(),
        new C_enum_optional<Object>()
      ];
      arr[0] = new C_enum_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_4900
     * @tc.name      testExpressionsNew0049
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_tuple_optional<Object>[] = [
        new C_tuple_optional<Object>(),
        new C_tuple_optional<Object>(),
        new C_tuple_optional<Object>(),
        new C_tuple_optional<Object>(),
        new C_tuple_optional<Object>()
      ];
      arr[0] = new C_tuple_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5000
     * @tc.name      testExpressionsNew0050
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_number_array_optional<Object>[] = [
        new C_number_array_optional<Object>(),
        new C_number_array_optional<Object>(),
        new C_number_array_optional<Object>(),
        new C_number_array_optional<Object>(),
        new C_number_array_optional<Object>()
      ];
      arr[0] = new C_number_array_optional<Object>()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5100
     * @tc.name      testExpressionsNew0051
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_lambda_optional<Object>[] = [
        new C_lambda_optional<Object>(),
        new C_lambda_optional<Object>(),
        new C_lambda_optional<Object>(),
        new C_lambda_optional<Object>(),
        new C_lambda_optional<Object>()
      ];
      let t: foo_lambda = (i: Object|undefined) => { return i }
      arr[0] = new C_lambda_optional<Object>(t)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5200
     * @tc.name      testExpressionsNew0052
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs. Parameterless constructor used
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_custom_1[] = [
        new C_custom_1(),
        new C_custom_1(),
        new C_custom_1(),
        new C_custom_1(),
        new C_custom_1()
      ];
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5300
     * @tc.name      testExpressionsNew0053
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs. Access in static class method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // 由于ArkTS中私有构造函数只能在类内部访问，我们创建了一个内部类来模拟
      C_custom_2_local.foo()
    let arr: C_custom_2_local[] = [
      new C_custom_2_local(""),
      new C_custom_2_local(""),
      new C_custom_2_local(""),
      new C_custom_2_local(""),
      new C_custom_2_local("")
    ];
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5400
     * @tc.name      testExpressionsNew0054
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_default_0[] = [
        new C_default_0(0),
        new C_default_0(0),
        new C_default_0(0),
        new C_default_0(0),
        new C_default_0(0)
      ];
      arr[0] = new C_default_0(1)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5500
     * @tc.name      testExpressionsNew0055
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_default_1[] = [
        new C_default_1(0 as byte),
        new C_default_1(0 as byte),
        new C_default_1(0 as byte),
        new C_default_1(0 as byte),
        new C_default_1(0 as byte)
      ];
      arr[0] = new C_default_1(2 as byte)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5600
     * @tc.name      testExpressionsNew0056
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_default_2[] = [
        new C_default_2(0 as short),
        new C_default_2(0 as short),
        new C_default_2(0 as short),
        new C_default_2(0 as short),
        new C_default_2(0 as short)
      ];
      arr[0] = new C_default_2(3 as short)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5700
     * @tc.name      testExpressionsNew0057
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_default_3[] = [
        new C_default_3(0),
        new C_default_3(0),
        new C_default_3(0),
        new C_default_3(0),
        new C_default_3(0)
      ];
      arr[0] = new C_default_3(4)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(4)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5800
     * @tc.name      testExpressionsNew0058
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_default_4[] = [
        new C_default_4(0 as long),
        new C_default_4(0 as long),
        new C_default_4(0 as long),
        new C_default_4(0 as long),
        new C_default_4(0 as long)
      ];
      arr[0] = new C_default_4(5 as long)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_5900
     * @tc.name      testExpressionsNew0059
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_default_5[] = [
        new C_default_5(0.0.toFloat()),
        new C_default_5(0.0.toFloat()),
        new C_default_5(0.0.toFloat()),
        new C_default_5(0.0.toFloat()),
        new C_default_5(0.0.toFloat())
      ];
      arr[0] = new C_default_5(6.7.toFloat())
      expect(arr.length).assertEqual(5)
      expect((arr.at(0)?.i).toString()).assertEqual('6.7')
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6000
     * @tc.name      testExpressionsNew0060
     * @tc.desc      A class instance creation expression that refers to classes FixedArray. 
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_default_6[] = [
        new C_default_6(0.0),
        new C_default_6(0.0),
        new C_default_6(0.0),
        new C_default_6(0.0),
        new C_default_6(0.0)
      ];
      arr[0] = new C_default_6(8.9)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(8.9)
    })


    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6100
     * @tc.name      testExpressionsNew0061
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_default_8[] = [
        new C_default_8(false),
        new C_default_8(false),
        new C_default_8(false),
        new C_default_8(false),
        new C_default_8(false)
      ];
      arr[0] = new C_default_8(false)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(false)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6200
     * @tc.name      testExpressionsNew0062
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     *               Parameterless constructor
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_custom<A_gen_custom>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6300
     * @tc.name      testExpressionsNew0063
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_number_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6400
     * @tc.name      testExpressionsNew0064
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_byte_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6500
     * @tc.name      testExpressionsNew0065
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_short_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6600
     * @tc.name      testExpressionsNew0066
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_int_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6700
     * @tc.name      testExpressionsNew0067
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_long_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6800
     * @tc.name      testExpressionsNew0068
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_float_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_6900
     * @tc.name      testExpressionsNew0069
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_double_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7000
     * @tc.name      testExpressionsNew0070
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_char_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7100
     * @tc.name      testExpressionsNew0071
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_boolean_gen_default>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7200
     * @tc.name      testExpressionsNew0072
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_number_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7300
     * @tc.name      testExpressionsNew0073
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_byte_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7400
     * @tc.name      testExpressionsNew0074
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_short_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7500
     * @tc.name      testExpressionsNew0075
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_int_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7600
     * @tc.name      testExpressionsNew0076
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_long_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7700
     * @tc.name      testExpressionsNew0077
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_float_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7800
     * @tc.name      testExpressionsNew0078
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_double_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_7900
     * @tc.name      testExpressionsNew0079
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_char_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8000
     * @tc.name      testExpressionsNew0080
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_boolean_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8100
     * @tc.name      testExpressionsNew0081
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_string_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8200
     * @tc.name      testExpressionsNew0082
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_null_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8300
     * @tc.name      testExpressionsNew0083
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_undefined_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8400
     * @tc.name      testExpressionsNew0084
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_enum_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8500
     * @tc.name      testExpressionsNew0085
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_tuple_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8600
     * @tc.name      testExpressionsNew0086
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     *               Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new C_gen_container<A_number_array_gen_optional>().foo()
      expect(arr.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8700
     * @tc.name      testExpressionsNew0087
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_lambda_gen_optional[] = [
        new C_lambda_gen_optional(),
        new C_lambda_gen_optional(),
        new C_lambda_gen_optional(),
        new C_lambda_gen_optional(),
        new C_lambda_gen_optional()
      ];
      let t: foo_lambda_gen = (i: Object|undefined) => { return i }
      arr[0] = new C_lambda_gen_optional(t)
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8800
     * @tc.name      testExpressionsNew0088
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_number_optional1[] = [
        new C_number_optional1(),
        new C_number_optional1(),
        new C_number_optional1(),
        new C_number_optional1(),
        new C_number_optional1()
      ];
      arr[0] = new C_number_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_8900
     * @tc.name      testExpressionsNew0089
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_byte_optional1[] = [
        new C_byte_optional1(),
        new C_byte_optional1(),
        new C_byte_optional1(),
        new C_byte_optional1(),
        new C_byte_optional1()
      ];
      arr[0] = new C_byte_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9000
     * @tc.name      testExpressionsNew0090
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_short_optional1[] = [
        new C_short_optional1(),
        new C_short_optional1(),
        new C_short_optional1(),
        new C_short_optional1(),
        new C_short_optional1()
      ];
      arr[0] = new C_short_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9100
     * @tc.name      testExpressionsNew0091
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_int_optional1[] = [
        new C_int_optional1(),
        new C_int_optional1(),
        new C_int_optional1(),
        new C_int_optional1(),
        new C_int_optional1()
      ];
      arr[0] = new C_int_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9200
     * @tc.name      testExpressionsNew0092
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_long_optional1[] = [
        new C_long_optional1(),
        new C_long_optional1(),
        new C_long_optional1(),
        new C_long_optional1(),
        new C_long_optional1()
      ];
      arr[0] = new C_long_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9300
     * @tc.name      testExpressionsNew0093
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_float_optional1[] = [
        new C_float_optional1(),
        new C_float_optional1(),
        new C_float_optional1(),
        new C_float_optional1(),
        new C_float_optional1()
      ];
      arr[0] = new C_float_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9400
     * @tc.name      testExpressionsNew0094
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_double_optional1[] = [
        new C_double_optional1(),
        new C_double_optional1(),
        new C_double_optional1(),
        new C_double_optional1(),
        new C_double_optional1()
      ];
      arr[0] = new C_double_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9500
     * @tc.name      testExpressionsNew0095
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_char_optional1[] = [
        new C_char_optional1(),
        new C_char_optional1(),
        new C_char_optional1(),
        new C_char_optional1(),
        new C_char_optional1()
      ];
      arr[0] = new C_char_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9600
     * @tc.name      testExpressionsNew0096
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_boolean_optional1[] = [
        new C_boolean_optional1(),
        new C_boolean_optional1(),
        new C_boolean_optional1(),
        new C_boolean_optional1(),
        new C_boolean_optional1()
      ];
      arr[0] = new C_boolean_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9700
     * @tc.name      testExpressionsNew0097
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_string_optional1[] = [
        new C_string_optional1(),
        new C_string_optional1(),
        new C_string_optional1(),
        new C_string_optional1(),
        new C_string_optional1()
      ];
      arr[0] = new C_string_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9800
     * @tc.name      testExpressionsNew0098
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_null_optional1[] = [
        new C_null_optional1(),
        new C_null_optional1(),
        new C_null_optional1(),
        new C_null_optional1(),
        new C_null_optional1()
      ];
      arr[0] = new C_null_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_NEW_TEST_9900
     * @tc.name      testExpressionsNew0099
     * @tc.desc      A class instance creation expression that refers to classes FixedArray.  Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsNew0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: C_undefined_optional1[] = [
        new C_undefined_optional1(),
        new C_undefined_optional1(),
        new C_undefined_optional1(),
        new C_undefined_optional1(),
        new C_undefined_optional1()
      ];
      arr[0] = new C_undefined_optional1()
      expect(arr.length).assertEqual(5)
      expect(arr.at(0)?.i).assertEqual(undefined)
    })

  })
}