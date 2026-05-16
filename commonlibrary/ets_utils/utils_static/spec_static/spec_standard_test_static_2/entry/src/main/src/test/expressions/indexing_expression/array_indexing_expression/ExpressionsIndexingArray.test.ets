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
} from "../../../../../../hypium";

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

let arr_abrupt01: number[] = [1, 2, 3]

function arrRef_abrupt01(exc: boolean): number[] {
  if (exc) {
    throw new Error()
  }
  return arr_abrupt01
}

let arr_array_access: int[] = [1, 2, 3]

let arr_array_access4_0: (Int|null)[] = [new Int(1), 2, null]
let arr_array_access4_3: (Int|undefined)[] = [new Int(1), 2, undefined]

function getArrElem_array_access4_0(i: int): Object|null {
  return arr_array_access4_0[i]
}

function getArrElem_array_access4_3(i: int): Object|undefined {
  return arr_array_access4_3[i]
}

const a_array_index_convert_to_int: string[] = ["Alice", "Bob", "Carol"]

enum Color_array_index23 { Red, Green, Blue }

class Container_array_index20 {
  public value: number = 0
}


function refNullish_indx2_0(): string[]|null {
  let res: string[]|null = ["abc", "def"]
  return res
}

function refNullish_indx2_1(): string[]|null {
  let res: string[]|null = null
  return res
}

function refNullish_indx2_2(): string[]|undefined {
  let res: string[]|undefined = ["abc", "def"]
  return res
}

function refNullish_indx2_3(): string[]|undefined {
  let res: string[]|undefined = undefined
  return res
}

const arr_multiple_array_index: Array<FixedArray<ReadonlyArray<string|null|undefined>>> = [
  [ [ "ab", "cd" ],       [ "ef", "gh" ], [ "ij", "kl" ] ],
  [ [ null ],             [ undefined ],  [ "3", null ]  ],
  [ [ undefined, "one" ], [ null, null ], [ "end" ]      ]
]

class RefType_spec_ex2 {
  field: number = 666
}

export default function ExpressionsIndexingArrayTest(): void {
  describe("ExpressionsIndexingArrayTest", () => {
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
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0100
     * @tc.name      testExpressionsIndexingArray0001
     * @tc.desc      For an array, if the index expression value is less than zero, greater than
     *               or equal to the array's length, then ArrayIndexOutOfBoundsError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let indexingExpressionEvaluated: boolean = false
      let checkException = (e: Error): boolean => { return e instanceof Error }
      let exceptionThrown = false
      try {
        arrRef_abrupt01(true)[(():int => { indexingExpressionEvaluated = true; return 2 })()]
      } catch (e) {
        exceptionThrown = e instanceof Error
      }
      
      expect(exceptionThrown).assertTrue()
      expect(indexingExpressionEvaluated).assertFalse()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0200
     * @tc.name      testExpressionsIndexingArray0002
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      expect(arr_array_access[0]).assertEqual(x)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0300
     * @tc.name      testExpressionsIndexingArray0003
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      expect(arr_array_access[x]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0400
     * @tc.name      testExpressionsIndexingArray0004
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      expect(arr_array_access[x + 1]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0500
     * @tc.name      testExpressionsIndexingArray0005
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arr_array_access[arr_array_access[0]]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0600
     * @tc.name      testExpressionsIndexingArray0006
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = 1
      expect(arr_array_access[arr_array_access[x]]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0700
     * @tc.name      testExpressionsIndexingArray0007
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Byte = new Byte(2 as byte)
      expect(arr_array_access[x]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0800
     * @tc.name      testExpressionsIndexingArray0008
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: byte = new Byte(0 as byte)
      expect(arr_array_access[x]).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_0900
     * @tc.name      testExpressionsIndexingArray0009
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Short = new Short(0 as short)
      expect(arr_array_access[x]).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1000
     * @tc.name      testExpressionsIndexingArray0010
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: short = new Short(1 as short)
      expect(arr_array_access[x]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1100
     * @tc.name      testExpressionsIndexingArray0011
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: Int = new Int(1)
      expect(arr_array_access[x]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1200
     * @tc.name      testExpressionsIndexingArray0012
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: int = new Int(2)
      expect(arr_array_access[x]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1300
     * @tc.name      testExpressionsIndexingArray0013
     * @tc.desc      Array access expression. The array access expression's result is a type T variable
     *               (i.e., a variable within the array selected by the value of that index expression).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getArrElem_array_access4_0(0) instanceof Object).assertTrue()
      expect(getArrElem_array_access4_0(0)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1400
     * @tc.name      testExpressionsIndexingArray0014
     * @tc.desc      Array access expression. The array access expression's result is a type T variable
     *               (i.e., a variable within the array selected by the value of that index expression).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getArrElem_array_access4_0(1) instanceof Int).assertTrue()
      expect(getArrElem_array_access4_0(1)).assertEqual(2)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1500
     * @tc.name      testExpressionsIndexingArray0015
     * @tc.desc      Array access expression. The array access expression's result is a type T variable
     *               (i.e., a variable within the array selected by the value of that index expression).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getArrElem_array_access4_0(2)).assertEqual(null)
      expect(getArrElem_array_access4_3(0) instanceof Int).assertTrue()
      expect(getArrElem_array_access4_3(0)).assertEqual(1)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1600
     * @tc.name      testExpressionsIndexingArray0016
     * @tc.desc      Array access expression. The array access expression's result is a type T variable
     *               (i.e., a variable within the array selected by the value of that index expression).
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getArrElem_array_access4_3(1) instanceof Object).assertTrue()
      expect(getArrElem_array_access4_3(1)).assertEqual(2)
      expect(getArrElem_array_access4_3(2)).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1700
     * @tc.name      testExpressionsIndexingArray0017
     * @tc.desc      Other numeric types (long, float, and double/number) must be converted explicitly
     *               by applying the methods defined in the classes of the Standard Library.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: long = 0
      expect(a_array_index_convert_to_int[index.toInt()]).assertEqual("Alice")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1800
     * @tc.name      testExpressionsIndexingArray0018
     * @tc.desc      Other numeric types (long, float, and double/number) must be converted explicitly
     *               by applying the methods defined in the classes of the Standard Library.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: Long = 1
      expect(a_array_index_convert_to_int[index.toInt()]).assertEqual("Bob")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_1900
     * @tc.name      testExpressionsIndexingArray0019
     * @tc.desc      Other numeric types (long, float, and double/number) must be converted explicitly
     *               by applying the methods defined in the classes of the Standard Library.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: float = 1.0f
      expect(a_array_index_convert_to_int[index.toInt()]).assertEqual("Bob")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2000
     * @tc.name      testExpressionsIndexingArray0020
     * @tc.desc      Other numeric types (long, float, and double/number) must be converted explicitly
     *               by applying the methods defined in the classes of the Standard Library.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: Float = 0.8f
      expect(a_array_index_convert_to_int[index.toInt()]).assertEqual("Alice")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2100
     * @tc.name      testExpressionsIndexingArray0021
     * @tc.desc      Other numeric types (long, float, and double/number) must be converted explicitly
     *               by applying the methods defined in the classes of the Standard Library.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: double = 2.1
      expect(a_array_index_convert_to_int[index.toInt()]).assertEqual("Carol")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2200
     * @tc.name      testExpressionsIndexingArray0022
     * @tc.desc      Other numeric types (long, float, and double/number) must be converted explicitly
     *               by applying the methods defined in the classes of the Standard Library.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let index: Number = 1.9
      expect(a_array_index_convert_to_int[index.toInt()]).assertEqual("Bob")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2300
     * @tc.name      testExpressionsIndexingArray0023
     * @tc.desc      If the index expression value of an array is less than zero, greater than or
     *               equal to that array's length, then RangeError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      let index: int = 0
      let a: number = 0

      let exceptionThrown = false
      let isRangeError = false
      let messageContains = false

      try {
        a = arr[index]
      } catch (e) {
        exceptionThrown = true
        isRangeError = e instanceof RangeError
        messageContains = e.message.includes("Out of bounds")
      }

      expect(exceptionThrown).assertTrue()
      expect(isRangeError).assertTrue()
      expect(messageContains).assertTrue()
      expect(a).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2400
     * @tc.name      testExpressionsIndexingArray0024
     * @tc.desc      If the index expression value of an array is less than zero, greater than or
     *               equal to that array's length, then RangeError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      let index: int = -1
      let a: number = 0

      let exceptionThrown = false
      let isRangeError = false
      let messageContains = false

      try {
        a = arr[index]
      } catch (e) {
        exceptionThrown = true
        isRangeError = e instanceof RangeError
        messageContains = e.message.includes("Out of bounds")
      }

      expect(exceptionThrown).assertTrue()
      expect(isRangeError).assertTrue()
      expect(messageContains).assertTrue()
      expect(a).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2500
     * @tc.name      testExpressionsIndexingArray0025
     * @tc.desc      If the index expression value of an array is less than zero, greater than or
     *               equal to that array's length, then RangeError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      let index: int = 10
      let a: number = 0

      let exceptionThrown = false
      let isRangeError = false
      let messageContains = false

      try {
        a = arr[index]
      } catch (e) {
        exceptionThrown = true
        isRangeError = e instanceof RangeError
        messageContains = e.message.includes("Out of bounds")
      }

      expect(exceptionThrown).assertTrue()
      expect(isRangeError).assertTrue()
      expect(messageContains).assertTrue()
      expect(a).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2600
     * @tc.name      testExpressionsIndexingArray0026
     * @tc.desc      If the index expression value of an array is less than zero, greater than or
     *               equal to that array's length, then RangeError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = []
      let index: int = arr.length
      let a: number = 0

      let exceptionThrown = false
      let isRangeError = false
      let messageContains = false

      try {
        a = arr[index]
      } catch (e) {
        exceptionThrown = true
        isRangeError = e instanceof RangeError
        messageContains = e.message.includes("Out of bounds")
      }

      expect(exceptionThrown).assertTrue()
      expect(isRangeError).assertTrue()
      expect(messageContains).assertTrue()
      expect(a).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2700
     * @tc.name      testExpressionsIndexingArray0027
     * @tc.desc      If the index expression value of an array is less than zero, greater than or
     *               equal to that array's length, then RangeError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      let index: int = -10
      let a: number = 0

      let exceptionThrown = false
      let isRangeError = false
      let messageContains = false

      try {
        a = arr[index]
      } catch (e) {
        exceptionThrown = true
        isRangeError = e instanceof RangeError
        messageContains = e.message.includes("Out of bounds")
      }

      expect(exceptionThrown).assertTrue()
      expect(isRangeError).assertTrue()
      expect(messageContains).assertTrue()
      expect(a).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2800
     * @tc.name      testExpressionsIndexingArray0028
     * @tc.desc      If the index expression value of an array is less than zero, greater than or
     *               equal to that array's length, then RangeError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      let index: int = 3
      let a: number = 0

      let exceptionThrown = false
      let isRangeError = false
      let messageContains = false

      try {
        a = arr[index]
      } catch (e) {
        exceptionThrown = true
        isRangeError = e instanceof RangeError
        messageContains = e.message.includes("Out of bounds")
      }

      expect(exceptionThrown).assertTrue()
      expect(isRangeError).assertTrue()
      expect(messageContains).assertTrue()
      expect(a).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_2900
     * @tc.name      testExpressionsIndexingArray0029
     * @tc.desc      If the index expression value of an array is less than zero, greater than or
     *               equal to that array's length, then RangeError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      let index: int = 300
      let a: number = 0

      let exceptionThrown = false
      let isRangeError = false
      let messageContains = false

      try {
        a = arr[index]
      } catch (e) {
        exceptionThrown = true
        isRangeError = e instanceof RangeError
        messageContains = e.message.includes("Out of bounds")
      }

      expect(exceptionThrown).assertTrue()
      expect(isRangeError).assertTrue()
      expect(messageContains).assertTrue()
      expect(a).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3000
     * @tc.name      testExpressionsIndexingArray0030
     * @tc.desc      If the index expression value of an array is less than zero, greater than or
     *               equal to that array's length, then RangeError is thrown.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3]
      let index: int = arr.length
      let a: number = 0

      let exceptionThrown = false
      let isRangeError = false
      let messageContains = false

      try {
        a = arr[index]
      } catch (e) {
        exceptionThrown = true
        isRangeError = e instanceof RangeError
        messageContains = e.message.includes("Out of bounds")
      }

      expect(exceptionThrown).assertTrue()
      expect(isRangeError).assertTrue()
      expect(messageContains).assertTrue()
      expect(a).assertEqual(0)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3100
     * @tc.name      testExpressionsIndexingArray0031
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      expect(names[0]).assertEqual("Alice")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3200
     * @tc.name      testExpressionsIndexingArray0032
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      expect(names[1]).assertEqual("Bob")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3300
     * @tc.name      testExpressionsIndexingArray0033
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      expect(names[2]).assertEqual("Carol")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3400
     * @tc.name      testExpressionsIndexingArray0034
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      names[1] = "Martin"
      expect(names[0]).assertEqual("Alice")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3500
     * @tc.name      testExpressionsIndexingArray0035
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      names[2] = "Martin"
      expect(names[1]).assertEqual("Bob")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3600
     * @tc.name      testExpressionsIndexingArray0036
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      names[0] = "Martin"
      expect(names[2]).assertEqual("Carol")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3700
     * @tc.name      testExpressionsIndexingArray0037
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      names[0] = "Martin"
      expect(names[0]).assertEqual("Martin")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3800
     * @tc.name      testExpressionsIndexingArray0038
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      names[1] = "Martin"
      expect(names[1]).assertEqual("Martin")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_3900
     * @tc.name      testExpressionsIndexingArray0039
     * @tc.desc      Test the array index expression to access array elements normally.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let names: string[] = ["Alice", "Bob", "Carol"]
      names[2] = "Martin"
      expect(names[2]).assertEqual("Martin")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4000
     * @tc.name      testExpressionsIndexingArray0040
     * @tc.desc      Test the array index expression to Usage of the chaining operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullableArray: (string|null)[] = ["Hello", "World"]
      expect(nullableArray?.[1]).assertEqual("World")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4100
     * @tc.name      testExpressionsIndexingArray0041
     * @tc.desc      Test the array index expression to Access multi-dimensional arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: number[][] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]
      expect(matrix[1][2]).assertEqual(6)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4200
     * @tc.name      testExpressionsIndexingArray0042
     * @tc.desc      Test the array index expression to change multi-dimensional arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: number[][] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]
      matrix[1][2] = 10
      expect(matrix[1][2]).assertEqual(10)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4300
     * @tc.name      testExpressionsIndexingArray0043
     * @tc.desc      Test the array index expression to Out-of-bounds access of multi-dimensional
     *               arrays.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let matrix: number[][] = [
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      ]

      let isError: boolean = false
      let errorName: string = ""
      let errorMessage: string = ""

      try {
        let _ = matrix[3][0]
      } catch (error) {
        isError = true
        if (error instanceof RangeError) {
          errorName = "RangeError"
          errorMessage = error.message
        }
      } finally {
        if (!isError) {
          throw new Error('No RangeError occured, but "Out of bounds" expected.')
        }
      }

      expect(errorName).assertEqual("RangeError")
      expect(errorMessage.includes("Out of bounds")).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4400
     * @tc.name      testExpressionsIndexingArray0044
     * @tc.desc      Test the array index expression to Dynamic array length.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dynamicArray: number[] = [10, 20, 30]
      expect(dynamicArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4500
     * @tc.name      testExpressionsIndexingArray0045
     * @tc.desc      Test the array index expression to nested usage of the chaining operator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nestedArray: number[][]|null = [
        [1, 2],
        [3, 4]
      ]
      expect(nestedArray?.[1]?.[0]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4600
     * @tc.name      testExpressionsIndexingArray0046
     * @tc.desc      Test the array index expression to use forEach to iterate over an array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numbers: number[] = [1, 2, 3, 4, 5]
      let passed = true

      numbers.forEach((value, index) => {
        if (numbers[index] !== value) {
          passed = false
        }
      })

      expect(passed).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4700
     * @tc.name      testExpressionsIndexingArray0047
     * @tc.desc      Test to use array built-in function map to create new array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numbers: number[] = [1, 2, 3, 4, 5]
      let doubledNumbers = numbers.map((value: number) => value * 2)

      expect(doubledNumbers[0]).assertEqual(2)
      expect(doubledNumbers[1]).assertEqual(4)
      expect(doubledNumbers[2]).assertEqual(6)
      expect(doubledNumbers[3]).assertEqual(8)
      expect(doubledNumbers[4]).assertEqual(10)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4800
     * @tc.name      testExpressionsIndexingArray0048
     * @tc.desc      Test to use array built-in function filter to create new array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numbers: number[] = [1, 2, 3, 4, 5]
      let evenNumbers = numbers.filter((value: number) => value % 2 === 0)

      expect(evenNumbers[0]).assertEqual(2)
      expect(evenNumbers[1]).assertEqual(4)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_4900
     * @tc.name      testExpressionsIndexingArray0049
     * @tc.desc      Test the array index access of an empty array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isPassed: boolean = false
      let numbers: number[] = []
      let errorName: string = ""
      let errorMessage: string = ""

      try {
        let first: number|undefined = numbers[0]
      } catch (error) {
        isPassed = true
        if (error instanceof RangeError) {
          errorName = "RangeError"
          errorMessage = error.message
        }
      } finally {
        if (!isPassed) {
          throw new Error('No RangeError occured, but "Out of bounds" expected.')
        }
      }

      expect(errorName).assertEqual("RangeError")
      expect(errorMessage.includes("Out of bounds")).assertTrue()
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_5000
     * @tc.name      testExpressionsIndexingArray0050
     * @tc.desc      Test the array index modification of fields when array elements are reference
     *               types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let containers: Container_array_index20[] = [new Container_array_index20(), new Container_array_index20()]
      containers[0].value = 10
      expect(containers[1].value).assertEqual(0)

      let first = containers[0]
      first.value = 20
      expect(containers[0].value).assertEqual(20)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_5100
     * @tc.name      testExpressionsIndexingArray0051
     * @tc.desc      Test the array index using an enumeration type as an index.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let colorValues: number[] = [10, 20, 30]
      expect(colorValues[Color_array_index23.Green]).assertEqual(20)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_5200
     * @tc.name      testExpressionsIndexingArray0052
     * @tc.desc      If the chaining operator '?.' is present, and after its application
     *               the type of object reference expression is an array type, then it makes a valid
     *               array reference expression, and the type of the array indexing expression is T.
     *               If the value of the expression to the left of '?.' is undefined or null,
     *               then the evaluation of the entire surrounding primary expression stops. The result
     *               of the entire primary expression is then undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(refNullish_indx2_0()?.[0]).assertEqual("abc")
      expect(refNullish_indx2_1()?.[0]).assertEqual(undefined)
      expect(refNullish_indx2_2()?.[0]).assertEqual("abc")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_5300
     * @tc.name      testExpressionsIndexingArray0053
     * @tc.desc      If the chaining operator '?.' is present, and after its application
     *               the type of object reference expression is an array type, then it makes a valid
     *               array reference expression, and the type of the array indexing expression is T.
     *               If the value of the expression to the left of '?.' is undefined or null,
     *               then the evaluation of the entire surrounding primary expression stops. The result
     *               of the entire primary expression is then undefined.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(refNullish_indx2_3()?.[0]).assertEqual(undefined)
      expect(arr_multiple_array_index[0][0][0]).assertEqual("ab")
      expect(arr_multiple_array_index[2][1][1]).assertEqual(null)
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_5400
     * @tc.name      testExpressionsIndexingArray0054
     * @tc.desc      Index expression for array indexing must be one of integer types, namely byte,
     *               short, or int. Otherwise, a compile-time error occurs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(arr_multiple_array_index[1][1][0]).assertEqual(undefined)
      expect(arr_multiple_array_index[2][2][0]).assertEqual("end")
    })

    /**
     * @tc.number    SUB_EXPRESSIONS_INDEXING_ARRAY_5500
     * @tc.name      testExpressionsIndexingArray0055
     * @tc.desc      It is essential that, if type T is a reference type, then the fields of array
     *               elements can be changed by changing the resultant variable fields. An illustration
     *               is given in the example below:
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testExpressionsIndexingArray0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const objects: RefType_spec_ex2[] = [new RefType_spec_ex2(), new RefType_spec_ex2()]
      const obj = objects[1]
      obj.field = 777
      expect(objects[0].field == 666).assertTrue()
      expect(objects[1].field == 777).assertTrue()
    })
  })
}
