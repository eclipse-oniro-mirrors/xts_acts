import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import Deque  from '@ohos.util.Deque';
class TestObject {
  a?: number;
  b?: string;
  c?: number[];
  name?: string;
  age?: string;
  test?: string;
  key?: string;
  small?: string;
  visible?: string;
  simple?: string;
  childProp?: number;
  parentProp?: number;
  first?: boolean;
  original?: string;
  hidden?: string;
  last?: string;
}

class ArrayLikeObject {
  zero?: number;
  one?: number;
  two?: number;
  three?: number;
  four?: number;
  five?: number;
  six?: number;
  seven?: number;
  eight?: number;
  nine?: number;
  abc?: number;
  aaa?: number;
}

class MixedKeyObject {
  a: number = 0;
  b: number = 0;
}

class ComplexObject {
  simple?: string;
  childProp?: number;
  parentProp?: number;
  last?: string;
}

class ObjectWithBuiltins {
  last?: boolean;
  first?: boolean;
}

class C1 {
  name: string = "";
  age: string = "";
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Deque04Test() {
  describe('Deque04Test', () => {
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
     * @tc.number    SUB_DEQUE_GETLAST02_3100
     * @tc.name      testDeque02GetLast0031
     * @tc.desc      test Deque getLast with large objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0031';
        console.log(TAG + ' start');
        let deque: Deque<TestObject[]> = new Deque<TestObject[]>();
        const largeArray: TestObject[] = [];
        for (let i = 0; i < 50; i++) {
          const obj = new TestObject();
          obj.a = i;
          obj.b = `value${i}`;
          largeArray.push(obj);
        }
        const smallObjArray: TestObject[] = [];
        const smallObj = new TestObject();
        smallObj.small = "object";
        smallObjArray.push(smallObj);
        deque.insertFront(largeArray);
        deque.insertEnd(smallObjArray);
        let result: TestObject[] = deque.getLast();
        console.info("Last element (large objects array):", result.length);
        expect(result[0].small).assertEqual("object");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_3200
     * @tc.name      testDeque02GetLast0032
     * @tc.desc      test Deque getLast with treeString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0032';
        console.log(TAG + ' start');
        const createTreeString = (size: number): string => {
          let ans = '[';
          while (ans.length < size) {
            ans += '{"a":1},';
          }
          ans += '{"a":1}]';
          return ans;
        };
        let deque: Deque<string> = new Deque<string>();
        const treeString = createTreeString(500);
        const normalString = "a".repeat(500);
        deque.insertFront(treeString);
        deque.insertFront(normalString);
        deque.insertEnd("control");
        let result: string = deque.getLast();
        console.info("Last element (treeString):", result.length);
        expect(result).assertEqual("control");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_3300
     * @tc.name      testDeque02GetLast0033
     * @tc.desc      test Deque getLast with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0033';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const original = "{k1:value1,k2:value2}";
        let sliceResult = original.substring(0, original.length - 2);
        for (let i = 0; i < 3; i++) {
          sliceResult = sliceResult.substring(0, sliceResult.length - 1);
          deque.insertFront(sliceResult);
        }
        deque.insertEnd("original");
        let result: string = deque.getLast();
        console.info("Last element (sliceString):", result);
        expect(result).assertEqual("original");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_3400
     * @tc.name      testDeque02GetLast0034
     * @tc.desc      test Deque getLast with non-empty deque
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0034';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(1);
        let result = deque.getLast();
        console.info("Got last element:", result);
        expect(result).assertEqual(1);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_3500
     * @tc.name      testDeque02GetLast0035
     * @tc.desc      test Deque getLast with Unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0035';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const unicodeStrings = ["\\udc04", "\\ud83d", "\\udff4"];
        for (const code of unicodeStrings) {
          deque.insertFront(code);
        }
        deque.insertEnd("safe");
        let result: string = deque.getLast();
        console.info("Last element (Unicode strings):", result);
        expect(result).assertEqual("safe");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_3600
     * @tc.name      testDeque02GetLast0036
     * @tc.desc      test Deque getLast with moderate size strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0036';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const moderateString = "a".repeat(5000);
        console.info("Creating string of length:", moderateString.length);
        deque.insertFront(moderateString);
        deque.insertEnd("small");
        let result: string = deque.getLast();
        console.info("Last element (moderate string):", result.length);
        expect(result).assertEqual("small");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_3700
     * @tc.name      testDeque02GetLast0037
     * @tc.desc      test Deque getLast with example from documentation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0037';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(2);
        deque.insertFront(4);
        deque.insertFront(5);
        deque.insertFront(4);
        let result: number = deque.getLast();
        console.info("result:", result);
        expect(result).assertEqual(2);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0100
     * @tc.name      testDeque03InsertEnd0001
     * @tc.desc      test Deque insertEnd with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0001';
        console.log(TAG + ' start');
        let deque: Deque<Int8Array> = new Deque<Int8Array>();
        deque.insertEnd(new Int8Array([-128]));
        deque.insertEnd(new Int8Array([127]));
        deque.insertEnd(new Int8Array([0]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(0);
        console.info("InsertEnd Int8Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0200
     * @tc.name      testDeque03InsertEnd0002
     * @tc.desc      test Deque insertEnd with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0002';
        console.log(TAG + ' start');
        let deque: Deque<Uint8Array> = new Deque<Uint8Array>();
        deque.insertEnd(new Uint8Array([0]));
        deque.insertEnd(new Uint8Array([255]));
        deque.insertEnd(new Uint8Array([128]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(128);
        console.info("InsertEnd Uint8Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0300
     * @tc.name      testDeque03InsertEnd0003
     * @tc.desc      test Deque insertEnd with Uint8ClampedArray clamped behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0003';
        console.log(TAG + ' start');
        let deque: Deque<Uint8ClampedArray> = new Deque<Uint8ClampedArray>();
        deque.insertEnd(new Uint8ClampedArray([-1]));
        deque.insertEnd(new Uint8ClampedArray([256]));
        deque.insertEnd(new Uint8ClampedArray([128]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(128);
        console.info("InsertEnd Uint8ClampedArray test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0400
     * @tc.name      testDeque03InsertEnd0004
     * @tc.desc      test Deque insertEnd with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0004';
        console.log(TAG + ' start');
        let deque: Deque<Int16Array> = new Deque<Int16Array>();
        deque.insertEnd(new Int16Array([-32768]));
        deque.insertEnd(new Int16Array([32767]));
        deque.insertEnd(new Int16Array([0]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(0);
        console.info("InsertEnd Int16Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0500
     * @tc.name      testDeque03InsertEnd0005
     * @tc.desc      test Deque insertEnd with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0005';
        console.log(TAG + ' start');
        let deque: Deque<Uint16Array> = new Deque<Uint16Array>();
        deque.insertEnd(new Uint16Array([0]));
        deque.insertEnd(new Uint16Array([65535]));
        deque.insertEnd(new Uint16Array([32768]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(32768);
        console.info("InsertEnd Uint16Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0600
     * @tc.name      testDeque03InsertEnd0006
     * @tc.desc      test Deque insertEnd with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0006';
        console.log(TAG + ' start');
        let deque: Deque<Int32Array> = new Deque<Int32Array>();
        deque.insertEnd(new Int32Array([-2147483648]));
        deque.insertEnd(new Int32Array([2147483647]));
        deque.insertEnd(new Int32Array([0]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(0);
        console.info("InsertEnd Int32Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0700
     * @tc.name      testDeque03InsertEnd0007
     * @tc.desc      test Deque insertEnd with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0007';
        console.log(TAG + ' start');
        let deque: Deque<Uint32Array> = new Deque<Uint32Array>();
        deque.insertEnd(new Uint32Array([0]));
        deque.insertEnd(new Uint32Array([4294967295]));
        deque.insertEnd(new Uint32Array([2147483648]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(2147483648);
        console.info("InsertEnd Uint32Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0800
     * @tc.name      testDeque03InsertEnd0008
     * @tc.desc      test Deque insertEnd with Float32Array boundary and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0008';
        console.log(TAG + ' start');
        let deque: Deque<Float32Array> = new Deque<Float32Array>();
        deque.insertEnd(new Float32Array([-3.4028234663852886e38]));
        deque.insertEnd(new Float32Array([3.4028234663852886e38]));
        deque.insertEnd(new Float32Array([Infinity]));
        deque.insertEnd(new Float32Array([-Infinity]));
        deque.insertEnd(new Float32Array([NaN]));
        const float32Value = new Float32Array([1.2e-38]);
        const actualStoredValue = float32Value[0];
        deque.insertEnd(float32Value);
        expect(deque.length).assertEqual(6);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(actualStoredValue);
        console.info("InsertEnd Float32Array test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_0900
     * @tc.name      testDeque03InsertEnd0009
     * @tc.desc      test Deque insertEnd with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0009';
        console.log(TAG + ' start');
        let deque: Deque<Float64Array> = new Deque<Float64Array>();
        deque.insertEnd(new Float64Array([-1.7976931348623157e308]));
        deque.insertEnd(new Float64Array([1.7976931348623157e308]));
        deque.insertEnd(new Float64Array([5e-324]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(5e-324);
        console.info("InsertEnd Float64Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1000
     * @tc.name      testDeque03InsertEnd0010
     * @tc.desc      test Deque insertEnd with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0010';
        console.log(TAG + ' start');
        let deque: Deque<BigInt64Array> = new Deque<BigInt64Array>();
        deque.insertEnd(new BigInt64Array([-9223372036854775808n]));
        deque.insertEnd(new BigInt64Array([9223372036854775807n]));
        deque.insertEnd(new BigInt64Array([0n]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(0n);
        console.info("InsertEnd BigInt64Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1100
     * @tc.name      testDeque03InsertEnd0011
     * @tc.desc      test Deque insertEnd with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0011';
        console.log(TAG + ' start');
        let deque: Deque<BigUint64Array> = new Deque<BigUint64Array>();
        deque.insertEnd(new BigUint64Array([0n]));
        deque.insertEnd(new BigUint64Array([18446744073709551615n]));
        deque.insertEnd(new BigUint64Array([9223372036854775808n]));
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement[0]).assertEqual(9223372036854775808n);
        console.info("InsertEnd BigUint64Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1200
     * @tc.name      testDeque03InsertEnd0012
     * @tc.desc      test Deque insertEnd with TypedArray special value storage rules
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0012';
        console.log(TAG + ' start');
        let dequeFloat32: Deque<Float32Array> = new Deque<Float32Array>();
        dequeFloat32.insertEnd(new Float32Array([Infinity]));
        dequeFloat32.insertEnd(new Float32Array([-Infinity]));
        dequeFloat32.insertEnd(new Float32Array([NaN]));
        let dequeInt8: Deque<Int8Array> = new Deque<Int8Array>();
        const nanValue: number = NaN;
        dequeInt8.insertEnd(new Int8Array([nanValue]));
        expect(dequeFloat32.length).assertEqual(3);
        expect(dequeInt8.length).assertEqual(1);
        console.info("InsertEnd TypedArray special values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1300
     * @tc.name      testDeque03InsertEnd0013
     * @tc.desc      test Deque insertEnd with String type - undefined/null/empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0013';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("undefined");
        deque.insertEnd("null");
        deque.insertEnd("");
        deque.insertEnd("test");
        expect(deque.length).assertEqual(4);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("test");
        console.info("InsertEnd String type test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1400
     * @tc.name      testDeque03InsertEnd0014
     * @tc.desc      test Deque insertEnd with String type - special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0014';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        deque.insertEnd(specialChars);
        deque.insertEnd("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
        deque.insertEnd("ASCII_TEST");
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("ASCII_TEST");
        console.info("InsertEnd String special characters test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1500
     * @tc.name      testDeque03InsertEnd0015
     * @tc.desc      test Deque insertEnd with String type - escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0015';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("Line1\\nLine2");
        deque.insertEnd("Tab\\tSeparated");
        deque.insertEnd("Backspace\\bTest");
        deque.insertEnd("Escape\\x41\\x42\\x43");
        deque.insertEnd("Octal\\101\\102\\103");
        expect(deque.length).assertEqual(5);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("Octal\\101\\102\\103");
        console.info("InsertEnd String escape sequences test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1600
     * @tc.name      testDeque03InsertEnd0016
     * @tc.desc      test Deque insertEnd with String type - emojis and Unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0016';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const emojis = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴"];
        const unicodeEncoded = ["\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf",
          "\\ud83c\\udf85", "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87",
          "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f", "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"];
        for (let i = 0; i < emojis.length; i++) {
          deque.insertEnd(emojis[i]);
          deque.insertEnd(unicodeEncoded[i]);
        }
        deque.insertEnd("TestEnd");
        expect(deque.length).assertEqual(25);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("TestEnd");
        console.info("InsertEnd String emojis and Unicode test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1700
     * @tc.name      testDeque03InsertEnd0017
     * @tc.desc      test Deque insertEnd with String type - keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0017';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("0");
        deque.insertEnd("NaN");
        deque.insertEnd("");
        deque.insertEnd("undefined");
        deque.insertEnd("null");
        deque.insertEnd("LastKeyword");
        expect(deque.length).assertEqual(6);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("LastKeyword");
        console.info("InsertEnd String keywords test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1800
     * @tc.name      testDeque03InsertEnd0018
     * @tc.desc      test Deque insertEnd with Number type - basic values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0018';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(0);
        deque.insertEnd(NaN);
        deque.insertEnd(-0);
        deque.insertEnd(Infinity);
        deque.insertEnd(-Infinity);
        deque.insertEnd(42);
        expect(deque.length).assertEqual(6);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual(42);
        console.info("InsertEnd Number basic values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_1900
     * @tc.name      testDeque03InsertEnd0019
     * @tc.desc      test Deque insertEnd with Number type - boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0019';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(Number.MAX_VALUE);
        deque.insertEnd(Number.MIN_VALUE);
        deque.insertEnd(Number.EPSILON);
        deque.insertEnd(Number.MAX_SAFE_INTEGER);
        deque.insertEnd(Math.floor(1.5));
        deque.insertEnd(123.456);
        expect(deque.length).assertEqual(6);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual(123.456);
        console.info("InsertEnd Number boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2000
     * @tc.name      testDeque03InsertEnd0020
     * @tc.desc      test Deque insertEnd with Number type - different numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0020';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(0xdecafafecacefade);
        deque.insertEnd(0x0102);
        deque.insertEnd(0x01020304);
        deque.insertEnd(0o3);
        deque.insertEnd(2 ** 3);
        deque.insertEnd(1e3);
        deque.insertEnd(2.5e-2);
        deque.insertEnd(9007199254740991);
        expect(deque.length).assertEqual(8);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual(9007199254740991);
        console.info("InsertEnd Number representations test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2100
     * @tc.name      testDeque03InsertEnd0021
     * @tc.desc      test Deque insertEnd with BigInt type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0021';
        console.log(TAG + ' start');
        let deque: Deque<bigint> = new Deque<bigint>();
        deque.insertEnd(BigInt(0xdecafafecacefade));
        deque.insertEnd(9007199254740991n);
        deque.insertEnd(-9223372036854775808n);
        deque.insertEnd(9223372036854775807n);
        deque.insertEnd(0n);
        expect(deque.length).assertEqual(5);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual(0n);
        console.info("InsertEnd BigInt test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2200
     * @tc.name      testDeque03InsertEnd0022
     * @tc.desc      test Deque insertEnd with Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0022';
        console.log(TAG + ' start');
        let deque: Deque<boolean> = new Deque<boolean>();
        deque.insertEnd(true);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(true);
        deque.insertEnd(true);
        expect(deque.length).assertEqual(10);
        let lastElement = deque.getLast();
        expect(lastElement).assertTrue();
        console.info("InsertEnd Boolean test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2300
     * @tc.name      testDeque03InsertEnd0023
     * @tc.desc      test Deque insertEnd with Array type - normal arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0023';
        console.log(TAG + ' start');
        let deque: Deque<number[]> = new Deque<number[]>();
        deque.insertEnd([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
        deque.insertEnd([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
        deque.insertEnd([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
        deque.insertEnd([1, 2, 3]);
        expect(deque.length).assertEqual(4);
        let lastElement = deque.getLast();
        expect(lastElement).assertDeepEquals([1, 2, 3]);
        console.info("InsertEnd Array test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2400
     * @tc.name      testDeque03InsertEnd0024
     * @tc.desc      test Deque insertEnd with Array type - special arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0024';
        console.log(TAG + ' start');
        let deque: Deque<ArrayLikeObject> = new Deque<ArrayLikeObject>();
        const customObj = new ArrayLikeObject();
        customObj.zero = 333;
        customObj.abc = 111;
        customObj.aaa = 222;
        const simpleObj = new ArrayLikeObject();
        simpleObj.zero = 999;
        deque.insertEnd(customObj);
        deque.insertEnd(simpleObj);
        expect(deque.length).assertEqual(2);
        let lastElement = deque.getLast();
        expect(lastElement.zero).assertEqual(999);
        console.info("InsertEnd special arrays test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2500
     * @tc.name      testDeque03InsertEnd0025
     * @tc.desc      test Deque insertEnd with TestObject type - basic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0025';
        console.log(TAG + ' start');
        let deque: Deque<TestObject> = new Deque<TestObject>();
        const obj1 = new TestObject();
        obj1.a = 1;
        obj1.b = "test";
        obj1.c = [1, 2, 3];
        const obj2 = new TestObject();
        obj2.test = "first";
        deque.insertEnd(obj1);
        deque.insertEnd(obj2);
        expect(deque.length).assertEqual(2);
        let lastElement = deque.getLast();
        expect(lastElement.test).assertEqual("first");
        console.info("InsertEnd TestObject basic test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2600
     * @tc.name      testDeque03InsertEnd0026
     * @tc.desc      test Deque insertEnd with ComplexObject type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0026';
        console.log(TAG + ' start');
        let deque: Deque<ComplexObject> = new Deque<ComplexObject>();
        const child = new ComplexObject();
        child.childProp = 2;
        const mixedObj = new MixedKeyObject();
        mixedObj.a = 1;
        mixedObj.b = 3;
        const simpleObj = new ComplexObject();
        simpleObj.simple = "first";
        deque.insertEnd(child);
        deque.insertEnd(simpleObj);
        expect(deque.length).assertEqual(2);
        let lastElement = deque.getLast();
        expect(lastElement.simple).assertEqual("first");
        console.info("InsertEnd ComplexObject test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2700
     * @tc.name      testDeque03InsertEnd0027
     * @tc.desc      test Deque insertEnd with ObjectWithBuiltins type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0027';
        console.log(TAG + ' start');
        let deque: Deque<ObjectWithBuiltins> = new Deque<ObjectWithBuiltins>();
        const builtinObj = new ObjectWithBuiltins();
        builtinObj.last = true;
        const emptyObj = new ObjectWithBuiltins();
        deque.insertEnd(emptyObj);
        deque.insertEnd(builtinObj);
        expect(deque.length).assertEqual(2);
        let lastElement = deque.getLast();
        expect(lastElement.last).assertTrue();
        console.info("InsertEnd ObjectWithBuiltins test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2800
     * @tc.name      testDeque03InsertEnd0028
     * @tc.desc      test Deque insertEnd with union type (as per documentation example)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0028';
        console.log(TAG + ' start');
        type MixedType = string | number | boolean | number[] | C1;
        let deque: Deque<MixedType> = new Deque<MixedType>();
        deque.insertEnd("a");
        deque.insertEnd(1);
        let b = [1, 2, 3];
        deque.insertEnd(b);
        let c: C1 = {name: "Dylan", age: "13"};
        deque.insertEnd(c);
        deque.insertEnd(false);
        expect(deque.length).assertEqual(5);
        let firstElement = deque.getFirst();
        expect(firstElement as string).assertEqual("a");
        console.info("InsertEnd union type test passed (documentation example)");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_2900
     * @tc.name      testDeque03InsertEnd0029
     * @tc.desc      test Deque insertEnd with large number of elements
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0029", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0029';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        const largeCount = 1000;
        for (let i = 0; i < largeCount; i++) {
          deque.insertEnd(i);
        }
        expect(deque.length).assertEqual(largeCount);
        expect(deque.getFirst()).assertEqual(0);
        expect(deque.getLast()).assertEqual(largeCount - 1);
        console.info(`InsertEnd large number (${largeCount}) of elements test passed`);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_3000
     * @tc.name      testDeque03InsertEnd0030
     * @tc.desc      test Deque insertEnd with treeString type
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0030", TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0030';
        console.log(TAG + ' start');
        const createTreeString = (size: number): string => {
          let ans = '[';
          while (ans.length < size) {
            ans += '{"a":1},';
          }
          ans += '{"a":1}]';
          return ans;
        };
        let deque: Deque<string> = new Deque<string>();
        const treeString = createTreeString(500);
        const normalString = "a".repeat(500);
        deque.insertEnd(treeString);
        deque.insertEnd(normalString);
        deque.insertEnd("control");
        expect(deque.length).assertEqual(3);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("control");
        console.info("InsertEnd treeString test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_3100
     * @tc.name      testDeque03InsertEnd0031
     * @tc.desc      test Deque insertEnd with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0031';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const original = "{k1:value1,k2:value2}";
        let sliceResult = original.substring(0, original.length - 2);
        for (let i = 0; i < 3; i++) {
          sliceResult = sliceResult.substring(0, sliceResult.length - 1);
          deque.insertEnd(sliceResult);
        }
        deque.insertEnd("original");
        expect(deque.length).assertEqual(4);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("original");
        console.info("InsertEnd sliceString test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_3200
     * @tc.name      testDeque03InsertEnd0032
     * @tc.desc      test Deque insertEnd with illegal Unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0032';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const illegalUnicode = ["\\udc04", "\\ud83d", "\\udff4"];
        for (const code of illegalUnicode) {
          deque.insertEnd(code);
        }
        deque.insertEnd("safe");
        expect(deque.length).assertEqual(4);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("safe");
        console.info("InsertEnd illegal Unicode test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_3300
     * @tc.name      testDeque03InsertEnd0033
     * @tc.desc      test Deque insertEnd with NaN/Infinity arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0033';
        console.log(TAG + ' start');
        let deque: Deque<number[]> = new Deque<number[]>();
        deque.insertEnd([72, 101, NaN, Infinity, 108, 111]);
        deque.insertEnd([72, 108]);
        deque.insertEnd([]);
        deque.insertEnd([256, 65536, 32768]);
        expect(deque.length).assertEqual(4);
        console.info("InsertEnd special arrays test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_3400
     * @tc.name      testDeque03InsertEnd0034
     * @tc.desc      test Deque insertEnd with different numeric ranges
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0034';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(-128);
        deque.insertEnd(127);
        deque.insertEnd(-32768);
        deque.insertEnd(32767);
        deque.insertEnd(-2147483648);
        deque.insertEnd(2147483647);
        deque.insertEnd(-9223372036854775807);
        deque.insertEnd(9223372036854775807);
        deque.insertEnd(1.40129846432481707e-45);
        deque.insertEnd(3.40282346638528860e38);
        deque.insertEnd(0);
        deque.insertEnd(65535);
        expect(deque.length).assertEqual(12);
        console.info("InsertEnd different numeric ranges test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_3500
     * @tc.name      testDeque03InsertEnd0035
     * @tc.desc      test Deque insertEnd with mixed object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0035';
        console.log(TAG + ' start');
        type MixedType = string | number | boolean | number[] | TestObject | ArrayLikeObject | ComplexObject;
        let deque: Deque<MixedType> = new Deque<MixedType>();
        deque.insertEnd("string value");
        deque.insertEnd(123.456);
        deque.insertEnd(true);
        deque.insertEnd([1, 2, 3, 4, 5]);
        const testObj = new TestObject();
        testObj.name = "Test Object";
        testObj.age = "25";
        deque.insertEnd(testObj);
        const arrayLikeObj = new ArrayLikeObject();
        arrayLikeObj.zero = 100;
        deque.insertEnd(arrayLikeObj);
        const complexObj = new ComplexObject();
        complexObj.simple = "complex";
        deque.insertEnd(complexObj);
        expect(deque.length).assertEqual(7);
        console.info("InsertEnd mixed object types test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_3600
     * @tc.name      testDeque03InsertEnd0036
     * @tc.desc      test Deque insertEnd performance with moderate size strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0036';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const moderateString = "a".repeat(5000);
        console.info("Creating and inserting string of length:", moderateString.length);
        deque.insertEnd(moderateString);
        deque.insertEnd("small");
        expect(deque.length).assertEqual(2);
        let lastElement = deque.getLast();
        expect(lastElement).assertEqual("small");
        console.info("InsertEnd moderate size strings test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_INSERTEND03_3700
     * @tc.name      testDeque03InsertEnd0037
     * @tc.desc      test Deque insertEnd with chained operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque03InsertEnd0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque03InsertEnd0037';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(1);
        deque.insertEnd(2);
        deque.insertEnd(3);
        deque.insertEnd(4);
        deque.insertEnd(5);
        expect(deque.length).assertEqual(5);
        expect(deque.getFirst()).assertEqual(1);
        expect(deque.getLast()).assertEqual(5);
        deque.insertEnd(6);
        deque.insertEnd(7);
        deque.insertEnd(8);
        expect(deque.length).assertEqual(8);
        expect(deque.getLast()).assertEqual(8);
        console.info("InsertEnd chained operations test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0100
     * @tc.name      testDeque04ForEach0001
     * @tc.desc      test Deque forEach with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0001';
        console.log(TAG + ' start');
        let deque: Deque<Int8Array> = new Deque<Int8Array>();
        const testArrays = [
          new Int8Array([-128]),
          new Int8Array([127]),
          new Int8Array([0])
        ];
        testArrays.forEach(arr => deque.insertEnd(arr));
        let visitedCount = 0;
        let visitedValues: number[] = [];
        let visitedIndices: number[] = [];
        deque.forEach((value: Int8Array, index?: number, dq?: Deque<Int8Array>) => {
          visitedCount++;
          visitedValues.push(value[0]);
          visitedIndices.push(index || 0);
          expect(dq).assertEqual(deque);
        });
        expect(visitedCount).assertEqual(3);
        expect(visitedValues).assertDeepEquals([-128, 127, 0]);
        expect(visitedIndices).assertDeepEquals([0, 1, 2]);
        console.info("forEach Int8Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0200
     * @tc.name      testDeque04ForEach0002
     * @tc.desc      test Deque forEach with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0002';
        console.log(TAG + ' start');
        let deque: Deque<Uint8Array> = new Deque<Uint8Array>();
        const testArrays = [
          new Uint8Array([0]),
          new Uint8Array([255]),
          new Uint8Array([128])
        ];
        testArrays.forEach(arr => deque.insertEnd(arr));
        let visitedCount = 0;
        let visitedValues: number[] = [];
        deque.forEach((value: Uint8Array, index?: number) => {
          visitedCount++;
          visitedValues.push(value[0]);
          expect(index).assertEqual(visitedCount - 1);
        });
        expect(visitedCount).assertEqual(3);
        expect(visitedValues).assertDeepEquals([0, 255, 128]);
        console.info("forEach Uint8Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0300
     * @tc.name      testDeque04ForEach0003
     * @tc.desc      test Deque forEach with Uint8ClampedArray clamped behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0003';
        console.log(TAG + ' start');
        let deque: Deque<Uint8ClampedArray> = new Deque<Uint8ClampedArray>();
        deque.insertEnd(new Uint8ClampedArray([-1]));
        deque.insertEnd(new Uint8ClampedArray([256]));
        deque.insertEnd(new Uint8ClampedArray([128]));
        let visitedValues: number[] = [];
        deque.forEach((value: Uint8ClampedArray) => {
          visitedValues.push(value[0]);
        });
        expect(visitedValues).assertDeepEquals([0, 255, 128]);
        console.info("forEach Uint8ClampedArray test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0400
     * @tc.name      testDeque04ForEach0004
     * @tc.desc      test Deque forEach with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0004';
        console.log(TAG + ' start');
        let deque: Deque<Int16Array> = new Deque<Int16Array>();
        deque.insertEnd(new Int16Array([-32768]));
        deque.insertEnd(new Int16Array([32767]));
        deque.insertEnd(new Int16Array([0]));
        let visitedCount = 0;
        let sum = 0;
        deque.forEach((value: Int16Array, index: number) => {
          visitedCount++;
          sum += value[0];
          console.info(`Index ${index}: ${value[0]}`);
        });
        expect(visitedCount).assertEqual(3);
        expect(sum).assertEqual(0 - 32768 + 32767);
        console.info("forEach Int16Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0500
     * @tc.name      testDeque04ForEach0005
     * @tc.desc      test Deque forEach with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0005';
        console.log(TAG + ' start');
        let deque: Deque<Uint16Array> = new Deque<Uint16Array>();
        deque.insertEnd(new Uint16Array([0]));
        deque.insertEnd(new Uint16Array([65535]));
        deque.insertEnd(new Uint16Array([32768]));
        let visitedValues: number[] = [];
        deque.forEach((value: Uint16Array, index?: number) => {
          visitedValues.push(value[0]);
        });
        expect(visitedValues).assertDeepEquals([0, 65535, 32768]);
        console.info("forEach Uint16Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0600
     * @tc.name      testDeque04ForEach0006
     * @tc.desc      test Deque forEach with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0006';
        console.log(TAG + ' start');
        let deque: Deque<Int32Array> = new Deque<Int32Array>();
        deque.insertEnd(new Int32Array([-2147483648]));
        deque.insertEnd(new Int32Array([2147483647]));
        deque.insertEnd(new Int32Array([0]));
        let maxValue = -Infinity;
        let minValue = Infinity;
        deque.forEach((value: Int32Array) => {
          const val = value[0];
          if (val > maxValue) maxValue = val;
          if (val < minValue) minValue = val;
        });
        expect(maxValue).assertEqual(2147483647);
        expect(minValue).assertEqual(-2147483648);
        console.info("forEach Int32Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0700
     * @tc.name      testDeque04ForEach0007
     * @tc.desc      test Deque forEach with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0007';
        console.log(TAG + ' start');
        let deque: Deque<Uint32Array> = new Deque<Uint32Array>();
        deque.insertEnd(new Uint32Array([0]));
        deque.insertEnd(new Uint32Array([4294967295]));
        deque.insertEnd(new Uint32Array([2147483648]));
        let visitedCount = 0;
        deque.forEach((value: Uint32Array, index: number) => {
          visitedCount++;
          console.info(`Index ${index}: ${value[0]}`);
        });
        expect(visitedCount).assertEqual(3);
        console.info("forEach Uint32Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0800
     * @tc.name      testDeque04ForEach0008
     * @tc.desc      test Deque forEach with Float32Array boundary and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0008';
        console.log(TAG + ' start');
        let deque: Deque<Float32Array> = new Deque<Float32Array>();
        deque.insertEnd(new Float32Array([-3.4028234663852886e38]));
        deque.insertEnd(new Float32Array([3.4028234663852886e38]));
        deque.insertEnd(new Float32Array([Infinity]));
        deque.insertEnd(new Float32Array([-Infinity]));
        deque.insertEnd(new Float32Array([NaN]));
        const float32Value = new Float32Array([1.2e-38]);
        const actualStoredValue = float32Value[0];
        deque.insertEnd(float32Value);
        let visitedCount = 0;
        let hasInfinity = false;
        let hasNegativeInfinity = false;
        let hasNaN = false;
        deque.forEach((value: Float32Array) => {
          visitedCount++;
          const val = value[0];
          if (val === Infinity) hasInfinity = true;
          if (val === -Infinity) hasNegativeInfinity = true;
          if (Number.isNaN(val)) hasNaN = true;
        });
        expect(visitedCount).assertEqual(6);
        expect(hasInfinity).assertTrue();
        expect(hasNegativeInfinity).assertTrue();
        expect(hasNaN).assertTrue();
        console.info("forEach Float32Array test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_0900
     * @tc.name      testDeque04ForEach0009
     * @tc.desc      test Deque forEach with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0009';
        console.log(TAG + ' start');
        let deque: Deque<Float64Array> = new Deque<Float64Array>();
        deque.insertEnd(new Float64Array([-1.7976931348623157e308]));
        deque.insertEnd(new Float64Array([1.7976931348623157e308]));
        deque.insertEnd(new Float64Array([5e-324]));
        let visitedValues: number[] = [];
        deque.forEach((value: Float64Array, index: number) => {
          visitedValues.push(value[0]);
        });
        expect(visitedValues.length).assertEqual(3);
        expect(Math.abs(visitedValues[0]) > 1e307).assertTrue();
        expect(Math.abs(visitedValues[1]) > 1e307).assertTrue();
        expect(Math.abs(visitedValues[2]) < 1e-323).assertTrue();
        console.info("forEach Float64Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1000
     * @tc.name      testDeque04ForEach0010
     * @tc.desc      test Deque forEach with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0010';
        console.log(TAG + ' start');
        let deque: Deque<BigInt64Array> = new Deque<BigInt64Array>();
        deque.insertEnd(new BigInt64Array([-9223372036854775808n]));
        deque.insertEnd(new BigInt64Array([9223372036854775807n]));
        deque.insertEnd(new BigInt64Array([0n]));
        let visitedValues: bigint[] = [];
        deque.forEach((value: BigInt64Array) => {
          visitedValues.push(value[0]);
        });
        expect(visitedValues.length).assertEqual(3);
        expect(visitedValues[0]).assertEqual(-9223372036854775808n);
        expect(visitedValues[1]).assertEqual(9223372036854775807n);
        expect(visitedValues[2]).assertEqual(0n);
        console.info("forEach BigInt64Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1100
     * @tc.name      testDeque04ForEach0011
     * @tc.desc      test Deque forEach with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0011';
        console.log(TAG + ' start');
        let deque: Deque<BigUint64Array> = new Deque<BigUint64Array>();
        deque.insertEnd(new BigUint64Array([0n]));
        deque.insertEnd(new BigUint64Array([18446744073709551615n]));
        deque.insertEnd(new BigUint64Array([9223372036854775808n]));
        let sum = 0n;
        deque.forEach((value: BigUint64Array) => {
          sum += value[0];
        });
        expect(sum).assertEqual(0n + 18446744073709551615n + 9223372036854775808n);
        console.info("forEach BigUint64Array boundary values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1200
     * @tc.name      testDeque04ForEach0012
     * @tc.desc      test Deque forEach with TypedArray special value storage rules
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0012';
        console.log(TAG + ' start');
        let dequeFloat32: Deque<Float32Array> = new Deque<Float32Array>();
        dequeFloat32.insertEnd(new Float32Array([Infinity]));
        dequeFloat32.insertEnd(new Float32Array([-Infinity]));
        dequeFloat32.insertEnd(new Float32Array([NaN]));
        let dequeInt8: Deque<Int8Array> = new Deque<Int8Array>();
        const nanValue: number = NaN;
        dequeInt8.insertEnd(new Int8Array([nanValue]));
        let float32Results: number[] = [];
        dequeFloat32.forEach((value: Float32Array) => {
          float32Results.push(value[0]);
        });
        let int8Results: number[] = [];
        dequeInt8.forEach((value: Int8Array) => {
          int8Results.push(value[0]);
        });
        expect(float32Results.length).assertEqual(3);
        expect(int8Results.length).assertEqual(1);
        expect(int8Results[0]).assertEqual(0);
        console.info("forEach TypedArray special values test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1300
     * @tc.name      testDeque04ForEach0013
     * @tc.desc      test Deque forEach with String type - basic values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0013';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("undefined");
        deque.insertEnd("null");
        deque.insertEnd("");
        deque.insertEnd("test");
        let visitedStrings: string[] = [];
        let visitedIndices: number[] = [];
        deque.forEach((value: string, index: number, dq?: Deque<string>) => {
          visitedStrings.push(value);
          visitedIndices.push(index);
          expect(dq).assertEqual(deque);
        });
        expect(visitedStrings).assertDeepEquals(["undefined", "null", "", "test"]);
        expect(visitedIndices).assertDeepEquals([0, 1, 2, 3]);
        console.info("forEach String type test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1400
     * @tc.name      testDeque04ForEach0014
     * @tc.desc      test Deque forEach with String type - special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0014';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        deque.insertEnd(specialChars);
        deque.insertEnd("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
        deque.insertEnd("ASCII_TEST");
        let concatenated = "";
        deque.forEach((value: string, index: number) => {
          concatenated += value.charAt(0);
          console.info(`Index ${index}: ${value.substring(0, 10)}...`);
        });
        expect(concatenated).assertEqual("!!A");
        expect(deque.length).assertEqual(3);
        console.info("forEach String special characters test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1500
     * @tc.name      testDeque04ForEach0015
     * @tc.desc      test Deque forEach with String type - escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0015';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("Line1\\nLine2");
        deque.insertEnd("Tab\\tSeparated");
        deque.insertEnd("Backspace\\bTest");
        deque.insertEnd("Escape\\x41\\x42\\x43");
        deque.insertEnd("Octal\\101\\102\\103");
        let containsNewline = false;
        let containsTab = false;
        let containsEscape = false;
        deque.forEach((value: string) => {
          if (value.includes("\\n")) containsNewline = true;
          if (value.includes("\\t")) containsTab = true;
          if (value.includes("\\x41")) containsEscape = true;
        });
        expect(containsNewline).assertTrue();
        expect(containsTab).assertTrue();
        expect(containsEscape).assertTrue();
        console.info("forEach String escape sequences test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1600
     * @tc.name      testDeque04ForEach0016
     * @tc.desc      test Deque forEach with String type - emojis and Unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0016';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const emojis = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇"];
        const unicodeEncoded = ["\\ud83d\\udc46", "\\ud83d\\udc7f"];
        for (let i = 0; i < emojis.length; i++) {
          deque.insertEnd(emojis[i]);
        }
        for (let i = 0; i < unicodeEncoded.length; i++) {
          deque.insertEnd(unicodeEncoded[i]);
        }
        let emojiCount = 0;
        let unicodeCount = 0;
        deque.forEach((value: string) => {
          if (value.includes("\\u")) {
            unicodeCount++;
          } else if (value.length > 1) {
            emojiCount++;
          }
        });
        expect(emojiCount).assertEqual(emojis.length);
        expect(unicodeCount).assertEqual(unicodeEncoded.length);
        console.info("forEach String emojis and Unicode test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1700
     * @tc.name      testDeque04ForEach0017
     * @tc.desc      test Deque forEach with String type - keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0017';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const keywords = ["0", "NaN", "", "undefined", "null", "LastKeyword"];
        keywords.forEach(keyword => deque.insertEnd(keyword));
        let visitedKeywords: string[] = [];
        deque.forEach((value: string, index: number) => {
          visitedKeywords.push(value);
          console.info(`Index ${index}: "${value}"`);
        });
        expect(visitedKeywords).assertDeepEquals(keywords);
        console.info("forEach String keywords test passed");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_FOREACH04_1800
     * @tc.name      testDeque04ForEach0018
     * @tc.desc      test Deque forEach with Number type - basic values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque04ForEach0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque04ForEach0018';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        const numbers = [0, NaN, -0, Infinity, -Infinity, 42];
        numbers.forEach(num => deque.insertEnd(num));
        let visitedNumbers: number[] = [];
        let nanCount = 0;
        let infinityCount = 0;
        deque.forEach((value: number) => {
          visitedNumbers.push(value);
          if (Number.isNaN(value)) nanCount++;
          if (!isFinite(value) && !Number.isNaN(value)) infinityCount++;
        });
        expect(visitedNumbers.length).assertEqual(6);
        expect(nanCount).assertEqual(1);
        expect(infinityCount).assertEqual(2);
        console.info("forEach Number basic values test passed");
        console.log(TAG + ' done');
        
      });

  })
}