import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { HashSet } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function HashSet04Test() {
  describe('HashSet04Test', () => {
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
     * @tc.number    SUB_HASHSET_TEST04_0100
     * @tc.name      testHashSet04Chapter0001
     * @tc.desc      Test add method with number type char range boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0001';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const result1: boolean = hashSet.add(0);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(65535);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(-1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(65536);
      expect(result4).assertTrue();

      const result6: boolean = hashSet.has(65535);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_0200
     * @tc.name      testHashSet04Chapter0002
     * @tc.desc      Test add method with boolean false equivalent values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0002';
      console.log(TAG + ' start');

      const hashSet: HashSet<number | string | null | undefined> = new HashSet<number | string | null | undefined>();

      const result1: boolean = hashSet.add(0);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(NaN);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add("");
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(null);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(undefined);
      expect(result5).assertTrue();

      const result7: boolean = hashSet.add(NaN);
      expect(result7).assertTrue();

      const result8: boolean = hashSet.has("");
      expect(result8).assertTrue();

      const result9: boolean = hashSet.has(null);
      expect(result9).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_0300
     * @tc.name      testHashSet04Chapter0003
     * @tc.desc      Test add method with array containing empty slots using undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0003';
      console.log(TAG + ' start');

      type NumberArrayWithUndefined = Array<number | undefined>;
      const hashSet: HashSet<NumberArrayWithUndefined> = new HashSet<NumberArrayWithUndefined>();

      const arr1: NumberArrayWithUndefined = [1, undefined, 3];
      const arr2: NumberArrayWithUndefined = [1, 2, 3];
      arr2[1] = undefined;

      const result1: boolean = hashSet.add(arr1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(arr2);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(arr1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(arr2);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_0400
     * @tc.name      testHashSet04Chapter0004
     * @tc.desc      Test add method with object containing mixed string and number keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0004';
      console.log(TAG + ' start');

      interface MixedKeysObject {
        a: number;
        b: string;
        zero: string;
        strKey1: string;
        numericStringKey: string;
      }

      const hashSet: HashSet<MixedKeysObject> = new HashSet<MixedKeysObject>();

      const obj: MixedKeysObject = {
        a: 1,
        b: "test",
        zero: "zero",
        strKey1: "stringValue1",
        numericStringKey: "numericStringKey"
      };

      const result1: boolean = hashSet.add(obj);
      expect(result1).assertTrue();

      const newObj: MixedKeysObject = {
        a: 1,
        b: "test",
        zero: "zero",
        strKey1: "stringValue1",
        numericStringKey: "numericStringKey"
      };

      const result2: boolean = hashSet.add(newObj);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(obj);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(newObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_0500
     * @tc.name      testHashSet04Chapter0005
     * @tc.desc      Test add method with object containing TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0005';
      console.log(TAG + ' start');

      interface TypedArrayObject {
        buffer: Uint8Array;
        length: number;
      }

      const hashSet: HashSet<TypedArrayObject> = new HashSet<TypedArrayObject>();

      const typedArrayObj: TypedArrayObject = {
        buffer: new Uint8Array([72, 101, 108, 108, 111]),
        length: 5
      };

      const result1: boolean = hashSet.add(typedArrayObj);
      expect(result1).assertTrue();

      const newTypedArrayObj: TypedArrayObject = {
        buffer: new Uint8Array([72, 101, 108, 108, 111]),
        length: 5
      };

      const result2: boolean = hashSet.add(newTypedArrayObj);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(typedArrayObj);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(newTypedArrayObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_0600
     * @tc.name      testHashSet04Chapter0006
     * @tc.desc      Test add method with ASCII full character string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0006';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const asciiString: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

      const result1: boolean = hashSet.add(asciiString);
      expect(result1).assertTrue();

      const partialAsciiString: string = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
      const result2: boolean = hashSet.add(partialAsciiString);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(asciiString);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(partialAsciiString);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_0700
     * @tc.name      testHashSet04Chapter0007
     * @tc.desc      Test add method with invalid Unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0007';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const invalidUnicode1: string = "\udc04";
      const invalidUnicode2: string = "\ud83d";
      const invalidUnicode3: string = "\udff4";

      const result1: boolean = hashSet.add(invalidUnicode1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(invalidUnicode2);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(invalidUnicode3);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(invalidUnicode1);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.has(invalidUnicode2);
      expect(result5).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_0800
     * @tc.name      testHashSet04Chapter0008
     * @tc.desc      Test add method with string keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0008';
      console.log(TAG + ' start');

      const hashSet: HashSet<string> = new HashSet<string>();
      const keyword1: string = "0";
      const keyword2: string = "NaN";
      const keyword3: string = "";

      const result1: boolean = hashSet.add(keyword1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(keyword2);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(keyword3);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(keyword1);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.has(keyword2);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has("");
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_0900
     * @tc.name      testHashSet04Chapter0009
     * @tc.desc      Test add method with Float32Array extreme boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0009';
      console.log(TAG + ' start');

      const hashSet: HashSet<Float32Array> = new HashSet<Float32Array>();
      const float32ArrMin: Float32Array = new Float32Array([-3.4028234663852886e38]);
      const float32ArrMax: Float32Array = new Float32Array([3.4028234663852886e38]);
      const float32ArrOut1: Float32Array = new Float32Array([-3.5e38]);
      const float32ArrOut2: Float32Array = new Float32Array([3.5e38]);

      const result1: boolean = hashSet.add(float32ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(float32ArrMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(float32ArrOut1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(float32ArrOut2);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(float32ArrMin);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(float32ArrMax);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1000
     * @tc.name      testHashSet04Chapter0010
     * @tc.desc      Test add method with Float64Array extreme boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0010';
      console.log(TAG + ' start');

      const hashSet: HashSet<Float64Array> = new HashSet<Float64Array>();
      const float64ArrMin: Float64Array = new Float64Array([-1.7976931348623157e308]);
      const float64ArrMax: Float64Array = new Float64Array([1.7976931348623157e308]);
      const float64ArrOut1: Float64Array = new Float64Array([-1.8e308]);
      const float64ArrOut2: Float64Array = new Float64Array([1.8e308]);

      const result1: boolean = hashSet.add(float64ArrMin);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(float64ArrMax);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(float64ArrOut1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(float64ArrOut2);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(float64ArrMin);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(float64ArrMax);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1100
     * @tc.name      testHashSet04Chapter0011
     * @tc.desc      Test add method with exponential operator and scientific notation numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0011';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const result1: boolean = hashSet.add(2**3);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(1e3);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(2.5e-2);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(8);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(1000);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(0.025);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1200
     * @tc.name      testHashSet04Chapter0012
     * @tc.desc      Test add method with object containing different numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0012';
      console.log(TAG + ' start');

      interface NumericRepresentationsObject {
        hexValue: number;
        octalValue: number;
        decimalValue: number;
        floatValue: number;
      }

      const hashSet: HashSet<NumericRepresentationsObject> = new HashSet<NumericRepresentationsObject>();

      const numObj: NumericRepresentationsObject = {
        hexValue: 0xdecafafecacefade,
        decimalValue: 123.456,
        floatValue: 0xcafebabe,
        octalValue: 0o3
      };

      const result1: boolean = hashSet.add(numObj);
      expect(result1).assertTrue();

      const newNumObj: NumericRepresentationsObject = {
        hexValue: 0xdecafafecacefade,
        decimalValue: 123.456,
        floatValue: 0xcafebabe,
        octalValue: 0o3
      };

      const result2: boolean = hashSet.add(newNumObj);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(numObj);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(newNumObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1300
     * @tc.name      testHashSet04Chapter0013
     * @tc.desc      Test add method with object containing Map and Set properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0013';
      console.log(TAG + ' start');

      interface MapValueObject {
        a: number;
      }

      type MapValue = string | MapValueObject;

      interface CollectionObject {
        map: Map<string, MapValue>;
        set: Set<number>;
        name: string;
      }

      const hashSet: HashSet<CollectionObject> = new HashSet<CollectionObject>();

      const map: Map<string, MapValue> = new Map<string, MapValue>([
        ['key1', 'value1'],
        ['key2', { a: 1 }]
      ]);

      const set: Set<number> = new Set<number>([1, 2, 3, 2, 1]);

      const collectionObj: CollectionObject = {
        map: map,
        set: set,
        name: "collection"
      };

      const result1: boolean = hashSet.add(collectionObj);
      expect(result1).assertTrue();

      const newMap: Map<string, MapValue> = new Map<string, MapValue>([
        ['key1', 'value1'],
        ['key2', { a: 1 }]
      ]);

      const newSet: Set<number> = new Set<number>([1, 2, 3, 2, 1]);

      const newCollectionObj: CollectionObject = {
        map: newMap,
        set: newSet,
        name: "collection"
      };

      const result2: boolean = hashSet.add(newCollectionObj);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(collectionObj);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(newCollectionObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1400
     * @tc.name      testHashSet04Chapter0014
     * @tc.desc      Test add method with complex object containing all special value types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0014';
      console.log(TAG + ' start');

      interface SpecialValuesObject {
        undefinedProp: undefined;
        nullProp: null;
        nanProp: number;
        infinityProp: number;
        negativeInfinityProp: number;
        zeroProp: number;
        negativeZeroProp: number;
      }

      const hashSet: HashSet<SpecialValuesObject> = new HashSet<SpecialValuesObject>();

      const specialObj: SpecialValuesObject = {
        undefinedProp: undefined,
        nullProp: null,
        nanProp: NaN,
        infinityProp: Infinity,
        negativeInfinityProp: -Infinity,
        zeroProp: 0,
        negativeZeroProp: -0
      };

      const result1: boolean = hashSet.add(specialObj);
      expect(result1).assertTrue();

      const newSpecialObj: SpecialValuesObject = {
        undefinedProp: undefined,
        nullProp: null,
        nanProp: NaN,
        infinityProp: Infinity,
        negativeInfinityProp: -Infinity,
        zeroProp: 0,
        negativeZeroProp: -0
      };

      const result2: boolean = hashSet.add(newSpecialObj);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(specialObj);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(newSpecialObj);
      expect(result4).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1500
     * @tc.name      testHashSet04Chapter0015
     * @tc.desc      Test add method with empty and single element arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0015';
      console.log(TAG + ' start');

      type NumberArray = Array<number>;
      const hashSet: HashSet<NumberArray> = new HashSet<NumberArray>();

      const emptyArr: NumberArray = [];
      const singleArr: NumberArray = [42];
      const multiArr: NumberArray = [1, 2, 3];

      const result1: boolean = hashSet.add(emptyArr);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(singleArr);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(multiArr);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(emptyArr);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add([]);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(singleArr);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1600
     * @tc.name      testHashSet04Chapter0016
     * @tc.desc      Test add method with number type extreme boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0016';
      console.log(TAG + ' start');

      const hashSet: HashSet<number> = new HashSet<number>();

      const result1: boolean = hashSet.add(Number.MAX_VALUE);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(Number.MIN_VALUE);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(Number.EPSILON);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(Number.MAX_SAFE_INTEGER);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(Number.MAX_VALUE);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(Number.MIN_VALUE);
      expect(result6).assertTrue();

      const result7: boolean = hashSet.has(Number.MAX_SAFE_INTEGER);
      expect(result7).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1700
     * @tc.name      testHashSet04Chapter0017
     * @tc.desc      Test add method with BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0017';
      console.log(TAG + ' start');

      const hashSet: HashSet<bigint> = new HashSet<bigint>();

      const bigIntValue1: bigint = BigInt(0xdecafafecacefade);
      const bigIntValue2: bigint = 9007199254740991n;

      const result1: boolean = hashSet.add(bigIntValue1);
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(bigIntValue2);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(bigIntValue1);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.has(bigIntValue2);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(0n);
      expect(result5).assertTrue();

      const result6: boolean = hashSet.has(0n);
      expect(result6).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1800
     * @tc.name      testHashSet04Chapter0018
     * @tc.desc      Test add method with reverse test for maximum coverage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0018';
      console.log(TAG + ' start');

      type MixedType = string | number | boolean | null | undefined | object;
      const hashSet: HashSet<MixedType> = new HashSet<MixedType>();

      const result1: boolean = hashSet.add("test");
      expect(result1).assertTrue();

      const result2: boolean = hashSet.add(123);
      expect(result2).assertTrue();

      const result3: boolean = hashSet.add(true);
      expect(result3).assertTrue();

      const result4: boolean = hashSet.add(null);
      expect(result4).assertTrue();

      const result5: boolean = hashSet.add(undefined);
      expect(result5).assertTrue();

      interface TestObject {
        a: number;
        b: string;
      }

      const testObj: TestObject = { a: 1, b: "test" };
      const result6: boolean = hashSet.add(testObj);
      expect(result6).assertTrue();

      const result7: boolean = hashSet.add("test");
      expect(result7).assertTrue();

      const result8: boolean = hashSet.add(123);
      expect(result8).assertTrue();

      const result9: boolean = hashSet.add(true);
      expect(result9).assertTrue();

      const result10: boolean = hashSet.has(null);
      expect(result10).assertTrue();

      const result11: boolean = hashSet.has(undefined);
      expect(result11).assertTrue();

      const result12: boolean = hashSet.has(testObj);
      expect(result12).assertTrue();
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_1900
     * @tc.name      testHashSet04Chapter0019
     * @tc.desc      Test remove method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0019';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Int8Array>();
      const arr1 = new Int8Array([-128]);
      const arr2 = new Int8Array([127]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1 = hashSet.remove(arr1);
      const result2 = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2000
     * @tc.name      testHashSet04Chapter0020
     * @tc.desc      Test remove method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0020';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Uint8Array>();
      const arr1 = new Uint8Array([0]);
      const arr2 = new Uint8Array([255]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1 = hashSet.remove(arr1);
      const result2 = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2100
     * @tc.name      testHashSet04Chapter0021
     * @tc.desc      Test remove method with Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0021';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Float32Array>();
      const arr1 = new Float32Array([Infinity]);
      const arr2 = new Float32Array([-Infinity]);
      const arr3 = new Float32Array([NaN]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      hashSet.add(arr3);
      const result1 = hashSet.remove(arr1);
      const result2 = hashSet.remove(arr2);
      const result3 = hashSet.remove(arr3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2200
     * @tc.name      testHashSet04Chapter0022
     * @tc.desc      Test remove method with string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0022';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const str = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      hashSet.add(str);
      const result = hashSet.remove(str);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2300
     * @tc.name      testHashSet04Chapter0023
     * @tc.desc      Test remove method with string escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0023';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const str = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0";
      hashSet.add(str);
      const result = hashSet.remove(str);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2400
     * @tc.name      testHashSet04Chapter0024
     * @tc.desc      Test remove method with emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0024';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const emoji1 = "👆";
      const emoji2 = "🤼‍♂️";
      hashSet.add(emoji1);
      hashSet.add(emoji2);
      const result1 = hashSet.remove(emoji1);
      const result2 = hashSet.remove(emoji2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2500
     * @tc.name      testHashSet04Chapter0025
     * @tc.desc      Test remove method with number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0025';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number>();
      hashSet.add(0);
      hashSet.add(Infinity);
      hashSet.add(-Infinity);
      hashSet.add(NaN);
      hashSet.add(Number.MAX_VALUE);
      hashSet.add(Number.MIN_VALUE);
      const result1 = hashSet.remove(0);
      const result2 = hashSet.remove(Infinity);
      const result3 = hashSet.remove(-Infinity);
      const result4 = hashSet.remove(NaN);
      const result5 = hashSet.remove(Number.MAX_VALUE);
      const result6 = hashSet.remove(Number.MIN_VALUE);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
      expect(result5).assertTrue();
      expect(result6).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2600
     * @tc.name      testHashSet04Chapter0026
     * @tc.desc      Test remove method with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0026';
      console.log(TAG + ' start');
      const hashSet = new HashSet<bigint>();
      const big1 = BigInt("0xdecafafecacefade");
      const big2 = BigInt("9007199254740991");
      const big3 = -9223372036854775808n;
      const big4 = 9223372036854775807n;
      hashSet.add(big1);
      hashSet.add(big2);
      hashSet.add(big3);
      hashSet.add(big4);
      const result1 = hashSet.remove(big1);
      const result2 = hashSet.remove(big2);
      const result3 = hashSet.remove(big3);
      const result4 = hashSet.remove(big4);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(result4).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2700
     * @tc.name      testHashSet04Chapter0027
     * @tc.desc      Test remove method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0027';
      console.log(TAG + ' start');
      const hashSet = new HashSet<boolean>();
      hashSet.add(true);
      hashSet.add(false);
      const result1 = hashSet.remove(true);
      const result2 = hashSet.remove(false);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_2800
     * @tc.name      testHashSet04Chapter0028
     * @tc.desc      Test remove method with array containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0028';
      console.log(TAG + ' start');
      const hashSet = new HashSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111];
      const arr2 = [Infinity, -Infinity, NaN];
      const arr3: number[] = [];
      hashSet.add(arr1);
      hashSet.add(arr2);
      hashSet.add(arr3);
      const result1 = hashSet.remove(arr1);
      const result2 = hashSet.remove(arr2);
      const result3 = hashSet.remove(arr3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_HASHSET_TEST04_2900
     * @tc.name      testHashSet04Chapter0029
     * @tc.desc      Test remove method with nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0029';
      console.log(TAG + ' start');

      interface SimpleObject {
        a: number;
        b: string;
        c: number[];
      }

      interface InnerD {
        e: number;
      }

      interface InnerB {
        c: number;
        d: InnerD;
      }

      interface NestedObject {
        a: number;
        b: InnerB;
      }

      interface EmptyObject {}

      const hashSet = new HashSet<object>();
      const obj1: SimpleObject = { a: 1, b: "test", c: [1, 2, 3] };
      const obj2: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
      const obj3: EmptyObject = {};

      hashSet.add(obj1);
      hashSet.add(obj2);
      hashSet.add(obj3);
      const result1 = hashSet.remove(obj1);
      const result2 = hashSet.remove(obj2);
      const result3 = hashSet.remove(obj3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3000
     * @tc.name      testHashSet04Chapter0030
     * @tc.desc      Test remove method with objects containing TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0030';
      console.log(TAG + ' start');

      interface TypedArrayObject {
        buffer: Uint8Array;
      }

      interface DataViewObject {
        view: DataView;
      }

      const hashSet = new HashSet<object>();
      const obj1: TypedArrayObject = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
      const obj2: DataViewObject = { view: new DataView(new ArrayBuffer(16)) };

      hashSet.add(obj1);
      hashSet.add(obj2);
      const result1 = hashSet.remove(obj1);
      const result2 = hashSet.remove(obj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3100
     * @tc.name      testHashSet04Chapter0031
     * @tc.desc      Test remove method with Map and Set objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0031';
      console.log(TAG + ' start');

      interface MapValueObject {
        a: number;
      }

      interface MapObject {
        map: Map<string, MapValueObject>;
      }

      interface SetObject {
        set: Set<number>;
      }

      const hashSet = new HashSet<object>();
      const mapValueObj: MapValueObject = { a: 1 };
      const map: Map<string, MapValueObject> = new Map<string, MapValueObject>([
        ['key1', mapValueObj],
        ['key2', mapValueObj]
      ]);
      const set: Set<number> = new Set<number>([1, 2, 3, 2, 1]);
      const obj1: MapObject = { map: map };
      const obj2: SetObject = { set: set };

      hashSet.add(obj1);
      hashSet.add(obj2);
      const result1: boolean = hashSet.remove(obj1);
      const result2: boolean = hashSet.remove(obj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3200
     * @tc.name      testHashSet04Chapter0032
     * @tc.desc      Test remove method with Promise and RegExp objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0032';
      console.log(TAG + ' start');

      interface PromiseObject {
        promise: Promise<string>;
      }

      interface RegExpObject {
        regex: RegExp;
      }

      const hashSet = new HashSet<object>();
      const promise: Promise<string> = new Promise<string>((resolve: (value: string) => void) => {
        resolve('done');
      });
      const regex: RegExp = /abc/gi;
      const obj1: PromiseObject = { promise: promise };
      const obj2: RegExpObject = { regex: regex };

      hashSet.add(obj1);
      hashSet.add(obj2);
      const result1: boolean = hashSet.remove(obj1);
      const result2: boolean = hashSet.remove(obj2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3300
     * @tc.name      testHashSet04Chapter0033
     * @tc.desc      Test remove method with non-existent elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0033';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      hashSet.add("apple");
      hashSet.add("banana");
      const result = hashSet.remove("orange");
      expect(result).assertFalse();
      expect(hashSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3400
     * @tc.name      testHashSet04Chapter0034
     * @tc.desc      Test remove method with null value (negative case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0034';
      console.log(TAG + ' start');


      const hashSet: HashSet<string | null> = new HashSet<string | null>();
      const testValue: string = "test";
      const nullValue: null = null;

      hashSet.add(testValue);
      const result: boolean = hashSet.remove(nullValue);
      expect(result).assertFalse();
      expect(hashSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3500
     * @tc.name      testHashSet04Chapter0035
     * @tc.desc      Test remove method with undefined value (negative case)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0035';
      console.log(TAG + ' start');


      const hashSet: HashSet<string | undefined> = new HashSet<string | undefined>();
      const testValue: string = "test";
      const undefinedValue: undefined = undefined;


      hashSet.add(testValue);

      const result: boolean = hashSet.remove(undefinedValue);


      expect(result).assertFalse();

      expect(hashSet.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3600
     * @tc.name      testHashSet04Chapter0036
     * @tc.desc      Test remove method with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0036';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      hashSet.add("");
      const result = hashSet.remove("");
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3700
     * @tc.name      testHashSet04Chapter0037
     * @tc.desc      Test remove method with number overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0037';
      console.log(TAG + ' start');
      const hashSet = new HashSet<number[]>();
      const arr1 = [256, 65536, 32768];
      const arr2 = [-129, 128];
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1 = hashSet.remove(arr1);
      const result2 = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3800
     * @tc.name      testHashSet04Chapter0038
     * @tc.desc      Test remove method with array containing mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0038';
      console.log(TAG + ' start');

      type MixedType = number | string | boolean | null | undefined;

      const hashSet: HashSet<Array<MixedType>> = new HashSet<Array<MixedType>>();
      const arr: Array<MixedType> = [72, "abc", true, null, undefined, 108];

      hashSet.add(arr);
      const result: boolean = hashSet.remove(arr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_3900
     * @tc.name      testHashSet04Chapter0039
     * @tc.desc      Test remove method with object containing undefined and null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0039';
      console.log(TAG + ' start');

      interface SpecialValueObject {
        a: undefined;
        b: null;
        c: number;
        d: number;
      }

      const hashSet: HashSet<SpecialValueObject> = new HashSet<SpecialValueObject>();
      const obj: SpecialValueObject = {
        a: undefined,
        b: null,
        c: NaN,
        d: Infinity
      };

      hashSet.add(obj);
      const result: boolean = hashSet.remove(obj);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4000
     * @tc.name      testHashSet04Chapter0040
     * @tc.desc      Test remove method with large string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0040';
      console.log(TAG + ' start');
      const hashSet = new HashSet<string>();
      const largeStr = "a".repeat(10000);
      hashSet.add(largeStr);
      const result = hashSet.remove(largeStr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_HASHSET_TEST04_4100
     * @tc.name      testHashSet04Chapter0041
     * @tc.desc      Test remove method with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0041';
      console.log(TAG + ' start');
      const hashSet: HashSet<Int16Array> = new HashSet<Int16Array>();
      const arr1: Int16Array = new Int16Array([-32768]);
      const arr2: Int16Array = new Int16Array([32767]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4200
     * @tc.name      testHashSet04Chapter0042
     * @tc.desc      Test remove method with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0042';
      console.log(TAG + ' start');
      const hashSet: HashSet<Uint16Array> = new HashSet<Uint16Array>();
      const arr1: Uint16Array = new Uint16Array([0]);
      const arr2: Uint16Array = new Uint16Array([65535]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4300
     * @tc.name      testHashSet04Chapter0043
     * @tc.desc      Test remove method with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0043';
      console.log(TAG + ' start');
      const hashSet: HashSet<Int32Array> = new HashSet<Int32Array>();
      const arr1: Int32Array = new Int32Array([-2147483648]);
      const arr2: Int32Array = new Int32Array([2147483647]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4400
     * @tc.name      testHashSet04Chapter0044
     * @tc.desc      Test remove method with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0044';
      console.log(TAG + ' start');
      const hashSet: HashSet<Uint32Array> = new HashSet<Uint32Array>();
      const arr1: Uint32Array = new Uint32Array([0]);
      const arr2: Uint32Array = new Uint32Array([4294967295]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4500
     * @tc.name      testHashSet04Chapter0045
     * @tc.desc      Test remove method with Float64Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0045';
      console.log(TAG + ' start');
      const hashSet: HashSet<Float64Array> = new HashSet<Float64Array>();
      const arr1: Float64Array = new Float64Array([-1.7976931348623157e308]);
      const arr2: Float64Array = new Float64Array([1.7976931348623157e308]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4600
     * @tc.name      testHashSet04Chapter0046
     * @tc.desc      Test remove method with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0046';
      console.log(TAG + ' start');
      const hashSet: HashSet<BigInt64Array> = new HashSet<BigInt64Array>();
      const arr1: BigInt64Array = new BigInt64Array([-9223372036854775808n]);
      const arr2: BigInt64Array = new BigInt64Array([9223372036854775807n]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4700
     * @tc.name      testHashSet04Chapter0047
     * @tc.desc      Test remove method with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0047';
      console.log(TAG + ' start');
      const hashSet: HashSet<BigUint64Array> = new HashSet<BigUint64Array>();
      const arr1: BigUint64Array = new BigUint64Array([0n]);
      const arr2: BigUint64Array = new BigUint64Array([18446744073709551615n]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4800
     * @tc.name      testHashSet04Chapter0048
     * @tc.desc      Test remove method with Uint8ClampedArray special handling
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0048';
      console.log(TAG + ' start');
      const hashSet: HashSet<Uint8ClampedArray> = new HashSet<Uint8ClampedArray>();
      const arr1: Uint8ClampedArray = new Uint8ClampedArray([0]);
      const arr2: Uint8ClampedArray = new Uint8ClampedArray([255]);
      const arr3: Uint8ClampedArray = new Uint8ClampedArray([300]);
      hashSet.add(arr1);
      hashSet.add(arr2);
      hashSet.add(arr3);
      const result1: boolean = hashSet.remove(arr1);
      const result2: boolean = hashSet.remove(arr2);
      const result3: boolean = hashSet.remove(arr3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_4900
     * @tc.name      testHashSet04Chapter0049
     * @tc.desc      Test remove method with string containing ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0049';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const asciiStr: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      hashSet.add(asciiStr);
      const result: boolean = hashSet.remove(asciiStr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5000
     * @tc.name      testHashSet04Chapter0050
     * @tc.desc      Test remove method with string containing repeated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0050';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const repeatedStr: string = " !!\"\"##$$%%&&''(())**++,,\\--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      hashSet.add(repeatedStr);
      const result: boolean = hashSet.remove(repeatedStr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5100
     * @tc.name      testHashSet04Chapter0051
     * @tc.desc      Test remove method with string containing illegal unicode encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0051';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const illegalUnicode: string = "\\udc04\\ud83d\\udff4";
      hashSet.add(illegalUnicode);
      const result: boolean = hashSet.remove(illegalUnicode);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5200
     * @tc.name      testHashSet04Chapter0052
     * @tc.desc      Test remove method with string keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0052';
      console.log(TAG + ' start');
      const hashSet: HashSet<string> = new HashSet<string>();
      const keyword1: string = "0";
      const keyword2: string = "NaN";
      const keyword3: string = "";
      hashSet.add(keyword1);
      hashSet.add(keyword2);
      hashSet.add(keyword3);
      const result1: boolean = hashSet.remove(keyword1);
      const result2: boolean = hashSet.remove(keyword2);
      const result3: boolean = hashSet.remove(keyword3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5300
     * @tc.name      testHashSet04Chapter0053
     * @tc.desc      Test remove method with number double type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0053';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const num1: number = Math.floor(1.5);
      const num2: number = 123.456;
      hashSet.add(num1);
      hashSet.add(num2);
      const result1: boolean = hashSet.remove(num1);
      const result2: boolean = hashSet.remove(num2);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5400
     * @tc.name      testHashSet04Chapter0054
     * @tc.desc      Test remove method with number scientific notation and exponent operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0054';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const num1: number = 1e3;
      const num2: number = 2.5e-2;
      const num3: number = 2**3;
      hashSet.add(num1);
      hashSet.add(num2);
      hashSet.add(num3);
      const result1: boolean = hashSet.remove(num1);
      const result2: boolean = hashSet.remove(num2);
      const result3: boolean = hashSet.remove(num3);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(result3).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5500
     * @tc.name      testHashSet04Chapter0055
     * @tc.desc      Test remove method with number different radix values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0055';
      console.log(TAG + ' start');
      const hashSet: HashSet<number> = new HashSet<number>();
      const hexNum: number = 0x0102;
      const octalNum: number = 0o3;
      hashSet.add(hexNum);
      hashSet.add(octalNum);
      const result1: boolean = hashSet.remove(hexNum);
      const result2: boolean = hashSet.remove(octalNum);
      expect(result1).assertTrue();
      expect(result2).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5600
     * @tc.name      testHashSet04Chapter0056
     * @tc.desc      Test remove method with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0056';
      console.log(TAG + ' start');
      const hashSet: HashSet<Array<number>> = new HashSet<Array<number>>();
      const arr: Array<number> = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      hashSet.add(arr);
      const result: boolean = hashSet.remove(arr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5700
     * @tc.name      testHashSet04Chapter0057
     * @tc.desc      Test remove method with array containing negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0057';
      console.log(TAG + ' start');
      const hashSet: HashSet<Array<number>> = new HashSet<Array<number>>();
      const arr: Array<number> = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      hashSet.add(arr);
      const result: boolean = hashSet.remove(arr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5800
     * @tc.name      testHashSet04Chapter0058
     * @tc.desc      Test remove method with array containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0058';
      console.log(TAG + ' start');
      const hashSet: HashSet<Array<number>> = new HashSet<Array<number>>();
      const arr: Array<number> = [72, 101, NaN, Infinity, 108, 111];
      hashSet.add(arr);
      const result: boolean = hashSet.remove(arr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_5900
     * @tc.name      testHashSet04Chapter0059
     * @tc.desc      Test remove method with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0059';
      console.log(TAG + ' start');
      const hashSet: HashSet<Array<number>> = new HashSet<Array<number>>();
      const arr: Array<number> = [];
      hashSet.add(arr);
      const result: boolean = hashSet.remove(arr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_6000
     * @tc.name      testHashSet04Chapter0060
     * @tc.desc      Test remove method with array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0060';
      console.log(TAG + ' start');
      const hashSet: HashSet<Array<number>> = new HashSet<Array<number>>();
      const arr: Array<number> = [256, 65536, 32768];
      hashSet.add(arr);
      const result: boolean = hashSet.remove(arr);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_6100
     * @tc.name      testHashSet04Chapter0061
     * @tc.desc      Test remove method with object containing function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0061';
      console.log(TAG + ' start');

      interface FunctionObject {
        a: number;
        b: () => void;
      }

      const hashSet: HashSet<FunctionObject> = new HashSet<FunctionObject>();
      const obj: FunctionObject = {
        a: 1,
        b: (): void => {
          console.log("function");
        }
      };

      hashSet.add(obj);
      const result: boolean = hashSet.remove(obj);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_HASHSET_TEST04_6200
     * @tc.name      testHashSet04Chapter0062
     * @tc.desc      Test remove method with object containing inherited properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0062';
      console.log(TAG + ' start');


      interface ParentProperties {
        parentProp: number;
      }

      interface ChildObject {
        childProp: string;
        parent: ParentProperties;
      }

      const parent: ParentProperties = { parentProp: 1 };
      const child: ChildObject = {
        childProp: "test",
        parent: parent
      };

      const hashSet: HashSet<ChildObject> = new HashSet<ChildObject>();
      hashSet.add(child);
      const result: boolean = hashSet.remove(child);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });
    /**
     * @tc.number    SUB_HASHSET_TEST04_6300
     * @tc.name      testHashSet04Chapter0063
     * @tc.desc      Test remove method with object containing ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testHashSet04Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testHashSet04Chapter0063';
      console.log(TAG + ' start');

      interface ArrayBufferObject {
        buffer: ArrayBuffer;
      }

      const hashSet: HashSet<ArrayBufferObject> = new HashSet<ArrayBufferObject>();
      const obj: ArrayBufferObject = { buffer: new ArrayBuffer(16) };

      hashSet.add(obj);
      const result: boolean = hashSet.remove(obj);
      expect(result).assertTrue();
      expect(hashSet.length).assertEqual(0);
    });

  })
}