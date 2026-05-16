import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import Stack from '@ohos.util.Stack';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Stack04Test() {
  describe('Stack04Test', () => {
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
     * @tc.number    SUB_STACK_TEST04_0100
     * @tc.name      testStack04Chapter0001
     * @tc.desc      Verify that isEmpty returns true for newly created empty stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0001';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      let result: boolean = stack.isEmpty();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_STACK_TEST04_0200
     * @tc.name      testStack04Chapter0002
     * @tc.desc      Verify that isEmpty returns false for stack with elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0002';
      console.log(TAG + ' start');
      let stack: Stack<string> = new Stack();
      stack.push("item");
      let result: boolean = stack.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_STACK_TEST04_0300
     * @tc.name      testStack04Chapter0003
     * @tc.desc      Verify that isEmpty returns true after pushing and popping all elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0003';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      stack.push(1);
      stack.push(2);
      stack.pop();
      stack.pop();
      let result: boolean = stack.isEmpty();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_STACK_TEST04_0400
     * @tc.name      testStack04Chapter0004
     * @tc.desc      Verify that isEmpty returns false after pushing elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0004';
      console.log(TAG + ' start');
      let stack: Stack<boolean> = new Stack();
      stack.push(true);
      stack.push(false);
      let result: boolean = stack.isEmpty();
      expect(result).assertFalse();
    });

    /**
     * @tc.number    SUB_STACK_TEST04_0500
     * @tc.name      testStack04Chapter0005
     * @tc.desc      Verify that isEmpty returns false for stack with null and undefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0005';
      console.log(TAG + ' start');
      let stack1: Stack<number | null> = new Stack();
      stack1.push(null);
      let result1: boolean = stack1.isEmpty();
      expect(result1).assertFalse();

      let stack2: Stack<string | undefined> = new Stack();
      stack2.push(undefined);
      let result2: boolean = stack2.isEmpty();
      expect(result2).assertFalse();
    });

    /**
     * @tc.number    SUB_STACK_TEST04_0600
     * @tc.name      testStack04Chapter0006
     * @tc.desc      Verify that Symbol.iterator works correctly with empty stack using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0006';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      let count: number = 0;
      for (let value of stack) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_0700
     * @tc.name      testStack04Chapter0007
     * @tc.desc      Verify that Symbol.iterator works correctly with number stack using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0007';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      stack.push(4);
      let expected: number[] = [2, 4, 5, 4];
      let actual: number[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      for (let i: number = 0; i < expected.length; i++) {
        expect(actual[i]).assertEqual(expected[i]);
      }
      expect(actual.length).assertEqual(expected.length);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_0800
     * @tc.name      testStack04Chapter0008
     * @tc.desc      Verify that Symbol.iterator works correctly with string stack using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0008';
      console.log(TAG + ' start');
      let stack: Stack<string> = new Stack();
      stack.push("hello");
      stack.push("world");
      stack.push("test");
      let expected: string[] = ["hello", "world", "test"];
      let actual: string[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      for (let i: number = 0; i < expected.length; i++) {
        expect(actual[i]).assertEqual(expected[i]);
      }
      expect(actual.length).assertEqual(expected.length);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_0900
     * @tc.name      testStack04Chapter0009
     * @tc.desc      Verify that Symbol.iterator works correctly with boolean stack using for...of loop
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0009';
      console.log(TAG + ' start');
      let stack: Stack<boolean> = new Stack();
      stack.push(true);
      stack.push(false);
      stack.push(true);
      let expected: boolean[] = [true, false, true];
      let actual: boolean[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      for (let i: number = 0; i < expected.length; i++) {
        expect(actual[i]).assertEqual(expected[i]);
      }
      expect(actual.length).assertEqual(expected.length);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1000
     * @tc.name      testStack04Chapter0010
     * @tc.desc      Verify that Symbol.iterator returns correct iterator for empty stack using manual iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0010';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      let iter: IterableIterator<number> = stack[Symbol.iterator]();
      let firstItem: IteratorResult<number> = iter.next();
      expect(firstItem.done).assertTrue();
      expect(firstItem.value).assertUndefined();
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1100
     * @tc.name      testStack04Chapter0011
     * @tc.desc      Verify that Symbol.iterator returns correct iterator for number stack using manual iteration
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0011';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      let iter: IterableIterator<number> = stack[Symbol.iterator]();
      let item1: IteratorResult<number> = iter.next();
      expect(item1.done).assertFalse();
      expect(item1.value).assertEqual(2);
      let item2: IteratorResult<number> = iter.next();
      expect(item2.done).assertFalse();
      expect(item2.value).assertEqual(4);
      let item3: IteratorResult<number> = iter.next();
      expect(item3.done).assertFalse();
      expect(item3.value).assertEqual(5);
      let item4: IteratorResult<number> = iter.next();
      expect(item4.done).assertTrue();
      expect(item4.value).assertUndefined();
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1200
     * @tc.name      testStack04Chapter0012
     * @tc.desc      Verify that Symbol.iterator works correctly with special number values including NaN, Infinity, -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0012';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      stack.push(NaN);
      stack.push(Infinity);
      stack.push(-Infinity);
      stack.push(0);
      stack.push(-0);
      let actual: number[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      expect(actual[0]).assertNaN();
      expect(actual[1]).assertEqual(Infinity);
      expect(actual[2]).assertEqual(-Infinity);
      expect(actual[3]).assertEqual(0);
      expect(actual[4]).assertEqual(-0);
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1300
     * @tc.name      testStack04Chapter0013
     * @tc.desc      Verify that Symbol.iterator works correctly with maximum and minimum safe integer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0013';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      stack.push(Number.MAX_SAFE_INTEGER);
      stack.push(Number.MIN_SAFE_INTEGER);
      stack.push(Number.MAX_VALUE);
      stack.push(Number.MIN_VALUE);
      let actual: number[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      expect(actual[0]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(actual[1]).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(actual[2]).assertEqual(Number.MAX_VALUE);
      expect(actual[3]).assertEqual(Number.MIN_VALUE);
      expect(actual.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1400
     * @tc.name      testStack04Chapter0014
     * @tc.desc      Verify that Symbol.iterator works correctly with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0014';
      console.log(TAG + ' start');
      let stack: Stack<bigint> = new Stack();
      stack.push(9007199254740991n);
      stack.push(1000000000000000n);
      let expected: bigint[] = [9007199254740991n, 1000000000000000n];
      let actual: bigint[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      for (let i: number = 0; i < expected.length; i++) {
        expect(actual[i]).assertEqual(expected[i]);
      }
      expect(actual.length).assertEqual(expected.length);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1500
     * @tc.name      testStack04Chapter0015
     * @tc.desc      Verify that Symbol.iterator works correctly with string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0015';
      console.log(TAG + ' start');
      let stack: Stack<string> = new Stack();
      stack.push("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      stack.push("");
      stack.push("null");
      stack.push("undefined");
      stack.push("NaN");
      let actual: string[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      expect(actual[0]).assertEqual("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(actual[1]).assertEqual("");
      expect(actual[2]).assertEqual("null");
      expect(actual[3]).assertEqual("undefined");
      expect(actual[4]).assertEqual("NaN");
      expect(actual.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1600
     * @tc.name      testStack04Chapter0016
     * @tc.desc      Verify that Symbol.iterator works correctly with array values containing various data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0016';
      console.log(TAG + ' start');
      let stack: Stack<number[]> = new Stack();
      let arr1: number[] = [72, 101, 108, 108, 111];
      let arr2: number[] = [0, 0, 0, 0, 0];
      let arr3: number[] = [72, 101, -108, 108, -111];
      let arr4: number[] = [72, 101, NaN, Infinity, 108];
      stack.push(arr1);
      stack.push(arr2);
      stack.push(arr3);
      stack.push(arr4);
      let actual: number[][] = [];
      for (let value of stack) {
        actual.push(value);
      }
      expect(JSON.stringify(actual[0])).assertEqual(JSON.stringify(arr1));
      expect(JSON.stringify(actual[1])).assertEqual(JSON.stringify(arr2));
      expect(JSON.stringify(actual[2])).assertEqual(JSON.stringify(arr3));
      expect(actual[3][0]).assertEqual(72);
      expect(actual[3][1]).assertEqual(101);
      expect(actual[3][2]).assertNaN();
      expect(actual[3][3]).assertEqual(Infinity);
      expect(actual[3][4]).assertEqual(108);
      expect(actual.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1700
     * @tc.name      testStack04Chapter0017
     * @tc.desc      Verify that Symbol.iterator works correctly with object values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0017';
      console.log(TAG + ' start');

      interface TestObject1 {
        a: number;
        b: string;
        c: number[];
      }

      interface TestObject2 {
        a: number;
        b: null;
      }

      interface TestObject3 {
        a: number;
        b: number;
      }

      let stack: Stack<TestObject1 | TestObject2 | TestObject3> = new Stack();
      let obj1: TestObject1 = {a: 1, b: "test", c: [1, 2, 3]};
      let obj2: TestObject2 = {a: 0, b: null};
      let obj3: TestObject3 = {a: NaN, b: Infinity};
      stack.push(obj1);
      stack.push(obj2);
      stack.push(obj3);
      let actual: (TestObject1 | TestObject2 | TestObject3)[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      expect(JSON.stringify(actual[0])).assertEqual(JSON.stringify(obj1));
      expect(JSON.stringify(actual[1])).assertEqual(JSON.stringify(obj2));
      expect(JSON.stringify(actual[2])).assertEqual(JSON.stringify(obj3));
      expect(actual.length).assertEqual(3);
    });


    /**
     * @tc.number    SUB_STACK_TEST04_1800
     * @tc.name      testStack04Chapter0018
     * @tc.desc      Verify that Symbol.iterator works correctly with TypedArray values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0018';
      console.log(TAG + ' start');
      let stack: Stack<Uint8Array> = new Stack();
      let arr1: Uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      let arr2: Uint8Array = new Uint8Array([0, 255]);
      let arr3: Uint8Array = new Uint8Array([-1, 256]);
      stack.push(arr1);
      stack.push(arr2);
      stack.push(arr3);
      let actual: Uint8Array[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      expect(JSON.stringify(actual[0])).assertEqual(JSON.stringify(arr1));
      expect(JSON.stringify(actual[1])).assertEqual(JSON.stringify(arr2));
      expect(actual[2][0]).assertEqual(255);
      expect(actual[2][1]).assertEqual(0);
      expect(actual.length).assertEqual(3);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_1900
     * @tc.name      testStack04Chapter0019
     * @tc.desc      Verify that Symbol.iterator works correctly with ArrayBuffer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0019';
      console.log(TAG + ' start');
      let stack: Stack<ArrayBuffer> = new Stack();
      let buffer1: ArrayBuffer = new ArrayBuffer(16);
      let buffer2: ArrayBuffer = new ArrayBuffer(32);
      stack.push(buffer1);
      stack.push(buffer2);
      let actual: ArrayBuffer[] = [];
      for (let value of stack) {
        actual.push(value);
      }
      expect(actual[0]).assertEqual(buffer1);
      expect(actual[1]).assertEqual(buffer2);
      expect(actual.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_2000
     * @tc.name      testStack04Chapter0020
     * @tc.desc      Verify that Symbol.iterator returns correct iterator for large stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0020';
      console.log(TAG + ' start');
      let stack: Stack<number> = new Stack();
      let expectedCount: number = 100;
      for (let i: number = 0; i < expectedCount; i++) {
        stack.push(i);
      }
      let actualCount: number = 0;
      for (let value of stack) {
        actualCount++;
        expect(value).assertEqual(actualCount - 1);
      }
      expect(actualCount).assertEqual(expectedCount);
    });

    /**
     * @tc.number    SUB_STACK_TEST04_2100
     * @tc.name      testStack04Chapter0021
     * @tc.desc      Verify that Symbol.iterator works correctly with null and undefined values in stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack04Chapter0021';
      console.log(TAG + ' start');

      interface NumberOrNull {
        value: number | null;
      }

      interface StringOrUndefined {
        value: string | undefined;
      }

      let stack1: Stack<NumberOrNull> = new Stack();
      let item1: NumberOrNull = {value: null};
      let item2: NumberOrNull = {value: 1};
      stack1.push(item1);
      stack1.push(item2);
      let actual1: NumberOrNull[] = [];
      for (let value of stack1) {
        actual1.push(value);
      }
      expect(JSON.stringify(actual1[0])).assertEqual(JSON.stringify(item1));
      expect(JSON.stringify(actual1[1])).assertEqual(JSON.stringify(item2));
      expect(actual1.length).assertEqual(2);

      let stack2: Stack<StringOrUndefined> = new Stack();
      let item3: StringOrUndefined = {value: undefined};
      let item4: StringOrUndefined = {value: "test"};
      stack2.push(item3);
      stack2.push(item4);
      let actual2: StringOrUndefined[] = [];
      for (let value of stack2) {
        actual2.push(value);
      }
      expect(JSON.stringify(actual2[0])).assertEqual(JSON.stringify(item3));
      expect(JSON.stringify(actual2[1])).assertEqual(JSON.stringify(item4));
      expect(actual2.length).assertEqual(2);
    });

  })
}