import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach,afterEach,afterAll} from '@ohos/hypium';
import Deque  from '@ohos.util.Deque';
class TestObject {
  a?: number;
  b?: string;
  c?: number[];
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
  first?: boolean;
  last?: boolean;
}
class DeleteTestObject {
  a?: number;
  b?: number;
  original?: string;
  last?: string;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function Deque03Test() {
  describe('Deque03Test', () => {
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
     * @tc.number    SUB_DEQUE_GETFIRST01_0100
     * @tc.name      testDeque01GetFirst0001
     * @tc.desc      test Deque getFirst with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0001';
        console.log(TAG + ' start');
        let deque: Deque<Int8Array> = new Deque<Int8Array>();
        deque.insertEnd(new Int8Array([-128]));
        deque.insertEnd(new Int8Array([127]));
        deque.insertFront(new Int8Array([0]));
        let result: Int8Array = deque.getFirst();
        console.info("First element (Int8Array boundary):", result[0]);
        expect(result[0]).assertEqual(0);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_0200
     * @tc.name      testDeque01GetFirst0002
     * @tc.desc      test Deque getFirst with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0002';
        console.log(TAG + ' start');
        let deque: Deque<Uint8Array> = new Deque<Uint8Array>();
        deque.insertEnd(new Uint8Array([0]));
        deque.insertEnd(new Uint8Array([255]));
        deque.insertFront(new Uint8Array([128]));
        let result: Uint8Array = deque.getFirst();
        console.info("First element (Uint8Array boundary):", result[0]);
        expect(result[0]).assertEqual(128);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_0300
     * @tc.name      testDeque01GetFirst0003
     * @tc.desc      test Deque getFirst with Uint8ClampedArray clamped behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0003';
        console.log(TAG + ' start');
        let deque: Deque<Uint8ClampedArray> = new Deque<Uint8ClampedArray>();
        deque.insertEnd(new Uint8ClampedArray([-1]));
        deque.insertEnd(new Uint8ClampedArray([256]));
        deque.insertFront(new Uint8ClampedArray([128]));
        let result: Uint8ClampedArray = deque.getFirst();
        console.info("First element (Uint8ClampedArray):", result[0]);
        expect(result[0]).assertEqual(128);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_0400
     * @tc.name      testDeque01GetFirst0004
     * @tc.desc      test Deque getFirst with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0004';
        console.log(TAG + ' start');
        let deque: Deque<Int16Array> = new Deque<Int16Array>();
        deque.insertEnd(new Int16Array([-32768]));
        deque.insertEnd(new Int16Array([32767]));
        deque.insertFront(new Int16Array([0]));
        let result: Int16Array = deque.getFirst();
        console.info("First element (Int16Array boundary):", result[0]);
        expect(result[0]).assertEqual(0);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_0500
     * @tc.name      testDeque01GetFirst0005
     * @tc.desc      test Deque getFirst with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0005';
        console.log(TAG + ' start');
        let deque: Deque<Uint16Array> = new Deque<Uint16Array>();
        deque.insertEnd(new Uint16Array([0]));
        deque.insertEnd(new Uint16Array([65535]));
        deque.insertFront(new Uint16Array([32768]));
        let result: Uint16Array = deque.getFirst();
        console.info("First element (Uint16Array boundary):", result[0]);
        expect(result[0]).assertEqual(32768);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_0600
     * @tc.name      testDeque01GetFirst0006
     * @tc.desc      test Deque getFirst with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0006';
        console.log(TAG + ' start');
        let deque: Deque<Int32Array> = new Deque<Int32Array>();
        deque.insertEnd(new Int32Array([-2147483648]));
        deque.insertEnd(new Int32Array([2147483647]));
        deque.insertFront(new Int32Array([0]));
        let result: Int32Array = deque.getFirst();
        console.info("First element (Int32Array boundary):", result[0]);
        expect(result[0]).assertEqual(0);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_0700
     * @tc.name      testDeque01GetFirst0007
     * @tc.desc      test Deque getFirst with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0007';
        console.log(TAG + ' start');
        let deque: Deque<Uint32Array> = new Deque<Uint32Array>();
        deque.insertEnd(new Uint32Array([0]));
        deque.insertEnd(new Uint32Array([4294967295]));
        deque.insertFront(new Uint32Array([2147483648]));
        let result: Uint32Array = deque.getFirst();
        console.info("First element (Uint32Array boundary):", result[0]);
        expect(result[0]).assertEqual(2147483648);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_0800
     * @tc.name      testDeque01GetFirst0008
     * @tc.desc      test Deque getFirst with Float32Array boundary and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0008';
        console.log(TAG + ' start');
        let deque: Deque<Float32Array> = new Deque<Float32Array>();
        deque.insertEnd(new Float32Array([-3.4028234663852886e38]));
        deque.insertEnd(new Float32Array([3.4028234663852886e38]));
        deque.insertFront(new Float32Array([Infinity]));
        deque.insertFront(new Float32Array([-Infinity]));
        deque.insertFront(new Float32Array([NaN]));
        const float32Value = new Float32Array([1.2e-38]);
        const actualStoredValue = float32Value[0];
        deque.insertFront(float32Value);
        let result: Float32Array = deque.getFirst();
        console.info("First element (Float32Array):", result[0]);
        expect(result[0]).assertEqual(actualStoredValue);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_0900
     * @tc.name      testDeque01GetFirst0009
     * @tc.desc      test Deque getFirst with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0009';
        console.log(TAG + ' start');
        let deque: Deque<Float64Array> = new Deque<Float64Array>();
        deque.insertEnd(new Float64Array([-1.7976931348623157e308]));
        deque.insertEnd(new Float64Array([1.7976931348623157e308]));
        deque.insertFront(new Float64Array([5e-324]));
        let result: Float64Array = deque.getFirst();
        console.info("First element (Float64Array boundary):", result[0]);
        expect(result[0]).assertEqual(5e-324);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1000
     * @tc.name      testDeque01GetFirst0010
     * @tc.desc      test Deque getFirst with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0010';
        console.log(TAG + ' start');
        let deque: Deque<BigInt64Array> = new Deque<BigInt64Array>();
        deque.insertEnd(new BigInt64Array([-9223372036854775808n]));
        deque.insertEnd(new BigInt64Array([9223372036854775807n]));
        deque.insertFront(new BigInt64Array([0n]));
        let result: BigInt64Array = deque.getFirst();
        console.info("First element (BigInt64Array boundary):", result[0]);
        expect(result[0]).assertEqual(0n);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1100
     * @tc.name      testDeque01GetFirst0011
     * @tc.desc      test Deque getFirst with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0011';
        console.log(TAG + ' start');
        let deque: Deque<BigUint64Array> = new Deque<BigUint64Array>();
        deque.insertEnd(new BigUint64Array([0n]));
        deque.insertEnd(new BigUint64Array([18446744073709551615n]));
        deque.insertFront(new BigUint64Array([9223372036854775808n]));
        let result: BigUint64Array = deque.getFirst();
        console.info("First element (BigUint64Array boundary):", result[0]);
        expect(result[0]).assertEqual(9223372036854775808n);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1200
     * @tc.name      testDeque01GetFirst0012
     * @tc.desc      test Deque getFirst with TypedArray special value storage rules (Float types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0012';
        console.log(TAG + ' start');
        let deque: Deque<Float32Array> = new Deque<Float32Array>();
        deque.insertEnd(new Float32Array([Infinity]));
        deque.insertFront(new Float32Array([-Infinity]));
        deque.insertFront(new Float32Array([NaN]));
        let result: Float32Array = deque.getFirst();
        console.info("First element (Float32Array NaN):", result[0]);
        expect(Number.isNaN(result[0])).assertTrue();
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1300
     * @tc.name      testDeque01GetFirst0013
     * @tc.desc      test Deque getFirst with TypedArray special value storage rules (Int types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0013';
        console.log(TAG + ' start');
        let deque: Deque<Int8Array> = new Deque<Int8Array>();
        deque.insertEnd(new Int8Array([72]));
        const nanValue: number = NaN;
        deque.insertFront(new Int8Array([nanValue]));
        let result: Int8Array = deque.getFirst();
        console.info("First element (Int8Array NaN conversion):", result[0]);
        expect(result[0]).assertEqual(0);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1400
     * @tc.name      testDeque01GetFirst0014
     * @tc.desc      test Deque getFirst with String type - undefined/null/empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0014';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("undefined");
        deque.insertFront("null");
        deque.insertFront("");
        deque.insertFront("test");
        let result: string = deque.getFirst();
        console.info("First element (String):", result);
        expect(result).assertEqual("test");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1500
     * @tc.name      testDeque01GetFirst0015
     * @tc.desc      test Deque getFirst with String type - special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0015';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        deque.insertEnd(specialChars);
        deque.insertFront("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
        deque.insertFront("ASCII_TEST");
        let result: string = deque.getFirst();
        console.info("First element (String special chars):", result);
        expect(result).assertEqual("ASCII_TEST");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1600
     * @tc.name      testDeque01GetFirst0016
     * @tc.desc      test Deque getFirst with String type - escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0016';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("Line1\\nLine2");
        deque.insertFront("Tab\\tSeparated");
        deque.insertFront("Backspace\\bTest");
        deque.insertFront("Escape\\x41\\x42\\x43");
        deque.insertFront("Octal\\101\\102\\103");
        let result: string = deque.getFirst();
        console.info("First element (String escape):", result);
        expect(result).assertEqual("Octal\\101\\102\\103");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1700
     * @tc.name      testDeque01GetFirst0017
     * @tc.desc      test Deque getFirst with String type - emojis and Unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0017';
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
        deque.insertFront("TestStart");
        let result: string = deque.getFirst();
        console.info("First element (String emoji):", result);
        expect(result).assertEqual("TestStart");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1800
     * @tc.name      testDeque01GetFirst0018
     * @tc.desc      test Deque getFirst with String type - keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0018';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertEnd("0");
        deque.insertEnd("NaN");
        deque.insertEnd("");
        deque.insertEnd("undefined");
        deque.insertEnd("null");
        deque.insertFront("FirstElement");
        let result: string = deque.getFirst();
        console.info("First element (String keywords):", result);
        expect(result).assertEqual("FirstElement");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_1900
     * @tc.name      testDeque01GetFirst0019
     * @tc.desc      test Deque getFirst with Number type - basic values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0019';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(0);
        deque.insertEnd(NaN);
        deque.insertEnd(-0);
        deque.insertEnd(Infinity);
        deque.insertEnd(-Infinity);
        deque.insertFront(42);
        let result: number = deque.getFirst();
        console.info("First element (Number basic):", result);
        expect(result).assertEqual(42);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2000
     * @tc.name      testDeque01GetFirst0020
     * @tc.desc      test Deque getFirst with Number type - boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0020';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(Number.MAX_VALUE);
        deque.insertEnd(Number.MIN_VALUE);
        deque.insertEnd(Number.EPSILON);
        deque.insertEnd(Number.MAX_SAFE_INTEGER);
        deque.insertEnd(Math.floor(1.5));
        deque.insertFront(123.456);
        let result: number = deque.getFirst();
        console.info("First element (Number boundary):", result);
        expect(result).assertEqual(123.456);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2100
     * @tc.name      testDeque01GetFirst0021
     * @tc.desc      test Deque getFirst with Number type - different numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0021';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(0xdecafafecacefade);
        deque.insertEnd(0x0102);
        deque.insertEnd(0x01020304);
        deque.insertEnd(0o3);
        deque.insertEnd(2 ** 3);
        deque.insertEnd(1e3);
        deque.insertEnd(2.5e-2);
        deque.insertFront(9007199254740991);
        let result: number = deque.getFirst();
        console.info("First element (Number representations):", result);
        expect(result).assertEqual(9007199254740991);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2200
     * @tc.name      testDeque01GetFirst0022
     * @tc.desc      test Deque getFirst with BigInt type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0022';
        console.log(TAG + ' start');
        let deque: Deque<bigint> = new Deque<bigint>();
        deque.insertEnd(BigInt(0xdecafafecacefade));
        deque.insertEnd(9007199254740991n);
        deque.insertEnd(-9223372036854775808n);
        deque.insertEnd(9223372036854775807n);
        deque.insertFront(0n);
        let result: bigint = deque.getFirst();
        console.info("First element (BigInt):", result.toString());
        expect(result).assertEqual(0n);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2300
     * @tc.name      testDeque01GetFirst0023
     * @tc.desc      test Deque getFirst with Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0023';
        console.log(TAG + ' start');
        let deque: Deque<boolean> = new Deque<boolean>();
        deque.insertEnd(true);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertEnd(false);
        deque.insertFront(false);
        deque.insertFront(true);
        deque.insertFront(true);
        let result: boolean = deque.getFirst();
        console.info("First element (Boolean):", result);
        expect(result).assertTrue();
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2400
     * @tc.name      testDeque01GetFirst0024
     * @tc.desc      test Deque getFirst with Array type - normal arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0024';
        console.log(TAG + ' start');
        let deque: Deque<number[]> = new Deque<number[]>();
        deque.insertEnd([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
        deque.insertEnd([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
        deque.insertEnd([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
        deque.insertFront([1, 2, 3]);
        let result: number[] = deque.getFirst();
        console.info("First element (Array):", result);
        expect(result).assertDeepEquals([1, 2, 3]);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2500
     * @tc.name      testDeque01GetFirst0025
     * @tc.desc      test Deque getFirst with custom object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0025';
        console.log(TAG + ' start');
        let deque: Deque<ArrayLikeObject> = new Deque<ArrayLikeObject>();
        const customObj = new ArrayLikeObject();
        customObj.zero = 333;
        customObj.abc = 111;
        customObj.aaa = 222;
        const simpleObj = new ArrayLikeObject();
        simpleObj.zero = 999;
        deque.insertEnd(customObj);
        deque.insertFront(simpleObj);
        let result: ArrayLikeObject = deque.getFirst();
        console.info("First element (Custom object):", result.zero);
        expect(result.zero).assertEqual(999);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2600
     * @tc.name      testDeque01GetFirst0026
     * @tc.desc      test Deque getFirst with TestObject type - basic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0026';
        console.log(TAG + ' start');
        let deque: Deque<TestObject> = new Deque<TestObject>();
        const obj1 = new TestObject();
        obj1.a = 1;
        obj1.b = "test";
        obj1.c = [1, 2, 3];
        const obj2 = new TestObject();
        obj2.test = "first";
        deque.insertEnd(obj1);
        deque.insertFront(obj2);
        let result: TestObject = deque.getFirst();
        console.info("First element (TestObject basic):", JSON.stringify(result));
        expect(result.test).assertEqual("first");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2700
     * @tc.name      testDeque01GetFirst0027
     * @tc.desc      test Deque getFirst with ComplexObject type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0027';
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
        deque.insertFront(simpleObj);
        let result: ComplexObject = deque.getFirst();
        console.info("First element (ComplexObject):", JSON.stringify(result));
        expect(result.simple).assertEqual("first");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2800
     * @tc.name      testDeque01GetFirst0028
     * @tc.desc      test Deque getFirst with ObjectWithBuiltins type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0028';
        console.log(TAG + ' start');
        let deque: Deque<ObjectWithBuiltins> = new Deque<ObjectWithBuiltins>();
        const builtinObj = new ObjectWithBuiltins();
        builtinObj.first = true;
        const emptyObj = new ObjectWithBuiltins();
        deque.insertEnd(emptyObj);
        deque.insertFront(builtinObj);
        let result: ObjectWithBuiltins = deque.getFirst();
        console.info("First element (ObjectWithBuiltins):", JSON.stringify(result));
        expect(result.first).assertTrue();
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_2900
     * @tc.name      testDeque01GetFirst0029
     * @tc.desc      test Deque getFirst with DeleteTestObject type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0029';
        console.log(TAG + ' start');
        let deque: Deque<DeleteTestObject> = new Deque<DeleteTestObject>();
        const obj1 = new DeleteTestObject();
        obj1.b = 2;
        const obj2 = new DeleteTestObject();
        obj2.a = 1;
        const obj3 = new DeleteTestObject();
        obj3.a = 1;
        const frontObj = new DeleteTestObject();
        frontObj.original = "intact";
        deque.insertEnd(obj1);
        deque.insertEnd(obj2);
        deque.insertEnd(obj3);
        deque.insertFront(frontObj);
        let result: DeleteTestObject = deque.getFirst();
        console.info("First element (DeleteTestObject):", JSON.stringify(result));
        expect(result.original).assertEqual("intact");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_3000
     * @tc.name      testDeque01GetFirst0030
     * @tc.desc      test Deque getFirst with union type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0030';
        console.log(TAG + ' start');
        type MixedType = Int8Array | Uint8Array | string | number | bigint | boolean | number[] | TestObject;
        let deque: Deque<MixedType> = new Deque<MixedType>();
        deque.insertEnd(new Int8Array([-128]));
        deque.insertEnd(new Uint8Array([255]));
        deque.insertEnd("Hello World");
        deque.insertEnd(42);
        deque.insertEnd(9007199254740991n);
        deque.insertEnd(true);
        deque.insertEnd([1, 2, 3]);
        const testObj = new TestObject();
        testObj.key = "value";
        deque.insertEnd(testObj);
        deque.insertFront("FirstElement");
        let result: MixedType = deque.getFirst();
        console.info("First element (Mixed type):", result);
        expect(result as string).assertEqual("FirstElement");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_3100
     * @tc.name      testDeque01GetFirst0031
     * @tc.desc      test Deque getFirst with large objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0031';
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
        deque.insertEnd(largeArray);
        deque.insertFront(smallObjArray);
        let result: TestObject[] = deque.getFirst();
        console.info("First element (large objects array):", result.length);
        expect(result[0].small).assertEqual("object");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_3200
     * @tc.name      testDeque01GetFirst0032
     * @tc.desc      test Deque getFirst with treeString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0032';
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
        deque.insertFront("control");
        let result: string = deque.getFirst();
        console.info("First element (treeString):", result.length);
        expect(result).assertEqual("control");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_3300
     * @tc.name      testDeque01GetFirst0033
     * @tc.desc      test Deque getFirst with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0033';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const original = "{k1:value1,k2:value2}";
        let sliceResult = original.substring(0, original.length - 2);
        for (let i = 0; i < 3; i++) {
          sliceResult = sliceResult.substring(0, sliceResult.length - 1);
          deque.insertEnd(sliceResult);
        }
        deque.insertFront("original");
        let result: string = deque.getFirst();
        console.info("First element (sliceString):", result);
        expect(result).assertEqual("original");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_3400
     * @tc.name      testDeque01GetFirst0034
     * @tc.desc      test Deque getFirst with non-empty deque
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0034';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertEnd(1);
        let result = deque.getFirst();
        console.info("Got first element:", result);
        expect(result).assertEqual(1);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_3500
     * @tc.name      testDeque01GetFirst0035
     * @tc.desc      test Deque getFirst with Unicode strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0035';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const unicodeStrings = ["\\udc04", "\\ud83d", "\\udff4"];
        for (const code of unicodeStrings) {
          deque.insertEnd(code);
        }
        deque.insertFront("safe");
        let result: string = deque.getFirst();
        console.info("First element (Unicode strings):", result);
        expect(result).assertEqual("safe");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETFIRST01_3600
     * @tc.name      testDeque01GetFirst0036
     * @tc.desc      test Deque getFirst with moderate size strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque01GetFirst0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque01GetFirst0036';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const moderateString = "a".repeat(5000);
        console.info("Creating string of length:", moderateString.length);
        deque.insertEnd(moderateString);
        deque.insertFront("small");
        let result: string = deque.getFirst();
        console.info("First element (moderate string):", result.length);
        expect(result).assertEqual("small");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0100
     * @tc.name      testDeque02GetLast0001
     * @tc.desc      test Deque getLast with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0001';
        console.log(TAG + ' start');
        let deque: Deque<Int8Array> = new Deque<Int8Array>();
        deque.insertFront(new Int8Array([-128]));
        deque.insertFront(new Int8Array([127]));
        deque.insertEnd(new Int8Array([0]));
        let result: Int8Array = deque.getLast();
        console.info("Last element (Int8Array boundary):", result[0]);
        expect(result[0]).assertEqual(0);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0200
     * @tc.name      testDeque02GetLast0002
     * @tc.desc      test Deque getLast with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0002';
        console.log(TAG + ' start');
        let deque: Deque<Uint8Array> = new Deque<Uint8Array>();
        deque.insertFront(new Uint8Array([0]));
        deque.insertFront(new Uint8Array([255]));
        deque.insertEnd(new Uint8Array([128]));
        let result: Uint8Array = deque.getLast();
        console.info("Last element (Uint8Array boundary):", result[0]);
        expect(result[0]).assertEqual(128);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0300
     * @tc.name      testDeque02GetLast0003
     * @tc.desc      test Deque getLast with Uint8ClampedArray clamped behavior
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0003';
        console.log(TAG + ' start');
        let deque: Deque<Uint8ClampedArray> = new Deque<Uint8ClampedArray>();
        deque.insertFront(new Uint8ClampedArray([-1]));
        deque.insertFront(new Uint8ClampedArray([256]));
        deque.insertEnd(new Uint8ClampedArray([128]));
        let result: Uint8ClampedArray = deque.getLast();
        console.info("Last element (Uint8ClampedArray):", result[0]);
        expect(result[0]).assertEqual(128);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0400
     * @tc.name      testDeque02GetLast0004
     * @tc.desc      test Deque getLast with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0004';
        console.log(TAG + ' start');
        let deque: Deque<Int16Array> = new Deque<Int16Array>();
        deque.insertFront(new Int16Array([-32768]));
        deque.insertFront(new Int16Array([32767]));
        deque.insertEnd(new Int16Array([0]));
        let result: Int16Array = deque.getLast();
        console.info("Last element (Int16Array boundary):", result[0]);
        expect(result[0]).assertEqual(0);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0500
     * @tc.name      testDeque02GetLast0005
     * @tc.desc      test Deque getLast with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0005';
        console.log(TAG + ' start');
        let deque: Deque<Uint16Array> = new Deque<Uint16Array>();
        deque.insertFront(new Uint16Array([0]));
        deque.insertFront(new Uint16Array([65535]));
        deque.insertEnd(new Uint16Array([32768]));
        let result: Uint16Array = deque.getLast();
        console.info("Last element (Uint16Array boundary):", result[0]);
        expect(result[0]).assertEqual(32768);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0600
     * @tc.name      testDeque02GetLast0006
     * @tc.desc      test Deque getLast with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0006';
        console.log(TAG + ' start');
        let deque: Deque<Int32Array> = new Deque<Int32Array>();
        deque.insertFront(new Int32Array([-2147483648]));
        deque.insertFront(new Int32Array([2147483647]));
        deque.insertEnd(new Int32Array([0]));
        let result: Int32Array = deque.getLast();
        console.info("Last element (Int32Array boundary):", result[0]);
        expect(result[0]).assertEqual(0);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0700
     * @tc.name      testDeque02GetLast0007
     * @tc.desc      test Deque getLast with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0007';
        console.log(TAG + ' start');
        let deque: Deque<Uint32Array> = new Deque<Uint32Array>();
        deque.insertFront(new Uint32Array([0]));
        deque.insertFront(new Uint32Array([4294967295]));
        deque.insertEnd(new Uint32Array([2147483648]));
        let result: Uint32Array = deque.getLast();
        console.info("Last element (Uint32Array boundary):", result[0]);
        expect(result[0]).assertEqual(2147483648);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0800
     * @tc.name      testDeque02GetLast0008
     * @tc.desc      test Deque getLast with Float32Array boundary and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0008';
        console.log(TAG + ' start');
        let deque: Deque<Float32Array> = new Deque<Float32Array>();
        deque.insertFront(new Float32Array([-3.4028234663852886e38]));
        deque.insertFront(new Float32Array([3.4028234663852886e38]));
        deque.insertEnd(new Float32Array([Infinity]));
        deque.insertEnd(new Float32Array([-Infinity]));
        deque.insertEnd(new Float32Array([NaN]));
        const float32Value = new Float32Array([1.2e-38]);
        const actualStoredValue = float32Value[0];
        deque.insertEnd(float32Value);
        let result: Float32Array = deque.getLast();
        console.info("Last element (Float32Array):", result[0]);
        expect(result[0]).assertEqual(actualStoredValue);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_0900
     * @tc.name      testDeque02GetLast0009
     * @tc.desc      test Deque getLast with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0009';
        console.log(TAG + ' start');
        let deque: Deque<Float64Array> = new Deque<Float64Array>();
        deque.insertFront(new Float64Array([-1.7976931348623157e308]));
        deque.insertFront(new Float64Array([1.7976931348623157e308]));
        deque.insertEnd(new Float64Array([5e-324]));
        let result: Float64Array = deque.getLast();
        console.info("Last element (Float64Array boundary):", result[0]);
        expect(result[0]).assertEqual(5e-324);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1000
     * @tc.name      testDeque02GetLast0010
     * @tc.desc      test Deque getLast with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0010';
        console.log(TAG + ' start');
        let deque: Deque<BigInt64Array> = new Deque<BigInt64Array>();
        deque.insertFront(new BigInt64Array([-9223372036854775808n]));
        deque.insertFront(new BigInt64Array([9223372036854775807n]));
        deque.insertEnd(new BigInt64Array([0n]));
        let result: BigInt64Array = deque.getLast();
        console.info("Last element (BigInt64Array boundary):", result[0]);
        expect(result[0]).assertEqual(0n);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1100
     * @tc.name      testDeque02GetLast0011
     * @tc.desc      test Deque getLast with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0011';
        console.log(TAG + ' start');
        let deque: Deque<BigUint64Array> = new Deque<BigUint64Array>();
        deque.insertFront(new BigUint64Array([0n]));
        deque.insertFront(new BigUint64Array([18446744073709551615n]));
        deque.insertEnd(new BigUint64Array([9223372036854775808n]));
        let result: BigUint64Array = deque.getLast();
        console.info("Last element (BigUint64Array boundary):", result[0]);
        expect(result[0]).assertEqual(9223372036854775808n);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1200
     * @tc.name      testDeque02GetLast0012
     * @tc.desc      test Deque getLast with TypedArray special value storage rules (Float types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0012';
        console.log(TAG + ' start');
        let deque: Deque<Float32Array> = new Deque<Float32Array>();
        deque.insertFront(new Float32Array([Infinity]));
        deque.insertEnd(new Float32Array([-Infinity]));
        deque.insertEnd(new Float32Array([NaN]));
        let result: Float32Array = deque.getLast();
        console.info("Last element (Float32Array NaN):", result[0]);
        expect(Number.isNaN(result[0])).assertTrue();
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1300
     * @tc.name      testDeque02GetLast0013
     * @tc.desc      test Deque getLast with TypedArray special value storage rules (Int types)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0013';
        console.log(TAG + ' start');
        let deque: Deque<Int8Array> = new Deque<Int8Array>();
        deque.insertFront(new Int8Array([72]));
        const nanValue: number = NaN;
        deque.insertEnd(new Int8Array([nanValue]));
        let result: Int8Array = deque.getLast();
        console.info("Last element (Int8Array NaN conversion):", result[0]);
        expect(result[0]).assertEqual(0);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1400
     * @tc.name      testDeque02GetLast0014
     * @tc.desc      test Deque getLast with String type - undefined/null/empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0014';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertFront("undefined");
        deque.insertEnd("null");
        deque.insertEnd("");
        deque.insertEnd("test");
        let result: string = deque.getLast();
        console.info("Last element (String):", result);
        expect(result).assertEqual("test");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1500
     * @tc.name      testDeque02GetLast0015
     * @tc.desc      test Deque getLast with String type - special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0015';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        deque.insertFront(specialChars);
        deque.insertEnd("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");
        deque.insertEnd("ASCII_TEST");
        let result: string = deque.getLast();
        console.info("Last element (String special chars):", result);
        expect(result).assertEqual("ASCII_TEST");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1600
     * @tc.name      testDeque02GetLast0016
     * @tc.desc      test Deque getLast with String type - escape sequences
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0016';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertFront("Line1\\nLine2");
        deque.insertEnd("Tab\\tSeparated");
        deque.insertEnd("Backspace\\bTest");
        deque.insertEnd("Escape\\x41\\x42\\x43");
        deque.insertEnd("Octal\\101\\102\\103");
        let result: string = deque.getLast();
        console.info("Last element (String escape):", result);
        expect(result).assertEqual("Octal\\101\\102\\103");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1700
     * @tc.name      testDeque02GetLast0017
     * @tc.desc      test Deque getLast with String type - emojis and Unicode
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0017';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        const emojis = ["👆", "👿", "👀", "💯", "🎅", "😼", "🔧", "💇", "🤼‍♂️", "🛢", "🀄", "🏴"];
        const unicodeEncoded = ["\\ud83d\\udc46", "\\ud83d\\udc7f", "\\ud83d\\udc40", "\\ud83d\\udcaf",
          "\\ud83c\\udf85", "\\ud83d\\ude3c", "\\ud83d\\udd27", "\\ud83d\\udc87",
          "\\ud83e\\udd3c\\u200d\\u2642\\ufe0f", "\\ud83d\\udee2", "\\ud83c\\udc04", "\\ud83c\\udff4"];
        for (let i = 0; i < emojis.length; i++) {
          deque.insertFront(emojis[i]);
          deque.insertFront(unicodeEncoded[i]);
        }
        deque.insertEnd("TestLast");
        let result: string = deque.getLast();
        console.info("Last element (String emoji):", result);
        expect(result).assertEqual("TestLast");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1800
     * @tc.name      testDeque02GetLast0018
     * @tc.desc      test Deque getLast with String type - keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0018';
        console.log(TAG + ' start');
        let deque: Deque<string> = new Deque<string>();
        deque.insertFront("0");
        deque.insertFront("NaN");
        deque.insertFront("");
        deque.insertFront("undefined");
        deque.insertFront("null");
        deque.insertEnd("LastElement");
        let result: string = deque.getLast();
        console.info("Last element (String keywords):", result);
        expect(result).assertEqual("LastElement");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_1900
     * @tc.name      testDeque02GetLast0019
     * @tc.desc      test Deque getLast with Number type - basic values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0019';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(0);
        deque.insertFront(NaN);
        deque.insertFront(-0);
        deque.insertFront(Infinity);
        deque.insertFront(-Infinity);
        deque.insertEnd(42);
        let result: number = deque.getLast();
        console.info("Last element (Number basic):", result);
        expect(result).assertEqual(42);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2000
     * @tc.name      testDeque02GetLast0020
     * @tc.desc      test Deque getLast with Number type - boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0020';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(Number.MAX_VALUE);
        deque.insertFront(Number.MIN_VALUE);
        deque.insertFront(Number.EPSILON);
        deque.insertFront(Number.MAX_SAFE_INTEGER);
        deque.insertFront(Math.floor(1.5));
        deque.insertEnd(123.456);
        let result: number = deque.getLast();
        console.info("Last element (Number boundary):", result);
        expect(result).assertEqual(123.456);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2100
     * @tc.name      testDeque02GetLast0021
     * @tc.desc      test Deque getLast with Number type - different numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0021';
        console.log(TAG + ' start');
        let deque: Deque<number> = new Deque<number>();
        deque.insertFront(0xdecafafecacefade);
        deque.insertFront(0x0102);
        deque.insertFront(0x01020304);
        deque.insertFront(0o3);
        deque.insertFront(2 ** 3);
        deque.insertFront(1e3);
        deque.insertFront(2.5e-2);
        deque.insertEnd(9007199254740991);
        let result: number = deque.getLast();
        console.info("Last element (Number representations):", result);
        expect(result).assertEqual(9007199254740991);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2200
     * @tc.name      testDeque02GetLast0022
     * @tc.desc      test Deque getLast with BigInt type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0022';
        console.log(TAG + ' start');
        let deque: Deque<bigint> = new Deque<bigint>();
        deque.insertFront(BigInt(0xdecafafecacefade));
        deque.insertFront(9007199254740991n);
        deque.insertFront(-9223372036854775808n);
        deque.insertFront(9223372036854775807n);
        deque.insertEnd(0n);
        let result: bigint = deque.getLast();
        console.info("Last element (BigInt):", result.toString());
        expect(result).assertEqual(0n);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2300
     * @tc.name      testDeque02GetLast0023
     * @tc.desc      test Deque getLast with Boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0023';
        console.log(TAG + ' start');
        let deque: Deque<boolean> = new Deque<boolean>();
        deque.insertFront(true);
        deque.insertFront(false);
        deque.insertFront(false);
        deque.insertFront(false);
        deque.insertFront(false);
        deque.insertFront(false);
        deque.insertFront(false);
        deque.insertEnd(false);
        deque.insertEnd(true);
        deque.insertEnd(true);
        let result: boolean = deque.getLast();
        console.info("Last element (Boolean):", result);
        expect(result).assertTrue();
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2400
     * @tc.name      testDeque02GetLast0024
     * @tc.desc      test Deque getLast with Array type - normal arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0024';
        console.log(TAG + ' start');
        let deque: Deque<number[]> = new Deque<number[]>();
        deque.insertFront([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
        deque.insertFront([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
        deque.insertFront([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
        deque.insertEnd([1, 2, 3]);
        let result: number[] = deque.getLast();
        console.info("Last element (Array):", result);
        expect(result).assertDeepEquals([1, 2, 3]);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2500
     * @tc.name      testDeque02GetLast0025
     * @tc.desc      test Deque getLast with custom object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0025';
        console.log(TAG + ' start');
        let deque: Deque<ArrayLikeObject> = new Deque<ArrayLikeObject>();
        const customObj = new ArrayLikeObject();
        customObj.zero = 333;
        customObj.abc = 111;
        customObj.aaa = 222;
        const simpleObj = new ArrayLikeObject();
        simpleObj.zero = 999;
        deque.insertFront(customObj);
        deque.insertEnd(simpleObj);
        let result: ArrayLikeObject = deque.getLast();
        console.info("Last element (Custom object):", result.zero);
        expect(result.zero).assertEqual(999);
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2600
     * @tc.name      testDeque02GetLast0026
     * @tc.desc      test Deque getLast with TestObject type - basic objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0026';
        console.log(TAG + ' start');
        let deque: Deque<TestObject> = new Deque<TestObject>();
        const obj1 = new TestObject();
        obj1.a = 1;
        obj1.b = "test";
        obj1.c = [1, 2, 3];
        const obj2 = new TestObject();
        obj2.last = "last";
        deque.insertFront(obj1);
        deque.insertEnd(obj2);
        let result: TestObject = deque.getLast();
        console.info("Last element (TestObject basic):", JSON.stringify(result));
        expect(result.last).assertEqual("last");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2700
     * @tc.name      testDeque02GetLast0027
     * @tc.desc      test Deque getLast with ComplexObject type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0027';
        console.log(TAG + ' start');
        let deque: Deque<ComplexObject> = new Deque<ComplexObject>();
        const child = new ComplexObject();
        child.childProp = 2;
        const mixedObj = new MixedKeyObject();
        mixedObj.a = 1;
        mixedObj.b = 3;
        const simpleObj = new ComplexObject();
        simpleObj.last = "last";
        deque.insertFront(child);
        deque.insertEnd(simpleObj);
        let result: ComplexObject = deque.getLast();
        console.info("Last element (ComplexObject):", JSON.stringify(result));
        expect(result.last).assertEqual("last");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2800
     * @tc.name      testDeque02GetLast0028
     * @tc.desc      test Deque getLast with ObjectWithBuiltins type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0028';
        console.log(TAG + ' start');
        let deque: Deque<ObjectWithBuiltins> = new Deque<ObjectWithBuiltins>();
        const builtinObj = new ObjectWithBuiltins();
        builtinObj.last = true;
        const emptyObj = new ObjectWithBuiltins();
        deque.insertFront(emptyObj);
        deque.insertEnd(builtinObj);
        let result: ObjectWithBuiltins = deque.getLast();
        console.info("Last element (ObjectWithBuiltins):", JSON.stringify(result));
        expect(result.last).assertTrue();
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_2900
     * @tc.name      testDeque02GetLast0029
     * @tc.desc      test Deque getLast with DeleteTestObject type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0029';
        console.log(TAG + ' start');
        let deque: Deque<DeleteTestObject> = new Deque<DeleteTestObject>();
        const obj1 = new DeleteTestObject();
        obj1.b = 2;
        const obj2 = new DeleteTestObject();
        obj2.a = 1;
        const obj3 = new DeleteTestObject();
        obj3.a = 1;
        const lastObj = new DeleteTestObject();
        lastObj.last = "last";
        deque.insertFront(obj1);
        deque.insertFront(obj2);
        deque.insertFront(obj3);
        deque.insertEnd(lastObj);
        let result: DeleteTestObject = deque.getLast();
        console.info("Last element (DeleteTestObject):", JSON.stringify(result));
        expect(result.last).assertEqual("last");
        console.log(TAG + ' done');
        
      });

    /**
     * @tc.number    SUB_DEQUE_GETLAST02_3000
     * @tc.name      testDeque02GetLast0030
     * @tc.desc      test Deque getLast with union type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testDeque02GetLast0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testDeque02GetLast0030';
        console.log(TAG + ' start');
        type MixedType = Int8Array | Uint8Array | string | number | bigint | boolean | number[] | TestObject;
        let deque: Deque<MixedType> = new Deque<MixedType>();
        deque.insertFront(new Int8Array([-128]));
        deque.insertFront(new Uint8Array([255]));
        deque.insertFront("Hello World");
        deque.insertFront(42);
        deque.insertFront(9007199254740991n);
        deque.insertFront(true);
        deque.insertFront([1, 2, 3]);
        const testObj = new TestObject();
        testObj.key = "value";
        deque.insertFront(testObj);
        deque.insertEnd("LastElement");
        let result: MixedType = deque.getLast();
        console.info("Last element (Mixed type):", result);
        expect(result as string).assertEqual("LastElement");
        console.log(TAG + ' done');
        
      });

  })
}