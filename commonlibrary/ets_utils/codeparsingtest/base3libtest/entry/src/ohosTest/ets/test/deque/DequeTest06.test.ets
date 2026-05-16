import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { Deque } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Deque06Test() {
  describe('Deque06Test', () => {
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
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0100
     * @tc.name      testDeque06PopFirst0001
     * @tc.desc      Test popFirst normal case: remove and return first element with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0001';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertFront(2);
      deque.insertFront(4);
      deque.insertEnd(5);
      deque.insertFront(2);
      deque.insertFront(4);
      let result: number = deque.popFirst();
      expect(result).assertEqual(4);
      expect(deque.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0200
     * @tc.name      testDeque06PopFirst0002
     * @tc.desc      Test popFirst with string type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0002';
      console.log(TAG + ' start');
      let deque = new Deque<string>();
      deque.insertFront("hello");
      deque.insertEnd("world");
      deque.insertFront("test");
      let result: string = deque.popFirst();
      expect(result).assertEqual("test");
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0300
     * @tc.name      testDeque06PopFirst0003
     * @tc.desc      Test popFirst with boolean type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0003.';
      console.log(TAG + ' start');
      let deque = new Deque<boolean>();
      deque.insertFront(true);
      deque.insertEnd(false);
      deque.insertFront(false);
      let result: boolean = deque.popFirst();
      expect(result).assertFalse();
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0400
     * @tc.name      testDeque06PopFirst0004
     * @tc.desc      Test popFirst with object type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0004';
      console.log(TAG + ' start');
      interface TestObject {
        name: string;
        value: number;
      }
      let obj1: TestObject = { name: "obj1", value: 1 };
      let obj2: TestObject = { name: "obj2", value: 2 };
      let obj3: TestObject = { name: "obj3", value: 3 };
      let deque = new Deque<TestObject>();
      deque.insertFront(obj1);
      deque.insertEnd(obj2);
      deque.insertFront(obj3);
      let result: TestObject = deque.popFirst();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(obj3));
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0500
     * @tc.name      testDeque06PopFirst0005
     * @tc.desc      Test popFirst with array type elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0005';
      console.log(TAG + ' start');
      let arr1: number[] = [1, 2, 3];
      let arr2: string[] = ["a", "b", "c"];
      let arr3: boolean[] = [true, false];
      let deque = new Deque<number[] | string[] | boolean[]>();
      deque.insertFront(arr1);
      deque.insertEnd(arr2);
      deque.insertFront(arr3);
      let result: number[] | string[] | boolean[] = deque.popFirst();
      expect(JSON.stringify(result)).assertEqual(JSON.stringify(arr3));
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0600
     * @tc.name      testDeque06PopFirst0006
     * @tc.desc      Test popFirst with mixed type elements (string | number | boolean)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0006';
      console.log(TAG + ' start');
      let deque = new Deque<string | number | boolean>();
      deque.insertFront("test");
      deque.insertEnd(123);
      deque.insertFront(true);
      let result = deque.popFirst();
      expect(result).assertEqual(true);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0700
     * @tc.name      testDeque06PopFirst0007
     * @tc.desc      Test popFirst with special number values (NaN, Infinity, -Infinity)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0007';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertFront(NaN);
      deque.insertEnd(Infinity);
      deque.insertFront(-Infinity);
      let result: number = deque.popFirst();
      expect(result).assertEqual(-Infinity);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0800
     * @tc.name      testDeque06PopFirst0008
     * @tc.desc      Test popFirst with number boundary values (MAX_SAFE_INTEGER, MIN_VALUE)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0008';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertFront(Number.MAX_SAFE_INTEGER);
      deque.insertEnd(Number.MIN_VALUE);
      deque.insertFront(Number.EPSILON);
      let result: number = deque.popFirst();
      expect(result).assertEqual(Number.EPSILON);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_0900
     * @tc.name      testDeque06PopFirst0009
     * @tc.desc      Test popFirst with bigint values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0009';
      console.log(TAG + ' start');
      let deque = new Deque<bigint>();
      deque.insertFront(9007199254740991n);
      deque.insertEnd(9223372036854775807n);
      deque.insertFront(0n);
      let result: bigint = deque.popFirst();
      expect(result).assertEqual(0n);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1000
     * @tc.name      testDeque06PopFirst0010
     * @tc.desc      Test popFirst with special string values (empty, special characters)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0010';
      console.log(TAG + ' start');
      let deque = new Deque<string>();
      deque.insertFront("");
      deque.insertEnd("!@#$%^&*()");
      deque.insertFront("\t\n\r");
      let result: string = deque.popFirst();
      expect(result).assertEqual("\t\n\r");
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1100
     * @tc.name      testDeque06PopFirst0011
     * @tc.desc      Test popFirst with Unicode and emoji strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0011';
      console.log(TAG + ' start');
      let deque = new Deque<string>();
      deque.insertFront("👆");
      deque.insertEnd("🎅");
      deque.insertFront("🤼‍♂️");
      let result: string = deque.popFirst();
      expect(result).assertEqual("🤼‍♂️");
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1200
     * @tc.name      testDeque06PopFirst0012
     * @tc.desc      Test popFirst with TypedArray as elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0012';
      console.log(TAG + ' start');
      let uint8Array = new Uint8Array([72, 101, 108, 108, 111]);
      let int32Array = new Int32Array([-2147483648, 0, 2147483647]);
      let float64Array = new Float64Array([1.7976931348623157e308, 5e-324]);
      let deque = new Deque<Uint8Array | Int32Array | Float64Array>();
      deque.insertFront(uint8Array);
      deque.insertEnd(int32Array);
      deque.insertFront(float64Array);
      let result: Uint8Array | Int32Array | Float64Array = deque.popFirst();
      expect(result).assertEqual(float64Array);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1300
     * @tc.name      testDeque06PopFirst0013
     * @tc.desc      Test popFirst with ArrayBuffer as elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0013';
      console.log(TAG + ' start');
      let buffer1 = new ArrayBuffer(16);
      let buffer2 = new ArrayBuffer(32);
      let buffer3 = new ArrayBuffer(8);
      let deque = new Deque<ArrayBuffer>();
      deque.insertFront(buffer1);
      deque.insertEnd(buffer2);
      deque.insertFront(buffer3);
      let result: ArrayBuffer = deque.popFirst();
      expect(result.byteLength).assertEqual(8);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1400
     * @tc.name      testDeque06PopFirst0014
     * @tc.desc      Test popFirst with Map and Set as elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0014';
      console.log(TAG + ' start');
      interface TestObject {
        a: number;
      }
      type MapValue = string | TestObject;
      type SetValue = number;
      let map = new Map<string, MapValue>([
        ['key1', 'value1'],
        ['key2', { a: 1 } as TestObject]
      ]);
      let set = new Set<SetValue>([1, 2, 3, 2, 1]);
      let deque = new Deque<Map<string, MapValue> | Set<SetValue>>();
      deque.insertFront(map);
      deque.insertEnd(set);
      deque.insertFront(new Map<string, MapValue>([['test', 'data']]));
      let result: Map<string, MapValue> | Set<SetValue> = deque.popFirst();
      expect(result instanceof Map).assertTrue();
      expect((result as Map<string, MapValue>).get('test')).assertEqual('data');
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1500
     * @tc.name      testDeque06PopFirst0015
     * @tc.desc      Test popFirst with Promise and RegExp as elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0015';
      console.log(TAG + ' start');
      let promise = new Promise<string>((resolve) => setTimeout(() => resolve('done'), 100));
      let regex1 = /abc/gi;
      let regex2 = /def/m;
      let deque = new Deque<Promise<string> | RegExp>();
      deque.insertFront(promise);
      deque.insertEnd(regex2);
      deque.insertFront(regex1);
      let result: Promise<string> | RegExp = deque.popFirst();
      expect(result.toString()).assertEqual('/abc/gi');
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1600
     * @tc.name      testDeque06PopFirst0016
     * @tc.desc      Test popFirst with object type elements (modified for ArkTS compatibility)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0016';
      console.log(TAG + ' start');
      interface TestObject {
        a?: number;
        b?: number;
        c?: number;
        specialKey?: string;
        specialValue?: number;
      }
      let obj1: TestObject = { specialKey: "value", a: 1 };
      let obj2: TestObject = { specialValue: 2, b: 3 };
      let deque = new Deque<TestObject>();
      deque.insertFront(obj1);
      deque.insertEnd(obj2);
      deque.insertFront({ c: 4 });
      let result: TestObject = deque.popFirst();
      expect(result.c).assertEqual(4);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1700
     * @tc.name      testDeque06PopFirst0017
     * @tc.desc      Test popFirst with function properties objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0017';
      console.log(TAG + ' start');
      interface TestObject {
        a?: number;
        x?: number;
        z?: number;
        b?: () => string;
        y?: () => number;
      }
      let obj1: TestObject = {
        a: 1,
        b: (): string => { return "test"; }
      };
      let obj2: TestObject = {
        x: 2,
        y: (): number => { return 42; }
      };
      let deque = new Deque<TestObject>();
      deque.insertFront(obj1);
      deque.insertEnd(obj2);
      deque.insertFront({ z: 3 });
      let result: TestObject = deque.popFirst();
      expect(result.z).assertEqual(3);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1800
     * @tc.name      testDeque06PopFirst0018
     * @tc.desc      Test popFirst with nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0018';
      console.log(TAG + ' start');
      interface NestedD {
        e: number;
      }
      interface NestedB {
        c: number;
        d: NestedD;
      }
      interface NestedObj {
        a: number;
        b: NestedB;
      }
      interface SimpleObj {
        simple: string;
      }
      interface FirstObj {
        first: boolean;
      }
      let nestedObj: NestedObj = {
        a: 1,
        b: {
          c: 2,
          d: {
            e: 3
          }
        }
      };
      let simpleObj: SimpleObj = { simple: "test" };
      let firstObj: FirstObj = { first: true };
      let deque = new Deque<NestedObj | SimpleObj | FirstObj>();
      deque.insertFront(nestedObj);
      deque.insertEnd(simpleObj);
      deque.insertFront(firstObj);
      let result = deque.popFirst() as FirstObj;
      expect(result.first).assertTrue();
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_1900
     * @tc.name      testDeque06PopFirst0019
     * @tc.desc      Test popFirst with prototype chain objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0019';
      console.log(TAG + ' start');
      interface TestObjectInterface {
        parentProp?: number;
        childProp?: number;
        standalone?: boolean;
        firstObj?: string;
      }
      const childObject: TestObjectInterface = {};
      childObject.parentProp = 1;
      childObject.childProp = 2;
      const standaloneObject: TestObjectInterface = {};
      standaloneObject.standalone = true;
      const firstObject: TestObjectInterface = {};
      firstObject.firstObj = "first";
      const testDeque = new Deque<TestObjectInterface>();
      testDeque.insertFront(childObject);
      testDeque.insertEnd(standaloneObject);
      testDeque.insertFront(firstObject);
      const popResult = testDeque.popFirst();
      expect(popResult.firstObj).assertEqual("first");
      expect(testDeque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_2000
     * @tc.name      testDeque06PopFirst0020
     * @tc.desc      Test popFirst with objects containing undefined/null properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0020';
      console.log(TAG + ' start');
      interface TestObject1 {
        a: undefined;
        b: number;
      }
      interface TestObject2 {
        x: null;
        y: number;
      }
      interface TestObject3 {
        z: number;
      }
      const obj1: TestObject1 = { a: undefined, b: 1 };
      const obj2: TestObject2 = { x: null, y: 2 };
      const obj3: TestObject3 = { z: 3 };
      type DequeItem = TestObject1 | TestObject2 | TestObject3;
      const testDeque = new Deque<DequeItem>();
      testDeque.insertFront(obj1);
      testDeque.insertEnd(obj2);
      testDeque.insertFront(obj3);
      const operationResult = testDeque.popFirst();
      const typedResult = operationResult as TestObject3;
      expect(typedResult.z).assertEqual(3);
      expect(testDeque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_2100
     * @tc.name      testDeque06PopFirst0021
     * @tc.desc      Test popFirst with single element deque
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0021';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertFront(42);
      let result: number = deque.popFirst();
      expect(result).assertEqual(42);
      expect(deque.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_2200
     * @tc.name      testDeque06PopFirst0022
     * @tc.desc      Test popFirst with large number of elements (performance)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0022';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      const count = 1000;
      for (let i = 0; i < count; i++) {
        deque.insertEnd(i);
      }
      expect(deque.length).assertEqual(count);
      let result: number = deque.popFirst();
      expect(result).assertEqual(0);
      expect(deque.length).assertEqual(count - 1);
      let secondResult: number = deque.popFirst();
      expect(secondResult).assertEqual(1);
      expect(deque.length).assertEqual(count - 2);
      let thirdResult: number = deque.popFirst();
      expect(thirdResult).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_2300
     * @tc.name      testDeque06PopFirst0023
     * @tc.desc      Test popFirst repeatedly until deque is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0023';
      console.log(TAG + ' start');
      let deque = new Deque<string>();
      let elements = ["a", "b", "c", "d", "e"];
      for (let element of elements) {
        deque.insertEnd(element);
      }
      expect(deque.length).assertEqual(elements.length);
      let popped: string[] = [];
      while (deque.length > 0) {
        popped.push(deque.popFirst());
      }
      expect(popped.length).assertEqual(elements.length);
      expect(JSON.stringify(popped)).assertEqual(JSON.stringify(elements));
      expect(deque.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_2400
     * @tc.name      testDeque06PopFirst0024
     * @tc.desc      Test popFirst with number boundary values (byte range: -128~127)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0024';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertFront(-128);
      deque.insertEnd(127);
      deque.insertFront(0);
      let result: number = deque.popFirst();
      expect(result).assertEqual(0);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_2500
     * @tc.name      testDeque06PopFirst0025
     * @tc.desc      Test popFirst with scientific notation numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0025';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertFront(1e3);
      deque.insertEnd(2.5e-2);
      deque.insertFront(1.23e4);
      let result: number = deque.popFirst();
      expect(result).assertEqual(1.23e4);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPFIRST06_2600
     * @tc.name      testDeque06PopFirst0026
     * @tc.desc      Test popFirst with different numeric bases (hex, octal)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopFirst0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopFirst0026';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertFront(0x0102);
      deque.insertEnd(0o7);
      deque.insertFront(0b1101);
      let result: number = deque.popFirst();
      expect(result).assertEqual(0b1101);
      expect(deque.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0100
     * @tc.name      testDeque06PopLast0001
     * @tc.desc      Test popLast normal case: remove and return last element with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0001';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertFront(2);
      deque.insertEnd(6);
      deque.insertFront(5);
      deque.insertFront(2);
      deque.insertFront(4);
      let result: number = deque.popLast();
      expect(result).assertEqual(6);
      expect(deque.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0200
     * @tc.name      testDeque06PopLast0002
     * @tc.desc      Test popLast with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0002';
      console.log(TAG + ' start');
      let deque = new Deque<Int8Array>();
      deque.insertEnd(new Int8Array([-128, 0, 127]));
      deque.insertEnd(new Int8Array([-129, 128]));
      let result: Int8Array = deque.popLast();
      expect(result[0]).assertEqual(127);
      expect(result[1]).assertEqual(-128);
      expect(deque.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0300
     * @tc.name      testDeque06PopLast0003
     * @tc.desc      Test popLast with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0003';
      console.log(TAG + ' start');
      let deque = new Deque<Uint8Array>();
      deque.insertEnd(new Uint8Array([0, 127, 255]));
      deque.insertEnd(new Uint8Array([-1, 256]));
      let result: Uint8Array = deque.popLast();
      expect(result[0]).assertEqual(255);
      expect(result[1]).assertEqual(0);
      expect(deque.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0400
     * @tc.name      testDeque06PopLast0004
     * @tc.desc      Test popLast with Uint8ClampedArray clamping behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0004';
      console.log(TAG + ' start');
      let deque = new Deque<Uint8ClampedArray>();
      deque.insertEnd(new Uint8ClampedArray([0, 255]));
      deque.insertEnd(new Uint8ClampedArray([-1, 256]));
      let result: Uint8ClampedArray = deque.popLast();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(255);
      expect(deque.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0500
     * @tc.name      testDeque06PopLast0005
     * @tc.desc      Test popLast with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0005';
      console.log(TAG + ' start');
      let deque = new Deque<Int16Array>();
      deque.insertEnd(new Int16Array([-32768, 0, 32767]));
      let result: Int16Array = deque.popLast();
      expect(result[0]).assertEqual(-32768);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(32767);
      expect(deque.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0600
     * @tc.name      testDeque06PopLast0006
     * @tc.desc      Test popLast with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0006';
      console.log(TAG + ' start');
      let deque = new Deque<Uint16Array>();
      deque.insertEnd(new Uint16Array([0, 32767, 65535]));
      let result: Uint16Array = deque.popLast();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(32767);
      expect(result[2]).assertEqual(65535);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0700
     * @tc.name      testDeque06PopLast0007
     * @tc.desc      Test popLast with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0007';
      console.log(TAG + ' start');
      let deque = new Deque<Int32Array>();
      deque.insertEnd(new Int32Array([-2147483648, 0, 2147483647]));
      let result: Int32Array = deque.popLast();
      expect(result[0]).assertEqual(-2147483648);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(2147483647);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0800
     * @tc.name      testDeque06PopLast0008
     * @tc.desc      Test popLast with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0008';
      console.log(TAG + ' start');
      let deque = new Deque<Uint32Array>();
      deque.insertEnd(new Uint32Array([0, 2147483647, 4294967295]));
      let result: Uint32Array = deque.popLast();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(2147483647);
      expect(result[2]).assertEqual(4294967295);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_0900
     * @tc.name      testDeque06PopLast0009
     * @tc.desc      Test popLast with Float32Array boundary and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0009';
      console.log(TAG + ' start');
      let deque = new Deque<Float32Array>();
      deque.insertEnd(new Float32Array([-3.4028234663852886e38, 0, 3.4028234663852886e38]));
      deque.insertEnd(new Float32Array([Infinity, -Infinity, NaN]));
      let result: Float32Array = deque.popLast();
      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(-Infinity);
      expect(isNaN(result[2])).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1000
     * @tc.name      testDeque06PopLast0010
     * @tc.desc      Test popLast with Float64Array boundary and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0010';
      console.log(TAG + ' start');
      let deque = new Deque<Float64Array>();
      deque.insertEnd(new Float64Array([-1.7976931348623157e308, 0, 1.7976931348623157e308]));
      deque.insertEnd(new Float64Array([Infinity, -Infinity, NaN]));
      let result: Float64Array = deque.popLast();
      expect(result[0]).assertEqual(Infinity);
      expect(result[1]).assertEqual(-Infinity);
      expect(isNaN(result[2])).assertTrue();
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1100
     * @tc.name      testDeque06PopLast0011
     * @tc.desc      Test popLast with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0011';
      console.log(TAG + ' start');
      let deque = new Deque<BigInt64Array>();
      deque.insertEnd(new BigInt64Array([-9223372036854775808n, 0n, 9223372036854775807n]));
      let result: BigInt64Array = deque.popLast();
      expect(result[0].toString()).assertEqual("-9223372036854775808");
      expect(result[1].toString()).assertEqual("0");
      expect(result[2].toString()).assertEqual("9223372036854775807");
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1200
     * @tc.name      testDeque06PopLast0012
     * @tc.desc      Test popLast with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0012';
      console.log(TAG + ' start');
      let deque = new Deque<BigUint64Array>();
      deque.insertEnd(new BigUint64Array([0n, 9223372036854775807n, 18446744073709551615n]));
      let result: BigUint64Array = deque.popLast();
      expect(result[0].toString()).assertEqual("0");
      expect(result[1].toString()).assertEqual("9223372036854775807");
      expect(result[2].toString()).assertEqual("18446744073709551615");
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1300
     * @tc.name      testDeque06PopLast0013
     * @tc.desc      Test popLast with string special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0013';
      console.log(TAG + ' start');
      let deque: Deque<string> = new Deque<string>();
      const specialChars: string = '!\"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      try {
        deque.insertEnd(specialChars);
        deque.insertEnd("");
        expect(deque.length).assertEqual(2);
        let result: string = deque.popLast();
        expect(result).assertEqual("");
        result = deque.popLast();
        expect(result).assertEqual(specialChars);
        expect(deque.length).assertEqual(0);
      } catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1400
     * @tc.name      testDeque06PopLast0014
     * @tc.desc      Test popLast with string escape characters and emojis
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0014';
      console.log(TAG + ' start');
      let deque = new Deque<string>();
      const escapes = "\\a\\b\\f\\n\\r\\t\\v\\\\\\'\\\"\\?\\0";
      deque.insertEnd(escapes);
      deque.insertEnd("👆");
      deque.insertEnd("👿");
      deque.insertEnd("🤼‍♂️");
      let result: string = deque.popLast();
      expect(result).assertEqual("🤼‍♂️");
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1500
     * @tc.name      testDeque06PopLast0015
     * @tc.desc      Test popLast with number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0015';
      console.log(TAG + ' start');
      let deque = new Deque<number>();
      deque.insertEnd(0);
      deque.insertEnd(NaN);
      deque.insertEnd(-0);
      deque.insertEnd(Infinity);
      deque.insertEnd(-Infinity);
      deque.insertEnd(Number.MAX_VALUE);
      deque.insertEnd(Number.MIN_VALUE);
      deque.insertEnd(Number.EPSILON);
      let result: number = deque.popLast();
      expect(result).assertEqual(Number.EPSILON);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1600
     * @tc.name      testDeque06PopLast0016
     * @tc.desc      Test popLast with different number formats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0016';
      console.log(TAG + ' start');
      let deque = new Deque<number | bigint>();
      deque.insertEnd(0x0102);
      deque.insertEnd(0o3);
      deque.insertEnd(2 ** 3);
      deque.insertEnd(1e3);
      deque.insertEnd(2.5e-2);
      deque.insertEnd(BigInt(0xdecafafecacefade));
      deque.insertEnd(9007199254740991n);
      let result = deque.popLast();
      expect(result).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1700
     * @tc.name      testDeque06PopLast0017
     * @tc.desc      Test popLast with boolean and falsy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0017';
      console.log(TAG + ' start');
      type FalsyValue = boolean | number | string | null | undefined;
      let deque: Deque<FalsyValue> = new Deque<FalsyValue>();
      try {
        deque.insertEnd(true);
        deque.insertEnd(false);
        deque.insertEnd(0);
        deque.insertEnd(NaN);
        deque.insertEnd("");
        deque.insertEnd(null);
        deque.insertEnd(undefined);
        expect(deque.length).assertEqual(7);
        let result: FalsyValue = deque.popLast();
		expect(result).assertEqual(undefined);
        expect(typeof result === 'undefined').assertTrue();
      } catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1800
     * @tc.name      testDeque06PopLast0018
     * @tc.desc      Test popLast with array type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0018';
      console.log(TAG + ' start');
      type MixedArray = Array<number | string | boolean | null | undefined>;
      let deque: Deque<MixedArray> = new Deque<MixedArray>();
      try {
        deque.insertEnd([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
        deque.insertEnd([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
        deque.insertEnd([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
        const specialArray: MixedArray = [72, 101, NaN, Infinity, 108, 111];
        deque.insertEnd(specialArray);
        const mixedTypeArray: MixedArray = [72, "abc", true, null, undefined, 108];
        deque.insertEnd(mixedTypeArray);
        expect(deque.length).assertEqual(5);
        let result: MixedArray = deque.popLast();
        expect(result.length).assertEqual(6);
        expect(result[0] as number).assertEqual(72);
        expect(result[1] as string).assertEqual("abc");
        expect(result[2] as boolean).assertTrue();
        expect(result[3]).assertNull();
        expect(result[4]).assertEqual(undefined);
        expect(result[5] as number).assertEqual(108);
        result = deque.popLast();
        expect(result.length).assertEqual(6);
        result = deque.popLast();
        expect(result.length).assertEqual(14);
        expect(result[6] as number).assertEqual(-111);
      } catch (error) {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_1900
     * @tc.name      testDeque06PopLast0019
     * @tc.desc      Test popLast with object type data
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0019';
      console.log(TAG + ' start');
      type SimpleObject = Record<string, number | string | boolean | null | undefined | number[] | object>;
      let deque: Deque<SimpleObject> = new Deque<SimpleObject>();
      deque.insertEnd({ a: 1, b: "test", c: [1, 2, 3] });
      deque.insertEnd({ a: 1, b: { c: 2, d: { e: 3 } } });
      deque.insertEnd({ a: undefined, b: 1 });
      deque.insertEnd({ a: null, b: 1 });
      deque.insertEnd({ a: NaN, b: 1 });
      deque.insertEnd({ a: Infinity, b: 1 });
      let result: SimpleObject = deque.popLast();
      const aValue: number | string | boolean | null | undefined | number[] | object = result['a'];
      const bValue: number | string | boolean | null | undefined | number[] | object = result['b'];
      expect(aValue as number).assertEqual(Infinity);
      expect(bValue as number).assertEqual(1);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_2000
     * @tc.name      testDeque06PopLast0020
     * @tc.desc      Test popLast with mixed types in deque
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0020';
      console.log(TAG + ' start');
      type Point = Record<string, number>;
      type SimpleMixedValue = number | string | boolean | object | null;
      let deque: Deque<SimpleMixedValue> = new Deque<SimpleMixedValue>();
      deque.insertEnd(42);
      deque.insertEnd("hello world");
      deque.insertEnd(true);
      deque.insertEnd([1, 2, 3]);
      deque.insertEnd({ x: 10, y: 20 });
      deque.insertEnd(new Uint8Array([65, 66, 67]));
      deque.insertEnd(null);
      let item1: SimpleMixedValue = deque.popLast();
      expect(item1).assertNull();
      let item2: SimpleMixedValue = deque.popLast();
      if (item2 instanceof Uint8Array) {
        expect(item2[0]).assertEqual(65);
      }
      let item3: SimpleMixedValue = deque.popLast();
      expect(typeof item3 === 'object').assertTrue();
      expect(deque.length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_UTIL_DEQUE_POPLAST06_2100
     * @tc.name      testDeque06PopLast0021
     * @tc.desc      Test popLast with large strings and memory behavior
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque06PopLast0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testDeque06PopLast0021';
      console.log(TAG + ' start');
      let deque = new Deque<string>();
      const largeString = "a".repeat(10000);
      deque.insertEnd(largeString);
      deque.insertEnd("normal string");
      deque.insertEnd("another string");
      let result = deque.popLast();
      expect(result).assertEqual("another string");
      expect(deque.length).assertEqual(2);
      let largeResult = deque.popLast();
      expect(largeResult).assertEqual("normal string");
      let finalResult = deque.popLast();
      expect(finalResult.length).assertEqual(10000);
      expect(finalResult).assertEqual(largeString);
    });
  })
}