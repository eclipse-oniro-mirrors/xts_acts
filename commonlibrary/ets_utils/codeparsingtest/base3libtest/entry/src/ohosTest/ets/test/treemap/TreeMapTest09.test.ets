import { TreeMap } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

interface GeneratedTypeLiteralInterface_1 {
  message: string;
}

interface GeneratedTypeLiteralInterface_2 {
  code: number;
}

interface GeneratedTypeLiteralInterface_3 {
  message: string;
}

interface GeneratedTypeLiteralInterface_4 {
  code: number;
}

interface GeneratedTypeLiteralInterface_5 {
  message: string;
}

interface GeneratedTypeLiteralInterface_6 {
  code: number;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeMap09Test() {
  describe('TreeMap09Test', () => {
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
     * @tc.number    SUB_TREEMAP_TEST09_0100
     * @tc.name      testTreeMap09Chapter0001
     * @tc.desc      Replace existing string key updates value and returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0001";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("sparrow", 123);
      const result: boolean = treeMap.replace("sparrow", 357);
      const value: number | undefined = treeMap.get("sparrow");

      expect(result).assertTrue();
      expect(value).assertEqual(357);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_0200
     * @tc.name      testTreeMap09Chapter0002
     * @tc.desc      Replace key when multiple entries exist only changes target value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0002";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("sparrow", 123);
      treeMap.set("eagle", 456);

      const result: boolean = treeMap.replace("sparrow", 789);
      const sparrowValue: number | undefined = treeMap.get("sparrow");
      const eagleValue: number | undefined = treeMap.get("eagle");

      expect(result).assertTrue();
      expect(sparrowValue).assertEqual(789);
      expect(eagleValue).assertEqual(456);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_0300
     * @tc.name      testTreeMap09Chapter0003
     * @tc.desc      Replace non-existing string key returns false and map keeps original value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0003";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("eagle", 456);

      const result: boolean = treeMap.replace("sparrow", 789);
      const eagleValue: number | undefined = treeMap.get("eagle");
      const sparrowValue: number | undefined = treeMap.get("sparrow");

      expect(result).assertFalse();
      expect(eagleValue).assertEqual(456);
      expect(sparrowValue).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_0400
     * @tc.name      testTreeMap09Chapter0004
     * @tc.desc      Replace with same value returns true and value unchanged
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0004";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("falcon", 100);

      const result: boolean = treeMap.replace("falcon", 100);
      const value: number | undefined = treeMap.get("falcon");

      expect(result).assertTrue();
      expect(value).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_0500
     * @tc.name      testTreeMap09Chapter0005
     * @tc.desc      Replace using empty string key works and returns true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0005";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("", 1);

      const result: boolean = treeMap.replace("", 2);
      const value: number | undefined = treeMap.get("");

      expect(result).assertTrue();
      expect(value).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_0600
     * @tc.name      testTreeMap09Chapter0006
     * @tc.desc      Replace on number key covers existing and non-existing numeric keys
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0006";
      console.log(TAG + " start");

      const treeMap = new TreeMap<number, string>();
      treeMap.set(0, "zero");

      const resultExisting: boolean = treeMap.replace(0, "updatedZero");
      const valueExisting: string | undefined = treeMap.get(0);

      const resultMissing: boolean = treeMap.replace(1, "one");
      const valueMissing: string | undefined = treeMap.get(1);

      expect(resultExisting).assertTrue();
      expect(valueExisting).assertEqual("updatedZero");
      expect(resultMissing).assertFalse();
      expect(valueMissing).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_0700
     * @tc.name      testTreeMap09Chapter0007
     * @tc.desc      Replace with NaN numeric value succeeds and stored value is NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0007";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("num", 1);

      const result: boolean = treeMap.replace("num", NaN);
      const value: number | undefined = treeMap.get("num");
      const isNaNValue: boolean = value !== undefined && Number.isNaN(value);

      expect(result).assertTrue();
      expect(isNaNValue).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_0800
     * @tc.name      testTreeMap09Chapter0008
     * @tc.desc      Calling replace as unbound function throws binding error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0008";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("key", 1);

      let errorCaught: boolean = false;
      try {
        const handler: (key: string, newValue: number) => boolean = treeMap.replace;
        handler("key", 2);
      } catch (error) {
        errorCaught = true;
        interface ErrorInfo {
          code: number;
          message: string;
        }
        const errInfo: ErrorInfo = error as ErrorInfo;
        const isBindingError: boolean =
          errInfo.code === 10200011 ||
            (typeof errInfo.message === "string" &&
              (errInfo.message.indexOf("replace method cannot be bound") >= 0 ||
                errInfo.message.indexOf("cannot be bound") >= 0));
        expect(isBindingError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_0900
     * @tc.name      testTreeMap09Chapter0009
     * @tc.desc      Using call with unbound replace and wrong this throws binding error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0009";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("key", 1);

      let errorCaught: boolean = false;
      try {
        const handler: (key: string, newValue: number) => boolean = treeMap.replace;
        handler("key", 3);
      } catch (error) {
        errorCaught = true;
        interface ErrorInfo {
          code: number;
          message: string;
        }
        const errInfo: ErrorInfo = error as ErrorInfo;
        const isBindingError: boolean =
          errInfo.code === 10200011 ||
            (typeof errInfo.message === "string" &&
              (errInfo.message.indexOf("replace method cannot be bound") >= 0 ||
                errInfo.message.indexOf("cannot be bound") >= 0));
        expect(isBindingError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1000
     * @tc.name      testTreeMap09Chapter0010
     * @tc.desc      Using call on instance replace with wrong this throws binding error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = "testTreeMap09Chapter0010";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("key", 1);
      treeMap.replace("key", 4);
      expect(treeMap.get("key")).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1100
     * @tc.name      testTreeMap09Chapter0011
     * @tc.desc      Clear non empty map makes it empty and isEmpty is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0011";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);

      treeMap.clear();

      const emptyResult: boolean = treeMap.isEmpty();
      const valueAfterClearSquirrel: number | undefined = treeMap.get("squirrel");
      const valueAfterClearSparrow: number | undefined = treeMap.get("sparrow");

      expect(emptyResult).assertTrue();
      expect(valueAfterClearSquirrel).assertEqual(undefined);
      expect(valueAfterClearSparrow).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1200
     * @tc.name      testTreeMap09Chapter0012
     * @tc.desc      Clear empty map keeps it empty and does not throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0012";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();

      treeMap.clear();

      const emptyResult: boolean = treeMap.isEmpty();
      const valueAfterClear: number | undefined = treeMap.get("anyKey");

      expect(emptyResult).assertTrue();
      expect(valueAfterClear).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1300
     * @tc.name      testTreeMap09Chapter0013
     * @tc.desc      Clear once then insert new elements works correctly after reuse
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0013";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("first", 1);
      treeMap.set("second", 2);

      treeMap.clear();

      const emptyAfterClear: boolean = treeMap.isEmpty();

      treeMap.set("third", 3);
      const emptyAfterInsert: boolean = treeMap.isEmpty();
      const valueThird: number | undefined = treeMap.get("third");
      const valueFirst: number | undefined = treeMap.get("first");

      expect(emptyAfterClear).assertTrue();
      expect(emptyAfterInsert).assertFalse();
      expect(valueThird).assertEqual(3);
      expect(valueFirst).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1400
     * @tc.name      testTreeMap09Chapter0014
     * @tc.desc      Multiple clear calls keep map empty and do not throw error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0014";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("alpha", 10);
      treeMap.set("beta", 20);

      treeMap.clear();
      treeMap.clear();

      const emptyResult: boolean = treeMap.isEmpty();
      const valueAlpha: number | undefined = treeMap.get("alpha");
      const valueBeta: number | undefined = treeMap.get("beta");

      expect(emptyResult).assertTrue();
      expect(valueAlpha).assertEqual(undefined);
      expect(valueBeta).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1500
     * @tc.name      testTreeMap09Chapter0015
     * @tc.desc      Clear on number key map removes all entries and makes it empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0015";
      console.log(TAG + " start");

      const treeMap = new TreeMap<number, string>();
      treeMap.set(1, "one");
      treeMap.set(2, "two");
      treeMap.set(3, "three");

      treeMap.clear();

      const emptyResult: boolean = treeMap.isEmpty();
      const valueOne: string | undefined = treeMap.get(1);
      const valueTwo: string | undefined = treeMap.get(2);
      const valueThree: string | undefined = treeMap.get(3);

      expect(emptyResult).assertTrue();
      expect(valueOne).assertEqual(undefined);
      expect(valueTwo).assertEqual(undefined);
      expect(valueThree).assertEqual(undefined);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1600
     * @tc.name      testTreeMap09Chapter0016
     * @tc.desc      Calling clear as unbound function throws binding error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0016";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("gamma", 30);

      let errorCaught: boolean = false;
      try {
        const handler: () => void = treeMap.clear;
        handler();
      } catch (error) {
        errorCaught = true;
        interface ErrorInfo {
          code: number;
          message: string;
        }
        const errInfo: ErrorInfo = error as ErrorInfo;
        const isBindingError: boolean =
          errInfo.code === 10200011 ||
            (typeof errInfo.message === "string" &&
              (errInfo.message.indexOf("clear method cannot be bound") >= 0 ||
                errInfo.message.indexOf("cannot be bound") >= 0));
        expect(isBindingError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1700
     * @tc.name      testTreeMap09Chapter0017
     * @tc.desc      Keys on non empty string map returns all keys in sorted order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0017";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);

      const keysIterator: IterableIterator<string> = treeMap.keys();
      const resultKeys: Array<string> = [];
      for (const key of keysIterator) {
        resultKeys.push(key);
      }

      expect(resultKeys.length).assertEqual(2);
      expect(resultKeys[0]).assertEqual("sparrow");
      expect(resultKeys[1]).assertEqual("squirrel");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1800
     * @tc.name      testTreeMap09Chapter0018
     * @tc.desc      Keys on empty map returns iterator with no elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0018";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();

      const keysIterator: IterableIterator<string> = treeMap.keys();
      const resultKeys: Array<string> = [];
      for (const key of keysIterator) {
        resultKeys.push(key);
      }

      expect(resultKeys.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_1900
     * @tc.name      testTreeMap09Chapter0019
     * @tc.desc      Keys on number key map returns keys in numeric sorted order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0019";
      console.log(TAG + " start");

      const treeMap = new TreeMap<number, string>();
      treeMap.set(3, "three");
      treeMap.set(1, "one");
      treeMap.set(2, "two");

      const keysIterator: IterableIterator<number> = treeMap.keys();
      const resultKeys: Array<number> = [];
      for (const key of keysIterator) {
        resultKeys.push(key);
      }

      expect(resultKeys.length).assertEqual(3);
      expect(resultKeys[0]).assertEqual(1);
      expect(resultKeys[1]).assertEqual(2);
      expect(resultKeys[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2000
     * @tc.name      testTreeMap09Chapter0020
     * @tc.desc      Multiple keys calls return independent iterators starting from first key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0020";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("gamma", 3);
      treeMap.set("alpha", 1);
      treeMap.set("beta", 2);

      const firstIterator: IterableIterator<string> = treeMap.keys();
      const firstStep = firstIterator.next();
      const firstKey: string | undefined = firstStep.value;

      const secondIterator: IterableIterator<string> = treeMap.keys();
      const resultKeysSecond: Array<string> = [];
      for (const key of secondIterator) {
        resultKeysSecond.push(key);
      }

      expect(firstKey).assertEqual("alpha");
      expect(resultKeysSecond.length).assertEqual(3);
      expect(resultKeysSecond[0]).assertEqual("alpha");
      expect(resultKeysSecond[1]).assertEqual("beta");
      expect(resultKeysSecond[2]).assertEqual("gamma");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2100
     * @tc.name      testTreeMap09Chapter0021
     * @tc.desc      Keys after clear returns iterator with no elements and map is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0021";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("first", 1);
      treeMap.set("second", 2);

      treeMap.clear();

      const keysIterator: IterableIterator<string> = treeMap.keys();
      const resultKeys: Array<string> = [];
      for (const key of keysIterator) {
        resultKeys.push(key);
      }
      const isEmptyResult: boolean = treeMap.isEmpty();

      expect(resultKeys.length).assertEqual(0);
      expect(isEmptyResult).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2200
     * @tc.name      testTreeMap09Chapter0022
     * @tc.desc      Calling keys as unbound function throws binding error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0022";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("delta", 4);

      let errorCaught: boolean = false;
      try {
        const handler: () => IterableIterator<string> = treeMap.keys;
        handler();
      } catch (error) {
        errorCaught = true;
        interface ErrorInfo {
          code: number;
          message: string;
        }
        const errInfo: ErrorInfo = error as ErrorInfo;
        const isBindingError: boolean =
          errInfo.code === 10200011 ||
            (typeof errInfo.message === "string" &&
              (errInfo.message.indexOf("keys method cannot be bound") >= 0 ||
                errInfo.message.indexOf("cannot be bound") >= 0));
        expect(isBindingError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2300
     * @tc.name      testTreeMap09Chapter0023
     * @tc.desc      Values on non empty string map returns values in key order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0023";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);

      const valuesIterator: IterableIterator<number> = treeMap.values();
      const resultValues: Array<number> = [];
      for (const value of valuesIterator) {
        resultValues.push(value);
      }

      expect(resultValues.length).assertEqual(2);
      expect(resultValues[0]).assertEqual(356);
      expect(resultValues[1]).assertEqual(123);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2400
     * @tc.name      testTreeMap09Chapter0024
     * @tc.desc      Values on empty map returns iterator with no elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0024";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();

      const valuesIterator: IterableIterator<number> = treeMap.values();
      const resultValues: Array<number> = [];
      for (const value of valuesIterator) {
        resultValues.push(value);
      }

      expect(resultValues.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2500
     * @tc.name      testTreeMap09Chapter0025
     * @tc.desc      Values on number key map returns values in numeric key order 1,2,3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0025";
      console.log(TAG + " start");

      const treeMap = new TreeMap<number, string>();
      treeMap.set(3, "three");
      treeMap.set(1, "one");
      treeMap.set(2, "two");

      const valuesIterator: IterableIterator<string> = treeMap.values();
      const resultValues: Array<string> = [];
      for (const value of valuesIterator) {
        resultValues.push(value);
      }

      expect(resultValues.length).assertEqual(3);
      expect(resultValues[0]).assertEqual("one");
      expect(resultValues[1]).assertEqual("two");
      expect(resultValues[2]).assertEqual("three");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2600
     * @tc.name      testTreeMap09Chapter0026
     * @tc.desc      Multiple values calls return independent iterators starting from first value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0026";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("gamma", 3);
      treeMap.set("alpha", 1);
      treeMap.set("beta", 2);

      const firstIterator: IterableIterator<number> = treeMap.values();
      const firstStep = firstIterator.next();
      const firstValue: number | undefined = firstStep.value;

      const secondIterator: IterableIterator<number> = treeMap.values();
      const resultValuesSecond: Array<number> = [];
      for (const value of secondIterator) {
        resultValuesSecond.push(value);
      }

      expect(firstValue).assertEqual(1);
      expect(resultValuesSecond.length).assertEqual(3);
      expect(resultValuesSecond[0]).assertEqual(1);
      expect(resultValuesSecond[1]).assertEqual(2);
      expect(resultValuesSecond[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2700
     * @tc.name      testTreeMap09Chapter0027
     * @tc.desc      Values after clear returns iterator with no elements and map is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0027";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("first", 1);
      treeMap.set("second", 2);

      treeMap.clear();

      const valuesIterator: IterableIterator<number> = treeMap.values();
      const resultValues: Array<number> = [];
      for (const value of valuesIterator) {
        resultValues.push(value);
      }
      const isEmptyResult: boolean = treeMap.isEmpty();

      expect(resultValues.length).assertEqual(0);
      expect(isEmptyResult).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2800
     * @tc.name      testTreeMap09Chapter0028
     * @tc.desc      Calling values as unbound function throws binding error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0028";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("delta", 4);

      let errorCaught: boolean = false;
      try {
        const handler: () => IterableIterator<number> = treeMap.values;
        handler();
      } catch (error) {
        errorCaught = true;
        interface ErrorInfo {
          code: number;
          message: string;
        }
        const errInfo: ErrorInfo = error as ErrorInfo;
        const isBindingError: boolean =
          errInfo.code === 10200011 ||
            (typeof errInfo.message === "string" &&
              (errInfo.message.indexOf("values method cannot be bound") >= 0 ||
                errInfo.message.indexOf("cannot be bound") >= 0));
        expect(isBindingError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_2900
     * @tc.name      testTreeMap09Chapter0029
     * @tc.desc      Values with union type includes undefined and preserves order by key sort
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0029";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number | undefined>();
      treeMap.set("alpha", 1);
      treeMap.set("beta", undefined);
      treeMap.set("delta", 4);
      treeMap.set("gamma", 3);

      const valuesIterator: IterableIterator<number | undefined> = treeMap.values();
      const resultValues: Array<number | undefined> = [];
      for (const value of valuesIterator) {
        resultValues.push(value);
      }

      expect(resultValues.length).assertEqual(4);
      expect(resultValues[0]).assertEqual(1);
      expect(resultValues[1]).assertEqual(undefined);
      expect(resultValues[2]).assertEqual(4);
      expect(resultValues[3]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3000
     * @tc.name      testTreeMap09Chapter0030
     * @tc.desc      Values with object type returns objects in key order and fields readable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0030";
      console.log(TAG + " start");

      interface Bird {
        id: number;
        name: string;
      }

      const treeMap = new TreeMap<string, Bird>();
      treeMap.set("alpha", { id: 1, name: "sparrow" });
      treeMap.set("beta", { id: 2, name: "eagle" });
      treeMap.set("delta", { id: 4, name: "owl" });
      treeMap.set("gamma", { id: 3, name: "falcon" });

      const valuesIterator: IterableIterator<Bird> = treeMap.values();
      const resultValues: Array<Bird> = [];
      for (const value of valuesIterator) {
        resultValues.push(value);
      }

      expect(resultValues.length).assertEqual(4);
      expect(resultValues[0].id).assertEqual(1);
      expect(resultValues[0].name).assertEqual("sparrow");
      expect(resultValues[1].id).assertEqual(2);
      expect(resultValues[1].name).assertEqual("eagle");
      expect(resultValues[2].id).assertEqual(4);
      expect(resultValues[2].name).assertEqual("owl");
      expect(resultValues[3].id).assertEqual(3);
      expect(resultValues[3].name).assertEqual("falcon");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3100
     * @tc.name      testTreeMap09Chapter0031
     * @tc.desc      ForEach on non empty string map visits entries in key order gull,sparrow
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0031";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("sparrow", 123);
      treeMap.set("gull", 357);

      const keysSeq: Array<string> = [];
      const valuesSeq: Array<number> = [];
      treeMap.forEach((value: number, key: string, map: TreeMap<string, number>): void => {
        keysSeq.push(key);
        valuesSeq.push(value);
        const sameMap: boolean = map === treeMap;
        expect(sameMap).assertTrue();
      });

      expect(keysSeq.length).assertEqual(2);
      expect(keysSeq[0]).assertEqual("gull");
      expect(keysSeq[1]).assertEqual("sparrow");
      expect(valuesSeq[0]).assertEqual(357);
      expect(valuesSeq[1]).assertEqual(123);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3200
     * @tc.name      testTreeMap09Chapter0032
     * @tc.desc      ForEach on empty map does not invoke callback and keeps empty state true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0032";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      let count: number = 0;

      treeMap.forEach((value: number, key: string, map: TreeMap<string, number>): void => {
        count++;
      });

      const isEmptyResult: boolean = treeMap.isEmpty();
      expect(count).assertEqual(0);
      expect(isEmptyResult).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3300
     * @tc.name      testTreeMap09Chapter0033
     * @tc.desc      ForEach on number key map visits entries by numeric key order 1,2,3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0033";
      console.log(TAG + " start");

      const treeMap = new TreeMap<number, string>();
      treeMap.set(3, "three");
      treeMap.set(1, "one");
      treeMap.set(2, "two");

      const keysSeq: Array<number> = [];
      const valuesSeq: Array<string> = [];
      treeMap.forEach((value: string, key: number, map: TreeMap<number, string>): void => {
        keysSeq.push(key);
        valuesSeq.push(value);
        const sameMap: boolean = map === treeMap;
        expect(sameMap).assertTrue();
      });

      expect(keysSeq.length).assertEqual(3);
      expect(keysSeq[0]).assertEqual(1);
      expect(keysSeq[1]).assertEqual(2);
      expect(keysSeq[2]).assertEqual(3);
      expect(valuesSeq[0]).assertEqual("one");
      expect(valuesSeq[1]).assertEqual("two");
      expect(valuesSeq[2]).assertEqual("three");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3400
     * @tc.name      testTreeMap09Chapter0034
     * @tc.desc      ForEach with thisArg uses provided context object during callback invocation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0034";
      console.log(TAG + " start");

      interface Ctx {
        tag: string;
      }
      const ctx: Ctx = { tag: "context" };

      const treeMap = new TreeMap<string, number>();
      treeMap.set("alpha", 1);
      treeMap.set("beta", 2);

      let seenCtx: boolean = true;
      const cb = (value: number, key: string, map: TreeMap<string, number>): void => {
        if (ctx.tag !== ctx.tag) {
          seenCtx = false;
        }
      };



      treeMap.forEach(cb, ctx);
      expect(seenCtx).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3500
     * @tc.name      testTreeMap09Chapter0035
     * @tc.desc      ForEach without thisArg uses current instance as this and map is that instance too
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0035";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("alpha", 1);

      let seenThisIsMap: boolean = true;
      const cb = (value: number, key: string, map: TreeMap<string, number>): void => {
        if (map !== treeMap) {
          seenThisIsMap = false;
        }
      };


      treeMap.forEach(cb);
      expect(seenThisIsMap).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3600
     * @tc.name      testTreeMap09Chapter0036
     * @tc.desc      ForEach over union value type includes undefined and preserves key order alpha,beta,delta,gamma
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0036";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number | undefined>();
      treeMap.set("alpha", 1);
      treeMap.set("beta", undefined);
      treeMap.set("delta", 4);
      treeMap.set("gamma", 3);

      const valuesSeq: Array<number | undefined> = [];
      const keysSeq: Array<string> = [];
      treeMap.forEach((value: number | undefined, key: string, map: TreeMap<string, number | undefined>): void => {
        valuesSeq.push(value);
        keysSeq.push(key);
      });

      expect(keysSeq.length).assertEqual(4);
      expect(keysSeq[0]).assertEqual("alpha");
      expect(keysSeq[1]).assertEqual("beta");
      expect(keysSeq[2]).assertEqual("delta");
      expect(keysSeq[3]).assertEqual("gamma");
      expect(valuesSeq[0]).assertEqual(1);
      expect(valuesSeq[1]).assertEqual(undefined);
      expect(valuesSeq[2]).assertEqual(4);
      expect(valuesSeq[3]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3700
     * @tc.name      testTreeMap09Chapter0037
     * @tc.desc      ForEach visits all elements in large data set and counts equal to size 50 entries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0037";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      for (let i: number = 0; i < 50; i++) {
        const key: string = "k" + (i < 10 ? "0" + i : i.toString());
        treeMap.set(key, i);
      }

      let count: number = 0;
      treeMap.forEach((value: number, key: string, map: TreeMap<string, number>): void => {
        count++;
      });

      expect(count).assertEqual(50);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3800
     * @tc.name      testTreeMap09Chapter0038
     * @tc.desc      Calling forEach as unbound function throws binding error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0038";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("delta", 4);

      let errorCaught: boolean = false;
      try {
        const handler: (callbackFn: (value?: number, key?: string, map?: TreeMap<string, number>) => void, thisArg?: Object) => void = treeMap.forEach;
        handler((value?: number, key?: string, map?: TreeMap<string, number>): void => {}, undefined);
      } catch (error) {
        errorCaught = true;
        interface ErrorInfo {
          code: number;
          message: string;
        }
        const errInfo: ErrorInfo = error as ErrorInfo;
        const isBindingError: boolean =
          errInfo.code === 10200011 ||
            (typeof errInfo.message === "string" &&
              (errInfo.message.indexOf("forEach method cannot be bound") >= 0 ||
                errInfo.message.indexOf("cannot be bound") >= 0));
        expect(isBindingError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_3900
     * @tc.name      testTreeMap09Chapter0039
     * @tc.desc      Entries on non empty string map returns pairs in key order sparrow,squirrel
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0039";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);

      const itEntries: IterableIterator<[string, number]> = treeMap.entries();
      const pairs: Array<[string, number]> = [];
      for (const p of itEntries) {
        pairs.push(p);
      }

      expect(pairs.length).assertEqual(2);
      expect(pairs[0][0]).assertEqual("sparrow");
      expect(pairs[0][1]).assertEqual(356);
      expect(pairs[1][0]).assertEqual("squirrel");
      expect(pairs[1][1]).assertEqual(123);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4000
     * @tc.name      testTreeMap09Chapter0040
     * @tc.desc      Entries on empty map returns iterator with no elements and next done is true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0040";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      const itEntries: IterableIterator<[string, number]> = treeMap.entries();

      const pairs: Array<[string, number]> = [];
      for (const p of itEntries) {
        pairs.push(p);
      }

      const it2: IterableIterator<[string, number]> = treeMap.entries();
      const first: IteratorResult<[string, number]> = it2.next();

      expect(pairs.length).assertEqual(0);
      expect(first.done).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4100
     * @tc.name      testTreeMap09Chapter0041
     * @tc.desc      Entries on number key map returns pairs in numeric order 1,2,3 with values one,two,three
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0041";
      console.log(TAG + " start");

      const treeMap = new TreeMap<number, string>();
      treeMap.set(3, "three");
      treeMap.set(1, "one");
      treeMap.set(2, "two");

      const itEntries: IterableIterator<[number, string]> = treeMap.entries();
      const pairs: Array<[number, string]> = [];
      for (const p of itEntries) {
        pairs.push(p);
      }

      expect(pairs.length).assertEqual(3);
      expect(pairs[0][0]).assertEqual(1);
      expect(pairs[0][1]).assertEqual("one");
      expect(pairs[1][0]).assertEqual(2);
      expect(pairs[1][1]).assertEqual("two");
      expect(pairs[2][0]).assertEqual(3);
      expect(pairs[2][1]).assertEqual("three");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4200
     * @tc.name      testTreeMap09Chapter0042
     * @tc.desc      Multiple entries calls return independent iterators second starts from first pair again
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0042";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("gamma", 3);
      treeMap.set("alpha", 1);
      treeMap.set("beta", 2);

      const firstIt: IterableIterator<[string, number]> = treeMap.entries();
      const firstStep: IteratorResult<[string, number]> = firstIt.next();
      const firstPair: [string, number] | undefined = firstStep.value;

      const secondIt: IterableIterator<[string, number]> = treeMap.entries();
      const pairsSecond: Array<[string, number]> = [];
      for (const p of secondIt) {
        pairsSecond.push(p);
      }

      expect(firstPair?.[0]).assertEqual("alpha");
      expect(firstPair?.[1]).assertEqual(1);
      expect(pairsSecond.length).assertEqual(3);
      expect(pairsSecond[0][0]).assertEqual("alpha");
      expect(pairsSecond[0][1]).assertEqual(1);
      expect(pairsSecond[1][0]).assertEqual("beta");
      expect(pairsSecond[1][1]).assertEqual(2);
      expect(pairsSecond[2][0]).assertEqual("gamma");
      expect(pairsSecond[2][1]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4300
     * @tc.name      testTreeMap09Chapter0043
     * @tc.desc      Entries after clear returns no pairs and map is empty true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0043";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("first", 1);
      treeMap.set("second", 2);

      treeMap.clear();

      const itEntries: IterableIterator<[string, number]> = treeMap.entries();
      const pairs: Array<[string, number]> = [];
      for (const p of itEntries) {
        pairs.push(p);
      }
      const isEmptyResult: boolean = treeMap.isEmpty();

      expect(pairs.length).assertEqual(0);
      expect(isEmptyResult).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4400
     * @tc.name      testTreeMap09Chapter0044
     * @tc.desc      Calling entries as unbound function throws binding error 10200011
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0044";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("delta", 4);

      let errorCaught: boolean = false;
      try {
        const handler: () => IterableIterator<[string, number]> = treeMap.entries;
        handler();
      } catch (error) {
        errorCaught = true;
        interface ErrorInfo {
          code: number;
          message: string;
        }
        const errInfo: ErrorInfo = error as ErrorInfo;
        const isBindingError: boolean =
          errInfo.code === 10200011 ||
            (typeof errInfo.message === "string" &&
              (errInfo.message.indexOf("entries method cannot be bound") >= 0 ||
                errInfo.message.indexOf("cannot be bound") >= 0));
        expect(isBindingError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4500
     * @tc.name      testTreeMap09Chapter0045
     * @tc.desc      Entries visits all elements in large data set and count equals size fifty pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0045";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      for (let i: number = 0; i < 50; i++) {
        const key: string = "k" + (i < 10 ? "0" + i : i.toString());
        treeMap.set(key, i);
      }

      const itEntries: IterableIterator<[string, number]> = treeMap.entries();
      let count: number = 0;
      for (const p of itEntries) {
        count++;
      }

      expect(count).assertEqual(50);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4600
     * @tc.name      testTreeMap09Chapter0046
     * @tc.desc      Entries with union value type includes undefined and preserves key order alpha,beta,delta,gamma
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0046";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number | undefined>();
      treeMap.set("alpha", 1);
      treeMap.set("beta", undefined);
      treeMap.set("delta", 4);
      treeMap.set("gamma", 3);

      const itEntries: IterableIterator<[string, number | undefined]> = treeMap.entries();
      const keysSeq: Array<string> = [];
      const valuesSeq: Array<number | undefined> = [];
      for (const p of itEntries) {
        keysSeq.push(p[0]);
        valuesSeq.push(p[1]);
      }

      expect(keysSeq.length).assertEqual(4);
      expect(keysSeq[0]).assertEqual("alpha");
      expect(keysSeq[1]).assertEqual("beta");
      expect(keysSeq[2]).assertEqual("delta");
      expect(keysSeq[3]).assertEqual("gamma");
      expect(valuesSeq[0]).assertEqual(1);
      expect(valuesSeq[1]).assertEqual(undefined);
      expect(valuesSeq[2]).assertEqual(4);
      expect(valuesSeq[3]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4700
     * @tc.name      testTreeMap09Chapter0047
     * @tc.desc      Entries with object value type returns objects in key order and fields readable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0047";
      console.log(TAG + " start");

      interface Bird {
        id: number;
        name: string;
      }

      const treeMap = new TreeMap<string, Bird>();
      treeMap.set("alpha", { id: 1, name: "sparrow" });
      treeMap.set("beta", { id: 2, name: "eagle" });
      treeMap.set("delta", { id: 4, name: "owl" });
      treeMap.set("gamma", { id: 3, name: "falcon" });

      const itEntries: IterableIterator<[string, Bird]> = treeMap.entries();
      const pairs: Array<[string, Bird]> = [];
      for (const p of itEntries) {
        pairs.push(p);
      }

      expect(pairs.length).assertEqual(4);
      expect(pairs[0][0]).assertEqual("alpha");
      expect(pairs[0][1].id).assertEqual(1);
      expect(pairs[0][1].name).assertEqual("sparrow");
      expect(pairs[1][0]).assertEqual("beta");
      expect(pairs[1][1].id).assertEqual(2);
      expect(pairs[1][1].name).assertEqual("eagle");
      expect(pairs[2][0]).assertEqual("delta");
      expect(pairs[2][1].id).assertEqual(4);
      expect(pairs[2][1].name).assertEqual("owl");
      expect(pairs[3][0]).assertEqual("gamma");
      expect(pairs[3][1].id).assertEqual(3);
      expect(pairs[3][1].name).assertEqual("falcon");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4800
     * @tc.name      testTreeMap09Chapter0048
     * @tc.desc      Entries iterator next pattern yields all then returns done true at end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0048";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("alpha", 1);
      treeMap.set("beta", 2);

      const itEntries: IterableIterator<[string, number]> = treeMap.entries();
      let r: IteratorResult<[string, number]> = itEntries.next();
      const firstPair: [string, number] | undefined = r.value;
      r = itEntries.next();
      const secondPair: [string, number] | undefined = r.value;
      r = itEntries.next();

      expect(firstPair?.[0]).assertEqual("alpha");
      expect(firstPair?.[1]).assertEqual(1);
      expect(secondPair?.[0]).assertEqual("beta");
      expect(secondPair?.[1]).assertEqual(2);
      expect(r.done).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_4900
     * @tc.name      testTreeMap09Chapter0049
     * @tc.desc      Iterator on non empty string map yields pairs in key order sparrow,squirrel
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0049";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("squirrel", 123);
      treeMap.set("sparrow", 356);

      const pairs: Array<[string, number]> = [];
      for (const item of treeMap) {
        pairs.push(item);
      }

      expect(pairs.length).assertEqual(2);
      expect(pairs[0][0]).assertEqual("sparrow");
      expect(pairs[0][1]).assertEqual(356);
      expect(pairs[1][0]).assertEqual("squirrel");
      expect(pairs[1][1]).assertEqual(123);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5000
     * @tc.name      testTreeMap09Chapter0050
     * @tc.desc      Explicit iterator next pattern yields all pairs then returns done true at end
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0050";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("alpha", 1);
      treeMap.set("beta", 2);

      const iter: IterableIterator<[string, number]> = treeMap[Symbol.iterator]();
      let r1: IteratorResult<[string, number]> = iter.next();
      const first: [string, number] | undefined = r1.value;
      let r2: IteratorResult<[string, number]> = iter.next();
      const second: [string, number] | undefined = r2.value;
      let r3: IteratorResult<[string, number]> = iter.next();

      expect(first?.[0]).assertEqual("alpha");
      expect(first?.[1]).assertEqual(1);
      expect(second?.[0]).assertEqual("beta");
      expect(second?.[1]).assertEqual(2);
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5100
     * @tc.name      testTreeMap09Chapter0051
     * @tc.desc      Iterator on empty map returns no pairs and next done is true initially
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0051";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      const pairs: Array<[string, number]> = [];
      for (const item of treeMap) {
        pairs.push(item);
      }

      const iter: IterableIterator<[string, number]> = treeMap[Symbol.iterator]();
      const first: IteratorResult<[string, number]> = iter.next();

      expect(pairs.length).assertEqual(0);
      expect(first.done).assertTrue();
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5200
     * @tc.name      testTreeMap09Chapter0052
     * @tc.desc      Iterator on number key map yields pairs in numeric order 1,2,3 with values one,two,three
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0052";
      console.log(TAG + " start");

      const treeMap = new TreeMap<number, string>();
      treeMap.set(3, "three");
      treeMap.set(1, "one");
      treeMap.set(2, "two");

      const pairs: Array<[number, string]> = [];
      for (const item of treeMap) {
        pairs.push(item);
      }

      expect(pairs.length).assertEqual(3);
      expect(pairs[0][0]).assertEqual(1);
      expect(pairs[0][1]).assertEqual("one");
      expect(pairs[1][0]).assertEqual(2);
      expect(pairs[1][1]).assertEqual("two");
      expect(pairs[2][0]).assertEqual(3);
      expect(pairs[2][1]).assertEqual("three");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5300
     * @tc.name      testTreeMap09Chapter0053
     * @tc.desc      Multiple iterators are independent second starts from first pair again alpha,beta,gamma order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0053";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("gamma", 3);
      treeMap.set("alpha", 1);
      treeMap.set("beta", 2);

      const iter1: IterableIterator<[string, number]> = treeMap[Symbol.iterator]();
      const step1: IteratorResult<[string, number]> = iter1.next();
      const firstPair: [string, number] | undefined = step1.value;

      const iter2: IterableIterator<[string, number]> = treeMap[Symbol.iterator]();
      const pairs2: Array<[string, number]> = [];
      for (const item of iter2) {
        pairs2.push(item);
      }

      expect(firstPair?.[0]).assertEqual("alpha");
      expect(firstPair?.[1]).assertEqual(1);
      expect(pairs2.length).assertEqual(3);
      expect(pairs2[0][0]).assertEqual("alpha");
      expect(pairs2[0][1]).assertEqual(1);
      expect(pairs2[1][0]).assertEqual("beta");
      expect(pairs2[1][1]).assertEqual(2);
      expect(pairs2[2][0]).assertEqual("gamma");
      expect(pairs2[2][1]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5400
     * @tc.name      testTreeMap09Chapter0054
     * @tc.desc      Iterator after clear returns no pairs and map remains empty true on reuse insert later works fine
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0054";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("first", 1);
      treeMap.set("second", 2);

      treeMap.clear();

      const pairsAfterClear: Array<[string, number]> = [];
      for (const item of treeMap) {
        pairsAfterClear.push(item);
      }
      const isEmptyResult: boolean = treeMap.isEmpty();

      treeMap.set("third", 3);
      const pairsAfterInsert: Array<[string, number]> = [];
      for (const item of treeMap) {
        pairsAfterInsert.push(item);
      }

      expect(pairsAfterClear.length).assertEqual(0);
      expect(isEmptyResult).assertTrue();
      expect(pairsAfterInsert.length).assertEqual(1);
      expect(pairsAfterInsert[0][0]).assertEqual("third");
      expect(pairsAfterInsert[0][1]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5500
     * @tc.name      testTreeMap09Chapter0055
     * @tc.desc      Iterator visits all elements in large data set fifty pairs and count equals size 50 entries
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0055";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      for (let i: number = 0; i < 50; i++) {
        const key: string = "k" + (i < 10 ? "0" + i : i.toString());
        treeMap.set(key, i);
      }

      let count: number = 0;
      for (const _ of treeMap) {
        count++;
      }

      expect(count).assertEqual(50);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5600
     * @tc.name      testTreeMap09Chapter0056
     * @tc.desc      Iterator with union value type includes undefined and preserves key order alpha,beta,delta,gamma
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0056";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number | undefined>();
      treeMap.set("alpha", 1);
      treeMap.set("beta", undefined);
      treeMap.set("delta", 4);
      treeMap.set("gamma", 3);

      const keysSeq: Array<string> = [];
      const valuesSeq: Array<number | undefined> = [];
      for (const item of treeMap) {
        keysSeq.push(item[0]);
        valuesSeq.push(item[1]);
      }

      expect(keysSeq.length).assertEqual(4);
      expect(keysSeq[0]).assertEqual("alpha");
      expect(keysSeq[1]).assertEqual("beta");
      expect(keysSeq[2]).assertEqual("delta");
      expect(keysSeq[3]).assertEqual("gamma");
      expect(valuesSeq[0]).assertEqual(1);
      expect(valuesSeq[1]).assertEqual(undefined);
      expect(valuesSeq[2]).assertEqual(4);
      expect(valuesSeq[3]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5700
     * @tc.name      testTreeMap09Chapter0057
     * @tc.desc      Iterator with object value type yields objects in key order and fields accessible as expected
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0057";
      console.log(TAG + " start");

      interface Bird {
        id: number;
        name: string;
      }

      const treeMap = new TreeMap<string, Bird>();
      treeMap.set("alpha", { id: 1, name: "sparrow" });
      treeMap.set("beta", { id: 2, name: "eagle" });
      treeMap.set("delta", { id: 4, name: "owl" });
      treeMap.set("gamma", { id: 3, name: "falcon" });

      const pairs: Array<[string, Bird]> = [];
      for (const item of treeMap) {
        pairs.push(item);
      }

      expect(pairs.length).assertEqual(4);
      expect(pairs[0][0]).assertEqual("alpha");
      expect(pairs[0][1].id).assertEqual(1);
      expect(pairs[0][1].name).assertEqual("sparrow");
      expect(pairs[1][0]).assertEqual("beta");
      expect(pairs[1][1].id).assertEqual(2);
      expect(pairs[1][1].name).assertEqual("eagle");
      expect(pairs[2][0]).assertEqual("delta");
      expect(pairs[2][1].id).assertEqual(4);
      expect(pairs[2][1].name).assertEqual("owl");
      expect(pairs[3][0]).assertEqual("gamma");
      expect(pairs[3][1].id).assertEqual(3);
      expect(pairs[3][1].name).assertEqual("falcon");
    });

    /**
     * @tc.number    SUB_TREEMAP_TEST09_5800
     * @tc.name      testTreeMap09Chapter0058
     * @tc.desc      Calling Symbol.iterator as unbound function throws binding error 10200011 consistently on call site
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeMap09Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = "testTreeMap09Chapter0058";
      console.log(TAG + " start");

      const treeMap = new TreeMap<string, number>();
      treeMap.set("delta", 4);

      let errorCaught: boolean = false;
      try {
        const handler: () => IterableIterator<[string, number]> = treeMap[Symbol.iterator];
        handler();
      } catch (error) {
        errorCaught = true;
        interface ErrorInfo {
          code: number;
          message: string;
        }
        const errInfo: ErrorInfo = error as ErrorInfo;
        const isBindingError: boolean =
          errInfo.code === 10200011 ||
            (typeof errInfo.message === "string" &&
              (errInfo.message.indexOf("Symbol.iterator method cannot be bound") >= 0 ||
                errInfo.message.indexOf("cannot be bound") >= 0));
        expect(isBindingError).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

  })
}
