import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList_01Test() {
  describe('ArrayList_01Test', () => {
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
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0100
     * @tc.name      testArrayList01Clear0001
     * @tc.desc      Test clearing ArrayList with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Int8Array>();

        const int8Array1 = new Int8Array([-128, 127]);
        const int8Array2 = new Int8Array([-129, 128]);

        arrayList.add(int8Array1);
        arrayList.add(int8Array2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0200
     * @tc.name      testArrayList01Clear0002
     * @tc.desc      Test clearing ArrayList with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0002';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Uint8Array>();

        const uint8Array1 = new Uint8Array([0, 255]);
        const uint8Array2 = new Uint8Array([-1, 256]);

        arrayList.add(uint8Array1);
        arrayList.add(uint8Array2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0300
     * @tc.name      testArrayList01Clear0003
     * @tc.desc      Test clearing ArrayList with Uint8ClampedArray boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0003';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Uint8ClampedArray>();

        const clampedArray1 = new Uint8ClampedArray([0, 255]);
        const clampedArray2 = new Uint8ClampedArray([-1, 256]);

        arrayList.add(clampedArray1);
        arrayList.add(clampedArray2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0400
     * @tc.name      testArrayList01Clear0004
     * @tc.desc      Test clearing ArrayList with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0004';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Int16Array>();

        const int16Array1 = new Int16Array([-32768, 32767]);
        const int16Array2 = new Int16Array([-32769, 32768]);

        arrayList.add(int16Array1);
        arrayList.add(int16Array2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0500
     * @tc.name      testArrayList01Clear0005
     * @tc.desc      Test clearing ArrayList with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0005';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Uint16Array>();

        const uint16Array1 = new Uint16Array([0, 65535]);
        const uint16Array2 = new Uint16Array([-1, 65536]);

        arrayList.add(uint16Array1);
        arrayList.add(uint16Array2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0600
     * @tc.name      testArrayList01Clear0006
     * @tc.desc      Test clearing ArrayList with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0006';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Int32Array>();

        const int32Array1 = new Int32Array([-2147483648, 2147483647]);
        const int32Array2 = new Int32Array([-2147483649, 2147483648]);

        arrayList.add(int32Array1);
        arrayList.add(int32Array2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0700
     * @tc.name      testArrayList01Clear0007
     * @tc.desc      Test clearing ArrayList with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0007';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Uint32Array>();

        const uint32Array1 = new Uint32Array([0, 4294967295]);
        const uint32Array2 = new Uint32Array([-1, 4294967296]);

        arrayList.add(uint32Array1);
        arrayList.add(uint32Array2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0800
     * @tc.name      testArrayList01Clear0008
     * @tc.desc      Test clearing ArrayList with Float32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0008';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Float32Array>();

        const float32Array1 = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38]);
        const float32Array2 = new Float32Array([-3.5e38, 3.5e38]);

        arrayList.add(float32Array1);
        arrayList.add(float32Array2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_0900
     * @tc.name      testArrayList01Clear0009
     * @tc.desc      Test clearing ArrayList with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0009';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Float64Array>();

        const float64Array1 = new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308]);
        const float64Array2 = new Float64Array([-1.8E308, 1.8E308]);

        arrayList.add(float64Array1);
        arrayList.add(float64Array2);

        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1000
     * @tc.name      testArrayList01Clear0010
     * @tc.desc      Test clearing ArrayList with TypedArray special values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0010';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Float32Array | Float64Array | Int8Array | Uint8ClampedArray>();

        const float32Array = new Float32Array([Infinity, -Infinity, NaN]);
        const float64Array = new Float64Array([Infinity, -Infinity, NaN]);
        const int8Array = new Int8Array([Infinity, -Infinity, NaN]);
        const uint8ClampedArray = new Uint8ClampedArray([Infinity, -Infinity, NaN]);

        arrayList.add(float32Array);
        arrayList.add(float64Array);
        arrayList.add(int8Array);
        arrayList.add(uint8ClampedArray);

        expect(arrayList.length).assertEqual(4);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1100
     * @tc.name      testArrayList01Clear0011
     * @tc.desc      Test clearing ArrayList with string special values (undefined, null, empty string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0011';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string | null | undefined>();

        arrayList.add(undefined);
        arrayList.add(null);
        arrayList.add("");
        arrayList.add("undefined");
        arrayList.add("null");

        expect(arrayList.length).assertEqual(5);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1200
     * @tc.name      testArrayList01Clear0012
     * @tc.desc      Test clearing ArrayList with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0012';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        arrayList.add(specialChars);

        const doubleSpecialChars = "!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~";
        arrayList.add(doubleSpecialChars);

        expect(arrayList.length).assertEqual(2);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1300
     * @tc.name      testArrayList01Clear0013
     * @tc.desc      Test clearing ArrayList with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0013';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        let asciiString = "";
        for (let i = 32; i <= 126; i++) {
          asciiString += String.fromCharCode(i);
        }
        arrayList.add(asciiString);

        arrayList.add("\t");

        expect(arrayList.length).assertEqual(2);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1400
     * @tc.name      testArrayList01Clear0014
     * @tc.desc      Test clearing ArrayList with escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0014';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        arrayList.add("\\a");
        arrayList.add("\\b");
        arrayList.add("\\f");
        arrayList.add("\\n");
        arrayList.add("\\r");
        arrayList.add("\\t");
        arrayList.add("\\v");
        arrayList.add("\\\\");
        arrayList.add("\\'");
        arrayList.add('\\"');
        arrayList.add("\\?");
        arrayList.add("\\0");
        arrayList.add("\\101");
        arrayList.add("\\x41");

        expect(arrayList.length).assertEqual(14);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1500
     * @tc.name      testArrayList01Clear0015
     * @tc.desc      Test clearing ArrayList with emoji and Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0015';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        arrayList.add("👆");
        arrayList.add("👿");
        arrayList.add("👀");
        arrayList.add("💯");
        arrayList.add("🎅");
        arrayList.add("😼");
        arrayList.add("🔧");
        arrayList.add("💇");
        arrayList.add("🤼‍♂️");
        arrayList.add("🛢");
        arrayList.add("🀄");
        arrayList.add("🏴");

        arrayList.add("\ud83d\udc46");
        arrayList.add("\ud83d\udc7f");
        arrayList.add("\ud83d\udc40");
        arrayList.add("\ud83d\udcaf");
        arrayList.add("\ud83c\udf85");
        arrayList.add("\ud83d\ude3c");
        arrayList.add("\ud83d\udd27");
        arrayList.add("\ud83d\udc87");
        arrayList.add("\ud83e\udd3c\u200d\u2642\ufe0f");
        arrayList.add("\ud83d\udee2");
        arrayList.add("\ud83c\udc04");
        arrayList.add("\ud83c\udff4");

        expect(arrayList.length).assertEqual(24);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1600
     * @tc.name      testArrayList01Clear0016
     * @tc.desc      Test clearing ArrayList with invalid Unicode and keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0016';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        arrayList.add("\udc04");
        arrayList.add("\ud83d");
        arrayList.add("\udff4");
        arrayList.add("0");
        arrayList.add("NaN");
        arrayList.add("");

        expect(arrayList.length).assertEqual(6);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1700
     * @tc.name      testArrayList01Clear0017
     * @tc.desc      Test clearing ArrayList with number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0017';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number | undefined>();

        arrayList.add(0);
        arrayList.add(undefined);
        arrayList.add(NaN);
        arrayList.add(-0);
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(Math.floor(1.5));
        arrayList.add(Number.MAX_VALUE);
        arrayList.add(Number.MIN_VALUE);
        arrayList.add(Number.EPSILON);
        arrayList.add(Number.MAX_SAFE_INTEGER);

        expect(arrayList.length).assertEqual(11);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1800
     * @tc.name      testArrayList01Clear0018
     * @tc.desc      Test clearing ArrayList with various numeric types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0018';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();

        arrayList.add(-128);
        arrayList.add(127);

        arrayList.add(-32768);
        arrayList.add(32767);

        arrayList.add(-2147483648);
        arrayList.add(2147483647);

        arrayList.add(-9223372036854775808);
        arrayList.add(9223372036854775807);

        arrayList.add(0);
        arrayList.add(65535);

        arrayList.add(1.40129846432481707e-45);
        arrayList.add(3.40282346638528860e+38);
        arrayList.add(-1.40129846432481707e-45);
        arrayList.add(-3.40282346638528860e+38);

        arrayList.add(4.94065645841246544e-324);
        arrayList.add(1.79769313486231570e+308);

        expect(arrayList.length).assertEqual(16);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_1900
     * @tc.name      testArrayList01Clear0019
     * @tc.desc      Test clearing ArrayList with various numeric representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0019';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number | bigint>();

        arrayList.add(BigInt(0xdecafafecacefade));
        arrayList.add(BigInt(9007199254740991n));

        arrayList.add(123.456);

        arrayList.add(0x0102);
        arrayList.add(0x01020304);

        arrayList.add(0o3);

        arrayList.add(2**3);

        arrayList.add(1e3);
        arrayList.add(2.5e-2);

        expect(arrayList.length).assertEqual(9);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2000
     * @tc.name      testArrayList01Clear0020
     * @tc.desc      Test clearing ArrayList with boolean and falsy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0020';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<boolean | number | string | null | undefined>();

        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(0);
        arrayList.add(NaN);
        arrayList.add("");
        arrayList.add(null);
        arrayList.add(undefined);
        arrayList.add(!'s');
        arrayList.add(!0);

        expect(arrayList.length).assertEqual(9);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2100
     * @tc.name      testArrayList01Clear0021
     * @tc.desc      Test clearing ArrayList with various array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0021';
        console.log(TAG + ' start');

        type MixedArray = (number | string | boolean | null | undefined)[];
        let arrayList = new ArrayList<MixedArray | number[] | string[]>();

        arrayList.add([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);

        arrayList.add(["hello", "world", "test"]);

        arrayList.add([true, false, true]);

        arrayList.add([72, "abc", true, null, undefined, 108]);

        expect(arrayList.length).assertEqual(4);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2200
     * @tc.name      testArrayList01Clear0022
     * @tc.desc      Test clearing ArrayList with objects and arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0022';
        console.log(TAG + ' start');

        interface SimpleObject {
          a?: number;
          b?: number;
        }

        interface ObjectWithProperties {
          a: number;
          b?: number;
        }

        let arrayList = new ArrayList<SimpleObject | ObjectWithProperties | number[] | Record<string, number>>();

        const obj1: SimpleObject = { b: 2 };
        arrayList.add(obj1);

        const arr: number[] = [1, 3];
        arrayList.add(arr);

        const obj2: ObjectWithProperties = { a: 1 };
        arrayList.add(obj2);

        const obj3: SimpleObject = { a: 1 };
        arrayList.add(obj3);

        const obj4: ObjectWithProperties = { a: 1 };
        arrayList.add(obj4);

        expect(arrayList.length).assertEqual(5);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2300
     * @tc.name      testArrayList01Clear0023
     * @tc.desc      Test clearing ArrayList with various object types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0023';
        console.log(TAG + ' start');

        class PlainObject {
          a: number;
          b: string;
          c: number[];

          constructor(a: number, b: string, c: number[]) {
            this.a = a;
            this.b = b;
            this.c = c;
          }
        }

        class GeneratedTypeLiteralInterface_2 {
          e: number;

          constructor(e: number) {
            this.e = e;
          }
        }

        class GeneratedTypeLiteralInterface_1 {
          c: number;
          d: GeneratedTypeLiteralInterface_2;

          constructor(c: number, d: GeneratedTypeLiteralInterface_2) {
            this.c = c;
            this.d = d;
          }
        }

        class NestedObject {
          a: number;
          b: GeneratedTypeLiteralInterface_1;

          constructor(a: number, b: GeneratedTypeLiteralInterface_1) {
            this.a = a;
            this.b = b;
          }
        }

        class ObjectWithFunction {
          a: number;
          b: () => void;

          constructor(a: number, b: () => void) {
            this.a = a;
            this.b = b;
          }
        }

        class ObjectWithBuffer {
          buffer: ArrayBuffer;

          constructor(buffer: ArrayBuffer) {
            this.buffer = buffer;
          }
        }

        class ObjectWithDataView {
          view: DataView;

          constructor(view: DataView) {
            this.view = view;
          }
        }

        class EmptyObject {
        }

        class LargeObject {
          key0: number;
          key1: number;
          key2: number;
          key3: number;
          key4: number;
          key5: number;
          key6: number;
          key7: number;
          key8: number;
          key9: number;

          constructor(
            key0: number, key1: number, key2: number, key3: number, key4: number,
            key5: number, key6: number, key7: number, key8: number, key9: number
          ) {
            this.key0 = key0;
            this.key1 = key1;
            this.key2 = key2;
            this.key3 = key3;
            this.key4 = key4;
            this.key5 = key5;
            this.key6 = key6;
            this.key7 = key7;
            this.key8 = key8;
            this.key9 = key9;
          }
        }

        let arrayList = new ArrayList<PlainObject |
        NestedObject |
        ObjectWithFunction |
        ObjectWithBuffer |
        ObjectWithDataView |
        EmptyObject |
        LargeObject>();

        const plainObj = new PlainObject(1, "test", [1, 2, 3]);
        arrayList.add(plainObj);

        const nestedObj = new NestedObject(
          1,
          new GeneratedTypeLiteralInterface_1(
            2,
            new GeneratedTypeLiteralInterface_2(3)
          )
        );
        arrayList.add(nestedObj);

        const objWithFunc = new ObjectWithFunction(
          1,
          () => {
            console.log("function called");
          }
        );
        arrayList.add(objWithFunc);

        const objWithBuffer = new ObjectWithBuffer(new ArrayBuffer(16));
        arrayList.add(objWithBuffer);

        const objWithDataView = new ObjectWithDataView(new DataView(new ArrayBuffer(16)));
        arrayList.add(objWithDataView);

        const emptyObj = new EmptyObject();
        arrayList.add(emptyObj);

        const largeObj = new LargeObject(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
        arrayList.add(largeObj);

        expect(arrayList.length).assertEqual(7);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2400
     * @tc.name      testArrayList01Clear0024
     * @tc.desc      Test clearing ArrayList with objects containing special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0024';
        console.log(TAG + ' start');

        class SimpleValue {
          a: number;

          constructor(a: number) {
            this.a = a;
          }
        }

        class ObjectWithUndefined {
          a?: number;
          b: number;

          constructor(b: number, a?: number) {
            this.b = b;
            this.a = a;
          }
        }

        class ObjectWithNull {
          a: null;
          b: number;

          constructor(b: number) {
            this.a = null;
            this.b = b;
          }
        }

        class ObjectWithNaN {
          a: number;
          b: number;

          constructor(b: number) {
            this.a = NaN;
            this.b = b;
          }
        }

        class ObjectWithInfinity {
          a: number;
          b: number;

          constructor(b: number) {
            this.a = Infinity;
            this.b = b;
          }
        }

        class ObjectWithUint8Array {
          buffer: Uint8Array;

          constructor(buffer: Uint8Array) {
            this.buffer = buffer;
          }
        }

        class ObjectWithMap {
          map: Map<string, string | SimpleValue>;

          constructor(map: Map<string, string | SimpleValue>) {
            this.map = map;
          }
        }

        class ObjectWithSet {
          set: Set<number>;

          constructor(set: Set<number>) {
            this.set = set;
          }
        }

        class ObjectWithPromise {
          promise: Promise<string>;

          constructor(promise: Promise<string>) {
            this.promise = promise;
          }
        }

        class ObjectWithRegex {
          regex: RegExp;
          flags: RegExp;

          constructor(regex: RegExp, flags: RegExp) {
            this.regex = regex;
            this.flags = flags;
          }
        }

        let arrayList = new ArrayList<ObjectWithUndefined |
        ObjectWithNull |
        ObjectWithNaN |
        ObjectWithInfinity |
        ObjectWithUint8Array |
        ObjectWithMap |
        ObjectWithSet |
        ObjectWithPromise |
        ObjectWithRegex>();

        const mapInstance = new Map<string, string | SimpleValue>([
          ['key1', 'value1'],
          ['key2', new SimpleValue(1)]
        ]);

        const setInstance = new Set<number>([1, 2, 3, 2, 1]);

        const promiseInstance = new Promise<string>((resolve) => {
          setTimeout(() => resolve('done'), 100);
        });

        const obj1 = new ObjectWithUndefined(1);
        arrayList.add(obj1);

        const obj2 = new ObjectWithNull(1);
        arrayList.add(obj2);

        const obj3 = new ObjectWithNaN(1);
        arrayList.add(obj3);

        const obj4 = new ObjectWithInfinity(1);
        arrayList.add(obj4);

        const obj5 = new ObjectWithUint8Array(new Uint8Array([72, 101, 108, 108, 111]));
        arrayList.add(obj5);

        const obj6 = new ObjectWithMap(mapInstance);
        arrayList.add(obj6);

        const obj7 = new ObjectWithSet(setInstance);
        arrayList.add(obj7);

        const obj8 = new ObjectWithPromise(promiseInstance);
        arrayList.add(obj8);

        const obj9 = new ObjectWithRegex(/abc/gi, /def/m);
        arrayList.add(obj9);

        expect(arrayList.length).assertEqual(9);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2500
     * @tc.name      testArrayList01Clear0025
     * @tc.desc      Test clearing ArrayList with treeString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0025';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        let initTreeString: (size: number) => string = (size: number): string => {
          let ans = '[';
          while (ans.length < size) {
            ans += '{"a":1},';
          }
          ans += '{"a":1}]';
          return ans;
        };

        const treeString = initTreeString(1000);
        arrayList.add(treeString);
        arrayList.add(initTreeString(500));
        arrayList.add(initTreeString(100));

        expect(arrayList.length).assertEqual(3);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2600
     * @tc.name      testArrayList01Clear0026
     * @tc.desc      Test clearing ArrayList with sliceString type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0026';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        const originalStr = "{k1:value1,k2:value2}";
        const sliceStr = originalStr.substring(0, originalStr.length - 2);

        arrayList.add(originalStr);
        arrayList.add(sliceStr);

        for (let i = 0; i < 10; i++) {
          const str = `{key${i}:value${i}}`;
          const sliced = str.substring(0, str.length - 1);
          arrayList.add(sliced);
        }

        expect(arrayList.length).assertEqual(12);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2700
     * @tc.name      testArrayList01Clear0027
     * @tc.desc      Test clearing ArrayList with large strings and memory behavior
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0027', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0027';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        const largeString = "a".repeat(10000);
        arrayList.add(largeString);

        for (let i = 0; i < 10; i++) {
          arrayList.add("test".repeat(1000) + i);
        }

        expect(arrayList.length).assertEqual(11);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
        arrayList.add("test after clear");
        arrayList.add("another test");
        expect(arrayList.length).assertEqual(2);
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2800
     * @tc.name      testArrayList01Clear0028
     * @tc.desc      Test clearing ArrayList with BigInt64Array and BigUint64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0028';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<BigInt64Array | BigUint64Array>();
        const bigInt64Array1 = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
        const bigUint64Array1 = new BigUint64Array([0n, 18446744073709551615n]);

        arrayList.add(bigInt64Array1);
        arrayList.add(bigUint64Array1);

        expect(arrayList.length).assertEqual(2);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_2900
     * @tc.name      testArrayList01Clear0029
     * @tc.desc      Test clearing empty ArrayList multiple times
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0029';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();

        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

        console.log('Initial ArrayList length: ' + arrayList.length);
        arrayList.clear();
        console.log('After first clear: ' + arrayList.length);

        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);

        expect(arrayList.length).assertEqual(3);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3000
     * @tc.name      testArrayList01Clear0030
     * @tc.desc      Test clearing ArrayList with mixed types comprehensively
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0030', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0030';
        console.log(TAG + ' start');

        class KeyNumberObject {
          key: string;
          number: number;

          constructor(key: string, number: number) {
            this.key = key;
            this.number = number;
          }
        }

        type MixedType =
          | Int8Array
          | Uint8Array
          | string
          | number
          | boolean
          | null
          | undefined
          | number[]
          | KeyNumberObject
          | Date
          | RegExp
          | (() => string)
          | Map<string, string>
          | Set<number>
          | Promise<void>
          | ArrayBuffer
          | DataView;

        let arrayList = new ArrayList<MixedType>();

        arrayList.add(new Int8Array([-128, 0, 127]));
        arrayList.add(new Uint8Array([0, 128, 255]));
        arrayList.add("Hello World!");
        arrayList.add(42);
        arrayList.add(3.14159);
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(null);
        arrayList.add(undefined);
        arrayList.add([1, 2, 3, 4, 5]);
        arrayList.add(new KeyNumberObject("value", 123));

        arrayList.add(new Date());

        arrayList.add(/test/gi);

        const regularFunction = (): string => {
          return "test";
        };
        const arrowFunction = (): string => "arrow function";
        arrayList.add(regularFunction);
        arrayList.add(arrowFunction);

        const mapInstance = new Map<string, string>([["key", "value"]]);
        arrayList.add(mapInstance);

        const setInstance = new Set<number>([1, 2, 3]);
        arrayList.add(setInstance);

        const promiseInstance = new Promise<void>((resolve) => {
          resolve();
        });
        arrayList.add(promiseInstance);
        arrayList.add(new ArrayBuffer(16));
        arrayList.add(new DataView(new ArrayBuffer(16)));

        expect(arrayList.length).assertEqual(20);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3100
     * @tc.name      testArrayList01Clear0031
     * @tc.desc      Test clearing ArrayList with Int8Array complete boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0031';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<Int8Array>();

        const int8Arrays = [
          new Int8Array([-128]),
          new Int8Array([-1]),
          new Int8Array([0]),
          new Int8Array([1]),
          new Int8Array([127]),
          new Int8Array([-128, 0, 127]),
          new Int8Array([-129]),
          new Int8Array([128])
        ];

        int8Arrays.forEach(arr => arrayList.add(arr));

        expect(arrayList.length).assertEqual(8);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3200
     * @tc.name      testArrayList01Clear0032
     * @tc.desc      Test clearing ArrayList with all TypedArray types combination
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0032', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0032';
        console.log(TAG + ' start');

        type TypedArrayType =
          | Int8Array
          | Uint8Array
          | Uint8ClampedArray
          | Int16Array
          | Uint16Array
          | Int32Array
          | Uint32Array
          | Float32Array
          | Float64Array
          | BigInt64Array
          | BigUint64Array;

        let arrayList = new ArrayList<TypedArrayType>();

        arrayList.add(new Int8Array([-128, 127]));
        arrayList.add(new Uint8Array([0, 255]));
        arrayList.add(new Uint8ClampedArray([0, 255]));
        arrayList.add(new Int16Array([-32768, 32767]));
        arrayList.add(new Uint16Array([0, 65535]));
        arrayList.add(new Int32Array([-2147483648, 2147483647]));
        arrayList.add(new Uint32Array([0, 4294967295]));
        arrayList.add(new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38]));
        arrayList.add(new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308]));

        let expectedLength = 9;

        if (typeof BigInt64Array !== 'undefined') {
          arrayList.add(new BigInt64Array([-9223372036854775808n, 9223372036854775807n]));
          expectedLength++;
        } else {
          console.log('BigInt64Array not supported, skipping');
        }

        if (typeof BigUint64Array !== 'undefined') {
          arrayList.add(new BigUint64Array([0n, 18446744073709551615n]));
          expectedLength++;
        } else {
          console.log('BigUint64Array not supported, skipping');
        }

        expect(arrayList.length).assertEqual(expectedLength);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3300
     * @tc.name      testArrayList01Clear0033
     * @tc.desc      Test clearing ArrayList with complete ASCII character set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0033';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        for (let i = 32; i <= 126; i++) {
          arrayList.add(String.fromCharCode(i));
        }

        arrayList.add("\t");
        arrayList.add("\n");
        arrayList.add("\r");

        expect(arrayList.length).assertEqual(98);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3400
     * @tc.name      testArrayList01Clear0034
     * @tc.desc      Test clearing ArrayList with all escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0034';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        const escapeChars = [
          "\\a",
          "\\b",
          "\\f",
          "\\n",
          "\\r",
          "\\t",
          "\\v",
          "\\\\",
          "\\'",
          '\\"',
          "\\?",
          "\\0",
          "\\101",
          "\\x41",
          "\\u0041",
          "\\u{41}"
        ];

        escapeChars.forEach(char => arrayList.add(char));

        expect(arrayList.length).assertEqual(16);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3500
     * @tc.name      testArrayList01Clear0035
     * @tc.desc      Test clearing ArrayList with various Unicode characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0035';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        const unicodeChars = [
          "À",
          "Ω",
          "あ",
          "ア",
          "中",
          "한",
          "😀",
          "🌍",
          "🚀",
          "❤️",
          "👨‍👩‍👧‍👦",
          "\uD83D\uDE00",
          "\u0041\u0301",
          "\u00C1",
          "𐐀",
          "񀀀"
        ];

        unicodeChars.forEach(char => arrayList.add(char));

        expect(arrayList.length).assertEqual(16);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3600
     * @tc.name      testArrayList01Clear0036
     * @tc.desc      Test clearing ArrayList with complete numeric range tests
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0036', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0036';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();

        for (let i = -128; i <= 127; i += 32) {
          arrayList.add(i);
        }

        arrayList.add(-32768);
        arrayList.add(-16384);
        arrayList.add(0);
        arrayList.add(16384);
        arrayList.add(32767);

        arrayList.add(-2147483648);
        arrayList.add(-1073741824);
        arrayList.add(1073741824);
        arrayList.add(2147483647);

        arrayList.add(-9007199254740991);
        arrayList.add(9007199254740991);

        arrayList.add(0.1);
        arrayList.add(0.01);
        arrayList.add(0.001);
        arrayList.add(1.1);
        arrayList.add(1.01);
        arrayList.add(1.001);

        expect(arrayList.length).assertEqual(25);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3700
     * @tc.name      testArrayList01Clear0037
     * @tc.desc      Test clearing ArrayList with different number bases
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0037';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();

        arrayList.add(0b0);
        arrayList.add(0b1);
        arrayList.add(0b10);
        arrayList.add(0b11111111);

        arrayList.add(0o0);
        arrayList.add(0o1);
        arrayList.add(0o10);
        arrayList.add(0o777);

        arrayList.add(0);
        arrayList.add(1);
        arrayList.add(10);
        arrayList.add(255);

        arrayList.add(0x0);
        arrayList.add(0x1);
        arrayList.add(0xA);
        arrayList.add(0xFF);
        arrayList.add(0xFFFFFFFF);

        arrayList.add(0b1010);
        arrayList.add(0o12);
        arrayList.add(10);
        arrayList.add(0xA);

        expect(arrayList.length).assertEqual(21);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_01_3800
     * @tc.name      testArrayList01Clear0038
     * @tc.desc      Test clearing ArrayList with various array combinations
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Clear0038', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Clear0038';
        console.log(TAG + ' start');

        type BasicElement = number | string | boolean | null | undefined;

        type OneDimensionalArray = BasicElement[];

        type TwoDimensionalArray = OneDimensionalArray[];

        type ThreeDimensionalArray = TwoDimensionalArray[];

        type SparseArray = (BasicElement | undefined)[];

        type ArrayType = OneDimensionalArray | TwoDimensionalArray | ThreeDimensionalArray | SparseArray;

        let arrayList = new ArrayList<ArrayType>();

        const emptyArray1: OneDimensionalArray = [];
        const emptyArray2: OneDimensionalArray = new Array() as OneDimensionalArray;
        const emptyArray3: OneDimensionalArray = Array() as OneDimensionalArray;

        arrayList.add(emptyArray1);
        arrayList.add(emptyArray2);
        arrayList.add(emptyArray3);

        const singleNumberArray: OneDimensionalArray = [1];
        const singleStringArray: OneDimensionalArray = ["test"];
        const singleBooleanArray: OneDimensionalArray = [true];
        const singleNullArray: OneDimensionalArray = [null];
        const singleUndefinedArray: OneDimensionalArray = [undefined];

        arrayList.add(singleNumberArray);
        arrayList.add(singleStringArray);
        arrayList.add(singleBooleanArray);
        arrayList.add(singleNullArray);
        arrayList.add(singleUndefinedArray);

        const numberArray: OneDimensionalArray = [1, 2, 3, 4, 5];
        const stringArray: OneDimensionalArray = ["a", "b", "c", "d", "e"];
        const booleanArray: OneDimensionalArray = [true, false, true];

        arrayList.add(numberArray);
        arrayList.add(stringArray);
        arrayList.add(booleanArray);

        const nestedNumberArray: TwoDimensionalArray = [[1, 2], [3, 4]];
        const nestedStringArray: TwoDimensionalArray = [["a", "b"], ["c", "d"]];
        const deepNestedArray: ThreeDimensionalArray = [[[1, 2], [3, 4]], [[5, 6], [7, 8]]];

        arrayList.add(nestedNumberArray);
        arrayList.add(nestedStringArray);
        arrayList.add(deepNestedArray);

        const sparseArray: SparseArray = [];
        sparseArray[0] = 1;
        sparseArray[10] = 2;
        sparseArray[100] = 3;
        arrayList.add(sparseArray);

        const typedArrayConversion: OneDimensionalArray =
          Array.from(new Uint8Array([72, 101, 108, 108, 111])) as OneDimensionalArray;
        arrayList.add(typedArrayConversion);

        expect(arrayList.length).assertEqual(16);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });
  })
}