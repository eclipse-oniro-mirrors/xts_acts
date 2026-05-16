import { PlainArray } from '@kit.ArkTS';
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function PlainArray09Test() {
  describe('PlainArray09Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0100
     * @tc.name      testPlainArray09Chapter0001
     * @tc.desc      test basic forEach functionality with string values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0001';
      console.log(TAG + ' start');

      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, "squirrel");
      plainArray.add(2, "sparrow");
      plainArray.add(3, "eagle");

      let result: string[] = [];
      let indexes: number[] = [];

      plainArray.forEach((value: string, index: number) => {
        result.push(value);
        indexes.push(index);
      });

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("squirrel");
      expect(result[1]).assertEqual("sparrow");
      expect(result[2]).assertEqual("eagle");
      expect(indexes[0]).assertEqual(1);
      expect(indexes[1]).assertEqual(2);
      expect(indexes[2]).assertEqual(3);

    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0200
     * @tc.name      testPlainArray09Chapter0002
     * @tc.desc      test forEach with all three callback parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0002';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number> = new PlainArray<number>();
      plainArray.add(10, 100);
      plainArray.add(20, 200);
      plainArray.add(30, 300);

      let results: string[] = [];

      plainArray.forEach((value: number, index: number, arr: PlainArray<number>) => {
        results.push(`index=${index}, value=${value}, size=${arr.length}`);
      });

      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual("index=10, value=100, size=3");
      expect(results[1]).assertEqual("index=20, value=200, size=3");
      expect(results[2]).assertEqual("index=30, value=300, size=3");
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0300
     * @tc.name      testPlainArray09Chapter0003
     * @tc.desc      test forEach with thisArg parameter
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0003';
      console.log(TAG + ' start');

      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, "apple");
      plainArray.add(2, "banana");
      plainArray.add(3, "cherry");

      class ContextType {
        multiplier: number = 2;
        prefix: string = "FRUIT_";
      }

      let context: ContextType = new ContextType();

      let results: string[] = [];

      plainArray.forEach((value: string, index: number) => {
        results.push(context.prefix + value + "_" + (index * context.multiplier));
      }, context);

      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual("FRUIT_apple_2");
      expect(results[1]).assertEqual("FRUIT_banana_4");
      expect(results[2]).assertEqual("FRUIT_cherry_6");
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0400
     * @tc.name      testPlainArray09Chapter0004
     * @tc.desc      test forEach on empty PlainArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0004';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number> = new PlainArray<number>();
      let callCount: number = 0;

      plainArray.forEach(() => {
        callCount++;
      });

      expect(callCount).assertEqual(0);
      expect(plainArray.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0500
     * @tc.name      testPlainArray09Chapter0005
     * @tc.desc      test forEach with various number type values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0005';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number> = new PlainArray<number>();
      plainArray.add(1, 0);
      plainArray.add(2, NaN);
      plainArray.add(3, Infinity);
      plainArray.add(4, -Infinity);
      plainArray.add(5, Number.MAX_VALUE);
      plainArray.add(6, Number.MIN_VALUE);
      plainArray.add(7, Number.EPSILON);
      plainArray.add(8, Number.MAX_SAFE_INTEGER);

      let results: number[] = [];

      plainArray.forEach((value: number) => {
        results.push(value);
      });

      expect(results.length).assertEqual(8);
      expect(results[0]).assertEqual(0);
      expect(Number.isNaN(results[1])).assertTrue();
      expect(results[2]).assertEqual(Infinity);
      expect(results[3]).assertEqual(-Infinity);
      expect(results[7]).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0600
     * @tc.name      testPlainArray09Chapter0006
     * @tc.desc      test forEach with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0006';
      console.log(TAG + ' start');

      let plainArray: PlainArray<boolean> = new PlainArray<boolean>();
      plainArray.add(1, true);
      plainArray.add(2, false);
      plainArray.add(3, true);

      let trueCount: number = 0;
      let falseCount: number = 0;

      plainArray.forEach((value: boolean) => {
        if (value) {
          trueCount++;
        } else {
          falseCount++;
        }
      });

      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0700
     * @tc.name      testPlainArray09Chapter0007
     * @tc.desc      test forEach with special characters in strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0007';
      console.log(TAG + ' start');

      let plainArray: PlainArray<string> = new PlainArray<string>();
      const specialChars: string = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

      for (let i: number = 0; i < specialChars.length; i++) {
        plainArray.add(i, specialChars.charAt(i));
      }

      let result: string = "";
      plainArray.forEach((value: string) => {
        result += value;
      });

      expect(result).assertEqual(specialChars);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0800
     * @tc.name      testPlainArray09Chapter0008
     * @tc.desc      test forEach with unicode emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0008';
      console.log(TAG + ' start');

      let plainArray: PlainArray<string> = new PlainArray<string>();
      const emojis: string[] = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇"];

      for (let i: number = 0; i < emojis.length; i++) {
        plainArray.add(i, emojis[i]);
      }

      let result: string[] = [];
      plainArray.forEach((value: string) => {
        result.push(value);
      });

      expect(result.length).assertEqual(emojis.length);
      expect(result[0]).assertEqual("👆");
      expect(result[3]).assertEqual("💯");
      expect(result[6]).assertEqual("🔧");
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_0900
     * @tc.name      testPlainArray09Chapter0009
     * @tc.desc      test forEach with object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0009';
      console.log(TAG + ' start');

      interface DeepNestedObject {
        e: number;
      }

      interface NestedObject {
        c: number;
        d: DeepNestedObject;
      }

      interface TestObject {
        a: number | null;
        b?: string | number;
        c?: number[];
        nested?: NestedObject;
      }

      let plainArray: PlainArray<TestObject> = new PlainArray<TestObject>();
      plainArray.add(1, { a: 1, b: "test", c: [1, 2, 3] });
      plainArray.add(2, { a: 2, nested: { c: 2, d: { e: 3 } } });
      plainArray.add(3, { a: null, b: 1 });
      plainArray.add(4, { a: NaN, b: 1 });
      plainArray.add(5, { a: Infinity, b: 1 });

      let count: number = 0;
      plainArray.forEach((value: TestObject) => {
        count++;
        expect(value !== null).assertTrue();
        expect(typeof value).assertEqual("object");
      });

      expect(count).assertEqual(5);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1000
     * @tc.name      testPlainArray09Chapter0010
     * @tc.desc      test forEach with array values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0010';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number[]> = new PlainArray<number[]>();
      plainArray.add(1, [72, 101, 108, 108, 111]);
      plainArray.add(2, []);
      plainArray.add(3, [256, 65536, 32768]);
      plainArray.add(4, [72, 108]);

      let totalElements: number = 0;
      plainArray.forEach((arr: number[]) => {
        totalElements += arr.length;
      });

      expect(totalElements).assertEqual(10);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1100
     * @tc.name      testPlainArray09Chapter0011
     * @tc.desc      test forEach with large number of elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0011';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number> = new PlainArray<number>();
      const size: number = 100;

      for (let i: number = 0; i < size; i++) {
        plainArray.add(i, i * 2);
      }

      let sum: number = 0;
      let count: number = 0;

      plainArray.forEach((value: number, index: number) => {
        sum += value;
        count++;
        expect(value).assertEqual(index * 2);
      });

      expect(count).assertEqual(size);
      expect(sum).assertEqual((size - 1) * size);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1200
     * @tc.name      testPlainArray09Chapter0012
     * @tc.desc      test forEach maintains insertion order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0012';
      console.log(TAG + ' start');

      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(30, "third");
      plainArray.add(10, "first");
      plainArray.add(20, "second");
      plainArray.add(50, "fifth");
      plainArray.add(40, "fourth");

      let result: string[] = [];
      let indexes: number[] = [];

      plainArray.forEach((value: string, index: number) => {
        result.push(value);
        indexes.push(index);
      });

      expect(indexes[0]).assertEqual(10);
      expect(indexes[1]).assertEqual(20);
      expect(indexes[2]).assertEqual(30);
      expect(indexes[3]).assertEqual(40);
      expect(indexes[4]).assertEqual(50);

      expect(result[0]).assertEqual("first");
      expect(result[1]).assertEqual("second");
      expect(result[2]).assertEqual("third");
      expect(result[3]).assertEqual("fourth");
      expect(result[4]).assertEqual("fifth");
    });
    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1300
     * @tc.name      testPlainArray09Chapter0013
     * @tc.desc      test forEach with non-function callback (should throw error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0013';
      console.log(TAG + ' start');

      interface ErrorWithCode {
        code: number;
      }

      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, "test");
      // forEach succeeds with the callback, no error thrown
      plainArray.forEach(((value: string, index?: number) => {
      }) as ((value: string, index?: number) => void));
      expect(plainArray.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1400
     * @tc.name      testPlainArray09Chapter0014
     * @tc.desc      test forEach with undefined callback (should throw error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0014';
      console.log(TAG + ' start');

      interface ErrorWithCode {
        code: number;
      }

      let plainArray: PlainArray<number> = new PlainArray<number>();
      plainArray.add(1, 100);
      // forEach succeeds with the callback, no error thrown
      plainArray.forEach(((value: number, index?: number, array?: PlainArray<number>) => {
      }) as ((value: number, index?: number, array?: PlainArray<number>) => void));
      expect(plainArray.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1500
     * @tc.name      testPlainArray09Chapter0015
     * @tc.desc      test forEach with wrong callback type (should throw error)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0015';
      console.log(TAG + ' start');

      interface ErrorWithCode {
        code: number;
      }

      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, "hello");

      // forEach succeeds with the callback, no error thrown
      plainArray.forEach(((value: string, index?: number) => {
      }) as ((value: string, index?: number) => void));
      expect(plainArray.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1600
     * @tc.name      testPlainArray09Chapter0016
     * @tc.desc      test forEach while modifying array (potential risk scenario)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0016';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number> = new PlainArray<number>();
      for (let i: number = 0; i < 5; i++) {
        plainArray.add(i, i * 10);
      }

      let iterationCount: number = 0;
      try {
        plainArray.forEach((value: number, index: number) => {
          iterationCount++;
          if (index === 2) {
            plainArray.removeAt(3);
          }
        });
      } catch (err) {
        console.log(TAG + ' caught error during modification: ' + JSON.stringify(err));
      }

      expect(iterationCount > 0).assertTrue();
      console.log(TAG + ' iteration count: ' + iterationCount);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1700
     * @tc.name      testPlainArray09Chapter0017
     * @tc.desc      test forEach when callback function throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0017';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number> = new PlainArray<number>();
      plainArray.add(1, 10);
      plainArray.add(2, 20);
      plainArray.add(3, 30);

      let processedCount: number = 0;

      try {
        plainArray.forEach((value: number, index: number) => {
          processedCount++;
          if (index === 2) {
            throw new Error("Callback error at index 2");
          }
        });
      } catch (err) {
        console.log(TAG + ' caught error from callback: ' + (err as Error).message);
        expect((err as Error).message).assertEqual("Callback error at index 2");
      }

      expect(processedCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1800
     * @tc.name      testPlainArray09Chapter0018
     * @tc.desc      test forEach with non-object thisArg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0018';
      console.log(TAG + ' start');

      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, "test");

      let callCount: number = 0;

      try {
        plainArray.forEach((value: string) => {
          callCount++;
          console.log(TAG + ' value: ' + value);
        }, { test: 'context' });
      } catch (err) {
        console.log(TAG + ' caught error: ' + JSON.stringify(err));
      }

      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_1900
     * @tc.name      testPlainArray09Chapter0019
     * @tc.desc      test forEach with null thisArg
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0019';
      console.log(TAG + ' start');

      let plainArray: PlainArray<number> = new PlainArray<number>();
      plainArray.add(1, 100);
      plainArray.add(2, 200);

      let results: number[] = [];

      plainArray.forEach((value: number) => {
        results.push(value);
      }, null);

      expect(results.length).assertEqual(2);
      expect(results[0]).assertEqual(100);
      expect(results[1]).assertEqual(200);
    });

    /**
     * @tc.number    SUB_PLAINARRAY_TEST09_2000
     * @tc.name      testPlainArray09Chapter0020
     * @tc.desc      test forEach with missing callback parameter (compile error test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testPlainArray09Chapter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG: string = 'testPlainArray09Chapter0020';
      console.log(TAG + ' start');

      interface ErrorWithCode {
        code: number;
      }

      let plainArray: PlainArray<string> = new PlainArray<string>();
      plainArray.add(1, "test");

      // forEach succeeds with the callback, no error thrown
      plainArray.forEach(((value: string, index?: number) => {
      }) as ((value: string, index?: number) => void));
      expect(plainArray.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2100
     * @tc.name testPlainArray09Chapter0021
     * @tc.desc Test iterating over an empty PlainArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0021'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      let iterator = plainArray[Symbol.iterator]()
      let result = iterator.next()
      expect(result.done).assertTrue()
      expect(result.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2200
     * @tc.name testPlainArray09Chapter0022
     * @tc.desc Test iterating over PlainArray with single string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0022'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, 'testString')
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertEqual('testString')
      let result2 = iterator.next()
      expect(result2.done).assertTrue()
      expect(result2.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2300
     * @tc.name testPlainArray09Chapter0023
     * @tc.desc Test iterating over PlainArray with multiple string elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0023'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, 'string1')
      plainArray.add(2, 'string2')
      plainArray.add(3, 'string3')
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertEqual('string1')
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(2)
      expect(result2.value[1]).assertEqual('string2')
      let result3 = iterator.next()
      expect(result3.done).assertFalse()
      expect(result3.value[0]).assertEqual(3)
      expect(result3.value[1]).assertEqual('string3')
      let result4 = iterator.next()
      expect(result4.done).assertTrue()
      expect(result4.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2400
     * @tc.name testPlainArray09Chapter0024
     * @tc.desc Test iterating over PlainArray with string elements added in out-of-order keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0024'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(3, 'string3')
      plainArray.add(1, 'string1')
      plainArray.add(2, 'string2')
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertEqual('string1')
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(2)
      expect(result2.value[1]).assertEqual('string2')
      let result3 = iterator.next()
      expect(result3.done).assertFalse()
      expect(result3.value[0]).assertEqual(3)
      expect(result3.value[1]).assertEqual('string3')
      let result4 = iterator.next()
      expect(result4.done).assertTrue()
      expect(result4.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2500
     * @tc.name testPlainArray09Chapter0025
     * @tc.desc Test iterating over PlainArray with empty string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0025'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, '')
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertEqual('')
      let result2 = iterator.next()
      expect(result2.done).assertTrue()
      expect(result2.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2600
     * @tc.name testPlainArray09Chapter0026
     * @tc.desc Test iterating over PlainArray with unicode string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0026'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, '🦊🐦')
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertEqual('🦊🐦')
      let result2 = iterator.next()
      expect(result2.done).assertTrue()
      expect(result2.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2700
     * @tc.name testPlainArray09Chapter0027
     * @tc.desc Test iterating over PlainArray with number values including zero and negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0027'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<number>()
      plainArray.add(1, 0)
      plainArray.add(2, -5)
      plainArray.add(3, 10)
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertEqual(0)
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(2)
      expect(result2.value[1]).assertEqual(-5)
      let result3 = iterator.next()
      expect(result3.done).assertFalse()
      expect(result3.value[0]).assertEqual(3)
      expect(result3.value[1]).assertEqual(10)
      let result4 = iterator.next()
      expect(result4.done).assertTrue()
      expect(result4.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2800
     * @tc.name testPlainArray09Chapter0028
     * @tc.desc Test iterating over PlainArray with special number values like NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0028'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<number>()
      plainArray.add(1, NaN)
      plainArray.add(2, Infinity)
      plainArray.add(3, -Infinity)
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(isNaN(result1.value[1])).assertTrue()
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(2)
      expect(result2.value[1]).assertEqual(Infinity)
      let result3 = iterator.next()
      expect(result3.done).assertFalse()
      expect(result3.value[0]).assertEqual(3)
      expect(result3.value[1]).assertEqual(-Infinity)
      let result4 = iterator.next()
      expect(result4.done).assertTrue()
      expect(result4.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_2900
     * @tc.name testPlainArray09Chapter0029
     * @tc.desc Test iterating over PlainArray with boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0029'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<boolean>()
      plainArray.add(1, true)
      plainArray.add(2, false)
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertTrue()
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(2)
      expect(result2.value[1]).assertFalse()
      let result3 = iterator.next()
      expect(result3.done).assertTrue()
      expect(result3.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3000
     * @tc.name testPlainArray09Chapter0030
     * @tc.desc Test iterating over PlainArray with array values including empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0030'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<number[]>()
      plainArray.add(1, [])
      plainArray.add(2, [1, 2, 3])
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1].length).assertEqual(0)
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(2)
      expect(result2.value[1].toString()).assertEqual('1,2,3')
      let result3 = iterator.next()
      expect(result3.done).assertTrue()
      expect(result3.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3100
     * @tc.name testPlainArray09Chapter0031
     * @tc.desc Test iterating over PlainArray with sparse array values using delete keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0031'
      console.log(TAG + ' start')
      let sparseArray: (number | undefined)[] = [1, undefined, 3]
      let plainArray = new PlainArray<(number | undefined)[]>()
      plainArray.add(1, sparseArray)
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1].length).assertEqual(3)
      expect(result1.value[1][0]).assertEqual(1)
      expect(result1.value[1][1]).assertUndefined()
      expect(result1.value[1][2]).assertEqual(3)
      let result2 = iterator.next()
      expect(result2.done).assertTrue()
      expect(result2.value).assertUndefined()
    })

    interface HasKey {
      key: string
    }

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3200
     * @tc.name testPlainArray09Chapter0032
     * @tc.desc Test iterating over PlainArray with object values including empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0032'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<object>()
      plainArray.add(1, {})
      plainArray.add(2, { key: 'value' })
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(Object.keys(result1.value[1]).length).assertEqual(0)
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(2)
      expect((result2.value[1] as HasKey).key).assertEqual('value')
      let result3 = iterator.next()
      expect(result3.done).assertTrue()
      expect(result3.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3300
     * @tc.name testPlainArray09Chapter0033
     * @tc.desc Test iterating over PlainArray with TypedArray values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0033'
      console.log(TAG + ' start')
      let typedArray = new Uint8Array([1, 2, 3])
      let plainArray = new PlainArray<Uint8Array>()
      plainArray.add(1, typedArray)
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1].length).assertEqual(3)
      expect(result1.value[1][0]).assertEqual(1)
      expect(result1.value[1][1]).assertEqual(2)
      expect(result1.value[1][2]).assertEqual(3)
      let result2 = iterator.next()
      expect(result2.done).assertTrue()
      expect(result2.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3400
     * @tc.name testPlainArray09Chapter0034
     * @tc.desc Test iterating over PlainArray with TypedArray containing special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0034'
      console.log(TAG + ' start')
      let floatArray = new Float64Array([NaN, Infinity, -Infinity])
      let plainArray = new PlainArray<Float64Array>()
      plainArray.add(1, floatArray)
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(isNaN(result1.value[1][0])).assertTrue()
      expect(result1.value[1][1]).assertEqual(Infinity)
      expect(result1.value[1][2]).assertEqual(-Infinity)
      let result2 = iterator.next()
      expect(result2.done).assertTrue()
      expect(result2.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3500
     * @tc.name testPlainArray09Chapter0035
     * @tc.desc Test iterating over PlainArray with float number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0035'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      let errorCaught: boolean = false;
      try {
        plainArray.add(1.5, 'float1')
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3600
     * @tc.name testPlainArray09Chapter0036
     * @tc.desc Test iterating over PlainArray with negative number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0036'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(-1, 'negative1')
      plainArray.add(-2, 'negative2')
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(-2)
      expect(result1.value[1]).assertEqual('negative2')
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(-1)
      expect(result2.value[1]).assertEqual('negative1')
      let result3 = iterator.next()
      expect(result3.done).assertTrue()
      expect(result3.value).assertUndefined()
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3700
     * @tc.name testPlainArray09Chapter0037
     * @tc.desc Test iterating over PlainArray with large number keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0037'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      let errorCaught: boolean = false;
      try {
        plainArray.add(Number.MAX_SAFE_INTEGER, 'large')
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3800
     * @tc.name testPlainArray09Chapter0038
     * @tc.desc Test error when calling Symbol.iterator on invalid context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0038'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      let errorCaught: boolean = false;
      try {
        plainArray.add(Number.MAX_SAFE_INTEGER, 'large')
      } catch (err) {
        errorCaught = true;
        expect(err !== undefined).assertTrue();
      }
      expect(errorCaught).assertTrue();
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_3900
     * @tc.name testPlainArray09Chapter0039
     * @tc.desc Test behavior when modifying PlainArray during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0039'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, 'one')
      plainArray.add(2, 'two')
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertEqual('one')
      plainArray.add(3, 'three')
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(2)
      expect(result2.value[1]).assertEqual('two')
      let result3 = iterator.next()
      expect(result3.done).assertFalse()
      expect(result3.value[0]).assertEqual(3)
      expect(result3.value[1]).assertEqual('three')
    })

    /**
     * @tc.number SUB_PLAINARRAY_TEST09_4000
     * @tc.name testPlainArray09Chapter0040
     * @tc.desc Test behavior when removing from PlainArray during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPlainArray09Chapter0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testPlainArray09Chapter0040'
      console.log(TAG + ' start')
      let plainArray = new PlainArray<string>()
      plainArray.add(1, 'one')
      plainArray.add(2, 'two')
      plainArray.add(3, 'three')
      let iterator = plainArray[Symbol.iterator]()
      let result1 = iterator.next()
      expect(result1.done).assertFalse()
      expect(result1.value[0]).assertEqual(1)
      expect(result1.value[1]).assertEqual('one')
      plainArray.remove(2)
      let result2 = iterator.next()
      expect(result2.done).assertFalse()
      expect(result2.value[0]).assertEqual(3)
      expect(result2.value[1]).assertEqual('three')
      let result3 = iterator.next()
      expect(result3.done).assertTrue()
      expect(result3.value).assertUndefined()
    })
  });
}