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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

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

export default function EqualityExpressions() {
  describe('EqualityExpressions', (): void => {
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
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0100
     * @tc.name EqualityTest001
     * @tc.desc test boolean equality expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(true == true).assertEqual(true);
      expect(true === true).assertEqual(true);
      expect(true === false).assertEqual(false);
      expect(true != false).assertEqual(true);
      expect(true !== false).assertEqual(true);
      expect(false == false).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0200
     * @tc.name EqualityTest002
     * @tc.desc test string equality expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect("abc" == "abc").assertEqual(true);
      expect("abc" === "abc").assertEqual(true);
      expect("abc" == "def").assertEqual(false);
      expect("abc" != "def").assertEqual(true);

      let s: "abc" = "abc";
      expect(s == "abc").assertEqual(true);
      expect(s === "abc").assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0300
     * @tc.name EqualityTest003
     * @tc.desc test numeric equality expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(5 == 5).assertEqual(true);
      expect(5 == 5.0).assertEqual(true);
      expect(5 === 5.0).assertEqual(true);
      expect(5 != 6).assertEqual(true);
      expect(5 !== 6).assertEqual(true);

      let a: int = 5;
      let b: double = 5.0;
      expect(a == b).assertEqual(true);
      expect(a === b).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0400
     * @tc.name EqualityTest004
     * @tc.desc test NaN equality (IEEE 754 special rule)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let x: double = 0.0 / 0.0;
      expect(x == x).assertEqual(false);
      expect(x === x).assertEqual(false);
      expect(x != x).assertEqual(true);
      expect(x !== x).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0500
     * @tc.name EqualityTest005
     * @tc.desc test positive and negative zero equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let posZero: double = +0.0;
      let negZero: double = -0.0;
      expect(posZero == negZero).assertEqual(true);
      expect(posZero === negZero).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0600
     * @tc.name EqualityTest006
     * @tc.desc test Infinity equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let posInf: double = 1.0 / 0.0;
      let negInf: double = -1.0 / 0.0;
      expect(posInf == posInf).assertEqual(true);
      expect(posInf === posInf).assertEqual(true);
      expect(posInf == negInf).assertEqual(false);
      expect(posInf !== negInf).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0700
     * @tc.name EqualityTest007
     * @tc.desc test char type equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let c1: char = c'A';
      let c2: char = c'A';
      let c3: char = c'B';

      expect(c1 == c2).assertEqual(true);
      expect(c1 === c2).assertEqual(true);
      expect(c1 == c3).assertEqual(false);
      expect(c1 !== c3).assertEqual(true);

      let chinese: char = c'中';
      let chinese2: char = c'中';
      expect(chinese == chinese2).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0800
     * @tc.name EqualityTest008
     * @tc.desc test bigint equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a: bigint = 10n;
      let b: bigint = 10n;
      let c: bigint = 11n;

      expect(a == b).assertEqual(true);
      expect(a === b).assertEqual(true);
      expect(a == c).assertEqual(false);
      expect(a !== c).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_0900
     * @tc.name EqualityTest009
     * @tc.desc test numeric enum equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(E.A == E.A).assertEqual(true);
      expect(E.A === E.A).assertEqual(true);
      expect(E.A == E.B).assertEqual(false);
      expect(E.A !== E.B).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1000
     * @tc.name EqualityTest010
     * @tc.desc test string enum equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(S.A == S.A).assertEqual(true);
      expect(S.A === S.A).assertEqual(true);
      expect(S.A == S.B).assertEqual(false);
      expect(S.A !== S.B).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1100
     * @tc.name EqualityTest011
     * @tc.desc test function equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(f == f).assertEqual(true);
      expect(f === f).assertEqual(true);
      expect(f == g).assertEqual(false);
      expect(f !== g).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1200
     * @tc.name EqualityTest012
     * @tc.desc test instance method binding equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const a1 = new ClassWithMethod();
      const a2 = new ClassWithMethod();

      expect(a1.m == a1.m).assertEqual(true);
      expect(a1.m === a1.m).assertEqual(true);
      expect(a1.m == a2.m).assertEqual(false);
      expect(a1.m !== a2.m).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1300
     * @tc.name EqualityTest013
     * @tc.desc test static method equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(ClassWithStaticMethod.m == ClassWithStaticMethod.m).assertEqual(true);
      expect(ClassWithStaticMethod.m === ClassWithStaticMethod.m).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1400
     * @tc.name EqualityTest014
     * @tc.desc test object reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a = new Object();
      let b = new Object();
      let c = a;

      expect(a == b).assertEqual(false);
      expect(a === b).assertEqual(false);
      expect(a == c).assertEqual(true);
      expect(a === c).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1500
     * @tc.name EqualityTest015
     * @tc.desc test interface type equality (same instance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let x: ITest1 = new ClassWithInterfaces();
      let y: ITest2 = x;

      expect(x == y).assertEqual(true);
      expect(x === y).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1600
     * @tc.name EqualityTest016
     * @tc.desc test null and undefined equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let x: null  = null;
      let y: undefined = undefined;

      expect(x == y).assertEqual(true);
      expect(x === y).assertEqual(false);
      expect(x != y).assertEqual(false);
      expect(x !== y).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1700
     * @tc.name EqualityTest017
     * @tc.desc test Object type with null/undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let x: Object | null | undefined = null;
      let y: Object | null | undefined = undefined;

      expect(x == y).assertEqual(true);
      expect(x === y).assertEqual(false);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1800
     * @tc.name EqualityTest018
     * @tc.desc test Object parameter equality (same value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      expect(equ(1, 1)).assertEqual(true);
      expect(equ(1, 2)).assertEqual(false);
      expect(equ("a", "a")).assertEqual(true);
      expect(equ("a", "b")).assertEqual(false);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_1900
     * @tc.name EqualityTest019
     * @tc.desc test NaN with Object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a: Object = NaN;
      let b: Object = NaN;
      expect(a == a).assertEqual(false);
      expect(b == b).assertEqual(false);
      expect(a == b).assertEqual(false);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2000
     * @tc.name EqualityTest020
     * @tc.desc test array reference equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [1, 2, 3];
      let arr3 = arr1;
      expect(arr1 == arr2).assertEqual(false);
      expect(arr1 === arr2).assertEqual(false);
      expect(arr1 == arr3).assertEqual(true);
      expect(arr1 === arr3).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2100
     * @tc.name EqualityTest021
     * @tc.desc test numeric type promotion in equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let byteVal: byte = 5;
      let shortVal: short = 5;
      let intVal: int = 5;
      let longVal: long = 5;
      let floatVal: float = 5.0f;
      let doubleVal: double = 5.0;

      expect(byteVal == intVal).assertEqual(true);
      expect(shortVal == longVal).assertEqual(true);
      expect(intVal == floatVal).assertEqual(true);
      expect(floatVal == doubleVal).assertEqual(true);
      expect(doubleVal == byteVal).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2200
     * @tc.name EqualityTest022
     * @tc.desc test left-associative property of equality operators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('EqualityTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = true == true == true;
      expect(result).assertEqual(true);

      result = false == false == true;
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2300
     * @tc.name EqualityTest023
     * @tc.desc test operator precedence (relational < equality)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('EqualityTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: boolean = 1 < 2 == 3 < 4;
      expect(r).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2400
     * @tc.name EqualityTest024
     * @tc.desc test tuple equality (reference comparison)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let tuple1: [number, string] = [1, "a"];
      let tuple2: [number, string] = [1, "a"];
      let tuple3 = tuple1;

      expect(tuple1 == tuple2).assertEqual(false);
      expect(tuple1 === tuple2).assertEqual(false);
      expect(tuple1 == tuple3).assertEqual(true);
      expect(tuple1 === tuple3).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2500
     * @tc.name EqualityTest025
     * @tc.desc test class instance equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a1: ClassWithValue = new ClassWithValue(5);
      let a2: ClassWithValue = new ClassWithValue(5);
      let a3: ClassWithValue = a1;

      expect(a1 == a2).assertEqual(false);
      expect(a1 === a2).assertEqual(false);
      expect(a1 == a3).assertEqual(true);
      expect(a1 === a3).assertEqual(true);
      expect(a1.value == a2.value).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2600
     * @tc.name EqualityTest026
     * @tc.desc test union type with intersection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('EqualityTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: T = "hello";
      let y: U = "hello";

      expect(x == y).assertEqual(true);
      expect(x === y).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2700
     * @tc.name EqualityTest027
     * @tc.desc test readonly array equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr1: readonly number[] = [1, 2, 3];
      let arr2: readonly number[] = [1, 2, 3];
      let arr3 = arr1;

      expect(arr1 == arr2).assertEqual(false);  // Different references
      expect(arr1 === arr2).assertEqual(false); // Different references
      expect(arr1 == arr3).assertEqual(true);   // Same reference
      expect(arr1 === arr3).assertEqual(true);  // Same reference
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2800
     * @tc.name EqualityTest028
     * @tc.desc test negation operator with equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a: number = 5;
      let b: number = 10;

      expect(!(a == b)).assertEqual(true);
      expect(!(a === b)).assertEqual(true);
      expect(!(a != b)).assertEqual(false);
      expect(a == b).assertEqual(false);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_2900
     * @tc.name EqualityTest029
     * @tc.desc test Object type with different boxed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let numObj1: Object = 5;
      let numObj2: Object = 5;
      let strObj1: Object = "hello";
      let strObj2: Object = "hello";

      expect(numObj1 == numObj2).assertEqual(true);  // Different object references
      expect(numObj1 === numObj2).assertEqual(true); // Different object references
      expect(strObj1 == strObj2).assertEqual(true);  // Different object references
      expect(strObj1 === strObj2).assertEqual(true); // Different object references
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_3000
     * @tc.name EqualityTest030
     * @tc.desc test floating point precision in equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let d1: double = 0.1;
      let d2: double = 0.2;
      let d3: double = 0.3;
      expect(Math.abs((d1 + d2) - d3) < 0.0001).assertEqual(true);

      let epsilon: double = 0.0001;
      let diff: double = (d1 + d2) - d3;
      expect(Math.abs(diff) < epsilon).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_3100
     * @tc.name EqualityTest031
     * @tc.desc test boolean expressions combining equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('EqualityTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 5;
      let b: number = 5;
      let c: number = 10;

      expect(a == b && b == c).assertEqual(false);  // true && false => false
      expect(a == b || b == c).assertEqual(true);   // true || false => true
      expect(a == b && b != c).assertEqual(true);  // true && true => true

      expect((a == b) == (b != c)).assertEqual(true);  // true == true => true
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_3200
     * @tc.name EqualityTest032
     * @tc.desc test comparison between int and long ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let intMax: int = 2147483647;
      let longVal: long = 2147483647;

      expect(intMax == longVal).assertEqual(true);
      expect(intMax === longVal).assertEqual(true);

      let longMax: long = 9223372036854775807;
      let intVal: int = 2147483647;

      expect(longMax == intVal).assertEqual(false);
      expect(longMax !== intVal).assertEqual(true);
    });

    /**
     * @tc.number SUB_SPEC_STATIC_ArkTS_EQUALITY_3300
     * @tc.name EqualityTest033
     * @tc.desc test nested object equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('EqualityTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let a1: NestedClass = new NestedClass(1);
      let a2: NestedClass = new NestedClass(1);
      let a3: NestedClass = a1;

      expect(a1 == a2).assertEqual(false);  // Different instances
      expect(a1 == a3).assertEqual(true);   // Same instance

      let nested1: NestedClass = new NestedClass(1, new NestedClass(2));
      let nested2: NestedClass = new NestedClass(1, new NestedClass(2));

      expect(nested1 == nested2).assertEqual(false);  // Different instances
      expect(nested1.next == nested2.next).assertEqual(false);  // Different nested instances
    });

  });
}
