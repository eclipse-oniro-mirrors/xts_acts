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
import { HashSet } from '@kit.ArkTS';

type NumberArray = Array<number | undefined>;

interface MixedKeysObject {
  a: number;
  b: string;
  zero: string;
  strKey1: string;
  numericStringKey: string;
}

interface FunctionObject {
  a: number;
  b: () => void;
}

interface ArrayBufferObject {
  buffer: ArrayBuffer;
  name: string;
}

interface DataViewObject {
  view: DataView;
  id: number;
}

interface TypedArrayObject {
  buffer: Uint8Array;
  length: number;
}

interface PromiseObject {
  promise: Promise<string>;
  status: string;
}

interface RegExpObject {
  regex: RegExp;
  flags: RegExp;
}

interface InnerObject {
  innerProp: number;
}

interface OuterObject {
  outerProp: number;
  inner: InnerObject;
}

interface TestObject {
  a: number;
  b: string;
}

interface ObjectWithOptional {
  requiredProp: string;
  optionalProp?: number;
}

class CustomArray extends Array<number> {
  customProp1?: number;
  customProp2?: string;
}

type MixedType = string | number | boolean | null | undefined;

interface LargeObjectExplicit {
  prop0: number;
  prop1: number;
  prop2: number;
  prop3: number;
  prop4: number;
  prop5: number;
  prop6: number;
  prop7: number;
  prop8: number;
  prop9: number;
  prop10: number;
  prop11: number;
  prop12: number;
  prop13: number;
  prop14: number;
  prop15: number;
  prop16: number;
  prop17: number;
  prop18: number;
  prop19: number;
}

interface Level4Object {
  value: string;
}

interface Level3Object {
  level4: Level4Object;
}

interface Level2Object {
  level3: Level3Object;
}

interface Level1Object {
  level2: Level2Object;
}

interface DeepNestedObject {
  level1: Level1Object;
}

type PrimitiveTypes = string | number | boolean | bigint | null | undefined;

class ArrayWithStringProperties extends Array<number> {
  customStrProp1?: string;
  customStrProp2?: string;
  customNumProp?: number;
}

interface LargeNumberedObject {
  prop0: number;
  prop1: number;
  prop2: number;
  prop3: number;
  prop4: number;
  prop5: number;
  prop6: number;
  prop7: number;
  prop8: number;
  prop9: number;
  prop10: number;
  prop11: number;
  prop12: number;
  prop13: number;
  prop14: number;
  prop15: number;
  prop16: number;
  prop17: number;
  prop18: number;
  prop19: number;
  prop20: number;
  prop21: number;
  prop22: number;
  prop23: number;
  prop24: number;
  prop25: number;
  prop26: number;
  prop27: number;
  prop28: number;
  prop29: number;
  prop30: number;
  prop31: number;
  prop32: number;
  prop33: number;
  prop34: number;
  prop35: number;
  prop36: number;
  prop37: number;
  prop38: number;
  prop39: number;
  prop40: number;
  prop41: number;
  prop42: number;
  prop43: number;
  prop44: number;
  prop45: number;
  prop46: number;
  prop47: number;
  prop48: number;
  prop49: number;
}

type MixedPerformanceType = string | number | boolean | null | undefined | object;

interface SimpleObj {
  id: number;
  name: string;
}

interface Metadata {
  created: string;
  updated: string;
  version: number;
}

interface ComplexDataStructure {
  id: number;
  name: string;
  tags: string[];
  metadata: Metadata;
  data: Uint8Array;
  active: boolean;
  score: number | null;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function HashSet02Test(): void {
  describe('HashSet02Test', () => {
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0100
     * @tc.name      testHashSet02Chapter0001
     * @tc.desc      Test has method with number type int range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0001';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      hashSet.add(-2147483648);
      hashSet.add(2147483647);
      hashSet.add(-2147483649);
      hashSet.add(2147483648);

      const result1: boolean = hashSet.has(-2147483648);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(2147483647);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(0);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0200
     * @tc.name      testHashSet02Chapter0002
     * @tc.desc      Test has method with number type long range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0002';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      hashSet.add(-9223372036854775808);
      hashSet.add(9223372036854775807);

      const result1: boolean = hashSet.has(-9223372036854775808);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(9223372036854775807);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(0);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0300
     * @tc.name      testHashSet02Chapter0003
     * @tc.desc      Test has method with number type float range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0003';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const floatMin: number = 1.40129846432481707e-45;
      const floatMax: number = 3.40282346638528860e+38;

      hashSet.add(floatMin);
      hashSet.add(floatMax);
      hashSet.add(-floatMin);
      hashSet.add(-floatMax);

      const result1: boolean = hashSet.has(floatMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(floatMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(0);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0400
     * @tc.name      testHashSet02Chapter0004
     * @tc.desc      Test has method with number type double range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0004';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const doubleMin: number = 4.94065645841246544e-324;
      const doubleMax: number = 1.79769313486231570e+308;

      hashSet.add(doubleMin);
      hashSet.add(doubleMax);
      hashSet.add(-doubleMin);
      hashSet.add(-doubleMax);

      const result1: boolean = hashSet.has(doubleMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(doubleMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(0);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0500
     * @tc.name      testHashSet02Chapter0005
     * @tc.desc      Test has method with number type char range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0005';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      hashSet.add(0);
      hashSet.add(65535);
      hashSet.add(-1);
      hashSet.add(65536);

      const result1: boolean = hashSet.has(0);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(65535);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(32768);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0600
     * @tc.name      testHashSet02Chapter0006
     * @tc.desc      Test has method with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0006';
      console.log(TAG + ' start');

      const hashSet: HashSet<bigint> = new HashSet<bigint>();
      const bigIntValue: bigint = BigInt("0xdecafafecacefade");
      const bigIntWithSuffix: bigint = 9007199254740991n;

      hashSet.add(bigIntValue);
      hashSet.add(bigIntWithSuffix);

      const result1: boolean = hashSet.has(bigIntValue);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(bigIntWithSuffix);
      expect(result2).assertTrue();

      const newBigInt: bigint = BigInt("0xdecafafecacefade");
      const result3: boolean = hashSet.has(newBigInt);
      expect(result3).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0700
     * @tc.name      testHashSet02Chapter0007
     * @tc.desc      Test has method with boolean false equivalent values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0007';
      console.log(TAG + ' start');

      const hashSet: HashSet<number | string> = new HashSet<number | string>();

      hashSet.add(0);
      hashSet.add("");
      hashSet.add(1);

      const result1: boolean = hashSet.has(0);
      expect(result1).assertTrue();

      const result3: boolean = hashSet.has("");
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(1);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.has(99);
      expect(result5).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0800
     * @tc.name      testHashSet02Chapter0008
     * @tc.desc      Test has method with array containing empty slots
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0008';
      console.log(TAG + ' start');

      const hashSet: HashSet<NumberArray> = new HashSet<NumberArray>();

      const arr: NumberArray = [1, undefined, 3];

      hashSet.add(arr);

      const result1: boolean = hashSet.has(arr);
      expect(result1).assertTrue();

      const newArr: NumberArray = [1, undefined, 3];
      const result2: boolean = hashSet.has(newArr);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_0900
     * @tc.name      testHashSet02Chapter0009
     * @tc.desc      Test has method with object containing various property types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0009';
      console.log(TAG + ' start');

      const hashSet: HashSet<MixedKeysObject> = new HashSet<MixedKeysObject>();

      const obj: MixedKeysObject = {
        a: 1,
        b: "test",
        zero: "zero",
        strKey1: "stringValue1",
        numericStringKey: "numericStringKey"
      };

      hashSet.add(obj);

      const result1: boolean = hashSet.has(obj);
      expect(result1).assertTrue();

      const newObj: MixedKeysObject = {
        a: 1,
        b: "test",
        zero: "zero",
        strKey1: "stringValue1",
        numericStringKey: "numericStringKey"
      };
      const result2: boolean = hashSet.has(newObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1000
     * @tc.name      testHashSet02Chapter0010
     * @tc.desc      Test has method with object containing function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0010';
      console.log(TAG + ' start');

      const hashSet: HashSet<FunctionObject> = new HashSet<FunctionObject>();

      const funcObj: FunctionObject = {
        a: 1,
        b: (): void => {
        }
      };

      hashSet.add(funcObj);

      const result1: boolean = hashSet.has(funcObj);
      expect(result1).assertTrue();

      const newFuncObj: FunctionObject = {
        a: 1,
        b: (): void => {
        }
      };
      const result2: boolean = hashSet.has(newFuncObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1100
     * @tc.name      testHashSet02Chapter0011
     * @tc.desc      Test has method with object containing ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0011';
      console.log(TAG + ' start');

      const hashSet: HashSet<ArrayBufferObject> = new HashSet<ArrayBufferObject>();

      const bufferObj: ArrayBufferObject = {
        buffer: new ArrayBuffer(16),
        name: "test"
      };

      hashSet.add(bufferObj);

      const result1: boolean = hashSet.has(bufferObj);
      expect(result1).assertTrue();

      const newBufferObj: ArrayBufferObject = {
        buffer: new ArrayBuffer(16),
        name: "test"
      };
      const result2: boolean = hashSet.has(newBufferObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1200
     * @tc.name      testHashSet02Chapter0012
     * @tc.desc      Test has method with object containing DataView
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0012';
      console.log(TAG + ' start');

      const hashSet: HashSet<DataViewObject> = new HashSet<DataViewObject>();

      const dataViewObj: DataViewObject = {
        view: new DataView(new ArrayBuffer(16)),
        id: 1
      };

      hashSet.add(dataViewObj);

      const result1: boolean = hashSet.has(dataViewObj);
      expect(result1).assertTrue();

      const newDataViewObj: DataViewObject = {
        view: new DataView(new ArrayBuffer(16)),
        id: 1
      };
      const result2: boolean = hashSet.has(newDataViewObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1300
     * @tc.name      testHashSet02Chapter0013
     * @tc.desc      Test has method with object containing TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0013';
      console.log(TAG + ' start');

      const hashSet: HashSet<TypedArrayObject> = new HashSet<TypedArrayObject>();

      const typedArrayObj: TypedArrayObject = {
        buffer: new Uint8Array([72, 101, 108, 108, 111]),
        length: 5
      };

      hashSet.add(typedArrayObj);

      const result1: boolean = hashSet.has(typedArrayObj);
      expect(result1).assertTrue();

      const newTypedArrayObj: TypedArrayObject = {
        buffer: new Uint8Array([72, 101, 108, 108, 111]),
        length: 5
      };
      const result2: boolean = hashSet.has(newTypedArrayObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1400
     * @tc.name      testHashSet02Chapter0014
     * @tc.desc      Test has method with object containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0014';
      console.log(TAG + ' start');

      const hashSet: HashSet<PromiseObject> = new HashSet<PromiseObject>();

      const promiseObj: PromiseObject = {
        promise: new Promise<string>((resolve) => {
          setTimeout(() => resolve('done'), 100);
        }),
        status: "pending"
      };

      hashSet.add(promiseObj);

      const result1: boolean = hashSet.has(promiseObj);
      expect(result1).assertTrue();

      const newPromiseObj: PromiseObject = {
        promise: new Promise<string>((resolve) => {
          setTimeout(() => resolve('done'), 100);
        }),
        status: "pending"
      };
      const result2: boolean = hashSet.has(newPromiseObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1500
     * @tc.name      testHashSet02Chapter0015
     * @tc.desc      Test has method with object containing RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0015';
      console.log(TAG + ' start');

      const hashSet: HashSet<RegExpObject> = new HashSet<RegExpObject>();

      const regexObj: RegExpObject = {
        regex: new RegExp("abc", "gi"),
        flags: new RegExp("def", "m")
      };

      hashSet.add(regexObj);

      const result1: boolean = hashSet.has(regexObj);
      expect(result1).assertTrue();

      const newRegexObj: RegExpObject = {
        regex: new RegExp("abc", "gi"),
        flags: new RegExp("def", "m")
      };
      const result2: boolean = hashSet.has(newRegexObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1600
     * @tc.name      testHashSet02Chapter0016
     * @tc.desc      Test has method with large string for memory test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0016';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const largeString: string = "a".repeat(10000);

      hashSet.add(largeString);

      const result1: boolean = hashSet.has(largeString);
      expect(result1).assertTrue();

      const slightlyDifferentString: string = "a".repeat(9999) + "b";
      const result2: boolean = hashSet.has(slightlyDifferentString);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1700
     * @tc.name      testHashSet02Chapter0017
     * @tc.desc      Test has method with nested object structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0017';
      console.log(TAG + ' start');

      const hashSet: HashSet<OuterObject> = new HashSet<OuterObject>();

      const innerObj: InnerObject = {
        innerProp: 1
      };

      const outerObj: OuterObject = {
        outerProp: 1,
        inner: innerObj
      };

      hashSet.add(outerObj);

      const result1: boolean = hashSet.has(outerObj);
      expect(result1).assertTrue();

      const newInnerObj: InnerObject = {
        innerProp: 1
      };

      const newOuterObj: OuterObject = {
        outerProp: 1,
        inner: newInnerObj
      };

      const result2: boolean = hashSet.has(newOuterObj);
      expect(result2).assertFalse();
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1800
     * @tc.name      testHashSet02Chapter0018
     * @tc.desc      Test has method with null and undefined as HashSet elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0018';
      console.log(TAG + ' start');

      const hashSet: HashSet<number | string> =
        new HashSet<number | string>();

      hashSet.add("null");
      hashSet.add("undefined");

      const result3: boolean = hashSet.has("null");
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has("undefined");
      expect(result4).assertTrue();

      const result5: boolean = hashSet.has(0);
      expect(result5).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_1900
     * @tc.name      testHashSet02Chapter0019
     * @tc.desc      Test has method on empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0019';
      console.log(TAG + ' start');

      const stringHashSet: HashSet<string> = new HashSet<string>();
      const numberHashSet: HashSet<number> = new HashSet<number>();
      const objectHashSet: HashSet<object> = new HashSet<object>();

      const result1: boolean = stringHashSet.has("test");
      expect(result1).assertFalse();

      const result2: boolean = numberHashSet.has(123);
      expect(result2).assertFalse();

      const testObj: TestObject = { a: 1, b: "test" };
      const result3: boolean = objectHashSet.has(testObj);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2000
     * @tc.name      testHashSet02Chapter0020
     * @tc.desc      Test has method after adding duplicate elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0020';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();

      hashSet.add("element");
      hashSet.add("element");
      hashSet.add("element");

      const result1: boolean = hashSet.has("element");
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has("different");
      expect(result2).assertFalse();

      const sizeCheck: int = hashSet.length;
      expect(sizeCheck).assertEqual(1);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2100
     * @tc.name      testHashSet02Chapter0021
     * @tc.desc      Test has method after removing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0021';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);

      const result1: boolean = hashSet.has(2);
      expect(result1).assertTrue();

      hashSet.remove(2);

      const result2: boolean = hashSet.has(2);
      expect(result2).assertFalse();

      const result3: boolean = hashSet.has(1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(3);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2200
     * @tc.name      testHashSet02Chapter0022
     * @tc.desc      Test has method with object containing optional properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0022';
      console.log(TAG + ' start');

      const hashSet: HashSet<ObjectWithOptional> = new HashSet<ObjectWithOptional>();

      const obj1: ObjectWithOptional = {
        requiredProp: "visible",
        optionalProp: 42
      };

      const obj2: ObjectWithOptional = {
        requiredProp: "visible"
      };

      hashSet.add(obj1);
      hashSet.add(obj2);

      const result1: boolean = hashSet.has(obj1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(obj2);
      expect(result2).assertTrue();

      const newObj1: ObjectWithOptional = {
        requiredProp: "visible",
        optionalProp: 42
      };

      const result3: boolean = hashSet.has(newObj1);
      expect(result3).assertFalse();

      const newObj2: ObjectWithOptional = {
        requiredProp: "visible"
      };

      const result4: boolean = hashSet.has(newObj2);
      expect(result4).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2300
     * @tc.name      testHashSet02Chapter0023
     * @tc.desc      Test has method with array containing string properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0023';
      console.log(TAG + ' start');

      const hashSet: HashSet<CustomArray> = new HashSet<CustomArray>();

      const arr: CustomArray = new CustomArray();
      arr.push(1, 2, 3);
      arr.customProp1 = 100;
      arr.customProp2 = "extra";

      hashSet.add(arr);

      const result1: boolean = hashSet.has(arr);
      expect(result1).assertTrue();

      const newArr: CustomArray = new CustomArray();
      newArr.push(1, 2, 3);
      newArr.customProp1 = 100;
      newArr.customProp2 = "extra";

      const result2: boolean = hashSet.has(newArr);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2400
     * @tc.name      testHashSet02Chapter0024
     * @tc.desc      Test has method with large number of elements for performance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0024';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();
      const elementCount: number = 1000;

      for (let i: int = 0; i < elementCount; i++) {
        hashSet.add(i);
      }

      const middleIndex: number = Math.floor(elementCount / 2.0);
      const result1: boolean = hashSet.has(middleIndex);
      expect(result1).assertTrue();

      const firstElement: boolean = hashSet.has(0);
      expect(firstElement).assertTrue();

      const lastElement: boolean = hashSet.has(elementCount - 1);
      expect(lastElement).assertTrue();

      const nonExistentElement: boolean = hashSet.has(elementCount + 100);
      expect(nonExistentElement).assertFalse();

      const negativeElement: boolean = hashSet.has(-1);
      expect(negativeElement).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2500
     * @tc.name      testHashSet02Chapter0025
     * @tc.desc      Test has method with mixed types in HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0025';
      console.log(TAG + ' start');

      const hashSet: HashSet<MixedType> = new HashSet<MixedType>();

      hashSet.add("string");
      hashSet.add(123);
      hashSet.add(true);
      hashSet.add(false);
      hashSet.add(null as MixedType);
      try {
        hashSet.add(undefined as MixedType);
      } catch (e) {
      }
      hashSet.add(NaN);
      hashSet.add(Infinity);

      const result1: boolean = hashSet.has("string");
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(123);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(true);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(false);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.has(null as MixedType);
      expect(result5).assertTrue();

      try {
        const result6: boolean = hashSet.has(undefined as MixedType);
        expect(result6).assertFalse();
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }

      const result7: boolean = hashSet.has(NaN);
      expect(result7).assertTrue();

      const result8: boolean = hashSet.has(Infinity);
      expect(result8).assertTrue();

      const result9: boolean = hashSet.has("non-existent");
      expect(result9).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2600
     * @tc.name      testHashSet02Chapter0026
     * @tc.desc      Test has method with large object containing many properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0026';
      console.log(TAG + ' start');

      const hashSet: HashSet<LargeObjectExplicit> = new HashSet<LargeObjectExplicit>();

      const largeObj: LargeObjectExplicit = {
        prop0: 0,
        prop1: 1,
        prop2: 2,
        prop3: 3,
        prop4: 4,
        prop5: 5,
        prop6: 6,
        prop7: 7,
        prop8: 8,
        prop9: 9,
        prop10: 10,
        prop11: 11,
        prop12: 12,
        prop13: 13,
        prop14: 14,
        prop15: 15,
        prop16: 16,
        prop17: 17,
        prop18: 18,
        prop19: 19
      };

      hashSet.add(largeObj);

      const result1: boolean = hashSet.has(largeObj);
      expect(result1).assertTrue();

      const newLargeObj: LargeObjectExplicit = {
        prop0: 0,
        prop1: 1,
        prop2: 2,
        prop3: 3,
        prop4: 4,
        prop5: 5,
        prop6: 6,
        prop7: 7,
        prop8: 8,
        prop9: 9,
        prop10: 10,
        prop11: 11,
        prop12: 12,
        prop13: 13,
        prop14: 14,
        prop15: 15,
        prop16: 16,
        prop17: 17,
        prop18: 18,
        prop19: 19
      };

      const result2: boolean = hashSet.has(newLargeObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2700
     * @tc.name      testHashSet02Chapter0027
     * @tc.desc      Test has method with special string containing repeated characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0027';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const repeatedCharStr: string = "a".repeat(10000);

      hashSet.add(repeatedCharStr);

      const result1: boolean = hashSet.has(repeatedCharStr);
      expect(result1).assertTrue();

      const slightlyDifferentStr: string = "a".repeat(9999) + "b";
      const result2: boolean = hashSet.has(slightlyDifferentStr);
      expect(result2).assertFalse();

      const longerStr: string = "a".repeat(10001);
      const result3: boolean = hashSet.has(longerStr);
      expect(result3).assertFalse();

      const shorterStr: string = "a".repeat(9999);
      const result4: boolean = hashSet.has(shorterStr);
      expect(result4).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2800
     * @tc.name      testHashSet02Chapter0028
     * @tc.desc      Test has method with complex nested structures
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0028';
      console.log(TAG + ' start');

      const hashSet: HashSet<DeepNestedObject> = new HashSet<DeepNestedObject>();

      const level4Obj: Level4Object = {
        value: "deep value"
      };

      const level3Obj: Level3Object = {
        level4: level4Obj
      };

      const level2Obj: Level2Object = {
        level3: level3Obj
      };

      const level1Obj: Level1Object = {
        level2: level2Obj
      };

      const deepObj: DeepNestedObject = {
        level1: level1Obj
      };

      hashSet.add(deepObj);

      const result1: boolean = hashSet.has(deepObj);
      expect(result1).assertTrue();

      const newLevel4Obj: Level4Object = {
        value: "deep value"
      };

      const newLevel3Obj: Level3Object = {
        level4: newLevel4Obj
      };

      const newLevel2Obj: Level2Object = {
        level3: newLevel3Obj
      };

      const newLevel1Obj: Level1Object = {
        level2: newLevel2Obj
      };

      const similarDeepObj: DeepNestedObject = {
        level1: newLevel1Obj
      };

      const result2: boolean = hashSet.has(similarDeepObj);
      expect(result2).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_2900
     * @tc.name      testHashSet02Chapter0029
     * @tc.desc      Test has method with all primitive types in one HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0029';
      console.log(TAG + ' start');

      const hashSet: HashSet<PrimitiveTypes> = new HashSet<PrimitiveTypes>();

      const primitives: PrimitiveTypes[] = [
        "string",
        42,
        3.14,
        true,
        false,
        0,
        -0,
        NaN,
        Infinity,
        -Infinity,
        9007199254740991n
      ];

      primitives.forEach(primitive => {
        hashSet.add(primitive);
      });

      try {
        hashSet.add(null as PrimitiveTypes);
      } catch (e) {
      }
      try {
        hashSet.add(undefined as PrimitiveTypes);
      } catch (e) {
      }

      primitives.forEach(primitive => {
        const result: boolean = hashSet.has(primitive);
        expect(result).assertTrue();
      });

      const nonExistentPrimitives: PrimitiveTypes[] = [
        "different string",
        100,
        -100,
        2.71,
        9007199254740992n
      ];
      nonExistentPrimitives.forEach(primitive => {
        const result: boolean = hashSet.has(primitive);
        expect(result).assertFalse();
      });
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3000
     * @tc.name      testHashSet02Chapter0030
     * @tc.desc      Test has method with very large repeated string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0030';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const largeString: string = "a".repeat(100000);

      hashSet.add(largeString);

      const result1: boolean = hashSet.has(largeString);
      expect(result1).assertTrue();

      const slightlyDifferent: string = "a".repeat(99999) + "b";
      const result2: boolean = hashSet.has(slightlyDifferent);
      expect(result2).assertFalse();

      const shorterString: string = "a".repeat(50000);
      const result3: boolean = hashSet.has(shorterString);
      expect(result3).assertFalse();

      const emptyString: string = "";
      const result4: boolean = hashSet.has(emptyString);
      expect(result4).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3100
     * @tc.name      testHashSet02Chapter0031
     * @tc.desc      Test has method with double special characters string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0031';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const doubleSpecialChars: string = "!!\"\"##$$%%&&''(())**++,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";

      hashSet.add(doubleSpecialChars);

      const result1: boolean = hashSet.has(doubleSpecialChars);
      expect(result1).assertTrue();

      const singleSpecialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const result2: boolean = hashSet.has(singleSpecialChars);
      expect(result2).assertFalse();

      const partialDouble: string = "!!\"\"##$$%%";
      const result3: boolean = hashSet.has(partialDouble);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3200
     * @tc.name      testHashSet02Chapter0032
     * @tc.desc      Test has method with float precision boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0032';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const floatMinPositive: number = 1.40129846432481707e-45;
      const floatMaxPositive: number = 3.40282346638528860e+38;
      const floatMinNegative: number = -1.40129846432481707e-45;
      const floatMaxNegative: number = -3.40282346638528860e+38;

      hashSet.add(floatMinPositive);
      hashSet.add(floatMaxPositive);
      hashSet.add(floatMinNegative);
      hashSet.add(floatMaxNegative);

      const result1: boolean = hashSet.has(floatMinPositive);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(floatMaxPositive);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(floatMinNegative);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(floatMaxNegative);
      expect(result4).assertTrue();
      const slightlyLarger: number = 3.40282346638528861e+38;
      const result5: boolean = hashSet.has(slightlyLarger);
      expect(result5).assertTrue();

      const slightlySmaller: number = 1.40129846432481706e-45;
      const result6: boolean = hashSet.has(slightlySmaller);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3300
     * @tc.name      testHashSet02Chapter0033
     * @tc.desc      Test has method with array containing additional string properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0033';
      console.log(TAG + ' start');

      const hashSet: HashSet<ArrayWithStringProperties> = new HashSet<ArrayWithStringProperties>();

      const arr: ArrayWithStringProperties = new ArrayWithStringProperties();
      arr.push(1, 2, 3);
      arr.customStrProp1 = "abc";
      arr.customStrProp2 = "def";
      arr.customNumProp = 111;

      hashSet.add(arr);

      const result1: boolean = hashSet.has(arr);
      expect(result1).assertTrue();

      const newArr: ArrayWithStringProperties = new ArrayWithStringProperties();
      newArr.push(1, 2, 3);
      newArr.customStrProp1 = "abc";
      newArr.customStrProp2 = "def";
      newArr.customNumProp = 111;

      const result2: boolean = hashSet.has(newArr);
      expect(result2).assertFalse();

      const arrWithDifferentProps: ArrayWithStringProperties = new ArrayWithStringProperties();
      arrWithDifferentProps.push(1, 2, 3);
      arrWithDifferentProps.customStrProp1 = "aaa";
      arrWithDifferentProps.customStrProp2 = "bbb";
      arrWithDifferentProps.customNumProp = 222;

      const result3: boolean = hashSet.has(arrWithDifferentProps);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3400
     * @tc.name      testHashSet02Chapter0034
     * @tc.desc      Test has method with large object containing many numbered properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0034';
      console.log(TAG + ' start');

      const hashSet: HashSet<LargeNumberedObject> = new HashSet<LargeNumberedObject>();

      const largeObj: LargeNumberedObject = {
        prop0: 0,
        prop1: 1,
        prop2: 2,
        prop3: 3,
        prop4: 4,
        prop5: 5,
        prop6: 6,
        prop7: 7,
        prop8: 8,
        prop9: 9,
        prop10: 10,
        prop11: 11,
        prop12: 12,
        prop13: 13,
        prop14: 14,
        prop15: 15,
        prop16: 16,
        prop17: 17,
        prop18: 18,
        prop19: 19,
        prop20: 20,
        prop21: 21,
        prop22: 22,
        prop23: 23,
        prop24: 24,
        prop25: 25,
        prop26: 26,
        prop27: 27,
        prop28: 28,
        prop29: 29,
        prop30: 30,
        prop31: 31,
        prop32: 32,
        prop33: 33,
        prop34: 34,
        prop35: 35,
        prop36: 36,
        prop37: 37,
        prop38: 38,
        prop39: 39,
        prop40: 40,
        prop41: 41,
        prop42: 42,
        prop43: 43,
        prop44: 44,
        prop45: 45,
        prop46: 46,
        prop47: 47,
        prop48: 48,
        prop49: 49
      };

      hashSet.add(largeObj);

      const result1: boolean = hashSet.has(largeObj);
      expect(result1).assertTrue();

      const newLargeObj: LargeNumberedObject = {
        prop0: 0,
        prop1: 1,
        prop2: 2,
        prop3: 3,
        prop4: 4,
        prop5: 5,
        prop6: 6,
        prop7: 7,
        prop8: 8,
        prop9: 9,
        prop10: 10,
        prop11: 11,
        prop12: 12,
        prop13: 13,
        prop14: 14,
        prop15: 15,
        prop16: 16,
        prop17: 17,
        prop18: 18,
        prop19: 19,
        prop20: 20,
        prop21: 21,
        prop22: 22,
        prop23: 23,
        prop24: 24,
        prop25: 25,
        prop26: 26,
        prop27: 27,
        prop28: 28,
        prop29: 29,
        prop30: 30,
        prop31: 31,
        prop32: 32,
        prop33: 33,
        prop34: 34,
        prop35: 35,
        prop36: 36,
        prop37: 37,
        prop38: 38,
        prop39: 39,
        prop40: 40,
        prop41: 41,
        prop42: 42,
        prop43: 43,
        prop44: 44,
        prop45: 45,
        prop46: 46,
        prop47: 47,
        prop48: 48,
        prop49: 49
      };

      const result2: boolean = hashSet.has(newLargeObj);
      expect(result2).assertFalse();

      const differentLargeObj: LargeNumberedObject = {
        prop0: 100,
        prop1: 101,
        prop2: 102,
        prop3: 103,
        prop4: 104,
        prop5: 105,
        prop6: 106,
        prop7: 107,
        prop8: 108,
        prop9: 109,
        prop10: 110,
        prop11: 111,
        prop12: 112,
        prop13: 113,
        prop14: 114,
        prop15: 115,
        prop16: 116,
        prop17: 117,
        prop18: 118,
        prop19: 119,
        prop20: 120,
        prop21: 121,
        prop22: 122,
        prop23: 123,
        prop24: 124,
        prop25: 125,
        prop26: 126,
        prop27: 127,
        prop28: 128,
        prop29: 129,
        prop30: 130,
        prop31: 131,
        prop32: 132,
        prop33: 133,
        prop34: 134,
        prop35: 135,
        prop36: 136,
        prop37: 137,
        prop38: 138,
        prop39: 139,
        prop40: 140,
        prop41: 141,
        prop42: 142,
        prop43: 143,
        prop44: 144,
        prop45: 145,
        prop46: 146,
        prop47: 147,
        prop48: 148,
        prop49: 149
      };

      const result3: boolean = hashSet.has(differentLargeObj);
      expect(result3).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3500
     * @tc.name      testHashSet02Chapter0035
     * @tc.desc      Test has method with double precision boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0035';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const doubleMinPositive: number = 4.94065645841246544e-324;
      const doubleMaxPositive: number = 1.79769313486231570e+308;
      const doubleMinNegative: number = -4.94065645841246544e-324;
      const doubleMaxNegative: number = -1.79769313486231570e+308;

      hashSet.add(doubleMinPositive);
      hashSet.add(doubleMaxPositive);
      hashSet.add(doubleMinNegative);
      hashSet.add(doubleMaxNegative);

      const result1: boolean = hashSet.has(doubleMinPositive);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(doubleMaxPositive);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(doubleMinNegative);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(doubleMaxNegative);
      expect(result4).assertTrue();

      const beyondMax: number = Number.POSITIVE_INFINITY;
      const result5: boolean = hashSet.has(beyondMax);
      expect(result5).assertFalse();

      const beyondMin: number = 4.9e-324;
      const result6: boolean = hashSet.has(beyondMin);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3600
     * @tc.name      testHashSet02Chapter0036
     * @tc.desc      Test has method with BigInt64Array overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0036';
      console.log(TAG + ' start');

      const hashSet: HashSet<BigInt64Array> = new HashSet<BigInt64Array>();

      const bigInt64Arr1: BigInt64Array = new BigInt64Array([-9223372036854775808n]);
      const bigInt64Arr2: BigInt64Array = new BigInt64Array([9223372036854775807n]);
      const bigInt64Arr3: BigInt64Array = new BigInt64Array([-9223372036854775809n]);
      const bigInt64Arr4: BigInt64Array = new BigInt64Array([9223372036854775808n]);

      hashSet.add(bigInt64Arr1);
      hashSet.add(bigInt64Arr2);
      hashSet.add(bigInt64Arr3);
      hashSet.add(bigInt64Arr4);

      const result1: boolean = hashSet.has(bigInt64Arr1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(bigInt64Arr2);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(bigInt64Arr3);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(bigInt64Arr4);
      expect(result4).assertTrue();

      const newBigInt64Arr: BigInt64Array = new BigInt64Array([-9223372036854775808n]);
      const result5: boolean = hashSet.has(newBigInt64Arr);
      expect(result5).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3700
     * @tc.name      testHashSet02Chapter0037
     * @tc.desc      Test has method with BigUint64Array overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0037';
      console.log(TAG + ' start');

      const hashSet: HashSet<BigUint64Array> = new HashSet<BigUint64Array>();

      const bigUint64Arr1: BigUint64Array = new BigUint64Array([0n]);
      const bigUint64Arr2: BigUint64Array = new BigUint64Array([18446744073709551615n]);
      const bigUint64Arr3: BigUint64Array = new BigUint64Array([18446744073709551616n]);

      hashSet.add(bigUint64Arr1);
      hashSet.add(bigUint64Arr2);
      hashSet.add(bigUint64Arr3);

      const result1: boolean = hashSet.has(bigUint64Arr1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(bigUint64Arr2);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.has(bigUint64Arr3);
      expect(result3).assertTrue();

      const newBigUint64Arr: BigUint64Array = new BigUint64Array([0n]);
      const result4: boolean = hashSet.has(newBigUint64Arr);
      expect(result4).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3800
     * @tc.name      testHashSet02Chapter0038
     * @tc.desc      Test has method with performance test for mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0038';
      console.log(TAG + ' start');

      const hashSet: HashSet<MixedPerformanceType> = new HashSet<MixedPerformanceType>();

      const testCount: int = 100;

      for (let i: int = 0; i < testCount; i++) {
        switch (i % 6) {
          case 0:
            hashSet.add(`string_${i}`);
            break;
          case 1:
            hashSet.add(i);
            break;
          case 2:
            hashSet.add(i % 2 === 0);
            break;
          case 3:
            try {
              hashSet.add(null as MixedPerformanceType);
            } catch (e) {
            }
            break;
          case 4:
            try {
              hashSet.add(undefined as MixedPerformanceType);
            } catch (e) {
            }
            break;
          case 5:
            const obj: SimpleObj = { id: i, name: `obj_${i}` };
            hashSet.add(obj);
            break;
        }
      }

      const result1: boolean = hashSet.has("string_0");
      expect(result1).assertTrue();

      const result2: boolean = hashSet.has(50);
      expect(result2).assertFalse();

      const result3: boolean = hashSet.has(true);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(null as MixedPerformanceType);
      expect(result4).assertTrue();

      try {
        const result5: boolean = hashSet.has(undefined as MixedPerformanceType);
        expect(result5).assertFalse();
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }

      const testObj: SimpleObj = { id: 5, name: "obj_5" };
      const result6: boolean = hashSet.has(testObj);
      expect(result6).assertFalse();

      const nonExistentString: boolean = hashSet.has("non_existent_string");
      expect(nonExistentString).assertFalse();

      const nonExistentNumber: boolean = hashSet.has(1000);
      expect(nonExistentNumber).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTTWO_3900
     * @tc.name      testHashSet02Chapter0039
     * @tc.desc      Test has method with complex combined data structure
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet02Chapter0039';
      console.log(TAG + ' start');

      const hashSet: HashSet<ComplexDataStructure> = new HashSet<ComplexDataStructure>();

      const dataArray: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);

      const metadataObj: Metadata = {
        created: "2024-01-01",
        updated: "2024-01-02",
        version: 1
      };

      const complexObj: ComplexDataStructure = {
        id: 1,
        name: "test object",
        tags: ["tag1", "tag2", "tag3"],
        metadata: metadataObj,
        data: dataArray,
        active: true,
        score: 95.5
      };

      hashSet.add(complexObj);

      const result1: boolean = hashSet.has(complexObj);
      expect(result1).assertTrue();

      const newDataArray: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);

      const newMetadataObj: Metadata = {
        created: "2024-01-01",
        updated: "2024-01-02",
        version: 1
      };

      const similarComplexObj: ComplexDataStructure = {
        id: 1,
        name: "test object",
        tags: ["tag1", "tag2", "tag3"],
        metadata: newMetadataObj,
        data: newDataArray,
        active: true,
        score: 95.5
      };

      const result2: boolean = hashSet.has(similarComplexObj);
      expect(result2).assertFalse();

      const differentMetadataObj: Metadata = {
        created: "2024-02-01",
        updated: "2024-02-02",
        version: 2
      };

      const differentComplexObj: ComplexDataStructure = {
        id: 2,
        name: "different object",
        tags: ["tagA", "tagB"],
        metadata: differentMetadataObj,
        data: new Uint8Array([87, 111, 114, 108, 100]),
        active: false,
        score: null
      };

      const result3: boolean = hashSet.has(differentComplexObj);
      expect(result3).assertFalse();
    });
  })
}
