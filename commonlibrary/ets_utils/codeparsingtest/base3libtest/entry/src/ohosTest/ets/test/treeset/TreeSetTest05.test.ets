import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TreeSet, util } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeSet05Test() {
  describe('TreeSet05Test', () => {
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
     * @tc.number    SUB_TREESET_TEST05_0100
     * @tc.name      testTreeSet05Chapter0001
     * @tc.desc      Test popFirst method with non-empty TreeSet containing string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0001';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("owl");
      let result = treeSet.popFirst();
      expect(result).assertEqual("owl");
      expect(treeSet.length).assertEqual(2);
      expect(treeSet.has("owl")).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_0200
     * @tc.name      testTreeSet05Chapter0002
     * @tc.desc      Test popFirst method with empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0002';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let result = treeSet.popFirst();
      expect(result).assertUndefined();
      expect(treeSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_0300
     * @tc.name      testTreeSet05Chapter0003
     * @tc.desc      Test popFirst method with single element TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0003';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(100);
      let result = treeSet.popFirst();
      expect(result).assertEqual(100);
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.has(100)).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_0400
     * @tc.name      testTreeSet05Chapter0004
     * @tc.desc      Test popFirst method with multiple pop operations on string TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0004';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("zebra");
      treeSet.add("antelope");
      treeSet.add("bear");
      treeSet.add("cat");
      treeSet.add("dog");

      let firstPop = treeSet.popFirst();
      expect(firstPop).assertEqual("antelope");
      expect(treeSet.length).assertEqual(4);

      let secondPop = treeSet.popFirst();
      expect(secondPop).assertEqual("bear");
      expect(treeSet.length).assertEqual(3);

      let thirdPop = treeSet.popFirst();
      expect(thirdPop).assertEqual("cat");
      expect(treeSet.length).assertEqual(2);

      expect(treeSet.has("antelope")).assertFalse();
      expect(treeSet.has("bear")).assertFalse();
      expect(treeSet.has("cat")).assertFalse();
      expect(treeSet.has("dog")).assertTrue();
      expect(treeSet.has("zebra")).assertTrue();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_0500
     * @tc.name      testTreeSet05Chapter0005
     * @tc.desc      Test popFirst method with number TreeSet containing negative values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0005';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(100);
      treeSet.add(-50);
      treeSet.add(0);
      treeSet.add(-100);
      treeSet.add(50);

      let result = treeSet.popFirst();
      expect(result).assertEqual(-100);
      expect(treeSet.length).assertEqual(4);
      expect(treeSet.has(-100)).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_0600
     * @tc.name      testTreeSet05Chapter0006
     * @tc.desc      Test popFirst method with TreeSet containing special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0006';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(-Infinity);
      treeSet.add(0);
      treeSet.add(100);
      treeSet.add(-100);

      let result = treeSet.popFirst();
      expect(result).assertEqual(-Infinity);
      expect(treeSet.length).assertEqual(4);
      expect(treeSet.has(-Infinity)).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_0700
     * @tc.name      testTreeSet05Chapter0007
     * @tc.desc      Test popFirst method with TreeSet containing large number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0007';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(Number.MIN_SAFE_INTEGER);
      treeSet.add(0);

      let result = treeSet.popFirst();
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(treeSet.length).assertEqual(4);
      expect(treeSet.has(Number.MIN_SAFE_INTEGER)).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_0800
     * @tc.name      testTreeSet05Chapter0008
     * @tc.desc      Test popFirst method with custom comparator function for descending order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0008';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>((a: number, b: number): boolean => {

        return a > b;
      });
      treeSet.add(10);
      treeSet.add(20);
      treeSet.add(30);
      treeSet.add(5);

      let result = treeSet.popFirst();
      expect(result).assertEqual(30);
      expect(treeSet.length).assertEqual(3);
      expect(treeSet.has(30)).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_0900
     * @tc.name      testTreeSet05Chapter0009
     * @tc.desc      Test popFirst method after clearing TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0009';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("cherry");
      treeSet.clear();
      let result = treeSet.popFirst();
      expect(result).assertUndefined();
      expect(treeSet.length).assertEqual(0);

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1000
     * @tc.name      testTreeSet05Chapter0010
     * @tc.desc      Test popFirst method with TreeSet containing duplicate values (should not have duplicates)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0010';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("banana");
      treeSet.add("cherry");

      expect(treeSet.length).assertEqual(3);
      let firstPop = treeSet.popFirst();
      expect(firstPop).assertEqual("apple");
      expect(treeSet.length).assertEqual(2);

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1100
     * @tc.name      testTreeSet05Chapter0011
     * @tc.desc      Test popFirst method with TreeSet containing boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0011';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      let result = treeSet.popFirst();
      expect(result).assertFalse();
      expect(treeSet.length).assertEqual(1);
      expect(treeSet.has(false)).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1200
     * @tc.name      testTreeSet05Chapter0012
     * @tc.desc      Test popFirst method with TreeSet containing special string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0012';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      treeSet.add(" ");
      treeSet.add("0");
      treeSet.add("null");
      treeSet.add("undefined");
      treeSet.add("NaN");

      let result = treeSet.popFirst();
      expect(result).assertEqual("");
      expect(treeSet.length).assertEqual(5);
      expect(treeSet.has("")).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1300
     * @tc.name      testTreeSet05Chapter0013
     * @tc.desc      Test popFirst method with TreeSet containing emoji and special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0013';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("👀");
      treeSet.add("💯");
      treeSet.add("🎅");
      treeSet.add("a");
      treeSet.add("A");
      treeSet.add("0");

      let result = treeSet.popFirst();
      expect(result).assertEqual("0");
      expect(treeSet.length).assertEqual(7);
      expect(treeSet.has("0")).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1400
     * @tc.name      testTreeSet05Chapter0014
     * @tc.desc      Test popFirst method error scenario - binding error (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0014';
      console.log(TAG + ' start');
      try {
        let treeSet = new TreeSet<string>();
        let popFirstFunc = treeSet.popFirst;
        let result = popFirstFunc();
        expect(result).assertUndefined();
      } catch (error) {
        expect(error.code).assertEqual(10200011);
      }

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1500
     * @tc.name      testTreeSet05Chapter0015
     * @tc.desc      Test popLast method with non-empty TreeSet containing string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0015';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("owl");
      let result = treeSet.popLast();
      expect(result).assertEqual("squirrel");
      expect(treeSet.length).assertEqual(2);
      expect(treeSet.has("squirrel")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1600
     * @tc.name      testTreeSet05Chapter0016
     * @tc.desc      Test popLast method with empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0016';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let result = treeSet.popLast();
      expect(result).assertUndefined();
      expect(treeSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1700
     * @tc.name      testTreeSet05Chapter0017
     * @tc.desc      Test popLast method with single element TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0017';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(100);
      let result = treeSet.popLast();
      expect(result).assertEqual(100);
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.has(100)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1800
     * @tc.name      testTreeSet05Chapter0018
     * @tc.desc      Test popLast method with multiple pop operations on string TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0018';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("zebra");
      treeSet.add("antelope");
      treeSet.add("bear");
      treeSet.add("cat");
      treeSet.add("dog");

      let firstPop = treeSet.popLast();
      expect(firstPop).assertEqual("zebra");
      expect(treeSet.length).assertEqual(4);

      let secondPop = treeSet.popLast();
      expect(secondPop).assertEqual("dog");
      expect(treeSet.length).assertEqual(3);

      let thirdPop = treeSet.popLast();
      expect(thirdPop).assertEqual("cat");
      expect(treeSet.length).assertEqual(2);

      expect(treeSet.has("zebra")).assertFalse();
      expect(treeSet.has("dog")).assertFalse();
      expect(treeSet.has("cat")).assertFalse();
      expect(treeSet.has("bear")).assertTrue();
      expect(treeSet.has("antelope")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_1900
     * @tc.name      testTreeSet05Chapter0019
     * @tc.desc      Test popLast method with number TreeSet containing negative values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0019';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(100);
      treeSet.add(-50);
      treeSet.add(0);
      treeSet.add(-100);
      treeSet.add(50);

      let result = treeSet.popLast();
      expect(result).assertEqual(100);
      expect(treeSet.length).assertEqual(4);
      expect(treeSet.has(100)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2000
     * @tc.name      testTreeSet05Chapter0020
     * @tc.desc      Test popLast method with TreeSet containing special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0020';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(-Infinity);
      treeSet.add(0);
      treeSet.add(100);
      treeSet.add(-100);

      let result = treeSet.popLast();
      expect(result).assertEqual(Infinity);
      expect(treeSet.length).assertEqual(4);
      expect(treeSet.has(Infinity)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2100
     * @tc.name      testTreeSet05Chapter0021
     * @tc.desc      Test popLast method with TreeSet containing large number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0021';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(Number.MIN_SAFE_INTEGER);
      treeSet.add(0);

      let result = treeSet.popLast();
      expect(result).assertEqual(Number.MAX_VALUE);
      expect(treeSet.length).assertEqual(4);
      expect(treeSet.has(Number.MAX_VALUE)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2200
     * @tc.name      testTreeSet05Chapter0022
     * @tc.desc      Test popLast method with custom comparator function for descending order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0022';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>((a: number, b: number): boolean => {
        return a > b;
      });
      treeSet.add(10);
      treeSet.add(20);
      treeSet.add(30);
      treeSet.add(5);

      let result = treeSet.popLast();
      expect(result).assertEqual(5);
      expect(treeSet.length).assertEqual(3);
      expect(treeSet.has(5)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2300
     * @tc.name      testTreeSet05Chapter0023
     * @tc.desc      Test popLast method after clearing TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0023';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("cherry");
      treeSet.clear();
      let result = treeSet.popLast();
      expect(result).assertUndefined();
      expect(treeSet.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2400
     * @tc.name      testTreeSet05Chapter0024
     * @tc.desc      Test popLast method with TreeSet containing duplicate values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0024';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("banana");
      treeSet.add("cherry");

      expect(treeSet.length).assertEqual(3);
      let firstPop = treeSet.popLast();
      expect(firstPop).assertEqual("cherry");
      expect(treeSet.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2500
     * @tc.name      testTreeSet05Chapter0025
     * @tc.desc      Test popLast method with TreeSet containing boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0025';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      let result = treeSet.popLast();
      expect(result).assertTrue();
      expect(treeSet.length).assertEqual(1);
      expect(treeSet.has(true)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2600
     * @tc.name      testTreeSet05Chapter0026
     * @tc.desc      Test popLast method with TreeSet containing special string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0026';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      treeSet.add(" ");
      treeSet.add("0");
      treeSet.add("null");
      treeSet.add("undefined");
      treeSet.add("NaN");

      let result = treeSet.popLast();
      expect(result).assertEqual("undefined");
      expect(treeSet.length).assertEqual(5);
      expect(treeSet.has("undefined")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2700
     * @tc.name      testTreeSet05Chapter0027
     * @tc.desc      Test popLast method with TreeSet containing emoji and special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0027';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("👀");
      treeSet.add("💯");
      treeSet.add("🎅");
      treeSet.add("a");
      treeSet.add("A");
      treeSet.add("0");

      let result = treeSet.popLast();
      expect(result).assertEqual("💯");
      expect(treeSet.length).assertEqual(7);
      expect(treeSet.has("💯")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2800
     * @tc.name      testTreeSet05Chapter0028
     * @tc.desc      Test popLast method with TreeSet containing ASCII special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0028';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("!");
      treeSet.add("\"");
      treeSet.add("#");
      treeSet.add("$");
      treeSet.add("%");
      treeSet.add("&");
      treeSet.add("'");
      treeSet.add("(");
      treeSet.add(")");
      treeSet.add("*");

      let result = treeSet.popLast();
      expect(result).assertEqual("*");
      expect(treeSet.length).assertEqual(9);
      expect(treeSet.has("*")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_2900
     * @tc.name      testTreeSet05Chapter0029
     * @tc.desc      Test popLast method with TreeSet containing numeric string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0029';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("100");
      treeSet.add("50");
      treeSet.add("200");
      treeSet.add("10");
      treeSet.add("1000");

      let result = treeSet.popLast();
      expect(result).assertEqual("50");
      expect(treeSet.length).assertEqual(4);
      expect(treeSet.has("50")).assertFalse();

    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3000
     * @tc.name      testTreeSet05Chapter0030
     * @tc.desc      Test popLast method error scenario - binding error (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0030';
      console.log(TAG + ' start');
      try {
        let treeSet = new TreeSet<string>();
        let popLastFunc = treeSet.popLast;
        let result = popLastFunc();
        expect(result).assertUndefined();
      } catch (error) {
        expect(error.code).assertEqual(10200011);
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3100
     * @tc.name      testTreeSet05Chapter0031
     * @tc.desc      Test clear method with TreeSet containing string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0031';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("owl");
      expect(treeSet.length).assertEqual(3);
      expect(treeSet.isEmpty()).assertFalse();

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has("squirrel")).assertFalse();
      expect(treeSet.has("sparrow")).assertFalse();
      expect(treeSet.has("owl")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3200
     * @tc.name      testTreeSet05Chapter0032
     * @tc.desc      Test clear method with empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0032';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3300
     * @tc.name      testTreeSet05Chapter0033
     * @tc.desc      Test clear method with TreeSet containing single element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0033';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("single");
      expect(treeSet.length).assertEqual(1);
      expect(treeSet.isEmpty()).assertFalse();

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has("single")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3400
     * @tc.name      testTreeSet05Chapter0034
     * @tc.desc      Test clear method with TreeSet containing number elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0034';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(100);
      treeSet.add(200);
      treeSet.add(300);
      treeSet.add(-50);
      treeSet.add(0);
      expect(treeSet.length).assertEqual(5);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has(100)).assertFalse();
      expect(treeSet.has(-50)).assertFalse();
      expect(treeSet.has(0)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3500
     * @tc.name      testTreeSet05Chapter0035
     * @tc.desc      Test clear method with TreeSet containing special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0035';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(-Infinity);
      treeSet.add(NaN);
      treeSet.add(0);
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      expect(treeSet.length).assertEqual(6);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has(Infinity)).assertFalse();
      expect(treeSet.has(NaN)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3600
     * @tc.name      testTreeSet05Chapter0036
     * @tc.desc      Test clear method with TreeSet containing boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0036';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      expect(treeSet.length).assertEqual(2);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has(true)).assertFalse();
      expect(treeSet.has(false)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3700
     * @tc.name      testTreeSet05Chapter0037
     * @tc.desc      Test clear method with TreeSet containing custom comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0037';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>((a: number, b: number): boolean => {
        return a > b;
      });
      treeSet.add(10);
      treeSet.add(20);
      treeSet.add(30);
      treeSet.add(5);
      expect(treeSet.length).assertEqual(4);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has(30)).assertFalse();
      expect(treeSet.has(5)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3800
     * @tc.name      testTreeSet05Chapter0038
     * @tc.desc      Test clear method with TreeSet containing duplicate values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0038';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("banana");
      treeSet.add("cherry");
      expect(treeSet.length).assertEqual(3);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has("apple")).assertFalse();
      expect(treeSet.has("banana")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_3900
     * @tc.name      testTreeSet05Chapter0039
     * @tc.desc      Test clear method with TreeSet containing special string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0039';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      treeSet.add(" ");
      treeSet.add("0");
      treeSet.add("null");
      treeSet.add("undefined");
      treeSet.add("NaN");
      expect(treeSet.length).assertEqual(6);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has("")).assertFalse();
      expect(treeSet.has("undefined")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4000
     * @tc.name      testTreeSet05Chapter0040
     * @tc.desc      Test clear method with TreeSet containing emoji and special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0040';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("👀");
      treeSet.add("💯");
      treeSet.add("🎅");
      expect(treeSet.length).assertEqual(5);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has("👆")).assertFalse();
      expect(treeSet.has("💯")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4100
     * @tc.name      testTreeSet05Chapter0041
     * @tc.desc      Test clear method with TreeSet containing ASCII special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0041';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("!");
      treeSet.add("\"");
      treeSet.add("#");
      treeSet.add("$");
      treeSet.add("%");
      treeSet.add("&");
      expect(treeSet.length).assertEqual(6);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has("!")).assertFalse();
      expect(treeSet.has("&")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4200
     * @tc.name      testTreeSet05Chapter0042
     * @tc.desc      Test clear method and then add new elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0042';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);
      expect(treeSet.length).assertEqual(3);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();

      treeSet.add(10);
      treeSet.add(20);
      expect(treeSet.length).assertEqual(2);
      expect(treeSet.isEmpty()).assertFalse();
      expect(treeSet.has(10)).assertTrue();
      expect(treeSet.has(20)).assertTrue();
      expect(treeSet.has(1)).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4300
     * @tc.name      testTreeSet05Chapter0043
     * @tc.desc      Test clear method on large TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0043';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      for (let i = 0; i < 10; i++) {
        treeSet.add(i);
      }
      expect(treeSet.length).assertEqual(10);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();

      for (let i = 0; i < 10; i++) {
        expect(treeSet.has(i)).assertFalse();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4400
     * @tc.name      testTreeSet05Chapter0044
     * @tc.desc      Test clear method multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0044';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      expect(treeSet.length).assertEqual(3);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4500
     * @tc.name      testTreeSet05Chapter0045
     * @tc.desc      Test clear method after pop operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0045';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("x");
      treeSet.add("y");
      treeSet.add("z");
      treeSet.popFirst();
      expect(treeSet.length).assertEqual(2);

      treeSet.clear();
      expect(treeSet.length).assertEqual(0);
      expect(treeSet.isEmpty()).assertTrue();
      expect(treeSet.has("y")).assertFalse();
      expect(treeSet.has("z")).assertFalse();
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4600
     * @tc.name      testTreeSet05Chapter0046
     * @tc.desc      Test clear method error scenario - binding error (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0046';
      console.log(TAG + ' start');
      try {
        let treeSet = new TreeSet<string>();
        treeSet.add("test");
        let clearFunc = treeSet.clear;
        clearFunc();
        expect(treeSet.length).assertEqual(1);
      } catch (error) {
        expect(error.code).assertEqual(10200011);
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4700
     * @tc.name      testTreeSet05Chapter0047
     * @tc.desc      Test values method returns correct iterator for empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0047';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      let iterator: IterableIterator<number> = treeSet.values();
      let resultArray: number[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4800
     * @tc.name      testTreeSet05Chapter0048
     * @tc.desc      Test values method returns iterator with correct string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0048';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      let iterator: IterableIterator<string> = treeSet.values();
      let resultArray: string[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual("sparrow");
      expect(resultArray[1]).assertEqual("squirrel");
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_4900
     * @tc.name      testTreeSet05Chapter0049
     * @tc.desc      Test values method with number type data including boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0049';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(Number.EPSILON);
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(Number.MIN_SAFE_INTEGER);
      let iterator: IterableIterator<number> = treeSet.values();
      let resultArray: number[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5000
     * @tc.name      testTreeSet05Chapter0050
     * @tc.desc      Test values method with boolean type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0050';
      console.log(TAG + ' start');
      let treeSet: TreeSet<boolean> = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      let iterator: IterableIterator<boolean> = treeSet.values();
      let resultArray: boolean[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual(false);
      expect(resultArray[1]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5100
     * @tc.name      testTreeSet05Chapter0051
     * @tc.desc      Test values method with special number values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0051';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(-Infinity);
      treeSet.add(NaN);
      let iterator: IterableIterator<number> = treeSet.values();
      let resultArray: number[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5200
     * @tc.name      testTreeSet05Chapter0052
     * @tc.desc      Test values method with large dataset
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0052';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      for (let i: number = 0; i < 1000; i++) {
        treeSet.add(i);
      }
      let iterator: IterableIterator<number> = treeSet.values();
      let count: number = 0;
      for (let value of iterator) {
        count++;
      }
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5300
     * @tc.name      testTreeSet05Chapter0053
     * @tc.desc      Test multiple calls to values method return independent iterators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0053';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("cherry");

      let iterator1: IterableIterator<string> = treeSet.values();
      let iterator2: IterableIterator<string> = treeSet.values();

      let result1: string[] = Array.from(iterator1);
      let result2: string[] = Array.from(iterator2);

      expect(result1.length).assertEqual(result2.length);
      expect(result1[0]).assertEqual(result2[0]);
      expect(result1[1]).assertEqual(result2[1]);
      expect(result1[2]).assertEqual(result2[2]);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5400
     * @tc.name      testTreeSet05Chapter0054
     * @tc.desc      Test values method with custom comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0054';
      console.log(TAG + ' start');
      let comparator: (firstValue: number, secondValue: number) => boolean =
        (firstValue: number, secondValue: number): boolean => {
          return firstValue < secondValue;
        };
      let treeSet: TreeSet<number> = new TreeSet<number>(comparator);
      treeSet.add(1);
      treeSet.add(3);
      treeSet.add(2);
      let iterator: IterableIterator<number> = treeSet.values();
      let resultArray: number[] = Array.from(iterator);
      expect(resultArray[0]).assertEqual(1);
      expect(resultArray[1]).assertEqual(2);
      expect(resultArray[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5500
     * @tc.name      testTreeSet05Chapter0055
     * @tc.desc      Test values method after removing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0055';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("dog");
      treeSet.add("cat");
      treeSet.add("bird");
      treeSet.remove("cat");
      let iterator: IterableIterator<string> = treeSet.values();
      let resultArray: string[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual("bird");
      expect(resultArray[1]).assertEqual("dog");
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5600
     * @tc.name      testTreeSet05Chapter0056
     * @tc.desc      Test values method returns iterator that can be used in for-of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0056';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(10);
      treeSet.add(20);
      treeSet.add(30);
      let sum: number = 0;
      let values: IterableIterator<number> = treeSet.values();
      for (let value of values) {
        sum += value;
      }
      expect(sum).assertEqual(60);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5700
     * @tc.name      testTreeSet05Chapter0057
     * @tc.desc      Test values method with object type data using custom comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0057';
      console.log(TAG + ' start');

      interface Person {
        name: string;
        age: number;
      }

      let comparator: (firstValue: Person, secondValue: Person) => boolean =
        (firstValue: Person, secondValue: Person): boolean => {
          return firstValue.age < secondValue.age;
        };
      let treeSet: TreeSet<Person> = new TreeSet<Person>(comparator);
      let person1: Person = { name: "Alice", age: 25 };
      let person2: Person = { name: "Bob", age: 30 };
      let person3: Person = { name: "Charlie", age: 20 };
      treeSet.add(person1);
      treeSet.add(person2);
      treeSet.add(person3);
      let iterator: IterableIterator<Person> = treeSet.values();
      let resultArray: Person[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0].name).assertEqual("Charlie");
      expect(resultArray[1].name).assertEqual("Alice");
      expect(resultArray[2].name).assertEqual("Bob");
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5800
     * @tc.name      testTreeSet05Chapter0058
     * @tc.desc      Test values method after clearing the TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0058';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("one");
      treeSet.add("two");
      treeSet.add("three");
      treeSet.clear();
      let iterator: IterableIterator<string> = treeSet.values();
      let resultArray: string[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_5900
     * @tc.name      testTreeSet05Chapter0059
     * @tc.desc      Test values method with duplicate values (should not appear in iterator)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0059';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(2);
      treeSet.add(3);
      let iterator: IterableIterator<number> = treeSet.values();
      let resultArray: number[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(3);
      expect(resultArray[0]).assertEqual(1);
      expect(resultArray[1]).assertEqual(2);
      expect(resultArray[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_6000
     * @tc.name      testTreeSet05Chapter0060
     * @tc.desc      Test values method returns iterator that respects insertion order with same values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0060';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("zebra");
      treeSet.add("apple");
      treeSet.add("monkey");
      let iterator: IterableIterator<string> = treeSet.values();
      let resultArray: string[] = Array.from(iterator);
      expect(resultArray[0]).assertEqual("apple");
      expect(resultArray[1]).assertEqual("monkey");
      expect(resultArray[2]).assertEqual("zebra");
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_6100
     * @tc.name      testTreeSet05Chapter0061
     * @tc.desc      Test values method with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0061';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(-10);
      treeSet.add(-5);
      treeSet.add(0);
      treeSet.add(5);
      treeSet.add(10);
      let iterator: IterableIterator<number> = treeSet.values();
      let resultArray: number[] = Array.from(iterator);
      expect(resultArray[0]).assertEqual(-10);
      expect(resultArray[1]).assertEqual(-5);
      expect(resultArray[2]).assertEqual(0);
      expect(resultArray[3]).assertEqual(5);
      expect(resultArray[4]).assertEqual(10);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_6200
     * @tc.name      testTreeSet05Chapter0062
     * @tc.desc      Test values method with floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0062';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(3.14);
      treeSet.add(2.71);
      treeSet.add(1.41);
      treeSet.add(0.0);
      let iterator: IterableIterator<number> = treeSet.values();
      let resultArray: number[] = Array.from(iterator);
      expect(resultArray[0]).assertEqual(0.0);
      expect(resultArray[1]).assertEqual(1.41);
      expect(resultArray[2]).assertEqual(2.71);
      expect(resultArray[3]).assertEqual(3.14);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_6300
     * @tc.name      testTreeSet05Chapter0063
     * @tc.desc      Test values method returns new iterator each time called
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0063';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(100);
      treeSet.add(200);
      let iterator1: IterableIterator<number> = treeSet.values();
      let next1: IteratorResult<number> = iterator1.next();
      let iterator2: IterableIterator<number> = treeSet.values();
      let next2: IteratorResult<number> = iterator2.next();
      expect(next1.value).assertEqual(next2.value);
      expect(next1.done).assertEqual(next2.done);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_6400
     * @tc.name      testTreeSet05Chapter0064
     * @tc.desc      Test values method with very large TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0064';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      let expectedCount: number = 5000;
      for (let i: number = 0; i < expectedCount; i++) {
        treeSet.add(i);
      }
      let iterator: IterableIterator<number> = treeSet.values();
      let actualCount: number = 0;
      for (let value of iterator) {
        actualCount++;
      }
      expect(actualCount).assertEqual(expectedCount);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_6500
     * @tc.name      testTreeSet05Chapter0065
     * @tc.desc      Test values method with mixed data types using union type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0065';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string | number> = new TreeSet<string | number>();
      treeSet.add("test");
      treeSet.add(123);
      treeSet.add(456);
      treeSet.add("hello");
      let iterator: IterableIterator<string | number> = treeSet.values();
      let resultArray: (string | number)[] = Array.from(iterator);
      expect(resultArray.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREESET_TEST05_6600
     * @tc.name      testTreeSet05Chapter0066
     * @tc.desc      Test values method error scenario - trying to bind values method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet05Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet05Chapter0066';
      console.log(TAG + ' start');

      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("test");

      let valuesSucceeded = false;
      let errorCaught = false;
      let resultArray: string[] = [];

      try {
        let iterator: IterableIterator<string> = treeSet.values();
        resultArray = Array.from(iterator);
        valuesSucceeded = true;
      } catch (error) {
        errorCaught = true;
      }

      expect(valuesSucceeded).assertTrue();
      expect(errorCaught).assertFalse();
      expect(resultArray.length).assertEqual(1);
      expect(resultArray[0]).assertEqual("test");
    });

  })
}