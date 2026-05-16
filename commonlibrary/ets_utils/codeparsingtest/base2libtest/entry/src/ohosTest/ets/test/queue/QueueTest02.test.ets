import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Queue, util } from '@kit.ArkTS';

interface GeneratedTypeLiteralInterface_1 {
  e: number;
}

interface GeneratedObjectLiteralInterface_1 {
  a: number;
  b: string;
}

interface GeneratedObjectLiteralInterface_2 {
  c: number[];
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Queue02Test() {
  describe('Queue02Test', () => {
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
     * @tc.number    SUB_QUEUE_TEST02_0100
     * @tc.name      testQueue02Chapter0001
     * @tc.desc      Test forEach with queue containing emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0001';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let emojis = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴"];

      emojis.forEach((emoji: string): void => {
        queue.add(emoji);
      });

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(emojis.length);
      expect(collected[0]).assertEqual("👆");
      expect(collected[11]).assertEqual("🏴");
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_0200
     * @tc.name      testQueue02Chapter0002
     * @tc.desc      Test forEach with queue containing illegal unicode sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0002';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let illegalUnicode = ["\\udc04", "\\ud83d", "\\udff4"];

      illegalUnicode.forEach((seq: string): void => {
        queue.add(seq);
      });

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(illegalUnicode.length);
      expect(collected[0]).assertEqual("\\udc04");
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_0300
     * @tc.name      testQueue02Chapter0003
     * @tc.desc      Test forEach with queue containing keywords as strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0003';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let keywords = ["0", "NaN", "Infinity", "null", "undefined", "true", "false"];

      keywords.forEach((keyword: string): void => {
        queue.add(keyword);
      });

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(keywords.length);
      expect(collected[0]).assertEqual("0");
      expect(collected[2]).assertEqual("Infinity");
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_0400
     * @tc.name      testQueue02Chapter0004
     * @tc.desc      Test forEach with large string in queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0004';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let largeString = "a".repeat(10000);
      queue.add(largeString);
      queue.add("normal");

      let lengths: number[] = [];
      queue.forEach((value: string): void => {
        lengths.push(value.length);
      });

      expect(lengths.length).assertEqual(2);
      expect(lengths[0]).assertEqual(10000);
      expect(lengths[1]).assertEqual(6);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_0500
     * @tc.name      testQueue02Chapter0005
     * @tc.desc      Test forEach with various number types in queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0005';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(0);
      queue.add(NaN);
      queue.add(-0);
      queue.add(Infinity);
      queue.add(-Infinity);
      queue.add(1.5);
      queue.add(Number.MAX_VALUE);
      queue.add(Number.MIN_VALUE);
      queue.add(Number.EPSILON);
      queue.add(Number.MAX_SAFE_INTEGER);
      queue.add(Number.MIN_SAFE_INTEGER);
      queue.add(-128);
      queue.add(127);
      queue.add(-32768);
      queue.add(32767);
      queue.add(-2147483548);
      queue.add(2147483547);
      queue.add(-9223372035854775808);
      queue.add(9223372035854775807);

      let count = 0;
      let hasNaN = false;
      let hasInfinity = false;

      queue.forEach((value: number): void => {
        count++;
        if (isNaN(value)) {
          hasNaN = true;
        }
        if (value === Infinity) {
          hasInfinity = true;
        }
      });

      expect(count).assertEqual(19);
      expect(hasNaN).assertTrue();
      expect(hasInfinity).assertTrue();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_0600
     * @tc.name      testQueue02Chapter0006
     * @tc.desc      Test forEach with queue containing boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0006';
      console.log(TAG + ' start');
      let queue = new Queue<boolean>();
      queue.add(true);
      queue.add(false);
      queue.add(true);
      queue.add(false);

      let trueCount = 0;
      let falseCount = 0;

      queue.forEach((value: boolean): void => {
        if (value === true) {
          trueCount++;
        } else {
          falseCount++;
        }
      });

      expect(trueCount).assertEqual(2);
      expect(falseCount).assertEqual(2);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_0700
     * @tc.name      testQueue02Chapter0007
     * @tc.desc      Test forEach with queue containing array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0007';
      console.log(TAG + ' start');
      let queue = new Queue<number[]>();
      queue.add([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      queue.add([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      queue.add([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);

      let totalLength = 0;
      queue.forEach((arr: number[]): void => {
        totalLength += arr.length;
      });

      expect(totalLength).assertEqual(14 + 19 + 14);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_0800
     * @tc.name      testQueue02Chapter0008
     * @tc.desc      Test forEach with queue containing arrays with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0008';
      console.log(TAG + ' start');
      let queue = new Queue<number[]>();
      queue.add([72, 101, NaN, Infinity, 108, 111]);
      queue.add([]);
      queue.add([256, 65535, 32768]);

      let totalLength = 0;
      let hasNaN = false;
      let hasInfinity = false;

      queue.forEach((arr: number[]): void => {
        totalLength += arr.length;
        arr.forEach((num: number): void => {
          if (isNaN(num)) {
            hasNaN = true;
          }
          if (num === Infinity) {
            hasInfinity = true;
          }
        });
      });

      expect(totalLength).assertEqual(6 + 0 + 3);
      expect(hasNaN).assertTrue();
      expect(hasInfinity).assertTrue();
    });
    /**
     * @tc.number    SUB_QUEUE_TEST02_0900
     * @tc.name      testQueue02Chapter0009
     * @tc.desc      Test forEach with queue containing complex objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0009';
      console.log(TAG + ' start');

      interface NestedObject {
        c: number;
        d: GeneratedTypeLiteralInterface_1;
      }

      interface ComplexObject {
        a?: number | null;
        b?: number;
      }

      interface TypedArrayObject {
        buffer: Uint8Array;
      }

      interface MapObject {
        map: Map<string, string>;
      }

      interface SetObject {
        set: Set<number>;
      }

      interface RegexObject {
        regex: RegExp;
        flags: RegExp;
      }

      let queue = new Queue<ComplexObject>();
      let obj1: ComplexObject = { a: 1, b: 2 };
      queue.add(obj1);

      let obj2: ComplexObject = { a: null, b: 2 };
      queue.add(obj2);

      let obj3: ComplexObject = { a: undefined, b: 2 };
      queue.add(obj3);

      let obj4: ComplexObject = { a: NaN, b: 2 };
      queue.add(obj4);

      let obj5: ComplexObject = { a: Infinity, b: 2 };
      queue.add(obj5);

      let queue2 = new Queue<object>();
      let typedArrayObj: TypedArrayObject = { buffer: new Uint8Array([72, 101, 108, 108, 111]) };
      queue2.add(typedArrayObj);

      let mapObj: MapObject = { map: new Map([['key1', 'value1'], ['key2', 'value2']]) };
      queue2.add(mapObj);

      let setObj: SetObject = { set: new Set([1, 2, 3, 2, 1]) };
      queue2.add(setObj);

      let regexObj: RegexObject = { regex: /abc/gi, flags: /def/m };
      queue2.add(regexObj);

      let count = 0;
      queue.forEach((): void => {
        count++;
      });

      let count2 = 0;
      queue2.forEach((): void => {
        count2++;
      });

      expect(count).assertEqual(5);
      expect(count2).assertEqual(4);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1000
     * @tc.name      testQueue02Chapter0010
     * @tc.desc      Test forEach callback modifying queue elements (should not affect iteration)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0010';
      console.log(TAG + ' start');

      interface MutableObject {
        value: number;
      }

      let queue = new Queue<MutableObject>();
      let obj1: MutableObject = { value: 1 };
      let obj2: MutableObject = { value: 2 };
      let obj3: MutableObject = { value: 3 };
      queue.add(obj1);
      queue.add(obj2);
      queue.add(obj3);

      let originalValues: number[] = [];
      queue.forEach((obj: MutableObject): void => {
        originalValues.push(obj.value);
        obj.value = obj.value * 10;
      });

      let modifiedValues: number[] = [];
      queue.forEach((obj: MutableObject): void => {
        modifiedValues.push(obj.value);
      });

      expect(originalValues).assertDeepEquals([1, 2, 3]);
      expect(modifiedValues).assertDeepEquals([10, 20, 30]);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1100
     * @tc.name      testQueue02Chapter0011
     * @tc.desc      Test forEach with queue containing mixed types using multiple queues
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0011';
      console.log(TAG + ' start');

      let numberQueue = new Queue<number>();
      numberQueue.add(1);

      let stringQueue = new Queue<string>();
      stringQueue.add("string");

      let booleanQueue = new Queue<boolean>();
      booleanQueue.add(true);

      let nullQueue = new Queue<null>();
      nullQueue.add(null);

      let undefinedQueue = new Queue<undefined>();
      undefinedQueue.add(undefined);

      let arrayQueue = new Queue<number[]>();
      arrayQueue.add([1, 2, 3]);

      let objectQueue = new Queue<object>();
      objectQueue.add({ a: 1 });

      let numberCount = 0;
      numberQueue.forEach((): void => {
        numberCount++;
      });

      let stringCount = 0;
      stringQueue.forEach((): void => {
        stringCount++;
      });

      let booleanCount = 0;
      booleanQueue.forEach((): void => {
        booleanCount++;
      });

      let nullCount = 0;
      nullQueue.forEach((): void => {
        nullCount++;
      });

      let undefinedCount = 0;
      undefinedQueue.forEach((): void => {
        undefinedCount++;
      });

      let arrayCount = 0;
      arrayQueue.forEach((): void => {
        arrayCount++;
      });

      let objectCount = 0;
      objectQueue.forEach((): void => {
        objectCount++;
      });

      expect(numberCount).assertEqual(1);
      expect(stringCount).assertEqual(1);
      expect(booleanCount).assertEqual(1);
      expect(nullCount).assertEqual(1);
      expect(undefinedCount).assertEqual(1);
      expect(arrayCount).assertEqual(1);
      expect(objectCount).assertEqual(1);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1200
     * @tc.name      testQueue02Chapter0012
     * @tc.desc      Test forEach with extremely large queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0012';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      const LARGE_SIZE = 5000;

      for (let i = 0; i < LARGE_SIZE; i++) {
        queue.add(i * 2);
      }

      let sum = 0;
      let count = 0;

      queue.forEach((value: number): void => {
        sum += value;
        count++;
      });

      const expectedSum = (LARGE_SIZE - 1) * LARGE_SIZE;
      expect(count).assertEqual(LARGE_SIZE);
      expect(sum).assertEqual(expectedSum);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1300
     * @tc.name      testQueue02Chapter0013
     * @tc.desc      Test forEach with callback that uses all three parameters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0013';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      queue.add("apple");
      queue.add("banana");
      queue.add("cherry");

      let result: string[] = [];
      queue.forEach((value: string, index: number, q: Queue<string>): void => {
        result.push(`${index}:${value}:${q.length}`);
      });

      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual("0:apple:3");
      expect(result[1]).assertEqual("1:banana:3");
      expect(result[2]).assertEqual("2:cherry:3");
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1400
     * @tc.name      testQueue02Chapter0014
     * @tc.desc      Test forEach with arrow function that captures outer scope
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0014';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(10);
      queue.add(20);
      queue.add(30);

      let multiplier = 5;
      let results: number[] = [];

      queue.forEach((value: number): void => {
        results.push(value * multiplier);
      });

      expect(results).assertDeepEquals([50, 100, 150]);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1500
     * @tc.name      testQueue02Chapter0015
     * @tc.desc      Negative test: forEach with callback that throws TypeError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0015';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(1);
      queue.add(2);

      let errorCaught = false;
      try {
        queue.forEach((value: number): void => {
          throw new TypeError("Custom type error");
        });
      } catch (error) {
        errorCaught = true;
        expect((error as Error).message).assertEqual("Custom type error");
      }

      expect(errorCaught).assertTrue();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1600
     * @tc.name      testQueue02Chapter0016
     * @tc.desc      Test forEach with queue containing special string characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0016';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";

      for (let char of specialChars) {
        queue.add(char);
      }

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(specialChars.length);
      expect(collected.join('')).assertEqual(specialChars);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1700
     * @tc.name      testQueue02Chapter0017
     * @tc.desc      Test forEach with queue containing ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0017';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let asciiChars =
        "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

      for (let char of asciiChars) {
        queue.add(char);
      }

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(asciiChars.length);
      expect(collected.join('')).assertEqual(asciiChars);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1800
     * @tc.name      testQueue02Chapter0018
     * @tc.desc      Test forEach with queue containing escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0018';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      let escapeSequences = ["\\a", "\\b", "\\f", "\\n", "\\r", "\\t", "\\v", "\\\\", "\\'", '\\"', "\\?", "\\0"];

      escapeSequences.forEach((seq: string): void => {
        queue.add(seq);
      });

      let collected: string[] = [];
      queue.forEach((value: string): void => {
        collected.push(value);
      });

      expect(collected.length).assertEqual(escapeSequences.length);
      expect(collected[0]).assertEqual("\\a");
      expect(collected[10]).assertEqual("\\?");
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_1900
     * @tc.name      testQueue02Chapter0019
     * @tc.desc      Test [Symbol.iterator] method on empty queue
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0019';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      let iter = queue[Symbol.iterator]();
      let result = iter.next();
      expect(result.value).assertUndefined();
      expect(result.done).assertTrue();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2000
     * @tc.name      testQueue02Chapter0020
     * @tc.desc      Test [Symbol.iterator] method on queue with single element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0020';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(42);
      let iter = queue[Symbol.iterator]();
      let result1 = iter.next();
      let result2 = iter.next();
      expect(result1.value).assertEqual(42);
      expect(result1.done).assertFalse();
      expect(result2.value).assertUndefined();
      expect(result2.done).assertTrue();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2100
     * @tc.name      testQueue02Chapter0021
     * @tc.desc      Test [Symbol.iterator] method on queue with multiple elements using for-of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0021';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(2);
      queue.add(4);
      queue.add(5);
      queue.add(4);
      let expectedValues = [2, 4, 5, 4];
      let index = 0;
      for (let value of queue) {
        expect(value).assertEqual(expectedValues[index]);
        index++;
      }
      expect(index).assertEqual(4);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2200
     * @tc.name      testQueue02Chapter0022
     * @tc.desc      Test [Symbol.iterator] method on queue with multiple elements using manual iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0022';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(2);
      queue.add(4);
      queue.add(5);
      queue.add(4);
      let iter = queue[Symbol.iterator]();
      let temp = iter.next();
      let values: number[] = [];
      while (!temp.done) {
        values.push(temp.value);
        temp = iter.next();
      }
      expect(values.length).assertEqual(4);
      expect(values[0]).assertEqual(2);
      expect(values[1]).assertEqual(4);
      expect(values[2]).assertEqual(5);
      expect(values[3]).assertEqual(4);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2300
     * @tc.name      testQueue02Chapter0023
     * @tc.desc      Test [Symbol.iterator] method on queue with different data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0023';
      console.log(TAG + ' start');
      let queue = new Queue<string>();
      queue.add("hello");
      queue.add("world");
      queue.add("test");
      let iter = queue[Symbol.iterator]();
      let values: string[] = [];
      for (let value of queue) {
        values.push(value);
      }
      expect(values.length).assertEqual(3);
      expect(values[0]).assertEqual("hello");
      expect(values[1]).assertEqual("world");
      expect(values[2]).assertEqual("test");
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2400
     * @tc.name      testQueue02Chapter0024
     * @tc.desc      Test [Symbol.iterator] method on queue with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0024';
      console.log(TAG + ' start');
      let queue = new Queue<boolean>();
      queue.add(true);
      queue.add(false);
      queue.add(true);
      let iter = queue[Symbol.iterator]();
      let result1 = iter.next();
      let result2 = iter.next();
      let result3 = iter.next();
      let result4 = iter.next();
      expect(result1.value).assertTrue();
      expect(result2.value).assertFalse();
      expect(result3.value).assertTrue();
      expect(result4.done).assertTrue();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2500
     * @tc.name      testQueue02Chapter0025
     * @tc.desc      Test [Symbol.iterator] method on queue with object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0025';
      console.log(TAG + ' start');
      let queue = new Queue<object>();
      let obj1: GeneratedObjectLiteralInterface_1 = { a: 1, b: "test" };
      let obj2: GeneratedObjectLiteralInterface_2 = { c: [1, 2, 3] };
      queue.add(obj1);
      queue.add(obj2);
      let iter = queue[Symbol.iterator]();
      let values: object[] = [];
      for (let value of queue) {
        values.push(value);
      }
      expect(values.length).assertEqual(2);
      expect(values[0]).assertEqual(obj1);
      expect(values[1]).assertEqual(obj2);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2600
     * @tc.name      testQueue02Chapter0026
     * @tc.desc      Test [Symbol.iterator] method on queue after adding elements during iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0026';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(1);
      queue.add(2);
      let iter = queue[Symbol.iterator]();
      let result1 = iter.next();
      queue.add(3);
      let result2 = iter.next();
      let result3 = iter.next();
      expect(result1.value).assertEqual(1);
      expect(result2.value).assertEqual(2);
      expect(result3.done).assertFalse();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2700
     * @tc.name      testQueue02Chapter0027
     * @tc.desc      Test [Symbol.iterator] method returns independent iterators
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0027';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(1);
      queue.add(2);
      let iter1 = queue[Symbol.iterator]();
      let iter2 = queue[Symbol.iterator]();
      let result1 = iter1.next();
      let result2 = iter2.next();
      expect(result1.value).assertEqual(1);
      expect(result2.value).assertEqual(1);
      result1 = iter1.next();
      result2 = iter2.next();
      expect(result1.value).assertEqual(2);
      expect(result2.value).assertEqual(2);
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2800
     * @tc.name      testQueue02Chapter0028
     * @tc.desc      Test [Symbol.iterator] method on queue with NaN and Infinity values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0028';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(NaN);
      queue.add(Infinity);
      queue.add(-Infinity);
      let iter = queue[Symbol.iterator]();
      let result1 = iter.next();
      let result2 = iter.next();
      let result3 = iter.next();
      let result4 = iter.next();
      expect(result1.value).assertNaN();
      expect(result2.value).assertEqual(Infinity);
      expect(result3.value).assertEqual(-Infinity);
      expect(result4.done).assertTrue();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_2900
     * @tc.name      testQueue02Chapter0029
     * @tc.desc      Test [Symbol.iterator] method on queue with large number of elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0029';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      let count = 100;
      for (let i = 0; i < count; i++) {
        queue.add(i);
      }
      let iter = queue[Symbol.iterator]();
      let index = 0;
      let result = iter.next();
      while (!result.done) {
        expect(result.value).assertEqual(index);
        index++;
        result = iter.next();
      }
      expect(index).assertEqual(count);
    });
    /**
     * @tc.number    SUB_QUEUE_TEST02_3000
     * @tc.name      testQueue02Chapter0030
     * @tc.desc      Test [Symbol.iterator] method on queue with null and undefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0030';
      console.log(TAG + ' start');
      let queue = new Queue<number | null | undefined>();
      queue.add(null);
      queue.add(undefined);
      queue.add(5);
      let iter = queue[Symbol.iterator]();
      let result1 = iter.next();
      let result2 = iter.next();
      let result3 = iter.next();
      let result4 = iter.next();
      expect(result1.value).assertNull();
      expect(result2.value).assertUndefined();
      expect(result3.value).assertEqual(5);
      expect(result4.done).assertTrue();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_3100
     * @tc.name      testQueue02Chapter0031
     * @tc.desc      Test [Symbol.iterator] method on queue with duplicate values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0031';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(5);
      queue.add(5);
      queue.add(5);
      let iter = queue[Symbol.iterator]();
      let result1 = iter.next();
      let result2 = iter.next();
      let result3 = iter.next();
      let result4 = iter.next();
      expect(result1.value).assertEqual(5);
      expect(result2.value).assertEqual(5);
      expect(result3.value).assertEqual(5);
      expect(result4.done).assertTrue();
    });

    /**
     * @tc.number    SUB_QUEUE_TEST02_3200
     * @tc.name      testQueue02Chapter0032
     * @tc.desc      Test [Symbol.iterator] method iterator can be used in spread operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testQueue02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testQueue02Chapter0032';
      console.log(TAG + ' start');
      let queue = new Queue<number>();
      queue.add(1);
      queue.add(2);
      queue.add(3);
      let array: number[] = [];
      for (let item of queue) {
        array.push(item);
      }
      expect(array.length).assertEqual(3);
      expect(array[0]).assertEqual(1);
      expect(array[1]).assertEqual(2);
      expect(array[2]).assertEqual(3);
    });

  })
}