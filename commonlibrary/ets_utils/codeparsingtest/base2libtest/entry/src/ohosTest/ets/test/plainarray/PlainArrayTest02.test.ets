import { PlainArray } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

interface GeneratedObjectLiteralInterface_1 {
  a: number;
  b: string;
}

interface GeneratedTypeLiteralInterface_1 {
  a: number;
  b: string;
}

interface GeneratedObjectLiteralInterface_2 {
  c: number;
}

interface GeneratedObjectLiteralInterface_3 {
  a: number;
  b: GeneratedObjectLiteralInterface_2;
}

interface GeneratedTypeLiteralInterface_3 {
  c: number;
}

interface GeneratedTypeLiteralInterface_2 {
  a: number;
  b: GeneratedTypeLiteralInterface_3;
}

interface GeneratedTypeLiteralInterface_4 {
  a: number;
}

interface GeneratedObjectLiteralInterface_4 {
  a: undefined;
  b: number;
}

interface GeneratedTypeLiteralInterface_5 {
  a: undefined;
  b: number;
}

interface GeneratedObjectLiteralInterface_5 {
  a: null;
  b: number;
}

interface GeneratedTypeLiteralInterface_6 {
  a: null;
  b: number;
}

interface GeneratedObjectLiteralInterface_6 {}

interface GeneratedObjectLiteralInterface_7 {
  a: number;
}

interface GeneratedTypeLiteralInterface_10 {
  a: number;
}

interface GeneratedTypeLiteralInterface_9 {
  a: number;
}

interface GeneratedTypeLiteralInterface_7 {
  data: Map<number, number>;
}

interface GeneratedTypeLiteralInterface_8 {
  data: Map<number, number>;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function PlainArray02Test() {
  describe('PlainArray02Test', () => {
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
     * @tc.number    SUB_PLAINARRAY_TEST02_0100
     * @tc.name      testPlainArray02Chapter0001
     * @tc.desc      Get index with key zero executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0001';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0, "zero");
      const result: number = arr.getIndexOfKey(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_0200
     * @tc.name      testPlainArray02Chapter0002
     * @tc.desc      Get index with NaN key throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0002';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let thrown: boolean = false;
      try {
        arr.getIndexOfKey(NaN);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_0300
     * @tc.name      testPlainArray02Chapter0003
     * @tc.desc      Get index with minus zero executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0003';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(-0, "minusZero");
      const result: number = arr.getIndexOfKey(-0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_0400
     * @tc.name      testPlainArray02Chapter0004
     * @tc.desc      Get index with Infinity key throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0004';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let thrown: boolean = false;
      try {
        arr.getIndexOfKey(Infinity);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_0500
     * @tc.name      testPlainArray02Chapter0005
     * @tc.desc      Get index with negative Infinity key throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0005';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let thrown: boolean = false;
      try {
        arr.getIndexOfKey(-Infinity);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_0600
     * @tc.name      testPlainArray02Chapter0006
     * @tc.desc      Get index with double value executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0006';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      const key: number = Math.floor(1.5);
      arr.add(key, "double");
      const result: number = arr.getIndexOfKey(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_0700
     * @tc.name      testPlainArray02Chapter0007
     * @tc.desc      Get index with Number MIN_VALUE executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0007';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let errorCaught: boolean = false;
      try {
        arr.add(Number.MIN_VALUE, 1);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_0800
     * @tc.name      testPlainArray02Chapter0008
     * @tc.desc      Get index with Number EPSILON executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0008';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let errorCaught: boolean = false;
      try {
        arr.add(Number.EPSILON, 1);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_0900
     * @tc.name      testPlainArray02Chapter0009
     * @tc.desc      Get index with byte boundary executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0009';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(127, "byte");
      const result: number = arr.getIndexOfKey(127);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1000
     * @tc.name      testPlainArray02Chapter0010
     * @tc.desc      Get index with int32 max boundary executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0010';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      const key: number = 2147483647;
      arr.add(key, "intMax");
      const result: number = arr.getIndexOfKey(key);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1100
     * @tc.name      testPlainArray02Chapter0011
     * @tc.desc      Get index with hex number executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0011';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(0x0102, 1);
      const result: number = arr.getIndexOfKey(258);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1200
     * @tc.name      testPlainArray02Chapter0012
     * @tc.desc      Get index with power operator executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0012';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(2**3, "power");
      const result: number = arr.getIndexOfKey(8);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1300
     * @tc.name      testPlainArray02Chapter0013
     * @tc.desc      Get index with scientific notation executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0013';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(1e3, 1);
      const result: number = arr.getIndexOfKey(1000);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1400
     * @tc.name      testPlainArray02Chapter0014
     * @tc.desc      Get index with Number MAX_VALUE executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0014';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let errorCaught: boolean = false;
      try {
        arr.add(Number.MAX_VALUE, 1);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1500
     * @tc.name      testPlainArray02Chapter0015
     * @tc.desc      Get index with Number MAX_SAFE_INTEGER executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0015';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      const key: number = Number.MAX_SAFE_INTEGER;
      let errorCaught: boolean = false;
      try {
        arr.add(key, "safeInt");
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1600
     * @tc.name      testPlainArray02Chapter0016
     * @tc.desc      Get index with short minimum boundary executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0016';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      arr.add(-32768, 1);
      const result: number = arr.getIndexOfKey(-32768);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1700
     * @tc.name      testPlainArray02Chapter0017
     * @tc.desc      Get index with int32 minimum boundary executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0017';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      const key: number = -2147483648;
      arr.add(key, "intMin");
      const result: number = arr.getIndexOfKey(key);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1800
     * @tc.name      testPlainArray02Chapter0018
     * @tc.desc      Get index with key greater than int32 max throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0018';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let thrown: boolean = false;
      try {
        arr.getIndexOfKey(2147483648);
      } catch (e) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_1900
     * @tc.name      testPlainArray02Chapter0019
     * @tc.desc      Get index with long value executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0019';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      const key: number = 9223372036854775807;
      let errorCaught: boolean = false;
      try {
        arr.add(key, "long");
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2000
     * @tc.name      testPlainArray02Chapter0020
     * @tc.desc      Get index with negative double boundary executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0020';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      const key: number = -1.7976931348623157e+308;
      let errorCaught: boolean = false;
      try {
        arr.add(key, 1);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2100
     * @tc.name      testPlainArray02Chapter0021
     * @tc.desc      Get index with char range value executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0021';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(65535, "char");
      const result: number = arr.getIndexOfKey(65535);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2200
     * @tc.name      testPlainArray02Chapter0022
     * @tc.desc      Get index with normal double value executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0022';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let errorCaught: boolean = false;
      try {
        arr.add(-2147483649, 1);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2300
     * @tc.name      testPlainArray02Chapter0023
     * @tc.desc      Get index with float hex value executes normally
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0023';
      console.log(TAG + ' start');
      const arr: PlainArray<number> = new PlainArray<number>();
      let errorCaught: boolean = false;
      try {
        arr.add(2147483648, 1);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2400
     * @tc.name      testPlainArray02Chapter0024
     * @tc.desc      getIndexOfValue with normal array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0024';
      console.log(TAG + ' start');
      const arr: number[] = [1, 2, 3];
      const plainArray = new PlainArray<number[]>();
      plainArray.add(0, arr);
      const result = plainArray.getIndexOfValue(arr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2500
     * @tc.name      testPlainArray02Chapter0025
     * @tc.desc      getIndexOfValue with empty array value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0025';
      console.log(TAG + ' start');
      const arr: number[] = [];
      const plainArray = new PlainArray<number[]>();
      plainArray.add(1, arr);
      const result = plainArray.getIndexOfValue(arr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2600
     * @tc.name      testPlainArray02Chapter0026
     * @tc.desc      getIndexOfValue with array not found
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0026';
      console.log(TAG + ' start');
      const plainArray = new PlainArray<number[]>();
      plainArray.add(1, [1, 2]);
      const result = plainArray.getIndexOfValue([1, 2]);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2700
     * @tc.name      testPlainArray02Chapter0027
     * @tc.desc      getIndexOfValue with Map value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0027';
      console.log(TAG + ' start');
      const map = new Map<string, number>();
      map.set("a", 1);
      const plainArray = new PlainArray<Map<string, number>>();
      plainArray.add(0, map);
      const result = plainArray.getIndexOfValue(map);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2800
     * @tc.name      testPlainArray02Chapter0028
     * @tc.desc      getIndexOfValue with different Map instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0028';
      console.log(TAG + ' start');
      const map1 = new Map<string, number>();
      map1.set("a", 1);
      const map2 = new Map<string, number>();
      map2.set("a", 1);
      const plainArray = new PlainArray<Map<string, number>>();
      plainArray.add(0, map1);
      const result = plainArray.getIndexOfValue(map2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_2900
     * @tc.name      testPlainArray02Chapter0029
     * @tc.desc      getIndexOfValue with Set value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0029';
      console.log(TAG + ' start');
      const set = new Set<number>();
      set.add(1);
      set.add(2);
      const plainArray = new PlainArray<Set<number>>();
      plainArray.add(5, set);
      const result = plainArray.getIndexOfValue(set);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3000
     * @tc.name      testPlainArray02Chapter0030
     * @tc.desc      getIndexOfValue with empty Set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0030';
      console.log(TAG + ' start');
      const set = new Set<number>();
      const plainArray = new PlainArray<Set<number>>();
      plainArray.add(1, set);
      const result = plainArray.getIndexOfValue(set);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3100
     * @tc.name      testPlainArray02Chapter0031
     * @tc.desc      getIndexOfValue with Promise value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0031';
      console.log(TAG + ' start');
      const promise = new Promise<number>((resolve) => {
        resolve(1);
      });
      const plainArray = new PlainArray<Promise<number>>();
      plainArray.add(0, promise);
      const result = plainArray.getIndexOfValue(promise);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3200
     * @tc.name      testPlainArray02Chapter0032
     * @tc.desc      getIndexOfValue with different Promise instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0032';
      console.log(TAG + ' start');
      const promise1 = new Promise<number>((resolve) => {
        resolve(1);
      });
      const promise2 = new Promise<number>((resolve) => {
        resolve(1);
      });
      const plainArray = new PlainArray<Promise<number>>();
      plainArray.add(0, promise1);
      const result = plainArray.getIndexOfValue(promise2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3300
     * @tc.name      testPlainArray02Chapter0033
     * @tc.desc      getIndexOfValue with undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0033';
      console.log(TAG + ' start');
      const plainArray = new PlainArray<undefined>();
      plainArray.add(0, undefined);
      const result = plainArray.getIndexOfValue(undefined);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3400
     * @tc.name      testPlainArray02Chapter0034
     * @tc.desc      getIndexOfValue called unbound
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0034';
      console.log(TAG + ' start');
      let errorCaught: boolean = false;
      try {
        const func = (new PlainArray<number>()).getIndexOfValue;
        func(1);
      } catch (err) {
        errorCaught = true;
        expect(err !== null).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });


    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3500
     * @tc.name      testPlainArray02Chapter0035
     * @tc.desc      getIndexOfValue with normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0035';
      console.log(TAG + ' start');
      const obj: GeneratedObjectLiteralInterface_1 = { a: 1, b: "test" };
      const arr = new PlainArray<GeneratedTypeLiteralInterface_1>();
      arr.add(0, obj);
      const result = arr.getIndexOfValue(obj);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3600
     * @tc.name      testPlainArray02Chapter0036
     * @tc.desc      getIndexOfValue with nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0036';
      console.log(TAG + ' start');
      const obj: GeneratedObjectLiteralInterface_3 = { a: 1, b: ({ c: 2 } as GeneratedObjectLiteralInterface_2) };
      const arr = new PlainArray<GeneratedTypeLiteralInterface_2>();
      arr.add(0, obj);
      const result = arr.getIndexOfValue(obj);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3700
     * @tc.name      testPlainArray02Chapter0037
     * @tc.desc      getIndexOfValue with different object reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0037';
      console.log(TAG + ' start');
      const arr = new PlainArray<GeneratedTypeLiteralInterface_4>();
      arr.add(0, { a: 1 });
      const result = arr.getIndexOfValue({ a: 1 });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3800
     * @tc.name      testPlainArray02Chapter0038
     * @tc.desc      getIndexOfValue with object containing undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0038';
      console.log(TAG + ' start');
      const obj: GeneratedObjectLiteralInterface_4 = { a: undefined, b: 1 };
      const arr = new PlainArray<GeneratedTypeLiteralInterface_5>();
      arr.add(0, obj);
      const result = arr.getIndexOfValue(obj);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_3900
     * @tc.name      testPlainArray02Chapter0039
     * @tc.desc      getIndexOfValue with object containing null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0039';
      console.log(TAG + ' start');
      const obj: GeneratedObjectLiteralInterface_5 = { a: null, b: 1 };
      const arr = new PlainArray<GeneratedTypeLiteralInterface_6>();
      arr.add(0, obj);
      const result = arr.getIndexOfValue(obj);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4000
     * @tc.name      testPlainArray02Chapter0040
     * @tc.desc      getIndexOfValue with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0040';
      console.log(TAG + ' start');

      const bigMap = new Map<number, number>();
      for (let i = 0; i < 1000; i++) {
        bigMap.set(i, i);
      }

      const wrapper: GeneratedTypeLiteralInterface_7 = {
        data: bigMap
      };

      const arr = new PlainArray<GeneratedTypeLiteralInterface_8>();
      arr.add(0, wrapper);

      const result = arr.getIndexOfValue(wrapper);
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4100
     * @tc.name      testPlainArray02Chapter0041
     * @tc.desc      getIndexOfValue with large object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0041';
      console.log(TAG + ' start');

      const bigMap = new Map<number, number>();
      for (let i = 0; i < 1000; i++) {
        bigMap.set(i, i);
      }

      const arr = new PlainArray<Map<number, number>>();
      arr.add(0, bigMap);

      const result = arr.getIndexOfValue(bigMap);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4200
     * @tc.name      testPlainArray02Chapter0042
     * @tc.desc      getIndexOfValue with Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0042';
      console.log(TAG + ' start');
      const ta = new Int8Array([-128, 127]);
      const arr = new PlainArray<Int8Array>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4300
     * @tc.name      testPlainArray02Chapter0043
     * @tc.desc      getIndexOfValue with Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0043';
      console.log(TAG + ' start');
      const ta = new Uint8Array([0, 255]);
      const arr = new PlainArray<Uint8Array>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4400
     * @tc.name      testPlainArray02Chapter0044
     * @tc.desc      getIndexOfValue with Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0044';
      console.log(TAG + ' start');
      const ta = new Uint8ClampedArray([-1, 256]);
      const arr = new PlainArray<Uint8ClampedArray>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4500
     * @tc.name      testPlainArray02Chapter0045
     * @tc.desc      getIndexOfValue with Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0045';
      console.log(TAG + ' start');
      const ta = new Int16Array([-32768, 32767]);
      const arr = new PlainArray<Int16Array>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4600
     * @tc.name      testPlainArray02Chapter0046
     * @tc.desc      getIndexOfValue with Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0046';
      console.log(TAG + ' start');
      const ta = new Int32Array([-2147483648, 2147483647]);
      const arr = new PlainArray<Int32Array>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4700
     * @tc.name      testPlainArray02Chapter0047
     * @tc.desc      getIndexOfValue with Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0047';
      console.log(TAG + ' start');
      const ta = new Float32Array([Infinity, -Infinity, NaN]);
      const arr = new PlainArray<Float32Array>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4800
     * @tc.name      testPlainArray02Chapter0048
     * @tc.desc      getIndexOfValue with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0048';
      console.log(TAG + ' start');
      const ta = new Float64Array([Number.MIN_VALUE, Number.MAX_VALUE]);
      const arr = new PlainArray<Float64Array>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_4900
     * @tc.name      testPlainArray02Chapter0049
     * @tc.desc      getIndexOfValue with BigInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0049';
      console.log(TAG + ' start');
      const ta = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      const arr = new PlainArray<BigInt64Array>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5000
     * @tc.name      testPlainArray02Chapter0050
     * @tc.desc      getIndexOfValue with BigUint64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0050';
      console.log(TAG + ' start');
      const ta = new BigUint64Array([0n, 18446744073709551615n]);
      const arr = new PlainArray<BigUint64Array>();
      arr.add(0, ta);
      const result = arr.getIndexOfValue(ta);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5100
     * @tc.name      testPlainArray02Chapter0051
     * @tc.desc      getIndexOfValue with different TypedArray instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0051';
      console.log(TAG + ' start');
      const arr = new PlainArray<Int8Array>();
      arr.add(0, new Int8Array([1, 2]));
      const result = arr.getIndexOfValue(new Int8Array([1, 2]));
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5200
     * @tc.name      testPlainArray02Chapter0052
     * @tc.desc      getIndexOfValue with normal string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0052';
      console.log(TAG + ' start');
      const arr = new PlainArray<string>();
      arr.add(0, "hello");
      const result = arr.getIndexOfValue("hello");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5300
     * @tc.name      testPlainArray02Chapter0053
     * @tc.desc      getIndexOfValue with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0053';
      console.log(TAG + ' start');
      const arr = new PlainArray<string>();
      arr.add(0, "");
      const result = arr.getIndexOfValue("");
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5400
     * @tc.name      testPlainArray02Chapter0054
     * @tc.desc      getIndexOfValue with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0054';
      console.log(TAG + ' start');
      const value = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const arr = new PlainArray<string>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5500
     * @tc.name      testPlainArray02Chapter0055
     * @tc.desc      getIndexOfValue with ASCII full range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0055';
      console.log(TAG + ' start');
      const value = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
      const arr = new PlainArray<string>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5600
     * @tc.name      testPlainArray02Chapter0056
     * @tc.desc      getIndexOfValue with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0056';
      console.log(TAG + ' start');
      const value = "\n\r\t\b\f\\\'\"";
      const arr = new PlainArray<string>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5700
     * @tc.name      testPlainArray02Chapter0057
     * @tc.desc      getIndexOfValue with emoji string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0057';
      console.log(TAG + ' start');
      const value = "😀🐶🚀";
      const arr = new PlainArray<string>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5800
     * @tc.name      testPlainArray02Chapter0058
     * @tc.desc      getIndexOfValue with large string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0058';
      console.log(TAG + ' start');
      const value = "a".repeat(10000);
      const arr = new PlainArray<string>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_5900
     * @tc.name      testPlainArray02Chapter0059
     * @tc.desc      getIndexOfValue with zero
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0059';
      console.log(TAG + ' start');
      const arr = new PlainArray<number>();
      arr.add(0, 0);
      const result = arr.getIndexOfValue(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6000
     * @tc.name      testPlainArray02Chapter0060
     * @tc.desc      getIndexOfValue with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0060';
      console.log(TAG + ' start');
      const arr = new PlainArray<number>();
      arr.add(0, NaN);
      const result = arr.getIndexOfValue(NaN);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6100
     * @tc.name      testPlainArray02Chapter0061
     * @tc.desc      getIndexOfValue with Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0061';
      console.log(TAG + ' start');
      const arr = new PlainArray<number>();
      arr.add(0, Infinity);
      const result = arr.getIndexOfValue(Infinity);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6200
     * @tc.name      testPlainArray02Chapter0062
     * @tc.desc      getIndexOfValue with negative Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0062';
      console.log(TAG + ' start');
      const arr = new PlainArray<number>();
      arr.add(0, -Infinity);
      const result = arr.getIndexOfValue(-Infinity);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6300
     * @tc.name      testPlainArray02Chapter0063
     * @tc.desc      getIndexOfValue with MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0063';
      console.log(TAG + ' start');
      const arr = new PlainArray<number>();
      arr.add(0, Number.MAX_VALUE);
      const result = arr.getIndexOfValue(Number.MAX_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6400
     * @tc.name      testPlainArray02Chapter0064
     * @tc.desc      getIndexOfValue with MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0064';
      console.log(TAG + ' start');
      const arr = new PlainArray<number>();
      arr.add(0, Number.MIN_VALUE);
      const result = arr.getIndexOfValue(Number.MIN_VALUE);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6500
     * @tc.name      testPlainArray02Chapter0065
     * @tc.desc      getIndexOfValue with hex number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0065';
      console.log(TAG + ' start');
      const arr = new PlainArray<number>();
      arr.add(0, 0x0102);
      const result = arr.getIndexOfValue(258);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6600
     * @tc.name      testPlainArray02Chapter0066
     * @tc.desc      getIndexOfValue with scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0066';
      console.log(TAG + ' start');
      const arr = new PlainArray<number>();
      arr.add(0, 1e3);
      const result = arr.getIndexOfValue(1000);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6700
     * @tc.name      testPlainArray02Chapter0067
     * @tc.desc      getIndexOfValue with true value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0067';
      console.log(TAG + ' start');
      const arr = new PlainArray<boolean>();
      arr.add(0, true);
      const result = arr.getIndexOfValue(true);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6800
     * @tc.name      testPlainArray02Chapter0068
     * @tc.desc      getIndexOfValue with false value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0068';
      console.log(TAG + ' start');
      const arr = new PlainArray<boolean>();
      arr.add(0, false);
      const result = arr.getIndexOfValue(false);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_6900
     * @tc.name      testPlainArray02Chapter0069
     * @tc.desc      getIndexOfValue with same array reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0069';
      console.log(TAG + ' start');
      const value: number[] = [1, 2, 3];
      const arr = new PlainArray<number[]>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7000
     * @tc.name      testPlainArray02Chapter0070
     * @tc.desc      getIndexOfValue with different array reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0070';
      console.log(TAG + ' start');
      const arr = new PlainArray<number[]>();
      arr.add(0, [1, 2, 3]);
      const result = arr.getIndexOfValue([1, 2, 3]);
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7100
     * @tc.name      testPlainArray02Chapter0071
     * @tc.desc      getIndexOfValue with same object reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0071';
      console.log(TAG + ' start');
      const value: GeneratedObjectLiteralInterface_7 = { a: 1 };
      const arr = new PlainArray<GeneratedTypeLiteralInterface_9>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7200
     * @tc.name      testPlainArray02Chapter0072
     * @tc.desc      getIndexOfValue with different object reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0072';
      console.log(TAG + ' start');
      const arr = new PlainArray<GeneratedTypeLiteralInterface_10>();
      arr.add(0, { a: 1 });
      const result = arr.getIndexOfValue({ a: 1 });
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7300
     * @tc.name      testPlainArray02Chapter0073
     * @tc.desc      getIndexOfValue with same TypedArray reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0073';
      console.log(TAG + ' start');
      const value = new Uint8Array([1, 2, 3]);
      const arr = new PlainArray<Uint8Array>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7400
     * @tc.name      testPlainArray02Chapter0074
     * @tc.desc      getIndexOfValue with different TypedArray reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0074';
      console.log(TAG + ' start');
      const arr = new PlainArray<Uint8Array>();
      arr.add(0, new Uint8Array([1, 2, 3]));
      const result = arr.getIndexOfValue(new Uint8Array([1, 2, 3]));
      expect(result).assertEqual(-1);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7500
     * @tc.name      testPlainArray02Chapter0075
     * @tc.desc      getIndexOfValue with Map reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0075';
      console.log(TAG + ' start');
      const value = new Map<string, number>([['a', 1]]);
      const arr = new PlainArray<Map<string, number>>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7600
     * @tc.name      testPlainArray02Chapter0076
     * @tc.desc      getIndexOfValue with Set reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0076';
      console.log(TAG + ' start');
      const value = new Set<number>([1, 2, 3]);
      const arr = new PlainArray<Set<number>>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7700
     * @tc.name      testPlainArray02Chapter0077
     * @tc.desc      getIndexOfValue with Promise reference
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0077';
      console.log(TAG + ' start');
      const value = Promise.resolve(1);
      const arr = new PlainArray<Promise<number>>();
      arr.add(0, value);
      const result = arr.getIndexOfValue(value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7800
     * @tc.name      testPlainArray02Chapter0078
     * @tc.desc      Get key at index zero executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0078';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(0);
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_7900
     * @tc.name      testPlainArray02Chapter0079
     * @tc.desc      Get key at index double literal executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0079';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      let errorCaught: boolean = false;
      try {
        arr.add(123.456, "v");
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });


    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8000
     * @tc.name      testPlainArray02Chapter0080
     * @tc.desc      Get key at index NaN returns -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0080';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(1, "v");
      let errorCaught: boolean = false;
      try {
        const result = arr.getKeyAt(NaN);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8100
     * @tc.name      testPlainArray02Chapter0081
     * @tc.desc      Get key at index minus zero executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0081';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(-0, "v");
      const result = arr.getKeyAt(-0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8200
     * @tc.name      testPlainArray02Chapter0082
     * @tc.desc      Get key at index Infinity returns -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0082';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0, "v");
      let errorCaught: boolean = false;
      try {
        const result = arr.getKeyAt(Infinity);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8300
     * @tc.name      testPlainArray02Chapter0083
     * @tc.desc      Get key at index negative Infinity returns -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0083';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0, "v");
      let errorCaught: boolean = false;
      try {
        const result = arr.getKeyAt(-Infinity);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8400
     * @tc.name      testPlainArray02Chapter0084
     * @tc.desc      Get key at index Math.floor double executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0084';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(1, "v");
      const result = arr.getKeyAt(Math.floor(0.5));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8500
     * @tc.name      testPlainArray02Chapter0085
     * @tc.desc      Get key at index Number MAX_VALUE returns -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0085';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0, "v");
      let errorCaught: boolean = false;
      try {
        const result = arr.getKeyAt(Number.MAX_VALUE);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8600
     * @tc.name      testPlainArray02Chapter0086
     * @tc.desc      Get key at index Number MIN_VALUE returns -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0086';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0, "v");
      let errorCaught: boolean = false;
      try {
        const result = arr.getKeyAt(Number.MIN_VALUE);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8700
     * @tc.name      testPlainArray02Chapter0087
     * @tc.desc      Get key at index Number EPSILON returns -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0087';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0, "v");
      let errorCaught: boolean = false;
      try {
        const result = arr.getKeyAt(Number.EPSILON);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8800
     * @tc.name      testPlainArray02Chapter0088
     * @tc.desc      Get key at index MAX_SAFE_INTEGER returns -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0088';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0, "v");
      let errorCaught: boolean = false;
      try {
        const result = arr.getKeyAt(Number.MAX_SAFE_INTEGER);
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_8900
     * @tc.name      testPlainArray02Chapter0089
     * @tc.desc      Get key at index byte max executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0089';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(127, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_9000
     * @tc.name      testPlainArray02Chapter0090
     * @tc.desc      Get key at index short min executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0090';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(-32768, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_9100
     * @tc.name      testPlainArray02Chapter0091
     * @tc.desc      Get key at index int32 min executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0091';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(-2147483648, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_9200
     * @tc.name      testPlainArray02Chapter0092
     * @tc.desc      Get key at index int32 max executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0092';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(2147483647, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_9300
     * @tc.name      testPlainArray02Chapter0093
     * @tc.desc      Get key at index hex value executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0093';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0x0102, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(258);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_9400
     * @tc.name      testPlainArray02Chapter0094
     * @tc.desc      Get key at index octal executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0094';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(0o3, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_9500
     * @tc.name      testPlainArray02Chapter0095
     * @tc.desc      Get key at index power operator executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0095';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(2**3, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST02_9600
     * @tc.name      testPlainArray02Chapter0096
     * @tc.desc      Get key at index scientific notation executes
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testPlainArray02Chapter0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray02Chapter0096';
      console.log(TAG + ' start');
      const arr: PlainArray<string> = new PlainArray<string>();
      arr.add(1e3, "v");
      const result = arr.getKeyAt(0);
      expect(result).assertEqual(1000);
    });

  });
}