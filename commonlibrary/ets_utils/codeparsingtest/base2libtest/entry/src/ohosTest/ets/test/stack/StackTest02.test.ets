import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { util } from '@kit.ArkTS';
import Stack from '@ohos.util.Stack';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Stack02Test() {
  describe('Stack02Test', () => {
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
     * @tc.number    SUB_STACK_TEST02_0100
     * @tc.name      testStack02Chapter0001
     * @tc.desc      Test peek method with empty stack, should return undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0001';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.peek();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_STACK_TEST02_0200
     * @tc.name      testStack02Chapter0002
     * @tc.desc      Test peek method with number elements (document example)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0002';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      stack.push(2);
      let result = stack.peek();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_0300
     * @tc.name      testStack02Chapter0003
     * @tc.desc      Test peek method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0003';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("hello");
      stack.push("world");
      let result = stack.peek();
      expect(result).assertEqual("world");
    });

    /**
     * @tc.number    SUB_STACK_TEST02_0400
     * @tc.name      testStack02Chapter0004
     * @tc.desc      Test peek method with boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0004';
      console.log(TAG + ' start');
      let stack = new Stack<boolean>();
      stack.push(false);
      stack.push(true);
      let result = stack.peek();
      expect(result).assertTrue();
    });

    /**
     * @tc.number    SUB_STACK_TEST02_0500
     * @tc.name      testStack02Chapter0005
     * @tc.desc      Test peek method with NaN value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0005';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(NaN);
      let result = stack.peek();
      expect(isNaN(result as number)).assertTrue();
    });

    /**
     * @tc.number    SUB_STACK_TEST02_0600
     * @tc.name      testStack02Chapter0006
     * @tc.desc      Test peek method with Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0006';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Infinity);
      let result = stack.peek();
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_0700
     * @tc.name      testStack02Chapter0007
     * @tc.desc      Test peek method with object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0007';
      console.log(TAG + ' start');
      interface TestObject {
        id: number;
        name: string;
      }
      let stack = new Stack<TestObject>();
      let obj1: TestObject = {id: 1, name: "first"};
      let obj2: TestObject = {id: 2, name: "second"};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.peek();
      expect(result.id).assertEqual(2);
      expect(result.name).assertEqual("second");
    });

    /**
     * @tc.number    SUB_STACK_TEST02_0800
     * @tc.name      testStack02Chapter0008
     * @tc.desc      Test peek method after pop operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0008';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(10);
      stack.push(20);
      stack.push(30);
      stack.pop();
      let result = stack.peek();
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_0900
     * @tc.name      testStack02Chapter0009
     * @tc.desc      Test peek method with null value (generic type includes null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0009';
      console.log(TAG + ' start');
      let stack = new Stack<number | null>();
      stack.push(null);
      stack.push(42);
      let result = stack.peek();
      expect(result).assertEqual(42);
      stack.pop();
      let result2 = stack.peek();
      expect(result2).assertNull();
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1000
     * @tc.name      testStack02Chapter0010
     * @tc.desc      Test peek method with undefined value (generic type includes undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0010';
      console.log(TAG + ' start');
      let stack = new Stack<number | undefined>();
      stack.push(undefined);
      let result = stack.peek();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1100
     * @tc.name      testStack02Chapter0011
     * @tc.desc      Test peek method after multiple pop operations (simulating clear)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0011';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      stack.pop();
      stack.pop();
      stack.pop();
      let result = stack.peek();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1200
     * @tc.name      testStack02Chapter0012
     * @tc.desc      Test peek method with negative zero value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0012';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-0);
      let result = stack.peek();
      expect(result).assertEqual(-0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1300
     * @tc.name      testStack02Chapter0013
     * @tc.desc      Test peek method with large integer value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0013';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.MAX_SAFE_INTEGER);
      let result = stack.peek();
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1400
     * @tc.name      testStack02Chapter0014
     * @tc.desc      Test peek method multiple times without modifying stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0014';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(100);
      let result1 = stack.peek();
      let result2 = stack.peek();
      let result3 = stack.peek();
      expect(result1).assertEqual(100);
      expect(result2).assertEqual(100);
      expect(result3).assertEqual(100);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1500
     * @tc.name      testStack02Chapter0015
     * @tc.desc      Test  method with empty stack
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0015';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      let result = stack.locate(5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1600
     * @tc.name      testStack02Chapter0016
     * @tc.desc      Test locate method with existing element (document example)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0016';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      stack.push(2);
      let result = stack.locate(5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1700
     * @tc.name      testStack02Chapter0017
     * @tc.desc      Test locate method with non-existing element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0017';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(2);
      stack.push(4);
      stack.push(5);
      let result = stack.locate(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1800
     * @tc.name      testStack02Chapter0018
     * @tc.desc      Test locate method with duplicate elements (should return first occurrence from top)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0018';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(2);
      stack.push(4);
      stack.push(2);
      stack.push(5);
      stack.push(2);

      let result = stack.locate(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_1900
     * @tc.name      testStack02Chapter0019
     * @tc.desc      Test locate method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0019';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("hello");
      stack.push("world");
      stack.push("test");
      let result1 = stack.locate("world");
      expect(result1).assertEqual(1);
      let result2 = stack.locate("notfound");
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2000
     * @tc.name      testStack02Chapter0020
     * @tc.desc      Test locate method with boolean elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0020';
      console.log(TAG + ' start');
      let stack = new Stack<boolean>();
      stack.push(true);
      stack.push(false);
      stack.push(true);
      let result1 = stack.locate(false);
      expect(result1).assertEqual(1);

      let result2 = stack.locate(true);
      expect(result2).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2100
     * @tc.name      testStack02Chapter0021
     * @tc.desc      Test locate method with NaN value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0021';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(NaN);
      stack.push(3);
      let result = stack.locate(NaN);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2200
     * @tc.name      testStack02Chapter0022
     * @tc.desc      Test locate method with Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0022';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(Infinity);
      stack.push(3);
      let result = stack.locate(Infinity);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2300
     * @tc.name      testStack02Chapter0023
     * @tc.desc      Test locate method with -Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0023';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(-Infinity);
      stack.push(3);
      let result = stack.locate(-Infinity);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2400
     * @tc.name      testStack02Chapter0024
     * @tc.desc      Test locate method with zero values (0 and -0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0024';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1);
      stack.push(0);
      stack.push(-0);
      stack.push(3);
      let result1 = stack.locate(0);
      let result2 = stack.locate(-0);
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2500
     * @tc.name      testStack02Chapter0025
     * @tc.desc      Test locate method with null value (when generic type includes null)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0025';
      console.log(TAG + ' start');
      let stack = new Stack<number | null>();
      stack.push(1);
      stack.push(null);
      stack.push(3);
      let result = stack.locate(null);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2600
     * @tc.name      testStack02Chapter0026
     * @tc.desc      Test locate method with undefined value (when generic type includes undefined)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0026';
      console.log(TAG + ' start');
      let stack = new Stack<number | undefined>();
      stack.push(1);
      stack.push(undefined);
      stack.push(3);
      let result = stack.locate(undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2700
     * @tc.name      testStack02Chapter0027
     * @tc.desc      Test locate method with object elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0027';
      console.log(TAG + ' start');
      interface TestObject {
        id: number;
        name: string;
      }
      let stack = new Stack<TestObject>();
      let obj1: TestObject = {id: 1, name: "first"};
      let obj2: TestObject = {id: 2, name: "second"};
      let obj3: TestObject = {id: 3, name: "third"};
      stack.push(obj1);
      stack.push(obj2);
      stack.push(obj3);
      let result = stack.locate(obj2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2800
     * @tc.name      testStack02Chapter0028
     * @tc.desc      Test locate method with large integer values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0028';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.MAX_SAFE_INTEGER);
      stack.push(Number.MIN_SAFE_INTEGER);
      stack.push(100);
      let result1 = stack.locate(Number.MAX_SAFE_INTEGER);
      let result2 = stack.locate(Number.MIN_SAFE_INTEGER);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_2900
     * @tc.name      testStack02Chapter0029
     * @tc.desc      Test locate method with Number.MAX_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0029';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.MAX_VALUE);
      stack.push(1);
      stack.push(2);
      let result = stack.locate(Number.MAX_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3000
     * @tc.name      testStack02Chapter0030
     * @tc.desc      Test locate method with Number.MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0030';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.MIN_VALUE);
      stack.push(1);
      stack.push(2);
      let result = stack.locate(Number.MIN_VALUE);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3100
     * @tc.name      testStack02Chapter0031
     * @tc.desc      Test locate method with Number.EPSILON
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0031';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Number.EPSILON);
      stack.push(1);
      stack.push(2);
      let result = stack.locate(Number.EPSILON);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3200
     * @tc.name      testStack02Chapter0032
     * @tc.desc      Test locate method with byte range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0032';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-128);
      stack.push(0);
      stack.push(127);
      let result1 = stack.locate(-128);
      let result2 = stack.locate(127);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3300
     * @tc.name      testStack02Chapter0033
     * @tc.desc      Test locate method with short range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0033';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-32768);
      stack.push(0);
      stack.push(32767);
      let result1 = stack.locate(-32768);
      let result2 = stack.locate(32767);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3400
     * @tc.name      testStack02Chapter0034
     * @tc.desc      Test locate method with int range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0034';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-2147483648);
      stack.push(0);
      stack.push(2147483647);
      let result1 = stack.locate(-2147483648);
      let result2 = stack.locate(2147483647);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3500
     * @tc.name      testStack02Chapter0035
     * @tc.desc      Test locate method with long range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0035';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(-9223372036854775808);
      stack.push(0);
      stack.push(9223372036854775807);
      let result1 = stack.locate(-9223372036854775808);
      let result2 = stack.locate(9223372036854775807);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3600
     * @tc.name      testStack02Chapter0036
     * @tc.desc      Test locate method with float range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0036';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(1.40129846432481707e-45);
      stack.push(3.40282346638528860e+38);
      stack.push(0);
      let result1 = stack.locate(1.40129846432481707e-45);
      let result2 = stack.locate(3.40282346638528860e+38);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3700
     * @tc.name      testStack02Chapter0037
     * @tc.desc      Test locate method with double range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0037';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(4.94065645841246544e-324);
      stack.push(1.79769313486231570e+308);
      stack.push(0);
      let result1 = stack.locate(4.94065645841246544e-324);
      let result2 = stack.locate(1.79769313486231570e+308);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3800
     * @tc.name      testStack02Chapter0038
     * @tc.desc      Test locate method with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0038';
      console.log(TAG + ' start');
      let stack = new Stack<bigint>();
      stack.push(9007199254740991n);
      stack.push(12345678901234567890n);
      stack.push(0n);
      let result1 = stack.locate(9007199254740991n);
      let result2 = stack.locate(12345678901234567890n);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_3900
     * @tc.name      testStack02Chapter0039
     * @tc.desc      Test locate method with hexadecimal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0039';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0x0102);
      stack.push(0x01020304);
      stack.push(0x3);
      stack.push(0);
      let result1 = stack.locate(0x0102);
      let result2 = stack.locate(0x01020304);
      let result3 = stack.locate(0x3);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4000
     * @tc.name      testStack02Chapter0040
     * @tc.desc      Test locate method with exponent values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0040';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(2 ** 3);
      stack.push(1e3);
      stack.push(2.5e-2);
      stack.push(0);
      let result1 = stack.locate(8);
      let result2 = stack.locate(1000);
      let result3 = stack.locate(0.025);
      expect(result1).assertEqual(-1);
      expect(result2).assertEqual(1);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4100
     * @tc.name      testStack02Chapter0041
     * @tc.desc      Test locate method with array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0041';
      console.log(TAG + ' start');
      let stack = new Stack<number[]>();
      let arr1: number[] = [1, 2, 3];
      let arr2: number[] = [4, 5, 6];
      let arr3: number[] = [7, 8, 9];
      stack.push(arr1);
      stack.push(arr2);
      stack.push(arr3);
      let result = stack.locate(arr2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4200
     * @tc.name      testStack02Chapter0042
     * @tc.desc      Test locate method with TypedArray elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0042';
      console.log(TAG + ' start');
      let stack = new Stack<Uint8Array>();
      let array1 = new Uint8Array([72, 101, 108, 108, 111]);
      let array2 = new Uint8Array([87, 111, 114, 108, 100]);
      let array3 = new Uint8Array([49, 50, 51, 63]);
      stack.push(array1);
      stack.push(array2);
      stack.push(array3);
      let result = stack.locate(array2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4300
     * @tc.name      testStack02Chapter0043
     * @tc.desc      Test locate method with special characters in strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0043';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      stack.push("test");
      stack.push("normal");
      let result = stack.locate("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4400
     * @tc.name      testStack02Chapter0044
     * @tc.desc      Test locate method with empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0044';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("");
      stack.push("hello");
      stack.push("world");
      let result = stack.locate("");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4500
     * @tc.name      testStack02Chapter0045
     * @tc.desc      Test locate method with special escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0045';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\n\t\r\\\"\'");
      stack.push("normal");
      stack.push("test");
      let result = stack.locate("\n\t\r\\\"\'");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4600
     * @tc.name      testStack02Chapter0046
     * @tc.desc      Test locate method with Map objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0046';
      console.log(TAG + ' start');
      let stack = new Stack<Map<string, number>>();
      let map1 = new Map<string, number>([["a", 1], ["b", 2]]);
      let map2 = new Map<string, number>([["c", 3], ["d", 4]]);
      let map3 = new Map<string, number>([["e", 5], ["f", 6]]);
      stack.push(map1);
      stack.push(map2);
      stack.push(map3);
      let result = stack.locate(map2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4700
     * @tc.name      testStack02Chapter0047
     * @tc.desc      Test locate method with Set objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0047';
      console.log(TAG + ' start');
      let stack = new Stack<Set<number>>();
      let set1 = new Set<number>([1, 2, 3]);
      let set2 = new Set<number>([4, 5, 6]);
      let set3 = new Set<number>([7, 8, 9]);
      stack.push(set1);
      stack.push(set2);
      stack.push(set3);
      let result = stack.locate(set2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4800
     * @tc.name      testStack02Chapter0048
     * @tc.desc      Test locate method after pop operation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0048';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(10);
      stack.push(20);
      stack.push(30);
      stack.push(40);
      stack.pop();
      let result1 = stack.locate(30);
      let result2 = stack.locate(40);
      expect(result1).assertEqual(2);
      expect(result2).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_4900
     * @tc.name      testStack02Chapter0049
     * @tc.desc      Test locate method with char range values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0049';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0);
      stack.push(32767);
      stack.push(65535);
      stack.push(100);
      let result1 = stack.locate(0);
      let result2 = stack.locate(65535);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5000
     * @tc.name      testStack02Chapter0050
     * @tc.desc      Test locate method with BigInt constructor values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0050';
      console.log(TAG + ' start');
      let stack = new Stack<bigint>();
      stack.push(BigInt(0xdecafafecacefade));
      stack.push(12345678901234567890n);
      stack.push(0n);
      let result = stack.locate(BigInt(0xdecafafecacefade));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5100
     * @tc.name      testStack02Chapter0051
     * @tc.desc      Test locate method with double precision values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0051';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(123.456);
      stack.push(789.012);
      stack.push(0);
      let result = stack.locate(123.456);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5200
     * @tc.name      testStack02Chapter0052
     * @tc.desc      Test locate method with float hex values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0052';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0xcafebabe);
      stack.push(0xdeadbeef);
      stack.push(0);
      let result = stack.locate(0xcafebabe);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5300
     * @tc.name      testStack02Chapter0053
     * @tc.desc      Test locate method with 8-bit values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0053';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(0x3);
      stack.push(0x7f);
      stack.push(0x80);
      stack.push(0);
      let result1 = stack.locate(0x3);
      let result2 = stack.locate(0x7f);
      let result3 = stack.locate(0x80);
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5400
     * @tc.name      testStack02Chapter0054
     * @tc.desc      Test locate method with Math.floor value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0054';
      console.log(TAG + ' start');
      let stack = new Stack<number>();
      stack.push(Math.floor(1.5));
      stack.push(2);
      stack.push(3);
      let result = stack.locate(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5500
     * @tc.name      testStack02Chapter0055
     * @tc.desc      Test locate method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0055';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
      stack.push("test");
      stack.push("normal");
      let asciiStr = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      let result = stack.locate(asciiStr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5600
     * @tc.name      testStack02Chapter0056
     * @tc.desc      Test locate method with repeated special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0056';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("!!\"\"##$$%%&&''(())**++,,\\--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
      stack.push("test");
      stack.push("normal");
      let specialStr = "!!\"\"##$$%%&&''(())**++,,\\--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
      let result = stack.locate(specialStr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5700
     * @tc.name      testStack02Chapter0057
     * @tc.desc      Test locate method with escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0057';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\x41");
      stack.push("\x42");
      stack.push("\x43");
      stack.push("test");
      let result1 = stack.locate("A");
      let result2 = stack.locate("B");
      let result3 = stack.locate("C");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5800
     * @tc.name      testStack02Chapter0058
     * @tc.desc      Test locate method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0058';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("👆");
      stack.push("👿");
      stack.push("👀");
      stack.push("test");
      let result1 = stack.locate("👆");
      let result2 = stack.locate("👀");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_5900
     * @tc.name      testStack02Chapter0059
     * @tc.desc      Test locate method with more emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0059';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("💯");
      stack.push("🎅");
      stack.push("😼");
      stack.push("test");
      let result1 = stack.locate("💯");
      let result2 = stack.locate("😼");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6000
     * @tc.name      testStack02Chapter0060
     * @tc.desc      Test locate method with complex emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0060';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("🔧");
      stack.push("💇");
      stack.push("🤼‍♂️");
      stack.push("test");
      let result1 = stack.locate("🔧");
      let result2 = stack.locate("🤼‍♂️");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6100
     * @tc.name      testStack02Chapter0061
     * @tc.desc      Test locate method with additional emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0061';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("🛢");
      stack.push("🀄");
      stack.push("🏴");
      stack.push("test");
      let result1 = stack.locate("🀄");
      let result2 = stack.locate("🏴");
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6200
     * @tc.name      testStack02Chapter0062
     * @tc.desc      Test locate method with Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0062';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\ud83d\udc46");
      stack.push("\ud83d\udc7f");
      stack.push("\ud83d\udc40");
      stack.push("test");
      let result1 = stack.locate("\ud83d\udc46");
      let result2 = stack.locate("\ud83d\udc40");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6300
     * @tc.name      testStack02Chapter0063
     * @tc.desc      Test locate method with more Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0063';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\ud83d\udcaf");
      stack.push("\ud83c\udf85");
      stack.push("\ud83d\ude3c");
      stack.push("test");
      let result1 = stack.locate("\ud83d\udcaf");
      let result2 = stack.locate("\ud83d\ude3c");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6400
     * @tc.name      testStack02Chapter0064
     * @tc.desc      Test locate method with additional Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0064';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\ud83d\udd27");
      stack.push("\ud83d\udc87");
      stack.push("\ud83e\udd3c\u200d\u2642\ufe0f");
      stack.push("test");
      let result1 = stack.locate("\ud83d\udd27");
      let result2 = stack.locate("\ud83e\udd3c\u200d\u2642\ufe0f");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6500
     * @tc.name      testStack02Chapter0065
     * @tc.desc      Test locate method with final Unicode escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0065';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\ud83d\udee2");
      stack.push("\ud83c\udc04");
      stack.push("\ud83c\udff4");
      stack.push("test");
      let result1 = stack.locate("\ud83c\udc04");
      let result2 = stack.locate("\ud83c\udff4");
      expect(result1).assertEqual(1);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6600
     * @tc.name      testStack02Chapter0066
     * @tc.desc      Test locate method with invalid Unicode sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0066';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("\udc04");
      stack.push("\ud83d");
      stack.push("\udff4");
      stack.push("test");
      let result1 = stack.locate("\udc04");
      let result2 = stack.locate("\udff4");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6700
     * @tc.name      testStack02Chapter0067
     * @tc.desc      Test locate method with keyword strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0067';
      console.log(TAG + ' start');
      let stack = new Stack<string>();
      stack.push("0");
      stack.push("NaN");
      stack.push("");
      stack.push("test");
      let result1 = stack.locate("0");
      let result2 = stack.locate("NaN");
      let result3 = stack.locate("");
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(1);
      expect(result3).assertEqual(2);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6800
     * @tc.name      testStack02Chapter0068
     * @tc.desc      Test locate method with normal Uint8Array array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0068';
      console.log(TAG + ' start');
      let stack = new Stack<Uint8Array>();
      let array1 = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      let array2 = new Uint8Array([65, 66, 67]);
      let array3 = new Uint8Array([1, 2, 3]);
      stack.push(array1);
      stack.push(array2);
      stack.push(array3);
      let result = stack.locate(array2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_6900
     * @tc.name      testStack02Chapter0069
     * @tc.desc      Test locate method with array containing multiple zeros
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0069';
      console.log(TAG + ' start');
      let stack = new Stack<Uint8Array>();
      let array = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      let array2 = new Uint8Array([1, 2, 3]);
      stack.push(array);
      stack.push(array2);
      let result = stack.locate(array);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7000
     * @tc.name      testStack02Chapter0070
     * @tc.desc      Test locate method with array containing negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0070';
      console.log(TAG + ' start');
      interface NumberArray {
        values: number[];
      }
      let stack = new Stack<NumberArray>();
      let array: NumberArray = {values: [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]};
      let array2: NumberArray = {values: [1, 2, 3]};
      stack.push(array);
      stack.push(array2);
      let result = stack.locate(array);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7100
     * @tc.name      testStack02Chapter0071
     * @tc.desc      Test locate method with array containing NaN/Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0071';
      console.log(TAG + ' start');
      interface MixedArray {
        values: number[];
      }
      let stack = new Stack<MixedArray>();
      let array: MixedArray = {values: [72, 101, NaN, Infinity, 108, 111]};
      let array2: MixedArray = {values: [1, 2, 3]};
      stack.push(array);
      stack.push(array2);
      let result = stack.locate(array);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7200
     * @tc.name      testStack02Chapter0072
     * @tc.desc      Test locate method with array containing non-numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0072';
      console.log(TAG + ' start');
      interface MixedValueArray {
        data: (number | string | boolean | null | undefined)[];
      }
      let stack = new Stack<MixedValueArray>();
      let array: MixedValueArray = {data: [72, "abc", true, null, undefined, 108]};
      let array2: MixedValueArray = {data: [1, 2, 3]};
      stack.push(array);
      stack.push(array2);
      let result = stack.locate(array);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7300
     * @tc.name      testStack02Chapter0073
     * @tc.desc      Test locate method with empty array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0073';
      console.log(TAG + ' start');
      interface NumberArray {
        values: number[];
      }
      let stack = new Stack<NumberArray>();
      let array1: NumberArray = {values: []};
      let array2: NumberArray = {values: [1, 2, 3]};
      stack.push(array1);
      stack.push(array2);
      let result = stack.locate(array1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7400
     * @tc.name      testStack02Chapter0074
     * @tc.desc      Test locate method with array containing overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0074';
      console.log(TAG + ' start');
      interface NumberArray {
        values: number[];
      }
      let stack = new Stack<NumberArray>();
      let array: NumberArray = {values: [256, 65536, 32768]};
      let array2: NumberArray = {values: [1, 2, 3]};
      stack.push(array);
      stack.push(array2);
      let result = stack.locate(array);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7500
     * @tc.name      testStack02Chapter0075
     * @tc.desc      Test locate method with ordinary object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0075';
      console.log(TAG + ' start');
      interface TestObject {
        a: number;
        b: string;
        c: number[];
      }
      let stack = new Stack<TestObject>();
      let obj1: TestObject = {a: 1, b: "test", c: [1, 2, 3]};
      let obj2: TestObject = {a: 10, b: "test2", c: [4, 5]};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7600
     * @tc.name      testStack02Chapter0076
     * @tc.desc      Test locate method with nested object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0076';
      console.log(TAG + ' start');
      interface InnerObject {
        e: number;
      }
      interface MiddleObject {
        c: number;
        d: InnerObject;
      }
      interface NestedObject {
        a: number;
        b: MiddleObject;
      }
      let stack = new Stack<NestedObject>();
      let inner1: InnerObject = {e: 3};
      let middle1: MiddleObject = {c: 2, d: inner1};
      let obj1: NestedObject = {a: 1, b: middle1};
      let inner2: InnerObject = {e: 30};
      let middle2: MiddleObject = {c: 20, d: inner2};
      let obj2: NestedObject = {a: 10, b: middle2};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7700
     * @tc.name      testStack02Chapter0077
     * @tc.desc      Test locate method with object containing function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0077';
      console.log(TAG + ' start');
      interface FunctionObject {
        a: number;
        b: () => void;
      }
      let stack = new Stack<FunctionObject>();
      const func1 = (): void => {};
      const func2 = (): void => {};
      let obj1: FunctionObject = {a: 1, b: func1};
      let obj2: FunctionObject = {a: 2, b: func2};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7800
     * @tc.name      testStack02Chapter0078
     * @tc.desc      Test locate method with object with prototype chain
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0078';
      console.log(TAG + ' start');
      class ParentClass {
        parentProp: number;
        constructor() {
          this.parentProp = 1;
        }
      }
      class ChildClass extends ParentClass {
        ownProp: number;
        constructor(prop: number) {
          super();
          this.ownProp = prop;
        }
      }
      let stack = new Stack<ChildClass>();
      let obj1 = new ChildClass(2);
      let obj2 = new ChildClass(10);
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_7900
     * @tc.name      testStack02Chapter0079
     * @tc.desc      Test locate method with object containing non-enumerable property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0079';
      console.log(TAG + ' start');
      interface ConfigurableObject {
        b: number;
      }
      let stack = new Stack<ConfigurableObject>();
      let obj1: ConfigurableObject = {b: 2};
      let obj2: ConfigurableObject = {b: 3};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_8000
     * @tc.name      testStack02Chapter0080
     * @tc.desc      Test locate method with object containing ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0080';
      console.log(TAG + ' start');
      interface BufferObject {
        buffer: ArrayBuffer;
      }
      let stack = new Stack<BufferObject>();
      let obj1: BufferObject = {buffer: new ArrayBuffer(16)};
      let obj2: BufferObject = {buffer: new ArrayBuffer(8)};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_8100
     * @tc.name      testStack02Chapter0081
     * @tc.desc      Test locate method with object containing DataView
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0081';
      console.log(TAG + ' start');
      interface DataViewObject {
        view: DataView;
      }
      let stack = new Stack<DataViewObject>();
      let buffer = new ArrayBuffer(16);
      let obj1: DataViewObject = {view: new DataView(buffer)};
      let obj2: DataViewObject = {view: new DataView(new ArrayBuffer(8))};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_8200
     * @tc.name      testStack02Chapter0082
     * @tc.desc      Test locate method with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0082';
      console.log(TAG + ' start');
      interface EmptyObject {}
      let stack = new Stack<EmptyObject>();
      let obj1: EmptyObject = {};
      let obj2: EmptyObject = {};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_8300
     * @tc.name      testStack02Chapter0083
     * @tc.desc      Test locate method with object containing undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0083';
      console.log(TAG + ' start');
      interface ObjectWithUndefined {
        a: number | undefined;
        b: number;
      }
      let stack = new Stack<ObjectWithUndefined>();
      let obj1: ObjectWithUndefined = {a: undefined, b: 1};
      let obj2: ObjectWithUndefined = {a: 2, b: 2};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_8400
     * @tc.name      testStack02Chapter0084
     * @tc.desc      Test locate method with object containing null property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0084';
      console.log(TAG + ' start');
      interface ObjectWithNull {
        a: number | null;
        b: number;
      }
      let stack = new Stack<ObjectWithNull>();
      let obj1: ObjectWithNull = {a: null, b: 1};
      let obj2: ObjectWithNull = {a: 2, b: 2};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_8500
     * @tc.name      testStack02Chapter0085
     * @tc.desc      Test locate method with object containing NaN property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0085';
      console.log(TAG + ' start');
      interface ObjectWithNaN {
        a: number;
        b: number;
      }
      let stack = new Stack<ObjectWithNaN>();
      let obj1: ObjectWithNaN = {a: NaN, b: 1};
      let obj2: ObjectWithNaN = {a: 2, b: 2};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_8600
     * @tc.name      testStack02Chapter0086
     * @tc.desc      Test locate method with object containing Infinity property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0086';
      console.log(TAG + ' start');
      interface ObjectWithInfinity {
        a: number;
        b: number;
      }
      let stack = new Stack<ObjectWithInfinity>();
      let obj1: ObjectWithInfinity = {a: Infinity, b: 1};
      let obj2: ObjectWithInfinity = {a: 2, b: 2};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number    SUB_STACK_TEST02_8700
     * @tc.name      testStack02Chapter0087
     * @tc.desc      Test locate method with object containing TypedArray property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testStack02Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testStack02Chapter0087';
      console.log(TAG + ' start');
      interface TypedArrayObject {
        buffer: Uint8Array;
      }
      let stack = new Stack<TypedArrayObject>();
      let obj1: TypedArrayObject = {buffer: new Uint8Array([72, 101, 108, 108, 111])};
      let obj2: TypedArrayObject = {buffer: new Uint8Array([1, 2, 3])};
      stack.push(obj1);
      stack.push(obj2);
      let result = stack.locate(obj1);
      expect(result).assertEqual(0);
    });
  })
}