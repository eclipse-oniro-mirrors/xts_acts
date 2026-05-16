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

interface EmptyObject {}

interface LargeObject {
  key0: number;
  key1: number;
  key2: number;
  key3: number;
  key4: number;
  key5: number;
  key6: number;
  key7: number;
  key8: number;
  key9: number;
}

interface StringKeyedObject {
  abc: number;
  aaa: number;
}

interface EnumerableObject {
  enumerableProp: string;
}

interface TestObject {
  id: number;
  name: string;
}

type MixedTypeWithNull = string | number | boolean | null | undefined;

type MixedType05 = string | number | boolean;

interface InnerObject {
  value: number;
}

interface OuterObject {
  id: number;
  inner: InnerObject;
}

interface SpecialObject {
  a: undefined;
  b: null;
  c: number;
  d: number;
}

interface NestedObject {
  flag: boolean;
  value: number;
}

interface ComplexObject {
  name: string;
  numbers: Array<number>;
  nested: NestedObject;
}

interface Counter {
  count: number;
  increment: () => void;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

export default function HashSet05Test(): void {
  describe('HashSet05Test', (): void => {
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
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0100
     * @tc.name      testHashSet05Chapter0001
     * @tc.desc      Test remove method with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0001';
      console.log(TAG + ' start');

      const hashSet: HashSet<EmptyObject> = new HashSet<EmptyObject>();
      const obj: EmptyObject = {};

      hashSet.add(obj);
      const result: boolean = hashSet.remove(obj);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0200
     * @tc.name      testHashSet05Chapter0002
     * @tc.desc      Test remove method with large object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0002';
      console.log(TAG + ' start');

      const hashSet: HashSet<LargeObject> = new HashSet<LargeObject>();
      const obj: LargeObject = {
        key0: 0,
        key1: 1,
        key2: 2,
        key3: 3,
        key4: 4,
        key5: 5,
        key6: 6,
        key7: 7,
        key8: 8,
        key9: 9
      };

      hashSet.add(obj);
      const result: boolean = hashSet.remove(obj);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0300
     * @tc.name      testHashSet05Chapter0003
     * @tc.desc      Test remove method with tree-like string (large JSON string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0003';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();


      let initTreeString: (size: number) => string = (size: number): string => {
        let ans: string = '[';
        while (ans.length < size) {
          ans += '{"a":1},';
        }
        ans = ans.slice(0, -1) + ']';
        return ans;
      };

      const treeString: string = initTreeString(1000);
      hashSet.add(treeString);
      const result: boolean = hashSet.remove(treeString);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0400
     * @tc.name      testHashSet05Chapter0004
     * @tc.desc      Test remove method with sliced string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0004';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const str: string = "{k1:value1,k2:value2}";
      const slicedStr: string = str.substring(0, str.length - 2);

      hashSet.add(slicedStr);
      const result: boolean = hashSet.remove(slicedStr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0500
     * @tc.name      testHashSet05Chapter0005
     * @tc.desc      Test remove method with object containing string-keyed properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0005';
      console.log(TAG + ' start');

      const hashSet: HashSet<StringKeyedObject> = new HashSet<StringKeyedObject>();
      const obj: StringKeyedObject = {
        abc: 111,
        aaa: 222
      };

      hashSet.add(obj);
      const result: boolean = hashSet.remove(obj);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0600
     * @tc.name      testHashSet05Chapter0006
     * @tc.desc      Test remove method with number safe integer boundaries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0006';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();
      const maxSafe: number = Number.MAX_SAFE_INTEGER;
      const minSafe: number = Number.MIN_SAFE_INTEGER;

      hashSet.add(maxSafe);
      hashSet.add(minSafe);
      const result1: boolean = hashSet.remove(maxSafe);
      const result2: boolean = hashSet.remove(minSafe);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0700
     * @tc.name      testHashSet05Chapter0007
     * @tc.desc      Test remove method with number EPSILON value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0007';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();
      const epsilon: number = Number.EPSILON;

      hashSet.add(epsilon);
      const result: boolean = hashSet.remove(epsilon);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0800
     * @tc.name      testHashSet05Chapter0008
     * @tc.desc      Test remove method with TypedArray containing out-of-range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0008';
      console.log(TAG + ' start');

      const hashSet: HashSet<Int8Array> = new HashSet<Int8Array>();

      const arr1: Int8Array = new Int8Array([-129]);
      const arr2: Int8Array = new Int8Array([128]);

      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_0900
     * @tc.name      testHashSet05Chapter0009
     * @tc.desc      Test remove method with string containing specific escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0009';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();

      const escapeStr: string = String.fromCharCode(
        7,
        8,
        12,
        10,
        13,
        9,
        11
      );

      hashSet.add(escapeStr);
      const result: boolean = hashSet.remove(escapeStr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1000
     * @tc.name      testHashSet05Chapter0010
     * @tc.desc      Test remove method with boolean truthy/falsy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0010';
      console.log(TAG + ' start');

      const hashSet: HashSet<boolean> = new HashSet<boolean>();

      const falsy1: boolean = !0;
      const falsy2: boolean = !'s';

      hashSet.add(falsy1);
      hashSet.add(falsy2);
      const result1: boolean = hashSet.remove(falsy1);
      const result2: boolean = hashSet.remove(falsy2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1100
     * @tc.name      testHashSet05Chapter0011
     * @tc.desc      Test remove method with number array converted to TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0011';
      console.log(TAG + ' start');

      const hashSet: HashSet<Uint8Array> = new HashSet<Uint8Array>();

      const numberArray: Array<number> = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const typedArray: Uint8Array = new Uint8Array(numberArray);

      hashSet.add(typedArray);
      const result: boolean = hashSet.remove(typedArray);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1200
     * @tc.name      testHashSet05Chapter0012
     * @tc.desc      Test remove method with object containing non-enumerable property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0012';
      console.log(TAG + ' start');

      const hashSet: HashSet<EnumerableObject> = new HashSet<EnumerableObject>();
      const obj: EnumerableObject = { enumerableProp: "test" };

      hashSet.add(obj);
      const result: boolean = hashSet.remove(obj);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1300
     * @tc.name      testHashSet05Chapter0013
     * @tc.desc      Test remove method with number byte boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0013';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();
      const byteMin: int = -128;
      const byteMax: int = 127;

      hashSet.add(byteMin);
      hashSet.add(byteMax);
      const result1: boolean = hashSet.remove(byteMin);
      const result2: boolean = hashSet.remove(byteMax);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1400
     * @tc.name      testHashSet05Chapter0014
     * @tc.desc      Test remove method with number short boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0014';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();
      const shortMin: int = -32768;
      const shortMax: int = 32767;

      hashSet.add(shortMin);
      hashSet.add(shortMax);
      const result1: boolean = hashSet.remove(shortMin);
      const result2: boolean = hashSet.remove(shortMax);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1500
     * @tc.name      testHashSet05Chapter0015
     * @tc.desc      Test remove method with number int boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0015';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();
      const intMin: int = -2147483648;
      const intMax: int = 2147483647;

      hashSet.add(intMin);
      hashSet.add(intMax);
      const result1: boolean = hashSet.remove(intMin);
      const result2: boolean = hashSet.remove(intMax);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1600
     * @tc.name      testHashSet05Chapter0016
     * @tc.desc      Test remove method with number long boundary values (using bigint)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0016';
      console.log(TAG + ' start');

      const hashSet: HashSet<bigint> = new HashSet<bigint>();
      const longMin: bigint = -9223372036854775808n;
      const longMax: bigint = 9223372036854775807n;

      hashSet.add(longMin);
      hashSet.add(longMax);
      const result1: boolean = hashSet.remove(longMin);
      const result2: boolean = hashSet.remove(longMax);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1700
     * @tc.name      testHashSet05Chapter0017
     * @tc.desc      Test remove method with number float boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0017';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();
      const floatMin: number = 1.40129846432481707e-45;
      const floatMax: number = 3.40282346638528860e+38;

      hashSet.add(floatMin);
      hashSet.add(floatMax);
      const result1: boolean = hashSet.remove(floatMin);
      const result2: boolean = hashSet.remove(floatMax);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1800
     * @tc.name      testHashSet05Chapter0018
     * @tc.desc      Test remove method with boolean falsy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0018';
      console.log(TAG + ' start');

      const hashSet: HashSet<boolean> = new HashSet<boolean>();
      const trueValue: boolean = true;
      const falseValue: boolean = false;

      hashSet.add(trueValue);
      hashSet.add(falseValue);
      const result1: boolean = hashSet.remove(trueValue);
      const result2: boolean = hashSet.remove(falseValue);

      const result3: boolean = hashSet.remove(true);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertFalse();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_1900
     * @tc.name      testHashSet05Chapter0019
     * @tc.desc      Test remove method with TypedArray containing Infinity/NaN for integer types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0019';
      console.log(TAG + ' start');

      const hashSet: HashSet<Int8Array> = new HashSet<Int8Array>();
      const arr: Int8Array = new Int8Array(3);

      arr[0] = Infinity as number;
      arr[1] = -Infinity as number;
      arr[2] = NaN as number;

      const expectedArray: Int8Array = new Int8Array([0, 0, 0]);

      hashSet.add(arr);
      const result: boolean = hashSet.remove(expectedArray);

      expect(result).assertFalse();
      expect(hashSet.length).assertEqual(1);

      const result2: boolean = hashSet.remove(arr);
      expect(hashSet.length).assertEqual(0);
      expect(result2).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2000
     * @tc.name      testHashSet05Chapter0020
     * @tc.desc      Test remove method with number char boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0020';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();
      const charMin: int = 0;
      const charMax: int = 65535;

      hashSet.add(charMin);
      hashSet.add(charMax);
      const result1: boolean = hashSet.remove(charMin);
      const result2: boolean = hashSet.remove(charMax);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2100
     * @tc.name      testHashSet05Chapter0021
     * @tc.desc      Test remove method with moderately large string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0021';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const largeStr: string = "a".repeat(10000);

      hashSet.add(largeStr);
      const result: boolean = hashSet.remove(largeStr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2200
     * @tc.name      testHashSet05Chapter0022
     * @tc.desc      Test clear method on empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0022';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2300
     * @tc.name      testHashSet05Chapter0023
     * @tc.desc      Test clear method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0023';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add("apple");
      hashSet.add("banana");
      hashSet.add("cherry");
      expect(hashSet.length).assertEqual(3);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2400
     * @tc.name      testHashSet05Chapter0024
     * @tc.desc      Test clear method with number elements including special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0024';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(0);
      hashSet.add(Infinity);
      hashSet.add(-Infinity);
      hashSet.add(NaN);
      hashSet.add(Number.MAX_VALUE);
      hashSet.add(Number.MIN_VALUE);
      expect(hashSet.length).assertEqual(6);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2500
     * @tc.name      testHashSet05Chapter0025
     * @tc.desc      Test clear method with boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0025';
      console.log(TAG + ' start');
      const hashSet: HashSet<boolean> = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);
      expect(hashSet.length).assertEqual(2);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2600
     * @tc.name      testHashSet05Chapter0026
     * @tc.desc      Test clear method with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0026';
      console.log(TAG + ' start');
      const hashSet: HashSet<Array<number>> = new HashSet<Array<number>>();
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [4, 5, 6];
      hashSet.add(arr1);
      hashSet.add(arr2);
      expect(hashSet.length).assertEqual(2);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2700
     * @tc.name      testHashSet05Chapter0027
     * @tc.desc      Test clear method with object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0027';
      console.log(TAG + ' start');

      const hashSet: HashSet<TestObject> = new HashSet<TestObject>();
      const obj1: TestObject = { id: 1, name: "object1" };
      const obj2: TestObject = { id: 2, name: "object2" };
      hashSet.add(obj1);
      hashSet.add(obj2);
      expect(hashSet.length).assertEqual(2);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2800
     * @tc.name      testHashSet05Chapter0028
     * @tc.desc      Test clear method with TypedArray elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0028';
      console.log(TAG + ' start');
      const hashSet: HashSet<Int8Array> = new HashSet<Int8Array>();
      const arr1: Int8Array = new Int8Array([-128, 0, 127]);
      const arr2: Int8Array = new Int8Array([1, 2, 3]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      expect(hashSet.length).assertEqual(2);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_2900
     * @tc.name      testHashSet05Chapter0029
     * @tc.desc      Test clear method with bigint elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0029';
      console.log(TAG + ' start');
      const hashSet: HashSet<bigint> = new HashSet<bigint>();
      const big1: bigint = 1234567890123456789n;
      const big2: bigint = -9876543210987654321n;
      hashSet.add(big1);
      hashSet.add(big2);
      expect(hashSet.length).assertEqual(2);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3000
     * @tc.name      testHashSet05Chapter0030
     * @tc.desc      Test clear method with mixed type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0030';
      console.log(TAG + ' start');

      const hashSet: HashSet<string | number | boolean> = new HashSet<string | number | boolean>();
      hashSet.add("string");
      hashSet.add(123);
      hashSet.add(true);
      hashSet.add(false);
      expect(hashSet.length).assertEqual(4);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3100
     * @tc.name      testHashSet05Chapter0031
     * @tc.desc      Test clear method on large HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0031';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      for (let i: int = 0; i < 1000; i++) {
        hashSet.add(i);
      }
      expect(hashSet.length).assertEqual(1000);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3200
     * @tc.name      testHashSet05Chapter0032
     * @tc.desc      Test clear method and verify elements are removed
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0032';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const value1: string = "value1";
      const value2: string = "value2";
      hashSet.add(value1);
      hashSet.add(value2);
      expect(hashSet.has(value1)).assertTrue();
      expect(hashSet.has(value2)).assertTrue();
      hashSet.clear();
      expect(hashSet.has(value1)).assertFalse();
      expect(hashSet.has(value2)).assertFalse();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3300
     * @tc.name      testHashSet05Chapter0033
     * @tc.desc      Test clear method multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0033';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      hashSet.add(3);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3400
     * @tc.name      testHashSet05Chapter0034
     * @tc.desc      Test clear method with nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0034';
      console.log(TAG + ' start');

      const hashSet: HashSet<OuterObject> = new HashSet<OuterObject>();
      const obj1: OuterObject = { id: 1, inner: { value: 100 } };
      const obj2: OuterObject = { id: 2, inner: { value: 200 } };
      hashSet.add(obj1);
      hashSet.add(obj2);
      expect(hashSet.length).assertEqual(2);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3500
     * @tc.name      testHashSet05Chapter0035
     * @tc.desc      Test clear method with objects containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0035';
      console.log(TAG + ' start');

      const hashSet: HashSet<SpecialObject> = new HashSet<SpecialObject>();
      const obj: SpecialObject = {
        a: undefined,
        b: null,
        c: NaN,
        d: Infinity
      };
      hashSet.add(obj);
      expect(hashSet.length).assertEqual(1);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3600
     * @tc.name      testHashSet05Chapter0036
     * @tc.desc      Test clear method with complex data structures
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0036';
      console.log(TAG + ' start');

      const hashSet: HashSet<ComplexObject> = new HashSet<ComplexObject>();
      const nestedObj: NestedObject = {
        flag: true,
        value: 42
      };
      const obj: ComplexObject = {
        name: "test",
        numbers: [1, 2, 3, 4, 5],
        nested: nestedObj
      };
      hashSet.add(obj);
      expect(hashSet.length).assertEqual(1);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3700
     * @tc.name      testHashSet05Chapter0037
     * @tc.desc      Test clear method after adding and removing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0037';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add("item1");
      hashSet.add("item2");
      hashSet.remove("item1");
      expect(hashSet.length).assertEqual(1);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3800
     * @tc.name      testHashSet05Chapter0038
     * @tc.desc      Test clear method and then add new elements
     * @tc.size      MediumTest
     * @tc.type      Function*
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0038';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      hashSet.add(3);
      hashSet.add(4);
      expect(hashSet.length).assertEqual(2);
      expect(hashSet.has(3)).assertTrue();
      expect(hashSet.has(4)).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_3900
     * @tc.name      testHashSet05Chapter0039
     * @tc.desc      Test clear method with all TypedArray types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0039';
      console.log(TAG + ' start');
      const hashSet: HashSet<Int8Array | Uint8Array | Float32Array> = new HashSet<Int8Array | Uint8Array | Float32Array>();
      const int8Array: Int8Array = new Int8Array([1, 2, 3]);
      const uint8Array: Uint8Array = new Uint8Array([4, 5, 6]);
      const float32Array: Float32Array = new Float32Array([7.0, 8.0, 9.0]);
      hashSet.add(int8Array);
      hashSet.add(uint8Array);
      hashSet.add(float32Array);
      expect(hashSet.length).assertEqual(3);
      hashSet.clear();
      expect(hashSet.length).assertEqual(0);
      expect(hashSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4000
     * @tc.name      testHashSet05Chapter0040
     * @tc.desc      Test values method on empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0040';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const valuesIterator: IterableIterator<string> = hashSet.values();
      const result: Array<string> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4100
     * @tc.name      testHashSet05Chapter0041
     * @tc.desc      Test values method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0041';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add("apple");
      hashSet.add("banana");
      hashSet.add("cherry");
      const valuesIterator: IterableIterator<string> = hashSet.values();
      const result: Array<string> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(3);
      expect(result).assertContain("apple");
      expect(result).assertContain("banana");
      expect(result).assertContain("cherry");
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4200
     * @tc.name      testHashSet05Chapter0042
     * @tc.desc      Test values method with number elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0042';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      const valuesIterator: IterableIterator<number> = hashSet.values();
      const result: Array<number> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(3);
      expect(result).assertContain(1);
      expect(result).assertContain(2);
      expect(result).assertContain(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4300
     * @tc.name      testHashSet05Chapter0043
     * @tc.desc      Test values method with boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0043';
      console.log(TAG + ' start');
      const hashSet: HashSet<boolean> = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);
      const valuesIterator: IterableIterator<boolean> = hashSet.values();
      const result: Array<boolean> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(2);
      expect(result).assertContain(true);
      expect(result).assertContain(false);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4400
     * @tc.name      testHashSet05Chapter0044
     * @tc.desc      Test values method with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0044';
      console.log(TAG + ' start');
      const hashSet: HashSet<Array<number>> = new HashSet<Array<number>>();
      const arr1: Array<number> = [1, 2, 3];
      const arr2: Array<number> = [4, 5, 6];
      hashSet.add(arr1);
      hashSet.add(arr2);
      const valuesIterator: IterableIterator<Array<number>> = hashSet.values();
      const result: Array<Array<number>> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(2);
      expect(result).assertContain(arr1);
      expect(result).assertContain(arr2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4500
     * @tc.name      testHashSet05Chapter0045
     * @tc.desc      Test values method with object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0045';
      console.log(TAG + ' start');

      const hashSet: HashSet<TestObject> = new HashSet<TestObject>();
      const obj1: TestObject = { id: 1, name: "object1" };
      const obj2: TestObject = { id: 2, name: "object2" };
      hashSet.add(obj1);
      hashSet.add(obj2);
      const valuesIterator: IterableIterator<TestObject> = hashSet.values();
      const result: Array<TestObject> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(2);
      expect(result).assertContain(obj1);
      expect(result).assertContain(obj2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4600
     * @tc.name      testHashSet05Chapter0046
     * @tc.desc      Test values method with TypedArray elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0046';
      console.log(TAG + ' start');
      const hashSet: HashSet<Int8Array> = new HashSet<Int8Array>();
      const arr1: Int8Array = new Int8Array([-128, 0, 127]);
      const arr2: Int8Array = new Int8Array([1, 2, 3]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const valuesIterator: IterableIterator<Int8Array> = hashSet.values();
      const result: Array<Int8Array> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(2);
      expect(result).assertContain(arr1);
      expect(result).assertContain(arr2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4700
     * @tc.name      testHashSet05Chapter0047
     * @tc.desc      Test values method with bigint elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0047';
      console.log(TAG + ' start');
      const hashSet: HashSet<bigint> = new HashSet<bigint>();
      const big1: bigint = 1234567890123456789n;
      const big2: bigint = -9876543210987654321n;
      hashSet.add(big1);
      hashSet.add(big2);
      const valuesIterator: IterableIterator<bigint> = hashSet.values();
      const result: Array<bigint> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(2);
      expect(result).assertContain(big1);
      expect(result).assertContain(big2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4800
     * @tc.name      testHashSet05Chapter0048
     * @tc.desc      Test values method with mixed type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0048';
      console.log(TAG + ' start');

      const hashSet: HashSet<MixedType05> = new HashSet<MixedType05>();
      hashSet.add("string");
      hashSet.add(123);
      hashSet.add(true);
      const valuesIterator: IterableIterator<MixedType05> = hashSet.values();
      const result: Array<MixedType05> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(3);
      expect(result).assertContain("string");
      expect(result).assertContain(123);
      expect(result).assertContain(true);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_4900
     * @tc.name      testHashSet05Chapter0049
     * @tc.desc      Test values method with large HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0049';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const count: int = 100;
      for (let i: int = 0; i < count; i++) {
        hashSet.add(i);
      }
      const valuesIterator: IterableIterator<number> = hashSet.values();
      const result: Array<number> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(count);
      for (let i: int = 0; i < count; i++) {
        expect(result).assertContain(i);
      }
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5000
     * @tc.name      testHashSet05Chapter0050
     * @tc.desc      Test values method returns all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0050';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const value1: string = "value1";
      const value2: string = "value2";
      const value3: string = "value3";
      hashSet.add(value1);
      hashSet.add(value2);
      hashSet.add(value3);
      const valuesIterator: IterableIterator<string> = hashSet.values();
      const result: Array<string> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(3);
      expect(hashSet.length).assertEqual(3);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5100
     * @tc.name      testHashSet05Chapter0051
     * @tc.desc      Test values method after clear
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0051';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.clear();
      const valuesIterator: IterableIterator<number> = hashSet.values();
      const result: Array<number> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(0);
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5200
     * @tc.name      testHashSet05Chapter0052
     * @tc.desc      Test values method after remove
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0052';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add("item1");
      hashSet.add("item2");
      hashSet.add("item3");
      hashSet.remove("item2");
      const valuesIterator: IterableIterator<string> = hashSet.values();
      const result: Array<string> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(2);
      expect(result).assertContain("item1");
      expect(result).assertContain("item3");
      expect(result.includes("item2")).assertFalse();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5300
     * @tc.name      testHashSet05Chapter0053
     * @tc.desc      Test values method with duplicate elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0053';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(1);
      hashSet.add(2);
      const valuesIterator: IterableIterator<number> = hashSet.values();
      const result: Array<number> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(2);
      expect(result).assertContain(1);
      expect(result).assertContain(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5400
     * @tc.name      testHashSet05Chapter0054
     * @tc.desc      Test values method with nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0054';
      console.log(TAG + ' start');

      const hashSet: HashSet<OuterObject> = new HashSet<OuterObject>();
      const innerObj1: InnerObject = { value: 100 };
      const innerObj2: InnerObject = { value: 200 };
      const obj1: OuterObject = { id: 1, inner: innerObj1 };
      const obj2: OuterObject = { id: 2, inner: innerObj2 };
      hashSet.add(obj1);
      hashSet.add(obj2);
      const valuesIterator: IterableIterator<OuterObject> = hashSet.values();
      const result: Array<OuterObject> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(2);
      expect(result).assertContain(obj1);
      expect(result).assertContain(obj2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5500
     * @tc.name      testHashSet05Chapter0055
     * @tc.desc      Test values method with objects containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0055';
      console.log(TAG + ' start');

      const hashSet: HashSet<SpecialObject> = new HashSet<SpecialObject>();
      const obj: SpecialObject = {
        a: undefined,
        b: null,
        c: NaN,
        d: Infinity
      };
      hashSet.add(obj);
      const valuesIterator: IterableIterator<SpecialObject> = hashSet.values();
      const result: Array<SpecialObject> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(1);
      expect(result[0].a).assertEqual(undefined);
      expect(result[0].b).assertEqual(null);
      expect(result[0].c).assertNaN();
      expect(result[0].d).assertEqual(Infinity);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5600
     * @tc.name      testHashSet05Chapter0056
     * @tc.desc      Test values method with complex data structures
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0056';
      console.log(TAG + ' start');

      const hashSet: HashSet<ComplexObject> = new HashSet<ComplexObject>();
      const nestedObj: NestedObject = {
        flag: true,
        value: 42
      };
      const obj: ComplexObject = {
        name: "test",
        numbers: [1, 2, 3, 4, 5],
        nested: nestedObj
      };
      hashSet.add(obj);
      const valuesIterator: IterableIterator<ComplexObject> = hashSet.values();
      const result: Array<ComplexObject> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(1);
      expect(result[0].name).assertEqual("test");
      expect(result[0].numbers.length).assertEqual(5);
      expect(result[0].nested.flag).assertTrue();
      expect(result[0].nested.value).assertEqual(42);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5700
     * @tc.name      testHashSet05Chapter0057
     * @tc.desc      Test values method multiple iterations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0057';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(1);
      hashSet.add(2);
      hashSet.add(3);
      const valuesIterator1: IterableIterator<number> = hashSet.values();
      const result1: Array<number> = [];
      for (let value of valuesIterator1) {
        result1.push(value);
      }
      expect(result1.length).assertEqual(3);
      const valuesIterator2: IterableIterator<number> = hashSet.values();
      const result2: Array<number> = [];
      for (let value of valuesIterator2) {
        result2.push(value);
      }
      expect(result2.length).assertEqual(3);
      expect(result1.sort()).assertDeepEquals(result2.sort());
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5800
     * @tc.name      testHashSet05Chapter0058
     * @tc.desc      Test values method with all TypedArray types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0058';
      console.log(TAG + ' start');
      const hashSet: HashSet<Int8Array | Uint8Array | Float32Array> = new HashSet<Int8Array | Uint8Array | Float32Array>();
      const int8Array: Int8Array = new Int8Array([1, 2, 3]);
      const uint8Array: Uint8Array = new Uint8Array([4, 5, 6]);
      const float32Array: Float32Array = new Float32Array([7.0, 8.0, 9.0]);
      hashSet.add(int8Array);
      hashSet.add(uint8Array);
      hashSet.add(float32Array);
      const valuesIterator: IterableIterator<Int8Array | Uint8Array | Float32Array> = hashSet.values();
      const result: Array<Int8Array | Uint8Array | Float32Array> = [];
      for (let value of valuesIterator) {
        result.push(value);
      }
      expect(result.length).assertEqual(3);
      expect(result).assertContain(int8Array);
      expect(result).assertContain(uint8Array);
      expect(result).assertContain(float32Array);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_5900
     * @tc.name      testHashSet05Chapter0059
     * @tc.desc      Test values method returns independent iterator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0059';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      hashSet.add("a");
      hashSet.add("b");
      const iterator1: IterableIterator<string> = hashSet.values();
      const iterator2: IterableIterator<string> = hashSet.values();
      const result1: Array<string> = [];
      const result2: Array<string> = [];
      for (let value of iterator1) {
        result1.push(value);
      }
      for (let value of iterator2) {
        result2.push(value);
      }
      expect(result1.length).assertEqual(2);
      expect(result2.length).assertEqual(2);
      expect(result1.sort()).assertDeepEquals(result2.sort());
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6000
     * @tc.name      testHashSet05Chapter0060
     * @tc.desc      Test values method with manual iteration using next()
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0060';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      hashSet.add(10);
      hashSet.add(20);
      hashSet.add(30);
      const iterator: IterableIterator<number> = hashSet.values();
      const result: Array<number> = [];
      let next = iterator.next();
      while (!next.done) {
        result.push(next.value as number);
        next = iterator.next();
      }
      expect(result.length).assertEqual(3);
      expect(result).assertContain(10);
      expect(result).assertContain(20);
      expect(result).assertContain(30);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6100
     * @tc.name      testHashSet05Chapter0061
     * @tc.desc      Test forEach method with normal string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0061';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("sparrow");
      hashSet.add("squirrel");

      const visited: Array<string> = [];
      hashSet.forEach((value: string, key: string): void => {
        visited.push(value);
        expect(key).assertEqual(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited.includes("sparrow")).assertTrue();
      expect(visited.includes("squirrel")).assertTrue();

    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6200
     * @tc.name      testHashSet05Chapter0062
     * @tc.desc      Test forEach method with empty HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0062';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      let callCount: int = 0;

      hashSet.forEach((value: string, key: string): void => {
        callCount++;
      });

      expect(callCount).assertEqual(0);
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6300
     * @tc.name      testHashSet05Chapter0063
     * @tc.desc      Test forEach method with thisArg parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0063';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("apple");
      hashSet.add("banana");

      let countVal: int = 0;

      hashSet.forEach((value: string, key: string): void => {
        countVal++;
        expect(key).assertEqual(value);
      });

      expect(countVal).assertEqual(2);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6400
     * @tc.name      testHashSet05Chapter0064
     * @tc.desc      Test forEach method with number type HashSet containing boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0064';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      hashSet.add(0);
      hashSet.add(1);
      hashSet.add(-1);
      hashSet.add(Number.MAX_VALUE);
      hashSet.add(Number.MIN_VALUE);
      hashSet.add(Number.EPSILON);

      let count: int = 0;
      hashSet.forEach((value: number, key: number): void => {
        count++;
        expect(key).assertEqual(value);
      });

      expect(count).assertEqual(6);
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6500
     * @tc.name      testHashSet05Chapter0065
     * @tc.desc      Test forEach method with Infinity and -Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0065';
      console.log(TAG + ' start');

      const hashSet = new HashSet<number>();
      hashSet.add(Infinity);
      hashSet.add(-Infinity);
      hashSet.add(NaN);

      const visited: Array<number> = [];
      hashSet.forEach((value: number, key: number): void => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(3);
      expect(visited.includes(Infinity)).assertTrue();
      expect(visited.includes(-Infinity)).assertTrue();
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6600
     * @tc.name      testHashSet05Chapter0066
     * @tc.desc      Test forEach method with boolean type HashSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0066';
      console.log(TAG + ' start');

      const hashSet = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);

      const visited: Array<boolean> = [];
      hashSet.forEach((value: boolean, key: boolean): void => {
        visited.push(value);
      });

      expect(visited.length).assertEqual(2);
      expect(visited.includes(true)).assertTrue();
      expect(visited.includes(false)).assertTrue();
    });
    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6700
     * @tc.name      testHashSet05Chapter0067
     * @tc.desc      Test forEach method with string containing special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0067';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

      for (let i: int = 0; i < specialChars.length; i++) {
        hashSet.add(specialChars[i]);
      }

      let count: int = 0;
      hashSet.forEach((value: string, key: string): void => {
        count++;
        expect(specialChars.includes(value)).assertTrue();
      });

      expect(count).assertEqual(specialChars.length);
    });

    /**
     * @tc.number     SUB_COMMONLIBRARY_UTIL_HASHSET_TESTFIVE_6800
     * @tc.name      testHashSet05Chapter0068
     * @tc.desc      Test forEach method with string containing escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet05Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet05Chapter0068';
      console.log(TAG + ' start');

      const hashSet = new HashSet<string>();
      hashSet.add("\n");
      hashSet.add("\t");
      hashSet.add("\r");
      hashSet.add("\\");
      hashSet.add("\"");
      hashSet.add("\'");

      let count: int = 0;
      hashSet.forEach((value: string, key: string): void => {
        count++;
      });

      expect(count).assertEqual(6);
    });
  })
}
