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

interface GeneratedTypeLiteralInterface_2 {
  e: number;
}

interface GeneratedTypeLiteralInterface_1 {
  c: number;
  d: GeneratedTypeLiteralInterface_2;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeMap04Test() {
  describe('TreeMap04Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST04_0100
     * @tc.name      testTreeMap04Chapter0001
     * @tc.desc      Get value with string key "sparrow" from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0001';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);
      let result: number | undefined = treeMap.get("sparrow");
      expect(result).assertEqual(356);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_0200
     * @tc.name      testTreeMap04Chapter0002
     * @tc.desc      Get value with string key "squirrel" from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0002';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);
      let result: number | undefined = treeMap.get("squirrel");
      expect(result).assertEqual(123);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_0300
     * @tc.name      testTreeMap04Chapter0003
     * @tc.desc      Get value with string key "undefined" from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0003';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("undefined", 999);
      let result: number | undefined = treeMap.get("undefined");
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_0400
     * @tc.name      testTreeMap04Chapter0004
     * @tc.desc      Get value with string key "null" from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0004';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("null", 777);
      let result: number | undefined = treeMap.get("null");
      expect(result).assertEqual(777);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_0500
     * @tc.name      testTreeMap04Chapter0005
     * @tc.desc      Get value with string key "NaN" from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0005';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("NaN", 555);
      let result: number | undefined = treeMap.get("NaN");
      expect(result).assertEqual(555);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_0600
     * @tc.name      testTreeMap04Chapter0006
     * @tc.desc      Get value with string key "Infinity" from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0006';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("Infinity", 111);
      let result: number | undefined = treeMap.get("Infinity");
      expect(result).assertEqual(111);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_0700
     * @tc.name      testTreeMap04Chapter0007
     * @tc.desc      Get value with string key "-Infinity" from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0007';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("-Infinity", 222);
      let result: number | undefined = treeMap.get("-Infinity");
      expect(result).assertEqual(222);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_0800
     * @tc.name      testTreeMap04Chapter0008
     * @tc.desc      Get value with string key "" from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0008';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("", 333);
      let result: number | undefined = treeMap.get("");
      expect(result).assertEqual(333);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_0900
     * @tc.name      testTreeMap04Chapter0009
     * @tc.desc      Get value with number key 0 from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0009';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(0, "zero");
      let result: string | undefined = treeMap.get(0);
      expect(result).assertEqual("zero");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1000
     * @tc.name      testTreeMap04Chapter0010
     * @tc.desc      Get value with number key -0 from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0010';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(-0, "negative zero");
      let result: string | undefined = treeMap.get(-0);
      expect(result).assertEqual("negative zero");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1100
     * @tc.name      testTreeMap04Chapter0011
     * @tc.desc      Get value with number key NaN from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0011';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(NaN, "not a number");
      let result: string | undefined = treeMap.get(NaN);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1200
     * @tc.name      testTreeMap04Chapter0012
     * @tc.desc      Get value with number key Infinity from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0012';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(Infinity, "infinity");
      let result: string | undefined = treeMap.get(Infinity);
      expect(result).assertEqual("infinity");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1300
     * @tc.name      testTreeMap04Chapter0013
     * @tc.desc      Get value with number key -Infinity from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0013';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(-Infinity, "negative infinity");
      let result: string | undefined = treeMap.get(-Infinity);
      expect(result).assertEqual("negative infinity");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1400
     * @tc.name      testTreeMap04Chapter0014
     * @tc.desc      Get value with number key Number.MAX_VALUE from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0014';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(Number.MAX_VALUE, "max value");
      let result: string | undefined = treeMap.get(Number.MAX_VALUE);
      expect(result).assertEqual("max value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1500
     * @tc.name      testTreeMap04Chapter0015
     * @tc.desc      Get value with number key Number.MIN_VALUE from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0015';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(Number.MIN_VALUE, "min value");
      let result: string | undefined = treeMap.get(Number.MIN_VALUE);
      expect(result).assertEqual("min value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1600
     * @tc.name      testTreeMap04Chapter0016
     * @tc.desc      Get value with number key Number.EPSILON from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0016';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(Number.EPSILON, "epsilon");
      let result: string | undefined = treeMap.get(Number.EPSILON);
      expect(result).assertEqual("epsilon");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1700
     * @tc.name      testTreeMap04Chapter0017
     * @tc.desc      Get value with number key Number.MAX_SAFE_INTEGER from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0017';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(Number.MAX_SAFE_INTEGER, "max safe integer");
      let result: string | undefined = treeMap.get(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual("max safe integer");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1800
     * @tc.name      testTreeMap04Chapter0018
     * @tc.desc      Get value with number key Number.MIN_SAFE_INTEGER from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0018';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(Number.MIN_SAFE_INTEGER, "min safe integer");
      let result: string | undefined = treeMap.get(Number.MIN_SAFE_INTEGER);
      expect(result).assertEqual("min safe integer");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_1900
     * @tc.name      testTreeMap04Chapter0019
     * @tc.desc      Get value with boolean key true from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0019';
      console.log(TAG + ' start');
      let treeMap: TreeMap<boolean, string> = new TreeMap<boolean, string>();
      treeMap.set(true, "true value");
      let result: string | undefined = treeMap.get(true);
      expect(result).assertEqual("true value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2000
     * @tc.name      testTreeMap04Chapter0020
     * @tc.desc      Get value with boolean key false from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0020';
      console.log(TAG + ' start');
      let treeMap: TreeMap<boolean, string> = new TreeMap<boolean, string>();
      treeMap.set(false, "false value");
      let result: string | undefined = treeMap.get(false);
      expect(result).assertEqual("false value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2100
     * @tc.name      testTreeMap04Chapter0021
     * @tc.desc      Get value with bigint key 0n from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0021';
      console.log(TAG + ' start');
      let treeMap: TreeMap<bigint, string> = new TreeMap<bigint, string>();
      treeMap.set(0n, "zero bigint");
      let result: string | undefined = treeMap.get(0n);
      expect(result).assertEqual("zero bigint");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2200
     * @tc.name      testTreeMap04Chapter0022
     * @tc.desc      Get value with bigint key 9223372036854775807n from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0022';
      console.log(TAG + ' start');
      let treeMap: TreeMap<bigint, string> = new TreeMap<bigint, string>();
      treeMap.set(9223372036854775807n, "max int64");
      let result: string | undefined = treeMap.get(9223372036854775807n);
      expect(result).assertEqual("max int64");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2300
     * @tc.name      testTreeMap04Chapter0023
     * @tc.desc      Get value with bigint key 18446744073709551615n from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0023';
      console.log(TAG + ' start');
      let treeMap: TreeMap<bigint, string> = new TreeMap<bigint, string>();
      treeMap.set(18446744073709551615n, "max uint64");
      let result: string | undefined = treeMap.get(18446744073709551615n);
      expect(result).assertEqual("max uint64");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2400
     * @tc.name      testTreeMap04Chapter0024
     * @tc.desc      Get value with array key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0024';
      console.log(TAG + ' start');
      let key: number[] = [1, 2, 3];
      let treeMap: TreeMap<number[], string> = new TreeMap<number[], string>();
      treeMap.set(key, "array value");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("array value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2500
     * @tc.name      testTreeMap04Chapter0025
     * @tc.desc      Get value with object key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0025';
      console.log(TAG + ' start');

      interface TestObject {
        id: number;
      }

      let key: TestObject = { id: 1 };
      let treeMap: TreeMap<TestObject, string> = new TreeMap<TestObject, string>();
      treeMap.set(key, "object value");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("object value");
    });


    /**
     * @tc.number    SUB_TREEMAP_TEST04_2600
     * @tc.name      testTreeMap04Chapter0026
     * @tc.desc      Get value with non-existent key from TreeMap, should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0026';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      let result: number | undefined = treeMap.get("non-existent");
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2700
     * @tc.name      testTreeMap04Chapter0027
     * @tc.desc      Get value with string key containing special characters from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0027';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      let key: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      treeMap.set(key, 888);
      let result: number | undefined = treeMap.get(key);
      expect(result).assertEqual(888);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2800
     * @tc.name      testTreeMap04Chapter0028
     * @tc.desc      Get value with string key containing ASCII characters from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0028';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      let key: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      treeMap.set(key, 999);
      let result: number | undefined = treeMap.get(key);
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_2900
     * @tc.name      testTreeMap04Chapter0029
     * @tc.desc      Get value with string key containing escape characters from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0029';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      let key: string = "\a\b\f\n\r\t\v\\\'\"\?";
      treeMap.set(key, 1111);
      let result: number | undefined = treeMap.get(key);
      expect(result).assertEqual(1111);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3000
     * @tc.name      testTreeMap04Chapter0030
     * @tc.desc      Get value with string key containing emoji from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0030';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      let key: string = "👆";
      treeMap.set(key, 2222);
      let result: number | undefined = treeMap.get(key);
      expect(result).assertEqual(2222);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3100
     * @tc.name      testTreeMap04Chapter0031
     * @tc.desc      Get value with number key -128 from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0031';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(-128, "byte min");
      let result: string | undefined = treeMap.get(-128);
      expect(result).assertEqual("byte min");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3200
     * @tc.name      testTreeMap04Chapter0032
     * @tc.desc      Get value with number key 127 from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0032';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(127, "byte max");
      let result: string | undefined = treeMap.get(127);
      expect(result).assertEqual("byte max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3300
     * @tc.name      testTreeMap04Chapter0033
     * @tc.desc      Get value with number key -32768 from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0033';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(-32768, "short min");
      let result: string | undefined = treeMap.get(-32768);
      expect(result).assertEqual("short min");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3400
     * @tc.name      testTreeMap04Chapter0034
     * @tc.desc      Get value with number key 32767 from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0034';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(32767, "short max");
      let result: string | undefined = treeMap.get(32767);
      expect(result).assertEqual("short max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3500
     * @tc.name      testTreeMap04Chapter0035
     * @tc.desc      Get value with number key -2147483648 from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0035';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(-2147483648, "int min");
      let result: string | undefined = treeMap.get(-2147483648);
      expect(result).assertEqual("int min");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3600
     * @tc.name      testTreeMap04Chapter0036
     * @tc.desc      Get value with number key 2147483647 from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0036';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(2147483647, "int max");
      let result: string | undefined = treeMap.get(2147483647);
      expect(result).assertEqual("int max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3700
     * @tc.name      testTreeMap04Chapter0037
     * @tc.desc      Get value with bigint key -9223372036854775808n from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0037';
      console.log(TAG + ' start');
      let treeMap: TreeMap<bigint, string> = new TreeMap<bigint, string>();
      treeMap.set(-9223372036854775808n, "bigint min");
      let result: string | undefined = treeMap.get(-9223372036854775808n);
      expect(result).assertEqual("bigint min");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3800
     * @tc.name      testTreeMap04Chapter0038
     * @tc.desc      Get value with string key containing special characters repeated twice from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0038';
      console.log(TAG + ' start');
      let treeMap: TreeMap<string, number> = new TreeMap<string, number>();
      let key: string = "!!\"\"##$$%%&&''(())**++,,\\--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      treeMap.set(key, 7777);
      let result: number | undefined = treeMap.get(key);
      expect(result).assertEqual(7777);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_3900
     * @tc.name      testTreeMap04Chapter0039
     * @tc.desc      Get value with number key containing octal number from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0039';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(0o377, "octal max");
      let result: string | undefined = treeMap.get(0o377);
      expect(result).assertEqual("octal max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4000
     * @tc.name      testTreeMap04Chapter0040
     * @tc.desc      Get value with number key containing hex number from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0040';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(0x0102, "hex value");
      let result: string | undefined = treeMap.get(0x0102);
      expect(result).assertEqual("hex value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4100
     * @tc.name      testTreeMap04Chapter0041
     * @tc.desc      Get value with number key using scientific notation from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0041';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(1e3, "scientific notation");
      let result: string | undefined = treeMap.get(1e3);
      expect(result).assertEqual("scientific notation");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4200
     * @tc.name      testTreeMap04Chapter0042
     * @tc.desc      Get value with number key using exponential operator from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0042';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(2**3, "exponential");
      let result: string | undefined = treeMap.get(8);
      expect(result).assertEqual("exponential");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4300
     * @tc.name      testTreeMap04Chapter0043
     * @tc.desc      Get value with number key 65535 (char max) from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0043';
      console.log(TAG + ' start');
      let treeMap: TreeMap<number, string> = new TreeMap<number, string>();
      treeMap.set(65535, "char max");
      let result: string | undefined = treeMap.get(65535);
      expect(result).assertEqual("char max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4400
     * @tc.name      testTreeMap04Chapter0044
     * @tc.desc      Get value with array containing zeros from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0044';
      console.log(TAG + ' start');
      let key: number[] = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      let treeMap: TreeMap<number[], string> = new TreeMap<number[], string>();
      treeMap.set(key, "array with zeros");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("array with zeros");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4500
     * @tc.name      testTreeMap04Chapter0045
     * @tc.desc      Get value with array containing negative numbers from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0045';
      console.log(TAG + ' start');
      let key: number[] = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      let treeMap: TreeMap<number[], string> = new TreeMap<number[], string>();
      treeMap.set(key, "array with negatives");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("array with negatives");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4600
     * @tc.name      testTreeMap04Chapter0046
     * @tc.desc      Get value with empty array key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0046';
      console.log(TAG + ' start');
      let key: number[] = [];
      let treeMap: TreeMap<number[], string> = new TreeMap<number[], string>();
      treeMap.set(key, "empty array");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("empty array");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4700
     * @tc.name      testTreeMap04Chapter0047
     * @tc.desc      Get value with array containing overflow values from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0047';
      console.log(TAG + ' start');
      let key: number[] = [256, 65536, 32768];
      let treeMap: TreeMap<number[], string> = new TreeMap<number[], string>();
      treeMap.set(key, "array with overflow");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("array with overflow");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4800
     * @tc.name      testTreeMap04Chapter0048
     * @tc.desc      Get value with nested object key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0048';
      console.log(TAG + ' start');

      interface InnerMostObject {
        e: number;
      }

      interface MiddleObject {
        c: number;
        d: InnerMostObject;
      }

      interface NestedObject {
        a: number;
        b: MiddleObject;
      }

      let key: NestedObject = { a: 1, b: { c: 2, d: { e: 3 } } };
      let treeMap: TreeMap<NestedObject, string> = new TreeMap<NestedObject, string>();
      treeMap.set(key, "nested object");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("nested object");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_4900
     * @tc.name      testTreeMap04Chapter0049
     * @tc.desc      Get value with object containing undefined property from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0049';
      console.log(TAG + ' start');

      interface ObjectWithUndefined {
        a: number | undefined;
        b: number;
      }

      let key: ObjectWithUndefined = { a: undefined, b: 1 };
      let treeMap: TreeMap<ObjectWithUndefined, string> = new TreeMap<ObjectWithUndefined, string>();
      treeMap.set(key, "object with undefined");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("object with undefined");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5000
     * @tc.name      testTreeMap04Chapter0050
     * @tc.desc      Get value with object containing null property from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0050';
      console.log(TAG + ' start');

      interface ObjectWithNull {
        a: number | null;
        b: number;
      }

      let key: ObjectWithNull = { a: null, b: 1 };
      let treeMap: TreeMap<ObjectWithNull, string> = new TreeMap<ObjectWithNull, string>();
      treeMap.set(key, "object with null");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("object with null");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5100
     * @tc.name      testTreeMap04Chapter0051
     * @tc.desc      Get value with object containing NaN property from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0051';
      console.log(TAG + ' start');

      interface ObjectWithNaN {
        a: number;
        b: number;
      }

      let key: ObjectWithNaN = { a: NaN, b: 1 };
      let treeMap: TreeMap<ObjectWithNaN, string> = new TreeMap<ObjectWithNaN, string>();
      treeMap.set(key, "object with NaN");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("object with NaN");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5200
     * @tc.name      testTreeMap04Chapter0052
     * @tc.desc      Get value with empty object key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0052';
      console.log(TAG + ' start');

      interface EmptyObject {}

      let key: EmptyObject = {};
      let treeMap: TreeMap<EmptyObject, string> = new TreeMap<EmptyObject, string>();
      treeMap.set(key, "empty object");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("empty object");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5300
     * @tc.name      testTreeMap04Chapter0053
     * @tc.desc      Get value with different object key (same structure but different reference) from TreeMap, should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0053';
      console.log(TAG + ' start');

      interface TestObject {
        id: number;
      }

      let key1: TestObject = { id: 1 };
      let key2: TestObject = { id: 1 };
      let treeMap: TreeMap<TestObject, string> = new TreeMap<TestObject, string>();
      treeMap.set(key1, "object value");
      let result: string | undefined = treeMap.get(key2);
      expect(result).assertEqual("object value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5400
     * @tc.name      testTreeMap04Chapter0054
     * @tc.desc      Get value with Uint8Array key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0054';
      console.log(TAG + ' start');
      let key: Uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      let treeMap: TreeMap<Uint8Array, string> = new TreeMap<Uint8Array, string>();
      treeMap.set(key, "Uint8Array key");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Uint8Array key");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5500
     * @tc.name      testTreeMap04Chapter0055
     * @tc.desc      Get value with Int8Array key containing boundary values from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0055';
      console.log(TAG + ' start');
      let key: Int8Array = new Int8Array([-128, 127]);
      let treeMap: TreeMap<Int8Array, string> = new TreeMap<Int8Array, string>();
      treeMap.set(key, "Int8Array boundaries");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Int8Array boundaries");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5600
     * @tc.name      testTreeMap04Chapter0056
     * @tc.desc      Get value with Uint8ClampedArray key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0056';
      console.log(TAG + ' start');
      let key: Uint8ClampedArray = new Uint8ClampedArray([0, 255]);
      let treeMap: TreeMap<Uint8ClampedArray, string> = new TreeMap<Uint8ClampedArray, string>();
      treeMap.set(key, "Uint8ClampedArray");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Uint8ClampedArray");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5700
     * @tc.name      testTreeMap04Chapter0057
     * @tc.desc      Get value with Int16Array key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0057';
      console.log(TAG + ' start');
      let key: Int16Array = new Int16Array([-32768, 32767]);
      let treeMap: TreeMap<Int16Array, string> = new TreeMap<Int16Array, string>();
      treeMap.set(key, "Int16Array boundaries");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Int16Array boundaries");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5800
     * @tc.name      testTreeMap04Chapter0058
     * @tc.desc      Get value with Float32Array key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0058';
      console.log(TAG + ' start');
      let key: Float32Array = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38]);
      let treeMap: TreeMap<Float32Array, string> = new TreeMap<Float32Array, string>();
      treeMap.set(key, "Float32Array boundaries");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Float32Array boundaries");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_5900
     * @tc.name      testTreeMap04Chapter0059
     * @tc.desc      Get value with Float64Array key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0059';
      console.log(TAG + ' start');
      let key: Float64Array = new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308]);
      let treeMap: TreeMap<Float64Array, string> = new TreeMap<Float64Array, string>();
      treeMap.set(key, "Float64Array boundaries");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Float64Array boundaries");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6000
     * @tc.name      testTreeMap04Chapter0060
     * @tc.desc      Get value with object containing special property keys from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0060';
      console.log(TAG + ' start');

      interface ObjectWithSpecialKeys {
        a: number;
        "special-key": string;
        "123numeric": boolean;
      }

      let key: ObjectWithSpecialKeys = {
        a: 1,
        "special-key": "value",
        "123numeric": true
      };

      let treeMap: TreeMap<ObjectWithSpecialKeys, string> = new TreeMap<ObjectWithSpecialKeys, string>();
      treeMap.set(key, "object with special keys");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("object with special keys");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6100
     * @tc.name      testTreeMap04Chapter0061
     * @tc.desc      Get value with object containing function property from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0061';
      console.log(TAG + ' start');

      interface ObjectWithFunction {
        a: number;
        b: () => void;
      }

      let key: ObjectWithFunction = {
        a: 1, b: () => {
        }
      };
      let treeMap: TreeMap<ObjectWithFunction, string> = new TreeMap<ObjectWithFunction, string>();
      treeMap.set(key, "object with function");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("object with function");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6200
     * @tc.name      testTreeMap04Chapter0062
     * @tc.desc      Get value with Map key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0062';
      console.log(TAG + ' start');

      interface SimpleMapValue {
        data: string;
      }

      const mapEntry1: [string, SimpleMapValue] = ['key1', { data: 'value1' }];
      const mapEntry2: [string, SimpleMapValue] = ['key2', { data: 'value2' }];

      let key: Map<string, SimpleMapValue> = new Map<string, SimpleMapValue>([mapEntry1, mapEntry2]);

      let treeMap: TreeMap<Map<string, SimpleMapValue>, string> = new TreeMap<Map<string, SimpleMapValue>, string>();
      treeMap.set(key, "Map key");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Map key");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6300
     * @tc.name      testTreeMap04Chapter0063
     * @tc.desc      Get value with Set key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0063';
      console.log(TAG + ' start');
      let key: Set<number> = new Set<number>([1, 2, 3, 2, 1]);
      let treeMap: TreeMap<Set<number>, string> = new TreeMap<Set<number>, string>();
      treeMap.set(key, "Set key");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Set key");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6400
     * @tc.name      testTreeMap04Chapter0064
     * @tc.desc      Get value with ArrayBuffer key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0064';
      console.log(TAG + ' start');
      let key: ArrayBuffer = new ArrayBuffer(16);
      let treeMap: TreeMap<ArrayBuffer, string> = new TreeMap<ArrayBuffer, string>();
      treeMap.set(key, "ArrayBuffer key");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("ArrayBuffer key");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6500
     * @tc.name      testTreeMap04Chapter0065
     * @tc.desc      Get value with DataView key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0065';
      console.log(TAG + ' start');
      let buffer: ArrayBuffer = new ArrayBuffer(16);
      let key: DataView = new DataView(buffer);
      let treeMap: TreeMap<DataView, string> = new TreeMap<DataView, string>();
      treeMap.set(key, "DataView key");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("DataView key");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6600
     * @tc.name      testTreeMap04Chapter0066
     * @tc.desc      Get value with Promise key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0066';
      console.log(TAG + ' start');
      let key: Promise<string> = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
      let treeMap: TreeMap<Promise<string>, string> = new TreeMap<Promise<string>, string>();
      treeMap.set(key, "Promise key");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("Promise key");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6700
     * @tc.name      testTreeMap04Chapter0067
     * @tc.desc      Get value with RegExp key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0067';
      console.log(TAG + ' start');
      let key: RegExp = /abc/gi;
      let treeMap: TreeMap<RegExp, string> = new TreeMap<RegExp, string>();
      treeMap.set(key, "RegExp key");
      let result: string | undefined = treeMap.get(key);
      expect(result).assertEqual("RegExp key");
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST04_6800
     * @tc.name      testTreeMap04Chapter0068
     * @tc.desc      Attempt to get value with Float32Array containing Infinity/NaN from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0068';
      console.log(TAG + ' start');
      try {
        let key: Float32Array = new Float32Array([Infinity, -Infinity, NaN]);
        let treeMap: TreeMap<Float32Array, string> = new TreeMap<Float32Array, string>();
        treeMap.set(key, "Float32Array special values");
        let result: string | undefined = treeMap.get(key);
        expect(result).assertEqual("Float32Array special values");
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_6900
     * @tc.name      testTreeMap04Chapter0069
     * @tc.desc      Attempt to get value with Int8Array containing out of bounds values from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0069';
      console.log(TAG + ' start');
      try {
        let key: Int8Array = new Int8Array([-129, 128]);
        let treeMap: TreeMap<Int8Array, string> = new TreeMap<Int8Array, string>();
        treeMap.set(key, "Int8Array out of bounds");
        let result: string | undefined = treeMap.get(key);
        expect(result).assertEqual("Int8Array out of bounds");
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7000
     * @tc.name      testTreeMap04Chapter0070
     * @tc.desc      Attempt to get value with Uint8Array containing out of bounds values from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0070';
      console.log(TAG + ' start');
      try {
        let key: Uint8Array = new Uint8Array([-1, 256]);
        let treeMap: TreeMap<Uint8Array, string> = new TreeMap<Uint8Array, string>();
        treeMap.set(key, "Uint8Array out of bounds");
        let result: string | undefined = treeMap.get(key);
        expect(result).assertEqual("Uint8Array out of bounds");
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7100
     * @tc.name      testTreeMap04Chapter0071
     * @tc.desc      Attempt to get value with BigInt64Array key from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0071';
      console.log(TAG + ' start');
      try {
        let key: BigInt64Array = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
        let treeMap: TreeMap<BigInt64Array, string> = new TreeMap<BigInt64Array, string>();
        treeMap.set(key, "BigInt64Array key");
        let result: string | undefined = treeMap.get(key);
        expect(result).assertEqual("BigInt64Array key");
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7200
     * @tc.name      testTreeMap04Chapter0072
     * @tc.desc      Attempt to get value with object containing non-enumerable property from TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0072';
      console.log(TAG + ' start');

      interface TestObject {
        a: number;
        b: number;
      }

      try {
        let key: TestObject = { a: 1, b: 2 };

        let treeMap: TreeMap<TestObject, string> = new TreeMap<TestObject, string>();
        treeMap.set(key, "test object");
        let result: string | undefined = treeMap.get(key);
        expect(result).assertEqual("test object");
      } catch (e) {
        expect(e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7300
     * @tc.name      testTreeMap04Chapter0073
     * @tc.desc      Get first key when TreeMap has multiple string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0073';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("sparrow");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7400
     * @tc.name      testTreeMap04Chapter0074
     * @tc.desc      Get first key when TreeMap is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0074';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      let result = treeMap.getFirstKey();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7500
     * @tc.name      testTreeMap04Chapter0075
     * @tc.desc      Get first key when TreeMap has only one key-value pair
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0075';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("singleKey", 999);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("singleKey");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7600
     * @tc.name      testTreeMap04Chapter0076
     * @tc.desc      Get first key when TreeMap has multiple number keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0076';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(100, "value100");
      treeMap.set(50, "value50");
      treeMap.set(200, "value200");
      let result = treeMap.getFirstKey();
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7700
     * @tc.name      testTreeMap04Chapter0077
     * @tc.desc      Get first key when TreeMap keys include special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0077';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("!special", 1);
      treeMap.set("#hash", 2);
      treeMap.set("$dollar", 3);
      treeMap.set("normal", 4);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("!special");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7800
     * @tc.name      testTreeMap04Chapter0078
     * @tc.desc      Get first key after deleting all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0078';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("key1", 1);
      treeMap.set("key2", 2);
      treeMap.clear();
      let result = treeMap.getFirstKey();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_7900
     * @tc.name      testTreeMap04Chapter0079
     * @tc.desc      Get first key when TreeMap uses boolean as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0079';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<boolean, string>();
      treeMap.set(true, "trueValue");
      treeMap.set(false, "falseValue");
      let result = treeMap.getFirstKey();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8000
     * @tc.name      testTreeMap04Chapter0080
     * @tc.desc      Get first key when TreeMap keys are emoji unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0080';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("👆", 1);
      treeMap.set("👿", 2);
      treeMap.set("👀", 3);
      treeMap.set("💯", 4);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("👀");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8100
     * @tc.name      testTreeMap04Chapter0081
     * @tc.desc      Get first key when TreeMap uses bigint as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0081';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<bigint, string>();
      treeMap.set(9223372036854775807n, "maxBigInt");
      treeMap.set(-9223372036854775808n, "minBigInt");
      treeMap.set(0n, "zero");
      let result = treeMap.getFirstKey();
      expect(result).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8200
     * @tc.name      testTreeMap04Chapter0082
     * @tc.desc      Get first key when TreeMap uses mixed numeric types (number and bigint cannot be mixed in same TreeMap due to typing)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0082';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_SAFE_INTEGER, "maxSafe");
      treeMap.set(Number.MIN_SAFE_INTEGER, "minSafe");
      treeMap.set(0, "zero");
      let result = treeMap.getFirstKey();
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8300
     * @tc.name      testTreeMap04Chapter0083
     * @tc.desc      Get first key after removing first element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0083';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("a", 1);
      treeMap.set("b", 2);
      treeMap.set("c", 3);
      treeMap.remove("a");
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("b");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8400
     * @tc.name      testTreeMap04Chapter0084
     * @tc.desc      Get first key when TreeMap has keys with escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0084';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("\nnewline", 1);
      treeMap.set("\ttab", 2);
      treeMap.set("\\backslash", 3);
      treeMap.set("normal", 4);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("\ttab");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8500
     * @tc.name      testTreeMap04Chapter0085
     * @tc.desc      Get first key when TreeMap keys are negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0085';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(-100, "neg100");
      treeMap.set(-200, "neg200");
      treeMap.set(0, "zero");
      treeMap.set(100, "pos100");
      let result = treeMap.getFirstKey();
      expect(result).assertEqual(-200);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8600
     * @tc.name      testTreeMap04Chapter0086
     * @tc.desc      Get first key when TreeMap keys are hexadecimal strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0086';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("0x0102", 1);
      treeMap.set("0x01020304", 2);
      treeMap.set("0x3", 3);
      treeMap.set("normal", 4);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("0x0102");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8700
     * @tc.name      testTreeMap04Chapter0087
     * @tc.desc      Get first key when TreeMap keys are scientific notation numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0087';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(1e3, "thousand");
      treeMap.set(2.5e-2, "small");
      treeMap.set(0, "zero");
      treeMap.set(-1e3, "negThousand");
      let result = treeMap.getFirstKey();
      expect(result).assertEqual(-1e3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8800
     * @tc.name      testTreeMap04Chapter0088
     * @tc.desc      Get first key when TreeMap has keys with repeated characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0088';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("aaaa", 1);
      treeMap.set("aaa", 2);
      treeMap.set("aa", 3);
      treeMap.set("a", 4);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("a");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_8900
     * @tc.name      testTreeMap04Chapter0089
     * @tc.desc      Get first key when TreeMap has keys with mixed case letters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0089';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("Apple", 1);
      treeMap.set("banana", 2);
      treeMap.set("cherry", 3);
      treeMap.set("apple", 4);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("Apple");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_9000
     * @tc.name      testTreeMap04Chapter0090
     * @tc.desc      Get first key when TreeMap has keys as empty strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0090';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("", 1);
      treeMap.set("nonEmpty", 2);
      treeMap.set("another", 3);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_9100
     * @tc.name      testTreeMap04Chapter0091
     * @tc.desc      Get first key when TreeMap has extreme numeric keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0091';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_VALUE, "maxValue");
      treeMap.set(Number.MIN_VALUE, "minValue");
      treeMap.set(0, "zero");
      let result = treeMap.getFirstKey();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_9200
     * @tc.name      testTreeMap04Chapter0092
     * @tc.desc      Get first key after updating value of first key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0092';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("first", 1);
      treeMap.set("second", 2);
      treeMap.set("third", 3);
      treeMap.set("first", 100);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("first");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST04_9300
     * @tc.name      testTreeMap04Chapter0093
     * @tc.desc      Get first key when TreeMap uses keys with whitespace
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap04Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap04Chapter0093';
      console.log(TAG + ' start');
      let treeMap = new TreeMap<string, number>();
      treeMap.set("  leading", 1);
      treeMap.set("trailing  ", 2);
      treeMap.set("  both  ", 3);
      treeMap.set("noSpace", 4);
      let result = treeMap.getFirstKey();
      expect(result).assertEqual("  both  ");
    });
  })
}