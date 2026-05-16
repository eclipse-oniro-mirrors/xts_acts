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

// 30
// 类型定义
type MyArray_0<T> = T[]
type Direction_0 = number
type MyArray_1<T> = T[]
type Direction_1 = number
type MyArray_2<T> = T[]
type Direction_2 = number
type MyArray_3<T> = T[]
type Direction_3 = number
type MyArray_4<T> = T[]
type Direction_4 = 'up' | 'down' | 'left' | 'right'
type MyArray_5<T> = T[]
type Direction_5 = string
type MyArray_6<T> = T[]
type Direction_6 = byte
type MyArray_7<T> = T[]
type Direction_7 = short
type MyArray_8<T> = T[]
type Direction_8 = int
type MyArray_9<T> = T[]
type Direction_9 = long
type MyArray_10<T> = T[]
type Direction_10 = Float
type MyArray_11<T> = T[]
type Direction_11 = double
type MyArray_12<T> = T[]
type Direction_12 = boolean
type MyArray_13<T> = T[]
type Direction_13 = bigint
type MyArray_14<T> = T[]
type Direction_14 = (string | number)
type MyArray_15<T> = T[]
type Direction_15 = undefined
type MyArray_16<T> = T[]
enum ColorSet_16 {Red = 0, Green = 1, Blue = 2}
type Direction_16 = ColorSet_16
type MyArray_17<T> = T[]
type Direction_17 = null
type MyArray_18<T> = T[]
type Direction_18 = number[]
type MyArray_19<T> = T[]
type Direction_19 = [number, string, boolean]
type MyArray_20<T> = T[]
type Direction_20 = (() => int)
type MyArray_21<T> = T[]
class Animal_21 {
  public name: string
  constructor(name: string) {
    this.name = name
  }
}
type Direction_21 = Animal_21
type MyArray_22<T> = T[][][]
interface Person_23 {
  name: string
  age: number
  hobbies: string[]
}
type MyArray_23<T> = T[]
type MyArray_24<T> = Array<T>
type MyArray_25<T> = Array<T>
type Pair_26<T, U> = [T, U]
type ComplexArray_26 = Pair_26<number, string>[]
class Box1_28<T> {
  value: T
  constructor(v: T) { this.value = v; }
}
type MyArray_29<T> = T[][]
type MyArray_30<T> = Array<T>
type Direction_30 = number
type MyArray_31<T> = Array<T>
type Direction_31 = number
type MyArray_32<T> = Array<T>
type Direction_32 = number
type MyArray_33<T> = Array<T>
type Direction_33 = number
type MyArray_34<T> = Array<T>
type Direction_34 = 'up' | 'down' | 'left' | 'right'
type MyArray_35<T> = Array<T>
type Direction_35 = string
type MyArray_36<T> = Array<T>
type Direction_36 = string | number
type MyArray_37<T> = Array<T>
type Direction_37 = int
type MyArray_38<T> = Array<T>
type Direction_38 = long
type MyArray_39<T> = Array<T>
type Direction_39 = float
type MyArray_40<T> = Array<T>
type Direction_40 = double
type MyArray_41<T> = Array<T>
type Direction_41 = boolean
type MyArray_42<T> = Array<T>
type Direction_42 = bigint
type MyArray_43<T> = Array<T>
type Direction_43 = undefined
enum ColorSet_44 {Red = 0, Green = 1, Blue = 2}
type MyArray_44<T> = Array<T>
type Direction_44 = ColorSet_44
type MyArray_45<T> = Array<T>
type Direction_45 = null
class Animal_46 {
  public name: string
  constructor(name: string) {
    this.name = name
  }
}
type MyArray_46<T> = Array<T>
type Direction_46 = Animal_46
type MyArray_47<T> = Array<T>
type Direction_47 = string[]
async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

export default function GenericDeclarationsCreateTest() {
  describe("GenericDeclarationsCreateTest", () => {
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
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0100
     * @tc.name      testGenericDeclarationsCreate0001
     * @tc.desc      Instantiated array T[] with number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_0<Direction_0> = [1, 2, 3]
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0200
     * @tc.name      testGenericDeclarationsCreate0002
     * @tc.desc      Instantiated array T[] with binary number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_1<Direction_1> = [0b10, 0b11, 0b100]
      expect(tmpArray[0]).assertEqual(2)
      expect(tmpArray[1]).assertEqual(3)
      expect(tmpArray[2]).assertEqual(4)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0300
     * @tc.name      testGenericDeclarationsCreate0003
     * @tc.desc      Instantiated array T[] with octal number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_2<Direction_2> = [0o010, 0o011, 0o012]
      expect(tmpArray[0]).assertEqual(8)
      expect(tmpArray[1]).assertEqual(9)
      expect(tmpArray[2]).assertEqual(10)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0400
     * @tc.name      testGenericDeclarationsCreate0004
     * @tc.desc      Instantiated array T[] with hexadecimal number type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_3<Direction_3> = [0x10, 0x11, 0x12]
      expect(tmpArray[0]).assertEqual(16)
      expect(tmpArray[1]).assertEqual(17)
      expect(tmpArray[2]).assertEqual(18)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0500
     * @tc.name      testGenericDeclarationsCreate0005
     * @tc.desc      Instantiated array T[] with literal type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_4<Direction_4> = ['up', 'down', 'left']
      expect(tmpArray[0]).assertEqual('up')
      expect(tmpArray[1]).assertEqual('down')
      expect(tmpArray[2]).assertEqual('left')
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0600
     * @tc.name      testGenericDeclarationsCreate0006
     * @tc.desc      Instantiated array T[] with string type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_5<Direction_5> = ["a", "b", "c"]
      expect(tmpArray[0]).assertEqual("a")
      expect(tmpArray[1]).assertEqual("b")
      expect(tmpArray[2]).assertEqual("c")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0700
     * @tc.name      testGenericDeclarationsCreate0007
     * @tc.desc      Instantiated array T[] with byte type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_6<Direction_6> = [1, 2, 3]
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0800
     * @tc.name      testGenericDeclarationsCreate0008
     * @tc.desc      Instantiated array T[] with short type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_7<Direction_7> = [1, 2, 3]
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_0900
     * @tc.name      testGenericDeclarationsCreate0009
     * @tc.desc      Instantiated array T[] with int type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_8<Direction_8> = [1, 2, 3]
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1000
     * @tc.name      testGenericDeclarationsCreate0010
     * @tc.desc      Instantiated array T[] with long type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_9<Direction_9> = [1, 2, 3]
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1100
     * @tc.name      testGenericDeclarationsCreate0011
     * @tc.desc      Instantiated array T[] with float type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_10<Direction_10> = [1.1f, 2.1f, 3.9f]
      expect(tmpArray[0]).assertEqual(1.1f)
      expect(tmpArray[1]).assertEqual(2.1f)
      expect(tmpArray[2]).assertEqual(3.9f)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1200
     * @tc.name      testGenericDeclarationsCreate0012
     * @tc.desc      Instantiated array T[] with double type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_11<Direction_11> = [1.00001, 2.0111, 3.000001]
      expect(tmpArray[0]).assertEqual(1.00001)
      expect(tmpArray[1]).assertEqual(2.0111)
      expect(tmpArray[2]).assertEqual(3.000001)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1300
     * @tc.name      testGenericDeclarationsCreate0013
     * @tc.desc      Instantiated array T[] with boolean type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_12<Direction_12> = [false, true, true]
      expect(tmpArray[0]).assertEqual(false)
      expect(tmpArray[1]).assertEqual(true)
      expect(tmpArray[2]).assertEqual(true)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1400
     * @tc.name      testGenericDeclarationsCreate0014
     * @tc.desc      Instantiated array T[] with bigint type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_13<Direction_13> = [1n, 2n, 3n]
      expect(tmpArray[0]).assertEqual(1n)
      expect(tmpArray[1]).assertEqual(2n)
      expect(tmpArray[2]).assertEqual(3n)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1500
     * @tc.name      testGenericDeclarationsCreate0015
     * @tc.desc      Instantiated array T[] with union type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_14<Direction_14> = ['a', 1, 2]
      expect(tmpArray[0]).assertEqual('a')
      expect(tmpArray[1]).assertEqual(1)
      expect(tmpArray[2]).assertEqual(2)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1600
     * @tc.name      testGenericDeclarationsCreate0016
     * @tc.desc      Instantiated array T[] with undefined type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_15<Direction_15> = [undefined, undefined, undefined]
      expect(tmpArray[0]).assertEqual(undefined)
      expect(tmpArray[1]).assertEqual(undefined)
      expect(tmpArray[2]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1700
     * @tc.name      testGenericDeclarationsCreate0017
     * @tc.desc      Instantiated array T[] with enumerated type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_16<Direction_16> = [ColorSet_16.Red, ColorSet_16.Green, ColorSet_16.Blue]
      expect(tmpArray[0]).assertEqual(ColorSet_16.Red)
      expect(tmpArray[1]).assertEqual(ColorSet_16.Green)
      expect(tmpArray[2]).assertEqual(ColorSet_16.Blue)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1800
     * @tc.name      testGenericDeclarationsCreate0018
     * @tc.desc      Instantiated array T[] with null type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_17<Direction_17> = [null, null, null]
      expect(tmpArray[0]).assertEqual(null)
      expect(tmpArray[1]).assertEqual(null)
      expect(tmpArray[2]).assertEqual(null)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_1900
     * @tc.name      testGenericDeclarationsCreate0019
     * @tc.desc      Instantiated array T[] with number[] type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_18<Direction_18> = [[0, 1, 2], [3, 4, 5], [6, 7, 8]]
      expect(tmpArray[0][0]).assertEqual(0)
      expect(tmpArray[2][2]).assertEqual(8)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2000
     * @tc.name      testGenericDeclarationsCreate0020
     * @tc.desc      Instantiated array T[] with tuple type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_19<Direction_19> = [[0, "a", false], [0, "a", false]]
      expect(tmpArray[0][0]).assertEqual(0)
      expect(tmpArray[1][2]).assertEqual(false)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2100
     * @tc.name      testGenericDeclarationsCreate0021
     * @tc.desc      Instantiated array T[] with function type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_20<Direction_20> = [() => { return 1; }, () => { return 2; }]
      expect(tmpArray[0]()).assertEqual(1)
      expect(tmpArray[1]()).assertEqual(2)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2200
     * @tc.name      testGenericDeclarationsCreate0022
     * @tc.desc      Instantiated array T[] with class type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_21<Direction_21> = [new Animal_21("Dog"), new Animal_21("Cat")]
      expect(tmpArray[0].name).assertEqual("Dog")
      expect(tmpArray[1].name).assertEqual("Cat")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2300
     * @tc.name      testGenericDeclarationsCreate0023
     * @tc.desc      Using type aliases to instantiate a multi-dimensional array T[].
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: MyArray_22<number> = [[[1, 2, 3]]]
      expect(arr[0][0][0]).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2400
     * @tc.name      testGenericDeclarationsCreate0024
     * @tc.desc      Instantiated array T[] with object type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: MyArray_23<Person_23> = [
        {
          name: "John",
          age: 30,
          hobbies: ["reading", "swimming"]
        },
        {
          name: "Alex",
          age: 30,
          hobbies: ["reading", "swimming"]
        }
      ]
      expect(numArray[0].name).assertEqual("John")
      expect(numArray[0].age).assertEqual(30)
      expect(numArray[0].hobbies[0]).assertEqual("reading")
      expect(numArray[1].name).assertEqual("Alex")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2500
     * @tc.name      testGenericDeclarationsCreate0025
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with object types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: MyArray_24<Person_23> = new Array<Person_23>(
        {
          name: "John",
          age: 30,
          hobbies: ["reading", "swimming"]
        }
      )
      expect(numArray[0].name).assertEqual("John")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2600
     * @tc.name      testGenericDeclarationsCreate0026
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with string[] type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: MyArray_25<string[]> = new Array<string[]>(
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"]
      )
      expect(numArray[0][0]).assertEqual("1")
      expect(numArray[2][2]).assertEqual("9")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2700
     * @tc.name      testGenericDeclarationsCreate0027
     * @tc.desc      Complex generic type parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ComplexArray_26 = [[1, "a"], [2, "b"]]
      expect(arr[0][0]).assertEqual(1)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2800
     * @tc.name      testGenericDeclarationsCreate0028
     * @tc.desc      Empty array initialization.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emptyArray: Box1_28<boolean>[] = []
      expect(emptyArray.length).assertEqual(0)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_2900
     * @tc.name      testGenericDeclarationsCreate0029
     * @tc.desc      Instantiated array T[] with string[] type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: MyArray_29<string> = [
        ["0", "1", "2"],
        ["3", "4", "5"],
        ["6", "7", "8"]
      ]
      expect(numArray[0][0]).assertEqual("0")
      expect(numArray[2][2]).assertEqual("8")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3000
     * @tc.name      testGenericDeclarationsCreate0030
     * @tc.desc      Instantiated array T[] with object type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: MyArray_23<Person_23> = [
        {
          name: "John",
          age: 30,
          hobbies: ["reading", "swimming"]
        },
        {
          name: "Alex",
          age: 30,
          hobbies: ["reading", "swimming"]
        }
      ]
      expect(numArray[0].name).assertEqual("John")
      expect(numArray[1].name).assertEqual("Alex")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3100
     * @tc.name      testGenericDeclarationsCreate0031
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with tuple type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: [number, string, boolean][] = [
        [0, "a", false],
        [0, "a", false]
      ]
      expect(numArray[0][0]).assertEqual(0)
      expect(numArray[1][2]).assertEqual(false)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3200
     * @tc.name      testGenericDeclarationsCreate0032
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with number[] type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: Array<number[]> = new Array<number[]>(
        [1, 2, 3],
        [4, 5, 6],
        [7, 8, 9]
      )
      expect(numArray[0][0]).assertEqual(1)
      expect(numArray[2][2]).assertEqual(9)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3300
     * @tc.name      testGenericDeclarationsCreate0033
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with tuple type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: Array<[number, string, boolean]> = new Array<[number, string, boolean]>([0, "a", false])
      expect(numArray[0][0]).assertEqual(0)
      expect(numArray[0][1]).assertEqual("a")
      expect(numArray[0][2]).assertEqual(false)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3400
     * @tc.name      testGenericDeclarationsCreate0034
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with byte types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: Array<byte> = new Array<byte>(1 as byte, 2 as byte, 3 as byte)
      expect(numArray[0]).assertEqual(1)
      expect(numArray[1]).assertEqual(2)
      expect(numArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3500
     * @tc.name      testGenericDeclarationsCreate0035
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with short types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArray: Array<short> = new Array<short>(1 as short, 2 as short, 3 as short)
      expect(numArray[0]).assertEqual(1)
      expect(numArray[1]).assertEqual(2)
      expect(numArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3600
     * @tc.name      testGenericDeclarationsCreate0036
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with number types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_30<Direction_30> = new Array<Direction_30>(1, 2, 3)
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3700
     * @tc.name      testGenericDeclarationsCreate0037
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with binary number types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_31<Direction_31> = new Array<Direction_31>(0b10, 0b11, 0b100)
      expect(tmpArray[0]).assertEqual(2)
      expect(tmpArray[1]).assertEqual(3)
      expect(tmpArray[2]).assertEqual(4)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3800
     * @tc.name      testGenericDeclarationsCreate0038
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with octal number types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_32<Direction_32> = new Array<Direction_32>(0o010, 0o011, 0o012)
      expect(tmpArray[0]).assertEqual(8)
      expect(tmpArray[1]).assertEqual(9)
      expect(tmpArray[2]).assertEqual(10)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_3900
     * @tc.name      testGenericDeclarationsCreate0039
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with hexadecimal number types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_33<Direction_33> = new Array<Direction_33>(0x10, 0x11, 0x12)
      expect(tmpArray[0]).assertEqual(16)
      expect(tmpArray[1]).assertEqual(17)
      expect(tmpArray[2]).assertEqual(18)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4000
     * @tc.name      testGenericDeclarationsCreate0040
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with literal type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_34<Direction_34> = new Array<Direction_34>('up', 'down', 'left')
      expect(tmpArray[0]).assertEqual('up')
      expect(tmpArray[1]).assertEqual('down')
      expect(tmpArray[2]).assertEqual('left')
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4100
     * @tc.name      testGenericDeclarationsCreate0041
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with string types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_35<Direction_35> = new Array<Direction_35>("a", "b", "c")
      expect(tmpArray[0]).assertEqual("a")
      expect(tmpArray[1]).assertEqual("b")
      expect(tmpArray[2]).assertEqual("c")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4200
     * @tc.name      testGenericDeclarationsCreate0042
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with union types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_36<Direction_36> = new Array<Direction_36>(1, 2, 'a')
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual('a')
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4300
     * @tc.name      testGenericDeclarationsCreate0043
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with int types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_37<Direction_37> = new Array<Direction_37>(1, 2, 3)
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4400
     * @tc.name      testGenericDeclarationsCreate0044
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with long types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_38<Direction_38> = new Array<Direction_38>(1, 2, 3)
      expect(tmpArray[0]).assertEqual(1)
      expect(tmpArray[1]).assertEqual(2)
      expect(tmpArray[2]).assertEqual(3)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4500
     * @tc.name      testGenericDeclarationsCreate0045
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with float types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_39<Direction_39> = new Array<Direction_39>(1.1f, 2.2f, 3.3f)
      expect(tmpArray[0]).assertEqual(1.1f)
      expect(tmpArray[1]).assertEqual(2.2f)
      expect(tmpArray[2]).assertEqual(3.3f)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4600
     * @tc.name      testGenericDeclarationsCreate0046
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with double types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_40<Direction_40> = new Array<Direction_40>(1.111, 2.1111, 3.11111)
      expect(tmpArray[0]).assertEqual(1.111)
      expect(tmpArray[1]).assertEqual(2.1111)
      expect(tmpArray[2]).assertEqual(3.11111)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4700
     * @tc.name      testGenericDeclarationsCreate0047
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with boolean types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_41<Direction_41> = new Array<Direction_41>(false, true, true)
      expect(tmpArray[0]).assertEqual(false)
      expect(tmpArray[1]).assertEqual(true)
      expect(tmpArray[2]).assertEqual(true)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4800
     * @tc.name      testGenericDeclarationsCreate0048
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with bigint types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_42<Direction_42> = new Array<Direction_42>(1n, 2n, 3n)
      expect(tmpArray[0]).assertEqual(1n)
      expect(tmpArray[1]).assertEqual(2n)
      expect(tmpArray[2]).assertEqual(3n)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_4900
     * @tc.name      testGenericDeclarationsCreate0049
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with undefined types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_43<Direction_43> = new Array<Direction_43>(undefined, undefined, undefined)
      expect(tmpArray[0]).assertEqual(undefined)
      expect(tmpArray[1]).assertEqual(undefined)
      expect(tmpArray[2]).assertEqual(undefined)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_5000
     * @tc.name      testGenericDeclarationsCreate0050
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with enumerated types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_44<Direction_44> = new Array<Direction_44>(ColorSet_44.Red, ColorSet_44.Green, ColorSet_44.Blue)
      expect(tmpArray[0]).assertEqual(ColorSet_44.Red)
      expect(tmpArray[1]).assertEqual(ColorSet_44.Green)
      expect(tmpArray[2]).assertEqual(ColorSet_44.Blue)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_5100
     * @tc.name      testGenericDeclarationsCreate0051
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with null types.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_45<Direction_45> = new Array<Direction_45>(null, null, null)
      expect(tmpArray[0]).assertEqual(null)
      expect(tmpArray[1]).assertEqual(null)
      expect(tmpArray[2]).assertEqual(null)
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_5200
     * @tc.name      testGenericDeclarationsCreate0052
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with class type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_46<Direction_46> = new Array<Direction_46>(new Animal_46("Dog"), new Animal_46("Cat"))
      expect(tmpArray[0].name).assertEqual("Dog")
      expect(tmpArray[1].name).assertEqual("Cat")
    })

    /**
     * @tc.number    SUB_GENERIC_DECLARATIONS_CREATE_5300
     * @tc.name      testGenericDeclarationsCreate0053
     * @tc.desc      Instantiate built-in generic arrays(Array<T>) with string[] type.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericDeclarationsCreate0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let tmpArray: MyArray_47<Direction_47> = new Array<Direction_47>(["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"])
      expect(tmpArray[0][0]).assertEqual("1")
      expect(tmpArray[2][2]).assertEqual("9")
    })
  });
}