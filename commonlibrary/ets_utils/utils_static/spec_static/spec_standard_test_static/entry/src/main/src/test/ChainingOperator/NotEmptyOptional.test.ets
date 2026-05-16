/*
* Copyright (C) 2026 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, TestType, Size } from '../../../../hypium/index';
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
// Classes and types for test 1 & 5
class Example_Member { member: number = 1 }

// Classes and types for test 2 & 6
class Example_Method { method(): number { return 1 } }

// Type alias for test 3 & 7
type Foo_Fn = () => number;

// Class for test 8
class Person_08 { name?: string }

// Classes for test 9 (define in dependency order: C -> B -> A)
class C_09 { value: string = "test" }
class B_09 { c?: C_09 }
class A_09 { b?: B_09 }

// Classes and function for test 10
class A_10 { fldA: string | null = "abc"; metA(p: string): string | null { return p } }
class B_10 { fldB: A_10 | null = new A_10() }
function boo_10(): B_10 | null { return new B_10() }

// Class for test 12
class Person_12 { details?: Record<string, boolean> }

// Classes for test 13
class SideEffectBox_13 { value: number = 2 }

// Classes for test 14
class SideEffectBox_14 { getValue(): number { return 3 } }

// Classes for test 15
class SideEffectBox_15 { value: number = 6 }
class NestedBox_15 { child: SideEffectBox_15 | null = null }

// Class for test 16
class Person_16 { fetchData?: () => Promise<string | undefined> }

// Class for test 18
class Builder_18 {
  private value: number = 0;
  add(n: number): Builder_18 { this.value += n; return this; }
  getResult(): number { return this.value; }
}

export default function optionalChainingTest() {
  describe('OptionalChainingTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () : Promise<void> => {
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
     * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0100
     * @tc.name      testOptionalChaining0001
     * @tc.desc      Test optional chaining field access with null value short-circuit.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
   it("testOptionalChaining0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let example: Example_Member | undefined = undefined;
    expect(example?.member).assertEqual(undefined);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0200
   * @tc.name      testOptionalChaining0002
   * @tc.desc      Test optional chaining method call with null value short-circuit.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let example: Example_Method | null = null;
    expect(example?.method()).assertEqual(undefined);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0300
   * @tc.name      testOptionalChaining0003
   * @tc.desc      Test optional chaining function call with undefined value short-circuit.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let foo: Foo_Fn | undefined = undefined;
    expect(foo?.()).assertEqual(undefined);
  });

   /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0400
   * @tc.name      testOptionalChaining0004
   * @tc.desc      Test optional chaining array index access with null value short-circuit.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let array: string[] | null = null;
    expect(array?.[0]).assertEqual(undefined);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0500
   * @tc.name      testOptionalChaining0005
   * @tc.desc      Test optional chaining field access with non-null object.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let ex = new Example_Member();
    let example: Example_Member | null = ex;
    expect(example?.member).assertEqual(1);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0600
   * @tc.name      testOptionalChaining0006
   * @tc.desc      Test optional chaining method call with non-null object.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let ex = new Example_Method();
    let example: Example_Method | null = ex;
    expect(example?.method()).assertEqual(1);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0700
   * @tc.name      testOptionalChaining0007
   * @tc.desc      Test optional chaining function call with non-null function reference.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let func: Foo_Fn = (): number => { return 1 };
    let foo: Foo_Fn | null = func;
    expect(foo?.()).assertEqual(1);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0800
   * @tc.name      testOptionalChaining0008
   * @tc.desc      Test optional chaining nested property access with optional field.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let person1 = new Person_08();
    expect(person1?.name?.length).assertEqual(undefined);
  });

   /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_0900
   * @tc.name      testOptionalChaining0009
   * @tc.desc      Test optional chaining multi-level object chain access.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let a1 = new A_09();
    expect(a1?.b?.c?.value).assertEqual(undefined);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1000
   * @tc.name      testOptionalChaining0010
   * @tc.desc      Test optional chaining nested method and field chain access.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    expect(boo_10()?.fldB?.metA("xyz")).assertEqual("xyz");
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1100
   * @tc.name      testOptionalChaining0011
   * @tc.desc      Test optional chaining matrix multi-level index access.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let matrix: number[][] | undefined = [[1, 2], [3, 4]];
    expect(matrix?.[0]?.[1]).assertEqual(2);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1200
   * @tc.name      testOptionalChaining0012
   * @tc.desc      Test optional chaining dynamic key access with Record type.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let alice = new Person_12();
    alice.details = { "read": true, "write": false } as Record<string, boolean>;
    let key: string = "read";
    expect(alice.details?.[key]).assertEqual(true);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1300
   * @tc.name      testOptionalChaining0013
   * @tc.desc      Test optional chaining with nullish coalescing for property access fallback.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let box: SideEffectBox_13 | null = null;
    expect(box?.value ?? 4).assertEqual(4);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1400
   * @tc.name      testOptionalChaining0014
   * @tc.desc      Test optional chaining with nullish coalescing for method call fallback.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let box: SideEffectBox_14 | null = null;
    expect(box?.getValue() ?? 5).assertEqual(5);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1500
   * @tc.name      testOptionalChaining0015
   * @tc.desc      Test optional chaining with chained nullish coalescing fallback.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let box: NestedBox_15 | null = null;
    expect(box?.child?.value ?? 8).assertEqual(8);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1600
   * @tc.name      testOptionalChaining0016
   * @tc.desc      Test optional chaining with async call and nullish coalescing fallback.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let bob = new Person_16();
    let resultPromise = bob.fetchData?.() ?? Promise.resolve(undefined);
    expect(resultPromise != null).assertTrue();
  });

 /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1700
   * @tc.name      testOptionalChaining0017
   * @tc.desc      Test optional chaining non-null string index access.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let str = "sss";
    let first: string = str?.[0] || "";
    expect(first).assertEqual("s");
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1800
   * @tc.name      testOptionalChaining0018
   * @tc.desc      Test optional chaining method chain call.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let builder: Builder_18 | null = new Builder_18();
    expect(builder?.add(5)?.getResult()).assertEqual(5);
  });

  /**
   * @tc.number    SUB_ARKTS_OPTIONAL_CHAINING_1900
   * @tc.name      testOptionalChaining0019
   * @tc.desc      Test optional chaining union type array access.
   * @tc.size      MediumTest
   * @tc.type      Function
   * @tc.level     Level 2
   */
  it("testOptionalChaining0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
    let users: string[] | null = [''];
    expect(users?.[0]).assertEqual('');
  });
  })
}