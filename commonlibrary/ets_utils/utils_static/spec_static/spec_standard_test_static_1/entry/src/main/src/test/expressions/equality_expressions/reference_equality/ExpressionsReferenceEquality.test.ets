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
} from '../../../../../../hypium';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}
class A_1 {}
class A_2 {}
class A_3 {}
class A_4{}
class B_4{}
class A_5{}
class B_5{}
class A_6{}
class B_6{}
class A_7{}
class B_7{}
class A_8{}
class B_8{}
class A_9{}
class B_9{}
class A_10 {}
class B_10 {}
export default function ExpressionsReferenceEqualityTest() {
  describe("ExpressionsReferenceEqualityTest", () => {
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
      // This API supports only one parameter: preset action function.
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0100
     * @tc.name      testExpressionsReferenceEquality0001
     * @tc.desc      'The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types.' params: a == b is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let b: int[] = [1, 2, 3];
      expect((a == b)).assertFalse()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0200
     * @tc.name      testExpressionsReferenceEquality0002
     * @tc.desc      'The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types.' params: a != b is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let b: int[] = [1, 2, 3];
      expect((a != b)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0300
     * @tc.name      testExpressionsReferenceEquality0003
     * @tc.desc      'The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types.' params: a == c is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let c: int[] = [1, 2, 4];
      expect((a == c)).assertFalse()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0400
     * @tc.name      testExpressionsReferenceEquality0004
     * @tc.desc      'The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types.' params: a != c is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let c: int[] = [1, 2, 4];
      expect((a != c)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0500
     * @tc.name      testExpressionsReferenceEquality0005
     * @tc.desc      'The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types.' params: a == d is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let d: int[] = [1, 2, 3, 4];
      expect((a == d)).assertFalse()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0600
     * @tc.name      testExpressionsReferenceEquality0006
     * @tc.desc      'The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types.' params: a != d is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let d: int[] = [1, 2, 3, 4];
      expect((a != d)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0700
     * @tc.name      testExpressionsReferenceEquality0007
     * @tc.desc      'The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types.' params: a == e is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let e: int[]|null = null;
      expect((a == e)).assertFalse()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0800
     * @tc.name      testExpressionsReferenceEquality0008
     * @tc.desc      'The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types.' params: a != e is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let e: int[]|null = null;
      expect((a != e)).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_0900
     * @tc.name      testExpressionsReferenceEquality0009
     * @tc.desc      The result of === at runtime is true if both operand values are null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A_1 | null = null;
      let c: A_1 | null = null;
      expect(b === c && b == c ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1000
     * @tc.name      testExpressionsReferenceEquality0010
     * @tc.desc      The result of === at runtime is true if both operand values are null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null === null) == true ).assertTrue()
      expect((null == null) == true ).assertTrue()
      expect((null !== null) == false ).assertTrue()
      expect((null != null) == false ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1100
     * @tc.name      testExpressionsReferenceEquality0011
     * @tc.desc      The result of !== at runtime is false if both operand values are null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b: A_2 | null = null;
      let c: A_2 | null = null;
      expect((b !== c) == false ).assertTrue()
      expect((b != c) == false ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1200
     * @tc.name      testExpressionsReferenceEquality0012
     * @tc.desc      The result of === at runtime is true if both operand values refer to the same array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: int[] = [1, 2, 3];
      let b: int[] = a;
      expect((a !== a) == false ).assertTrue()
      expect((a !== b) == false ).assertTrue()
      expect((a === a) == true ).assertTrue()
      expect((a === b) == true ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1300
     * @tc.name      testExpressionsReferenceEquality0013
     * @tc.desc      The result of === at runtime is true if both operand values refer to the same object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_3: A_3 = new A_3();
      let b: A_3 = a_3;
      expect((a_3 !== a_3) == false ).assertTrue()
      expect((a_3 !== b) == false ).assertTrue()
      expect((a_3 === a_3) == true ).assertTrue()
      expect((a_3 === b) == true ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1400
     * @tc.name      testExpressionsReferenceEquality0014
     * @tc.desc      The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types. params: null == null is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null == null) == true ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1500
     * @tc.name      testExpressionsReferenceEquality0015
     * @tc.desc      The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types. params: null != null is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((null != null) == false ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1600
     * @tc.name      testExpressionsReferenceEquality0016
     * @tc.desc      The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types. params: a != b is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_6 = new A_6()
      let b_6 = new B_6()
      expect((a_6 != b_6) == true ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1700
     * @tc.name      testExpressionsReferenceEquality0017
     * @tc.desc      The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types. params: a == b is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_7 = new A_7()
      let b_7 = new B_7()
      expect((a_7 == b_7) == false ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1800
     * @tc.name      testExpressionsReferenceEquality0018
     * @tc.desc      The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types. params: a == a is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_8 = new A_8()
      expect((a_8 == a_8) == true ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_1900
     * @tc.name      testExpressionsReferenceEquality0019
     * @tc.desc      The value equality operator a == b semantically equals a === null ? b === null : a.equals(b) if both of its operands are of reference types. params: a == null is false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_9 = new A_9()
      expect((a_9 == null) == false ).assertTrue()
    })
    /**
     * @tc.number    SUB_EXPRESSIONS_REFERENCE_EQUALITY_2000
     * @tc.name      testExpressionsReferenceEquality0020
     * @tc.desc      'if types A and B do not overlap (and therefore an expression always evaluated to false at compile time), then: - if each of A and B is either a predefined type or a union of predefined types, a compile-time-error is issued. - in all other cases, a compile-time warning is issued.'
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsReferenceEquality0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a_10: A_10 = new A_10();
      let b_10: B_10 = new B_10();
      expect(a_10 != b_10).assertTrue()
      expect(a_10 !== b_10).assertTrue()
      expect(a_10 == b_10).assertFalse()
      expect(a_10 === b_10).assertFalse()
    })
  })
}