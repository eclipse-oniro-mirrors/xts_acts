/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { PlainArray } from '@kit.ArkTS';

interface GeneratedObjectLiteralInterface_1 {
  name: string;
  value: number;
}

interface GeneratedObjectLiteralInterface_2 {
  arr: number[];
  flag: boolean;
}


interface GeneratedTypeLiteralInterface_4 {
  e: number;
}

interface GeneratedTypeLiteralInterface_3 {
  c: number;
  d: GeneratedTypeLiteralInterface_4;
}

interface NumberArray {
  numbers: number[];
}

interface MixedArray {
  values: (number | string | boolean)[];
}

interface SimpleObject {
  a: number;
  b: string;
  c: number[];
}

interface NestedObject_0 {
  a: number;
  b: GeneratedTypeLiteralInterface_3;
}

interface ObjectWithSpecialProps {
  a: number;
  b: number;
}

interface TypedArrayContainer_0 {
  buffer: Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Float32Array | Float64Array;
}

interface TypedArrayWithSpecial {
  buffer: Float32Array | Float64Array;
}

interface MixedData {
  str: string;
  num: number;
  bool: boolean;
  arr: number[];
}

interface StringNumberPair {
  str: string;
  num: number;
}

interface BooleanArrayPair {
  bool: boolean;
  arr: number[];
}

interface NestedData {
  id: number;
  data: StringNumberPair;
  flags: boolean[];
}

interface BigIntArrayContainer {
  buffer: BigInt64Array;
}

interface BigUintArrayContainer {
  buffer: BigUint64Array;
}

interface ObjectWithSet {
  mySet: Set<number>;
  name: string;
}

interface ObjectWithPromise {
  promise: Promise<string>;
  status: string;
}

interface ObjectWithRegExp {
  regex: RegExp;
  description: string;
}

interface ObjectWithArrayBuffer {
  buffer: ArrayBuffer;
  size: number;
}

interface ObjectWithDataView {
  view: DataView;
  description: string;
}

interface ObjectWithBigInt {
  bigintValue: bigint;
  regularNumber: number;
}

interface NumberContainer {
  value: number;
  representation: string;
}

class TypedArrayContainer_1 {
  int8: Int8Array
  uint8: Uint8Array
  float32: Float32Array
  float64: Float64Array

  constructor(int8: Int8Array, uint8: Uint8Array, float32: Float32Array, float64: Float64Array) {
    this.int8 = int8
    this.uint8 = uint8
    this.float32 = float32
    this.float64 = float64
  }
}

class ComplexObject_0 {
  key1: string
  key2: string
  key3: string
  regularKey: string
  numberKey: number
  booleanKey: boolean

  constructor(key1: string, key2: string, key3: string, regularKey: string, numberKey: number,
    booleanKey: boolean) {
    this.key1 = key1
    this.key2 = key2
    this.key3 = key3
    this.regularKey = regularKey
    this.numberKey = numberKey
    this.booleanKey = booleanKey
  }
}

class NestedObject_1 {
  nested: string

  constructor(nested: string) {
    this.nested = nested
  }
}

type MapValue = string | number | boolean | number[] | NestedObject_1

class ObjectWithMap {
  map: Map<string, MapValue>
  id: number

  constructor(map: Map<string, MapValue>, id: number) {
    this.map = map
    this.id = id
  }
}

class ComplexObject_1 {
  enumerableProp: string
  anotherProp: string
  nonEnumerableProp: string

  constructor(enumerableProp: string, anotherProp: string, nonEnumerableProp: string) {
    this.enumerableProp = enumerableProp
    this.anotherProp = anotherProp
    this.nonEnumerableProp = nonEnumerableProp
  }

  checkProperty(propName: string): boolean {
    if (propName === "enumerableProp") {
      return this.enumerableProp !== undefined
    } else if (propName === "anotherProp") {
      return this.anotherProp !== undefined
    } else if (propName === "nonEnumerableProp") {
      return this.nonEnumerableProp !== undefined
    }
    return false
  }

  getPropertyValue(propName: string): string | undefined {
    if (propName === "enumerableProp") {
      return this.enumerableProp
    } else if (propName === "anotherProp") {
      return this.anotherProp
    } else if (propName === "nonEnumerableProp") {
      return this.nonEnumerableProp
    }
    return undefined
  }
}

class ComplexObject_2 {
  enumerableProp: string
  anotherProp: string
  nonEnumerableProp: string

  constructor(enumerableProp: string, anotherProp: string, nonEnumerableProp: string) {
    this.enumerableProp = enumerableProp
    this.anotherProp = anotherProp
    this.nonEnumerableProp = nonEnumerableProp
  }

  checkProperty(propName: string): boolean {
    if (propName === "enumerableProp") {
      return this.enumerableProp !== undefined
    } else if (propName === "anotherProp") {
      return this.anotherProp !== undefined
    } else if (propName === "nonEnumerableProp") {
      return this.nonEnumerableProp !== undefined
    }
    return false
  }

  getPropertyValue(propName: string): string | undefined {
    if (propName === "enumerableProp") {
      return this.enumerableProp
    } else if (propName === "anotherProp") {
      return this.anotherProp
    } else if (propName === "nonEnumerableProp") {
      return this.nonEnumerableProp
    }
    return undefined
  }
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
    setTimeout(() => {
      resolve(undefined as void)
    }, count)
  })
}

export default function PlainArray04Test(): void {
  describe('PlainArray04Test', () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await sleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0100
     * @tc.name      testPlainArray04Chapter0001
     * @tc.desc      clone empty PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0001'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      let clonedArray = plainArray.clone()

      expect(clonedArray.length).assertEqual(0)
      expect(plainArray === clonedArray).assertFalse()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0200
     * @tc.name      testPlainArray04Chapter0002
     * @tc.desc      clone PlainArray with string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0002'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, "squirrel")
      plainArray.add(2, "sparrow")
      plainArray.add(3, "eagle")
      let clonedArray = plainArray.clone()

      expect(clonedArray.get(1)).assertEqual("squirrel")
      expect(clonedArray.get(2)).assertEqual("sparrow")
      expect(clonedArray.get(3)).assertEqual("eagle")
      expect(clonedArray.length).assertEqual(3)
      expect(plainArray === clonedArray).assertFalse()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0300
     * @tc.name      testPlainArray04Chapter0003
     * @tc.desc      verify cloned array modification doesn't affect original
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0003'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(1, "squirrel")
      plainArray.add(2, "sparrow")
      let clonedArray = plainArray.clone()
      clonedArray.add(3, "eagle")
      clonedArray.add(2, "hawk")
      expect(plainArray.get(1)).assertEqual("squirrel")
      expect(plainArray.get(2)).assertEqual("sparrow")
      expect(plainArray.length).assertEqual(2)
      expect(clonedArray.get(1)).assertEqual("squirrel")
      expect(clonedArray.get(2)).assertEqual("hawk")
      expect(clonedArray.get(3)).assertEqual("eagle")
      expect(clonedArray.length).assertEqual(3)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0400
     * @tc.name      testPlainArray04Chapter0004
     * @tc.desc      clone PlainArray with number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0004'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<number>()
      plainArray.add(0, 100)
      plainArray.add(1, -50)
      plainArray.add(2, 0)
      let clonedArray = plainArray.clone()
      expect(clonedArray.get(0)).assertEqual(100)
      expect(clonedArray.get(1)).assertEqual(-50)
      expect(clonedArray.get(2)).assertEqual(0)
      expect(clonedArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0500
     * @tc.name      testPlainArray04Chapter0005
     * @tc.desc      clone PlainArray with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0005'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<boolean>()
      plainArray.add(0, true)
      plainArray.add(1, false)
      plainArray.add(2, true)
      let clonedArray = plainArray.clone()
      expect(clonedArray.get(0)).assertTrue()
      expect(clonedArray.get(1)).assertFalse()
      expect(clonedArray.get(2)).assertTrue()
      expect(clonedArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0600
     * @tc.name      testPlainArray04Chapter0006
     * @tc.desc      clone PlainArray with object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0006'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<Object>()
      let obj1: GeneratedObjectLiteralInterface_1 = { name: "test", value: 1 }
      let obj2: GeneratedObjectLiteralInterface_2 = { arr: [1, 2, 3], flag: true }
      plainArray.add(0, obj1)
      plainArray.add(1, obj2)
      let clonedArray = plainArray.clone()
      expect(clonedArray.get(0)).assertDeepEquals(obj1)
      expect(clonedArray.get(1)).assertDeepEquals(obj2)
      expect(clonedArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0700
     * @tc.name      testPlainArray04Chapter0007
     * @tc.desc      clone PlainArray with array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0007'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<Array<number>>()
      plainArray.add(0, [1, 2, 3])
      plainArray.add(1, [4, 5, 6])
      let clonedArray = plainArray.clone()
      expect(clonedArray.get(0)![0]).assertEqual(1)
      expect(clonedArray.get(0)![1]).assertEqual(2)
      expect(clonedArray.get(0)![2]).assertEqual(3)
      expect(clonedArray.get(1)![0]).assertEqual(4)
      expect(clonedArray.get(1)![1]).assertEqual(5)
      expect(clonedArray.get(1)![2]).assertEqual(6)
      expect(clonedArray.length).assertEqual(2)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0800
     * @tc.name      testPlainArray04Chapter0008
     * @tc.desc      clone PlainArray with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0008'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, Number.MAX_VALUE)
      plainArray.add(1, Number.MIN_VALUE)
      plainArray.add(2, Infinity)
      plainArray.add(3, -Infinity)
      plainArray.add(4, NaN)
      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual(Number.MAX_VALUE)
      expect(clonedArray.get(1)).assertEqual(Number.MIN_VALUE)
      expect(clonedArray.get(2)).assertEqual(Infinity)
      expect(clonedArray.get(3)).assertEqual(-Infinity)
      expect(isNaN(clonedArray.get(4) as number)).assertTrue()
      expect(clonedArray.length).assertEqual(5)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_0900
     * @tc.name      testPlainArray04Chapter0009
     * @tc.desc      clone PlainArray with string boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0009'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "")
      plainArray.add(1, "a".repeat(1000))
      plainArray.add(2, "null")
      plainArray.add(3, "undefined")
      plainArray.add(4, "NaN")
      let clonedArray = plainArray.clone()
      expect(clonedArray.get(0)).assertEqual("")
      expect(clonedArray.get(1)).assertEqual("a".repeat(1000))
      expect(clonedArray.get(2)).assertEqual("null")
      expect(clonedArray.get(3)).assertEqual("undefined")
      expect(clonedArray.get(4)).assertEqual("NaN")
      expect(clonedArray.length).assertEqual(5)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1000
     * @tc.name      testPlainArray04Chapter0010
     * @tc.desc      clone PlainArray with integer boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0010'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, Number.MAX_SAFE_INTEGER)
      plainArray.add(1, Number.MIN_SAFE_INTEGER)
      plainArray.add(2, 0)
      plainArray.add(3, -0)
      plainArray.add(4, 255)
      plainArray.add(5, 65535)
      let clonedArray = plainArray.clone()
      expect(clonedArray.get(0)).assertEqual(Number.MAX_SAFE_INTEGER)
      expect(clonedArray.get(1)).assertEqual(Number.MIN_SAFE_INTEGER)
      expect(clonedArray.get(2)).assertEqual(0)
      expect(clonedArray.get(3)).assertEqual(-0)
      expect(clonedArray.get(4)).assertEqual(255)
      expect(clonedArray.get(5)).assertEqual(65535)
      expect(clonedArray.length).assertEqual(6)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1100
     * @tc.name      testPlainArray04Chapter0011
     * @tc.desc      verify removing from original doesn't affect clone
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0011'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, "apple")
      plainArray.add(2, "banana")
      plainArray.add(3, "cherry")
      let clonedArray = plainArray.clone()
      plainArray.remove(2)
      expect(plainArray.length).assertEqual(2)
      expect(plainArray.get(1)).assertEqual("apple")
      expect(plainArray.get(3)).assertEqual("cherry")
      expect(clonedArray.length).assertEqual(3)
      expect(clonedArray.get(1)).assertEqual("apple")
      expect(clonedArray.get(2)).assertEqual("banana")
      expect(clonedArray.get(3)).assertEqual("cherry")
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1200
     * @tc.name      testPlainArray04Chapter0012
     * @tc.desc      verify clearing original doesn't affect clone
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0012'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, "apple")
      plainArray.add(2, "banana")
      plainArray.add(3, "cherry")
      let clonedArray = plainArray.clone()
      plainArray.clear()
      expect(plainArray.length).assertEqual(0)
      expect(clonedArray.length).assertEqual(3)
      expect(clonedArray.get(1)).assertEqual("apple")
      expect(clonedArray.get(2)).assertEqual("banana")
      expect(clonedArray.get(3)).assertEqual("cherry")
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1300
     * @tc.name      testPlainArray04Chapter0013
     * @tc.desc      clone PlainArray with large index values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0013'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(1000, "value at 1000")
      plainArray.add(1000000, "value at 1000000")
      plainArray.add(0, "value at 0")
      let clonedArray = plainArray.clone()
      expect(clonedArray.get(1000)).assertEqual("value at 1000")
      expect(clonedArray.get(1000000)).assertEqual("value at 1000000")
      expect(clonedArray.get(0)).assertEqual("value at 0")
      expect(clonedArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1400
     * @tc.name      testPlainArray04Chapter0014
     * @tc.desc      clone PlainArray with negative index values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0014'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(-1, "value at -1")
      plainArray.add(-100, "value at -100")
      plainArray.add(0, "value at 0")
      let clonedArray = plainArray.clone()
      expect(clonedArray.get(-1)).assertEqual("value at -1")
      expect(clonedArray.get(-100)).assertEqual("value at -100")
      expect(clonedArray.get(0)).assertEqual("value at 0")
      expect(clonedArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1500
     * @tc.name      testPlainArray04Chapter0015
     * @tc.desc      clone PlainArray multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0015'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()

      plainArray.add(1, "first")
      plainArray.add(2, "second")
      let clone1 = plainArray.clone()
      let clone2 = plainArray.clone()
      let clone3 = clone2.clone()
      expect(clone1.get(1)).assertEqual("first")
      expect(clone1.get(2)).assertEqual("second")
      expect(clone2.get(1)).assertEqual("first")
      expect(clone2.get(2)).assertEqual("second")
      expect(clone3.get(1)).assertEqual("first")
      expect(clone3.get(2)).assertEqual("second")
      expect(plainArray === clone1).assertFalse()
      expect(plainArray === clone2).assertFalse()
      expect(clone1 === clone2).assertFalse()
      expect(clone2 === clone3).assertFalse()
      clone3.add(1, "modified")
      expect(plainArray.get(1)).assertEqual("first")
      expect(clone1.get(1)).assertEqual("first")
      expect(clone2.get(1)).assertEqual("first")
      expect(clone3.get(1)).assertEqual("modified")
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1600
     * @tc.name      testPlainArray04Chapter0016
     * @tc.desc      clone PlainArray with string escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0016'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "\n")
      plainArray.add(1, "\t")
      plainArray.add(2, "\r")
      plainArray.add(3, "\\")
      plainArray.add(4, "\"")
      plainArray.add(5, "'")
      plainArray.add(6, "\b")
      plainArray.add(7, "\f")

      let clonedArray = plainArray.clone()
      expect(clonedArray.get(0)).assertEqual("\n")
      expect(clonedArray.get(1)).assertEqual("\t")
      expect(clonedArray.get(2)).assertEqual("\r")
      expect(clonedArray.get(3)).assertEqual("\\")
      expect(clonedArray.get(4)).assertEqual("\"")
      expect(clonedArray.get(5)).assertEqual("'")
      expect(clonedArray.get(6)).assertEqual("\b")
      expect(clonedArray.get(7)).assertEqual("\f")
      expect(clonedArray.length).assertEqual(8)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1700
     * @tc.name      testPlainArray04Chapter0017
     * @tc.desc      clone PlainArray with ASCII all characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0017'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      const asciiChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

      for (let i = 0; i < asciiChars.length; i++) {
        plainArray.add(i, asciiChars.charAt(i).toString())
      }
      let clonedArray = plainArray.clone()
      for (let i = 0; i < asciiChars.length; i++) {
        expect(clonedArray.get(i)).assertEqual(asciiChars.charAt(i).toString())
      }
      expect(clonedArray.length).assertEqual(asciiChars.length)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1800
     * @tc.name      testPlainArray04Chapter0018
     * @tc.desc      clone PlainArray with duplicate special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0018'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      const specialChars = "!!\"\"##$$%%&&''(())**++--..//::<<==>>??@@[[\\\\]]^^__``{{||}}~~"

      for (let i = 0; i < 10; i++) {
        plainArray.add(i, specialChars.charAt(i).toString())
      }

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual("!")
      expect(clonedArray.get(1)).assertEqual("!")
      expect(clonedArray.get(2)).assertEqual("\"")
      expect(clonedArray.get(3)).assertEqual("\"")
      expect(clonedArray.get(4)).assertEqual("#")
      expect(clonedArray.get(5)).assertEqual("#")
      expect(clonedArray.length).assertEqual(10)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_1900
     * @tc.name      testPlainArray04Chapter0019
     * @tc.desc      clone PlainArray with number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0019'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, -128)
      plainArray.add(1, 127)
      plainArray.add(2, 0)
      plainArray.add(3, 255)
      plainArray.add(4, -32768)
      plainArray.add(5, 32767)
      plainArray.add(6, 0)
      plainArray.add(7, 65535)
      plainArray.add(8, -2147483648)
      plainArray.add(9, 2147483647)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual(-128)
      expect(clonedArray.get(1)).assertEqual(127)
      expect(clonedArray.get(2)).assertEqual(0)
      expect(clonedArray.get(3)).assertEqual(255)
      expect(clonedArray.get(4)).assertEqual(-32768)
      expect(clonedArray.get(5)).assertEqual(32767)
      expect(clonedArray.get(6)).assertEqual(0)
      expect(clonedArray.get(7)).assertEqual(65535)
      expect(clonedArray.get(8)).assertEqual(-2147483648)
      expect(clonedArray.get(9)).assertEqual(2147483647)
      expect(clonedArray.length).assertEqual(10)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2000
     * @tc.name      testPlainArray04Chapter0020
     * @tc.desc      clone PlainArray with float values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0020'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, 1.40129846432481707e-45)
      plainArray.add(1, 3.40282346638528860e+38)
      plainArray.add(2, 4.94065645841246544e-324)
      plainArray.add(3, 1.79769313486231570e+308)
      plainArray.add(4, 0xCAFEBABE)
      plainArray.add(5, 0x0102)
      plainArray.add(6, 2**3)
      plainArray.add(7, 1e3)
      plainArray.add(8, 2.5e-2)

      let clonedArray = plainArray.clone()
      expect(clonedArray.get(0)).assertEqual(1.40129846432481707e-45)
      expect(clonedArray.get(1)).assertEqual(3.40282346638528860e+38)
      expect(clonedArray.get(2)).assertEqual(4.94065645841246544e-324)
      expect(clonedArray.get(3)).assertEqual(1.79769313486231570e+308)
      expect(clonedArray.get(4)).assertEqual(0xCAFEBABE)
      expect(clonedArray.get(5)).assertEqual(0x0102)
      expect(clonedArray.get(6)).assertEqual(8)
      expect(clonedArray.get(7)).assertEqual(1000)
      expect(clonedArray.get(8)).assertEqual(0.025)
      expect(clonedArray.length).assertEqual(9)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2100
     * @tc.name      testPlainArray04Chapter0021
     * @tc.desc      clone PlainArray with boolean data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0021'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<boolean>()
      plainArray.add(0, true)
      plainArray.add(1, false)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertTrue()
      expect(clonedArray.get(1)).assertFalse()
      expect(clonedArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2200
     * @tc.name      testPlainArray04Chapter0022
     * @tc.desc      clone PlainArray with array data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0022'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<NumberArray>()

      const array1: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]
      const array2: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]
      const array3: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]
      const array4: number[] = [256, 65536, 32768]

      plainArray.add(0, { numbers: array1 })
      plainArray.add(1, { numbers: array2 })
      plainArray.add(2, { numbers: array3 })
      plainArray.add(3, { numbers: array4 })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.numbers).assertDeepEquals(array1)
      expect(clonedArray.get(1)!.numbers).assertDeepEquals(array2)
      expect(clonedArray.get(2)!.numbers).assertDeepEquals(array3)
      expect(clonedArray.get(3)!.numbers).assertDeepEquals(array4)
      expect(clonedArray.length).assertEqual(4)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2300
     * @tc.name      testPlainArray04Chapter0023
     * @tc.desc      clone PlainArray with mixed array data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0023'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<MixedArray>()

      const array1: (number | string | boolean)[] = [72, "abc", true, 108]
      const array2: (number | string | boolean)[] = [72, 101, NaN, Infinity, 108, 111]

      plainArray.add(0, { values: array1 })
      plainArray.add(1, { values: array2 })

      let clonedArray = plainArray.clone()

      let vals0: (number | string | boolean)[] = clonedArray.get(0)!.values
      expect(vals0.length).assertEqual(4)
      expect(vals0[0]).assertEqual(72)
      expect(vals0[1]).assertEqual("abc")
      expect(vals0[2]).assertEqual(true)
      expect(vals0[3]).assertEqual(108)
      let vals1: (number | string | boolean)[] = clonedArray.get(1)!.values
      expect(vals1.length).assertEqual(6)
      expect(vals1[0]).assertEqual(72)
      expect(vals1[1]).assertEqual(101)
      expect(Number.isNaN(vals1[2] as number)).assertTrue()
      expect(vals1[3]).assertEqual(Infinity)
      expect(vals1[4]).assertEqual(108)
      expect(vals1[5]).assertEqual(111)
      expect(clonedArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2400
     * @tc.name      testPlainArray04Chapter0024
     * @tc.desc      clone PlainArray with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0024'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number[]>()
      plainArray.add(0, [])

      let clonedArray = plainArray.clone()

      expect(clonedArray.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2500
     * @tc.name      testPlainArray04Chapter0025
     * @tc.desc      clone PlainArray with object data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0025'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<SimpleObject | NestedObject_0>()

      plainArray.add(0, { a: 1, b: "test", c: [1, 2, 3] })
      plainArray.add(1, { a: 1, b: { c: 2, d: { e: 3 } } })
      plainArray.add(2, { a: 0, b: "", c: [] })

      let clonedArray = plainArray.clone()

      let expected0: SimpleObject = { a: 1, b: "test", c: [1, 2, 3] }
      let expected1: NestedObject_0 = { a: 1, b: { c: 2, d: { e: 3 } } }
      let expected2: SimpleObject = { a: 0, b: "", c: [] }
      expect(clonedArray.get(0)).assertDeepEquals(expected0)
      expect(clonedArray.get(1)).assertDeepEquals(expected1)
      expect(clonedArray.get(2)).assertDeepEquals(expected2)
      expect(clonedArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2600
     * @tc.name      testPlainArray04Chapter0026
     * @tc.desc      clone PlainArray with special object properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0026'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithSpecialProps>()

      plainArray.add(0, { a: 0, b: 0 })
      plainArray.add(1, { a: 1, b: NaN })
      plainArray.add(2, { a: 2, b: Infinity })
      plainArray.add(3, { a: 3, b: -Infinity })

      let clonedArray = plainArray.clone()

      let expectedVal: ObjectWithSpecialProps = { a: 0, b: 0 }
      expect(clonedArray.get(0)).assertDeepEquals(expectedVal)
      expect(isNaN(clonedArray.get(1)!.b)).assertTrue()
      expect(clonedArray.get(2)!.b).assertEqual(Infinity)
      expect(clonedArray.get(3)!.b).assertEqual(-Infinity)
      expect(clonedArray.length).assertEqual(4)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2700
     * @tc.name      testPlainArray04Chapter0027
     * @tc.desc      clone PlainArray with TypedArray data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0027'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TypedArrayContainer_0>()

      plainArray.add(0, { buffer: new Int8Array([-128, 0, 127]) })
      plainArray.add(1, { buffer: new Uint8Array([0, 128, 255]) })
      plainArray.add(2, { buffer: new Int16Array([-32768, 0, 32767]) })
      plainArray.add(3, { buffer: new Uint16Array([0, 32768, 65535]) })
      plainArray.add(4, { buffer: new Int32Array([-2147483648, 0, 2147483647]) })
      plainArray.add(5, { buffer: new Uint32Array([0, 2147483648, 4294967295]) })
      plainArray.add(6, { buffer: new Float32Array([-3.4e38, 0, 3.4e38]) })
      plainArray.add(7, { buffer: new Float64Array([-Number.MAX_VALUE, 0, Number.MAX_VALUE]) })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.buffer instanceof Int8Array).assertTrue()
      expect(clonedArray.get(1)!.buffer instanceof Uint8Array).assertTrue()
      expect(clonedArray.get(2)!.buffer instanceof Int16Array).assertTrue()
      expect(clonedArray.get(3)!.buffer instanceof Uint16Array).assertTrue()
      expect(clonedArray.get(4)!.buffer instanceof Int32Array).assertTrue()
      expect(clonedArray.get(5)!.buffer instanceof Uint32Array).assertTrue()
      expect(clonedArray.get(6)!.buffer instanceof Float32Array).assertTrue()
      expect(clonedArray.get(7)!.buffer instanceof Float64Array).assertTrue()
      expect(clonedArray.length).assertEqual(8)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2800
     * @tc.name      testPlainArray04Chapter0028
     * @tc.desc      clone PlainArray with TypedArray special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0028'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TypedArrayWithSpecial>()

      const float32Arr = new Float32Array(3)
      float32Arr[0] = Infinity
      float32Arr[1] = -Infinity
      float32Arr[2] = NaN

      const float64Arr = new Float64Array(3)
      float64Arr[0] = Infinity
      float64Arr[1] = -Infinity
      float64Arr[2] = NaN

      plainArray.add(0, { buffer: float32Arr })
      plainArray.add(1, { buffer: float64Arr })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.buffer instanceof Float32Array).assertTrue()
      expect(clonedArray.get(1)!.buffer instanceof Float64Array).assertTrue()
      expect(clonedArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_2900
     * @tc.name      testPlainArray04Chapter0029
     * @tc.desc      clone PlainArray with large string for memory test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0029'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      const largeString = "a".repeat(100000)
      plainArray.add(0, largeString)
      plainArray.add(1, "normal string")

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual(largeString)
      expect(clonedArray.get(1)).assertEqual("normal string")
      expect(clonedArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3000
     * @tc.name      testPlainArray04Chapter0030
     * @tc.desc      clone PlainArray with tree string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0030'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()

      let initTreeString: (size: number) => string = (size: number): string => {
        let ans = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans += '{"a":1}]';
        return ans;
      };

      const treeString = initTreeString(100)
      plainArray.add(0, treeString)
      plainArray.add(1, "simple string")

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual(treeString)
      expect(clonedArray.get(1)).assertEqual("simple string")
      expect(clonedArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3100
     * @tc.name      testPlainArray04Chapter0031
     * @tc.desc      clone PlainArray with slice string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0031'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      const originalStr = "{k1:value1,k2:value2}"
      const slicedStr = originalStr.substring(0, originalStr.length - 2)

      plainArray.add(0, originalStr)
      plainArray.add(1, slicedStr)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual(originalStr)
      expect(clonedArray.get(1)).assertEqual(slicedStr)
      expect(clonedArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3200
     * @tc.name      testPlainArray04Chapter0032
     * @tc.desc      clone PlainArray with Unicode emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0032'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()

      plainArray.add(0, "\ud83d\udc46")
      plainArray.add(1, "\ud83d\udc7f")
      plainArray.add(2, "\ud83d\udc40")
      plainArray.add(3, "\ud83d\udcaf")
      plainArray.add(4, "\ud83c\udf85")
      plainArray.add(5, "\ud83c\udf85")
      plainArray.add(6, "\ud83d\udc3a")
      plainArray.add(7, "\ud83d\udc87")

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual("\ud83d\udc46")
      expect(clonedArray.get(1)).assertEqual("\ud83d\udc7f")
      expect(clonedArray.get(2)).assertEqual("\ud83d\udc40")
      expect(clonedArray.get(3)).assertEqual("\ud83d\udcaf")
      expect(clonedArray.get(4)).assertEqual("\ud83c\udf85")
      expect(clonedArray.get(5)).assertEqual("\ud83c\udf85")
      expect(clonedArray.get(6)).assertEqual("\ud83d\udc3a")
      expect(clonedArray.get(7)).assertEqual("\ud83d\udc87")
      expect(clonedArray.length).assertEqual(8)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3300
     * @tc.name      testPlainArray04Chapter0033
     * @tc.desc      clone PlainArray with Unicode encoded emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0033'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()

      plainArray.add(0, "\ud83d\udc46")
      plainArray.add(1, "\ud83d\udc7f")
      plainArray.add(2, "\ud83d\udc40")
      plainArray.add(3, "\ud83d\udcaf")
      plainArray.add(4, "\ud83c\udf85")

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual("\ud83d\udc46")
      expect(clonedArray.get(1)).assertEqual("\ud83d\udc7f")
      expect(clonedArray.get(2)).assertEqual("\ud83d\udc40")
      expect(clonedArray.get(3)).assertEqual("\ud83d\udcaf")
      expect(clonedArray.get(4)).assertEqual("\ud83c\udf85")
      expect(clonedArray.length).assertEqual(5)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3400
     * @tc.name      testPlainArray04Chapter0034
     * @tc.desc      clone PlainArray with illegal Unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0034'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()

      plainArray.add(0, "\udc04")
      plainArray.add(1, "\ud83d")
      plainArray.add(2, "\udff4")

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)).assertEqual("\udc04")
      expect(clonedArray.get(1)).assertEqual("\ud83d")
      expect(clonedArray.get(2)).assertEqual("\udff4")
      expect(clonedArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3500
     * @tc.name      testPlainArray04Chapter0035
     * @tc.desc      clone PlainArray with mixed data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0035'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<MixedData>()

      plainArray.add(0, {
        str: "string value",
        num: 123.456,
        bool: true,
        arr: [1, 2, 3]
      })
      plainArray.add(1, {
        str: "another string",
        num: -456.789,
        bool: false,
        arr: [4, 5, 6]
      })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.str).assertEqual("string value")
      expect(clonedArray.get(0)!.num).assertEqual(123.456)
      expect(clonedArray.get(0)!.bool).assertTrue()
      let arr0: number[] = clonedArray.get(0)!.arr
      expect(arr0.length).assertEqual(3)
      expect(arr0[0]).assertEqual(1)
      expect(arr0[1]).assertEqual(2)
      expect(arr0[2]).assertEqual(3)

      expect(clonedArray.get(1)!.str).assertEqual("another string")
      expect(clonedArray.get(1)!.num).assertEqual(-456.789)
      expect(clonedArray.get(1)!.bool).assertFalse()
      let arr1: number[] = clonedArray.get(1)!.arr
      expect(arr1.length).assertEqual(3)
      expect(arr1[0]).assertEqual(4)
      expect(arr1[1]).assertEqual(5)
      expect(arr1[2]).assertEqual(6)

      expect(clonedArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3600
     * @tc.name      testPlainArray04Chapter0036
     * @tc.desc      test clone performance with many elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0036'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      const count = 10000

      for (let i = 0; i < count; i++) {
        plainArray.add(i, i * i)
      }
      let clonedArray = plainArray.clone()
      expect(clonedArray.length).assertEqual(count)
      expect(clonedArray.get(0)).assertEqual(0)
      expect(clonedArray.get(100)).assertEqual(10000)
      expect(clonedArray.get(9999)).assertEqual(9999 * 9999)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3700
     * @tc.name      testPlainArray04Chapter0037
     * @tc.desc      clone PlainArray with complex mixed data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0037'
      console.log(TAG + ' start')

      let plainArray1 = new PlainArray<StringNumberPair>()
      let plainArray2 = new PlainArray<BooleanArrayPair>()
      let plainArray3 = new PlainArray<NestedData>()

      plainArray1.add(0, { str: "test1", num: 123 })
      plainArray1.add(1, { str: "test2", num: 456.789 })

      let clonedArray1 = plainArray1.clone()

      expect(clonedArray1.get(0)!.str).assertEqual("test1")
      expect(clonedArray1.get(0)!.num).assertEqual(123)
      expect(clonedArray1.get(1)!.str).assertEqual("test2")
      expect(clonedArray1.get(1)!.num).assertEqual(456.789)
      expect(clonedArray1.length).assertEqual(2)

      plainArray2.add(0, { bool: true, arr: [1, 2, 3] })
      plainArray2.add(1, { bool: false, arr: [4, 5, 6] })

      let clonedArray2 = plainArray2.clone()

      expect(clonedArray2.get(0)!.bool).assertTrue()
      let c2Arr0: number[] = clonedArray2.get(0)!.arr
      expect(c2Arr0.length).assertEqual(3)
      expect(c2Arr0[0]).assertEqual(1)
      expect(c2Arr0[1]).assertEqual(2)
      expect(c2Arr0[2]).assertEqual(3)
      expect(clonedArray2.get(1)!.bool).assertFalse()
      let c2Arr1: number[] = clonedArray2.get(1)!.arr
      expect(c2Arr1.length).assertEqual(3)
      expect(c2Arr1[0]).assertEqual(4)
      expect(c2Arr1[1]).assertEqual(5)
      expect(c2Arr1[2]).assertEqual(6)
      expect(clonedArray2.length).assertEqual(2)

      plainArray3.add(0, {
        id: 1,
        data: { str: "nested1", num: 111 },
        flags: [true, false, true]
      })

      plainArray3.add(1, {
        id: 2,
        data: { str: "nested2", num: 222 },
        flags: [false, true, false]
      })

      let clonedArray3 = plainArray3.clone()

      expect(clonedArray3.get(0)!.id).assertEqual(1)
      expect(clonedArray3.get(0)!.data.str).assertEqual("nested1")
      expect(clonedArray3.get(0)!.data.num).assertEqual(111)
      expect(clonedArray3.get(0)!.flags).assertDeepEquals([true, false, true])

      expect(clonedArray3.get(1)!.id).assertEqual(2)
      expect(clonedArray3.get(1)!.data.str).assertEqual("nested2")
      expect(clonedArray3.get(1)!.data.num).assertEqual(222)
      expect(clonedArray3.get(1)!.flags).assertDeepEquals([false, true, false])
      expect(clonedArray3.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3800
     * @tc.name      testPlainArray04Chapter0038
     * @tc.desc      clone PlainArray with BigInt64Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0038'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<BigIntArrayContainer>()

      const bigInt64Arr = new BigInt64Array(3)
      bigInt64Arr[0] = -9223372036854775808n
      bigInt64Arr[1] = 0n
      bigInt64Arr[2] = 9223372036854775807n

      plainArray.add(0, { buffer: bigInt64Arr })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.buffer instanceof BigInt64Array).assertTrue()
      expect(clonedArray.get(0)!.buffer[0].toString()).assertEqual("-9223372036854775808")
      expect(clonedArray.get(0)!.buffer[1].toString()).assertEqual("0")
      expect(clonedArray.get(0)!.buffer[2].toString()).assertEqual("9223372036854775807")
      expect(clonedArray.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_3900
     * @tc.name      testPlainArray04Chapter0039
     * @tc.desc      clone PlainArray with BigUint64Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0039'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<BigUintArrayContainer>()

      const bigUint64Arr = new BigUint64Array(3)
      bigUint64Arr[0] = 0n
      bigUint64Arr[1] = 18446744073709551615n
      bigUint64Arr[2] = 1234567890123456789n

      plainArray.add(0, { buffer: bigUint64Arr })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.buffer instanceof BigUint64Array).assertTrue()
      expect(clonedArray.get(0)!.buffer[0].toString()).assertEqual("0")
      expect(clonedArray.get(0)!.buffer[1].toString()).assertEqual("18446744073709551615")
      expect(clonedArray.get(0)!.buffer[2].toString()).assertEqual("1234567890123456789")
      expect(clonedArray.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4000
     * @tc.name      testPlainArray04Chapter0040
     * @tc.desc      verify typed array special value storage rules after clone
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0040'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TypedArrayContainer_1>()

      const int8Arr = new Int8Array(3)
      const uint8Arr = new Uint8Array(3)
      const float32Arr = new Float32Array(3)
      const float64Arr = new Float64Array(3)

      int8Arr[0] = Number.POSITIVE_INFINITY
      int8Arr[1] = Number.NEGATIVE_INFINITY
      int8Arr[2] = Number.NaN

      uint8Arr[0] = Number.POSITIVE_INFINITY
      uint8Arr[1] = Number.NEGATIVE_INFINITY
      uint8Arr[2] = Number.NaN

      float32Arr[0] = Number.POSITIVE_INFINITY
      float32Arr[1] = Number.NEGATIVE_INFINITY
      float32Arr[2] = Number.NaN

      float64Arr[0] = Number.POSITIVE_INFINITY
      float64Arr[1] = Number.NEGATIVE_INFINITY
      float64Arr[2] = Number.NaN

      const container = new TypedArrayContainer_1(int8Arr, uint8Arr, float32Arr, float64Arr)
      plainArray.add(0, container)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.int8[0]).assertEqual(0)
      expect(clonedArray.get(0)!.int8[1]).assertEqual(0)
      expect(clonedArray.get(0)!.int8[2]).assertEqual(0)

      expect(clonedArray.get(0)!.uint8[0]).assertEqual(0)
      expect(clonedArray.get(0)!.uint8[1]).assertEqual(0)
      expect(clonedArray.get(0)!.uint8[2]).assertEqual(0)

      expect(clonedArray.get(0)!.float32[0]).assertEqual(Number.POSITIVE_INFINITY)
      expect(clonedArray.get(0)!.float32[1]).assertEqual(Number.NEGATIVE_INFINITY)

      const float32Val = clonedArray.get(0)!.float32[2]
      expect(float32Val !== float32Val).assertTrue()

      expect(clonedArray.get(0)!.float64[0]).assertEqual(Number.POSITIVE_INFINITY)
      expect(clonedArray.get(0)!.float64[1]).assertEqual(Number.NEGATIVE_INFINITY)

      const float64Val = clonedArray.get(0)!.float64[2]
      expect(float64Val !== float64Val).assertTrue()
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4100
     * @tc.name      testPlainArray04Chapter0041
     * @tc.desc      clone PlainArray with objects having multiple key types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0041'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ComplexObject_0>()

      const obj = new ComplexObject_0(
        "value1",
        "value2",
        "value3",
        "regular value",
        123,
        true
      )

      plainArray.add(0, obj)

      let clonedArray = plainArray.clone()


      expect(clonedArray.get(0)!.key1).assertEqual("value1")
      expect(clonedArray.get(0)!.key2).assertEqual("value2")
      expect(clonedArray.get(0)!.key3).assertEqual("value3")
      expect(clonedArray.get(0)!.regularKey).assertEqual("regular value")
      expect(clonedArray.get(0)!.numberKey).assertEqual(123)
      expect(clonedArray.get(0)!.booleanKey).assertTrue()
      expect(clonedArray.get(0) === obj).assertTrue()

    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4200
     * @tc.name      testPlainArray04Chapter0042
     * @tc.desc      clone PlainArray with Map properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0042'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithMap>()

      const map = new Map<string, MapValue>()
      map.set("stringKey", "string value")
      map.set("numberKey", 123.456)
      map.set("booleanKey", true)
      map.set("arrayKey", [1, 2, 3])
      map.set("objectKey", new NestedObject_1("value"))

      const container = new ObjectWithMap(map, 1)
      plainArray.add(0, container)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.map instanceof Map).assertTrue()
      expect(clonedArray.get(0)!.map.size).assertEqual(5)
      expect(clonedArray.get(0)!.map.get("stringKey")).assertEqual("string value")
      expect(clonedArray.get(0)!.map.get("numberKey")).assertEqual(123.456)
      expect(clonedArray.get(0)!.map.get("booleanKey")).assertTrue()
      let mapArr: number[] = clonedArray.get(0)!.map.get("arrayKey") as number[]
      expect(mapArr.length).assertEqual(3)
      expect(mapArr[0]).assertEqual(1)
      expect(mapArr[1]).assertEqual(2)
      expect(mapArr[2]).assertEqual(3)

      const objectValue = clonedArray.get(0)!.map.get("objectKey")
      expect(objectValue instanceof NestedObject_1).assertTrue()
      if (objectValue instanceof NestedObject_1) {
        expect(objectValue.nested).assertEqual("value")
      }

      expect(clonedArray.get(0)!.id).assertEqual(1)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4300
     * @tc.name      testPlainArray04Chapter0043
     * @tc.desc      clone PlainArray with Set properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0043'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithSet>()

      const set = new Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.add(2)
      set.add(1)

      plainArray.add(0, { mySet: set, name: "test set" })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.mySet instanceof Set).assertTrue()
      expect(clonedArray.get(0)!.mySet.size).assertEqual(3)
      expect(clonedArray.get(0)!.mySet.has(1)).assertTrue()
      expect(clonedArray.get(0)!.mySet.has(2)).assertTrue()
      expect(clonedArray.get(0)!.mySet.has(3)).assertTrue()
      expect(clonedArray.get(0)!.mySet.has(4)).assertFalse()
      expect(clonedArray.get(0)!.name).assertEqual("test set")
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4400
     * @tc.name      testPlainArray04Chapter0044
     * @tc.desc      clone PlainArray with Promise properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0044'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithPromise>()

      const promise = new Promise<string>((resolve) => {
        setTimeout(() => resolve("resolved value"), 100)
      })

      plainArray.add(0, { promise: promise, status: "pending" })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.promise instanceof Promise).assertTrue()
      expect(clonedArray.get(0)!.status).assertEqual("pending")
      expect(clonedArray.get(0)!.promise === promise).assertTrue()
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4500
     * @tc.name      testPlainArray04Chapter0045
     * @tc.desc      clone PlainArray with RegExp properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0045'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithRegExp>()

      const regex1: RegExp = new RegExp("abc", "gi")
      const regex2: RegExp = new RegExp("test\\d+", "m")

      plainArray.add(0, { regex: regex1, description: "global case-insensitive" })
      plainArray.add(1, { regex: regex2, description: "multiline" })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.regex instanceof RegExp).assertTrue()
      expect(clonedArray.get(1)!.regex instanceof RegExp).assertTrue()

      const clonedRegex1 = clonedArray.get(0)!.regex
      const clonedRegex2 = clonedArray.get(1)!.regex

      clonedRegex1.lastIndex = 0
      clonedRegex2.lastIndex = 0

      expect(clonedRegex1.test("abc")).assertTrue()
      clonedRegex1.lastIndex = 0
      expect(clonedRegex1.test("AbC")).assertTrue()
      clonedRegex1.lastIndex = 0
      expect(clonedRegex1.test("ABC")).assertTrue()
      clonedRegex2.lastIndex = 0
      expect(clonedRegex2.test("test123")).assertTrue()
      clonedRegex2.lastIndex = 0
      expect(clonedRegex2.test("test")).assertFalse()
      expect(clonedArray.get(0)!.description).assertEqual("global case-insensitive")
      expect(clonedArray.get(1)!.description).assertEqual("multiline")

    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4600
     * @tc.name      testPlainArray04Chapter0046
     * @tc.desc      clone PlainArray with ArrayBuffer properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0046'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithArrayBuffer>()

      const buffer = new ArrayBuffer(16)
      const view = new Uint8Array(buffer)

      for (let i = 0; i < 16; i++) {
        view[i] = i * 10
      }

      plainArray.add(0, { buffer: buffer, size: 16 })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.buffer instanceof ArrayBuffer).assertTrue()
      expect(clonedArray.get(0)!.buffer.byteLength).assertEqual(16)
      expect(clonedArray.get(0)!.size).assertEqual(16)

      const clonedView = new Uint8Array(clonedArray.get(0)!.buffer)
      for (let i = 0; i < 16; i++) {
        expect(clonedView[i]).assertEqual(i * 10)
      }
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4700
     * @tc.name      testPlainArray04Chapter0047
     * @tc.desc      clone PlainArray with DataView properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0047'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithDataView>()

      const buffer = new ArrayBuffer(16)
      const dataView = new DataView(buffer)

      dataView.setInt8(0, -128)
      dataView.setUint8(1, 255)
      dataView.setInt16(2, -32768)
      dataView.setUint16(4, 65535)
      dataView.setFloat32(8, 3.14159)

      plainArray.add(0, { view: dataView, description: "test data view" })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.view instanceof DataView).assertTrue()
      expect(clonedArray.get(0)!.description).assertEqual("test data view")
      expect(clonedArray.get(0)!.view.getInt8(0)).assertEqual(-128)
      expect(clonedArray.get(0)!.view.getUint8(1)).assertEqual(255)
      expect(clonedArray.get(0)!.view.getInt16(2)).assertEqual(-32768)

      expect(clonedArray.get(0)!.view.getUint16(4)).assertEqual(65535)
      const actualFloat = clonedArray.get(0)!.view.getFloat32(8)
      const expectedFloat = 3.14159
      const tolerance = 1e-5

      const diff = Math.abs(actualFloat - expectedFloat)
      const isApproximatelyEqual = diff <= tolerance

      expect(isApproximatelyEqual).assertTrue()

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4800
     * @tc.name      testPlainArray04Chapter0048
     * @tc.desc      clone PlainArray with BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0048'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithBigInt>()

      plainArray.add(0, {
        bigintValue: 0n,
        regularNumber: 0
      })

      plainArray.add(1, {
        bigintValue: 9007199254740991n,
        regularNumber: 9007199254740991
      })

      plainArray.add(2, {
        bigintValue: BigInt(0xDEADBEEF),
        regularNumber: 0xDEADBEEF
      })

      plainArray.add(3, {
        bigintValue: 18446744073709551615n,
        regularNumber: 9007199254740991
      })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.bigintValue.toString()).assertEqual("0")
      expect(clonedArray.get(0)!.regularNumber).assertEqual(0)

      expect(clonedArray.get(1)!.bigintValue.toString()).assertEqual("9007199254740991")
      expect(clonedArray.get(1)!.regularNumber).assertEqual(9007199254740991)

      expect(clonedArray.get(2)!.bigintValue).assertEqual(BigInt(0xDEADBEEF))

      expect(clonedArray.get(3)!.bigintValue.toString()).assertEqual("18446744073709551615")
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_4900
     * @tc.name      testPlainArray04Chapter0049
     * @tc.desc      clone PlainArray with different number representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0049'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<NumberContainer>()

      plainArray.add(0, { value: 0x0102, representation: "hexadecimal" })
      plainArray.add(1, { value: 0x01020304, representation: "hex32" })
      plainArray.add(2, { value: 0o377, representation: "octal" })
      plainArray.add(3, { value: 2**3, representation: "exponent operator" })
      plainArray.add(4, { value: 1e3, representation: "scientific notation 1e3" })
      plainArray.add(5, { value: 2.5e-2, representation: "scientific notation 2.5e-2" })
      plainArray.add(6, { value: 0b1010, representation: "binary" })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.value).assertEqual(0x0102)
      expect(clonedArray.get(0)!.representation).assertEqual("hexadecimal")

      expect(clonedArray.get(1)!.value).assertEqual(0x01020304)
      expect(clonedArray.get(1)!.representation).assertEqual("hex32")

      expect(clonedArray.get(2)!.value).assertEqual(0o377)
      expect(clonedArray.get(2)!.representation).assertEqual("octal")

      expect(clonedArray.get(3)!.value).assertEqual(8)
      expect(clonedArray.get(3)!.representation).assertEqual("exponent operator")

      expect(clonedArray.get(4)!.value).assertEqual(1000)
      expect(clonedArray.get(4)!.representation).assertEqual("scientific notation 1e3")

      expect(clonedArray.get(5)!.value).assertEqual(0.025)
      expect(clonedArray.get(5)!.representation).assertEqual("scientific notation 2.5e-2")

      expect(clonedArray.get(6)!.value).assertEqual(0b1010)
      expect(clonedArray.get(6)!.representation).assertEqual("binary")
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_5000
     * @tc.name      testPlainArray04Chapter0050
     * @tc.desc      clone PlainArray with complex object properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0050'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ComplexObject_1>()

      const obj = new ComplexObject_1("visible", "another", "hidden")

      plainArray.add(0, obj)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.enumerableProp).assertEqual("visible")
      expect(clonedArray.get(0)!.anotherProp).assertEqual("another")
      expect(clonedArray.get(0)!.nonEnumerableProp).assertEqual("hidden")
      expect(clonedArray.get(0)!.checkProperty("enumerableProp")).assertTrue()
      expect(clonedArray.get(0)!.checkProperty("anotherProp")).assertTrue()
      expect(clonedArray.get(0)!.checkProperty("nonEnumerableProp")).assertTrue()
      expect(clonedArray.get(0)!.getPropertyValue("enumerableProp")).assertEqual("visible")
      expect(clonedArray.get(0)!.getPropertyValue("anotherProp")).assertEqual("another")
      expect(clonedArray.get(0)!.getPropertyValue("nonEnumerableProp")).assertEqual("hidden")
      expect(clonedArray.get(0) === obj).assertTrue()

      const expectedProperties = ["enumerableProp", "anotherProp", "nonEnumerableProp"]
      let foundCount = 0

      for (let prop of expectedProperties) {
        if (clonedArray.get(0)!.checkProperty(prop)) {
          foundCount++
        }
      }
      expect(foundCount).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFOUR_5100
     * @tc.name      testPlainArray04Chapter0051
     * @tc.desc      clone PlainArray with string keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray04Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray04Chapter0051'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ComplexObject_2>()

      const obj = new ComplexObject_2("visible", "another", "hidden")

      plainArray.add(0, obj)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.enumerableProp).assertEqual("visible")
      expect(clonedArray.get(0)!.anotherProp).assertEqual("another")
      expect(clonedArray.get(0)!.nonEnumerableProp).assertEqual("hidden")
      expect(clonedArray.get(0)!.checkProperty("enumerableProp")).assertTrue()
      expect(clonedArray.get(0)!.checkProperty("anotherProp")).assertTrue()
      expect(clonedArray.get(0)!.checkProperty("nonEnumerableProp")).assertTrue()
      expect(clonedArray.get(0)!.getPropertyValue("enumerableProp")).assertEqual("visible")
      expect(clonedArray.get(0)!.getPropertyValue("anotherProp")).assertEqual("another")
      expect(clonedArray.get(0)!.getPropertyValue("nonEnumerableProp")).assertEqual("hidden")
      expect(clonedArray.get(0) === obj).assertTrue()

      const expectedProperties = ["enumerableProp", "anotherProp", "nonEnumerableProp"]
      let foundCount = 0

      for (let prop of expectedProperties) {
        if (clonedArray.get(0)!.checkProperty(prop)) {
          foundCount++
        }
      }
      expect(foundCount).assertEqual(3)
    })
  })
}
