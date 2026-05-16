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
enum Enum_1 { first, second, third = 0 }
enum Enum_2 { first = 11, second = 11, third = 11 }
enum Enum_3 { first = "A", second = "B", third = "A" }
enum Enum_4 { first = "ABC", second = "ABC", third = "ABC" }
export default function EnumerationEqualityOperatorsTest() {
  describe("EnumerationEqualityOperatorsTest", () => {
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
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0100
    * @tc.name      testEnumerationEqualityOperators0001
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum_1.first != Enum_1.second && Enum_1.second != Enum_1.third && Enum_1.first == Enum_1.third).assertTrue()
      expect(Enum_2.first == Enum_2.second && Enum_2.second == Enum_2.third && Enum_2.first == Enum_2.third).assertTrue()
      expect(Enum_3.first != Enum_3.second && Enum_3.second != Enum_3.third && Enum_3.first == Enum_3.third).assertTrue()
      expect(Enum_4.first == Enum_4.second && Enum_4.second == Enum_4.third && Enum_4.first == Enum_4.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0200
    * @tc.name      testEnumerationEqualityOperators0002
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr_5: Enum_1[] = [Enum_1.first, Enum_1.second, Enum_1.third]
      let foo_5: (i: int) => Enum_1 = (i: int): Enum_1 => arr_5[i]
      expect(foo_5(0) != foo_5(1) && foo_5(1) != arr_5[2] && foo_5(0) == Enum_1.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0300
    * @tc.name      testEnumerationEqualityOperators0003
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr_6: Enum_2[] = [Enum_2.first, Enum_2.second, Enum_2.third]
      let foo_6: (i: int) => Enum_2 = (i: int): Enum_2 => arr_6[i]
      expect(foo_6(0) == foo_6(1) && foo_6(1) == arr_6[2] && foo_6(0) == Enum_2.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0400
    * @tc.name      testEnumerationEqualityOperators0004
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr_7: Enum_3[] = [Enum_3.first, Enum_3.second, Enum_3.third]
      let foo_7: (i: int) => Enum_3 = (i: int): Enum_3 => arr_7[i]
      expect(foo_7(0) != foo_7(1) && foo_7(1) != arr_7[2] && foo_7(0) == Enum_3.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0500
    * @tc.name      testEnumerationEqualityOperators0005
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr_8: Enum_4[] = [Enum_4.first, Enum_4.second, Enum_4.third]
      let foo_8: (i: int) => Enum_4 = (i: int): Enum_4 => arr_8[i]
      expect(foo_8(0) == foo_8(1) && foo_8(1) == arr_8[2] && foo_8(0) == Enum_4.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0600
    * @tc.name      testEnumerationEqualityOperators0006
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Enum_1.first !== Enum_1.second && Enum_1.second !== Enum_1.third && Enum_1.first === Enum_1.third).assertTrue()
      expect(Enum_2.first === Enum_2.second && Enum_2.second === Enum_2.third && Enum_2.first === Enum_2.third).assertTrue()
      expect(Enum_3.first !== Enum_3.second && Enum_3.second !== Enum_3.third && Enum_3.first === Enum_3.third).assertTrue()
      expect(Enum_4.first === Enum_4.second && Enum_4.second === Enum_4.third && Enum_4.first === Enum_4.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0700
    * @tc.name      testEnumerationEqualityOperators0007
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr_13: Enum_1[] = [Enum_1.first, Enum_1.second, Enum_1.third]
      let foo_13: (i: int) => Enum_1 = (i: int): Enum_1 => arr_13[i]
      expect(foo_13(0) !== foo_13(1) && foo_13(1) !== arr_13[2] && foo_13(0) === Enum_1.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0800
    * @tc.name      testEnumerationEqualityOperators0008
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr_14: Enum_2[] = [Enum_2.first, Enum_2.second, Enum_2.third]
      let foo_14: (i: int) => Enum_2 = (i: int): Enum_2 => arr_14[i]
      expect(foo_14(0) === foo_14(1) && foo_14(1) === arr_14[2] && foo_14(0) === Enum_2.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_0900
    * @tc.name      testEnumerationEqualityOperators0009
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr_15: Enum_3[] = [Enum_3.first, Enum_3.second, Enum_3.third]
      let foo_15: (i: int) => Enum_3 = (i: int): Enum_3 => arr_15[i]
      expect(foo_15(0) !== foo_15(1) && foo_15(1) !== arr_15[2] && foo_15(0) === Enum_3.third).assertTrue()
    })
   /**
    * @tc.number    SUB_ENUMERATION_EQUALITY_OPERATORS_1000
    * @tc.name      testEnumerationEqualityOperators0010
    * @tc.desc      The numeric types conversion (see Primitive Types Conversions) is performed on the operands of a value equality operator.
    * @tc.size      MediumTest
    * @tc.type      Function
    * @tc.level     Level 2
    */
    it("testEnumerationEqualityOperators0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr_16: Enum_4[] = [Enum_4.first, Enum_4.second, Enum_4.third]
      let foo_16: (i: int) => Enum_4 = (i: int): Enum_4 => arr_16[i]
      expect(foo_16(0) === foo_16(1) && foo_16(1) === arr_16[2] && foo_16(0) === Enum_4.third).assertTrue()
    })
  })
}
