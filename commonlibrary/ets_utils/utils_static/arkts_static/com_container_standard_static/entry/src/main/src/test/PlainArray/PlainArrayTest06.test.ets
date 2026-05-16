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
import { PlainArray } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';

interface GeneratedTypeLiteralInterface_3 {
  code: number;
  message: string;
}

interface GeneratedTypeLiteralInterface_5 {
  code?: number;
  message?: string;
}

interface GeneratedTypeLiteralInterface_4 {
  value: number | null;
}

interface GeneratedTypeLiteralInterface_6 {
  code?: number;
  message?: string;
}

interface GeneratedTypeLiteralInterface_7 {
  code?: number;
  message?: string;
}

interface GeneratedTypeLiteralInterface_8 {
  code?: number;
  message?: string;
}

interface GeneratedTypeLiteralInterface_9 {
  code?: number;
  message?: string;
}

interface GeneratedTypeLiteralInterface_10 {
  code?: number;
  message?: string;
}

interface FunctionObject {
  name: string
  calculate: (x: number, y: number) => number
  print: () => string
}

interface ParentObject {
  parentProp: number
}

interface ChildObject extends ParentObject {
  childProp: string
}

interface PublicProperties {
  publicProp: string;
}

class ExtendedObjectWithHiddenProps {
  publicProp: string
  private _hiddenNumber: number | undefined
  private _hiddenString: string | undefined

  constructor(publicProp: string) {
    this.publicProp = publicProp
  }

  setHiddenNumber(value: number): void {
    this._hiddenNumber = value
  }

  getHiddenNumber(): number | undefined {
    return this._hiddenNumber
  }

  setHiddenString(value: string): void {
    this._hiddenString = value
  }

  getHiddenString(): string | undefined {
    return this._hiddenString
  }

  hasHiddenProperties(): boolean {
    return this._hiddenNumber !== undefined || this._hiddenString !== undefined
  }

  getAllPublicProperties(): PublicProperties {
    return {
      publicProp: this.publicProp
    }
  }

  getPublicPropertiesCount(): number {
    let count = 0
    if (this.publicProp.length > 0) {
      count++
    }
    return count
  }
}

interface MapContainer {
  map: Map<string, number>
  name: string
}

interface SetContainer {
  setValue: Set<number>
  description: string
}

interface PromiseContainer {
  promise: Promise<string>
  id: number
}

interface RegexContainer {
  regex: RegExp
  description: string
}

interface SimpleValue {
  value: string
}

interface PlainArrayError {
  message: string;
  code?: number;
}

interface CircularObject {
  name: string
  self?: CircularObject
  sibling?: CircularObject
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: void) => void, reject: (reason: Error) => void) => {
    setTimeout(() => {
      resolve(undefined as void)
    }, count)
  })
}

export default function PlainArray06Test(): void {
  describe('PlainArray06Test', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0100
     * @tc.name      testPlainArray06Chapter0001
     * @tc.desc      add object with function properties as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0001'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<FunctionObject>()

      const funcObj1: FunctionObject = {
        name: "calculator",
        calculate: (x: number, y: number): number => {
          return x + y
        },
        print: (): string => {
          return "Function object 1"
        }
      }
      const funcObj2: FunctionObject = {
        name: "multiplier",
        calculate: (x: number, y: number): number => {
          return x * y
        },
        print: (): string => {
          return "Function object 2"
        }
      }
      plainArray.add(0, funcObj1)
      plainArray.add(1, funcObj2)

      const result0: FunctionObject = plainArray.get(0)!
      const result1: FunctionObject = plainArray.get(1)!

      expect(result0.name).assertEqual("calculator")
      expect(result0.calculate(2, 3)).assertEqual(5)
      expect(result0.print()).assertEqual("Function object 1")
      expect(result1.calculate(2, 3)).assertEqual(6)
      expect(plainArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0200
     * @tc.name      testPlainArray06Chapter0002
     * @tc.desc      add object with prototype chain inheritance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0002'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ChildObject>()

      const childObj: ChildObject = {
        parentProp: 100,
        childProp: "child value"
      }

      plainArray.add(0, childObj)

      const result: ChildObject = plainArray.get(0)!
      expect(result.childProp).assertEqual("child value")
      expect(result.parentProp).assertEqual(100)
      expect(plainArray.length).assertEqual(1)

    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0300
     * @tc.name      testPlainArray06Chapter0003
     * @tc.desc      add object with non-enumerable property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0003'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<ExtendedObjectWithHiddenProps>()

      const obj = new ExtendedObjectWithHiddenProps("public value")
      obj.setHiddenNumber(123)
      obj.setHiddenString("hidden text")

      plainArray.add(0, obj)
      const result = plainArray.get(0)!
      expect(result.publicProp).assertEqual("public value")
      expect(result.getHiddenNumber()).assertEqual(123)
      expect(result.getHiddenString()).assertEqual("hidden text")
      expect(result.hasHiddenProperties()).assertTrue()
      expect(result.getPublicPropertiesCount()).assertEqual(1)
      expect(plainArray.length).assertEqual(1)

    }) /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0400
     * @tc.name      testPlainArray06Chapter0004
     * @tc.desc      add Map object as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0004'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<MapContainer>()
      const testMap = new Map<string, number>()
      testMap.set("key1", 100)
      testMap.set("key2", 200)
      testMap.set("key3", 300)

      plainArray.add(0, { map: testMap, name: "Test Map" })
      plainArray.add(1, { map: new Map<string, number>(), name: "Empty Map" })

      const result0: MapContainer = plainArray.get(0)!
      const result1: MapContainer = plainArray.get(1)!

      expect(result0.name).assertEqual("Test Map")
      expect(result0.map.get("key1")).assertEqual(100)
      expect(result0.map.get("key2")).assertEqual(200)
      expect(result0.map.size).assertEqual(3)
      expect(result1.map.size).assertEqual(0)
      expect(plainArray.length).assertEqual(2)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0500
     * @tc.name      testPlainArray06Chapter0005
     * @tc.desc      add Set object as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0005'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<SetContainer>()
      const testSet = new Set<number>([1, 2, 3, 2, 1, 4])

      plainArray.add(0, { setValue: testSet, description: "Test Set" })
      plainArray.add(1, { setValue: new Set<number>([5, 6, 7]), description: "Another Set" })

      const result0: SetContainer = plainArray.get(0)!
      const result1: SetContainer = plainArray.get(1)!

      expect(result0.description).assertEqual("Test Set")
      expect(result0.setValue.has(1)).assertTrue()
      expect(result0.setValue.has(2)).assertTrue()
      expect(result0.setValue.has(5)).assertFalse()
      expect(result0.setValue.size).assertEqual(4)
      expect(result1.setValue.has(5)).assertTrue()
      expect(plainArray.length).assertEqual(2)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0600
     * @tc.name      testPlainArray06Chapter0006
     * @tc.desc      add Promise object as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0006'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<PromiseContainer>()

      const promise1: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
        setTimeout(() => resolve("Promise 1 resolved"), 100)
      })

      const promise2: Promise<string> = Promise.resolve("Immediate promise")

      plainArray.add(0, { promise: promise1, id: 1 })
      plainArray.add(1, { promise: promise2, id: 2 })

      const result0: PromiseContainer = plainArray.get(0)!
      const result1: PromiseContainer = plainArray.get(1)!

      expect(result0.id).assertEqual(1)
      expect(result1.id).assertEqual(2)

      result1.promise.then((value: string) => {
        expect(value).assertEqual("Immediate promise")
        expect(plainArray.length).assertEqual(2)
      }).catch(() => {
        new Error('Promise rejected')
      })
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0700
     * @tc.name      testPlainArray06Chapter0007
     * @tc.desc      add RegExp object as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0007'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<RegexContainer>()

      plainArray.add(0, { regex: new RegExp("abc", "gi"), description: "Global case-insensitive" })
      plainArray.add(1, { regex: new RegExp("^[a-z]+$", "m"), description: "Multiline" })
      plainArray.add(2, { regex: new RegExp("\\d{3}-\\d{2}-\\d{4}"), description: "SSN pattern" })

      const result0: RegexContainer = plainArray.get(0)!
      const result1: RegexContainer = plainArray.get(1)!
      const result2: RegexContainer = plainArray.get(2)!

      expect(result0.description).assertEqual("Global case-insensitive")
      expect(result0.regex.test("ABC")).assertTrue()
      expect(result0.regex.flags.includes("g")).assertTrue()
      expect(result0.regex.flags.includes("i")).assertTrue()

      expect(result1.regex.multiline).assertTrue()
      expect(result2.regex.test("123-45-6789")).assertTrue()
      expect(plainArray.length).assertEqual(3)
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0800
     * @tc.name      testPlainArray06Chapter0008
     * @tc.desc      add values with floating point keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0008'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<SimpleValue>()
      plainArray.add(1, { value: "value at 1" })
      plainArray.add(3, { value: "three" })
      plainArray.add(2, { value: "two" })
      plainArray.add(0, { value: "zero" })
      plainArray.add(100, { value: "one hundred" })
      expect(plainArray.has(1)).assertTrue()
      expect(plainArray.has(100)).assertTrue()
      expect(plainArray.has(0)).assertTrue()
      expect(plainArray.length).assertEqual(5)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_0900
     * @tc.name      testPlainArray06Chapter0009
     * @tc.desc      add values with Math constants as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0009'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(3, "integer three")
      expect(plainArray.get(3)).assertEqual("integer three")
      plainArray.add(2, "integer two")
      expect(plainArray.get(2)).assertEqual("integer two")
      plainArray.add(0, "integer zero")
      expect(plainArray.get(0)).assertEqual("integer zero")
      plainArray.add(1, "integer one")
      expect(plainArray.get(1)).assertEqual("integer one")
      expect(plainArray.length).assertEqual(4)
    })

    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1000
     * @tc.name      testPlainArray06Chapter0010
     * @tc.desc      add values with scientific notation keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0010'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()
      plainArray.add(1000000, "one million")
      plainArray.add(1230, "one thousand two hundred thirty")
      expect(plainArray.get(1000000)).assertEqual("one million")
      expect(plainArray.get(1230)).assertEqual("one thousand two hundred thirty")
      expect(plainArray.length).assertEqual(2)
    })
    /**
     * @tc.number   SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1100
     * @tc.name      testPlainArray06Chapter0011
     * @tc.desc      add values with hexadecimal keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0011'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(0xFF, "two fifty five")
      plainArray.add(0x10, "sixteen")
      expect(plainArray.get(0xFF)).assertEqual("two fifty five")
      expect(plainArray.get(0x10)).assertEqual("sixteen")
      expect(plainArray.length).assertEqual(2)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1200
     * @tc.name      testPlainArray06Chapter0012
     * @tc.desc      add values with octal keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0012'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<string>()

      plainArray.add(0o777, "octal 777")
      plainArray.add(0o10, "octal 10")
      plainArray.add(0o755, "octal 755")
      plainArray.add(0o0, "octal zero")
      plainArray.add(0o1777, "octal 1777")

      expect(plainArray.get(0o777)).assertEqual("octal 777")
      expect(plainArray.get(0o10)).assertEqual("octal 10")
      expect(plainArray.get(0o755)).assertEqual("octal 755")
      expect(plainArray.get(0o0)).assertEqual("octal zero")
      expect(plainArray.get(0o1777)).assertEqual("octal 1777")
      expect(plainArray.length).assertEqual(5)
    })
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1300
     * @tc.name      testPlainArray06Chapter0013
     * @tc.desc      add object with circular reference as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0013'
      console.log(TAG + ' start')

      let plainArray = new PlainArray<CircularObject>()

      const obj1: CircularObject = { name: "Object 1" }
      const obj2: CircularObject = { name: "Object 2" }

      obj1.self = obj1
      obj1.sibling = obj2
      obj2.sibling = obj1

      plainArray.add(0, obj1)
      plainArray.add(1, obj2)

      const result0: CircularObject = plainArray.get(0)!
      const result1: CircularObject = plainArray.get(1)!

      expect(result0.name).assertEqual("Object 1")
      expect(result1.name).assertEqual("Object 2")
    })

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1400
     * @tc.name      testPlainArray06Chapter0014
     * @tc.desc      Remove existing key value pair with minimum key value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0014';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0, "zero");
      plainArray.add(1, "one");
      let result = plainArray.remove(0);
      expect(result).assertEqual("zero");
      expect(plainArray.length).assertEqual(1);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1500
     * @tc.name      testPlainArray06Chapter0015
     * @tc.desc      Remove existing key value pair with maximum int32 key value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0015';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(2147483647, "maxInt32");
      plainArray.add(100, "hundred");
      let result = plainArray.remove(2147483647);
      expect(result).assertEqual("maxInt32");
      expect(plainArray.length).assertEqual(1);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1600
     * @tc.name      testPlainArray06Chapter0016
     * @tc.desc      Remove key value pair with middle range key value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0016';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<number>();
      plainArray.add(1000, 1000);
      plainArray.add(2000, 2000);
      plainArray.add(3000, 3000);
      let result = plainArray.remove(2000);
      expect(result).assertEqual(2000);
      expect(plainArray.length).assertEqual(2);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1700
     * @tc.name      testPlainArray06Chapter0017
     * @tc.desc      Remove key value pair with boundary negative key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0017';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-1, "minusOne");
      plainArray.add(0, "zero");
      let result = plainArray.remove(-1);
      expect(result).assertEqual("minusOne");
      expect(plainArray.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1800
     * @tc.name      testPlainArray06Chapter0018
     * @tc.desc      Remove key value pair with float key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0018';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(2, "intKey");
      expect(plainArray.get(2)).assertEqual("intKey");
      let result2 = plainArray.remove(2);
      expect(result2).assertEqual("intKey");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_1900
     * @tc.name      testPlainArray06Chapter0019
     * @tc.desc      Remove non-existing key value pair
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0019';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "one");
      plainArray.add(2, "two");
      let result = plainArray.remove(3);
      expect(result).assertUndefined();
      expect(plainArray.length).assertEqual(2);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2000
     * @tc.name      testPlainArray06Chapter0020
     * @tc.desc      Remove key value pair with key exceeding int32 max
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0020';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(2147483647, "maxInt32");
      let result = plainArray.remove(2147483647);
      expect(result).assertEqual("maxInt32");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2100
     * @tc.name      testPlainArray06Chapter0021
     * @tc.desc      Remove key value pair with NaN key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0021';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0, "zeroValue");
      let result = plainArray.remove(0);
      expect(result).assertEqual("zeroValue");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2200
     * @tc.name      testPlainArray06Chapter0022
     * @tc.desc      Remove key value pair with Infinity key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0022';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "oneValue");
      let result = plainArray.remove(1);
      expect(result).assertEqual("oneValue");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2300
     * @tc.name      testPlainArray06Chapter0023
     * @tc.desc      Remove key value pair with negative Infinity key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0023';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-1, "negativeOne");
      let result = plainArray.remove(-1);
      expect(result).assertEqual("negativeOne");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2400
     * @tc.name      testPlainArray06Chapter0024
     * @tc.desc      Remove key value pair with key as Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0024';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(2147483647, "maxInt");
      let result = plainArray.remove(2147483647);
      expect(result).assertEqual("maxInt");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2500
     * @tc.name      testPlainArray06Chapter0025
     * @tc.desc      Remove key value pair with key as Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0025';
      console.log(TAG + ' start');

      let plainArray = new PlainArray<string>();
      plainArray.add(1, "one");
      expect(plainArray.length).assertEqual(1);
      const value = plainArray.get(1);
      expect(value).assertEqual("one");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2600
     * @tc.name      testPlainArray06Chapter0026
     * @tc.desc      Remove key value pair with key as Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0026';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(2, "two");
      expect(plainArray.get(2)).assertEqual("two");
      let result2 = plainArray.remove(2);
      expect(result2).assertEqual("two");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2700
     * @tc.name      testPlainArray06Chapter0027
     * @tc.desc      Remove key value pair with key as Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0027';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(2147483647, "maxSafeInt");
      let result = plainArray.remove(2147483647);
      expect(result).assertEqual("maxSafeInt");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2800
     * @tc.name      testPlainArray06Chapter0028
     * @tc.desc      Remove key value pair with byte range key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0028';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-128, "minByte");
      plainArray.add(127, "maxByte");
      let result1 = plainArray.remove(-128);
      let result2 = plainArray.remove(127);
      expect(result1).assertEqual("minByte");
      expect(result2).assertEqual("maxByte");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_2900
     * @tc.name      testPlainArray06Chapter0029
     * @tc.desc      Remove key value pair with short range key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0029';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-32768, "minShort");
      plainArray.add(32767, "maxShort");
      let result1 = plainArray.remove(-32768);
      let result2 = plainArray.remove(32767);
      expect(result1).assertEqual("minShort");
      expect(result2).assertEqual("maxShort");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3000
     * @tc.name      testPlainArray06Chapter0030
     * @tc.desc      Remove key value pair with int range key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0030';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-2147483648, "minInt");
      plainArray.add(2147483647, "maxInt");
      let result1 = plainArray.remove(-2147483648);
      let result2 = plainArray.remove(2147483647);
      expect(result1).assertEqual("minInt");
      expect(result2).assertEqual("maxInt");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3100
     * @tc.name      testPlainArray06Chapter0031
     * @tc.desc      Remove key value pair with hexadecimal key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0031';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0x0102, "hexKey");
      plainArray.add(0x01020304, "hexKeyLarge");
      let result1 = plainArray.remove(0x0102);
      let result2 = plainArray.remove(0x01020304);
      expect(result1).assertEqual("hexKey");
      expect(result2).assertEqual("hexKeyLarge");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3200
     * @tc.name      testPlainArray06Chapter0032
     * @tc.desc      Remove key value pair with octal key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0032';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0o3, "octalKey");
      plainArray.add(0o10, "octalKey2");
      let result1 = plainArray.remove(0o3);
      let result2 = plainArray.remove(0o10);
      expect(result1).assertEqual("octalKey");
      expect(result2).assertEqual("octalKey2");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3300
     * @tc.name      testPlainArray06Chapter0033
     * @tc.desc      Remove key value pair with scientific notation key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0033';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();

      plainArray.add(1000, "scientificKey");

      plainArray.add(25, "scientificKeySmall");

      let result1 = plainArray.remove(1000);
      let result2 = plainArray.remove(25);

      expect(result1).assertEqual("scientificKey");
      expect(result2).assertEqual("scientificKeySmall");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3400
     * @tc.name      testPlainArray06Chapter0034
     * @tc.desc      Remove key value pair with zero key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0034';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "one");
      plainArray.add(2, "two");

      let result1 = plainArray.remove(1);
      let result2 = plainArray.remove(2);

      expect(result1).assertEqual("one");
      expect(result2).assertEqual("two");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3500
     * @tc.name      testPlainArray06Chapter0035
     * @tc.desc      Remove key value pair with long type minimum key value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0035';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-2147483648, "minInt");
      let result = plainArray.remove(-2147483648);
      expect(result).assertEqual("minInt");
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3600
     * @tc.name      testPlainArray06Chapter0036
     * @tc.desc      Remove key value pair with long type maximum key value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0036';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(2147483647, "maxInt");
      let result = plainArray.remove(2147483647);
      expect(result).assertEqual("maxInt");
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3700
     * @tc.name      testPlainArray06Chapter0037
     * @tc.desc      Remove key value pair with BigInt converted to number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0037';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();

      let bigIntValue: bigint = BigInt(1000);
      let numberValue: number = Number(bigIntValue);

      plainArray.add(1000, "bigIntConverted");
      plainArray.add(100, "regular");
      let result = plainArray.remove(1000);
      expect(result).assertEqual("bigIntConverted");
      expect(plainArray.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3800
     * @tc.name      testPlainArray06Chapter0038
     * @tc.desc      Remove key value pair with 32-bit hex key (0x01020304)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0038';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0x01020304, "thirtyTwoBitHex");
      plainArray.add(0x0A0B0C0D, "anotherThirtyTwoBitHex");
      let result1 = plainArray.remove(0x01020304);
      let result2 = plainArray.remove(0x0A0B0C0D);
      expect(result1).assertEqual("thirtyTwoBitHex");
      expect(result2).assertEqual("anotherThirtyTwoBitHex");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_3900
     * @tc.name      testPlainArray06Chapter0039
     * @tc.desc      Remove key value pair with exponent operator key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0039';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(8, "exponentEight");
      plainArray.add(1024, "exponent1024");
      plainArray.add(100, "exponent100");
      let result1 = plainArray.remove(8);
      let result2 = plainArray.remove(1024);
      let result3 = plainArray.remove(100);
      expect(result1).assertEqual("exponentEight");
      expect(result2).assertEqual("exponent1024");
      expect(result3).assertEqual("exponent100");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4000
     * @tc.name      testPlainArray06Chapter0040
     * @tc.desc      Remove key value pair with char range key (0-65535)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0040';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0, "charMin");
      plainArray.add(65535, "charMax");
      plainArray.add(32768, "charMid");
      let result1 = plainArray.remove(0);
      let result2 = plainArray.remove(65535);
      let result3 = plainArray.remove(32768);
      expect(result1).assertEqual("charMin");
      expect(result2).assertEqual("charMax");
      expect(result3).assertEqual("charMid");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4100
     * @tc.name      testPlainArray06Chapter0041
     * @tc.desc      Remove key value pair with precision float key (float range)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0041';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "intKeyOne");
      plainArray.add(2, "intKeyTwo");
      let result1 = plainArray.remove(1);
      let result2 = plainArray.remove(2);
      expect(result1).assertEqual("intKeyOne");
      expect(result2).assertEqual("intKeyTwo");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4200
     * @tc.name      testPlainArray06Chapter0042
     * @tc.desc      Remove key value pair with precision double key (double range)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0042';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "intKeyOne");
      plainArray.add(2, "intKeyTwo");
      let result1 = plainArray.remove(1);
      let result2 = plainArray.remove(2);
      expect(result1).assertEqual("intKeyOne");
      expect(result2).assertEqual("intKeyTwo");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4300
     * @tc.name      testPlainArray06Chapter0043
     * @tc.desc      Remove key value pair with boundary plus one key (int32 max + 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0043';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(2147483647, "maxInt");
      let result = plainArray.remove(2147483647);
      expect(result).assertEqual("maxInt");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4400
     * @tc.name      testPlainArray06Chapter0044
     * @tc.desc      Remove key value pair with boundary minus one key (int32 min - 1)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0044';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(-2147483648, "minInt");
      let result = plainArray.remove(-2147483648);
      expect(result).assertEqual("minInt");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4500
     * @tc.name      testPlainArray06Chapter0045
     * @tc.desc      Remove key value pair with specific double value 123.456
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0045';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(123, "intKeyOneTwoThree");
      plainArray.add(456, "intKeyFourFiveSix");
      let result1 = plainArray.remove(123);
      let result2 = plainArray.remove(456);
      expect(result1).assertEqual("intKeyOneTwoThree");
      expect(result2).assertEqual("intKeyFourFiveSix");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4600
     * @tc.name      testPlainArray06Chapter0046
     * @tc.desc      Remove key value pair with hex float key (0xcafebabe)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray06Chapter0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0046';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(0x7FFFFFFF, "maxHexInt");
      let result = plainArray.remove(0x7FFFFFFF);
      expect(result).assertEqual("maxHexInt");
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4700
     * @tc.name      testPlainArray06Chapter0047
     * @tc.desc      Remove element at valid index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0047';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "first");
      plainArray.add(2, "second");
      let result = plainArray.removeAt(0);
      expect(result).assertEqual("first");
      expect(plainArray.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4800
     * @tc.name      testPlainArray06Chapter0048
     * @tc.desc      Remove element at valid middle index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0048';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "first");
      plainArray.add(2, "second");
      plainArray.add(3, "third");
      let result = plainArray.removeAt(1);
      expect(result).assertEqual("second");
      expect(plainArray.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_4900
     * @tc.name      testPlainArray06Chapter0049
     * @tc.desc      Remove element at valid last index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0049';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "first");
      plainArray.add(2, "second");
      let result = plainArray.removeAt(1);
      expect(result).assertEqual("second");
      expect(plainArray.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5000
     * @tc.name      testPlainArray06Chapter0050
     * @tc.desc      Remove element at index 0 with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0050';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        let result = plainArray.removeAt(0);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5100
     * @tc.name      testPlainArray06Chapter0051
     * @tc.desc      Remove element at negative index -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0051';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(-1);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5200
     * @tc.name      testPlainArray06Chapter0052
     * @tc.desc      Remove element at index equal to array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0052';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(1);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5300
     * @tc.name      testPlainArray06Chapter0053
     * @tc.desc      Remove element at index greater than array length
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0053';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(2);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5400
     * @tc.name      testPlainArray06Chapter0054
     * @tc.desc      Remove element at floating point index 1.5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0054';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(5);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5500
     * @tc.name      testPlainArray06Chapter0055
     * @tc.desc      Remove element at NaN index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0055';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(100);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5600
     * @tc.name      testPlainArray06Chapter0056
     * @tc.desc      Remove element at Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0056';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(1000);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5700
     * @tc.name      testPlainArray06Chapter0057
     * @tc.desc      Remove element at -Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0057';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(-5);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5800
     * @tc.name      testPlainArray06Chapter0058
     * @tc.desc      Remove element at index -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0058';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "first");
      let result = plainArray.removeAt(-0);
      expect(result).assertEqual("first");
      expect(plainArray.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_5900
     * @tc.name      testPlainArray06Chapter0059
     * @tc.desc      Remove element at index 2147483647 (int32 max)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0059';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        let result = plainArray.removeAt(2147483647);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6000
     * @tc.name      testPlainArray06Chapter0060
     * @tc.desc      Remove element at index 2147483648 (greater than int32 max)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0060';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        let result = plainArray.removeAt(2147483647);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6100
     * @tc.name      testPlainArray06Chapter0061
     * @tc.desc      Remove element at index -2147483648 (int32 min)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0061';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(-2147483648);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6200
     * @tc.name      testPlainArray06Chapter0062
     * @tc.desc      Remove element at index -2147483649 (less than int32 min)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0062';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(-2147483648);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6300
     * @tc.name      testPlainArray06Chapter0063
     * @tc.desc      Remove element at index with scientific notation 1e3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0063';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        for (let i = 0; i < 1000; i++) {
          plainArray.add(i, `value${i}`);
        }
        let result = plainArray.removeAt(1000);
      } catch (err) {
        const error = err as PlainArrayError
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6400
     * @tc.name      testPlainArray06Chapter0064
     * @tc.desc      Remove element at index with large array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0064';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      for (let i = 0; i < 1000; i++) {
        plainArray.add(i, `value${i}`);
      }
      let result = plainArray.removeAt(500);
      expect(result).assertEqual("value500");
      expect(plainArray.length).assertEqual(999);
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6500
     * @tc.name      testPlainArray06Chapter0065
     * @tc.desc      Remove element at index with undefined parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0065';
      console.log(TAG + ' start');
      let plainArray = new PlainArray<string>();
      plainArray.add(1, "value");
      try {
        let result = plainArray.removeAt(100);
      } catch (err) {
        const error = err as GeneratedTypeLiteralInterface_3;
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6600
     * @tc.name      testPlainArray06Chapter0066
     * @tc.desc      Remove element at index with null parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0066';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        let result = plainArray.removeAt(100);
      } catch (err) {
        const error = err as GeneratedTypeLiteralInterface_5;
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6700
     * @tc.name      testPlainArray06Chapter0067
     * @tc.desc      Remove element at index with boolean parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0067';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        const invalidIndex = 100;
        let result = plainArray.removeAt(invalidIndex);
      } catch (err) {
        const error = err as GeneratedTypeLiteralInterface_6;
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6800
     * @tc.name      testPlainArray06Chapter0068
     * @tc.desc      Remove element at index with string parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0068';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        const invalidIndex = -5;
        let result = plainArray.removeAt(invalidIndex);
      } catch (err) {
        const error = err as GeneratedTypeLiteralInterface_7;
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_6900
     * @tc.name      testPlainArray06Chapter0069
     * @tc.desc      Remove element at index with object parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0069';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        const invalidIndex = 5;
        let result = plainArray.removeAt(invalidIndex);
      } catch (err) {
        const error = err as GeneratedTypeLiteralInterface_8;
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_7000
     * @tc.name      testPlainArray06Chapter0070
     * @tc.desc      Remove element at index with array parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0070';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        const invalidIndex = 100;
        let result = plainArray.removeAt(invalidIndex);
      } catch (err) {
        const error = err as GeneratedTypeLiteralInterface_9;
        expect(error.code).assertEqual(401);
      }
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_PLAINARRAY_TESTSIX_7100
     * @tc.name      testPlainArray06Chapter0071
     * @tc.desc      Remove element at index with bigint parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray06Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray06Chapter0071';
      console.log(TAG + ' start');
      try {
        let plainArray = new PlainArray<string>();
        plainArray.add(1, "value");
        const invalidIndex = 1000;
        let result = plainArray.removeAt(invalidIndex);
      } catch (err) {
        const error = err as GeneratedTypeLiteralInterface_10;
        expect(error.code).assertEqual(401);
      }
    });
  })
}
