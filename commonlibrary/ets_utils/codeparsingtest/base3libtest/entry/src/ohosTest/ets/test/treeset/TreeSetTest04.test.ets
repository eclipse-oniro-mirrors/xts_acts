import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TreeSet, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeSet04Test() {
  describe('TreeSet04Test', () => {
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
     * @tc.number    SUB_TREESET_TEST04_0100
     * @tc.name      testTreeSet04Chapter0001
     * @tc.desc      Test getLowerValue with out of bounds values of Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0001';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-32769);
      treeSet.add(32768);
      treeSet.add(1000);
      let result1 = treeSet.getLowerValue(32768);
      expect(result1).assertEqual(1000);
      let result2 = treeSet.getLowerValue(1000);
      expect(result2).assertEqual(-32769);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_0200
     * @tc.name      testTreeSet04Chapter0002
     * @tc.desc      Test getLowerValue with boundary values of Uint16Array range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0002';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(32768);
      treeSet.add(65535);
      let result1 = treeSet.getLowerValue(65535);
      expect(result1).assertEqual(32768);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_0300
     * @tc.name      testTreeSet04Chapter0003
     * @tc.desc      Test getLowerValue with out of bounds values of Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0003';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-1);
      treeSet.add(65536);
      treeSet.add(30000);
      let result1 = treeSet.getLowerValue(65536);
      expect(result1).assertEqual(30000);
      let result2 = treeSet.getLowerValue(30000);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_0400
     * @tc.name      testTreeSet04Chapter0004
     * @tc.desc      Test getLowerValue with boundary values of Int32Array range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0004';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-2147483648);
      treeSet.add(0);
      treeSet.add(2147483647);
      let result1 = treeSet.getLowerValue(2147483647);
      expect(result1).assertEqual(0);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_0500
     * @tc.name      testTreeSet04Chapter0005
     * @tc.desc      Test getLowerValue with out of bounds values of Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0005';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-2147483649);
      treeSet.add(2147483648);
      treeSet.add(1000000);
      let result1 = treeSet.getLowerValue(2147483648);
      expect(result1).assertEqual(1000000);
      let result2 = treeSet.getLowerValue(1000000);
      expect(result2).assertEqual(-2147483649);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_0600
     * @tc.name      testTreeSet04Chapter0006
     * @tc.desc      Test getLowerValue with boundary values of Uint32Array range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0006';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(2147483648);
      treeSet.add(4294967295);
      let result1 = treeSet.getLowerValue(4294967295);
      expect(result1).assertEqual(2147483648);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_0700
     * @tc.name      testTreeSet04Chapter0007
     * @tc.desc      Test getLowerValue with out of bounds values of Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0007';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-1);
      treeSet.add(4294967296);
      treeSet.add(2000000000);
      let result1 = treeSet.getLowerValue(4294967296);
      expect(result1).assertEqual(2000000000);
      let result2 = treeSet.getLowerValue(2000000000);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_0800
     * @tc.name      testTreeSet04Chapter0008
     * @tc.desc      Test getLowerValue with boundary values of Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0008';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-3.4028234663852886e38);
      treeSet.add(0);
      treeSet.add(3.4028234663852886e38);
      let result1 = treeSet.getLowerValue(3.4028234663852886e38);
      expect(result1).assertEqual(0);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertEqual(-3.4028234663852886e38);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_0900
     * @tc.name      testTreeSet04Chapter0009
     * @tc.desc      Test getLowerValue with out of bounds values of Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0009';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-3.5e38);
      treeSet.add(3.5e38);
      treeSet.add(1.5);
      let result1 = treeSet.getLowerValue(3.5e38);
      expect(result1).assertEqual(1.5);
      let result2 = treeSet.getLowerValue(1.5);
      expect(result2).assertEqual(-3.5e38);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1000
     * @tc.name      testTreeSet04Chapter0010
     * @tc.desc      Test getLowerValue with boundary values of Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0010';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-1.7976931348623157e308);
      treeSet.add(0);
      treeSet.add(1.7976931348623157e308);
      let result1 = treeSet.getLowerValue(1.7976931348623157e308);
      expect(result1).assertEqual(0);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertEqual(-1.7976931348623157e308);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1100
     * @tc.name      testTreeSet04Chapter0011
     * @tc.desc      Test getLowerValue with out of bounds values of Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0011';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-1.8e308);
      treeSet.add(1.8e308);
      treeSet.add(2.5);
      let result1 = treeSet.getLowerValue(1.8e308);
      expect(result1).assertEqual(2.5);
      let result2 = treeSet.getLowerValue(2.5);
      expect(result2).assertEqual(-1.8e308);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1200
     * @tc.name      testTreeSet04Chapter0012
     * @tc.desc      Test getLowerValue with Infinity in Float32Array/Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0012';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.NEGATIVE_INFINITY);
      treeSet.add(0);
      treeSet.add(Number.POSITIVE_INFINITY);
      let result1 = treeSet.getLowerValue(Number.POSITIVE_INFINITY);
      expect(result1).assertEqual(0);
      let result2 = treeSet.getLowerValue(0);
      expect(result2).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1300
     * @tc.name      testTreeSet04Chapter0013
     * @tc.desc      Test getLowerValue with NaN in Float32Array/Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0013';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.NaN);
      treeSet.add(1);
      treeSet.add(2);
      let result = treeSet.getLowerValue(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1400
     * @tc.name      testTreeSet04Chapter0014
     * @tc.desc      Test getLowerValue with string undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0014';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add(undefined);
      treeSet.add("test");
      let result = treeSet.getLowerValue("test");
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1500
     * @tc.name      testTreeSet04Chapter0015
     * @tc.desc      Test getLowerValue with string null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0015';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      treeSet.add("null");
      treeSet.add("value");
      let result = treeSet.getLowerValue("value");
      expect(result).assertEqual("null");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1600
     * @tc.name      testTreeSet04Chapter0016
     * @tc.desc      Test getLowerValue with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0016';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      treeSet.add("a");
      let result = treeSet.getLowerValue("a");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1700
     * @tc.name      testTreeSet04Chapter0017
     * @tc.desc      Test getLowerValue with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0017';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("!");
      treeSet.add("\"");
      treeSet.add("#");
      treeSet.add("$");
      let result = treeSet.getLowerValue("#");
      expect(result).assertEqual("\"");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1800
     * @tc.name      testTreeSet04Chapter0018
     * @tc.desc      Test getLowerValue with full ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0018';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("!");
      treeSet.add("0");
      treeSet.add("A");
      treeSet.add("a");
      treeSet.add("~");
      let result1 = treeSet.getLowerValue("A");
      expect(result1).assertEqual("0");
      let result2 = treeSet.getLowerValue("a");
      expect(result2).assertEqual("A");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_1900
     * @tc.name      testTreeSet04Chapter0019
     * @tc.desc      Test getLowerValue with escaped characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0019';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("\\n");
      treeSet.add("\\t");
      treeSet.add("a");
      let result = treeSet.getLowerValue("a");
      expect(result).assertEqual("\\t");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2000
     * @tc.name      testTreeSet04Chapter0020
     * @tc.desc      Test getLowerValue with emoji and Unicode encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0020';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("\\ud83d\\udc46");
      treeSet.add("\\ud83d\\udc7f");
      treeSet.add("\\ud83d\\udc40");
      let result = treeSet.getLowerValue("\\ud83d\\udc40");
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2100
     * @tc.name      testTreeSet04Chapter0021
     * @tc.desc      Test getLowerValue with illegal Unicode encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0021';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("\\udc04");
      treeSet.add("\\ud83d");
      treeSet.add("\\udff4");
      let result = treeSet.getLowerValue("\\udff4");
      expect(result).assertEqual("\\udc04");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2200
     * @tc.name      testTreeSet04Chapter0022
     * @tc.desc      Test getLowerValue with number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0022';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      treeSet.add(2);
      let result = treeSet.getLowerValue(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2300
     * @tc.name      testTreeSet04Chapter0023
     * @tc.desc      Test getLowerValue with number -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0023';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-0);
      treeSet.add(1);
      treeSet.add(2);
      let result = treeSet.getLowerValue(1);
      expect(result).assertEqual(-0);
    });


    /**
     * @tc.number    SUB_TREESET_TEST04_2400
     * @tc.name      testTreeSet04Chapter0024
     * @tc.desc      Test getLowerValue with Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0024';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(5e-324);
      treeSet.add(0);
      let result = treeSet.getLowerValue(5e-324);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2500
     * @tc.name      testTreeSet04Chapter0025
     * @tc.desc      Test getLowerValue with Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0025';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.EPSILON);
      treeSet.add(2.220446049250313e-16);
      treeSet.add(0);
      let result = treeSet.getLowerValue(2.220446049250313e-16);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2600
     * @tc.name      testTreeSet04Chapter0026
     * @tc.desc      Test getLowerValue with Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0026';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(9007199254740990);
      treeSet.add(0);
      let result = treeSet.getLowerValue(Number.MAX_SAFE_INTEGER);
      expect(result).assertEqual(9007199254740990);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2700
     * @tc.name      testTreeSet04Chapter0027
     * @tc.desc      Test getLowerValue with short range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0027';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-32768);
      treeSet.add(0);
      treeSet.add(32767);
      let result = treeSet.getLowerValue(32767);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2800
     * @tc.name      testTreeSet04Chapter0028
     * @tc.desc      Test getLowerValue with int range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0028';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-2147483648);
      treeSet.add(0);
      treeSet.add(2147483647);
      let result = treeSet.getLowerValue(2147483647);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_2900
     * @tc.name      testTreeSet04Chapter0029
     * @tc.desc      Test getLowerValue with long range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0029';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-9223372036854775808);
      treeSet.add(0);
      treeSet.add(9223372036854775807);
      let result = treeSet.getLowerValue(9223372036854775807);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3000
     * @tc.name      testTreeSet04Chapter0030
     * @tc.desc      Test getLowerValue with float range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0030';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-3.40282346638528860e+38);
      treeSet.add(0);
      treeSet.add(3.40282346638528860e+38);
      let result = treeSet.getLowerValue(3.40282346638528860e+38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3100
     * @tc.name      testTreeSet04Chapter0031
     * @tc.desc      Test getLowerValue with double range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0031';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-1.79769313486231570e+308);
      treeSet.add(0);
      treeSet.add(1.79769313486231570e+308);
      let result = treeSet.getLowerValue(1.79769313486231570e+308);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number    SUB_TREESET_TEST04_3200
     * @tc.name      testTreeSet04Chapter0032
     * @tc.desc      Test getLowerValue with hex values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0032';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(0x0102);
      treeSet.add(0x01020304);
      treeSet.add(0x3);
      let result = treeSet.getLowerValue(0x01020304);
      expect(result).assertEqual(0x0102);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3300
     * @tc.name      testTreeSet04Chapter0033
     * @tc.desc      Test getLowerValue with exponentiation operator values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0033';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(2**3);
      treeSet.add(8);
      treeSet.add(9);
      let result = treeSet.getLowerValue(9);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3400
     * @tc.name      testTreeSet04Chapter0034
     * @tc.desc      Test getLowerValue with scientific notation values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0034';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(1e3);
      treeSet.add(2.5e-2);
      treeSet.add(0);
      let result = treeSet.getLowerValue(1e3);
      expect(result).assertEqual(2.5e-2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3500
     * @tc.name      testTreeSet04Chapter0035
     * @tc.desc      Test getLowerValue with boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0035';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      treeSet.add(false);
      treeSet.add(true);
      let result = treeSet.getLowerValue(true);
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3600
     * @tc.name      testTreeSet04Chapter0036
     * @tc.desc      Test getLowerValue with boolean false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0036';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      treeSet.add(false);
      treeSet.add(true);
      let result = treeSet.getLowerValue(false);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3700
     * @tc.name      testTreeSet04Chapter0037
     * @tc.desc      Test getLowerValue with array converted to Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0037';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let arr = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      for (let i = 0; i < arr.length; i++) {
        treeSet.add(arr[i]);
      }
      let result = treeSet.getLowerValue(114);
      expect(result).assertEqual(111);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3800
     * @tc.name      testTreeSet04Chapter0038
     * @tc.desc      Test getLowerValue with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0038';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let arr = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      for (let i = 0; i < arr.length; i++) {
        treeSet.add(arr[i]);
      }
      let result = treeSet.getLowerValue(49);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_3900
     * @tc.name      testTreeSet04Chapter0039
     * @tc.desc      Test getLowerValue with array containing negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0039';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let arr = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      for (let i = 0; i < arr.length; i++) {
        treeSet.add(arr[i]);
      }
      let result = treeSet.getLowerValue(50);
      expect(result).assertEqual(-49);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4000
     * @tc.name      testTreeSet04Chapter0040
     * @tc.desc      Test getLowerValue with array containing NaN/Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0040';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let arr = [72, 101, Number.NaN, Number.POSITIVE_INFINITY, 108, 111];
      for (let i = 0; i < arr.length; i++) {
        treeSet.add(arr[i]);
      }
      let result = treeSet.getLowerValue(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(111);
    });


    /**
     * @tc.number    SUB_TREESET_TEST04_4100
     * @tc.name      testTreeSet04Chapter0041
     * @tc.desc      Test getLowerValue with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0041';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let arr: number[] = [];
      for (let i = 0; i < arr.length; i++) {
        treeSet.add(arr[i]);
      }
      let result = treeSet.getLowerValue(1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4200
     * @tc.name      testTreeSet04Chapter0042
     * @tc.desc      Test getLowerValue with large value overflow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0042';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(256);
      treeSet.add(65536);
      treeSet.add(32768);
      let result = treeSet.getLowerValue(65536);
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4300
     * @tc.name      testTreeSet04Chapter0043
     * @tc.desc      Test getLowerValue method binding error with object TreeSet, expect to catch error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0043';
      console.log(TAG + ' start');

      interface TestObject {
        id: number;
        name: string;
      }

      let treeSet: TreeSet<TestObject> = new TreeSet<TestObject>();
      let obj1: TestObject = { id: 1, name: "test1" };
      let obj2: TestObject = { id: 2, name: "test2" };
      treeSet.add(obj1);
      treeSet.add(obj2);

      let func: (key: TestObject) => TestObject = treeSet.getLowerValue;
      let methodExecuted = false;
      let errorCaught = false;
      let errorCode: number | undefined;

      try {
        let result = func(obj2);
        methodExecuted = true;
      } catch (err) {
        errorCaught = true;
        errorCode = err.code;
      }

      expect(methodExecuted).assertFalse();
      expect(errorCaught).assertTrue();
      expect(errorCode).assertEqual(10200011);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4400
     * @tc.name      testTreeSet04Chapter0044
     * @tc.desc      Test getLowerValue with empty TreeSet of objects, should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0044';
      console.log(TAG + ' start');

      interface TestObject {
        id: number;
        name: string;
      }

      let treeSet: TreeSet<TestObject> = new TreeSet<TestObject>();
      let key: TestObject = { id: 1, name: "test" };
      let result = treeSet.getLowerValue(key);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4500
     * @tc.name      testTreeSet04Chapter0045
     * @tc.desc      Test getHigherValue with Int8Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0045';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Int8Array>();
      let arr1 = new Int8Array([-128]);
      let arr2 = new Int8Array([127]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4600
     * @tc.name      testTreeSet04Chapter0046
     * @tc.desc      Test getHigherValue with Uint8Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0046';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Uint8Array>();
      let arr1 = new Uint8Array([0]);
      let arr2 = new Uint8Array([255]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4700
     * @tc.name      testTreeSet04Chapter0047
     * @tc.desc      Test getHigherValue with Int16Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0047';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Int16Array>();
      let arr1 = new Int16Array([-32768]);
      let arr2 = new Int16Array([32767]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4800
     * @tc.name      testTreeSet04Chapter0048
     * @tc.desc      Test getHigherValue with Uint16Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0048';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Uint16Array>();
      let arr1 = new Uint16Array([0]);
      let arr2 = new Uint16Array([65535]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_4900
     * @tc.name      testTreeSet04Chapter0049
     * @tc.desc      Test getHigherValue with Int32Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0049';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Int32Array>();
      let arr1 = new Int32Array([-2147483648]);
      let arr2 = new Int32Array([2147483647]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5000
     * @tc.name      testTreeSet04Chapter0050
     * @tc.desc      Test getHigherValue with Uint32Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0050';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Uint32Array>();
      let arr1 = new Uint32Array([0]);
      let arr2 = new Uint32Array([4294967295]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5100
     * @tc.name      testTreeSet04Chapter0051
     * @tc.desc      Test getHigherValue with Float32Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0051';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Float32Array>();
      let arr1 = new Float32Array([-3.4028234663852886e38]);
      let arr2 = new Float32Array([3.4028234663852886e38]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5200
     * @tc.name      testTreeSet04Chapter0052
     * @tc.desc      Test getHigherValue with Float64Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0052';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Float64Array>();
      let arr1 = new Float64Array([-1.7976931348623157e308]);
      let arr2 = new Float64Array([1.7976931348623157e308]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5300
     * @tc.name      testTreeSet04Chapter0053
     * @tc.desc      Test getHigherValue with BigInt64Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0053';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<BigInt64Array>();
      let arr1 = new BigInt64Array([-9223372036854775808n]);
      let arr2 = new BigInt64Array([9223372036854775807n]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      // 比较BigInt64Array的第一个元素而不是整个数组
      expect(result[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5400
     * @tc.name      testTreeSet04Chapter0054
     * @tc.desc      Test getHigherValue with BigUint64Array boundary values in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0054';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<BigUint64Array>();
      let arr1 = new BigUint64Array([0n]);
      let arr2 = new BigUint64Array([18446744073709551615n]);
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      // 比较BigUint64Array的第一个元素而不是整个数组
      expect(result[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5500
     * @tc.name      testTreeSet04Chapter0055
     * @tc.desc      Test getHigherValue with undefined string in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0055';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("test");
      try {
        treeSet.getHigherValue(undefined);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5600
     * @tc.name      testTreeSet04Chapter0056
     * @tc.desc      Test getHigherValue with null string in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0056';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("test");
      try {
        treeSet.getHigherValue(null);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5700
     * @tc.name      testTreeSet04Chapter0057
     * @tc.desc      Test getHigherValue with empty string in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0057';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      treeSet.add("a");
      let result = treeSet.getHigherValue("");
      expect(result).assertEqual("a");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5800
     * @tc.name      testTreeSet04Chapter0058
     * @tc.desc      Test getHigherValue with special characters string in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0058';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("!");
      treeSet.add("@");
      treeSet.add("#");
      treeSet.add("$");
      let result = treeSet.getHigherValue("@");
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_5900
     * @tc.name      testTreeSet04Chapter0059
     * @tc.desc      Test getHigherValue with ASCII characters string in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0059';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("A");
      treeSet.add("B");
      treeSet.add("C");
      let result = treeSet.getHigherValue("B");
      expect(result).assertEqual("C");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6000
     * @tc.name      testTreeSet04Chapter0060
     * @tc.desc      Test getHigherValue with escape characters string in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0060';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("\n");
      treeSet.add("\t");
      treeSet.add("\r");
      let result = treeSet.getHigherValue("\n");
      expect(result).assertEqual("\r");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6100
     * @tc.name      testTreeSet04Chapter0061
     * @tc.desc      Test getHigherValue with emoji string in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0061';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("👀");
      let result = treeSet.getHigherValue("👆");
      expect(result).assertEqual("👿");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6200
     * @tc.name      testTreeSet04Chapter0062
     * @tc.desc      Test getHigherValue with keyword string in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0062';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("0");
      treeSet.add("NaN");
      treeSet.add("Infinity");
      let result = treeSet.getHigherValue("0");
      expect(result).assertEqual("Infinity");
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6300
     * @tc.name      testTreeSet04Chapter0063
     * @tc.desc      Test getHigherValue with number 0 in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0063';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(1);
      let result = treeSet.getHigherValue(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6400
     * @tc.name      testTreeSet04Chapter0064
     * @tc.desc      Test getHigherValue with NaN number in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0064';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(NaN);
      treeSet.add(1);
      try {
        treeSet.getHigherValue(NaN);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6500
     * @tc.name      testTreeSet04Chapter0065
     * @tc.desc      Test getHigherValue with -0 number in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0065';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-0);
      treeSet.add(1);
      let result = treeSet.getHigherValue(-0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6600
     * @tc.name      testTreeSet04Chapter0066
     * @tc.desc      Test getHigherValue with Infinity number in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0066';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(Number.MAX_VALUE);
      let result = treeSet.getHigherValue(Number.MAX_VALUE);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6700
     * @tc.name      testTreeSet04Chapter0067
     * @tc.desc      Test getHigherValue with Number.MAX_VALUE in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0067';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MAX_VALUE - 1);
      let result = treeSet.getHigherValue(Number.MAX_VALUE - 1);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6800
     * @tc.name      testTreeSet04Chapter0068
     * @tc.desc      Test getHigherValue with Number.MIN_VALUE in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0068';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(Number.MIN_VALUE * 2);
      let result = treeSet.getHigherValue(Number.MIN_VALUE);
      expect(result).assertEqual(Number.MIN_VALUE * 2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_6900
     * @tc.name      testTreeSet04Chapter0069
     * @tc.desc      Test getHigherValue with Number.EPSILON in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0069';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.EPSILON);
      treeSet.add(Number.EPSILON * 2);
      let result = treeSet.getHigherValue(Number.EPSILON);
      expect(result).assertEqual(Number.EPSILON * 2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_7000
     * @tc.name      testTreeSet04Chapter0070
     * @tc.desc      Test getHigherValue with Number.MAX_SAFE_INTEGER in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0070';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(Number.MAX_SAFE_INTEGER - 1);
      let result = treeSet.getHigherValue(Number.MAX_SAFE_INTEGER - 1);
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_7100
     * @tc.name      testTreeSet04Chapter0071
     * @tc.desc      Test getHigherValue with bigint value in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0071';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<bigint>();
      treeSet.add(9007199254740991n);
      treeSet.add(9007199254740992n);
      let result = treeSet.getHigherValue(9007199254740991n);
      expect(result).assertEqual(9007199254740992n);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_7200
     * @tc.name      testTreeSet04Chapter0072
     * @tc.desc      Test getHigherValue with boolean true in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0072';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      let result = treeSet.getHigherValue(false);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_7300
     * @tc.name      testTreeSet04Chapter0073
     * @tc.desc      Test getHigherValue with empty array in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0073';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number[]>();
      let arr1: number[] = [];
      let arr2: number[] = [1];
      treeSet.add(arr1);
      treeSet.add(arr2);
      let result = treeSet.getHigherValue(arr1);
      expect(result).assertDeepEquals(arr2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_7400
     * @tc.name      testTreeSet04Chapter0074
     * @tc.desc      Test getHigherValue with array containing NaN in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0074';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number[]>();
      let arr1: number[] = [NaN];
      let arr2: number[] = [1];
      treeSet.add(arr1);
      treeSet.add(arr2);
      try {
        treeSet.getHigherValue(arr1);
      } catch (err) {
        expect(err.code).assertEqual(401);
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_7500
     * @tc.name      testTreeSet04Chapter0075
     * @tc.desc      Test getHigherValue with empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0075';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.getHigherValue(5);
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST04_7600
     * @tc.name      testTreeSet04Chapter0076
     * @tc.desc      Test getHigherValue with non-existent higher value in TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet04Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet04Chapter0076';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      let result = treeSet.getHigherValue(3);
      expect(result).assertUndefined();
    });

  })
}