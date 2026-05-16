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
  Level,
  DEFAULT
} from '@ohos/hypium';
import { PlainArray, TreeMap, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeMap08Test() {
  describe('TreeMap08Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST08_0100
     * @tc.name      testTreeMap08Chapter0001
     * @tc.desc      Get lower key with number key Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0001';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(100, "hundred");
      treeMap.set(Infinity, "infinity");
      treeMap.set(-Infinity, "negative infinity");
      const result = treeMap.getLowerKey(Infinity);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_0200
     * @tc.name      testTreeMap08Chapter0002
     * @tc.desc      Get lower key with number key -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0002';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(-1000, "minus thousand");
      treeMap.set(-Infinity, "negative infinity");
      treeMap.set(-500, "minus five hundred");
      const result = treeMap.getLowerKey(-500);
      expect(result).assertEqual(-1000);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_0300
     * @tc.name      testTreeMap08Chapter0003
     * @tc.desc      Get lower key with number key NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0003';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(1, "one");
      treeMap.set(NaN, "not a number");
      treeMap.set(2, "two");
      const result = treeMap.getLowerKey(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_0400
     * @tc.name      testTreeMap08Chapter0004
     * @tc.desc      Get lower key with number key Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0004';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_VALUE / 2, "half max");
      treeMap.set(Number.MAX_VALUE, "max value");
      treeMap.set(1.7976931348623157e308, "max value literal");
      const result = treeMap.getLowerKey(Number.MAX_VALUE);
      expect(result).assertEqual(Number.MAX_VALUE / 2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_0500
     * @tc.name      testTreeMap08Chapter0005
     * @tc.desc      Get lower key with number key Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0005';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(0, "zero");
      treeMap.set(Number.MIN_VALUE, "min value");
      treeMap.set(1e-323, "small value");
      const result = treeMap.getLowerKey(1e-323);
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_0600
     * @tc.name      testTreeMap08Chapter0006
     * @tc.desc      Get lower key with number key Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0006';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<number, string>();
      treeMap.set(0.5 * Number.EPSILON, "half epsilon");
      treeMap.set(Number.EPSILON, "epsilon");
      treeMap.set(2 * Number.EPSILON, "double epsilon");
      const result = treeMap.getLowerKey(2 * Number.EPSILON);
      expect(result).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_0700
     * @tc.name      testTreeMap08Chapter0007
     * @tc.desc      Get lower key with bigint key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0007';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<bigint, string>();
      treeMap.set(9007199254740991n, "max safe integer");
      treeMap.set(9007199254740992n, "beyond safe integer");
      treeMap.set(10000000000000000n, "large bigint");
      const result = treeMap.getLowerKey(10000000000000000n);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_0800
     * @tc.name      testTreeMap08Chapter0008
     * @tc.desc      Get lower key with boolean false key (reverse order test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0008';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<boolean, string>();
      treeMap.set(false, "false");
      treeMap.set(true, "true");
      const result = treeMap.getLowerKey(false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_0900
     * @tc.name      testTreeMap08Chapter0009
     * @tc.desc      Get lower key with array key containing mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0009';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<Array<number | string | boolean | null | undefined>, string>();
      const arr1: Array<number | string | boolean | null | undefined> = [1, "a", true, null, undefined];
      const arr2: Array<number | string | boolean | null | undefined> = [2, "b", false, null, undefined];
      const arr3: Array<number | string | boolean | null | undefined> = [3, "c", true, null, undefined];
      treeMap.set(arr1, "mixed array 1");
      treeMap.set(arr2, "mixed array 2");
      treeMap.set(arr3, "mixed array 3");
      const result = treeMap.getLowerKey(arr3);
      expect(result).assertEqual(arr2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1000
     * @tc.name      testTreeMap08Chapter0010
     * @tc.desc      Get lower key with array key containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0010';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<Array<number>, string>();
      const arr1: Array<number> = [72, 101, 108, 108, 111];
      const arr2: Array<number> = [72, 101, NaN, Infinity, 108, 111];
      const arr3: Array<number> = [72, 101, 108, 108, 111, 33];
      treeMap.set(arr1, "Hello");
      treeMap.set(arr2, "Hello with special");
      treeMap.set(arr3, "Hello!");
      const result = treeMap.getLowerKey(arr3);
      expect(result).assertEqual(arr1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1100
     * @tc.name      testTreeMap08Chapter0011
     * @tc.desc      Get lower key with empty array key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0011';
      console.log(TAG + ' start');
      const treeMap = new TreeMap<Array<number>, string>();
      const arr1: Array<number> = [];
      const arr2: Array<number> = [1];
      const arr3: Array<number> = [1, 2];
      treeMap.set(arr1, "empty array");
      treeMap.set(arr2, "single element");
      treeMap.set(arr3, "two elements");
      const result = treeMap.getLowerKey(arr2);
      expect(result).assertEqual(arr1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1200
     * @tc.name      testTreeMap08Chapter0012
     * @tc.desc      Get lower key with object key containing different property types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0012';
      console.log(TAG + ' start');

      interface TestObject {
        name: string;
        value: number;
        flag: boolean;
      }

      const treeMap = new TreeMap<TestObject, string>();
      const obj1: TestObject = { name: "first", value: 1, flag: true };
      const obj2: TestObject = { name: "second", value: 2, flag: false };
      const obj3: TestObject = { name: "third", value: 3, flag: true };
      treeMap.set(obj1, "object 1");
      treeMap.set(obj2, "object 2");
      treeMap.set(obj3, "object 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1300
     * @tc.name      testTreeMap08Chapter0013
     * @tc.desc      Get lower key with object key containing function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0013';
      console.log(TAG + ' start');

      interface FunctionObject {
        a: number;
        b: () => void;
      }

      const treeMap = new TreeMap<FunctionObject, string>();
      const obj1: FunctionObject = {
        a: 1, b: (): void => {
        }
      };
      const obj2: FunctionObject = {
        a: 2, b: (): void => {
        }
      };
      const obj3: FunctionObject = {
        a: 3, b: (): void => {
        }
      };
      treeMap.set(obj1, "object with function 1");
      treeMap.set(obj2, "object with function 2");
      treeMap.set(obj3, "object with function 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1400
     * @tc.name      testTreeMap08Chapter0014
     * @tc.desc      Get lower key with object key containing undefined and null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0014';
      console.log(TAG + ' start');

      interface UndefinedNullObject {
        a: undefined;
        b: null;
        c: number;
      }

      const treeMap = new TreeMap<UndefinedNullObject, string>();
      const obj1: UndefinedNullObject = { a: undefined, b: null, c: 1 };
      const obj2: UndefinedNullObject = { a: undefined, b: null, c: 2 };
      const obj3: UndefinedNullObject = { a: undefined, b: null, c: 3 };
      treeMap.set(obj1, "object with undefined/null 1");
      treeMap.set(obj2, "object with undefined/null 2");
      treeMap.set(obj3, "object with undefined/null 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1500
     * @tc.name      testTreeMap08Chapter0015
     * @tc.desc      Get lower key with object key containing Map property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0015';
      console.log(TAG + ' start');

      interface MapObject {
        map: Map<string, number>;
        id: number;
      }

      const treeMap = new TreeMap<MapObject, string>();
      const obj1: MapObject = { map: new Map([['key1', 1], ['key2', 2]]), id: 1 };
      const obj2: MapObject = { map: new Map([['key3', 3], ['key4', 4]]), id: 2 };
      const obj3: MapObject = { map: new Map([['key5', 5], ['key6', 6]]), id: 3 };
      treeMap.set(obj1, "object with map 1");
      treeMap.set(obj2, "object with map 2");
      treeMap.set(obj3, "object with map 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1600
     * @tc.name      testTreeMap08Chapter0016
     * @tc.desc      Get lower key with object key containing Set property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0016';
      console.log(TAG + ' start');

      interface SetObject {
        set: Set<number>;
        id: number;
      }

      const treeMap = new TreeMap<SetObject, string>();
      const obj1: SetObject = { set: new Set([1, 2, 3]), id: 1 };
      const obj2: SetObject = { set: new Set([4, 5, 6]), id: 2 };
      const obj3: SetObject = { set: new Set([7, 8, 9]), id: 3 };
      treeMap.set(obj1, "object with set 1");
      treeMap.set(obj2, "object with set 2");
      treeMap.set(obj3, "object with set 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1700
     * @tc.name      testTreeMap08Chapter0017
     * @tc.desc      Get lower key with object key containing Promise property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0017';
      console.log(TAG + ' start');

      interface PromiseObject {
        promise: Promise<string>;
        id: number;
      }

      const treeMap = new TreeMap<PromiseObject, string>();
      const obj1: PromiseObject = { promise: new Promise((resolve) => resolve("done")), id: 1 };
      const obj2: PromiseObject = { promise: new Promise((resolve) => resolve("done2")), id: 2 };
      const obj3: PromiseObject = { promise: new Promise((resolve) => resolve("done3")), id: 3 };
      treeMap.set(obj1, "object with promise 1");
      treeMap.set(obj2, "object with promise 2");
      treeMap.set(obj3, "object with promise 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1800
     * @tc.name      testTreeMap08Chapter0018
     * @tc.desc      Get lower key with object key containing RegExp property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0018';
      console.log(TAG + ' start');

      interface RegExpObject {
        regex: RegExp;
        flags: RegExp;
        id: number;
      }

      const treeMap = new TreeMap<RegExpObject, string>();
      const obj1: RegExpObject = { regex: /abc/gi, flags: /def/m, id: 1 };
      const obj2: RegExpObject = { regex: /xyz/gi, flags: /uvw/m, id: 2 };
      const obj3: RegExpObject = { regex: /123/gi, flags: /456/m, id: 3 };
      treeMap.set(obj1, "object with regex 1");
      treeMap.set(obj2, "object with regex 2");
      treeMap.set(obj3, "object with regex 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_1900
     * @tc.name      testTreeMap08Chapter0019
     * @tc.desc      Get lower key with object key containing nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0019';
      console.log(TAG + ' start');

      interface DeepestObject {
        e: number;
      }

      interface MiddleObject {
        c: number;
        d: DeepestObject;
      }

      interface NestedObject {
        a: number;
        b: MiddleObject;
      }

      const treeMap = new TreeMap<NestedObject, string>();
      const obj1: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
      const obj2: NestedObject = { a: 2, b: { c: 3, d: { e: 4 } } };
      const obj3: NestedObject = { a: 3, b: { c: 4, d: { e: 5 } } };
      treeMap.set(obj1, "nested object 1");
      treeMap.set(obj2, "nested object 2");
      treeMap.set(obj3, "nested object 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2000
     * @tc.name      testTreeMap08Chapter0020
     * @tc.desc      Get lower key with object key containing TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0020';
      console.log(TAG + ' start');

      interface TypedArrayObject {
        buffer: Uint8Array;
        id: number;
      }

      const treeMap = new TreeMap<TypedArrayObject, string>();
      const obj1: TypedArrayObject = { buffer: new Uint8Array([72, 101, 108, 108, 111]), id: 1 };
      const obj2: TypedArrayObject = { buffer: new Uint8Array([87, 111, 114, 108, 100]), id: 2 };
      const obj3: TypedArrayObject = { buffer: new Uint8Array([49, 50, 51, 63]), id: 3 };
      treeMap.set(obj1, "object with typed array 1");
      treeMap.set(obj2, "object with typed array 2");
      treeMap.set(obj3, "object with typed array 3");
      const result = treeMap.getLowerKey(obj3);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2100
     * @tc.name      testTreeMap08Chapter0021
     * @tc.desc      test getHigherKey with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0021';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-128, 'min');
      treeMap.set(127, 'max');
      treeMap.set(0, 'zero');
      expect(treeMap.getHigherKey(-128)).assertEqual(0);
      expect(treeMap.getHigherKey(127)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2200
     * @tc.name      testTreeMap08Chapter0022
     * @tc.desc      test getHigherKey with out of range Int8Array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0022';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-128, 'min');
      treeMap.set(127, 'max');
      expect(treeMap.getHigherKey(-129)).assertEqual(-128);
      expect(treeMap.getHigherKey(128)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2300
     * @tc.name      testTreeMap08Chapter0023
     * @tc.desc      test getHigherKey with Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0023';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Infinity, 'inf');
      treeMap.set(-Infinity, 'negInf');
      treeMap.set(NaN, 'nan');
      treeMap.set(0, 'zero');
      expect(treeMap.getHigherKey(-Infinity)).assertEqual(0);
      expect(treeMap.getHigherKey(0)).assertEqual(Infinity);
      expect(treeMap.getHigherKey(Infinity)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2400
     * @tc.name      testTreeMap08Chapter0024
     * @tc.desc      test getHigherKey with BigInt64Array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0024';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(-9223372036854775808n, 'min');
      treeMap.set(0n, 'zero');
      treeMap.set(9223372036854775807n, 'max');
      let key = treeMap.getHigherKey(-9223372036854775809n)
      expect(treeMap.getHigherKey(-9223372036854775809n)).assertEqual(0n);
      expect(treeMap.getHigherKey(0n)).assertEqual(9223372036854775807n);
      expect(treeMap.getHigherKey(9223372036854775808n)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2500
     * @tc.name      testTreeMap08Chapter0025
     * @tc.desc      test getHigherKey with string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0025';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("", 'empty');
      treeMap.set("a", 'a');
      treeMap.set("!", 'excl');
      treeMap.set("~", 'tilde');
      expect(treeMap.getHigherKey("")).assertEqual("!");
      expect(treeMap.getHigherKey("a")).assertEqual("~");
      expect(treeMap.getHigherKey("~")).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2600
     * @tc.name      testTreeMap08Chapter0026
     * @tc.desc      test getHigherKey with string escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0026';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("\n", 'newline');
      treeMap.set("\t", 'tab');
      treeMap.set("\\", 'backslash');
      expect(treeMap.getHigherKey("\n")).assertEqual("\\");
      expect(treeMap.getHigherKey("\t")).assertEqual("\n");
      expect(treeMap.getHigherKey("\\")).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2700
     * @tc.name      testTreeMap08Chapter0027
     * @tc.desc      test getHigherKey with emoji unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0027';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, string>();
      treeMap.set("👆", 'up');
      treeMap.set("👿", 'devil');
      treeMap.set("👀", 'eyes');
      expect(treeMap.getHigherKey("👀")).assertEqual("👆");
      expect(treeMap.getHigherKey("👆")).assertEqual("👿");
      expect(treeMap.getHigherKey("👿")).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2800
     * @tc.name      testTreeMap08Chapter0028
     * @tc.desc      test getHigherKey with number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0028';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MIN_VALUE, 'min');
      treeMap.set(0, 'zero');
      treeMap.set(Number.MAX_VALUE, 'max');
      treeMap.set(Infinity, 'inf');
      expect(treeMap.getHigherKey(Number.MIN_VALUE)).assertEqual(Number.MAX_VALUE);
      expect(treeMap.getHigherKey(0)).assertEqual(Number.MIN_VALUE);
      expect(treeMap.getHigherKey(Number.MAX_VALUE)).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_2900
     * @tc.name      testTreeMap08Chapter0029
     * @tc.desc      test getHigherKey with boolean keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0029';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<boolean, string>();
      treeMap.set(false, 'false');
      treeMap.set(true, 'true');
      expect(treeMap.getHigherKey(false)).assertTrue();
      expect(treeMap.getHigherKey(true)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3000
     * @tc.name      testTreeMap08Chapter0030
     * @tc.desc      test getHigherKey with array keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0030';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number[], string>();
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [4, 5, 6];
      let arr3: number[] = [7, 8, 9];
      treeMap.set(arr1, 'arr1');
      treeMap.set(arr2, 'arr2');
      treeMap.set(arr3, 'arr3');
      expect(treeMap.getHigherKey(arr1)).assertEqual(arr2);
      expect(treeMap.getHigherKey(arr2)).assertEqual(arr3);
      expect(treeMap.getHigherKey(arr3)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3100
     * @tc.name      testTreeMap08Chapter0031
     * @tc.desc      test getHigherKey with object keys containing nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0031';
      console.log(TAG + ' start');

      interface NestedObject {
        c: number;
      }

      interface TestKey {
        a: number;
        b: NestedObject;
      }

      let treeMap = new TreeMap<TestKey, string>();

      let key1: TestKey = {
        a: 1,
        b: {
          c: 2
        }
      };

      let key2: TestKey = {
        a: 2,
        b: {
          c: 3
        }
      };

      let key3: TestKey = {
        a: 3,
        b: {
          c: 4
        }
      };

      treeMap.set(key1, 'key1');
      treeMap.set(key2, 'key2');
      treeMap.set(key3, 'key3');

      expect(treeMap.getHigherKey(key1)).assertUndefined();
      expect(treeMap.getHigherKey(key2)).assertUndefined();
      expect(treeMap.getHigherKey(key3)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3200
     * @tc.name      testTreeMap08Chapter0032
     * @tc.desc      test getHigherKey with object keys containing complex properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0032';
      console.log(TAG + ' start');

      interface GeneratedTypeLiteralInterface_1 {
        x: number;
        y: number;
      }

      interface ComplexObject {
        a: number;
        b: string;
        nested: GeneratedTypeLiteralInterface_1;
      }

      let treeMap = new TreeMap<ComplexObject, string>();

      let obj1: ComplexObject = {
        a: 1,
        b: 'first',
        nested: {
          x: 10,
          y: 20
        }
      };

      let obj2: ComplexObject = {
        a: 2,
        b: 'second',
        nested: {
          x: 30,
          y: 40
        }
      };

      let obj3: ComplexObject = {
        a: 3,
        b: 'third',
        nested: {
          x: 50,
          y: 60
        }
      };

      treeMap.set(obj1, 'obj1');
      treeMap.set(obj2, 'obj2');
      treeMap.set(obj3, 'obj3');

      expect(treeMap.getHigherKey(obj1)).assertUndefined();
      expect(treeMap.getHigherKey(obj2)).assertUndefined();
      expect(treeMap.getHigherKey(obj3)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3300
     * @tc.name      testTreeMap08Chapter0033
     * @tc.desc      test getHigherKey with Map property keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0033';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Map<string, number>, string>();
      let map1 = new Map<string, number>([['key1', 1]]);
      let map2 = new Map<string, number>([['key2', 2]]);
      treeMap.set(map1, 'map1');
      treeMap.set(map2, 'map2');
      expect(treeMap.getHigherKey(map1)).assertUndefined();
      expect(treeMap.getHigherKey(map2)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3400
     * @tc.name      testTreeMap08Chapter0034
     * @tc.desc      test getHigherKey with Set property keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0034';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Set<number>, string>();
      let set1 = new Set<number>([1, 2, 3]);
      let set2 = new Set<number>([4, 5, 6]);
      treeMap.set(set1, 'set1');
      treeMap.set(set2, 'set2');
      expect(treeMap.getHigherKey(set1)).assertUndefined();
      expect(treeMap.getHigherKey(set2)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3500
     * @tc.name      testTreeMap08Chapter0035
     * @tc.desc      test getHigherKey with Promise property keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0035';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<Promise<number>, string>();
      let promise1 = new Promise<number>((resolve) => resolve(1));
      let promise2 = new Promise<number>((resolve) => resolve(2));
      treeMap.set(promise1, 'promise1');
      treeMap.set(promise2, 'promise2');
      expect(treeMap.getHigherKey(promise1)).assertUndefined();
      expect(treeMap.getHigherKey(promise2)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3600
     * @tc.name      testTreeMap08Chapter0036
     * @tc.desc      test getHigherKey with RegExp property keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0036';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<RegExp, string>();
      let regex1 = /abc/gi;
      let regex2 = /def/m;
      treeMap.set(regex1, 'regex1');
      treeMap.set(regex2, 'regex2');
      expect(treeMap.getHigherKey(regex1)).assertEqual(regex2);
      expect(treeMap.getHigherKey(regex2)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3700
     * @tc.name      testTreeMap08Chapter0037
     * @tc.desc      test getHigherKey with undefined key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0037';
      console.log(TAG + ' start');

      let treeMap = new TreeMap<number, string>();
      treeMap.set(1, 'one');
      treeMap.set(2, 'two');

      let undefinedValue: number | undefined = undefined;

      let result = treeMap.getHigherKey(undefinedValue!);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3800
     * @tc.name      testTreeMap08Chapter0038
     * @tc.desc      test getHigherKey with null key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0038';
      console.log(TAG + ' start');

      let treeMap = new TreeMap<number, string>();
      treeMap.set(1, 'one');
      treeMap.set(2, 'two');

      let nullValue: number | null = null;

      let result = treeMap.getHigherKey(nullValue!);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_3900
     * @tc.name      testTreeMap08Chapter0039
     * @tc.desc      test getHigherKey with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0039';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, 'min');
      treeMap.set(255, 'max');
      treeMap.set(128, 'mid');
      expect(treeMap.getHigherKey(-1)).assertEqual(0);
      expect(treeMap.getHigherKey(0)).assertEqual(128);
      expect(treeMap.getHigherKey(255)).assertUndefined();
      expect(treeMap.getHigherKey(256)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_4000
     * @tc.name      testTreeMap08Chapter0040
     * @tc.desc      test getHigherKey with Uint8ClampedArray behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0040';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, 'zero');
      treeMap.set(255, 'max');
      treeMap.set(300, 'clamped');
      expect(treeMap.getHigherKey(-1)).assertEqual(0);
      expect(treeMap.getHigherKey(0)).assertEqual(255);
      expect(treeMap.getHigherKey(255)).assertEqual(300);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_4100
     * @tc.name      testTreeMap08Chapter0041
     * @tc.desc      test getHigherKey with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0041';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-32768, 'min');
      treeMap.set(32767, 'max');
      treeMap.set(0, 'zero');
      expect(treeMap.getHigherKey(-32769)).assertEqual(-32768);
      expect(treeMap.getHigherKey(-32768)).assertEqual(0);
      expect(treeMap.getHigherKey(32767)).assertUndefined();
      expect(treeMap.getHigherKey(32768)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_4200
     * @tc.name      testTreeMap08Chapter0042
     * @tc.desc      test getHigherKey with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0042';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, 'min');
      treeMap.set(65535, 'max');
      treeMap.set(32768, 'mid');
      expect(treeMap.getHigherKey(-1)).assertEqual(0);
      expect(treeMap.getHigherKey(0)).assertEqual(32768);
      expect(treeMap.getHigherKey(65535)).assertUndefined();
      expect(treeMap.getHigherKey(65536)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_4300
     * @tc.name      testTreeMap08Chapter0043
     * @tc.desc      test getHigherKey with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0043';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-2147483648, 'min');
      treeMap.set(2147483647, 'max');
      treeMap.set(0, 'zero');
      expect(treeMap.getHigherKey(-2147483649)).assertEqual(-2147483648);
      expect(treeMap.getHigherKey(-2147483648)).assertEqual(0);
      expect(treeMap.getHigherKey(2147483647)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_4400
     * @tc.name      testTreeMap08Chapter0044
     * @tc.desc      test getHigherKey with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0044';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(0, 'min');
      treeMap.set(4294967295, 'max');
      treeMap.set(2147483648, 'mid');
      expect(treeMap.getHigherKey(-1)).assertEqual(0);
      expect(treeMap.getHigherKey(0)).assertEqual(2147483648);
      expect(treeMap.getHigherKey(4294967295)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_4500
     * @tc.name      testTreeMap08Chapter0045
     * @tc.desc      test getHigherKey with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0045';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-1.7976931348623157e308, 'min');
      treeMap.set(1.7976931348623157e308, 'max');
      treeMap.set(0, 'zero');
      expect(treeMap.getHigherKey(-1.8e308)).assertEqual(-1.7976931348623157e308);
      expect(treeMap.getHigherKey(-1.7976931348623157e308)).assertEqual(0);
      expect(treeMap.getHigherKey(1.7976931348623157e308)).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST08_4600
     * @tc.name      testTreeMap08Chapter0046
     * @tc.desc      test getHigherKey with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap08Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap08Chapter0046';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(0n, 'zero');
      treeMap.set(18446744073709551615n, 'max');
      treeMap.set(9223372036854775808n, 'mid');
      expect(treeMap.getHigherKey(0n)).assertEqual(18446744073709551615n);
      expect(treeMap.getHigherKey(18446744073709551615n)).assertEqual(9223372036854775808n);
      expect(treeMap.getHigherKey(9223372036854775808n)).assertUndefined();
    });
  })
}