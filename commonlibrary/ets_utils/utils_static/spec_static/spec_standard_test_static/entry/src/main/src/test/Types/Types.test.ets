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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class A {}
class B {}

enum Color {
  Red,
  Green,
  Blue
}

enum Status {
  Active = "ACTIVE",
  Inactive = "INACTIVE"
}

class AGeneric<T> {
  f: T
  m(): T { return this.f }
  constructor(f: T) {this.f = f}
}

function foo_undefined(...args: undefined[] ): undefined {
  return undefined;
}

class A_literal {
  str: "some str"
  undef: undefined

  constructor() {
      this.str = "some str"
      this.undef = undefined
  }

  constructor(str: "some str", undef: undefined) {
      this.str = str
      this.undef = undef
  }

}
type U = "some str" | undefined | number;
type Matrix = int[][]

// Additional types for tests
type Mixed = number | string | boolean;
type Direction = "left" | "right" | "up" | "down";
type BinaryOp = (x: number, y: number) => number;
type OptionalFunc = (x?: number, y?: string) => void;
type BMW_ModelCode = "325" | "530" | "735";
type T = (number | string) | boolean;

class Cat {
  name: string;
  constructor(name: string) { this.name = name; }
  meow() { return "meow"; }
}

class Dog {
  name: string;
  constructor(name: string) { this.name = name; }
  bark() { return "bark"; }
}

type Animal = Cat | Dog;

class TestClass {
  field: number;
  method() {}
}

class TestClassDefault {
  num: number;
  bool: boolean;
  str: string | undefined;
}

type Handler = (msg: string) => void;
type Keys = keyof TestClass;

export default function SpecTypeTest() {
  describe('SpecTypeTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0100
     * @tc.name PrimitiveTypesTest001
     * @tc.desc test Type primitive conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(Double.MIN_VALUE).assertEqual(Number.MIN_VALUE);
      expect(Double.MAX_VALUE).assertEqual(Number.MAX_VALUE);
      expect(Double.NEGATIVE_INFINITY).assertEqual(Number.NEGATIVE_INFINITY);
      expect(Double.POSITIVE_INFINITY).assertEqual(Number.POSITIVE_INFINITY);

      let byte_90: byte = 90
      let double_0_90: double = byte_90
      const double_1_90 = byte_90.toDouble()
      expect(double_0_90 instanceof double).assertEqual(true);
      expect(double_1_90 instanceof double).assertEqual(true);
      expect(double_0_90).assertEqual(0O1_32);
      expect(double_1_90).assertEqual(0O1_32);

      let byte_n91: byte = -9_1
      let double_0_n91: double = byte_n91
      const double_1_n91 = byte_n91.toDouble()
      expect(double_0_n91 instanceof double).assertEqual(true);
      expect(double_1_n91 instanceof double).assertEqual(true);
      expect(double_0_n91).assertEqual(-0O1_33);
      expect(double_1_n91).assertEqual(-0O1_33);

      let float_0_90: float = byte_90
      let float_1_90 = byte_90.toFloat();
      expect(float_0_90 instanceof float).assertEqual(true);
      expect(float_1_90 instanceof float).assertEqual(true);
      expect(float_0_90).assertEqual(0O1_32f);
      expect(float_1_90).assertEqual(0O1_32f);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0200
     * @tc.name PrimitiveTypesTest002
     * @tc.desc test Type primitive conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byte_0_90: byte = 90
      let int_0_90: int = byte_0_90
      expect(int_0_90 instanceof int).assertEqual(true);
      expect(int_0_90).assertEqual(0O1_32);

      let long_0_90: long = byte_0_90
      expect(long_0_90 instanceof long).assertEqual(true);
      expect(long_0_90).assertEqual(0O1_32);

      let short_0_90: short = byte_0_90
      expect(short_0_90 instanceof short).assertEqual(true);
      expect(short_0_90).assertEqual(0O1_32);

      let int_0: int = 8122025
      let double_0: double = int_0
      expect(double_0 instanceof double).assertEqual(true);
      expect(double_0).assertEqual(8122025);

      let float_0: float = 8122025
      expect(float_0 instanceof float).assertEqual(true);
      expect(float_0).assertEqual(8122025);

      let long_0: long = int_0
      expect(long_0 instanceof long).assertEqual(true);
      expect(long_0).assertEqual(8122025);

      let double_1: double = long_0
      expect(double_1 instanceof double).assertEqual(true);
      expect(double_1).assertEqual(8122025);

      let float_1: float = long_0
      expect(float_1 instanceof float).assertEqual(true);
      expect(float_1).assertEqual(8122025);

      let short_1: short = 2025
      let double_2: double = short_1
      expect(double_2 instanceof double).assertEqual(true);
      expect(double_2).assertEqual(2025);

      let float_2: float = short_1
      expect(float_2 instanceof float).assertEqual(true);
      expect(float_2).assertEqual(2025);

      let int_1: int = short_1
      expect(int_1 instanceof int).assertEqual(true);
      expect(int_1).assertEqual(2025);

      let long_1: long = short_1
      expect(int_1 instanceof int).assertEqual(true);
      expect(int_1).assertEqual(2025);

    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0300
     * @tc.name PrimitiveTypesTest003
     * @tc.desc test Type arithmetic operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byte_1: byte = 1;
      let bigint_1: bigint = 1n;
      expect((BigInt(byte_1) + bigint_1) instanceof BigInt).assertEqual(true);

      let short_10: short = 10;
      short_10 += byte_1
      expect(short_10).assertEqual(11);
      let int_10: int = 10;
      int_10 -= byte_1;
      expect(int_10).assertEqual(9);
      let float_16: float = 16.0f;
      float_16 /= byte_1
      expect(float_16).assertEqual(16);
      let double_16: double = 16.0;
      double_16 %= byte_1
      expect(double_16).assertEqual(0);
      let long_10: long = 10;
      long_10 *= byte_1
      expect(long_10).assertEqual(10);

      let byte_7: byte = 7;
      {
          let long_10: long = 10;
          long_10 &= byte_7;
          expect(long_10).assertEqual(2);
      }
      {
          let long_10: long = 10;
          long_10 |= byte_7;
          expect(long_10).assertEqual(15);
      }
      {
          let long_10: long = 10;
          long_10 ^= byte_7;
          expect(long_10).assertEqual(13);
      }
      {
          let long_10: long = 10;
          long_10 <<= byte_7;
          expect(long_10).assertEqual(1280);
      }
      {
          let long_10: long = 10;
          long_10 >>= byte_7;
          expect(long_10).assertEqual(0);
      }
      {
          let long_10: long = 10;
          long_10 >>>= byte_7;
          expect(long_10).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0400
     * @tc.name PrimitiveTypesTest004
     * @tc.desc test Type conditional operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boolean_true: boolean = true;
      let res = boolean_true ? 3 : 5;
      expect(res).assertEqual(3);
      let boolean_false: boolean = false;
      res = boolean_false ? 3 : 5;
      expect(res).assertEqual(5);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0500
     * @tc.name PrimitiveTypesTest005
     * @tc.desc test Type any conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let byte_any: Any = 1 as byte;
      let short_any: Any = 1 as short;
      let int_any: Any = 1 as int;
      let long_any: Any = 1 as long;
      let float_any: Any = 1.0f;
      let double_any: Any = 1.0 as double;
      let char_any: Any = c'a';
      let string_any: Any = "abc";
      let boolean_any: Any = true;
      let undefined_any = undefined;
      let null_any: Any = null;
      expect(byte_any).assertEqual(1);
      expect(short_any).assertEqual(1);
      expect(int_any).assertEqual(1);
      expect(long_any).assertEqual(1);
      expect(float_any).assertEqual(1.0f);
      expect(double_any).assertEqual(1.0);
      expect(char_any).assertEqual(c'a');
      expect(string_any).assertEqual("abc");
      expect(boolean_any).assertEqual(true);
      expect(undefined_any).assertEqual(undefined);
      expect(null_any).assertEqual(null);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0600
     * @tc.name PrimitiveTypesTest006
     * @tc.desc test Type object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: A = new A();
      let b: B = new B();
      let a_1 = a;
      expect(a instanceof A).assertEqual(true);
      expect(b instanceof B).assertEqual(true);
      expect(a_1 == a).assertEqual(true);
      expect(a_1 != b).assertEqual(true);
      expect(a_1 !== b).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0700
     * @tc.name PrimitiveTypesTest007
     * @tc.desc test Type object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: Object = new A();
      let b: string = 'test';
      let c: string = a + b;
      expect(c).assertEqual('[object Object]test');
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0800
     * @tc.name PrimitiveTypesTest008
     * @tc.desc test Type void
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a1: AGeneric<void> = new AGeneric<void>(undefined);
      let a2: AGeneric<undefined> = new AGeneric<undefined>(undefined);
      expect(a1.f).assertEqual(undefined);
      expect(a2.f).assertEqual(undefined);
      expect(a2.m()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_0900
     * @tc.name PrimitiveTypesTest009
     * @tc.desc test Type undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: int | undefined = undefined;
      switch (num) {
        case undefined:
          expect(num).assertEqual(undefined);
          break;
        default:
          expect(false).assertEqual(true);
          break;
      }
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1000
     * @tc.name PrimitiveTypesTest010
     * @tc.desc test Type undefined function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(foo_undefined()).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1100
     * @tc.name PrimitiveTypesTest011
     * @tc.desc test Type undefined in union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string|Number|undefined|null = undefined;
      expect(a == undefined).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1200
     * @tc.name PrimitiveTypesTest012
     * @tc.desc test Type null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: Object | null = null;
      expect(a == null).assertEqual(true);
      expect(a instanceof null).assertEqual(true)
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1300
     * @tc.name PrimitiveTypesTest013
     * @tc.desc test Type String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: string = "TEST";
      let b: string = "arkts";
      let c: string = a + b;
      expect(a.length).assertEqual(4);
      expect(a.length instanceof int).assertEqual(true)
      expect(c).assertEqual("TESTarkts");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1400
     * @tc.name PrimitiveTypesTest014
     * @tc.desc test Type bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const prim1: byte = new Byte(0)
      let b: bigint
      expect((b = new BigInt(prim1)) instanceof BigInt && b == 0n).assertEqual(true)
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1500
     * @tc.name PrimitiveTypesTest015
     * @tc.desc test Type bigint array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr_bigint: bigint[] = [new BigInt(1), new BigInt(2), new BigInt(3)]
      expect(arr_bigint[0]).assertEqual(1n);
      expect(arr_bigint[1]).assertEqual(2n);
      expect(arr_bigint[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1600
     * @tc.name PrimitiveTypesTest016
     * @tc.desc test Type union bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let u: never|bigint|Byte|boolean
      u = (0).toByte()
      u = new BigInt(u as Byte)
      expect(u as bigint).assertEqual(0n)
      u = (0x7F).toByte()
      u = new BigInt(u as Byte)
      expect(u as bigint).assertEqual(127n)
      u = (0x80).toByte()
      u = new BigInt(u as Byte)
      expect(u as bigint).assertEqual(-128n)
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1700
     * @tc.name PrimitiveTypesTest017
     * @tc.desc test Type literal types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s0: "string literal" = "string literal"
      let s1 = s0 + s0
      expect(s1 instanceof string).assertEqual(true)
      expect(s1).assertEqual("string literalstring literal")
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1800
     * @tc.name PrimitiveTypesTest018
     * @tc.desc test Type default value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let num: number;
      expect(num).assertEqual(0);
      let boo_l: boolean;
      expect(boo_l).assertEqual(false);
      let nul_l: null = null;
      expect(nul_l).assertEqual(null);
      let undef: undefined;
      expect(undef).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_1900
     * @tc.name PrimitiveTypesTest019
     * @tc.desc test literal type assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: "some str" = "some str";
      let und: undefined = undefined;
      let obj: A_literal = new A_literal(s, und);
      expect(obj.str).assertEqual("some str");
      expect(obj.undef).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2000
     * @tc.name PrimitiveTypesTest020
     * @tc.desc test union literal type assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let u1: U = "some str";
      expect(u1).assertEqual("some str");
      u1 = undefined;
      expect(u1).assertEqual(undefined);
      u1 = 2025;
      expect(u1).assertEqual(2025);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2100
     * @tc.name PrimitiveTypesTest021
     * @tc.desc test Type multi-dimensional array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let mat: Matrix = [
        [1, 2, 3],
        [4, 5, 6]
      ];
      expect(mat.length).assertEqual(2);
      expect(mat[0].length).assertEqual(3);
      expect(mat[1][2]).assertEqual(6);
      expect(mat[0][1] instanceof int).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2200
     * @tc.name PrimitiveTypesTest022
     * @tc.desc test Type array assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: Array<string> = ['a', 'b', 'c'];
      let arr2: string[] = [];
      arr2 = arr;
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2300
     * @tc.name PrimitiveTypesTest023
     * @tc.desc test Enum numeric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let c: Color = Color.Green;
      expect(c).assertEqual(1);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2400
     * @tc.name PrimitiveTypesTest024
     * @tc.desc test Enum string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: Status = Status.Active;
      expect(s).assertEqual("ACTIVE");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2500
     * @tc.name PrimitiveTypesTest025
     * @tc.desc test Tuple type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tuple: [string, number] = ["hello", 10];
      expect(tuple[0]).assertEqual("hello");
      expect(tuple[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2600
     * @tc.name PrimitiveTypesTest026
     * @tc.desc test Char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let char_a: char = c'a';
      let char_b: char = c'b';
      let char_chinese: char = c'中';
      let char_unicode: char = c'\uFFFF';  // char 16位
      
      expect(char_a).assertEqual(c'a');
      expect(char_b).assertEqual(c'b');
      expect(char_chinese).assertEqual(c'中');
      expect(char_unicode).assertEqual(c'\uFFFF');
      
      // Test equality
      expect(char_a == char_a).assertEqual(true);
      expect(char_a === char_a).assertEqual(true);
      expect(char_a != char_b).assertEqual(true);
      expect(char_a !== char_b).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2700
     * @tc.name PrimitiveTypesTest027
     * @tc.desc test Array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Test resizable array
      let arr: number[] = [1, 2, 3];
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      
      // Test array assignment (reference type)
      let arr2 = arr;
      arr2[0] = 99;
      expect(arr[0]).assertEqual(99);
      
      // Test readonly array
      let readonlyArr: readonly number[] = [10, 20, 30];
      expect(readonlyArr.length).assertEqual(3);
      expect(readonlyArr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2800
     * @tc.name PrimitiveTypesTest028
     * @tc.desc test Union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let v: Mixed = 42;
      expect(v).assertEqual(42);
      
      v = "hello";
      expect(v).assertEqual("hello");
      
      v = true;
      expect(v).assertEqual(true);
      
      // Test union type with literal types
      let d: Direction = "left";
      expect(d).assertEqual("left");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_2900
     * @tc.name PrimitiveTypesTest029
     * @tc.desc test Function type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let add: BinaryOp = (x, y) => x + y;
      expect(add(1, 2)).assertEqual(3);
      
      // Test optional parameters
      let optionalFunc: OptionalFunc = () => {};
      expect(typeof optionalFunc).assertEqual("function");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3100
     * @tc.name PrimitiveTypesTest031
     * @tc.desc test Readonly tuple
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let readonlyTuple: readonly [number, string] = [1, "a"];
      expect(readonlyTuple[0]).assertEqual(1);
      expect(readonlyTuple[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3200
     * @tc.name PrimitiveTypesTest032
     * @tc.desc test Enum operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Test enum to string
      let c: Color = Color.Green;
      expect(c.toString()).assertEqual("1");
      
      // Test enum from value
      let s: Status = Status.Active;
      expect(s).assertEqual("ACTIVE");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3300
     * @tc.name PrimitiveTypesTest033
     * @tc.desc test Type narrowing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: Animal = new Cat("Whiskers");
      if (a instanceof Cat) {
        expect(a.meow()).assertEqual("meow");
      }
      
      a = new Dog("Rex");
      let d: Dog = a as Dog;
      expect(d.bark()).assertEqual("bark");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3400
     * @tc.name PrimitiveTypesTest034
     * @tc.desc test Type aliases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let code: BMW_ModelCode = "325";
      expect(code).assertEqual("325");
      
      code = "530";
      expect(code).assertEqual("530");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3500
     * @tc.name PrimitiveTypesTest035
     * @tc.desc test Default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Test value types with default values
      let num: number;
      expect(num).assertEqual(0);
      
      let byte_default: byte;
      expect(byte_default).assertEqual(0);
      
      let short_default: short;
      expect(short_default).assertEqual(0);
      
      let int_default: int;
      expect(int_default).assertEqual(0);
      
      let long_default: long;
      expect(long_default).assertEqual(0);
      
      let float_default: float;
      expect(float_default).assertEqual(0.0);
      
      let double_default: double;
      expect(double_default).assertEqual(0.0);
      
      let boolean_default: boolean;
      expect(boolean_default).assertEqual(false);
      
      let char_default: char;
      expect(char_default).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3600
     * @tc.name PrimitiveTypesTest036
     * @tc.desc test Class member default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let testObj = new TestClassDefault();
      expect(testObj.num).assertEqual(0);
      expect(testObj.bool).assertEqual(false);
      expect(testObj.str).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3700
     * @tc.name PrimitiveTypesTest037
     * @tc.desc test BigInt type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let bigint_1: bigint = 1n;
      let bigint_2: bigint = 2n;
      let bigint_sum: bigint = bigint_1 + bigint_2;
      expect(bigint_sum).assertEqual(3n);
      
      let bigint_from_byte: bigint = new BigInt(127);
      expect(bigint_from_byte).assertEqual(127n);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3800
     * @tc.name PrimitiveTypesTest038
     * @tc.desc test Array length modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [0, 1, 2, 3, 4];
      arr.length = 3;
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_3900
     * @tc.name PrimitiveTypesTest039
     * @tc.desc test Union type normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let t: T = 42;
      expect(t).assertEqual(42);
      
      t = "hello";
      expect(t).assertEqual("hello");
      
      t = true;
      expect(t).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4000
     * @tc.name PrimitiveTypesTest040
     * @tc.desc test Keyof type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let k: Keys = "field";
      expect(k).assertEqual("field");
      
      k = "method";
      expect(k).assertEqual("method");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4100
     * @tc.name PrimitiveTypesTest041
     * @tc.desc test Numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Test byte boundaries
      let byte_min: byte = -128;
      let byte_max: byte = 127;
      expect(byte_min).assertEqual(-128);
      expect(byte_max).assertEqual(127);
      
      // Test short boundaries
      let short_min: short = -32768;
      let short_max: short = 32767;
      expect(short_min).assertEqual(-32768);
      expect(short_max).assertEqual(32767);
      
      // Test int boundaries
      let int_min: int = -2147483648;
      let int_max: int = 2147483647;
      expect(int_min).assertEqual(-2147483648);
      expect(int_max).assertEqual(2147483647);
      
      // Test long boundaries
      let long_min: long = -9223372036854775808;
      let long_max: long = 9223372036854775807;
      expect(long_min).assertEqual(-9223372036854775808);
      expect(long_max).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4200
     * @tc.name PrimitiveTypesTest042
     * @tc.desc test Floating point special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Test NaN
      let nan_value: double = 0.0 / 0.0;
      expect(isNaN(nan_value)).assertEqual(true);
      
      // Test Infinity
      let infinity_value: double = 1.0 / 0.0;
      expect(isFinite(infinity_value)).assertEqual(false);
      
      let negative_infinity_value: double = -1.0 / 0.0;
      expect(isFinite(negative_infinity_value)).assertEqual(false);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4300
     * @tc.name PrimitiveTypesTest043
     * @tc.desc test Boolean operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let a: boolean = true;
      let b: boolean = false;
      
      expect(a && b).assertEqual(false);
      expect(a || b).assertEqual(true);
      expect(!a).assertEqual(false);
      expect(!b).assertEqual(true);
      expect(a && true).assertEqual(true);
      expect(b || true).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4400
     * @tc.name PrimitiveTypesTest044
     * @tc.desc test Array operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3];
      arr.push(4);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
      
      let popped = arr.pop();
      expect(popped).assertEqual(4);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4500
     * @tc.name PrimitiveTypesTest045
     * @tc.desc test Tuple operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let tuple: [number, string, boolean] = [1, "hello", true];
      expect(tuple[0]).assertEqual(1);
      expect(tuple[1]).assertEqual("hello");
      expect(tuple[2]).assertEqual(true);
      
      // Test tuple nesting
      let nestedTuple: [number, [string, boolean]] = [1, ["a", true]];
      expect(nestedTuple[0]).assertEqual(1);
      expect(nestedTuple[1][0]).assertEqual("a");
      expect(nestedTuple[1][1]).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4600
     * @tc.name PrimitiveTypesTest046
     * @tc.desc test Type aliases with functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let message: string = "";
      let h: Handler = (m: string) => {
        message = m;
      };
      
      h("test message");
      expect(message).assertEqual("test message");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4700
     * @tc.name PrimitiveTypesTest047
     * @tc.desc test Union type with class types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let animal: Animal = new Cat("Whiskers");
      expect(animal.name).assertEqual("Whiskers");
      animal = new Dog("Rex");
      expect(animal.name).assertEqual("Rex");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4800
     * @tc.name PrimitiveTypesTest048
     * @tc.desc test Type conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      // Test explicit type conversion
      let num: number = 123;
      let str: string = num.toString();
      expect(str).assertEqual("123");
      
      let parsedNum: number = parseInt("456");
      expect(parsedNum).assertEqual(456);
      
      let floatToInt: int = Math.floor(3.7) as int;
      expect(floatToInt).assertEqual(3);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_4900
     * @tc.name PrimitiveTypesTest049
     * @tc.desc test String operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let str: string = "Hello, World!";
      expect(str.length).assertEqual(13);
      expect(str.charAt(0)).assertEqual(c'H');
      expect(str.substring(0, 5)).assertEqual("Hello");
      expect(str.includes("World")).assertEqual(true);
      expect(str.split(", ")[0]).assertEqual("Hello");
      expect(str.split(", ")[1]).assertEqual("World!");
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_TYPES_5000
     * @tc.name PrimitiveTypesTest050
     * @tc.desc test Array and Object compatibility
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('PrimitiveTypesTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let arr: number[] = [1, 2, 3];
      let obj: Object = arr;
      expect(typeof obj).assertEqual("object");
      
      let tuple: [number, string] = [1, "a"];
      let tupleObj: Object = tuple;
      expect(typeof tupleObj).assertEqual("object");
    });

});
}
