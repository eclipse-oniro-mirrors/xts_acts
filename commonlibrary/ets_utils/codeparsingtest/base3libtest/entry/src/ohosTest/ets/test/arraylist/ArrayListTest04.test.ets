import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@ohos.base';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList04Test() {
  describe('ArrayList04Test', () => {
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
     * @tc.number    SUB_ARRAYLIST_ADD01_0100
     * @tc.name      testArrayList01Add0001
     * @tc.desc      Add Int8Array boundary elements to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01Add0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0001';
        console.log(TAG + ' start');
        const list = new ArrayList<Int8Array>();
        const int8Array1 = new Int8Array([-128,127]);
        const int8Array2 = new Int8Array([-129,128]);
        list.add(int8Array1);
        list.add(int8Array2);
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

    });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_0200
     * @tc.name      testArrayList01Add0002
     * @tc.desc      Add Unit8Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testArrayList01Add0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0002';
        console.log(TAG + ' start');
        const list = new ArrayList<Int8Array>();
        const int8Array1 = new Int8Array([0,255]);
        const int8Array2 = new Int8Array([-1,256]);
        list.add(int8Array1);
        list.add(int8Array2);
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_0300
     * @tc.name      testArrayList01Add0003
     * @tc.desc      Add Uint8ClampedArray with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0003';
        console.log(TAG + ' start');
        const list = new ArrayList<Uint8ClampedArray>();
        const boundaryArray = new Uint8ClampedArray([0, 255]);
        const clampArray = new Uint8ClampedArray([-1, 256]); // 会被钳制到[0,255]
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(clampArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_0400
     * @tc.name      testArrayList01Add0004
     * @tc.desc      Add Int16Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0004';
        console.log(TAG + ' start');
        const list = new ArrayList<Int16Array>();
        const boundaryArray = new Int16Array([-32768, 32767]);
        const overflowArray = new Int16Array([-32769, 32768]);
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(overflowArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_0500
     * @tc.name      testArrayList01Add0005
     * @tc.desc      Add Uint16Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0005';
        console.log(TAG + ' start');
        const list = new ArrayList<Uint16Array>();
        const boundaryArray = new Uint16Array([0, 65535]);
        const overflowArray = new Uint16Array([-1, 65536]);
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(overflowArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_0600
     * @tc.name      testArrayList01Add0006
     * @tc.desc      Add Int32Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0006';
        console.log(TAG + ' start');
        const list = new ArrayList<Int32Array>();
        const boundaryArray = new Int32Array([-2147483648, 2147483647]);
        const overflowArray = new Int32Array([-2147483649, 2147483648]);
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(overflowArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_0700
     * @tc.name      testArrayList01Add0007
     * @tc.desc      Add Uint32Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0007';
        console.log(TAG + ' start');
        const list = new ArrayList<Uint32Array>();
        const boundaryArray = new Uint32Array([0, 4294967295]);
        const overflowArray = new Uint32Array([-1, 4294967296]);
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(overflowArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_0800
     * @tc.name      testArrayList01Add0008
     * @tc.desc      Add Float32Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0008';
        console.log(TAG + ' start');
        const list = new ArrayList<Float32Array>();
        const boundaryArray = new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38, 1.2e-38]);
        const overflowArray = new Float32Array([-3.5e38, 3.5e38]);
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(overflowArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_0900
     * @tc.name      testArrayList01Add0009
     * @tc.desc      Add Float64Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0009';
        console.log(TAG + ' start');
        const list = new ArrayList<Float64Array>();
        const boundaryArray = new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308, 5e-324]);
        const overflowArray = new Float64Array([-1.8e308, 1.8e308]);
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(overflowArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1000
     * @tc.name      testArrayList01Add0010
     * @tc.desc      Add BigInt64Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0010';
        console.log(TAG + ' start');
        const list = new ArrayList<BigInt64Array>();
        const boundaryArray = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
        const overflowArray = new BigInt64Array([-9223372036854775809n, 9223372036854775808n]);
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(overflowArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1100
     * @tc.name      testArrayList01Add0011
     * @tc.desc      Add BigUint64Array with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0011';
        console.log(TAG + ' start');
        const list = new ArrayList<BigUint64Array>();
        const boundaryArray = new BigUint64Array([0n, 18446744073709551615n]);
        const overflowArray = new BigUint64Array([18446744073709551616n]);
        expect(list.add(boundaryArray)).assertTrue();
        expect(list.add(overflowArray)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1200
     * @tc.name      testArrayList01Add0012
     * @tc.desc      Add TypedArray with special values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0012';
        console.log(TAG + ' start');
        const float32List = new ArrayList<Float32Array>();
        const float32Array = new Float32Array([Infinity, -Infinity, NaN]);
        expect(float32List.add(float32Array)).assertTrue();
        const int8List = new ArrayList<Int8Array>();
        const int8Array = new Int8Array([Infinity, -Infinity, NaN]);
        expect(int8List.add(int8Array)).assertTrue();
        const clampedList = new ArrayList<Uint8ClampedArray>();
        const clampedArray = new Uint8ClampedArray([Infinity, -Infinity, NaN]);
        expect(clampedList.add(clampedArray)).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1300
     * @tc.name      testArrayList01Add0013
     * @tc.desc      Add string with basic values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0013';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        expect(list.add(undefined)).assertTrue();
        expect(list.add(null)).assertTrue();
        expect(list.add("")).assertTrue();
        expect(list.length).assertEqual(3);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1400
     * @tc.name      testArrayList01Add0014
     * @tc.desc      Add string with special characters to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0014';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        const asciiChars = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
        expect(list.add(specialChars)).assertTrue();
        expect(list.add(asciiChars)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1500
     * @tc.name      testArrayList01Add0015
     * @tc.desc      Add string with escape characters to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0015';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        const escapeChars = "\a\b\f\n\r\t\v\\\'\"\?";
        expect(list.add(escapeChars)).assertTrue();
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1600
     * @tc.name      testArrayList01Add0016
     * @tc.desc      Add string with emoji characters to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0016';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        const emojis = "👆👿👀💯🎅😼🔧💇🤼‍♂️🛢🀄🏴";
        const unicode = "\ud83d\udc46\ud83d\udc7f\ud83d\udc40\ud83d\udcaf\ud83c\udf85\ud83d\ude3c\ud83d\udd27\ud83d\udc87\ud83e\udd3c\u200d\u2642\ufe0f\ud83d\udee2\ud83c\udc04\ud83c\udff4";
        expect(list.add(emojis)).assertTrue();
        expect(list.add(unicode)).assertTrue();
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1700
     * @tc.name      testArrayList01Add0017
     * @tc.desc      Add number with basic values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0017';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        expect(list.add(0)).assertTrue();
        expect(list.add(NaN)).assertTrue();
        expect(list.add(-0)).assertTrue();
        expect(list.add(Infinity)).assertTrue();
        expect(list.add(-Infinity)).assertTrue();
        expect(list.length).assertEqual(5);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1800
     * @tc.name      testArrayList01Add0018
     * @tc.desc      Add number with boundary values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0018';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        expect(list.add(Number.MAX_VALUE)).assertTrue();
        expect(list.add(Number.MIN_VALUE)).assertTrue();
        expect(list.add(Number.EPSILON)).assertTrue();
        expect(list.add(Number.MAX_SAFE_INTEGER)).assertTrue();
        expect(list.length).assertEqual(4);
        console.log(TAG + ' done');
      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_1900
     * @tc.name      testArrayList01Add0019
     * @tc.desc      Add number with various formats to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0019';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        expect(list.add(0xdecafafecacefade)).assertTrue();
        expect(list.add(123.456)).assertTrue();
        expect(list.add(0xcafebabe)).assertTrue();
        expect(list.add(0x0102)).assertTrue();
        expect(list.add(0o3)).assertTrue();
        expect(list.add(2 ** 3)).assertTrue();
        expect(list.add(1e3)).assertTrue();
        expect(list.length).assertEqual(7);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_2000
     * @tc.name      testArrayList01Add0020
     * @tc.desc      Add boolean values to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0020';
        console.log(TAG + ' start');
        const list = new ArrayList<boolean>();
        expect(list.add(true)).assertTrue();
        expect(list.add(false)).assertTrue();
        expect(list.add(null)).assertTrue();
        expect(list.add(undefined)).assertTrue();
        expect(list.length).assertEqual(4);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_2100
     * @tc.name      testArrayList01Add0021
     * @tc.desc      Add normal array to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0021';
        console.log(TAG + ' start');
        const list = new ArrayList<Array<number>>();
        const helloArray = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
        const zeroArray = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
        const negativeArray = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
        expect(list.add(helloArray)).assertTrue();
        expect(list.add(zeroArray)).assertTrue();
        expect(list.add(negativeArray)).assertTrue();
        expect(list.length).assertEqual(3);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_2200
     * @tc.name      testArrayList01Add0022
     * @tc.desc      Add arrays with mixed types to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0022';
        console.log(TAG + ' start');
        type MixedType = number | string | boolean | null | undefined;
        const list = new ArrayList<Array<MixedType>>();
        const numberArray: Array<number> = [72, 101, NaN, Infinity, 108, 111];
        const mixedArray: Array<MixedType> = [72, "abc", true, null, undefined, 108];
        const emptyArray: Array<MixedType> = [];
        const largeNumberArray: Array<number> = [256, 65536, 32768];
        expect(list.add(numberArray)).assertTrue();
        expect(list.add(mixedArray)).assertTrue();
        expect(list.add(emptyArray)).assertTrue();
        expect(list.add(largeNumberArray)).assertTrue();
        expect(list.length).assertEqual(4);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_2300
     * @tc.name      testArrayList01Add0023
     * @tc.desc      Add typed objects to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0023';
        console.log(TAG + ' start');
        interface SimpleObject {
          a: number;
          b: string;
          c: number[];
        }

        interface DeepObject {
          e: number;
        }

        interface MiddleObject {
          c: number;
          d: DeepObject;
        }

        interface NestedObject {
          a: number;
          b: MiddleObject;
        }

        interface RecordObject {
          x?: number;
          y?: string;
          z?: boolean;
        }

        class Person {
          name: string = "";
          age: number = 0;
        }

        interface EmptyObject {
        }

        type AllowedObject = SimpleObject | NestedObject | Person | RecordObject | EmptyObject;
        const list = new ArrayList<AllowedObject>();
        const simpleObj: SimpleObject = {
          a: 1,
          b: "test",
          c: [1, 2, 3]
        };

        expect(list.add(simpleObj)).assertTrue();

        const nestedObj: NestedObject = {
          a: 1,
          b: {
            c: 2,
            d: {
              e: 3
            }
          }
        };
        expect(list.add(nestedObj)).assertTrue();
        const emptyObj: EmptyObject = {};
        expect(list.add(emptyObj)).assertTrue();
        const recordObj: RecordObject = {
          x: 10,
          y: "hello",
          z: true
        };
        expect(list.add(recordObj)).assertTrue();
        const personObj = new Person();
        personObj.name = "Alice";
        personObj.age = 25;
        expect(list.add(personObj)).assertTrue();
        expect(list.length).assertEqual(5);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_2400
     * @tc.name      testArrayList01Add0024
     * @tc.desc      Add special objects to ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0024';
        console.log(TAG + ' start');
        interface NestedValue {
          a: number;
        }

        interface ObjectWithSpecialValues {
          a?: number | null | undefined;
          b: number;
        }

        interface ObjectWithBuffer {
          buffer: ArrayBuffer;
        }

        interface ObjectWithDataView {
          view: DataView;
        }

        interface SimpleKeyValue {
          key1: string;
          key2: NestedValue;
        }

        interface ObjectWithArray {
          items: number[];
        }

        interface RegExpFlags {
          source: string;
          flags: string;
        }

        interface ObjectWithRegex {
          regex: RegExp;
          flags: RegExpFlags;
        }

        interface ObjectWithDate {
          date: Date;
        }

        type SpecialObjectType = ObjectWithSpecialValues | ObjectWithBuffer |
        ObjectWithDataView | SimpleKeyValue |
        ObjectWithArray | ObjectWithRegex | ObjectWithDate;

        const list = new ArrayList<SpecialObjectType>();

        const objWithUndefined: ObjectWithSpecialValues = {
          a: undefined,
          b: 1
        };
        expect(list.add(objWithUndefined)).assertTrue();

        const objWithNull: ObjectWithSpecialValues = {
          a: null,
          b: 1
        };
        expect(list.add(objWithNull)).assertTrue();

        const objWithNaN: ObjectWithSpecialValues = {
          a: NaN,
          b: 1
        };
        expect(list.add(objWithNaN)).assertTrue();

        const objWithInfinity: ObjectWithSpecialValues = {
          a: Infinity,
          b: 1
        };
        expect(list.add(objWithInfinity)).assertTrue();

        const objWithBuffer: ObjectWithBuffer = {
          buffer: new ArrayBuffer(16)
        };
        expect(list.add(objWithBuffer)).assertTrue();

        const bufferForView = new ArrayBuffer(16);
        const dataViewInstance = new DataView(bufferForView);
        const objWithDataView: ObjectWithDataView = {
          view: dataViewInstance
        };
        expect(list.add(objWithDataView)).assertTrue();

        const nestedValue: NestedValue = {
          a: 1
        };

        const simpleKeyValue: SimpleKeyValue = {
          key1: 'value1',
          key2: nestedValue
        };
        expect(list.add(simpleKeyValue)).assertTrue();

        const numberArray: number[] = [1, 2, 3, 2, 1];
        const objWithArray: ObjectWithArray = {
          items: numberArray
        };
        expect(list.add(objWithArray)).assertTrue();

        const regexInstance = new RegExp('abc', 'gi');

        const flagsObj: RegExpFlags = {
          source: 'def',
          flags: 'm'
        };

        const objWithRegex: ObjectWithRegex = {
          regex: regexInstance,
          flags: flagsObj
        };
        expect(list.add(objWithRegex)).assertTrue();
        const dateInstance = new Date();
        const objWithDate: ObjectWithDate = {
          date: dateInstance
        };
        expect(list.add(objWithDate)).assertTrue();
        expect(list.length).assertEqual(10);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_ADD01_2500
     * @tc.name      testArrayList01Add0025
     * @tc.desc      Add multiple type elements to ArrayList (comprehensive test)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList01Add0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList01Add0025';
        console.log(TAG + ' start');
        class C1 {
          name: string = "";
          age: string = "";
        }
        const list = new ArrayList<string | number | boolean | Array<number> | C1>();
        expect(list.add("a")).assertTrue();
        expect(list.add(1)).assertTrue();
        expect(list.add([1, 2, 3])).assertTrue();
        const c: C1 = {name: "Dylan", age: "13"};
        expect(list.add(c)).assertTrue();
        expect(list.add(false)).assertTrue();
        expect(list.length).assertEqual(5);
        console.log(TAG + ' done');

    });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0100
     * @tc.name      testArrayList02Insert0001
     * @tc.desc      Insert number element at valid index in ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0001';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(3);
        list.insert(2, 1);
        expect(list.length).assertEqual(3);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0200
     * @tc.name      testArrayList02Insert0002
     * @tc.desc      Insert string element at beginning of ArrayList
     * @tc.size      MediumTest
     * @tc.type      Functio2
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0002';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add("world");
        list.insert("hello", 0);
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0300
     * @tc.name      testArrayList02Insert0003
     * @tc.desc      Insert boolean element at end of ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0003';
        console.log(TAG + ' start');
        const list = new ArrayList<boolean>();
        list.add(true);
        list.insert(false, 1);
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0400
     * @tc.name      testArrayList02Insert0004
     * @tc.desc      Attempt to insert element at invalid index (out of range)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0004';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        try {
          list.insert(2, 5);
          console.log("No error thrown for invalid index");
        } catch (error) {
          console.log("Expected error caught:", error.message);
        }
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0500
     * @tc.name      testArrayList02Insert0005
     * @tc.desc      Insert element at index 0 in empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0005';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.insert(42, 0);
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0600
     * @tc.name      testArrayList02Insert0006
     * @tc.desc      Insert number boundary values at valid positions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0006';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.insert(0, 0);
        list.insert(NaN, 1);
        list.insert(Infinity, 2);
        list.insert(-Infinity, 3);
        list.insert(Number.MAX_VALUE, 4);
        list.insert(Number.MIN_VALUE, 5);
        list.insert(Number.MAX_SAFE_INTEGER, 6);
        expect(list.length).assertEqual(7);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0700
     * @tc.name      testArrayList02Insert0007
     * @tc.desc      Insert string with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0007';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.insert("", 0);
        list.insert("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~", 1);
        list.insert("👆👿👀💯", 2); // 表情符号
        expect(list.length).assertEqual(3);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0800
     * @tc.name      testArrayList02Insert0008
     * @tc.desc      Insert boolean values and false-like values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0008';
        console.log(TAG + ' start');
        const list = new ArrayList<boolean>();
        list.insert(true, 0);
        list.insert(false, 1);
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_0900
     * @tc.name      testArrayList02Insert0009
     * @tc.desc      Insert number array into ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0009';
        console.log(TAG + ' start');
        const list = new ArrayList<number[]>();
        const array1 = [1, 2, 3];
        const array2 = [4, 5, 6];
        list.insert(array1, 0);
        list.insert(array2, 1);
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1000
     * @tc.name      testArrayList02Insert0010
     * @tc.desc      Insert mixed type array into ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0010';
        console.log(TAG + ' start');
        type MixedType = number | string | boolean | null;
        const list = new ArrayList<MixedType[]>();
        const mixedArray: MixedType[] = [1, "test", true, null];
        list.insert(mixedArray, 0);
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1100
     * @tc.name      testArrayList02Insert0011
     * @tc.desc      Insert TypedArray into ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0011';
        console.log(TAG + ' start');
        const list = new ArrayList<Int8Array>();
        const typedArray = new Int8Array([-128, 0, 127]);
        list.insert(typedArray, 0);
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1200
     * @tc.name      testArrayList02Insert0012
     * @tc.desc      Insert custom object into ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0012';
        console.log(TAG + ' start');
        interface Person {
          name: string;
          age: number;
        }
        const list = new ArrayList<Person>();
        const person: Person = { name: "Alice", age: 25 };
        list.insert(person, 0);
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1300
     * @tc.name      testArrayList02Insert0013
     * @tc.desc      Insert multiple type elements into ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0013';
        console.log(TAG + ' start');
        const list = new ArrayList<number | string | boolean>();
        list.insert("A", 0);
        list.insert(0, 1);
        list.insert(true, 2);
        expect(list.length).assertEqual(3);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1400
     * @tc.name      testArrayList02Insert0014
     * @tc.desc      Test insert with index boundary conditions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0014';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.insert(0, 0);
        list.insert(2.5, 3);
        list.insert(4, list.length);
        expect(list.length).assertEqual(6);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1500
     * @tc.name      testArrayList02Insert0015
     * @tc.desc      Test insert with large index value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0015';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        try {
          list.insert(1, 1000000);
          console.log("Large index insertion attempted");
        } catch (err) {
          console.log("Error with large index:", err.message);
          expect(err.message).assertEqual('The value of "index" is out of range. It must be >= 0 && <= 0. Received value is: 1000000');
        }
        console.log(TAG + ' end');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1600
     * @tc.name      testArrayList02Insert0016
     * @tc.desc      Test insert with negative index (should fail)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0016';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        try {
          list.insert(2, -1);
          console.log("No error for negative index");
        } catch (err) {
          console.log("Expected error for negative index:", err.message);
          expect(err.message).assertEqual('The value of "index" is out of range. It must be >= 0 && <= 1. Received value is: -1');
        }
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1700
     * @tc.name      testArrayList02Insert0017
     * @tc.desc      Test insert with decimal index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0017';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        try {
          list.insert(1, 0.5);
          console.log("Decimal index insertion attempted");
        } catch (err) {
          console.log("Error with decimal index:", err.message);
          expect(err.message).assertEqual('The type of "index" must be small integer. Received value is: 0.5');
        }
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1800
     * @tc.name      testArrayList02Insert0018
     * @tc.desc      Test insert null element into ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0018';
        console.log(TAG + ' start');
        const list = new ArrayList<number | null>();
        list.insert(null, 0);
        list.insert(1, 1);
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_1900
     * @tc.name      testArrayList02Insert0019
     * @tc.desc      Test insert undefined element into ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0019';
        console.log(TAG + ' start');
        const list = new ArrayList<number | undefined>();
        list.insert(undefined, 0);
        list.insert(1, 1);
        expect(list.length).assertEqual(2);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_2000
     * @tc.name      testArrayList02Insert0020
     * @tc.desc      Test insert BigInt value into ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0020';
        console.log(TAG + ' start');
        const list = new ArrayList<bigint>();
        list.insert(BigInt(9007199254740991), 0);
        expect(list.length).assertEqual(1);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_INSERT02_2100
     * @tc.name      testArrayList02Insert0021
     * @tc.desc      Test insert multiple elements and verify order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Insert0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Insert0021';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.insert(3, 0);
        list.insert(1, 0);
        list.insert(2, 1);
        list.insert(4, 3);
        expect(list.length).assertEqual(4);
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0100
     * @tc.name      testArrayList03Has0001
     * @tc.desc      Check if ArrayList contains existing number element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0001';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        const result = list.has(2);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0200
     * @tc.name      testArrayList03Has0002
     * @tc.desc      Check if ArrayList contains non-existent number element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0002';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        const result = list.has(99);
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0300
     * @tc.name      testArrayList03Has0003
     * @tc.desc      Check if ArrayList contains string element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0003';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add("squirrel");
        list.add("rabbit");
        const result = list.has("squirrel");
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0400
     * @tc.name      testArrayList03Has0004
     * @tc.desc      Check if ArrayList contains empty string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0004';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        list.add("");
        list.add("text");
        const result = list.has("");
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0500
     * @tc.name      testArrayList03Has0005
     * @tc.desc      Check if ArrayList contains boolean element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0005';
        console.log(TAG + ' start');
        const list = new ArrayList<boolean>();
        list.add(true);
        list.add(false);
        const result1 = list.has(true);
        const result2 = list.has(false);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0600
     * @tc.name      testArrayList03Has0006
     * @tc.desc      Check if ArrayList contains number special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0006';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(NaN);
        list.add(Infinity);
        list.add(-Infinity);
        list.add(Number.MAX_VALUE);
        const result1 = list.has(NaN);
        const result2 = list.has(Infinity);
        const result3 = list.has(-Infinity);
        const result4 = list.has(Number.MAX_VALUE);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        expect(result4).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0700
     * @tc.name      testArrayList03Has0007
     * @tc.desc      Check if ArrayList contains number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0007';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(0);
        list.add(-0);
        list.add(Number.MIN_VALUE);
        list.add(Number.EPSILON);
        list.add(Number.MAX_SAFE_INTEGER);
        list.add(Number.MIN_SAFE_INTEGER);
        const result1 = list.has(0);
        const result2 = list.has(-0);
        const result3 = list.has(Number.MIN_VALUE);
        const result4 = list.has(Number.EPSILON);
        const result5 = list.has(Number.MAX_SAFE_INTEGER);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        expect(result4).assertTrue();
        expect(result5).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0800
     * @tc.name      testArrayList03Has0008
     * @tc.desc      Check if ArrayList contains numbers in various formats
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0008';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(123.456);
        list.add(0xcafebabe);
        list.add(0x0102);
        list.add(0o777);
        list.add(2 ** 10);
        list.add(1e6);
        const result1 = list.has(123.456);
        const result2 = list.has(0xcafebabe);
        const result3 = list.has(0x0102);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_0900
     * @tc.name      testArrayList03Has0009
     * @tc.desc      Check if ArrayList contains BigInt element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0009';
        console.log(TAG + ' start');
        const list = new ArrayList<bigint>();
        list.add(BigInt(9007199254740991));
        list.add(BigInt(0xdecafafecacefade));
        const result = list.has(BigInt(9007199254740991));
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1000
     * @tc.name      testArrayList03Has0010
     * @tc.desc      Check if ArrayList contains string with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0010';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        const specialChars = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
        list.add(specialChars);
        const result = list.has(specialChars);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1100
     * @tc.name      testArrayList03Has0011
     * @tc.desc      Check if ArrayList contains string with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0011';
        console.log(TAG + ' start');
        const list = new ArrayList<string>();
        const emojis = "👆👿👀💯🎅";
        list.add(emojis);
        const result = list.has(emojis);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1200
     * @tc.name      testArrayList03Has0012
     * @tc.desc      Check if ArrayList contains array element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0012';
        console.log(TAG + ' start');
        const list = new ArrayList<number[]>();
        const array = [1, 2, 3];
        list.add(array);
        const result = list.has(array);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1300
     * @tc.name      testArrayList03Has0013
     * @tc.desc      Check if ArrayList contains TypedArray element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0013';
        console.log(TAG + ' start');
        const list = new ArrayList<Int8Array>();
        const typedArray = new Int8Array([-128, 0, 127]);
        list.add(typedArray);
        const result = list.has(typedArray);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1400
     * @tc.name      testArrayList03Has0014
     * @tc.desc      Check if ArrayList contains null element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0014';
        console.log(TAG + ' start');
        const list = new ArrayList<number | null>();
        list.add(null);
        list.add(1);
        const result = list.has(null);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1500
     * @tc.name      testArrayList03Has0015
     * @tc.desc      Check if ArrayList contains undefined element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0015';
        console.log(TAG + ' start');
        const list = new ArrayList<number | undefined>();
        list.add(undefined);
        list.add(1);
        const result = list.has(undefined);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1600
     * @tc.name      testArrayList03Has0016
     * @tc.desc      Check if ArrayList contains custom object element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0016';
        console.log(TAG + ' start');
        interface Person {
          name: string;
          age: number;
        }
        const list = new ArrayList<Person>();
        const person: Person = { name: "Alice", age: 25 };
        list.add(person);
        const result = list.has(person);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1700
     * @tc.name      testArrayList03Has0017
     * @tc.desc      Check if ArrayList contains elements of multiple types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0017';
        console.log(TAG + ' start');
        const list = new ArrayList<number | string | boolean>();
        list.add(1);
        list.add("text");
        list.add(true);
        const result1 = list.has(1);
        const result2 = list.has("text");
        const result3 = list.has(true);
        expect(result1).assertTrue();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1800
     * @tc.name      testArrayList03Has0018
     * @tc.desc      Check if ArrayList contains duplicate elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0018';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(1);
        const result = list.has(1);
        expect(result).assertTrue();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_1900
     * @tc.name      testArrayList03Has0019
     * @tc.desc      Check if empty ArrayList contains element
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0019';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        const result = list.has(1);
        expect(result).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_2000
     * @tc.name      testArrayList03Has0020
     * @tc.desc      Check has method uses reference equality for objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0020';
        console.log(TAG + ' start');
        interface Data {
          value: number;
        }
        const list = new ArrayList<Data>();
        const obj1: Data = { value: 1 };
        const obj2: Data = { value: 1 }; // 相同内容，不同引用
        list.add(obj1);
        const result1 = list.has(obj1); // 相同引用
        const result2 = list.has(obj2); // 不同引用
        expect(result1).assertTrue();
        expect(result2).assertFalse();
        console.log(TAG + ' done');

      });

    /**
     * @tc.number    SUB_ARRAYLIST_HAS03_2100
     * @tc.name      testArrayList03Has0021
     * @tc.desc      Check if ArrayList contains element after removal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList03Has0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList03Has0021';
        console.log(TAG + ' start');
        const list = new ArrayList<number>();
        list.add(1);
        list.add(2);
        list.add(3);
        list.remove(2);
        const result1 = list.has(2);
        const result2 = list.has(1);
        const result3 = list.has(3);
        expect(result1).assertFalse();
        expect(result2).assertTrue();
        expect(result3).assertTrue();
        console.log(TAG + ' done');

      });
  })
}

