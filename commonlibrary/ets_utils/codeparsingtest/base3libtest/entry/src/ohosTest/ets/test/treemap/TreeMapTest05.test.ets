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

export default function TreeMap05Test() {
  describe('TreeMap05Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST05_0100
     * @tc.name      testTreeMap05Chapter0001
     * @tc.desc      Test getLastKey method with string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0001';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("squirrel");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_0200
     * @tc.name      testTreeMap05Chapter0002
     * @tc.desc      Test getLastKey method with empty TreeMap returns undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0002';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      const result = treeMap.getLastKey();

      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_0300
     * @tc.name      testTreeMap05Chapter0003
     * @tc.desc      Test getLastKey method with number keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0003';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(100, "value100");
      treeMap.set(50, "value50");
      treeMap.set(200, "value200");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(200);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_0400
     * @tc.name      testTreeMap05Chapter0004
     * @tc.desc      Test getLastKey method with number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0004';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_VALUE, "max");
      treeMap.set(Number.MIN_VALUE, "min");
      treeMap.set(0, "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_0500
     * @tc.name      testTreeMap05Chapter0005
     * @tc.desc      Test getLastKey method with Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0005';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(Infinity, "inf");
      treeMap.set(-Infinity, "negInf");
      treeMap.set(0, "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_0600
     * @tc.name      testTreeMap05Chapter0006
     * @tc.desc      Test getLastKey method with NaN keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0006';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(NaN, "nan1");
      treeMap.set(100, "normal");
      treeMap.set(NaN, "nan2");
      const result = treeMap.getLastKey();

      expect(result).assertNaN();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_0700
     * @tc.name      testTreeMap05Chapter0007
     * @tc.desc      Test getLastKey method with special string characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0007';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("!", 1);
      treeMap.set("#", 2);
      treeMap.set("$", 3);
      treeMap.set("%", 4);
      const result = treeMap.getLastKey();
      expect(result).assertEqual("%");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_0800
     * @tc.name      testTreeMap05Chapter0008
     * @tc.desc      Test getLastKey method with emoji string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0008';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("👆", 1);
      treeMap.set("👿", 2);
      treeMap.set("👀", 3);
      treeMap.set("💯", 4);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("💯");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_0900
     * @tc.name      testTreeMap05Chapter0009
     * @tc.desc      Test getLastKey method with empty string key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0009';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("", 1);
      treeMap.set("a", 2);
      treeMap.set("b", 3);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("b");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1000
     * @tc.name      testTreeMap05Chapter0010
     * @tc.desc      Test getLastKey method with boolean keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0010';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<boolean, string>();
      treeMap.set(true, "truth");
      treeMap.set(false, "falsehood");
      const result = treeMap.getLastKey();

      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1100
     * @tc.name      testTreeMap05Chapter0011
     * @tc.desc      Test getLastKey method with single element TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0011';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("single", 1);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("single");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1200
     * @tc.name      testTreeMap05Chapter0012
     * @tc.desc      Test getLastKey method with bigint keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0012';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt(100), "small");
      treeMap.set(BigInt(9223372036854775807), "big");
      treeMap.set(BigInt(500), "medium");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(BigInt(9223372036854775807));
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1300
     * @tc.name      testTreeMap05Chapter0013
     * @tc.desc      Test getLastKey method with negative number keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0013';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(-100, "neg100");
      treeMap.set(-200, "neg200");
      treeMap.set(-50, "neg50");
      treeMap.set(0, "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1400
     * @tc.name      testTreeMap05Chapter0014
     * @tc.desc      Test getLastKey method with scientific notation numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0014';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(1e3, "thousand");
      treeMap.set(2.5e-2, "small");
      treeMap.set(1e6, "million");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(1000000);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1500
     * @tc.name      testTreeMap05Chapter0015
     * @tc.desc      Test getLastKey method with hex and octal numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0015';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(0x0102, "hex1");
      treeMap.set(0o3, "octal");
      treeMap.set(255, "decimal");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(258);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1600
     * @tc.name      testTreeMap05Chapter0016
     * @tc.desc      Test getLastKey method with Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0016';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(Number.MAX_SAFE_INTEGER, "maxSafe");
      treeMap.set(100, "normal");
      treeMap.set(Number.MAX_SAFE_INTEGER - 1, "maxSafeMinusOne");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1700
     * @tc.name      testTreeMap05Chapter0017
     * @tc.desc      Test getLastKey method with Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0017';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(Number.EPSILON, "epsilon");
      treeMap.set(0, "zero");
      treeMap.set(1, "one");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1800
     * @tc.name      testTreeMap05Chapter0018
     * @tc.desc      Test getLastKey method after clearing TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0018';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("first", 1);
      treeMap.set("second", 2);
      treeMap.clear();
      const result = treeMap.getLastKey();

      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_1900
     * @tc.name      testTreeMap05Chapter0019
     * @tc.desc      Test getLastKey method with many elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0019';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      for (let i = 0; i < 1000; i++) {
        treeMap.set(i, "value" + i);
      }
      const result = treeMap.getLastKey();

      expect(result).assertEqual(999);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2000
     * @tc.name      testTreeMap05Chapter0020
     * @tc.desc      Test getLastKey method with mixed case string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0020';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("Apple", 1);
      treeMap.set("apple", 2);
      treeMap.set("Banana", 3);
      treeMap.set("banana", 4);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("banana");
    });
    /**
     * @tc.number    SUB_TREEMAP_TEST05_2100
     * @tc.name      testTreeMap05Chapter0021
     * @tc.desc      Test getLastKey method with escape character string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0021';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("\n", 1);
      treeMap.set("\t", 2);
      treeMap.set("\r", 3);
      treeMap.set("\\", 4);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("\\");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2200
     * @tc.name      testTreeMap05Chapter0022
     * @tc.desc      Test getLastKey method with null and undefined string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0022';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, string>();
      treeMap.set("nullKey", "value1");
      treeMap.set("undefinedKey", "value2");
      treeMap.set("empty", "value3");
      treeMap.set("normal", "value4");

      const result = treeMap.getLastKey();

      expect(result).assertEqual("undefinedKey");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2300
     * @tc.name      testTreeMap05Chapter0023
     * @tc.desc      Test getLastKey method with byte range number keys (-128 to 127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0023';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(-128, "minByte");
      treeMap.set(127, "maxByte");
      treeMap.set(0, "zero");
      treeMap.set(-129, "underflow");
      treeMap.set(128, "overflow");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(128);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2400
     * @tc.name      testTreeMap05Chapter0024
     * @tc.desc      Test getLastKey method with short range number keys (-32768 to 32767)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0024';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(-32768, "minShort");
      treeMap.set(32767, "maxShort");
      treeMap.set(-32769, "underflow");
      treeMap.set(32768, "overflow");
      treeMap.set(0, "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2500
     * @tc.name      testTreeMap05Chapter0025
     * @tc.desc      Test getLastKey method with int range number keys (-2147483648 to 2147483647)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0025';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(-2147483648, "minInt");
      treeMap.set(2147483647, "maxInt");
      treeMap.set(-2147483649, "underflow");
      treeMap.set(2147483648, "overflow");
      treeMap.set(0, "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(2147483648);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2600
     * @tc.name      testTreeMap05Chapter0026
     * @tc.desc      Test getLastKey method with char range number keys (0 to 65535)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0026';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(0, "minChar");
      treeMap.set(65535, "maxChar");
      treeMap.set(-1, "underflow");
      treeMap.set(65536, "overflow");
      treeMap.set(65, "A");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2700
     * @tc.name      testTreeMap05Chapter0027
     * @tc.desc      Test getLastKey method with Float32 range boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0027';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(3.4028234663852886e38, "maxFloat32");
      treeMap.set(-3.4028234663852886e38, "minFloat32");
      treeMap.set(3.5e38, "overflow");
      treeMap.set(-3.5e38, "underflow");
      treeMap.set(0, "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(3.5e38);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2800
     * @tc.name      testTreeMap05Chapter0028
     * @tc.desc      Test getLastKey method with Float64 range boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0028';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(1.7976931348623157e308, "maxFloat64");
      treeMap.set(-1.7976931348623157e308, "minFloat64");
      treeMap.set(1.8e308, "overflow");
      treeMap.set(-1.8e308, "underflow");
      treeMap.set(0, "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(1.8e308);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_2900
     * @tc.name      testTreeMap05Chapter0029
     * @tc.desc      Test getLastKey method with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0029';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt("-9223372036854775808"), "minBigInt64");
      treeMap.set(BigInt("9223372036854775807"), "maxBigInt64");
      treeMap.set(BigInt("-9223372036854775809"), "underflow");
      treeMap.set(BigInt("9223372036854775808"), "overflow");
      treeMap.set(BigInt("0"), "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(BigInt("9223372036854775808"));
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3000
     * @tc.name      testTreeMap05Chapter0030
     * @tc.desc      Test getLastKey method with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0030';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<bigint, string>();
      treeMap.set(BigInt("0"), "minBigUint64");
      treeMap.set(BigInt("18446744073709551615"), "maxBigUint64");
      treeMap.set(BigInt("18446744073709551616"), "overflow");
      treeMap.set(BigInt("100"), "normal");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(BigInt("18446744073709551616"));
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3100
     * @tc.name      testTreeMap05Chapter0031
     * @tc.desc      Test getLastKey method with keyword string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0031';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("0", 1);
      treeMap.set("NaN", 2);
      treeMap.set("undefined", 3);
      treeMap.set("null", 4);
      treeMap.set("true", 5);
      treeMap.set("false", 6);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("undefined");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3200
     * @tc.name      testTreeMap05Chapter0032
     * @tc.desc      Test getLastKey method with special repeated characters string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0032';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("!!", 1);
      treeMap.set("##", 2);
      treeMap.set("$$", 3);
      treeMap.set("%%", 4);
      treeMap.set("&&", 5);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("&&");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3300
     * @tc.name      testTreeMap05Chapter0033
     * @tc.desc      Test getLastKey method with Unicode encoding string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0033';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("\ud83d\udc46", 1);
      treeMap.set("\ud83d\udc7f", 2);
      treeMap.set("\ud83d\udc40", 3);
      treeMap.set("\ud83d\udcaf", 4);
      treeMap.set("\ud83c\udf85", 5);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("\ud83d\udcaf");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3400
     * @tc.name      testTreeMap05Chapter0034
     * @tc.desc      Test getLastKey method with invalid Unicode string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0034';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("\udc04", 1);
      treeMap.set("\ud83d", 2);
      treeMap.set("\udff4", 3);
      treeMap.set("normal", 4);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("\udff4");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3500
     * @tc.name      testTreeMap05Chapter0035
     * @tc.desc      Test getLastKey method with exponential operator and scientific notation keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0035';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(2**3, "exponential");
      treeMap.set(1e3, "scientific1");
      treeMap.set(2.5e-2, "scientific2");
      treeMap.set(100, "normal");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3600
     * @tc.name      testTreeMap05Chapter0036
     * @tc.desc      Test getLastKey method with Uint8Array converted values as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0036';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      const uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      for (let i = 0; i < uint8Array.length; i++) {
        treeMap.set(uint8Array[i], "char" + i);
      }
      treeMap.set(255, "maxUint8");
      treeMap.set(0, "minUint8");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(255);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3700
     * @tc.name      testTreeMap05Chapter0037
     * @tc.desc      Test getLastKey method with array containing zero values as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0037';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      const values = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      for (let i = 0; i < values.length; i++) {
        treeMap.set(values[i], "value" + i);
      }
      const result = treeMap.getLastKey();

      expect(result).assertEqual(114);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3800
     * @tc.name      testTreeMap05Chapter0038
     * @tc.desc      Test getLastKey method with negative array values as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0038';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      const values = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      for (let i = 0; i < values.length; i++) {
        treeMap.set(values[i], "value" + i);
      }
      const result = treeMap.getLastKey();

      expect(result).assertEqual(114);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_3900
     * @tc.name      testTreeMap05Chapter0039
     * @tc.desc      Test getLastKey method with array containing NaN and Infinity as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0039';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(72, "normal1");
      treeMap.set(101, "normal2");
      treeMap.set(NaN, "nan");
      treeMap.set(Infinity, "infinity");
      treeMap.set(108, "normal3");
      treeMap.set(111, "normal4");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4000
     * @tc.name      testTreeMap05Chapter0040
     * @tc.desc      Test getLastKey method with overflow array values as keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0040';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(256, "overflowUint8");
      treeMap.set(65536, "overflowUint16");
      treeMap.set(32768, "overflowInt16");
      treeMap.set(0, "zero");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(65536);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4100
     * @tc.name      testTreeMap05Chapter0041
     * @tc.desc      Test getLastKey method with 32-bit hex number keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0041';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(0x01020304, "hex32");
      treeMap.set(0xdecaf, "hexCustom");
      treeMap.set(0x0, "zero");
      treeMap.set(0xffffffff, "maxHex");
      const result = treeMap.getLastKey();

      expect(result).assertEqual(0xffffffff);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4200
     * @tc.name      testTreeMap05Chapter0042
     * @tc.desc      Test getLastKey method with TypedArray special value storage behavior simulation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0042';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<number, string>();
      treeMap.set(0, "intInfinity");
      treeMap.set(0, "intMinusInfinity");
      treeMap.set(0, "intNaN");
      treeMap.set(255, "clampedInfinity");
      treeMap.set(0, "clampedMinusInfinity");
      treeMap.set(0, "clampedNaN");
      treeMap.set(Infinity, "floatInfinity");
      treeMap.set(-Infinity, "floatMinusInfinity");
      treeMap.set(NaN, "floatNaN");
      treeMap.set(100, "normal");
      console.info("all keys：", Array.from(treeMap.keys()))
      const result = treeMap.getLastKey();

      expect(result).assertNaN();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4300
     * @tc.name      testTreeMap05Chapter0043
     * @tc.desc      Test getLastKey method with ASCII full range string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0043';
      console.log(TAG + ' start');

      const treeMap = new TreeMap<string, number>();
      treeMap.set("A", 65);
      treeMap.set("Z", 90);
      treeMap.set("a", 97);
      treeMap.set("z", 122);
      treeMap.set("0", 48);
      treeMap.set("9", 57);
      treeMap.set("!", 33);
      treeMap.set("~", 126);
      const result = treeMap.getLastKey();

      expect(result).assertEqual("~");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4400
     * @tc.name      testTreeMap05Chapter0044
     * @tc.desc      Test setAll with normal TreeMap containing number keys and values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0044';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      treeMap1.set("a", 1);
      treeMap1.set("b", 2);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.set("c", 3);
      treeMap2.set("d", 4);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(4);
      expect(treeMap2.get("a")).assertEqual(1);
      expect(treeMap2.get("b")).assertEqual(2);
      expect(treeMap2.get("c")).assertEqual(3);
      expect(treeMap2.get("d")).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4500
     * @tc.name      testTreeMap05Chapter0045
     * @tc.desc      Test setAll with empty source TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0045';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.set("a", 1);
      treeMap2.set("b", 2);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(2);
      expect(treeMap2.get("a")).assertEqual(1);
      expect(treeMap2.get("b")).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4600
     * @tc.name      testTreeMap05Chapter0046
     * @tc.desc      Test setAll with empty target TreeMap
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0046';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      treeMap1.set("a", 1);
      treeMap1.set("b", 2);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(2);
      expect(treeMap2.get("a")).assertEqual(1);
      expect(treeMap2.get("b")).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4700
     * @tc.name      testTreeMap05Chapter0047
     * @tc.desc      Test setAll with overlapping keys (should override)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0047';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      treeMap1.set("a", 10);
      treeMap1.set("b", 20);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.set("a", 1);
      treeMap2.set("c", 3);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(3);
      expect(treeMap2.get("a")).assertEqual(10);
      expect(treeMap2.get("b")).assertEqual(20);
      expect(treeMap2.get("c")).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4800
     * @tc.name      testTreeMap05Chapter0048
     * @tc.desc      Test setAll with string keys and boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0048';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, boolean>();
      treeMap1.set("flag1", true);
      treeMap1.set("flag2", false);
      let treeMap2 = new TreeMap<string, boolean>();
      treeMap2.set("flag3", true);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(3);
      expect(treeMap2.get("flag1")).assertTrue();
      expect(treeMap2.get("flag2")).assertFalse();
      expect(treeMap2.get("flag3")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_4900
     * @tc.name      testTreeMap05Chapter0049
     * @tc.desc      Test setAll with number keys and string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0049';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<number, string>();
      treeMap1.set(1, "one");
      treeMap1.set(2, "two");
      let treeMap2 = new TreeMap<number, string>();
      treeMap2.set(3, "three");
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(3);
      expect(treeMap2.get(1)).assertEqual("one");
      expect(treeMap2.get(2)).assertEqual("two");
      expect(treeMap2.get(3)).assertEqual("three");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5000
     * @tc.name      testTreeMap05Chapter0050
     * @tc.desc      Test setAll with large TreeMap (performance test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0050';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<number, number>();
      let treeMap2 = new TreeMap<number, number>();
      for (let i = 0; i < 1000; i++) {
        treeMap1.set(i, i * 2);
      }
      for (let i = 1000; i < 1500; i++) {
        treeMap2.set(i, i * 3);
      }
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1500);
      expect(treeMap2.get(500)).assertEqual(1000);
      expect(treeMap2.get(1200)).assertEqual(3600);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5100
     * @tc.name      testTreeMap05Chapter0051
     * @tc.desc      Test setAll with null parameter (should throw error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0051';
      console.log(TAG + ' start');

      let treeMap = new TreeMap<string, number>();
      treeMap.set("key", 1);

      let setAllSucceeded = false;
      let errorCaught = false;
      let errorMessageContainsExpectedText = false;

      try {
        treeMap.setAll(null);
        setAllSucceeded = true;
      } catch (err) {
        errorCaught = true;
        const error = err as Error;
        errorMessageContainsExpectedText = error.message.includes('The type of "map" must be TreeMap');
      }

      expect(setAllSucceeded).assertFalse();
      expect(errorCaught).assertTrue();
      expect(errorMessageContainsExpectedText).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5200
     * @tc.name      testTreeMap05Chapter0052
     * @tc.desc      Test setAll with undefined parameter (should throw error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0052';
      console.log(TAG + ' start');

      let treeMap = new TreeMap<string, number>();
      treeMap.set("key", 1);

      let setAllSucceeded = false;
      let errorCaught = false;
      let errorMessageContainsExpectedText = false;

      try {
        treeMap.setAll(undefined);
        setAllSucceeded = true;
      } catch (err) {
        errorCaught = true;
        const error = err as Error;
        errorMessageContainsExpectedText = error.message.includes('The type of "map" must be TreeMap');
      }

      expect(setAllSucceeded).assertFalse();
      expect(errorCaught).assertTrue();
      expect(errorMessageContainsExpectedText).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5300
     * @tc.name      testTreeMap05Chapter0053
     * @tc.desc      Test setAll with TreeMap containing NaN as value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0053';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      treeMap1.set("a", NaN);
      treeMap1.set("b", Infinity);
      treeMap1.set("c", -Infinity);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.set("d", 100);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(4);
      expect(isNaN(treeMap2.get("a"))).assertTrue();
      expect(treeMap2.get("b")).assertEqual(Infinity);
      expect(treeMap2.get("c")).assertEqual(-Infinity);
      expect(treeMap2.get("d")).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5400
     * @tc.name      testTreeMap05Chapter0054
     * @tc.desc      Test setAll with TreeMap containing number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0054';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      treeMap1.set("max", Number.MAX_VALUE);
      treeMap1.set("min", Number.MIN_VALUE);
      treeMap1.set("epsilon", Number.EPSILON);
      treeMap1.set("maxSafe", Number.MAX_SAFE_INTEGER);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.set("test", 0);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(5);
      expect(treeMap2.get("max")).assertEqual(Number.MAX_VALUE);
      expect(treeMap2.get("min")).assertEqual(Number.MIN_VALUE);
      expect(treeMap2.get("epsilon")).assertEqual(Number.EPSILON);
      expect(treeMap2.get("maxSafe")).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5500
     * @tc.name      testTreeMap05Chapter0055
     * @tc.desc      Test setAll with TreeMap containing array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0055';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Array<number>>();
      treeMap1.set("arr1", [1, 2, 3]);
      treeMap1.set("arr2", [4, 5, 6]);
      let treeMap2 = new TreeMap<string, Array<number>>();
      treeMap2.set("arr3", [7, 8, 9]);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(3);
      expect(treeMap2.get("arr1")).assertDeepEquals([1, 2, 3]);
      expect(treeMap2.get("arr2")).assertDeepEquals([4, 5, 6]);
      expect(treeMap2.get("arr3")).assertDeepEquals([7, 8, 9]);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5600
     * @tc.name      testTreeMap05Chapter0056
     * @tc.desc      Test setAll with TreeMap containing object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0056';
      console.log(TAG + ' start');

      interface TestObj {
        name: string;
        value: number;
      }

      let treeMap1 = new TreeMap<string, TestObj>();
      treeMap1.set("obj1", { name: "test1", value: 1 });
      treeMap1.set("obj2", { name: "test2", value: 2 });
      let treeMap2 = new TreeMap<string, TestObj>();
      treeMap2.set("obj3", { name: "test3", value: 3 });
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(3);
      expect(treeMap2.get("obj1").name).assertEqual("test1");
      expect(treeMap2.get("obj2").name).assertEqual("test2");
      expect(treeMap2.get("obj3").name).assertEqual("test3");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5700
     * @tc.name      testTreeMap05Chapter0057
     * @tc.desc      Test setAll with TreeMap containing special string keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0057';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      treeMap1.set("", 0);
      treeMap1.set("null", 1);
      treeMap1.set("undefined", 2);
      treeMap1.set("NaN", 3);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.set("normal", 100);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(5);
      expect(treeMap2.get("")).assertEqual(0);
      expect(treeMap2.get("null")).assertEqual(1);
      expect(treeMap2.get("undefined")).assertEqual(2);
      expect(treeMap2.get("NaN")).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5800
     * @tc.name      testTreeMap05Chapter0058
     * @tc.desc      Test setAll with TreeMap containing special characters in keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0058';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      treeMap1.set("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~", 1);
      treeMap1.set("key with spaces", 2);
      treeMap1.set("key\twith\ttabs", 3);
      treeMap1.set("key\nwith\nnewlines", 4);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.set("normal", 100);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(5);
      expect(treeMap2.get("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~")).assertEqual(1);
      expect(treeMap2.get("key with spaces")).assertEqual(2);
      expect(treeMap2.get("key\twith\ttabs")).assertEqual(3);
      expect(treeMap2.get("key\nwith\nnewlines")).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_5900
     * @tc.name      testTreeMap05Chapter0059
     * @tc.desc      Test setAll with TreeMap containing boolean keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0059';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<boolean, string>();
      treeMap1.set(true, "true value");
      treeMap1.set(false, "false value");
      let treeMap2 = new TreeMap<boolean, string>();
      treeMap2.set(true, "original true");
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(2);
      expect(treeMap2.get(true)).assertEqual("true value");
      expect(treeMap2.get(false)).assertEqual("false value");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6000
     * @tc.name      testTreeMap05Chapter0060
     * @tc.desc      Test setAll with TreeMap containing TypedArray as values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0060';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Uint8Array>();
      treeMap1.set("arr1", new Uint8Array([72, 101, 108, 108, 111]));
      treeMap1.set("arr2", new Uint8Array([87, 111, 114, 108, 100]));
      let treeMap2 = new TreeMap<string, Uint8Array>();
      treeMap2.set("arr3", new Uint8Array([49, 50, 51]));
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(3);
      expect(treeMap2.get("arr1")[0]).assertEqual(72);
      expect(treeMap2.get("arr2")[0]).assertEqual(87);
      expect(treeMap2.get("arr3")[0]).assertEqual(49);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6100
     * @tc.name      testTreeMap05Chapter0061
     * @tc.desc      Test setAll with TreeMap containing boundary number keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0061';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<number, string>();
      treeMap1.set(-128, "Int8 min");
      treeMap1.set(127, "Int8 max");
      treeMap1.set(255, "Uint8 max");
      treeMap1.set(-32768, "Int16 min");
      treeMap1.set(32767, "Int16 max");
      treeMap1.set(65535, "Uint16 max");
      let treeMap2 = new TreeMap<number, string>();
      treeMap2.set(0, "zero");
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(7);
      expect(treeMap2.get(-128)).assertEqual("Int8 min");
      expect(treeMap2.get(127)).assertEqual("Int8 max");
      expect(treeMap2.get(255)).assertEqual("Uint8 max");
      expect(treeMap2.get(-32768)).assertEqual("Int16 min");
      expect(treeMap2.get(32767)).assertEqual("Int16 max");
      expect(treeMap2.get(65535)).assertEqual("Uint16 max");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6200
     * @tc.name      testTreeMap05Chapter0062
     * @tc.desc      Test setAll with TreeMap containing 32-bit integer boundary keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0062';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<number, string>();
      treeMap1.set(-2147483648, "Int32 min");
      treeMap1.set(2147483647, "Int32 max");
      treeMap1.set(0, "Uint32 min");
      treeMap1.set(4294967295, "Uint32 max");
      let treeMap2 = new TreeMap<number, string>();
      treeMap2.set(100, "test");
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(5);
      expect(treeMap2.get(-2147483648)).assertEqual("Int32 min");
      expect(treeMap2.get(2147483647)).assertEqual("Int32 max");
      expect(treeMap2.get(0)).assertEqual("Uint32 min");
      expect(treeMap2.get(4294967295)).assertEqual("Uint32 max");
      expect(treeMap2.get(100)).assertEqual("test");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6300
     * @tc.name      testTreeMap05Chapter0063
     * @tc.desc      Test setAll with TreeMap containing Float32 boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0063';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, number>();
      treeMap1.set("float32Max", 3.4028234663852886e38);
      treeMap1.set("float32Min", 1.1754943508222875e-38);
      treeMap1.set("float64Max", 1.7976931348623157e308);
      treeMap1.set("float64Min", 5e-324);
      let treeMap2 = new TreeMap<string, number>();
      treeMap2.set("normal", 100);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(5);
      expect(treeMap2.get("float32Max")).assertEqual(3.4028234663852886e38);
      expect(treeMap2.get("float32Min")).assertEqual(1.1754943508222875e-38);
      expect(treeMap2.get("float64Max")).assertEqual(1.7976931348623157e308);
      expect(treeMap2.get("float64Min")).assertEqual(5e-324);
      expect(treeMap2.get("normal")).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6400
     * @tc.name      testTreeMap05Chapter0064
     * @tc.desc      Test setAll with TreeMap containing BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0064';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, bigint>();
      treeMap1.set("big1", 9007199254740991n);
      treeMap1.set("big2", BigInt("18446744073709551615"));
      treeMap1.set("big3", -9223372036854775808n);
      let treeMap2 = new TreeMap<string, bigint>();
      treeMap2.set("big4", 100n);
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(4);
      expect(treeMap2.get("big1")).assertEqual(9007199254740991n);
      expect(treeMap2.get("big2")).assertEqual(18446744073709551615n);
      expect(treeMap2.get("big3")).assertEqual(-9223372036854775808n);
      expect(treeMap2.get("big4")).assertEqual(100n);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6500
     * @tc.name      testTreeMap05Chapter0065
     * @tc.desc      Test setAll with TreeMap containing Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0065';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Int8Array>();
      let int8Array1 = new Int8Array([-128, 127]);
      let int8Array2 = new Int8Array([-129, 128]);
      treeMap1.set("int8Boundary", int8Array1);
      treeMap1.set("int8Overflow", int8Array2);
      let treeMap2 = new TreeMap<string, Int8Array>();
      treeMap2.set("test", new Int8Array([0]));
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(3);
      expect(treeMap2.get("int8Boundary")[0]).assertEqual(-128);
      expect(treeMap2.get("int8Boundary")[1]).assertEqual(127);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6600
     * @tc.name      testTreeMap05Chapter0066
     * @tc.desc      Test setAll with TreeMap containing Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0066';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Uint8Array>();
      let uint8Array1 = new Uint8Array([0, 255]);
      let uint8Array2 = new Uint8Array([256, -1]);
      treeMap1.set("uint8Boundary", uint8Array1);
      treeMap1.set("uint8Overflow", uint8Array2);
      let treeMap2 = new TreeMap<string, Uint8Array>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(2);
      expect(treeMap2.get("uint8Boundary")[0]).assertEqual(0);
      expect(treeMap2.get("uint8Boundary")[1]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6700
     * @tc.name      testTreeMap05Chapter0067
     * @tc.desc      Test setAll with TreeMap containing Uint8ClampedArray values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0067';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Uint8ClampedArray>();
      let clampedArray = new Uint8ClampedArray([-1, 0, 255, 256]);
      treeMap1.set("clamped", clampedArray);
      let treeMap2 = new TreeMap<string, Uint8ClampedArray>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("clamped")[0]).assertEqual(0);
      expect(treeMap2.get("clamped")[1]).assertEqual(0);
      expect(treeMap2.get("clamped")[2]).assertEqual(255);
      expect(treeMap2.get("clamped")[3]).assertEqual(255);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6800
     * @tc.name      testTreeMap05Chapter0068
     * @tc.desc      Test setAll with TreeMap containing Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0068';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Int16Array>();
      let int16Array1 = new Int16Array([-32768, 32767]);
      let int16Array2 = new Int16Array([-32769, 32768]);
      treeMap1.set("int16Boundary", int16Array1);
      treeMap1.set("int16Overflow", int16Array2);
      let treeMap2 = new TreeMap<string, Int16Array>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(2);
      expect(treeMap2.get("int16Boundary")[0]).assertEqual(-32768);
      expect(treeMap2.get("int16Boundary")[1]).assertEqual(32767);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_6900
     * @tc.name      testTreeMap05Chapter0069
     * @tc.desc      Test setAll with TreeMap containing Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0069';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Uint16Array>();
      let uint16Array1 = new Uint16Array([0, 65535]);
      let uint16Array2 = new Uint16Array([-1, 65536]);
      treeMap1.set("uint16Boundary", uint16Array1);
      treeMap1.set("uint16Overflow", uint16Array2);
      let treeMap2 = new TreeMap<string, Uint16Array>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(2);
      expect(treeMap2.get("uint16Boundary")[0]).assertEqual(0);
      expect(treeMap2.get("uint16Boundary")[1]).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7000
     * @tc.name      testTreeMap05Chapter0070
     * @tc.desc      Test setAll with TreeMap containing Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0070';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Float32Array>();
      let float32Array = new Float32Array([Infinity, -Infinity, NaN, 3.4028234663852886e38, -3.4028234663852886e38]);
      treeMap1.set("float32", float32Array);
      let treeMap2 = new TreeMap<string, Float32Array>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("float32")[0]).assertEqual(Infinity);
      expect(treeMap2.get("float32")[1]).assertEqual(-Infinity);
      expect(isNaN(treeMap2.get("float32")[2])).assertTrue();
      expect(treeMap2.get("float32")[3]).assertEqual(3.4028234663852886e38);
      expect(treeMap2.get("float32")[4]).assertEqual(-3.4028234663852886e38);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7100
     * @tc.name      testTreeMap05Chapter0071
     * @tc.desc      Test setAll with TreeMap containing Float64Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0071';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Float64Array>();
      let float64Array = new Float64Array([1.7976931348623157e308, -1.7976931348623157e308, 5e-324, -5e-324]);
      treeMap1.set("float64", float64Array);
      let treeMap2 = new TreeMap<string, Float64Array>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("float64")[0]).assertEqual(1.7976931348623157e308);
      expect(treeMap2.get("float64")[1]).assertEqual(-1.7976931348623157e308);
      expect(treeMap2.get("float64")[2]).assertEqual(5e-324);
      expect(treeMap2.get("float64")[3]).assertEqual(-5e-324);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7200
     * @tc.name      testTreeMap05Chapter0072
     * @tc.desc      Test setAll with TreeMap containing BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0072';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, BigInt64Array>();
      let bigInt64Array1 = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      treeMap1.set("bigInt64", bigInt64Array1);
      let treeMap2 = new TreeMap<string, BigInt64Array>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("bigInt64")[0]).assertEqual(-9223372036854775808n);
      expect(treeMap2.get("bigInt64")[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7300
     * @tc.name      testTreeMap05Chapter0073
     * @tc.desc      Test setAll with TreeMap containing BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0073';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, BigUint64Array>();
      let bigUint64Array = new BigUint64Array([0n, 18446744073709551615n]);
      treeMap1.set("bigUint64", bigUint64Array);
      let treeMap2 = new TreeMap<string, BigUint64Array>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("bigUint64")[0]).assertEqual(0n);
      expect(treeMap2.get("bigUint64")[1]).assertEqual(18446744073709551615n);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7400
     * @tc.name      testTreeMap05Chapter0074
     * @tc.desc      Test setAll with TreeMap containing string values with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0074';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, string>();
      treeMap1.set("escape1", "\a");
      treeMap1.set("escape2", "\b");
      treeMap1.set("escape3", "\f");
      treeMap1.set("escape4", "\n");
      treeMap1.set("escape5", "\r");
      treeMap1.set("escape6", "\t");
      treeMap1.set("escape7", "\v");
      treeMap1.set("escape8", "\\");
      treeMap1.set("escape9", "\'");
      treeMap1.set("escape10", "\"");
      treeMap1.set("escape11", "\?");
      treeMap1.set("escape12", "\0");
      let treeMap2 = new TreeMap<string, string>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(12);
      expect(treeMap2.get("escape1").charCodeAt(0)).assertEqual(97);
      expect(treeMap2.get("escape2").charCodeAt(0)).assertEqual(8);
      expect(treeMap2.get("escape4")).assertEqual("\n");
      expect(treeMap2.get("escape6")).assertEqual("\t");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7500
     * @tc.name      testTreeMap05Chapter0075
     * @tc.desc      Test setAll with TreeMap containing string values with emoji unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0075';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, string>();
      treeMap1.set("emoji1", "👆");
      treeMap1.set("emoji2", "👿");
      treeMap1.set("emoji3", "👀");
      treeMap1.set("emoji4", "💯");
      treeMap1.set("emoji5", "🎅");
      treeMap1.set("emoji6", "😼");
      treeMap1.set("emoji7", "🔧");
      treeMap1.set("emoji8", "💇");
      treeMap1.set("unicode1", "\ud83d\udc46");
      treeMap1.set("unicode2", "\ud83d\udc7f");
      let treeMap2 = new TreeMap<string, string>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(10);
      expect(treeMap2.get("emoji1").length).assertEqual(2);
      expect(treeMap2.get("emoji1")).assertEqual("👆");
      expect(treeMap2.get("emoji2")).assertEqual("👿");
      expect(treeMap2.get("unicode1")).assertEqual("👆");
      expect(treeMap2.get("unicode2")).assertEqual("👿");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7600
     * @tc.name      testTreeMap05Chapter0076
     * @tc.desc      Test setAll with TreeMap containing array with NaN and Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0076';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Array<number>>();
      treeMap1.set("specialArray", [72, 101, NaN, Infinity, -Infinity, 108, 111]);
      let treeMap2 = new TreeMap<string, Array<number>>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("specialArray")[0]).assertEqual(72);
      expect(isNaN(treeMap2.get("specialArray")[2])).assertTrue();
      expect(treeMap2.get("specialArray")[3]).assertEqual(Infinity);
      expect(treeMap2.get("specialArray")[4]).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7700
     * @tc.name      testTreeMap05Chapter0077
     * @tc.desc      Test setAll with TreeMap containing array with non-number types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0077';
      console.log(TAG + ' start');

      type MixedArrayType = (number | string | boolean | null | undefined)[];

      let treeMap1 = new TreeMap<string, MixedArrayType>();

      let mixedArray: MixedArrayType = [72, "abc", true, null, undefined, 108];
      treeMap1.set("mixedArray", mixedArray);

      let treeMap2 = new TreeMap<string, MixedArrayType>();
      treeMap2.setAll(treeMap1);

      expect(treeMap2.length).assertEqual(1);

      let resultArray: MixedArrayType | undefined = treeMap2.get("mixedArray");
      let arrayExists = resultArray !== undefined;
      expect(arrayExists).assertTrue();

      if (arrayExists) {
        expect(resultArray[0]).assertEqual(72);
        expect(resultArray[1]).assertEqual("abc");

        let boolValue = resultArray[2];
        let isBoolean = typeof boolValue === 'boolean';
        expect(isBoolean).assertTrue();

        if (isBoolean) {
          expect(boolValue).assertTrue();
        }

        expect(resultArray[3]).assertNull();
        expect(resultArray[4]).assertUndefined();
        expect(resultArray[5]).assertEqual(108);
      }
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST05_7800
     * @tc.name      testTreeMap05Chapter0078
     * @tc.desc      Test setAll with TreeMap containing empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap05Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeMap05Chapter0078';
      console.log(TAG + ' start');
      let treeMap1 = new TreeMap<string, Array<number>>();
      treeMap1.set("emptyArray", []);
      let treeMap2 = new TreeMap<string, Array<number>>();
      treeMap2.setAll(treeMap1);
      expect(treeMap2.length).assertEqual(1);
      expect(treeMap2.get("emptyArray").length).assertEqual(0);
    });
  })
}