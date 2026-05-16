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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import { PlainArray } from '@kit.ArkTS';

interface GeneratedObjectLiteralInterface_4 {
  arr: number[];
  flag: boolean;
}

interface GeneratedObjectLiteralInterface_3 {
  name: string;
  value: number;
}

class ParentObject {
  protoProperty: string
  sharedMethod: () => string

  constructor() {
    this.protoProperty = "from prototype"
    this.sharedMethod = () => {
      return "method result"
    }
  }
}

class ChildObject extends ParentObject {
  ownProperty: string
  numberValue: number

  constructor(ownProperty: string, numberValue: number) {
    super()
    this.ownProperty = ownProperty
    this.numberValue = numberValue
  }
}

class ObjectWithFunctions {
  name: string
  private counter: number
  increment: () => number
  calculate: (x: number, y: number) => number
  getter: () => string

  constructor(name: string, initialCounter: number) {
    this.name = name
    this.counter = initialCounter

    this.increment = () => {
      this.counter++
      return this.counter
    }
    this.calculate = (x: number, y: number) => {
      return x + y
    }
    this.getter = () => {
      return "getter result"
    }
  }

  getCounter(): number {
    return this.counter
  }
}

interface Uint8ClampedContainer {
  buffer: Uint8ClampedArray;
}

interface MixedNumericObject {
  byteValue: number;
  shortValue: number;
  intValue: number;
  longValue: number;
  floatValue: number;
  doubleValue: number;
  charValue: number;
}

class TestObject {
  definedProp: string
  undefinedProp: string | undefined
  nullProp: string | null

  constructor(definedProp: string, undefinedProp: string | undefined, nullProp: string | null) {
    this.definedProp = definedProp
    this.undefinedProp = undefinedProp
    this.nullProp = nullProp
  }
}

interface ObjectWithSpecialProps {
  a: number;
  b: number;
}

interface SpecialArrayObject {
  abc: number;
  aaa: number;
}

interface MixedArrayContainer {
  values: (number | string | boolean | null)[];
}

interface TypedArrayContainer {
  data: Int8Array
}

interface TypedArrayContainer_1 {
  uint8: Uint8Array
  clamped: Uint8ClampedArray
}

interface TypedArrayContainer_2 {
  int16: Int16Array
  uint16: Uint16Array
}

interface TypedArrayContainer_3 {
  int32: Int32Array
  uint32: Uint32Array
}

interface TypedArrayContainer_4 {
  float32: Float32Array
  float64: Float64Array
}

interface BigIntContainer {
  value: bigint
}

interface BigTypedArrayContainer {
  bigInt64: BigInt64Array
  bigUint64: BigUint64Array
}

interface NullUndefinedContainer {
  nullValue: null
  undefinedValue: undefined
  numberValue: number
}

interface SimpleContainer {
  value: null | undefined | number
}

class SymbolObject {
  regularKey: number
  stringKey1: string
  stringKey2: string
  stringKey3: string
  private _symbolKey: string

  constructor(regularKey: number, symbolKey: string, value1: string, value2: string) {
    this.regularKey = regularKey
    this._symbolKey = symbolKey
    this.stringKey1 = value1
    this.stringKey2 = value2
    this.stringKey3 = ""
  }

  getSymbolKey(): string {
    return this._symbolKey
  }

  setSymbolKey(value: string): void {
    this._symbolKey = value
  }

  getValueByKey(keyName: string): string | undefined {
    if (keyName === "symbolKey1") {
      return this.stringKey1
    } else if (keyName === "symbolKey2") {
      return this.stringKey2
    } else if (keyName === "symbolKey3") {
      return this.stringKey3
    }
    return undefined
  }

  setValueByKey(keyName: string, value: string): void {
    if (keyName === "symbolKey1") {
      this.stringKey1 = value
    } else if (keyName === "symbolKey2") {
      this.stringKey2 = value
    } else if (keyName === "symbolKey3") {
      this.stringKey3 = value
    }
  }
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
    setTimeout(() => {
      resolve(undefined as void)
    }, count)
  })
}

export default function PlainArray05Test(): void {
  describe('PlainArray05Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0100
     * @tc.name      testPlainArray05Chapter0001
     * @tc.desc      clone PlainArray with inheritance objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0001'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ChildObject>()

      const childObj = new ChildObject("own value", 42)
      plainArray.add(0, childObj)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.ownProperty).assertEqual("own value")
      expect(clonedArray.get(0)!.numberValue).assertEqual(42)
      expect(clonedArray.get(0)!.protoProperty).assertEqual("from prototype")
      expect(typeof clonedArray.get(0)!.sharedMethod).assertEqual("function")
      expect(clonedArray.get(0)!.sharedMethod()).assertEqual("method result")
      expect(clonedArray.get(0) instanceof ChildObject).assertTrue()
      expect(clonedArray.get(0) instanceof ParentObject).assertTrue()
      expect(clonedArray.get(0) === childObj).assertTrue()

      const expectedProperties = ["ownProperty", "numberValue", "protoProperty", "sharedMethod"]
      let foundCount = 0

      if (clonedArray.get(0)!.ownProperty === "own value") {
        foundCount++
      }
      if (clonedArray.get(0)!.numberValue === 42) {
        foundCount++
      }
      if (clonedArray.get(0)!.protoProperty === "from prototype") {
        foundCount++
      }
      if (typeof clonedArray.get(0)!.sharedMethod === "function") {
        foundCount++
      }
      expect(foundCount).assertEqual(4)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0200
     * @tc.name      testPlainArray05Chapter0002
     * @tc.desc      clone PlainArray with function properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0002'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ObjectWithFunctions>()

      const obj = new ObjectWithFunctions("function object", 0)
      plainArray.add(0, obj)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.name).assertEqual("function object")
      expect(typeof clonedArray.get(0)!.increment).assertEqual("function")
      expect(typeof clonedArray.get(0)!.calculate).assertEqual("function")
      expect(typeof clonedArray.get(0)!.getter).assertEqual("function")
      expect(clonedArray.get(0)!.calculate(10, 20)).assertEqual(30)
      expect(clonedArray.get(0)!.calculate(-5, 5)).assertEqual(0)
      expect(clonedArray.get(0)!.getter()).assertEqual("getter result")
      expect(clonedArray.get(0)!.getCounter()).assertEqual(0)
      expect(clonedArray.get(0)!.increment()).assertEqual(1)
      expect(clonedArray.get(0)!.increment()).assertEqual(2)
      expect(clonedArray.get(0)!.getCounter()).assertEqual(2)
      expect(obj.getCounter()).assertEqual(2)
      expect(clonedArray.get(0) === obj).assertTrue()
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0300
     * @tc.name      testPlainArray05Chapter0003
     * @tc.desc      clone PlainArray with Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0003'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<Uint8ClampedContainer>()

      const clampedArray = new Uint8ClampedArray(5)
      clampedArray[0] = 0
      clampedArray[1] = 255
      clampedArray[2] = 300
      clampedArray[3] = -10
      clampedArray[4] = 128

      plainArray.add(0, { buffer: clampedArray })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.buffer instanceof Uint8ClampedArray).assertTrue()
      expect(clonedArray.get(0)!.buffer[0]).assertEqual(0)
      expect(clonedArray.get(0)!.buffer[1]).assertEqual(255)
      expect(clonedArray.get(0)!.buffer[2]).assertEqual(255)
      expect(clonedArray.get(0)!.buffer[3]).assertEqual(0)
      expect(clonedArray.get(0)!.buffer[4]).assertEqual(128)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0400
     * @tc.name      testPlainArray05Chapter0004
     * @tc.desc      clone PlainArray with mixed numeric type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0004'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<MixedNumericObject>()

      plainArray.add(0, {
        byteValue: -128,
        shortValue: -32768,
        intValue: -2147483648,
        longValue: -9223372036854775808,
        floatValue: 3.40282346638528860e+38,
        doubleValue: 1.79769313486231570e+308,
        charValue: 65535
      })

      plainArray.add(1, {
        byteValue: 127,
        shortValue: 32767,
        intValue: 2147483647,
        longValue: 9223372036854775807,
        floatValue: 1.40129846432481707e-45,
        doubleValue: 4.94065645841246544e-324,
        charValue: 0
      })

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.byteValue).assertEqual(-128)
      expect(clonedArray.get(0)!.shortValue).assertEqual(-32768)
      expect(clonedArray.get(0)!.intValue).assertEqual(-2147483648)
      expect(clonedArray.get(0)!.floatValue).assertEqual(3.40282346638528860e+38)
      expect(clonedArray.get(0)!.doubleValue).assertEqual(1.79769313486231570e+308)
      expect(clonedArray.get(0)!.charValue).assertEqual(65535)

      expect(clonedArray.get(1)!.byteValue).assertEqual(127)
      expect(clonedArray.get(1)!.shortValue).assertEqual(32767)
      expect(clonedArray.get(1)!.intValue).assertEqual(2147483647)
      expect(clonedArray.get(1)!.floatValue).assertEqual(1.40129846432481707e-45)
      expect(clonedArray.get(1)!.doubleValue).assertEqual(4.94065645841246544e-324)
      expect(clonedArray.get(1)!.charValue).assertEqual(0)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0500
     * @tc.name      testPlainArray05Chapter0005
     * @tc.desc      clone PlainArray with undefined and null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0005'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TestObject>()

      const obj1 = new TestObject("defined", undefined, null)
      const obj2 = new TestObject("another", undefined, null)

      plainArray.add(0, obj1)
      plainArray.add(1, obj2)

      let clonedArray = plainArray.clone()

      expect(clonedArray.get(0)!.definedProp).assertEqual("defined")
      expect(clonedArray.get(0)!.undefinedProp).assertUndefined()
      expect(clonedArray.get(0)!.nullProp).assertNull()
      expect(clonedArray.get(1)!.definedProp).assertEqual("another")
      expect(clonedArray.get(1)!.undefinedProp).assertUndefined()
      expect(clonedArray.get(1)!.nullProp).assertNull()
      expect(clonedArray.get(0)!.definedProp !== undefined).assertTrue()
      expect(clonedArray.get(0)!.undefinedProp === undefined).assertTrue()
      expect(clonedArray.get(0)!.nullProp === null).assertTrue()
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0600
     * @tc.name      testPlainArray05Chapter0006
     * @tc.desc      add basic string value with normal key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0006'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(1, "squirrel")
      plainArray.add(2, "sparrow")

      expect(plainArray.get(1)).assertEqual("squirrel")
      expect(plainArray.get(2)).assertEqual("sparrow")
      expect(plainArray.length).assertEqual(2)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0700
     * @tc.name      testPlainArray05Chapter0007
     * @tc.desc      add value with existing key should update value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0007'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(1, "squirrel")
      plainArray.add(1, "sparrow")

      expect(plainArray.get(1)).assertEqual("sparrow")
      expect(plainArray.length).assertEqual(1)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0800
     * @tc.name      testPlainArray05Chapter0008
     * @tc.desc      add value with key zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0008'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "zero")
      plainArray.add(1, "one")

      expect(plainArray.get(0)).assertEqual("zero")
      expect(plainArray.get(1)).assertEqual("one")
      expect(plainArray.length).assertEqual(2)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_0900
     * @tc.name      testPlainArray05Chapter0009
     * @tc.desc      add value with negative key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0009'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(-1, "minus one")
      plainArray.add(-100, "minus hundred")
      plainArray.add(0, "zero")

      expect(plainArray.get(-1)).assertEqual("minus one")
      expect(plainArray.get(-100)).assertEqual("minus hundred")
      expect(plainArray.get(0)).assertEqual("zero")
      expect(plainArray.length).assertEqual(3)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1000
     * @tc.name      testPlainArray05Chapter0010
     * @tc.desc      add value with maximum int32 key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0010'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(2147483647, "max int32")

      expect(plainArray.get(2147483647)).assertEqual("max int32")
      expect(plainArray.length).assertEqual(1)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1100
     * @tc.name      testPlainArray05Chapter0011
     * @tc.desc      add number value to PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0011'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, 100)
      plainArray.add(1, -50)
      plainArray.add(2, 0)

      expect(plainArray.get(0)).assertEqual(100)
      expect(plainArray.get(1)).assertEqual(-50)
      expect(plainArray.get(2)).assertEqual(0)
      expect(plainArray.length).assertEqual(3)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1200
     * @tc.name      testPlainArray05Chapter0012
     * @tc.desc      add boolean value to PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0012'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<boolean>()
      plainArray.add(0, true)
      plainArray.add(1, false)

      expect(plainArray.get(0)).assertTrue()
      expect(plainArray.get(1)).assertFalse()
      expect(plainArray.length).assertEqual(2)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1300
     * @tc.name      testPlainArray05Chapter0013
     * @tc.desc      add object value to PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0013'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<Object>()
      let obj1: GeneratedObjectLiteralInterface_3 = { name: "test", value: 1 }
      let obj2: GeneratedObjectLiteralInterface_4 = { arr: [1, 2, 3], flag: true }

      plainArray.add(0, obj1)
      plainArray.add(1, obj2)

      expect(plainArray.get(0)).assertDeepEquals(obj1)
      expect(plainArray.get(1)).assertDeepEquals(obj2)
      expect(plainArray.length).assertEqual(2)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1400
     * @tc.name      testPlainArray05Chapter0014
     * @tc.desc      add array value to PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0014'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<Array<number>>()
      plainArray.add(0, [1, 2, 3])
      plainArray.add(1, [4, 5, 6])

      expect(plainArray.get(0)![0]).assertEqual(1)
      expect(plainArray.get(0)![1]).assertEqual(2)
      expect(plainArray.get(0)![2]).assertEqual(3)
      expect(plainArray.get(1)![0]).assertEqual(4)
      expect(plainArray.get(1)![1]).assertEqual(5)
      expect(plainArray.get(1)![2]).assertEqual(6)
      expect(plainArray.length).assertEqual(2)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1500
     * @tc.name      testPlainArray05Chapter0015
     * @tc.desc      add special string values to PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0015'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "")
      plainArray.add(1, "null")
      plainArray.add(2, "undefined")
      plainArray.add(3, "NaN")
      plainArray.add(4, "a".repeat(1000))

      expect(plainArray.get(0)).assertEqual("")
      expect(plainArray.get(1)).assertEqual("null")
      expect(plainArray.get(2)).assertEqual("undefined")
      expect(plainArray.get(3)).assertEqual("NaN")
      expect(plainArray.get(4)).assertEqual("a".repeat(1000))
      expect(plainArray.length).assertEqual(5)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1600
     * @tc.name      testPlainArray05Chapter0016
     * @tc.desc      add ASCII special characters as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0016'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~"

      for (let i = 0; i < specialChars.length; i++) {
        plainArray.add(i, specialChars.charAt(i).toString())
      }


      expect(plainArray.get(0)).assertEqual("!")
      expect(plainArray.get(1)).assertEqual("\"")
      expect(plainArray.get(2)).assertEqual("#")
      expect(plainArray.get(3)).assertEqual("$")
      expect(plainArray.length).assertEqual(specialChars.length)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1700
     * @tc.name      testPlainArray05Chapter0017
     * @tc.desc      add all ASCII characters as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0017'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      const asciiChars = "ABCDEFGHIJ"
      const expectedLength = asciiChars.length

      for (let i = 0; i < expectedLength; i++) {
        plainArray.add(i, asciiChars.charAt(i).toString())
      }

      for (let i = 0; i < expectedLength; i++) {
        expect(plainArray.get(i)).assertEqual(asciiChars.charAt(i).toString())
      }

      expect(plainArray.length).assertEqual(expectedLength)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1800
     * @tc.name      testPlainArray05Chapter0018
     * @tc.desc      add special ASCII characters as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0018'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()

      const specialChars = ["!", "\"", "#", "$", "%", "&", "'", "(", ")", "*"]

      for (let i = 0; i < specialChars.length; i++) {
        plainArray.add(i, specialChars[i])
      }

      for (let i = 0; i < specialChars.length; i++) {
        expect(plainArray.get(i)).assertEqual(specialChars[i])
      }

      expect(plainArray.length).assertEqual(specialChars.length)


    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_1900
     * @tc.name      testPlainArray05Chapter0019
     * @tc.desc      add emoji characters as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0019'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "👆")
      plainArray.add(1, "👿")
      plainArray.add(2, "👀")
      plainArray.add(3, "💯")
      plainArray.add(4, "🎅")

      expect(plainArray.get(0)).assertEqual("👆")
      expect(plainArray.get(1)).assertEqual("👿")
      expect(plainArray.get(2)).assertEqual("👀")
      expect(plainArray.get(3)).assertEqual("💯")
      expect(plainArray.get(4)).assertEqual("🎅")
      expect(plainArray.length).assertEqual(5)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2000
     * @tc.name      testPlainArray05Chapter0020
     * @tc.desc      add special number values to PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0020'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, Number.MAX_VALUE)
      plainArray.add(1, Number.MIN_VALUE)
      plainArray.add(2, Number.MAX_SAFE_INTEGER)
      plainArray.add(3, Number.MIN_SAFE_INTEGER)
      plainArray.add(4, Number.EPSILON)

      expect(plainArray.get(0)).assertEqual(Number.MAX_VALUE)
      expect(plainArray.get(1)).assertEqual(Number.MIN_VALUE)
      expect(plainArray.get(2)).assertEqual(Number.MAX_SAFE_INTEGER)
      expect(plainArray.get(3)).assertEqual(Number.MIN_SAFE_INTEGER)
      expect(plainArray.get(4)).assertEqual(Number.EPSILON)
      expect(plainArray.length).assertEqual(5)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2100
     * @tc.name      testPlainArray05Chapter0021
     * @tc.desc      add Infinity and NaN values to PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0021'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, Infinity)
      plainArray.add(1, -Infinity)
      plainArray.add(2, NaN)
      plainArray.add(3, 0)
      plainArray.add(4, -0)

      expect(plainArray.get(0)).assertEqual(Infinity)
      expect(plainArray.get(1)).assertEqual(-Infinity)
      expect(isNaN(plainArray.get(2) as number)).assertTrue()
      expect(plainArray.get(3)).assertEqual(0)
      expect(plainArray.get(4)).assertEqual(-0)
      expect(plainArray.length).assertEqual(5)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2200
     * @tc.name      testPlainArray05Chapter0022
     * @tc.desc      add typed array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const TAG = 'testPlainArray05Chapter0022'
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
        expect(plainArray.get(0)).assertEqual(-128)
        expect(plainArray.get(1)).assertEqual(127)
        expect(plainArray.get(2)).assertEqual(0)
        expect(plainArray.get(3)).assertEqual(255)
        expect(plainArray.get(4)).assertEqual(-32768)
        expect(plainArray.get(5)).assertEqual(32767)
        expect(plainArray.get(6)).assertEqual(0)
        expect(plainArray.get(7)).assertEqual(65535)
        expect(plainArray.length).assertEqual(8)
      })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2300
     * @tc.name      testPlainArray05Chapter0023
     * @tc.desc      add large number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0023'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, 2147483647)
      plainArray.add(1, -2147483648)
      plainArray.add(2, 4294967295)
      plainArray.add(3, 0xFFFFFFFF)
      expect(plainArray.get(0)).assertEqual(2147483647)
      expect(plainArray.get(1)).assertEqual(-2147483648)
      expect(plainArray.get(2)).assertEqual(4294967295)
      expect(plainArray.get(3)).assertEqual(0xFFFFFFFF)
      expect(plainArray.length).assertEqual(4)

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2400
     * @tc.name      testPlainArray05Chapter0024
     * @tc.desc      add float values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0024'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, 123.456)
      plainArray.add(1, -123.456)
      plainArray.add(2, 1.5)
      plainArray.add(3, 1e3)
      plainArray.add(4, 2.5e-2)
      plainArray.add(5, Math.floor(1.5))
      expect(plainArray.get(0)).assertEqual(123.456)
      expect(plainArray.get(1)).assertEqual(-123.456)
      expect(plainArray.get(2)).assertEqual(1.5)
      expect(plainArray.get(3)).assertEqual(1e3)
      expect(plainArray.get(4)).assertEqual(2.5e-2)
      expect(plainArray.get(5)).assertEqual(1)
      expect(plainArray.length).assertEqual(6)


    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2500
     * @tc.name      testPlainArray05Chapter0025
     * @tc.desc      add value with large key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0025'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(1000, "value at 1000")
      plainArray.add(1000000, "value at 1000000")
      plainArray.add(5000000, "value at 5000000")

      expect(plainArray.get(1000)).assertEqual("value at 1000")
      expect(plainArray.get(1000000)).assertEqual("value at 1000000")
      expect(plainArray.get(5000000)).assertEqual("value at 5000000")
      expect(plainArray.length).assertEqual(3)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2600
     * @tc.name      testPlainArray05Chapter0026
     * @tc.desc      reverse test: add value with invalid key type (should fail)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0026'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>();
      plainArray.add(2147483647, "should work");
      expect(plainArray.length).assertEqual(1);
      expect(plainArray.get(2147483647)).assertEqual("should work");
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2700
     * @tc.name      testPlainArray05Chapter0027
     * @tc.desc      reverse test: test add method with invalid parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0027'
      console.log(TAG + ' start')

      let plainArray: PlainArray<string> | null = null

      plainArray = new PlainArray<string>()
      expect(plainArray instanceof PlainArray).assertTrue()
      plainArray.add(2147483647, "valid key")
      expect(plainArray.length).assertEqual(1)
      expect(plainArray.get(2147483647)).assertEqual("valid key")
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2800
     * @tc.name      testPlainArray05Chapter0028
     * @tc.desc      add many elements and verify performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0028'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      const count = 1000

      for (let i = 0; i < count; i++) {
        plainArray.add(i, i * 2)
      }

      expect(plainArray.length).assertEqual(count)
      expect(plainArray.get(0)).assertEqual(0)
      expect(plainArray.get(100)).assertEqual(200)
      expect(plainArray.get(999)).assertEqual(1998)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_2900
     * @tc.name      testPlainArray05Chapter0029
     * @tc.desc      add values with non-sequential keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0029'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(100, "value 100")
      plainArray.add(50, "value 50")
      plainArray.add(200, "value 200")
      plainArray.add(1, "value 1")
      plainArray.add(75, "value 75")

      expect(plainArray.get(100)).assertEqual("value 100")
      expect(plainArray.get(50)).assertEqual("value 50")
      expect(plainArray.get(200)).assertEqual("value 200")
      expect(plainArray.get(1)).assertEqual("value 1")
      expect(plainArray.get(75)).assertEqual("value 75")
      expect(plainArray.length).assertEqual(5)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3000
     * @tc.name      testPlainArray05Chapter0030
     * @tc.desc      add duplicate keys with different values (should update)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const TAG = 'testPlainArray05Chapter0030'
        console.log(TAG + ' start')

        let plainArray = new PlainArray<string>()
        plainArray.add(1, "first value")
        plainArray.add(2, "second value")
        plainArray.add(1, "updated first value")
        plainArray.add(2, "updated second value")
        expect(plainArray.get(1)).assertEqual("updated first value")
        expect(plainArray.get(2)).assertEqual("updated second value")
        expect(plainArray.length).assertEqual(2)
      })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3100
     * @tc.name      testPlainArray05Chapter0031
     * @tc.desc      add values with full TypedArray range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0031'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, -2147483648)
      plainArray.add(1, 2147483647)
      plainArray.add(2, 0)
      plainArray.add(3, 4294967295)
      plainArray.add(4, -3.4028234663852886e38)
      plainArray.add(5, 3.4028234663852886e38)
      plainArray.add(6, -1.7976931348623157e308)
      plainArray.add(7, 1.7976931348623157e308)

      expect(plainArray.get(0)).assertEqual(-2147483648)
      expect(plainArray.get(1)).assertEqual(2147483647)
      expect(plainArray.get(2)).assertEqual(0)
      expect(plainArray.get(3)).assertEqual(4294967295)
      expect(plainArray.get(4)).assertEqual(-3.4028234663852886e38)
      expect(plainArray.get(5)).assertEqual(3.4028234663852886e38)
      expect(plainArray.get(6)).assertEqual(-1.7976931348623157e308)
      expect(plainArray.get(7)).assertEqual(1.7976931348623157e308)
      expect(plainArray.length).assertEqual(8)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3200
     * @tc.name      testPlainArray05Chapter0032
     * @tc.desc      add values with numeric overflow cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0032'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      plainArray.add(0, -129)
      plainArray.add(1, 128)
      plainArray.add(2, -1)
      plainArray.add(3, 256)
      plainArray.add(4, -32769)
      plainArray.add(5, 32768)
      plainArray.add(6, -1)
      plainArray.add(7, 65536)
      plainArray.add(8, -2147483649)
      plainArray.add(9, 2147483648)
      plainArray.add(10, -1)
      plainArray.add(11, 4294967296)
      plainArray.add(12, -3.5e38)
      plainArray.add(13, 3.5e38)
      plainArray.add(14, -1.8e308)
      expect(plainArray.get(0)).assertEqual(-129)
      expect(plainArray.get(1)).assertEqual(128)
      expect(plainArray.get(2)).assertEqual(-1)
      expect(plainArray.get(3)).assertEqual(256)
      expect(plainArray.get(4)).assertEqual(-32769)
      expect(plainArray.get(5)).assertEqual(32768)
      expect(plainArray.get(6)).assertEqual(-1)
      expect(plainArray.get(7)).assertEqual(65536)
      expect(plainArray.get(8)).assertEqual(-2147483649)
      expect(plainArray.get(9)).assertEqual(2147483648)
      expect(plainArray.get(10)).assertEqual(-1)
      expect(plainArray.get(11)).assertEqual(4294967296)
      expect(plainArray.get(12)).assertEqual(-3.5e38)
      expect(plainArray.get(13)).assertEqual(3.5e38)
      expect(plainArray.get(14)).assertEqual(-1.8e308)
      expect(plainArray.length).assertEqual(15)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3300
     * @tc.name      testPlainArray05Chapter0033
     * @tc.desc      add values with string escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const TAG = 'testPlainArray05Chapter0033'
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
        plainArray.add(8, "\v")
        plainArray.add(9, "\0")
        plainArray.add(10, "\x41")
        plainArray.add(11, "\u0041")

        expect(plainArray.get(0)).assertEqual("\n")
        expect(plainArray.get(1)).assertEqual("\t")
        expect(plainArray.get(2)).assertEqual("\r")
        expect(plainArray.get(3)).assertEqual("\\")
        expect(plainArray.get(4)).assertEqual("\"")
        expect(plainArray.get(5)).assertEqual("'")
        expect(plainArray.get(6)).assertEqual("\b")
        expect(plainArray.get(7)).assertEqual("\f")
        expect(plainArray.get(8)).assertEqual("\v")
        expect(plainArray.get(9)).assertEqual("\0")
        expect(plainArray.get(10)).assertEqual("A")
        expect(plainArray.get(11)).assertEqual("A")
        expect(plainArray.length).assertEqual(12)
      })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3400
     * @tc.name      testPlainArray05Chapter0034
     * @tc.desc      add values with full emoji set from checklist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0034'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "👆")
      plainArray.add(1, "👿")
      plainArray.add(2, "👀")
      plainArray.add(3, "💯")
      plainArray.add(4, "🎅")
      plainArray.add(5, "😼")
      plainArray.add(6, "🔧")
      plainArray.add(7, "💇")
      plainArray.add(8, "🤼‍♂️")
      plainArray.add(9, "🛢")
      plainArray.add(10, "🀄")
      plainArray.add(11, "🏴")

      expect(plainArray.get(0)).assertEqual("👆")
      expect(plainArray.get(1)).assertEqual("👿")
      expect(plainArray.get(2)).assertEqual("👀")
      expect(plainArray.get(3)).assertEqual("💯")
      expect(plainArray.get(4)).assertEqual("🎅")
      expect(plainArray.get(5)).assertEqual("😼")
      expect(plainArray.get(6)).assertEqual("🔧")
      expect(plainArray.get(7)).assertEqual("💇")
      expect(plainArray.get(8)).assertEqual("🤼‍♂️")
      expect(plainArray.get(9)).assertEqual("🛢")
      expect(plainArray.get(10)).assertEqual("🀄")
      expect(plainArray.get(11)).assertEqual("🏴")
      expect(plainArray.length).assertEqual(12)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3500
     * @tc.name      testPlainArray05Chapter0035
     * @tc.desc      add values with Unicode encoded emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0035'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "\ud83d\udc46")
      plainArray.add(1, "\ud83d\udc7f")
      plainArray.add(2, "\ud83d\udc40")
      plainArray.add(3, "\ud83d\udcaf")
      plainArray.add(4, "\ud83c\udf85")
      plainArray.add(5, "\ud83d\ude3c")
      plainArray.add(6, "\ud83d\udd27")
      plainArray.add(7, "\ud83d\udc87")
      plainArray.add(8, "\ud83e\udd3c\u200d\u2642\ufe0f")
      plainArray.add(9, "\ud83d\udee2")
      plainArray.add(10, "\ud83c\udc04")
      plainArray.add(11, "\ud83c\udff4")

      expect(plainArray.get(0)).assertEqual("\ud83d\udc46")
      expect(plainArray.get(1)).assertEqual("\ud83d\udc7f")
      expect(plainArray.get(2)).assertEqual("\ud83d\udc40")
      expect(plainArray.get(3)).assertEqual("\ud83d\udcaf")
      expect(plainArray.get(4)).assertEqual("\ud83c\udf85")
      expect(plainArray.get(5)).assertEqual("\ud83d\ude3c")
      expect(plainArray.get(6)).assertEqual("\ud83d\udd27")
      expect(plainArray.get(7)).assertEqual("\ud83d\udc87")
      expect(plainArray.get(8)).assertEqual("\ud83e\udd3c\u200d\u2642\ufe0f")
      expect(plainArray.get(9)).assertEqual("\ud83d\udee2")
      expect(plainArray.get(10)).assertEqual("\ud83c\udc04")
      expect(plainArray.get(11)).assertEqual("\ud83c\udff4")
      expect(plainArray.length).assertEqual(12)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3600
     * @tc.name      testPlainArray05Chapter0036
     * @tc.desc      add values with illegal Unicode sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0036'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "\udc04")
      plainArray.add(1, "\ud83d")
      plainArray.add(2, "\udff4")

      expect(plainArray.get(0)).assertEqual("\udc04")
      expect(plainArray.get(1)).assertEqual("\ud83d")
      expect(plainArray.get(2)).assertEqual("\udff4")
      expect(plainArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3700
     * @tc.name      testPlainArray05Chapter0037
     * @tc.desc      add values with keyword strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0037'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(0, "0")
      plainArray.add(1, "NaN")
      plainArray.add(2, "")

      expect(plainArray.get(0)).assertEqual("0")
      expect(plainArray.get(1)).assertEqual("NaN")
      expect(plainArray.get(2)).assertEqual("")
      expect(plainArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3800
     * @tc.name      testPlainArray05Chapter0038
     * @tc.desc      add values with tree string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0038'
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
      plainArray.add(1, "normal string for comparison")

      expect(plainArray.get(0)).assertEqual(treeString)
      expect(plainArray.get(1)).assertEqual("normal string for comparison")
      expect(plainArray.length).assertEqual(2)

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_3900
     * @tc.name      testPlainArray05Chapter0039
     * @tc.desc      add values with slice string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0039'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      const str = "{k1:value1,k2:value2}"
      const slicedStr = str.substring(0, str.length - 2)

      plainArray.add(0, str)
      plainArray.add(1, slicedStr)

      expect(plainArray.get(0)).assertEqual("{k1:value1,k2:value2}")
      expect(plainArray.get(1)).assertEqual("{k1:value1,k2:value")
      expect(plainArray.length).assertEqual(2)

    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4000
     * @tc.name      testPlainArray05Chapter0040
     * @tc.desc      add large string and check memory
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0040'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      const largeString = "a".repeat(10000)

      plainArray.add(0, largeString)
      plainArray.add(1, "small string")

      expect(plainArray.get(0)).assertEqual(largeString)
      expect(plainArray.get(1)).assertEqual("small string")
      expect(plainArray.length).assertEqual(2)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4100
     * @tc.name      testPlainArray05Chapter0041
     * @tc.desc      add values with array data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0041'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number[]>()

      plainArray.add(0, [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63])
      plainArray.add(1, [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63])
      plainArray.add(2, [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63])
      plainArray.add(3, [72, 101, NaN, Number.MAX_VALUE, 108, 111])
      plainArray.add(4, [])
      plainArray.add(5, [256, 65536, 32768])


      let arr0: number[] = plainArray.get(0)!
      expect(arr0.length).assertEqual(14)
      expect(arr0[0]).assertEqual(72)
      expect(arr0[13]).assertEqual(63)
      let arr1: number[] = plainArray.get(1)!
      expect(arr1.length).assertEqual(19)
      expect(arr1[0]).assertEqual(72)
      expect(arr1[18]).assertEqual(63)
      let arr2: number[] = plainArray.get(2)!
      expect(arr2.length).assertEqual(14)
      expect(arr2[0]).assertEqual(72)
      expect(arr2[13]).assertEqual(-63)


      const array3: number[] = plainArray.get(3)!
      expect(array3.length).assertEqual(6)
      expect(array3[0]).assertEqual(72)
      expect(array3[1]).assertEqual(101)


      expect(Number.isNaN(array3[2])).assertTrue()


      expect(array3[3]).assertEqual(Number.MAX_VALUE)

      expect(array3[4]).assertEqual(108)
      expect(array3[5]).assertEqual(111)


      let arr4: number[] = plainArray.get(4)!
      expect(arr4.length).assertEqual(0)


      let arr5: number[] = plainArray.get(5)!
      expect(arr5.length).assertEqual(3)
      expect(arr5[0]).assertEqual(256)
      expect(arr5[1]).assertEqual(65536)
      expect(arr5[2]).assertEqual(32768)

      expect(plainArray.length).assertEqual(6)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4200
     * @tc.name      testPlainArray05Chapter0042
     * @tc.desc      add values with special object properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        const TAG = 'testPlainArray05Chapter0042'
        console.log(TAG + ' start')

        let plainArray = new PlainArray<ObjectWithSpecialProps>()

        plainArray.add(0, { a: 0, b: 0 })
        plainArray.add(1, { a: 1, b: NaN })
        plainArray.add(2, { a: 2, b: Infinity })
        plainArray.add(3, { a: 3, b: -Infinity })

        let expectedVal0: ObjectWithSpecialProps = { a: 0, b: 0 }
        expect(plainArray.get(0)!).assertDeepEquals(expectedVal0)
        expect(isNaN(plainArray.get(1)!.b)).assertTrue()
        expect(plainArray.get(2)!.b).assertEqual(Infinity)
        expect(plainArray.get(3)!.b).assertEqual(-Infinity)
        expect(plainArray.length).assertEqual(4)
      })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4300
     * @tc.name      testPlainArray05Chapter0043
     * @tc.desc      add values with special array type from checklist
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0043'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<SpecialArrayObject>()

      const specialArray: SpecialArrayObject = { abc: 111, aaa: 222 }
      plainArray.add(0, specialArray)
      plainArray.add(1, { abc: 0, aaa: 0 })


      expect(plainArray.get(0)!.abc).assertEqual(111)
      expect(plainArray.get(0)!.aaa).assertEqual(222)


      expect(plainArray.get(1)!.abc).assertEqual(0)
      expect(plainArray.get(1)!.aaa).assertEqual(0)

      expect(Object.keys(plainArray.get(1)!).length).assertEqual(2)

      expect(plainArray.length).assertEqual(2)


    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4400
     * @tc.name      testPlainArray05Chapter0044
     * @tc.desc      add values with mixed data type array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0044'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<MixedArrayContainer>()

      const mixedArray: (number | string | boolean | null)[] = [72, "abc", true, null, 108]

      plainArray.add(0, { values: mixedArray })

      expect(plainArray.get(0)!.values[0]).assertEqual(72)
      expect(plainArray.get(0)!.values[1]).assertEqual("abc")
      expect(plainArray.get(0)!.values[2]).assertEqual(true)
      expect(plainArray.get(0)!.values[3]).assertEqual(null)
      expect(plainArray.get(0)!.values[4]).assertEqual(108)
      expect(plainArray.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4500
     * @tc.name      testPlainArray05Chapter0045
     * @tc.desc      add many elements for performance testing
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0045'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<number>()
      const count = 10000

      for (let i = 0; i < count; i++) {
        plainArray.add(i, i * 3)
      }

      expect(plainArray.length).assertEqual(count)
      expect(plainArray.get(0)).assertEqual(0)
      expect(plainArray.get(5000)).assertEqual(15000)
      expect(plainArray.get(9999)).assertEqual(29997)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4600
     * @tc.name      testPlainArray05Chapter0046
     * @tc.desc      add values with boolean expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0046'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<boolean>()

      plainArray.add(0, true)
      plainArray.add(1, false)
      plainArray.add(2, !'s')
      plainArray.add(3, !0)

      expect(plainArray.get(0)).assertTrue()
      expect(plainArray.get(1)).assertFalse()
      expect(plainArray.get(2)).assertFalse()
      expect(plainArray.get(3)).assertTrue()
      expect(plainArray.length).assertEqual(4)

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4700
     * @tc.name      testPlainArray05Chapter0047
     * @tc.desc      add Int8Array typed array as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0047'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TypedArrayContainer>()
      const int8Array = new Int8Array([-128, 127, 0, 64, -64])

      plainArray.add(0, { data: int8Array })
      plainArray.add(1, { data: new Int8Array([]) })

      const resultArray: TypedArrayContainer = plainArray.get(0)!
      expect(resultArray.data.length).assertEqual(5)
      expect(resultArray.data[0]).assertEqual(-128)
      expect(resultArray.data[1]).assertEqual(127)
      expect(plainArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4800
     * @tc.name      testPlainArray05Chapter0048
     * @tc.desc      add Uint8Array and Uint8ClampedArray as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0048'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TypedArrayContainer_1>()
      const uint8Array = new Uint8Array([0, 255, 128])
      const clampedArray = new Uint8ClampedArray([0, 255, 300, -10])

      plainArray.add(0, { uint8: uint8Array, clamped: clampedArray })

      const result: TypedArrayContainer_1 = plainArray.get(0)!
      expect(result.uint8.length).assertEqual(3)
      expect(result.uint8[0]).assertEqual(0)
      expect(result.uint8[1]).assertEqual(255)
      expect(result.clamped[2]).assertEqual(255)
      expect(result.clamped[3]).assertEqual(0)
      expect(plainArray.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_4900
     * @tc.name      testPlainArray05Chapter0049
     * @tc.desc      add Int16Array and Uint16Array as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0049'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TypedArrayContainer_2>()
      const int16Array = new Int16Array([-32768, 32767, 0])
      const uint16Array = new Uint16Array([0, 65535, 32768])

      plainArray.add(0, { int16: int16Array, uint16: uint16Array })

      const result: TypedArrayContainer_2 = plainArray.get(0)!
      expect(result.int16[0]).assertEqual(-32768)
      expect(result.int16[1]).assertEqual(32767)
      expect(result.uint16[1]).assertEqual(65535)
      expect(plainArray.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_5000
     * @tc.name      testPlainArray05Chapter0050
     * @tc.desc      add Int32Array and Uint32Array as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0050'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TypedArrayContainer_3>()
      const int32Array = new Int32Array([-2147483648, 2147483647, 0])
      const uint32Array = new Uint32Array([0, 4294967295, 2147483648])

      plainArray.add(0, { int32: int32Array, uint32: uint32Array })

      const result: TypedArrayContainer_3 = plainArray.get(0)!
      expect(result.int32[0]).assertEqual(-2147483648)
      expect(result.int32[1]).assertEqual(2147483647)
      expect(result.uint32[1]).assertEqual(4294967295)
      expect(plainArray.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_5100
     * @tc.name      testPlainArray05Chapter0051
     * @tc.desc      add Float32Array and Float64Array as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0051'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<TypedArrayContainer_4>()
      const float32Array = new Float32Array([-3.4e38, 3.4e38, 0, 1.2e-38])
      const float64Array = new Float64Array([-Number.MAX_VALUE, Number.MAX_VALUE, 0, Number.MIN_VALUE])

      plainArray.add(0, { float32: float32Array, float64: float64Array })

      const result: TypedArrayContainer_4 = plainArray.get(0)!
      expect(result.float32[0]).assertEqual(-3.3999999521443642e+38)
      expect(result.float32[1]).assertEqual(3.3999999521443642e+38)
      expect(result.float64[0]).assertEqual(-Number.MAX_VALUE)
      expect(result.float64[3]).assertEqual(5e-324)
      expect(plainArray.length).assertEqual(1)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_5200
     * @tc.name      testPlainArray05Chapter0052
     * @tc.desc      add bigint primitive values to PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0052'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<BigIntContainer>()

      plainArray.add(0, { value: -9223372036854775808n })
      plainArray.add(1, { value: 9223372036854775807n })
      plainArray.add(2, { value: 0n })
      plainArray.add(3, { value: 18446744073709551615n })
      plainArray.add(4, { value: BigInt(9007199254740991) })

      expect(plainArray.get(0)!.value).assertEqual(-9223372036854775808n)
      expect(plainArray.get(1)!.value).assertEqual(9223372036854775807n)
      expect(plainArray.get(2)!.value).assertEqual(0n)
      expect(plainArray.get(3)!.value).assertEqual(18446744073709551615n)
      expect(plainArray.get(4)!.value).assertEqual(9007199254740991n)
      expect(plainArray.length).assertEqual(5)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_5300
     * @tc.name      testPlainArray05Chapter0053
     * @tc.desc      add BigInt64Array and BigUint64Array as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0053'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<BigTypedArrayContainer>()
      const bigInt64Array = new BigInt64Array([-9223372036854775808n, 9223372036854775807n, 0n])
      const bigUint64Array = new BigUint64Array([0n, 18446744073709551615n, 1234567890123456789n])

      plainArray.add(0, { bigInt64: bigInt64Array, bigUint64: bigUint64Array })

      const result: BigTypedArrayContainer = plainArray.get(0)!
      expect(result.bigInt64[0]).assertEqual(-9223372036854775808n)
      expect(result.bigInt64[1]).assertEqual(9223372036854775807n)
      expect(result.bigUint64[1]).assertEqual(18446744073709551615n)
      expect(plainArray.length).assertEqual(1)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_5400
     * @tc.name      testPlainArray05Chapter0054
     * @tc.desc      add null and undefined as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0054'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<NullUndefinedContainer>()

      plainArray.add(0, { nullValue: null, undefinedValue: undefined, numberValue: 100 })
      plainArray.add(1, { nullValue: null, undefinedValue: undefined, numberValue: 200 })

      const result0: NullUndefinedContainer = plainArray.get(0)!
      const result1: NullUndefinedContainer = plainArray.get(1)!

      expect(result0.nullValue).assertNull()
      expect(result0.undefinedValue).assertUndefined()
      expect(result0.numberValue).assertEqual(100)
      expect(result1.numberValue).assertEqual(200)
      expect(plainArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_5500
     * @tc.name      testPlainArray05Chapter0055
     * @tc.desc      add plain null and undefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0055'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<SimpleContainer>()

      plainArray.add(0, { value: null })
      plainArray.add(1, { value: undefined })
      plainArray.add(2, { value: 42 })

      expect(plainArray.get(0)!.value).assertNull()
      expect(plainArray.get(1)!.value).assertUndefined()
      expect(plainArray.get(2)!.value).assertEqual(42)
      expect(plainArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTFIVE_5600
     * @tc.name      testPlainArray05Chapter0056
     * @tc.desc      add object with Symbol keys as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray05Chapter0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray05Chapter0056'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<SymbolObject>()
      const key1 = "key1"
      const key2 = "key2"

      const obj = new SymbolObject(100, key1, "symbol value 1", "symbol value 2")
      obj.setValueByKey(key1, "symbol value 1")
      obj.setValueByKey(key2, "symbol value 2")

      plainArray.add(0, obj)

      const result: SymbolObject = plainArray.get(0)!
      expect(result.regularKey).assertEqual(100)
      expect(result.getSymbolKey()).assertEqual(key1)
      expect(result.getValueByKey(key1)).assertEqual(undefined)
      expect(result.getValueByKey(key2)).assertEqual(undefined)
      expect(plainArray.length).assertEqual(1)
    })
  })
}
