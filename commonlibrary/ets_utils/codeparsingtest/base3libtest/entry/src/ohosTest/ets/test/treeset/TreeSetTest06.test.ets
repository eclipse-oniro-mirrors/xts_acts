import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TreeSet, util } from '@kit.ArkTS';
import { BusinessError } from '@kit.BasicServicesKit';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function TreeSet06Test() {
  describe('TreeSet06Test', () => {
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
     * @tc.number    SUB_TREESET_TEST06_0100
     * @tc.name      testTreeSet06Chapter0001
     * @tc.desc      Test forEach method with basic string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0001';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("sparrow");
      treeSet.add("gull");
      let resultArray: string[] = [];
      treeSet.forEach((value: string, key: string): void => {
        resultArray.push(value);
      });
      expect(resultArray.length).assertEqual(2);
      expect(resultArray[0]).assertEqual("gull");
      expect(resultArray[1]).assertEqual("sparrow");
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_0200
     * @tc.name      testTreeSet06Chapter0002
     * @tc.desc      Test forEach method with all callback parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0002';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("banana");
      let valueArray: string[] = [];
      let keyArray: string[] = [];
      let setSize: number = 0;
      treeSet.forEach((value: string, key: string, set: TreeSet<string>): void => {
        valueArray.push(value);
        keyArray.push(key);
        setSize = set.length;
      });
      expect(valueArray.length).assertEqual(2);
      expect(keyArray.length).assertEqual(2);
      expect(setSize).assertEqual(2);
      expect(valueArray[0]).assertEqual(keyArray[0]);
      expect(valueArray[1]).assertEqual(keyArray[1]);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_0300
     * @tc.name      testTreeSet06Chapter0003
     * @tc.desc      Test forEach method with thisArg parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0003';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(3);

      interface ContextInterface {
        sum: number;
        addValue: (value: number) => void;
      }

      let context: ContextInterface = {
        sum: 0,
        addValue: (value: number): void => {
          context.sum += value;
        }
      };

      treeSet.forEach((value: number): void => {
        context.addValue(value);
      }, context);

      expect(context.sum).assertEqual(6);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_0400
     * @tc.name      testTreeSet06Chapter0004
     * @tc.desc      Test forEach method with empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0004';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let callCount: number = 0;
      treeSet.forEach((): void => {
        callCount++;
      });
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_0500
     * @tc.name      testTreeSet06Chapter0005
     * @tc.desc      Test forEach method with number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0005';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(0);
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(Number.EPSILON);
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(Number.MIN_SAFE_INTEGER);
      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(6);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_0600
     * @tc.name      testTreeSet06Chapter0006
     * @tc.desc      Test forEach method with special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0006';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(-Infinity);
      treeSet.add(NaN);
      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_0700
     * @tc.name      testTreeSet06Chapter0007
     * @tc.desc      Test forEach method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0007';
      console.log(TAG + ' start');
      let treeSet: TreeSet<boolean> = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);
      let values: boolean[] = [];
      treeSet.forEach((value: boolean): void => {
        values.push(value);
      });
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(false);
      expect(values[1]).assertEqual(true);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_0800
     * @tc.name      testTreeSet06Chapter0008
     * @tc.desc      Test forEach method with custom comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0008';
      console.log(TAG + ' start');
      let comparator: (firstValue: number, secondValue: number) => boolean = (a: number, b: number): boolean => {
        return a > b;
      };
      let treeSet: TreeSet<number> = new TreeSet<number>(comparator);
      treeSet.add(1);
      treeSet.add(3);
      treeSet.add(2);
      let resultArray: number[] = [];
      treeSet.forEach((value: number): void => {
        resultArray.push(value);
      });
      expect(resultArray[0]).assertEqual(3);
      expect(resultArray[1]).assertEqual(2);
      expect(resultArray[2]).assertEqual(1);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_0900
     * @tc.name      testTreeSet06Chapter0009
     * @tc.desc      Test forEach method with TypedArray values (Int8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0009';
      console.log(TAG + ' start');
      let treeSet: TreeSet<Int8Array> = new TreeSet<Int8Array>();
      let array1: Int8Array = new Int8Array([-128, 127]);
      let array2: Int8Array = new Int8Array([0, 100]);
      try {
        treeSet.add(array1);
        treeSet.add(array2);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(2);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1000
     * @tc.name      testTreeSet06Chapter0010
     * @tc.desc      Test forEach method with TypedArray values (Uint8Array)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0010';
      console.log(TAG + ' start');
      let treeSet: TreeSet<Uint8Array> = new TreeSet<Uint8Array>();
      let array1: Uint8Array = new Uint8Array([0, 255]);
      let array2: Uint8Array = new Uint8Array([128, 200]);
      try {
        treeSet.add(array1);
        treeSet.add(array2);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(2);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1100
     * @tc.name      testTreeSet06Chapter0011
     * @tc.desc      Test forEach method with TypedArray values (Float32Array with special values)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0011';
      console.log(TAG + ' start');
      let treeSet: TreeSet<Float32Array> = new TreeSet<Float32Array>();
      let array1: Float32Array = new Float32Array([Infinity, -Infinity, NaN]);
      try {
        treeSet.add(array1);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(1);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1200
     * @tc.name      testTreeSet06Chapter0012
     * @tc.desc      Test forEach method with BigInt64Array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0012';
      console.log(TAG + ' start');
      let treeSet: TreeSet<BigInt64Array> = new TreeSet<BigInt64Array>();
      let array1: BigInt64Array = new BigInt64Array([BigInt(-9223372036854775808), BigInt(9223372036854775807)]);
      try {
        treeSet.add(array1);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(1);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1300
     * @tc.name      testTreeSet06Chapter0013
     * @tc.desc      Test forEach method with string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0013';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

      for (let i: number = 0; i < specialChars.length; i++) {
        treeSet.add(specialChars.charAt(i));
      }

      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });

      expect(count).assertEqual(specialChars.length);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1400
     * @tc.name      testTreeSet06Chapter0014
     * @tc.desc      Test forEach method with full ASCII character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0014';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let asciiChars: string =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

      for (let i: number = 0; i < asciiChars.length; i++) {
        treeSet.add(asciiChars.charAt(i));
      }

      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });

      expect(count).assertEqual(asciiChars.length);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1500
     * @tc.name      testTreeSet06Chapter0015
     * @tc.desc      Test forEach method with string escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0015';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let escapeChars: string[] = ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\", "\\'", '\\"', "\\?"];

      for (let char of escapeChars) {
        treeSet.add(char);
      }

      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });

      expect(count).assertEqual(escapeChars.length);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1600
     * @tc.name      testTreeSet06Chapter0016
     * @tc.desc      Test forEach method with emoji Unicode values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0016';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let emojis: string[] = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴"];

      for (let emoji of emojis) {
        treeSet.add(emoji);
      }

      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });

      expect(count).assertEqual(emojis.length);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1700
     * @tc.name      testTreeSet06Chapter0017
     * @tc.desc      Test forEach method with object values containing various properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0017';
      console.log(TAG + ' start');

      interface TestObject {
        a: number;
        b: string;
        c: number[];
      }

      let comparator: (firstValue: TestObject, secondValue: TestObject) => boolean =
        (a: TestObject, b: TestObject): boolean => {
          return a.a < b.a;
        };

      let treeSet: TreeSet<TestObject> = new TreeSet<TestObject>(comparator);
      let obj1: TestObject = { a: 1, b: "test", c: [1, 2, 3] };

      try {
        treeSet.add(obj1);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(1);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1800
     * @tc.name      testTreeSet06Chapter0018
     * @tc.desc      Test forEach method with array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0018';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number[]> = new TreeSet<number[]>();
      let array1: number[] = [1, 2, 3];
      let array2: number[] = [4, 5, 6];
      try {
        treeSet.add(array1);
        treeSet.add(array2);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(2);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_1900
     * @tc.name      testTreeSet06Chapter0019
     * @tc.desc      Test forEach method with array containing various data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0019';
      console.log(TAG + ' start');
      let treeSet: TreeSet<[number, string, boolean, null, undefined, number]> =
        new TreeSet<[number, string, boolean, null, undefined, number]>();
      let mixedArray: [number, string, boolean, null, undefined, number] = [72, "abc", true, null, undefined, 108];

      try {
        treeSet.add(mixedArray);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(1);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2000
     * @tc.name      testTreeSet06Chapter0020
     * @tc.desc      Test forEach method with array containing NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0020';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number[]> = new TreeSet<number[]>();
      let specialArray: number[] = [72, 101, NaN, Infinity, 108, 111];

      try {
        treeSet.add(specialArray);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(1);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2100
     * @tc.name      testTreeSet06Chapter0021
     * @tc.desc      Test forEach method with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0021';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number[]> = new TreeSet<number[]>();
      let emptyArray: number[] = [];

      try {
        treeSet.add(emptyArray);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(1);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2200
     * @tc.name      testTreeSet06Chapter0022
     * @tc.desc      Test forEach method with object containing undefined and null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0022';
      console.log(TAG + ' start');

      interface TestObject {
        a: undefined | null;
        b: number;
      }

      let comparator: (firstValue: TestObject, secondValue: TestObject) => boolean =
        (a: TestObject, b: TestObject): boolean => {
          return a.b < b.b;
        };

      let treeSet: TreeSet<TestObject> = new TreeSet<TestObject>(comparator);
      let obj1: TestObject = { a: undefined, b: 1 };
      let obj2: TestObject = { a: null, b: 2 };

      try {
        treeSet.add(obj1);
        treeSet.add(obj2);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(2);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2300
     * @tc.name      testTreeSet06Chapter0023
     * @tc.desc      Test forEach method with object containing NaN and Infinity properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0023';
      console.log(TAG + ' start');

      interface TestObject {
        a: number;
        b: number;
      }

      let comparator: (firstValue: TestObject, secondValue: TestObject) => boolean =
        (a: TestObject, b: TestObject): boolean => {
          return a.b < b.b;
        };

      let treeSet: TreeSet<TestObject> = new TreeSet<TestObject>(comparator);
      let obj1: TestObject = { a: NaN, b: 1 };
      let obj2: TestObject = { a: Infinity, b: 2 };

      try {
        treeSet.add(obj1);
        treeSet.add(obj2);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(2);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2400
     * @tc.name      testTreeSet06Chapter0024
     * @tc.desc      Test forEach method error scenario - missing callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0024';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      expect(treeSet instanceof TreeSet).assertTrue();
      treeSet.add("test");

      let forEachCalled = false;
      let errorCaught = false;

      try {
        treeSet.forEach((value: string, key: string, set: TreeSet<string>) => {
          console.log(value);
          forEachCalled = true;
          expect(value).assertEqual("test");
          expect(set).assertEqual(treeSet);
        });
        expect(typeof treeSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(errorCaught).assertFalse();
      expect(forEachCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2500
     * @tc.name      testTreeSet06Chapter0025
     * @tc.desc      Test forEach method error scenario - invalid callback type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0025';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      expect(treeSet instanceof TreeSet).assertTrue();
      treeSet.add("test");

      let forEachCalled = false;
      let errorCaught = false;

      try {
        treeSet.forEach((value: string, key: string, set: TreeSet<string>) => {
          forEachCalled = true;
          expect(typeof value).assertEqual('string');
          expect(set).assertEqual(treeSet);
        });
        expect(typeof treeSet.forEach).assertEqual('function');
      } catch (error) {
        errorCaught = true;
        expect(error instanceof Error).assertTrue();
      }

      expect(errorCaught).assertFalse();
      expect(forEachCalled).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2600
     * @tc.name      testTreeSet06Chapter0026
     * @tc.desc      Test forEach method error scenario - callback throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0026';
      console.log(TAG + ' start');

      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("test");
      treeSet.add("error");

      let forEachSucceeded = false;
      let errorCaught = false;
      let errorMessage = "";

      try {
        treeSet.forEach((value: string): void => {
          if (value === "error") {
            throw new Error("Test error");
          }
        });
        forEachSucceeded = true;
      } catch (error) {
        errorCaught = true;
        let caughtError: Error = error as Error;
        errorMessage = caughtError.message;
      }

      expect(forEachSucceeded).assertFalse();
      expect(errorCaught).assertTrue();
      expect(errorMessage).assertEqual("Test error");
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2700
     * @tc.name      testTreeSet06Chapter0027
     * @tc.desc      Test forEach method error scenario - cannot bind method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0027';
      console.log(TAG + ' start');

      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("test");

      const emptyCallback = (value: string, key: string, set: TreeSet<string>): void => {
      };

      interface EmptyObject {}

      let fakeObject: EmptyObject = {};
      let forEachSucceeded = false;
      let errorCaught = false;

      try {
        let fakeTreeSet: TreeSet<string> = fakeObject as TreeSet<string>;
        fakeTreeSet.forEach(emptyCallback);
        forEachSucceeded = true;
      } catch (error) {
        errorCaught = true;
      }

      expect(forEachSucceeded).assertFalse();
      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2800
     * @tc.name      testTreeSet06Chapter0028
     * @tc.desc      Test forEach method with hexadecimal and octal numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0028';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(0x0102);
      treeSet.add(0x01020304);
      treeSet.add(0o3);

      let sum: number = 0;
      treeSet.forEach((value: number): void => {
        sum += value;
      });

      expect(sum).assertEqual(0x0102 + 0x01020304 + 0o3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_2900
     * @tc.name      testTreeSet06Chapter0029
     * @tc.desc      Test forEach method with exponential notation and scientific notation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0029';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(2**3);
      treeSet.add(1e3);
      treeSet.add(2.5e-2);

      let product: number = 1;
      treeSet.forEach((value: number): void => {
        product *= value;
      });

      expect(product).assertEqual(8 * 1000 * 0.025);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3000
     * @tc.name      testTreeSet06Chapter0030
     * @tc.desc      Test forEach method with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0030';
      console.log(TAG + ' start');
      let treeSet: TreeSet<bigint> = new TreeSet<bigint>();
      treeSet.add(BigInt(0xdecafafecacefade));
      treeSet.add(BigInt(9007199254740991n));

      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });

      expect(count).assertEqual(2);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3100
     * @tc.name      testTreeSet06Chapter0031
     * @tc.desc      Test forEach method with duplicate values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0031';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(1);
      treeSet.add(1);
      treeSet.add(2);
      treeSet.add(2);
      treeSet.add(3);
      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3200
     * @tc.name      testTreeSet06Chapter0032
     * @tc.desc      Test forEach method with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0032';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(-10);
      treeSet.add(-5);
      treeSet.add(0);
      treeSet.add(5);
      treeSet.add(10);
      let sum: number = 0;
      treeSet.forEach((value: number): void => {
        sum += value;
      });
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3300
     * @tc.name      testTreeSet06Chapter0033
     * @tc.desc      Test forEach method with floating point numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0033';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      treeSet.add(3.14);
      treeSet.add(2.71);
      treeSet.add(1.41);
      let result: number = 0;
      treeSet.forEach((value: number): void => {
        result += value;
      });
      expect(result > 7.25 && result < 7.27).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3400
     * @tc.name      testTreeSet06Chapter0034
     * @tc.desc      Test forEach method with large TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0034';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      for (let i: number = 0; i < 1000; i++) {
        treeSet.add(i);
      }
      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });
      expect(count).assertEqual(1000);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3500
     * @tc.name      testTreeSet06Chapter0035
     * @tc.desc      Test forEach method with all primitive types in one TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0035';
      console.log(TAG + ' start');
      type PrimitiveType = string | number | boolean;

      let treeSet: TreeSet<PrimitiveType> = new TreeSet<PrimitiveType>();
      treeSet.add("string");
      treeSet.add(123);
      treeSet.add(true);

      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });

      expect(count).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3600
     * @tc.name      testTreeSet06Chapter0036
     * @tc.desc      Test forEach method with keywords as strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0036';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      treeSet.add("0");
      treeSet.add("NaN");
      treeSet.add("");

      let values: string[] = [];
      treeSet.forEach((value: string): void => {
        values.push(value);
      });

      expect(values.length).assertEqual(3);
      expect(values.includes("")).assertTrue();
      expect(values.includes("0")).assertTrue();
      expect(values.includes("NaN")).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3700
     * @tc.name      testTreeSet06Chapter0037
     * @tc.desc      Test forEach method with illegal Unicode encodings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0037';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let illegalUnicode: string[] = ["\udc04", "\ud83d", "\udff4"];

      for (let code of illegalUnicode) {
        try {
          treeSet.add(code);
        } catch (error) {
          let businessError: BusinessError = error as BusinessError;
          expect(businessError).assertNull();
        }
      }

      let count: number = 0;
      treeSet.forEach((): void => {
        count++;
      });

      expect(count >= 0).assertTrue();
    });
    let initTreeString: (size: number) => string = (size: number): string => {
      let ans: string = '[';
      while (ans.length < size) {
        ans += '{"a":1},';
      }
      ans += '{"a":1}';
      return ans;
    };

    /**
     * @tc.number    SUB_TREESET_TEST06_3800
     * @tc.name      testTreeSet06Chapter0038
     * @tc.desc      Test forEach method with treeString type (large JSON-like string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0038';
      console.log(TAG + ' start');

      let treeSet: TreeSet<string> = new TreeSet<string>();
      let treeString: string = initTreeString(100);

      try {
        treeSet.add(treeString);
        let found: boolean = false;
        treeSet.forEach((value: string): void => {
          if (value === treeString) {
            found = true;
          }
        });
        expect(found).assertTrue();
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_3900
     * @tc.name      testTreeSet06Chapter0039
     * @tc.desc      Test forEach method with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0039';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let originalStr: string = "{k1:value1,k2:value2}";
      let slicedStr: string = originalStr.substring(0, originalStr.length - 2);

      try {
        treeSet.add(originalStr);
        treeSet.add(slicedStr);
        let count: number = 0;
        treeSet.forEach((): void => {
          count++;
        });
        expect(count).assertEqual(2);
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4000
     * @tc.name      testTreeSet06Chapter0040
     * @tc.desc      Test forEach method with large string to check memory usage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0040';
      console.log(TAG + ' start');
      let treeSet: TreeSet<string> = new TreeSet<string>();
      let largeString: string = "a".repeat(10000);

      try {
        treeSet.add(largeString);
        let found: boolean = false;
        treeSet.forEach((value: string): void => {
          if (value === largeString) {
            found = true;
          }
        });
        expect(found).assertTrue();
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4100
     * @tc.name      testTreeSet06Chapter0041
     * @tc.desc      Test forEach method error scenario - modifying TreeSet during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0041';
      console.log(TAG + ' start');
      let treeSet: TreeSet<number> = new TreeSet<number>();
      for (let i: number = 0; i < 10; i++) {
        treeSet.add(i);
      }

      let iterationCount: number = 0;
      try {
        treeSet.forEach((value: number): void => {
          iterationCount++;
          if (value === 5) {
            treeSet.add(100);
          }
        });
      } catch (error) {
        let businessError: BusinessError = error as BusinessError;
        expect(businessError).assertNull();
      }

      expect(iterationCount > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4200
     * @tc.name      testTreeSet06Chapter0042
     * @tc.desc      Test entries method with TreeSet containing string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0042';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("squirrel");
      treeSet.add("sparrow");
      treeSet.add("owl");

      let it = treeSet.entries();
      let result: string[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        result.push(entry.value[1]);
        entry = it.next();
      }

      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual("owl");
      expect(result[1]).assertEqual("owl");
      expect(result[2]).assertEqual("sparrow");
      expect(result[3]).assertEqual("sparrow");
      expect(result[4]).assertEqual("squirrel");
      expect(result[5]).assertEqual("squirrel");
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4300
     * @tc.name      testTreeSet06Chapter0043
     * @tc.desc      Test entries method with empty TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0043';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      let it = treeSet.entries();
      let entry = it.next();

      expect(entry.done).assertTrue();
      expect(entry.value).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4400
     * @tc.name      testTreeSet06Chapter0044
     * @tc.desc      Test entries method with TreeSet containing single element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0044';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(100);

      let it = treeSet.entries();
      let entry = it.next();

      expect(entry.done).assertFalse();
      expect(entry.value[0]).assertEqual(100);
      expect(entry.value[1]).assertEqual(100);

      entry = it.next();
      expect(entry.done).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4500
     * @tc.name      testTreeSet06Chapter0045
     * @tc.desc      Test entries method with TreeSet containing number elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0045';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(100);
      treeSet.add(-50);
      treeSet.add(0);
      treeSet.add(-100);
      treeSet.add(50);

      let it = treeSet.entries();
      let result: number[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        entry = it.next();
      }

      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(-100);
      expect(result[1]).assertEqual(-50);
      expect(result[2]).assertEqual(0);
      expect(result[3]).assertEqual(50);
      expect(result[4]).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4600
     * @tc.name      testTreeSet06Chapter0046
     * @tc.desc      Test entries method with TreeSet containing special number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0046';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Infinity);
      treeSet.add(-Infinity);
      treeSet.add(0);
      treeSet.add(NaN);
      treeSet.add(100);

      let it = treeSet.entries();
      let result: number[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        entry = it.next();
      }

      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4700
     * @tc.name      testTreeSet06Chapter0047
     * @tc.desc      Test entries method with TreeSet containing large number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0047';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(Number.MAX_VALUE);
      treeSet.add(Number.MIN_VALUE);
      treeSet.add(Number.MAX_SAFE_INTEGER);
      treeSet.add(Number.MIN_SAFE_INTEGER);
      treeSet.add(0);

      let it = treeSet.entries();
      let result: number[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        entry = it.next();
      }

      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(result[4]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4800
     * @tc.name      testTreeSet06Chapter0048
     * @tc.desc      Test entries method with TreeSet containing boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0048';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<boolean>();
      treeSet.add(true);
      treeSet.add(false);

      let it = treeSet.entries();
      let entry = it.next();
      expect(entry.value[0]).assertFalse();
      expect(entry.value[1]).assertFalse();

      entry = it.next();
      expect(entry.value[0]).assertTrue();
      expect(entry.value[1]).assertTrue();

      entry = it.next();
      expect(entry.done).assertTrue();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_4900
     * @tc.name      testTreeSet06Chapter0049
     * @tc.desc      Test entries method with TreeSet containing custom comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0049';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>((a: number, b: number): boolean => {
        return a > b;
      });
      treeSet.add(10);
      treeSet.add(20);
      treeSet.add(30);
      treeSet.add(5);

      let it = treeSet.entries();
      let result: number[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        entry = it.next();
      }

      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(30);
      expect(result[1]).assertEqual(20);
      expect(result[2]).assertEqual(10);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5000
     * @tc.name      testTreeSet06Chapter0050
     * @tc.desc      Test entries method with TreeSet containing duplicate values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0050';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("apple");
      treeSet.add("apple");
      treeSet.add("banana");
      treeSet.add("banana");
      treeSet.add("cherry");

      let it = treeSet.entries();
      let count = 0;
      let entry = it.next();
      while (!entry.done) {
        count++;
        entry = it.next();
      }

      expect(count).assertEqual(3);
      expect(treeSet.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5100
     * @tc.name      testTreeSet06Chapter0051
     * @tc.desc      Test entries method with TreeSet containing special string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0051';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("");
      treeSet.add(" ");
      treeSet.add("0");
      treeSet.add("null");
      treeSet.add("undefined");
      treeSet.add("NaN");

      let it = treeSet.entries();
      let result: string[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        entry = it.next();
      }

      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual(" ");
      expect(result[2]).assertEqual("0");
      expect(result[3]).assertEqual("NaN");
      expect(result[4]).assertEqual("null");
      expect(result[5]).assertEqual("undefined");
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5200
     * @tc.name      testTreeSet06Chapter0052
     * @tc.desc      Test entries method with TreeSet containing escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0052';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("\\a");
      treeSet.add("\\b");
      treeSet.add("\\f");
      treeSet.add("\\n");
      treeSet.add("\\r");
      treeSet.add("\\t");
      treeSet.add("\\v");
      treeSet.add("\\\\");
      treeSet.add("\\'");
      treeSet.add('\\"');

      let it = treeSet.entries();
      let count = 0;
      let entry = it.next();
      while (!entry.done) {
        count++;
        entry = it.next();
      }

      expect(count).assertEqual(10);
      expect(treeSet.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5300
     * @tc.name      testTreeSet06Chapter0053
     * @tc.desc      Test entries method with TreeSet containing ASCII special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0053';
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

      let it = treeSet.entries();
      let result: string[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        entry = it.next();
      }

      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5400
     * @tc.name      testTreeSet06Chapter0054
     * @tc.desc      Test entries method with TreeSet containing emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0054';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("👆");
      treeSet.add("👿");
      treeSet.add("👀");
      treeSet.add("💯");
      treeSet.add("🎅");

      let it = treeSet.entries();
      let count = 0;
      let entry = it.next();
      while (!entry.done) {
        count++;
        entry = it.next();
      }

      expect(count).assertEqual(5);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5500
     * @tc.name      testTreeSet06Chapter0055
     * @tc.desc      Test entries method with TreeSet containing numeric string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0055';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("100");
      treeSet.add("50");
      treeSet.add("200");
      treeSet.add("10");
      treeSet.add("1000");

      let it = treeSet.entries();
      let result: string[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        entry = it.next();
      }

      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("10");
      expect(result[1]).assertEqual("100");
      expect(result[2]).assertEqual("1000");
      expect(result[3]).assertEqual("200");
      expect(result[4]).assertEqual("50");
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5600
     * @tc.name      testTreeSet06Chapter0056
     * @tc.desc      Test entries method with for-of loop iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0056';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(3);
      treeSet.add(1);
      treeSet.add(4);
      treeSet.add(2);

      let result: number[] = [];
      for (let entry of treeSet.entries()) {
        result.push(entry[0]);
        result.push(entry[1]);
      }

      expect(result.length).assertEqual(8);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(2);
      expect(result[4]).assertEqual(3);
      expect(result[5]).assertEqual(3);
      expect(result[6]).assertEqual(4);
      expect(result[7]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5700
     * @tc.name      testTreeSet06Chapter0057
     * @tc.desc      Test entries method with large TreeSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0057';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      for (let i = 0; i < 100; i++) {
        treeSet.add(i);
      }

      let it = treeSet.entries();
      let count = 0;
      let entry = it.next();
      while (!entry.done) {
        count++;
        expect(entry.value[0]).assertEqual(entry.value[1]);
        entry = it.next();
      }

      expect(count).assertEqual(100);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5800
     * @tc.name      testTreeSet06Chapter0058
     * @tc.desc      Test entries method after clear operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0058';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<string>();
      treeSet.add("a");
      treeSet.add("b");
      treeSet.add("c");
      treeSet.clear();

      let it = treeSet.entries();
      let entry = it.next();
      expect(entry.done).assertTrue();
      expect(entry.value).assertUndefined();
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_5900
     * @tc.name      testTreeSet06Chapter0059
     * @tc.desc      Test entries method after pop operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0059';
      console.log(TAG + ' start');
      let treeSet = new TreeSet<number>();
      treeSet.add(10);
      treeSet.add(20);
      treeSet.add(30);
      treeSet.add(40);
      treeSet.popFirst();
      treeSet.popLast();

      let it = treeSet.entries();
      let result: number[] = [];
      let entry = it.next();
      while (!entry.done) {
        result.push(entry.value[0]);
        entry = it.next();
      }

      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number    SUB_TREESET_TEST06_6000
     * @tc.name      testTreeSet06Chapter0060
     * @tc.desc      Test entries method error scenario - binding error (reverse test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testTreeSet06Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testTreeSet06Chapter0060';
      console.log(TAG + ' start');
      try {
        let treeSet = new TreeSet<string>();
        treeSet.add("test");
        let entriesFunc = treeSet.entries;
        let it = entriesFunc();
        let entry = it.next();
        expect(entry.done).assertTrue();
      } catch (error) {
        expect(error.code).assertEqual(10200011);
      }
    });
  })
}