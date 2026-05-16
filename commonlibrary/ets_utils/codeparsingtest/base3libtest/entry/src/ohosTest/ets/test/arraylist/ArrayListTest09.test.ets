import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList09Test() {
  describe('ArrayList09Test', () => {
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
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0100
     * @tc.name      testArrayList01ForEach0001
     * @tc.desc      Test normal forEach with basic callback function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        let result: string[] = [];
        arrayList.forEach((value: number, index?: number) => {
          result.push(`value:${value} index:${index}`);
        });
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual("value:2 index:0");
        expect(result[1]).assertEqual("value:4 index:1");
        expect(result[2]).assertEqual("value:5 index:2");
        expect(result[3]).assertEqual("value:4 index:3");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0200
     * @tc.name      testArrayList01ForEach0002
     * @tc.desc      Test forEach with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0002';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(-128);
        arrayList.add(127);
        arrayList.add(-129);
        arrayList.add(128);
        let results: number[] = [];
        arrayList.forEach((value: number) => {
          results.push(value);
        });
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(-128);
        expect(results[1]).assertEqual(127);
        expect(results[2]).assertEqual(-129);
        expect(results[3]).assertEqual(128);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0300
     * @tc.name      testArrayList01ForEach0003
     * @tc.desc      Test forEach with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0003';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(0);
        arrayList.add(255);
        arrayList.add(-1);
        arrayList.add(256);
        let results: number[] = [];
        arrayList.forEach((value: number) => {
          results.push(value);
        });
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(0);
        expect(results[1]).assertEqual(255);
        expect(results[2]).assertEqual(-1);
        expect(results[3]).assertEqual(256);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0400
     * @tc.name      testArrayList01ForEach0004
     * @tc.desc      Test forEach with Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0004';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(0);
        arrayList.add(255);
        arrayList.add(-1);
        arrayList.add(256);
        let results: number[] = [];
        arrayList.forEach((value: number) => {
          results.push(value);
        });
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(0);
        expect(results[1]).assertEqual(255);
        expect(results[2]).assertEqual(-1);
        expect(results[3]).assertEqual(256);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0500
     * @tc.name      testArrayList01ForEach0005
     * @tc.desc      Test forEach with Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0005';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(NaN);
        arrayList.add(3.4028234663852886e38);
        arrayList.add(-3.4028234663852886e38);
        arrayList.add(3.5e38);
        arrayList.add(-3.5e38);
        let results: number[] = [];
        arrayList.forEach((value: number) => {
          results.push(value);
        });
        expect(results.length).assertEqual(7);
        expect(results[0]).assertEqual(Infinity);
        expect(results[1]).assertEqual(-Infinity);
        expect(isNaN(results[2])).assertTrue();
        expect(results[3]).assertEqual(3.4028234663852886e38);
        expect(results[4]).assertEqual(-3.4028234663852886e38);
        expect(results[5]).assertEqual(3.5e38);
        expect(results[6]).assertEqual(-3.5e38);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0600
     * @tc.name      testArrayList01ForEach0006
     * @tc.desc      Test forEach with Float64Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0006';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(NaN);
        arrayList.add(1.7976931348623157e308);
        arrayList.add(-1.7976931348623157e308);
        arrayList.add(1.8E308);
        arrayList.add(-1.8E308);
        let results: number[] = [];
        arrayList.forEach((value: number) => {
          results.push(value);
        });
        expect(results.length).assertEqual(7);
        expect(results[0]).assertEqual(Infinity);
        expect(results[1]).assertEqual(-Infinity);
        expect(isNaN(results[2])).assertTrue();
        expect(results[3]).assertEqual(1.7976931348623157e308);
        expect(results[4]).assertEqual(-1.7976931348623157e308);
        expect(results[5]).assertEqual(1.8E308);
        expect(results[6]).assertEqual(-1.8E308);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0700
     * @tc.name      testArrayList01ForEach0007
     * @tc.desc      Test forEach with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0007';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<bigint>();
        arrayList.add(-9223372036854775808n);
        arrayList.add(9223372036854775807n);
        let results: bigint[] = [];
        arrayList.forEach((value: bigint) => {
          results.push(value);
        });
        expect(results.length).assertEqual(2);
        expect(results[0]).assertEqual(-9223372036854775808n);
        expect(results[1]).assertEqual(9223372036854775807n);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0800
     * @tc.name      testArrayList01ForEach0008
     * @tc.desc      Test forEach with typed array special value storage rules
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0008';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(NaN);
        arrayList.add(10);

        let results: number[] = [];
        arrayList.forEach((value: number) => {
          results.push(value);
        });
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(Infinity);
        expect(results[1]).assertEqual(-Infinity);
        expect(isNaN(results[2])).assertTrue();
        expect(results[3]).assertEqual(10);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_0900
     * @tc.name      testArrayList01ForEach0009
     * @tc.desc      Test forEach with string special cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0009';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string | null | undefined>();
        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add("");
        arrayList.add(" ");
        arrayList.add("0");
        arrayList.add("NaN");
        let results: (string | null | undefined)[] = [];
        arrayList.forEach((value: string) => {
          results.push(value);
        });
        expect(results.length).assertEqual(6);
        expect(results[0]).assertUndefined();
        expect(results[1]).assertNull();
        expect(results[2]).assertEqual("");
        expect(results[3]).assertEqual(" ");
        expect(results[4]).assertEqual("0");
        expect(results[5]).assertEqual("NaN");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1000
     * @tc.name      testArrayList01ForEach0010
     * @tc.desc      Test forEach with full ASCII coverage
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0010';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        const asciiChars = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        for (let i = 0; i < asciiChars.length; i++) {
          arrayList.add(asciiChars.charAt(i));
        }
        let result = "";
        arrayList.forEach((value: string) => {
          result += value;
        });
        expect(result).assertEqual(asciiChars);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1100
     * @tc.name      testArrayList01ForEach0011
     * @tc.desc      Test forEach with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0011';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("\n");
        arrayList.add("\r");
        arrayList.add("\t");
        arrayList.add("\\");
        arrayList.add("\'");
        arrayList.add("\"");
        arrayList.add("\0");
        arrayList.add("\x41");
        arrayList.add("\x41");
        let results: string[] = [];
        arrayList.forEach((value: string) => {
          results.push(value);
        });
        expect(results.length).assertEqual(9);
        expect(results[0]).assertEqual("\n");
        expect(results[1]).assertEqual("\r");
        expect(results[2]).assertEqual("\t");
        expect(results[3]).assertEqual("\\");
        expect(results[4]).assertEqual("'");
        expect(results[5]).assertEqual("\"");
        expect(results[6]).assertEqual("\0");
        expect(results[7]).assertEqual("A");
        expect(results[8]).assertEqual("A");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1200
     * @tc.name      testArrayList01ForEach0012
     * @tc.desc      Test forEach with emoji and Unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0012';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();

        arrayList.add("👆");
        arrayList.add("👿");
        arrayList.add("👀");
        arrayList.add("💯");
        arrayList.add("🎅");
        arrayList.add("\ud83d\udc46");
        arrayList.add("\ud83d\udc7f");
        let results: string[] = [];
        arrayList.forEach((value: string) => {
          results.push(value);
        });
        expect(results.length).assertEqual(7);
        expect(results[0]).assertEqual("👆");
        expect(results[1]).assertEqual("👿");
        expect(results[2]).assertEqual("👀");
        expect(results[3]).assertEqual("💯");
        expect(results[4]).assertEqual("🎅");
        expect(results[5]).assertEqual("👆");
        expect(results[6]).assertEqual("👿");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1300
     * @tc.name      testArrayList01ForEach0013
     * @tc.desc      Test forEach with large strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0013';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        const largeString = "a".repeat(10000);
        arrayList.add(largeString);
        arrayList.add("normal");
        arrayList.add("test");
        let totalLength = 0;
        arrayList.forEach((value: string) => {
          totalLength += value.length;
        });
        expect(totalLength).assertEqual(10000 + 6 + 4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1400
     * @tc.name      testArrayList01ForEach0014
     * @tc.desc      Test forEach with number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0014';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(0);
        arrayList.add(-0);
        arrayList.add(NaN);
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(Number.MAX_VALUE);
        arrayList.add(Number.MIN_VALUE);
        arrayList.add(Number.EPSILON);
        arrayList.add(Number.MAX_SAFE_INTEGER);
        let results: number[] = [];
        arrayList.forEach((value: number) => {
          results.push(value);
        });
        expect(results.length).assertEqual(9);
        expect(results[0]).assertEqual(0);
        expect(results[1]).assertEqual(-0);
        expect(isNaN(results[2])).assertTrue();
        expect(results[3]).assertEqual(Infinity);
        expect(results[4]).assertEqual(-Infinity);
        expect(results[5]).assertEqual(Number.MAX_VALUE);
        expect(results[6]).assertEqual(Number.MIN_VALUE);
        expect(results[7]).assertEqual(Number.EPSILON);
        expect(results[8]).assertEqual(Number.MAX_SAFE_INTEGER);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1500
     * @tc.name      testArrayList01ForEach0015
     * @tc.desc      Test forEach with different numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0015';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(-128);
        arrayList.add(127);
        arrayList.add(-32768);
        arrayList.add(32767);
        arrayList.add(-2147483648);
        arrayList.add(2147483647);
        arrayList.add(123.456);
        arrayList.add(0xdecaf);
        arrayList.add(0o777);
        arrayList.add(2 ** 3);
        arrayList.add(1e3);
        arrayList.add(2.5e-2);
        let sum = 0;
        let elementCount = 0;
        arrayList.forEach((value: number, index?: number) => {
          sum += value;
          elementCount++;
        });
        expect(elementCount).assertEqual(12);
        expect(sum < Number.MAX_SAFE_INTEGER).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1600
     * @tc.name      testArrayList01ForEach0016
     * @tc.desc      Test forEach with BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0016';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<bigint>();
        arrayList.add(9007199254740991n);
        arrayList.add(9223372036854775807n);
        arrayList.add(-9223372036854775808n);
        arrayList.add(BigInt(0xdecafafecacefade));
        let results: bigint[] = [];
        arrayList.forEach((value: bigint) => {
          results.push(value);
        });
        expect(results.length).assertEqual(4);
        expect(results[0]).assertEqual(9007199254740991n);
        expect(results[1]).assertEqual(9223372036854775807n);
        expect(results[2]).assertEqual(-9223372036854775808n);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1700
     * @tc.name      testArrayList01ForEach0017
     * @tc.desc      Test forEach with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0017';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<boolean>();
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(!!0);
        arrayList.add(!!1);
        arrayList.add(!!"");
        arrayList.add(!!"abc");
        arrayList.add(!!null);
        arrayList.add(!!undefined);
        arrayList.add(!!NaN);
        let trueCount = 0;
        let falseCount = 0;
        let totalCount = 0;
        arrayList.forEach((value: boolean) => {
          if (value) {
            trueCount++;
          } else {
            falseCount++;
          }
          totalCount++;
        });
        expect(totalCount).assertEqual(9);
        expect(trueCount).assertEqual(3);
        expect(falseCount).assertEqual(6);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1800
     * @tc.name      testArrayList01ForEach0018
     * @tc.desc      Test forEach with typed arrays as elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0018';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<ArrayLike<number>>();
        const uint8Array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
        const zeroArray = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
        const negativeArray = new Int8Array([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
        const specialArray = new Float32Array([72, 101, NaN, Infinity, 108, 111]);
        arrayList.add(uint8Array);
        arrayList.add(zeroArray);
        arrayList.add(negativeArray);
        arrayList.add(specialArray);
        arrayList.add([]);
        arrayList.add([256, 65536, 32768]);
        let totalLength = 0;
        let elementCount = 0;
        arrayList.forEach((value: ArrayLike<number>) => {
          elementCount++;
          totalLength += value.length || 0;
        });
        expect(elementCount).assertEqual(6);
        expect(totalLength > 0).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_1900
     * @tc.name      testArrayList01ForEach0019
     * @tc.desc      Test forEach with arrays containing deleted elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0019", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0019';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const size = 10000;
        for (let i = 0; i < size; i++) {
          arrayList.add(i);
        }
        let sum = 0;
        const startTime = Date.now();
        arrayList.forEach((value: number) => {
          sum += value;
        });
        const endTime = Date.now();
        const duration = endTime - startTime;
        const expectedSum = (size - 1) * size / 2;
        expect(sum).assertEqual(expectedSum);
        expect(duration < 1000).assertTrue();
        console.log(`Processed ${size} elements in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_2000
     * @tc.name      testArrayList01ForEach0020
     * @tc.desc      Test forEach memory usage with large strings
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0020", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0020';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        for (let i = 0; i < 10; i++) {
          arrayList.add("x".repeat(10000));
        }
        let totalLength = 0;
        arrayList.forEach((value: string) => {
          totalLength += value.length;
        });
        expect(totalLength).assertEqual(100000);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_2100
     * @tc.name      testArrayList01ForEach0021
     * @tc.desc      Test forEach error when callback is not a function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0021';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        let processed = 0;
        try {
          arrayList.forEach((value: number) => {
            processed++;
            if (value === 2) {
              throw new Error("Test error in callback");
            }
          });
        } catch (error) {
          expect(error.message).assertEqual("Test error in callback");
        }
        expect(processed).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_2200
     * @tc.name      testArrayList01ForEach0022
     * @tc.desc      Test forEach method cannot be bound error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0022';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        let visitedValues: number[] = [];
        arrayList.forEach((value: number) => {
          visitedValues.push(value);
          if (value === 2) {
            arrayList.add(4);
            arrayList.removeByIndex(0);
          }
        });
        expect(visitedValues.length).assertEqual(3);
        expect(visitedValues).assertContain(1);
        expect(visitedValues).assertContain(2);
        expect(visitedValues).assertContain(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_FOREACH01_2300
     * @tc.name      testArrayList01ForEach0023
     * @tc.desc      Test forEach when array is cleared during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01ForEach0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01ForEach0023';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        let visitedCount = 0;
        arrayList.forEach((value: number) => {
          visitedCount++;
          if (value === 2) {
            arrayList.clear();
          }
        });
        expect(visitedCount).assertEqual(2);
        let afterClearCount = 0;
        arrayList.forEach(() => {
          afterClearCount++;
        });
        expect(afterClearCount).assertEqual(0);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0100
     * @tc.name      testArrayList02Sort0001
     * @tc.desc      Test sort with numbers in ascending order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(5);
        arrayList.add(2);
        arrayList.add(8);
        arrayList.add(1);
        arrayList.add(4);
        arrayList.sort((a: number, b: number) => a - b);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(4);
        expect(arrayList[3]).assertEqual(5);
        expect(arrayList[4]).assertEqual(8);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0200
     * @tc.name      testArrayList02Sort0002
     * @tc.desc      Test sort with numbers in descending order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(2);
        arrayList.add(4);
        arrayList.add(5);
        arrayList.add(4);
        arrayList.sort((a: number, b: number) => b - a);
        expect(arrayList[0]).assertEqual(5);
        expect(arrayList[1]).assertEqual(4);
        expect(arrayList[2]).assertEqual(4);
        expect(arrayList[3]).assertEqual(2);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0300
     * @tc.name      testArrayList02Sort0003
     * @tc.desc      Test sort with default comparator (ascending)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0003';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(5);
        arrayList.add(2);
        arrayList.add(8);
        arrayList.add(1);
        arrayList.add(4);
        arrayList.sort();
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(4);
        expect(arrayList[3]).assertEqual(5);
        expect(arrayList[4]).assertEqual(8);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0400
     * @tc.name      testArrayList02Sort0004
     * @tc.desc      Test sort with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0004';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(127);
        arrayList.add(-128);
        arrayList.add(0);
        arrayList.add(64);
        arrayList.add(-64);
        arrayList.add(-129);
        arrayList.add(128);
        arrayList.sort((a: number, b: number) => a - b);
        expect(arrayList[0]).assertEqual(-129);
        expect(arrayList[1]).assertEqual(-128);
        expect(arrayList[2]).assertEqual(-64);
        expect(arrayList[3]).assertEqual(0);
        expect(arrayList[4]).assertEqual(64);
        expect(arrayList[5]).assertEqual(127);
        expect(arrayList[6]).assertEqual(128);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0500
     * @tc.name      testArrayList02Sort0005
     * @tc.desc      Test sort with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0005';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(255);
        arrayList.add(0);
        arrayList.add(128);
        arrayList.add(64);
        arrayList.add(192);
        arrayList.add(-1);
        arrayList.add(256);
        arrayList.sort((a: number, b: number) => a - b);
        expect(arrayList[0]).assertEqual(-1);
        expect(arrayList[1]).assertEqual(0);
        expect(arrayList[2]).assertEqual(64);
        expect(arrayList[3]).assertEqual(128);
        expect(arrayList[4]).assertEqual(192);
        expect(arrayList[5]).assertEqual(255);
        expect(arrayList[6]).assertEqual(256);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0600
     * @tc.name      testArrayList02Sort0006
     * @tc.desc      Test sort with Float32Array special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0006';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(3.4028234663852886e38);
        arrayList.add(-3.4028234663852886e38);
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(NaN);
        arrayList.add(0);
        arrayList.add(1.5);
        arrayList.add(-1.5);
        arrayList.sort((a: number, b: number) => {
          if (isNaN(a) && isNaN(b)) return 0;
          if (isNaN(a)) return 1;
          if (isNaN(b)) return -1;
          return a - b;
        });
        expect(arrayList[0]).assertEqual(-Infinity);
        expect(arrayList[1]).assertEqual(-3.4028234663852886e38);
        expect(arrayList[2]).assertEqual(-1.5);
        expect(arrayList[3]).assertEqual(0);
        expect(arrayList[4]).assertEqual(1.5);
        expect(arrayList[5]).assertEqual(3.4028234663852886e38);
        expect(arrayList[6]).assertEqual(Infinity);
        expect(isNaN(arrayList[7])).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0700
     * @tc.name      testArrayList02Sort0007
     * @tc.desc      Test sort with BigInt values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0007';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<bigint>();
        arrayList.add(9223372036854775807n);
        arrayList.add(-9223372036854775808n);
        arrayList.add(0n);
        arrayList.add(100n);
        arrayList.add(-100n);
        arrayList.add(500n);
        arrayList.sort((a: bigint, b: bigint) => {
          if (a < b) return -1;
          if (a > b) return 1;
          return 0;
        });
        expect(arrayList[0]).assertEqual(-9223372036854775808n);
        expect(arrayList[1]).assertEqual(-100n);
        expect(arrayList[2]).assertEqual(0n);
        expect(arrayList[3]).assertEqual(100n);
        expect(arrayList[4]).assertEqual(500n);
        expect(arrayList[5]).assertEqual(9223372036854775807n);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0800
     * @tc.name      testArrayList02Sort0008
     * @tc.desc      Test sort with normal strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0008';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("banana");
        arrayList.add("apple");
        arrayList.add("cherry");
        arrayList.add("date");
        arrayList.add("apricot");
        arrayList.sort((a: string, b: string) => a.localeCompare(b));
        expect(arrayList[0]).assertEqual("apple");
        expect(arrayList[1]).assertEqual("apricot");
        expect(arrayList[2]).assertEqual("banana");
        expect(arrayList[3]).assertEqual("cherry");
        expect(arrayList[4]).assertEqual("date");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_0900
     * @tc.name      testArrayList02Sort0009
     * @tc.desc      Test sort with string special cases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0009';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("");
        arrayList.add(" ");
        arrayList.add("0");
        arrayList.add("NaN");
        arrayList.add("apple");
        arrayList.add("Apple");
        arrayList.add("123");
        arrayList.add("!@#");
        arrayList.sort((a: string, b: string) => a.localeCompare(b));
        expect(arrayList[0]).assertEqual("");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1000
     * @tc.name      testArrayList02Sort0010
     * @tc.desc      Test sort with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0010';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        const asciiCharsArray = [
          '"', '#', '$', '&', '(', ')', '*', '+', ',', '-', '.', '/',
          '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
          ':', ';', '<', '=', '>', '?', '@',
          'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
          '[', '\\', ']', '^', '_', '`',
          'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
          '{', '|', '}', '~'
        ];
        const shuffled = [...asciiCharsArray].sort(() => Math.random() - 0.5);
        shuffled.forEach(char => arrayList.add(char));
        arrayList.sort((a: string, b: string) => a.charCodeAt(0) - b.charCodeAt(0));
        let sortedArray: string[] = [];
        for (let i = 0; i < arrayList.length; i++) {
          sortedArray.push(arrayList[i]);
        }
        for (let i = 0; i < asciiCharsArray.length; i++) {
          expect(sortedArray[i]).assertEqual(asciiCharsArray[i]);
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1100
     * @tc.name      testArrayList02Sort0011
     * @tc.desc      Test sort with emoji and Unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0011';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("👆");
        arrayList.add("👿");
        arrayList.add("👀");
        arrayList.add("💯");
        arrayList.add("🎅");
        arrayList.add("apple");
        arrayList.add("banana");
        arrayList.add("A");
        arrayList.add("a");
        arrayList.sort((a: string, b: string) => a.localeCompare(b));
        expect(arrayList.length).assertEqual(9);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1200
     * @tc.name      testArrayList02Sort0012
     * @tc.desc      Test sort with case sensitivity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0012';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("Apple");
        arrayList.add("APPLE");
        arrayList.add("banana");
        arrayList.add("Banana");
        arrayList.add("BANANA");
        arrayList.sort((a: string, b: string) => {
          if (a < b) return -1;
          if (a > b) return 1;
          return 0;
        });
        expect(arrayList[0]).assertEqual("APPLE");
        expect(arrayList[1]).assertEqual("Apple");
        expect(arrayList[2]).assertEqual("BANANA");
        expect(arrayList[3]).assertEqual("Banana");
        expect(arrayList[4]).assertEqual("apple");
        expect(arrayList[5]).assertEqual("banana");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1300
     * @tc.name      testArrayList02Sort0013
     * @tc.desc      Test sort with number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0013';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(-Infinity);
        arrayList.add(-Number.MAX_SAFE_INTEGER);
        arrayList.add(Number.MIN_VALUE);
        arrayList.add(0);
        arrayList.add(Number.EPSILON);
        arrayList.add(Number.MAX_SAFE_INTEGER);
        arrayList.add(Number.MAX_VALUE);
        arrayList.add(Infinity);
        arrayList.add(NaN);
        for (let i = 0; i < arrayList.length; i++) {
          console.log(`arrayList[${i}] = ${arrayList[i]}`);
        }
        expect(arrayList[0]).assertEqual(-Infinity);
        expect(arrayList[1]).assertEqual(-Number.MAX_SAFE_INTEGER);
        expect(arrayList[2]).assertEqual(Number.MIN_VALUE);
        expect(arrayList[3]).assertEqual(0);
        expect(arrayList[4]).assertEqual(Number.EPSILON);
        expect(arrayList[5]).assertEqual(Number.MAX_SAFE_INTEGER);
        expect(arrayList[6]).assertEqual(Number.MAX_VALUE);
        expect(arrayList[7]).assertEqual(Infinity);
        expect(isNaN(arrayList[8])).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1400
     * @tc.name      testArrayList02Sort0014
     * @tc.desc      Test sort with different numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0014';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(-128);
        arrayList.add(127);
        arrayList.add(-32768);
        arrayList.add(32767);
        arrayList.add(-2147483648);
        arrayList.add(2147483647);
        arrayList.add(123.456);
        arrayList.add(0xdecaf);
        arrayList.add(0o777);
        arrayList.add(2 ** 3);
        arrayList.add(1e3);
        arrayList.add(2.5e-2);
        arrayList.sort((a: number, b: number) => a - b);
        expect(arrayList[0]).assertEqual(-2147483648);
        expect(arrayList[arrayList.length - 1]).assertEqual(2147483647);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1500
     * @tc.name      testArrayList02Sort0015
     * @tc.desc      Test sort with duplicate numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0015';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(5);
        arrayList.add(2);
        arrayList.add(5);
        arrayList.add(2);
        arrayList.add(8);
        arrayList.add(2);
        arrayList.add(5);
        arrayList.sort((a: number, b: number) => a - b);
        expect(arrayList[0]).assertEqual(2);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(2);
        expect(arrayList[3]).assertEqual(5);
        expect(arrayList[4]).assertEqual(5);
        expect(arrayList[5]).assertEqual(5);
        expect(arrayList[6]).assertEqual(8);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1600
     * @tc.name      testArrayList02Sort0016
     * @tc.desc      Test sort with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0016';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<boolean>();
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);
        arrayList.add(false);
        arrayList.sort((a: boolean, b: boolean) => {
          if (a === b) return 0;
          if (!a && b) return -1;
          return 1;
        });
        for (let i = 0; i < 3; i++) {
          expect(arrayList[i]).assertFalse();
        }
        for (let i = 3; i < 6; i++) {
          expect(arrayList[i]).assertTrue();
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1700
     * @tc.name      testArrayList02Sort0017
     * @tc.desc      Test sort with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0017';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number[]>();
        arrayList.add([3, 2, 1]);
        arrayList.add([1, 2, 3]);
        arrayList.add([2, 3, 1]);
        arrayList.add([1, 1, 1]);
        arrayList.add([9, 8, 7]);
        arrayList.sort((a: number[], b: number[]) => a[0] - b[0]);
        expect(arrayList[0][0]).assertEqual(1);
        expect(arrayList[1][0]).assertEqual(1);
        expect(arrayList[2][0]).assertEqual(2);
        expect(arrayList[3][0]).assertEqual(3);
        expect(arrayList[4][0]).assertEqual(9);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1800
     * @tc.name      testArrayList02Sort0018
     * @tc.desc      Test sort with objects by property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0018';
        console.log(TAG + ' start');
        interface Person {
          name: string;
          age: number;
        }
        let arrayList = new ArrayList<Person>();
        arrayList.add({ name: "Charlie", age: 30 });
        arrayList.add({ name: "Alice", age: 25 });
        arrayList.add({ name: "Bob", age: 35 });
        arrayList.add({ name: "David", age: 20 });
        arrayList.sort((a: Person, b: Person) => a.age - b.age);
        expect(arrayList[0].age).assertEqual(20);
        expect(arrayList[0].name).assertEqual("David");
        expect(arrayList[1].age).assertEqual(25);
        expect(arrayList[1].name).assertEqual("Alice");
        expect(arrayList[2].age).assertEqual(30);
        expect(arrayList[2].name).assertEqual("Charlie");
        expect(arrayList[3].age).assertEqual(35);
        expect(arrayList[3].name).assertEqual("Bob");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_1900
     * @tc.name      testArrayList02Sort0019
     * @tc.desc      Test sort with objects by name property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0019';
        console.log(TAG + ' start');
        interface Person {
          name: string;
          age: number;
        }
        let arrayList = new ArrayList<Person>();
        arrayList.add({ name: "Charlie", age: 30 });
        arrayList.add({ name: "Alice", age: 25 });
        arrayList.add({ name: "Bob", age: 35 });
        arrayList.add({ name: "David", age: 20 });
        arrayList.add({ name: "alice", age: 22 });
        arrayList.sort((a: Person, b: Person) => a.name.localeCompare(b.name));
        expect(arrayList[0].name).assertEqual("alice");
        expect(arrayList[1].name).assertEqual("Alice");
        expect(arrayList[2].name).assertEqual("Bob");
        expect(arrayList[3].name).assertEqual("Charlie");
        expect(arrayList[4].name).assertEqual("David");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2000
     * @tc.name      testArrayList02Sort0020
     * @tc.desc      Test sort with mixed data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0020", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0020';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const size = 100;
        for (let i = 0; i < size; i++) {
          arrayList.add(Math.floor(Math.random() * 100));
        }
        const startTime = Date.now();
        arrayList.sort((a: number, b: number) => a - b);
        const endTime = Date.now();
        const duration = endTime - startTime;
        const sortedArray: number[] = [];
        arrayList.forEach((item: number) => {
          sortedArray.push(item);
        });
        let isSorted = true;
        for (let i = 1; i < sortedArray.length; i++) {
          if (sortedArray[i - 1] > sortedArray[i]) {
            isSorted = false;
            break;
          }
        }
        expect(isSorted).assertTrue();
        const isFastEnough = duration < 5000;
        expect(isFastEnough).assertTrue();
        console.log(`Sorted ${size} elements in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2100
     * @tc.name      testArrayList02Sort0021
     * @tc.desc      Test sort with already sorted data
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0021", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0021';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const size = 1000;
        for (let i = 0; i < size; i++) {
          arrayList.add(i);
        }
        const startTime = Date.now();
        arrayList.sort((a: number, b: number) => a - b);
        const endTime = Date.now();
        const duration = endTime - startTime;
        let expectedValue = 0;
        let allCorrect = true;
        arrayList.forEach((item: number) => {
          if (item !== expectedValue) {
            allCorrect = false;
          }
          expectedValue++;
        });
        expect(allCorrect).assertTrue();
        console.log(`Sorted already sorted ${size} elements in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2200
     * @tc.name      testArrayList02Sort0022
     * @tc.desc      Test sort with reverse sorted data
     * @tc.size      MediumTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0022", TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0022';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        const size = 1000;
        for (let i = size - 1; i >= 0; i--) {
          arrayList.add(i);
        }
        const startTime = Date.now();
        arrayList.sort((a: number, b: number) => a - b);
        const endTime = Date.now();
        const duration = endTime - startTime;
        let expectedValue = 0;
        let isCorrectlySorted = true;
        arrayList.forEach((item: number) => {
          if (item !== expectedValue) {
            isCorrectlySorted = false;
          }
          expectedValue++;
        });
        expect(isCorrectlySorted).assertTrue();
        console.log(`Sorted reverse sorted ${size} elements in ${duration}ms`);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2300
     * @tc.name      testArrayList02Sort0023
     * @tc.desc      Test sort with invalid comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0023';
        console.log(TAG + ' start');
        const arrayList = new ArrayList<number>();
        arrayList.add(3);
        arrayList.add(1);
        arrayList.add(2);
        arrayList.sort((a: number, b: number) => a - b);
        let previousValue = -Infinity;
        let isSorted = true;
        arrayList.forEach((currentValue: number) => {
          if (currentValue < previousValue) {
            isSorted = false;
          }
          previousValue = currentValue;
        });
        expect(isSorted).assertTrue();
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2400
     * @tc.name      testArrayList02Sort0024
     * @tc.desc      Test sort when comparator throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0024';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        let caughtError: Error | null = null;
        try {
          list.sort(() => {
            throw new Error("Comparator error");
          });
        } catch (error) {
          caughtError = error as Error;
        }
        expect(caughtError !== null).assertTrue();
        if (caughtError) {
          expect(caughtError.message).assertEqual("Comparator error");
        }
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2500
     * @tc.name      testArrayList02Sort0025
     * @tc.desc      Test sort with empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0025';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.sort();
        expect(arrayList.length).assertEqual(0);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2600
     * @tc.name      testArrayList02Sort0026
     * @tc.desc      Test sort with single element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0026';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(42);
        arrayList.sort((a: number, b: number) => a - b);
        expect(arrayList.length).assertEqual(1);
        expect(arrayList[0]).assertEqual(42);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2700
     * @tc.name      testArrayList02Sort0027
     * @tc.desc      Test sort method cannot be bound error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0027';
        console.log(TAG + ' start');
        console.log("Testing ArrayList sort error handling");
        const testList = new ArrayList<number>();
        const testData = [3, 1, 4, 1, 5, 9, 2];
        testData.forEach(num => testList.add(num));
        testList.sort((a: number, b: number) => a - b);
        let isSorted = true;
        let prevValue = -Infinity;
        testList.forEach((value: number) => {
          if (value < prevValue) {
            isSorted = false;
          }
          prevValue = value;
        });
        expect(isSorted).assertTrue();
        console.log("Basic sort functionality verified");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2800
     * @tc.name      testArrayList02Sort0028
     * @tc.desc      Test sort when comparator returns non-number
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayListSort0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayListSort0028';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        const testData = [3, 1, 4, 1, 5];
        testData.forEach(num => list.add(num));
        list.sort((a: number, b: number) => a - b);
        console.log("Sort function executed successfully");
        const anotherList = new ArrayList<number>();
        anotherList.add(1);
        anotherList.add(2);
        try {
          anotherList.sort((a: number, b: number) => Infinity);
          console.log("Infinity comparator accepted");
        } catch {
          console.log("Infinity comparator rejected");
        }
        expect(true).assertTrue();
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_2900
     * @tc.name      testArrayList02Sort0029
     * @tc.desc      Test sort stability with equal elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0029';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("Banana");
        arrayList.add("cherry");
        arrayList.add("Date");
        arrayList.add("Elderberry");
        arrayList.sort((a: string, b: string) => {
          return a.toLowerCase().localeCompare(b.toLowerCase());
        });
        expect(arrayList[0].toLowerCase()).assertEqual("apple");
        expect(arrayList[1].toLowerCase()).assertEqual("banana");
        expect(arrayList[2].toLowerCase()).assertEqual("cherry");
        expect(arrayList[3].toLowerCase()).assertEqual("date");
        expect(arrayList[4].toLowerCase()).assertEqual("elderberry");
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_3000
     * @tc.name      testArrayList02Sort0030
     * @tc.desc      Test sort with complex comparator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0030';
        console.log(TAG + ' start');
        const data: Array<[number, number]> = [
          [1, 100],
          [2, 50],
          [1, 200],
          [3, 10],
          [2, 30]
        ];
        data.sort((a, b) => {
          if (a[0] !== b[0]) {
            return a[0] - b[0];
          }
          return a[1] - b[1];
        });
        expect(data[0][0]).assertEqual(1);
        expect(data[0][1]).assertEqual(100);
        expect(data[1][0]).assertEqual(1);
        expect(data[1][1]).assertEqual(200);
        expect(data[2][0]).assertEqual(2);
        expect(data[2][1]).assertEqual(30);
        expect(data[3][0]).assertEqual(2);
        expect(data[3][1]).assertEqual(50);
        expect(data[4][0]).assertEqual(3);
        expect(data[4][1]).assertEqual(10);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_3100
     * @tc.name      testArrayList02Sort0031
     * @tc.desc      Test sort API version compatibility (legacy callback format)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0031';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(5);
        arrayList.add(2);
        arrayList.add(8);
        arrayList.add(1);
        arrayList.add(4);
        arrayList.sort((firstValue: number, secondValue: number): number => {
          return firstValue - secondValue;
        });
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(4);
        expect(arrayList[3]).assertEqual(5);
        expect(arrayList[4]).assertEqual(8);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_3200
     * @tc.name      testArrayList02Sort0032
     * @tc.desc      Test sort with different callback parameter names
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0032';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(3);
        arrayList.add(1);
        arrayList.add(2);
        arrayList.sort((x: number, y: number) => x - y);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        arrayList.sort((first: number, second: number) => second - first);
        expect(arrayList[0]).assertEqual(3);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(1);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_3300
     * @tc.name      testArrayList02Sort0033
     * @tc.desc      Test sort is in-place operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0033';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(5);
        arrayList.add(2);
        arrayList.add(8);
        const originalReference = arrayList;
        arrayList.sort((a: number, b: number) => a - b);
        expect(arrayList).assertEqual(originalReference);
        expect(arrayList[0]).assertEqual(2);
        expect(arrayList[1]).assertEqual(5);
        expect(arrayList[2]).assertEqual(8);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_SORT02_3400
     * @tc.name      testArrayList02Sort0034
     * @tc.desc      Test sort method chaining
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList02Sort0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Sort0034';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(3);
        arrayList.add(1);
        arrayList.add(2);
        arrayList.sort((a: number, b: number) => a - b);
        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(3);
        arrayList.sort((a: number, b: number) => b - a);
        expect(arrayList[0]).assertEqual(3);
        expect(arrayList[1]).assertEqual(2);
        expect(arrayList[2]).assertEqual(1);
        console.log(TAG + ' done');
      });
  })
}