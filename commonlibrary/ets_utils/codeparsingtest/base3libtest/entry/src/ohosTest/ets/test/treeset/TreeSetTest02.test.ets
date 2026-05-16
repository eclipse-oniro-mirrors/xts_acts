import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TreeSet, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeSet02Test() {
  describe('TreeSet02Test', () => {
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
     * @tc.number    SUB_TREESET_TEST02_0100
     * @tc.name      testTreeSet02Chapter0001
     * @tc.desc      Test isEmpty method on empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0001';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let result = treeSet.isEmpty();
      console.info(`Empty TreeSet isEmpty result: ${result}`);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_0200
     * @tc.name      testTreeSet02Chapter0002
     * @tc.desc      Test isEmpty method on non-empty TreeSet after adding elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0002';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("test");
      let result = treeSet.isEmpty();
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_0300
     * @tc.name      testTreeSet02Chapter0003
     * @tc.desc      Test isEmpty method on TreeSet after clearing all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0003';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("element1");
      treeSet.add("element2");
      treeSet.clear();
      let result = treeSet.isEmpty();
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_0400
     * @tc.name      testTreeSet02Chapter0004
     * @tc.desc      Test isEmpty method after removing all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0004';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.remove(1);
      treeSet.remove(2);
      treeSet.remove(3);
      let result = treeSet.isEmpty();
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_0500
     * @tc.name      testTreeSet02Chapter0005
     * @tc.desc      Test isEmpty method with TreeSet containing NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0005';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(NaN);
      let result = treeSet.isEmpty();
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_0600
     * @tc.name      testTreeSet02Chapter0006
     * @tc.desc      Test isEmpty method with TreeSet containing Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0006';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Infinity);
      let result: boolean = treeSet.isEmpty();
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_0700
     * @tc.name      testTreeSet02Chapter0007
     * @tc.desc      Test isEmpty method with TreeSet containing -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0007';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-Infinity);
      let result = treeSet.isEmpty();
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_0800
     * @tc.name      testTreeSet02Chapter0008
     * @tc.desc      Test isEmpty method with TreeSet containing null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0008';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<null>();
      treeSet.add(null);
      let result = treeSet.isEmpty();
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_0900
     * @tc.name      testTreeSet02Chapter0009
     * @tc.desc      Test isEmpty method with TreeSet containing undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0009';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<undefined>();
      treeSet.add(undefined);
      let result = treeSet.isEmpty();
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1000
     * @tc.name      testTreeSet02Chapter0010
     * @tc.desc      Test isEmpty method with large TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0010';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      for (let i = 0; i < 1000; i++) {
        treeSet.add(i);
      }
      let result = treeSet.isEmpty();
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1100
     * @tc.name      testTreeSet02Chapter0011
     * @tc.desc      Test isEmpty method after adding and then removing element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0011';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("singleElement");
      treeSet.remove("singleElement");
      let result = treeSet.isEmpty();
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1200
     * @tc.name      testTreeSet02Chapter0012
     * @tc.desc      Negative test: Test isEmpty method when TreeSet is bound to null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0012';
      console.log(TAG + ' start');
      try {
        let treeSet: TreeSet<string> | null = new TreeSet<string>();
        treeSet = null;
        let result: boolean = treeSet!.isEmpty();
        expect(result).assertUndefined();
      } catch (error) {
        expect(error).not().assertNull();
      }
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1300
     * @tc.name      testTreeSet02Chapter0013
     * @tc.desc      Negative test: Test isEmpty method on undefined TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0013';
      console.log(TAG + ' start');
      try {
        let treeSet: TreeSet<string> | undefined = undefined;
        let result: boolean = treeSet!.isEmpty();
      } catch (error) {
        expect(error).not().assertNull();
      }
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1400
     * @tc.name      testTreeSet02Chapter0014
     * @tc.desc      Test isEmpty method with empty TreeSet of object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0014';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Object>();
      let result = treeSet.isEmpty();
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1500
     * @tc.name      testTreeSet02Chapter0015
     * @tc.desc      Test isEmpty method with empty TreeSet of array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0015';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Array<number>>();
      let result = treeSet.isEmpty();
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1600
     * @tc.name      testTreeSet02Chapter0016
     * @tc.desc      Test isEmpty method with TreeSet containing basic type arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0016';
      console.log(TAG + ' start');
      let treeSet: TreeSet<Array<number>> = new TreeSet<Array<number>>();
      let result: boolean = treeSet.isEmpty();
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1700
     * @tc.name      testTreeSet02Chapter0017
     * @tc.desc      Test isEmpty method with TreeSet containing Date objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0017';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Date>();
      treeSet.add(new Date());
      let result = treeSet.isEmpty();
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_1800
     * @tc.name      testTreeSet02Chapter0018
     * @tc.desc      Test isEmpty method with TreeSet containing Boolean objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0018';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<Boolean>();
      treeSet.add(Boolean(true));
      let result: boolean = treeSet.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_1900
     * @tc.name      testTreeSet02Chapter0019
     * @tc.desc      Verify has method returns true for existing integer value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0019';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(123);
      const result = treeSet.has(123);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2000
     * @tc.name      testTreeSet02Chapter0020
     * @tc.desc      Verify has method returns false for non-existing integer value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0020';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(123);
      const result = treeSet.has(456);
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2100
     * @tc.name      testTreeSet02Chapter0021
     * @tc.desc      Verify has method with value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0021';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(0);
      const result = treeSet.has(0);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2200
     * @tc.name      testTreeSet02Chapter0022
     * @tc.desc      Verify has method with negative value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0022';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(-123);
      const result = treeSet.has(-123);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2300
     * @tc.name      testTreeSet02Chapter0023
     * @tc.desc      Verify has method with float value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0023';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(123.456);
      const result = treeSet.has(123.456);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2400
     * @tc.name      testTreeSet02Chapter0024
     * @tc.desc      Verify has method with Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0024';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Infinity);
      const result = treeSet.has(Infinity);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2500
     * @tc.name      testTreeSet02Chapter0025
     * @tc.desc      Verify has method with -Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0025';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(-Infinity);
      let result = treeSet.has(-Infinity);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2600
     * @tc.name      testTreeSet02Chapter0026
     * @tc.desc      Verify has method with NaN value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0026';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(NaN);
      const result = treeSet.has(NaN);
      expect(result).assertFalse();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2700
     * @tc.name      testTreeSet02Chapter0027
     * @tc.desc      Verify has method with Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0027';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_VALUE);
      const result = treeSet.has(Number.MAX_VALUE);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2800
     * @tc.name      testTreeSet02Chapter0028
     * @tc.desc      Verify has method with Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0028';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.MIN_VALUE);
      const result = treeSet.has(Number.MIN_VALUE);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_2900
     * @tc.name      testTreeSet02Chapter0029
     * @tc.desc      Verify has method with Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0029';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.EPSILON);
      const result = treeSet.has(Number.EPSILON);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3000
     * @tc.name      testTreeSet02Chapter0030
     * @tc.desc      Verify has method with Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0030';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_SAFE_INTEGER);
      const result = treeSet.has(Number.MAX_SAFE_INTEGER);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3100
     * @tc.name      testTreeSet02Chapter0031
     * @tc.desc      Verify has method with -0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0031';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(-0);
      const result = treeSet.has(-0);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3200
     * @tc.name      testTreeSet02Chapter0032
     * @tc.desc      Verify has method with scientific notation value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0032';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(1e3);
      const result = treeSet.has(1e3);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3300
     * @tc.name      testTreeSet02Chapter0033
     * @tc.desc      Verify has method with hexadecimal value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0033';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(0x0102);
      const result = treeSet.has(0x0102);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3400
     * @tc.name      testTreeSet02Chapter0034
     * @tc.desc      Verify has method with boolean true value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0034';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      const result = treeSet.has(true);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3500
     * @tc.name      testTreeSet02Chapter0035
     * @tc.desc      Verify has method with boolean false value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0035';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<boolean>();
      treeSet.add(false);
      const result = treeSet.has(false);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3600
     * @tc.name      testTreeSet02Chapter0036
     * @tc.desc      Verify has method with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0036';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("");
      const result = treeSet.has("");
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3700
     * @tc.name      testTreeSet02Chapter0037
     * @tc.desc      Verify has method with normal string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0037';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("HelloWorld123?");
      const result = treeSet.has("HelloWorld123?");
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3800
     * @tc.name      testTreeSet02Chapter0038
     * @tc.desc      Verify has method with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0038';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      const result = treeSet.has("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_3900
     * @tc.name      testTreeSet02Chapter0039
     * @tc.desc      Verify has method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0039';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      const result =
        treeSet.has("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4000
     * @tc.name      testTreeSet02Chapter0040
     * @tc.desc      Verify has method with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0040';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("\a\b\f\n\r\t\v\\\'\"\?\0\x41");
      const result = treeSet.has("\a\b\f\n\r\t\v\\\'\"\?\0\x41");
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4100
     * @tc.name      testTreeSet02Chapter0041
     * @tc.desc      Verify has method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0041';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴");
      const result = treeSet.has("👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴");
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4200
     * @tc.name      testTreeSet02Chapter0042
     * @tc.desc      Verify has method with keyword string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0042';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("NaN");
      const result = treeSet.has("NaN");
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4300
     * @tc.name      testTreeSet02Chapter0043
     * @tc.desc      Verify has method with long repeated string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0043';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      const longString = "a".repeat(10000);
      treeSet.add(longString);
      const result = treeSet.has(longString);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4400
     * @tc.name      testTreeSet02Chapter0044
     * @tc.desc      Verify has method with Uint8Array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0044';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<Uint8Array>();
      const arr = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      treeSet.add(arr);
      const result = treeSet.has(arr);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4500
     * @tc.name      testTreeSet02Chapter0045
     * @tc.desc      Verify has method with array containing zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0045';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<Uint8Array>();
      const arr = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      treeSet.add(arr);
      const result = treeSet.has(arr);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4600
     * @tc.name      testTreeSet02Chapter0046
     * @tc.desc      Verify has method with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0046';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<Uint8Array>();
      const arr = new Uint8Array([]);
      treeSet.add(arr);
      const result = treeSet.has(arr);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4700
     * @tc.name      testTreeSet02Chapter0047
     * @tc.desc      Verify has method with array containing non-numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0047';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<Array<number | string | boolean | null | undefined>>();
      const arr: Array<number | string | boolean | null | undefined> = [72, "abc", true, null, undefined, 108];
      treeSet.add(arr);
      const result = treeSet.has(arr);
      expect(result).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_4800
     * @tc.name      testTreeSet02Chapter0048
     * @tc.desc      Verify insert method with array containing non-numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0048';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(undefined);
      const result = treeSet.has(undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_4900
     * @tc.name      testTreeSet02Chapter0049
     * @tc.desc      Verify has method with value out of Int8Array range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0049';
      console.log(TAG + ' start');

      const treeSet = new TreeSet<Int8Array>((a: Int8Array, b: Int8Array) => {
        return a[0] < b[0];
      });
      const arr = new Int8Array([-128, 127]);

      let addSucceeded = false;
      let hasSucceeded = false;
      let errorCaught = false;
      let hasResult = false;

      try {
        treeSet.add(arr);
        addSucceeded = true;

        hasResult = treeSet.has(new Int8Array([-128, 127]));
        hasSucceeded = true;
      } catch (err) {
        errorCaught = true;
        console.error(TAG + ' error: ' + (err as Error).message);
      }

      expect(addSucceeded).assertTrue();
      expect(hasSucceeded).assertTrue();
      expect(errorCaught).assertFalse();
      expect(hasResult).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5000
     * @tc.name      testTreeSet02Chapter0050
     * @tc.desc      Get the first value from a non-empty TreeSet containing string type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0050';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      let result: string | undefined = treeSet.getFirstValue();
      expect(result).assertEqual("sparrow");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5100
     * @tc.name      testTreeSet02Chapter0051
     * @tc.desc      Get the first value from an empty TreeSet, should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0051';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let result = treeSet.getFirstValue();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5200
     * @tc.name      testTreeSet02Chapter0052
     * @tc.desc      Get the first value from a TreeSet containing number type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0052';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(100);
      treeSet.add(50);
      treeSet.add(200);
      let result: number | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5300
     * @tc.name      testTreeSet02Chapter0053
     * @tc.desc      Get the first value from a TreeSet containing special string data with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0053';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      treeSet.add("apple");
      let result: string | undefined = treeSet.getFirstValue();
      expect(result).assertEqual("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5400
     * @tc.name      testTreeSet02Chapter0054
     * @tc.desc      Get the first value from a TreeSet containing string data with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0054';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      treeSet.add("0");
      let result: string | undefined = treeSet.getFirstValue();
      expect(result)
        .assertEqual("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5500
     * @tc.name      testTreeSet02Chapter0055
     * @tc.desc      Get the first value from a TreeSet containing string data with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0055';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("\a\b\f\n\r\t\v\\\'\"\?");
      treeSet.add("banana");
      let result: string | undefined = treeSet.getFirstValue();
      expect(result).assertEqual("\a\b\f\n\r\t\v\\\'\"\?");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5600
     * @tc.name      testTreeSet02Chapter0056
     * @tc.desc      Get the first value from a TreeSet containing string data with emoji
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0056';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("👀");
      let result: string | undefined = treeSet.getFirstValue();
      expect(result).assertEqual("👀");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5700
     * @tc.name      testTreeSet02Chapter0057
     * @tc.desc      Get the first value from a TreeSet containing number data with extreme values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0057';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      let result: number | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5800
     * @tc.name      testTreeSet02Chapter0058
     * @tc.desc      Get the first value from a TreeSet containing number data with Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0058';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(-Infinity);
      treeSet.add(100);
      let result: number | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_5900
     * @tc.name      testTreeSet02Chapter0059
     * @tc.desc      Get the first value from a TreeSet containing number data with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0059';
      console.log(TAG + ' start');
      try {
        let treeSet: TreeSet<number> = new TreeSet<number>();
        treeSet.add(NaN);
        treeSet.add(10);
        let result: number | undefined = treeSet.getFirstValue();
        expect(Number.isNaN(result)).assertTrue();
      } catch (e) {
        expect(e).assertUndefined();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_6000
     * @tc.name      testTreeSet02Chapter0060
     * @tc.desc      Get the first value from a TreeSet containing number data with negative zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0060';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(-0);
      treeSet.add(0);
      treeSet.add(5);
      let result: number | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(-0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_6100
     * @tc.name      testTreeSet02Chapter0061
     * @tc.desc      Get the first value from a TreeSet containing number data with large integer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0061';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(Number.MAX_SAFE_INTEGER - 1);
      let result: number | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER - 1);
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_6200
     * @tc.name      testTreeSet02Chapter0062
     * @tc.desc      Get the first value from a TreeSet containing number data with scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0062';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(1e3);
      treeSet.add(2.5e-2);
      let result: number | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(2.5e-2);
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_6300
     * @tc.name      testTreeSet02Chapter0063
     * @tc.desc      Get the first value from a TreeSet containing number data with different numeric systems
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0063';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(0x0102);
      treeSet.add(0x01020304);
      treeSet.add(0o3);
      let result: number | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(0o3);
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_6400
     * @tc.name      testTreeSet02Chapter0064
     * @tc.desc      Get the first value from a TreeSet containing boolean type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0064';
      console.log(TAG + ' start');
      let treeSet: TreeSet<boolean> = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      let result: boolean | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(false);
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_6500
     * @tc.name      testTreeSet02Chapter0065
     * @tc.desc      Get the first value from a TreeSet containing string data with repeated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0065';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("!!\"\"##$$%%&&''(())**,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      treeSet.add("a");
      let result: string | undefined = treeSet.getFirstValue();
      expect(result).assertEqual("!!\"\"##$$%%&&''(())**,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_6600
     * @tc.name      testTreeSet02Chapter0066
     * @tc.desc      Get the first value from a TreeSet containing string data with keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0066';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("0");
      treeSet.add("NaN");
      treeSet.add("");
      let result: string | undefined = treeSet.getFirstValue();
      expect(result).assertEqual("");
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_6700
     * @tc.name      testTreeSet02Chapter0067
     * @tc.desc      Get the first value from a TreeSet containing number data with decimal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0067';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(123.456);
      treeSet.add(78.9);
      let result: number | undefined = treeSet.getFirstValue();
      expect(result).assertEqual(78.9);
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_6800
     * @tc.name      testTreeSet02Chapter0068
     * @tc.desc      Get the first value from a TreeSet containing string data with invalid Unicode encoding
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0068';
      console.log(TAG + ' start');
      try {
        let treeSet: TreeSet<string> = new TreeSet<string>();
        treeSet.add("\udc04");
        treeSet.add("\ud83d");
        treeSet.add("\udff4");
        treeSet.add("test");
        let result: string | undefined = treeSet.getFirstValue();
        expect(result).assertEqual("test");
      } catch (e) {
        expect(e).assertUndefined();
      }
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_6900
     * @tc.name      testTreeSet02Chapter0069
     * @tc.desc      Get the first value after removing elements from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0069';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("first");
      treeSet.add("second");
      treeSet.add("third");
      treeSet.remove("first");
      let result: string | undefined = treeSet.getFirstValue();
      expect(result).assertEqual("second");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7000
     * @tc.name      testTreeSet02Chapter0070
     * @tc.desc      getLastValue returns the last value in non-empty TreeSet with string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0070';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("sparrow");
      treeSet.add("squirrel");
      const result = treeSet.getLastValue();
      expect(result).assertEqual("squirrel");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7100
     * @tc.name      testTreeSet02Chapter0071
     * @tc.desc      getLastValue returns undefined for empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0071';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      const result = treeSet.getLastValue();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7200
     * @tc.name      testTreeSet02Chapter0072
     * @tc.desc      getLastValue returns the last value in TreeSet with number values including NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0072';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(3);
      treeSet.add(2);
      treeSet.add(NaN);
      const result = treeSet.getLastValue();
      // 使用Number.isNaN()来正确检查NaN值
      expect(Number.isNaN(result)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7300
     * @tc.name      testTreeSet02Chapter0073
     * @tc.desc      getLastValue returns the last value in TreeSet with Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0073';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(-Infinity);
      treeSet.add(1);
      treeSet.add(Infinity);
      treeSet.add(-1);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7400
     * @tc.name      testTreeSet02Chapter0074
     * @tc.desc      getLastValue returns the last value in TreeSet with bigint values including boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0074';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<bigint>();
      treeSet.add(-9223372036854775808n);
      treeSet.add(0n);
      treeSet.add(9223372036854775807n);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7500
     * @tc.name      testTreeSet02Chapter0075
     * @tc.desc      getLastValue returns the last value in TreeSet with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0075';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<boolean>();
      treeSet.add(false);
      treeSet.add(true);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7600
     * @tc.name      testTreeSet02Chapter0076
     * @tc.desc      getLastValue returns the last value in TreeSet with negative zero and positive zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0076';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(-0);
      treeSet.add(0);
      treeSet.add(1);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7700
     * @tc.name      testTreeSet02Chapter0077
     * @tc.desc      getLastValue returns the last value in TreeSet with Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0077';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7800
     * @tc.name      testTreeSet02Chapter0078
     * @tc.desc      getLastValue returns the last value in TreeSet with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0078';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(Number.EPSILON);
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(-Number.MAX_SAFE_INTEGER);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_7900
     * @tc.name      testTreeSet02Chapter0079
     * @tc.desc      getLastValue returns the last value in TreeSet with string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0079';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      treeSet.add("abc");
      treeSet.add("xyz");
      const result = treeSet.getLastValue();
      expect(result).assertEqual("xyz");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8000
     * @tc.name      testTreeSet02Chapter0080
     * @tc.desc      getLastValue returns the last value in TreeSet with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0080';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("\n");
      treeSet.add("\t");
      treeSet.add("\r");
      treeSet.add(" ");
      const result = treeSet.getLastValue();
      expect(result).assertEqual(" ");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8100
     * @tc.name      testTreeSet02Chapter0081
     * @tc.desc      getLastValue returns the last value in TreeSet with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0081';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("😼");
      const result = treeSet.getLastValue();
      expect(result).assertEqual("😼");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8200
     * @tc.name      testTreeSet02Chapter0082
     * @tc.desc      getLastValue returns the last value in TreeSet with string keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0082';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<string>();
      treeSet.add("0");
      treeSet.add("NaN");
      treeSet.add("undefined");
      const result = treeSet.getLastValue();
      expect(result).assertEqual("undefined");
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8300
     * @tc.name      testTreeSet02Chapter0083
     * @tc.desc      getLastValue returns the last value in TreeSet with scientific notation numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0083';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(1e3);
      treeSet.add(2.5e-2);
      treeSet.add(2**3);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8400
     * @tc.name      testTreeSet02Chapter0084
     * @tc.desc      getLastValue returns the last value in TreeSet with different numeric bases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0084';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(0x0102);
      treeSet.add(0o3);
      treeSet.add(0b101);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(258);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8500
     * @tc.name      testTreeSet02Chapter0085
     * @tc.desc      getLastValue returns undefined after all elements are removed from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0085';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      treeSet.clear();
      const result = treeSet.getLastValue();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8600
     * @tc.name      testTreeSet02Chapter0086
     * @tc.desc      getLastValue returns the last value in TreeSet with many elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0086';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      for (let i = 0; i < 1000; i++) {
        treeSet.add(i);
      }
      const result = treeSet.getLastValue();
      expect(result).assertEqual(999);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8700
     * @tc.name      testTreeSet02Chapter0087
     * @tc.desc      getLastValue returns correct value after removing elements from TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0087';
      console.log(TAG + ' start');
      const treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(3);
      treeSet.add(2);
      treeSet.add(4);
      treeSet.remove(4);
      const result = treeSet.getLastValue();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8800
     * @tc.name      testTreeSet02Chapter0088
     * @tc.desc      Add Int8Array boundary value -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0088';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-128);
      expect(result).assertTrue();
      expect(treeSet.has(-128)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_8900
     * @tc.name      testTreeSet02Chapter0089
     * @tc.desc      Add Int8Array boundary value 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0089';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(127);
      expect(result).assertTrue();
      expect(treeSet.has(127)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_9000
     * @tc.name      testTreeSet02Chapter0090
     * @tc.desc      Add Int8Array out of bounds value -129
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0090';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-129);
      expect(result).assertTrue();
      expect(treeSet.has(-129)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_9100
     * @tc.name      testTreeSet02Chapter0091
     * @tc.desc      Add Int8Array out of bounds value 128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0091';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(128);
      expect(result).assertTrue();
      expect(treeSet.has(128)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_9200
     * @tc.name      testTreeSet02Chapter0092
     * @tc.desc      Add Uint8Array boundary value 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0092';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(0);
      expect(result).assertTrue();
      expect(treeSet.has(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_9300
     * @tc.name      testTreeSet02Chapter0093
     * @tc.desc      Add Uint8Array boundary value 255
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0093';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(255);
      expect(result).assertTrue();
      expect(treeSet.has(255)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_9400
     * @tc.name      testTreeSet02Chapter0094
     * @tc.desc      Add Uint8Array out of bounds value -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0094';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-1);
      expect(result).assertTrue();
      expect(treeSet.has(-1)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_9500
     * @tc.name      testTreeSet02Chapter0095
     * @tc.desc      Add Uint8Array out of bounds value 256
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0095';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(256);
      expect(result).assertTrue();
      expect(treeSet.has(256)).assertTrue();
    });


    /**
     * @tc.number    SUB_TREESET_TEST02_9600
     * @tc.name      testTreeSet02Chapter0096
     * @tc.desc      Add Int16Array boundary value -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0096';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-32768);
      expect(result).assertTrue();
      expect(treeSet.has(-32768)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_9700
     * @tc.name      testTreeSet02Chapter0097
     * @tc.desc      Add Int16Array boundary value 32767
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0097';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(32767);
      expect(result).assertTrue();
      expect(treeSet.has(32767)).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST02_9800
     * @tc.name      testTreeSet02Chapter0098
     * @tc.desc      Add Int16Array out of bounds value -32769
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet02Chapter0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet02Chapter0098';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      let result = treeSet.add(-32769);
      expect(result).assertTrue();
      expect(treeSet.has(-32769)).assertTrue();
    });
  })
}
