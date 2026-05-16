import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList_02Test() {
  describe('ArrayList_02Test', () => {
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
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_02_3900
     * @tc.name      testArrayList02Clear0039
     * @tc.desc      Test clearing ArrayList with object variations in ArkTS
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clear0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clear0039';
        console.log(TAG + ' start');

        interface EmptyObject {}

        interface SinglePropertyObject {
          a: number;
        }

        interface MultiplePropertiesObject {
          a: number;
          b: number;
          c: number;
        }

        interface PropertyWithDash {
          "property-with-dash": number;
        }

        interface PropertyWithSpace {
          "property with space": number;
        }

        interface NumberProperty {
          "123": number;
        }

        interface EmptyStringProperty {
          "": number;
        }

        type AllowedObjectType =
          | EmptyObject
          | SinglePropertyObject
          | MultiplePropertiesObject
          | PropertyWithDash
          | PropertyWithSpace
          | NumberProperty
          | EmptyStringProperty;

        let arrayList = new ArrayList<AllowedObjectType>();

        const emptyObj: EmptyObject = {};
        const singlePropObj: SinglePropertyObject = { a: 1 };
        const multiPropObj: MultiplePropertiesObject = { a: 1, b: 2, c: 3 };
        const dashPropObj: PropertyWithDash = { "property-with-dash": 1 };
        const spacePropObj: PropertyWithSpace = { "property with space": 1 };
        const numberPropObj: NumberProperty = { "123": 1 };
        const emptyStringPropObj: EmptyStringProperty = { "": 1 };

        arrayList.add(emptyObj);
        arrayList.add(singlePropObj);
        arrayList.add(multiPropObj);
        arrayList.add(dashPropObj);
        arrayList.add(spacePropObj);
        arrayList.add(numberPropObj);
        arrayList.add(emptyStringPropObj);

        expect(arrayList.length).assertEqual(7);
        expect(arrayList.isEmpty()).assertFalse();

        interface LargeObject {
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
        }

        const largeObj: LargeObject = {
          key0: 0,
          key1: 1,
          key2: 2,
          key3: 3,
          key4: 4,
          key5: 5,
          key6: 6,
          key7: 7,
          key8: 8,
          key9: 9
        };

        let largeArrayList = new ArrayList<LargeObject>();
        largeArrayList.add(largeObj);

        expect(largeArrayList.length).assertEqual(1);
        expect(largeArrayList.isEmpty()).assertFalse();

        largeArrayList.clear();
        expect(largeArrayList.length).assertEqual(0);
        expect(largeArrayList.isEmpty()).assertTrue();

        let objectConstructorList = new ArrayList<EmptyObject>();
        const obj1: EmptyObject = {};
        const obj2: EmptyObject = {};

        objectConstructorList.add(obj1);
        objectConstructorList.add(obj2);

        expect(objectConstructorList.length).assertEqual(2);
        expect(objectConstructorList.isEmpty()).assertFalse();
        objectConstructorList.clear();
        expect(objectConstructorList.length).assertEqual(0);
        expect(objectConstructorList.isEmpty()).assertTrue();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_02_4000
     * @tc.name      testArrayList02Clear0040
     * @tc.desc      Test clearing ArrayList with intensive operations
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clear0040', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clear0040';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        const startTime = Date.now();
        for (let i = 0; i < 1000; i++) {
          arrayList.add("string_" + i + "_" + "x".repeat(100));
        }
        const addTime = Date.now() - startTime;

        expect(arrayList.length).assertEqual(1000);
        expect(arrayList.isEmpty()).assertFalse();

        const clearStartTime = Date.now();
        arrayList.clear();
        const clearTime = Date.now() - clearStartTime;

        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();

        const reAddStartTime = Date.now();
        for (let i = 0; i < 10; i++) {
          arrayList.add("after_clear_" + i);
        }
        const reAddTime = Date.now() - reAddStartTime;

        expect(arrayList.length).assertEqual(10);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_02_4100
     * @tc.name      testArrayList02Clear0041
     * @tc.desc      Test clearing ArrayList with mixed data types stress test
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clear0041', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clear0041';
        console.log(TAG + ' start');

        interface SimpleObject {
          id: number;
          value: string;
        }

        type MixedType =
          | number
          | string
          | boolean
          | null
          | undefined
          | number[]
          | SimpleObject;

        let arrayList = new ArrayList<MixedType>();

        const testData: MixedType[] = [];

        for (let i = 0; i < 100; i++) {
          switch (i % 7) {
            case 0:
              testData.push(i);
              break;
            case 1:
              testData.push("string_" + i);
              break;
            case 2:
              testData.push(i % 2 === 0);
              break;
            case 3:
              testData.push(null);
              break;
            case 4:
              testData.push(undefined);
              break;
            case 5:
              testData.push([i, i + 1, i + 2]);
              break;
            case 6:
              testData.push({ id: i, value: "obj_" + i });
              break;
          }
        }

        testData.forEach(item => arrayList.add(item));

        expect(arrayList.length).assertEqual(100);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_02_4200
     * @tc.name      testArrayList02Clear0042
     * @tc.desc      Test clearing ArrayList performance with large data sets
     * @tc.size      LargeTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it('testArrayList02Clear0042', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clear0042';
        console.log(TAG + ' start');

        const sizes = [10, 100, 1000, 10000];

        for (const size of sizes) {
          console.log(`\nTesting with size: ${size}`);

          let arrayList = new ArrayList<number>();

          const startFill = Date.now();
          for (let i = 0; i < size; i++) {
            arrayList.add(i);
          }
          const fillTime = Date.now() - startFill;

          expect(arrayList.length).assertEqual(size);
          expect(arrayList.isEmpty()).assertFalse();

          console.log(`Fill ${size} elements time: ${fillTime}ms`);
          console.log(`Length before clear: ${arrayList.length}`);

          const startClear = Date.now();
          arrayList.clear();
          const clearTime = Date.now() - startClear;

          expect(arrayList.length).assertEqual(0);
          expect(arrayList.isEmpty()).assertTrue();

          if (arrayList.length !== 0) {
            console.error(`ERROR: ArrayList not empty after clear! Length: ${arrayList.length}`);
            expect().assertFail();
          }
        }
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_02_4300
     * @tc.name      testArrayList02Clear0043
     * @tc.desc      Test clearing ArrayList with referenced objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clear0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clear0043';
        console.log(TAG + ' start');

        interface ReferenceObject {
          name: string;
          ref?: ReferenceObject;
        }

        interface SelfReferencingObject {
          name: string;
          self?: SelfReferencingObject;
        }

        interface ArrayContainer {
          items: (string | ArrayContainer)[];
        }

        type ComplexType = ReferenceObject | SelfReferencingObject | ArrayContainer;

        let arrayList = new ArrayList<ComplexType>();

        const obj1: ReferenceObject = { name: "obj1" };
        const obj2: ReferenceObject = { name: "obj2", ref: obj1 };
        const selfRefObj: SelfReferencingObject = { name: "self" };
        const arrayContainer1: ArrayContainer = { items: ["array1"] };
        const arrayContainer2: ArrayContainer = { items: ["array2", arrayContainer1] };

        arrayList.add(obj1);
        arrayList.add(obj2);
        arrayList.add(selfRefObj);
        arrayList.add(arrayContainer1);
        arrayList.add(arrayContainer2);

        expect(arrayList.length).assertEqual(5);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_02_4400
     * @tc.name      testArrayList02Clear0044
     * @tc.desc      Test clearing ArrayList with TypedArray containing all special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clear0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clear0044';
        console.log(TAG + ' start');

        type TypedArrayType =
          | Float32Array
          | Float64Array
          | Int8Array
          | Uint8Array
          | Int16Array
          | Uint16Array
          | Int32Array
          | Uint32Array
          | Uint8ClampedArray;

        let arrayList = new ArrayList<TypedArrayType>();

        const float32Array = new Float32Array([Infinity, -Infinity, NaN, 0]);
        const float64Array = new Float64Array([Infinity, -Infinity, NaN, 0]);
        const int8Array = new Int8Array([Infinity, -Infinity, NaN, 0]);
        const uint8Array = new Uint8Array([Infinity, -Infinity, NaN, 0]);
        const int16Array = new Int16Array([Infinity, -Infinity, NaN, 0]);
        const uint16Array = new Uint16Array([Infinity, -Infinity, NaN, 0]);
        const int32Array = new Int32Array([Infinity, -Infinity, NaN, 0]);
        const uint32Array = new Uint32Array([Infinity, -Infinity, NaN, 0]);
        const uint8ClampedArray = new Uint8ClampedArray([Infinity, -Infinity, NaN, 0]);

        arrayList.add(float32Array);
        arrayList.add(float64Array);
        arrayList.add(int8Array);
        arrayList.add(uint8Array);
        arrayList.add(int16Array);
        arrayList.add(uint16Array);
        arrayList.add(int32Array);
        arrayList.add(uint32Array);
        arrayList.add(uint8ClampedArray);

        expect(arrayList.length).assertEqual(9);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_02_4500
     * @tc.name      testArrayList02Clear0045
     * @tc.desc      Test clearing ArrayList with string concatenation variations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clear0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clear0045';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();

        arrayList.add("Hello" + " " + "World");
        arrayList.add("".concat("Hello", " ", "World"));
        arrayList.add(["Hello", " ", "World"].join(""));
        arrayList.add(`Hello ${"World"}`);
        arrayList.add(String("Hello World"));

        arrayList.add(`Multi
                        line
                          string`);

        arrayList.add(`Template string: ${1 + 1}`);

        expect(arrayList.length).assertEqual(7);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLEAR_02_4600
     * @tc.name      testArrayList02Clear0046
     * @tc.desc      Test clearing ArrayList with number formatting variations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clear0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clear0046';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number | string>();

        arrayList.add(123);
        arrayList.add(123.456);
        arrayList.add(.1);
        arrayList.add(1.);
        arrayList.add(1e3);
        arrayList.add(1E3);
        arrayList.add(1e+3);
        arrayList.add(1e-3);
        arrayList.add(0.1e3);
        arrayList.add(1.23e-4);
        arrayList.add(1_000_000);
        arrayList.add(1_000.5_000);

        arrayList.add(0);
        arrayList.add(-0);
        arrayList.add(+0);
        arrayList.add(0.0);
        arrayList.add(-0.0);
        arrayList.add(+0.0);

        expect(arrayList.length).assertEqual(18);
        expect(arrayList.isEmpty()).assertFalse();
        arrayList.clear();
        expect(arrayList.length).assertEqual(0);
        expect(arrayList.isEmpty()).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0100
     * @tc.name      testArrayList02Clone0001
     * @tc.desc      Test clone method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0001';
        let arrayList = new ArrayList<Int8Array>();
        arrayList.add(new Int8Array([-128, 127]));
        arrayList.add(new Int8Array([-129, 128]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0]).assertEqual(-128);
        expect(clonedList[1][0]).assertEqual(127);
        expect(clonedList[1][1]).assertEqual(-128);

        clonedList[0][0] = -128;
        expect(arrayList[0][0]).assertEqual(-128);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0200
     * @tc.name      testArrayList02Clone0002
     * @tc.desc      Test clone method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0002';
        let arrayList = new ArrayList<Uint8Array>();
        arrayList.add(new Uint8Array([0, 255]));
        arrayList.add(new Uint8Array([-1, 256]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0]).assertEqual(0);
        expect(clonedList[0][1]).assertEqual(255);
        expect(clonedList[1][0]).assertEqual(255);
        expect(clonedList[1][1]).assertEqual(0);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0300
     * @tc.name      testArrayList02Clone0003
     * @tc.desc      Test clone method with Uint8ClampedArray boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0003';
        let arrayList = new ArrayList<Uint8ClampedArray>();
        arrayList.add(new Uint8ClampedArray([0, 255]));
        arrayList.add(new Uint8ClampedArray([-1, 256]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0]).assertEqual(0);
        expect(clonedList[0][1]).assertEqual(255);
        expect(clonedList[1][0]).assertEqual(0);
        expect(clonedList[1][1]).assertEqual(255);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0400
     * @tc.name      testArrayList02Clone0004
     * @tc.desc      Test clone method with Int16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0004';
        let arrayList = new ArrayList<Int16Array>();
        arrayList.add(new Int16Array([-32768, 32767]));
        arrayList.add(new Int16Array([-32769, 32768]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0]).assertEqual(-32768);
        expect(clonedList[0][1]).assertEqual(32767);
        expect(clonedList[1][0]).assertEqual(32767);
        expect(clonedList[1][1]).assertEqual(-32768);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0500
     * @tc.name      testArrayList02Clone0005
     * @tc.desc      Test clone method with Uint16Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0005';
        let arrayList = new ArrayList<Uint16Array>();
        arrayList.add(new Uint16Array([0, 65535]));
        arrayList.add(new Uint16Array([-1, 65536]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0]).assertEqual(0);
        expect(clonedList[0][1]).assertEqual(65535);
        expect(clonedList[1][0]).assertEqual(65535);
        expect(clonedList[1][1]).assertEqual(0);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0600
     * @tc.name      testArrayList02Clone0006
     * @tc.desc      Test clone method with Int32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0006';
        let arrayList = new ArrayList<Int32Array>();
        arrayList.add(new Int32Array([-2147483648, 2147483647]));
        arrayList.add(new Int32Array([-2147483649, 2147483648]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0]).assertEqual(-2147483648);
        expect(clonedList[0][1]).assertEqual(2147483647);
        expect(clonedList[1][0]).assertEqual(2147483647);
        expect(clonedList[1][1]).assertEqual(-2147483648);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0700
     * @tc.name      testArrayList02Clone0007
     * @tc.desc      Test clone method with Uint32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0007';
        let arrayList = new ArrayList<Uint32Array>();
        arrayList.add(new Uint32Array([0, 4294967295]));
        arrayList.add(new Uint32Array([-1, 4294967296]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0]).assertEqual(0);
        expect(clonedList[0][1]).assertEqual(4294967295);
        expect(clonedList[1][0]).assertEqual(4294967295);
        expect(clonedList[1][1]).assertEqual(0);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0800
     * @tc.name      testArrayList02Clone0008
     * @tc.desc      Test clone method with Float32Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0008';
        let arrayList = new ArrayList<Float32Array>();
        arrayList.add(new Float32Array([-3.4028234663852886e38, 3.4028234663852886e38]));
        arrayList.add(new Float32Array([-3.5e38, 3.5e38]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0].toString()).assertEqual("-3.4028234663852886e+38");
        expect(clonedList[1][0].toString()).assertEqual("-Infinity");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_0900
     * @tc.name      testArrayList02Clone0009
     * @tc.desc      Test clone method with Float64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0009';
        let arrayList = new ArrayList<Float64Array>();
        arrayList.add(new Float64Array([-1.7976931348623157e308, 1.7976931348623157e308]));
        arrayList.add(new Float64Array([-1.8e308, 1.8e308]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0].toString()).assertEqual("-1.7976931348623157e+308");
        expect(clonedList[1][0].toString()).assertEqual("-Infinity");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1000
     * @tc.name      testArrayList02Clone0010
     * @tc.desc      Test clone method with BigInt64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0010';
        let arrayList = new ArrayList<BigInt64Array>();
        arrayList.add(new BigInt64Array([-9223372036854775808n, 9223372036854775807n]));
        arrayList.add(new BigInt64Array([-9223372036854775809n, 9223372036854775808n]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0].toString()).assertEqual("-9223372036854775808");
        expect(clonedList[1][0].toString()).assertEqual("9223372036854775807");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1100
     * @tc.name      testArrayList02Clone0011
     * @tc.desc      Test clone method with BigUint64Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0011';
        let arrayList = new ArrayList<BigUint64Array>();
        arrayList.add(new BigUint64Array([0n, 18446744073709551615n]));
        arrayList.add(new BigUint64Array([18446744073709551616n]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);
        expect(clonedList[0][0].toString()).assertEqual("0");
        expect(clonedList[0][1].toString()).assertEqual("18446744073709551615");
        expect(clonedList[1][0].toString()).assertEqual("0");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1200
     * @tc.name      testArrayList02Clone0012
     * @tc.desc      Test clone method with TypedArray special values (Infinity, -Infinity, NaN)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0012';
        let arrayList =
          new ArrayList<Float32Array | Float64Array | Int8Array | Uint8Array | Int16Array | Uint16Array | Int32Array | Uint32Array | Uint8ClampedArray>();

        arrayList.add(new Float32Array([Infinity, -Infinity, NaN]));
        arrayList.add(new Float64Array([Infinity, -Infinity, NaN]));
        arrayList.add(new Int8Array([Infinity, -Infinity, NaN]));
        arrayList.add(new Uint8Array([Infinity, -Infinity, NaN]));
        arrayList.add(new Uint8ClampedArray([Infinity, -Infinity, NaN]));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(5);
        expect(Number.isFinite(clonedList[0][0])).assertFalse();
        expect(Number.isFinite(clonedList[0][1])).assertFalse();
        expect(Number.isNaN(clonedList[0][2])).assertTrue();
        expect(clonedList[2][0]).assertEqual(0);
        expect(clonedList[2][1]).assertEqual(0);
        expect(clonedList[2][2]).assertEqual(0);
        expect(clonedList[4][0]).assertEqual(255);
        expect(clonedList[4][1]).assertEqual(0);
        expect(clonedList[4][2]).assertEqual(0);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1300
     * @tc.name      testArrayList02Clone0013
     * @tc.desc      Test clone method with String special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0013';
        let arrayList = new ArrayList<string>();

        arrayList.add("");
        arrayList.add("");
        arrayList.add("");
        arrayList.add("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
        arrayList.add("!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~");
        arrayList.add("!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~");

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(6);
        expect(clonedList[2]).assertEqual("");
        expect(clonedList[3].length).assertEqual(32);

        clonedList[2] = "modified";
        expect(arrayList[2]).assertEqual("");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1400
     * @tc.name      testArrayList02Clone0014
     * @tc.desc      Test clone method with String escape characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0014';
        let arrayList = new ArrayList<string>();

        arrayList.add("\a\b\f\n\r\t\v\\\'\"\?");
        arrayList.add("\ud83d\udc46");
        arrayList.add("\ud83d\udc7f");
        arrayList.add("\ud83e\udd3c\u200d\u2642\ufe0f");

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(4);
        expect(clonedList[0].length).assertEqual(11);
        expect(clonedList[2]).assertEqual("👿");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1500
     * @tc.name      testArrayList02Clone0015
     * @tc.desc      Test clone method with emoji and Unicode values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0015';
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

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(12);
        expect(clonedList[0]).assertEqual("\ud83d\udc46");
        expect(clonedList[3]).assertEqual("\ud83d\udcaf");
        expect(clonedList[8].length).assertEqual(5);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1600
     * @tc.name      testArrayList02Clone0016
     * @tc.desc      Test clone method with invalid Unicode and keywords
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0016';
        let arrayList = new ArrayList<string>();

        arrayList.add("\udc04");
        arrayList.add("\ud83d");
        arrayList.add("\udff4");
        arrayList.add("0");
        arrayList.add("NaN");
        arrayList.add("");

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(6);
        expect(clonedList[0].length).assertEqual(1);
        expect(clonedList[3]).assertEqual("0");
        expect(clonedList[4]).assertEqual("NaN");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1700
     * @tc.name      testArrayList02Clone0017
     * @tc.desc      Test clone method with treeString and sliceString types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0017';

        const initTreeString = (size: number): string => {
          let ans = '[';
          while (ans.length < size) {
            ans += '{"a":1},';
          }
          ans += '{"a":1}]';
          return ans;
        };

        let arrayList = new ArrayList<string>();

        const treeString = initTreeString(100);
        arrayList.add(treeString);

        const originalStr = "{k1:value1,k2:value2}";
        const sliceStr = originalStr.substring(0, originalStr.length - 2);
        arrayList.add(sliceStr);

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(2);

        expect(clonedList[0].length > 100).assertTrue();
        expect(clonedList[0].startsWith('[')).assertTrue();
        expect(clonedList[0].endsWith('}]')).assertTrue();
        expect(clonedList[1]).assertEqual("{k1:value1,k2:value");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1800
     * @tc.name      testArrayList02Clone0018
     * @tc.desc      Test clone method with Number boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0018';
        let arrayList = new ArrayList<number>();

        arrayList.add(0);
        arrayList.add(Number.MIN_SAFE_INTEGER);
        arrayList.add(NaN);
        arrayList.add(-0);
        arrayList.add(Infinity);
        arrayList.add(-Infinity);
        arrayList.add(1.5);
        arrayList.add(Number.MAX_VALUE);
        arrayList.add(Number.MIN_VALUE);
        arrayList.add(Number.EPSILON);
        arrayList.add(Number.MAX_SAFE_INTEGER);
        arrayList.add(-128);
        arrayList.add(127);
        arrayList.add(-32768);
        arrayList.add(32767);
        arrayList.add(-2147483648);
        arrayList.add(2147483647);
        arrayList.add(-9223372036854775808);
        arrayList.add(9223372036854775807);

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(19);
        expect(clonedList[0]).assertEqual(0);
        expect(Number.isNaN(clonedList[2])).assertTrue();
        expect(clonedList[4] === Infinity).assertTrue();
        expect(clonedList[5] === -Infinity).assertTrue();
        expect(clonedList[6]).assertEqual(1.5);
        expect(clonedList[7]).assertEqual(Number.MAX_VALUE);
        expect(clonedList[10]).assertEqual(Number.MAX_SAFE_INTEGER);

        clonedList[0] = 999;
        expect(arrayList[0]).assertEqual(0);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_1900
     * @tc.name      testArrayList02Clone0019
     * @tc.desc      Test clone method with Number special representations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0019';
        let arrayList = new ArrayList<number | bigint>();

        arrayList.add(0xdecafafecacefade);
        arrayList.add(123.456);
        arrayList.add(0xcafebabe);
        arrayList.add(0x0102);
        arrayList.add(0x01020304);
        arrayList.add(0o377);
        arrayList.add(2**3);
        arrayList.add(1e3);
        arrayList.add(2.5e-2);
        arrayList.add(BigInt(9007199254740991));

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(10);
        expect(clonedList[0]).assertEqual(0xdecafafecacefade);
        expect(clonedList[1]).assertEqual(123.456);
        expect(clonedList[2]).assertEqual(0xcafebabe);
        expect(clonedList[3]).assertEqual(0x0102);
        expect(clonedList[5]).assertEqual(0o377);
        expect(clonedList[6]).assertEqual(8);
        expect(clonedList[7]).assertEqual(1000);
        expect(clonedList[8]).assertEqual(0.025);
        expect(clonedList[9].toString()).assertEqual("9007199254740991");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_2000
     * @tc.name      testArrayList02Clone0020
     * @tc.desc      Test clone method with Boolean and falsy values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0020';
        let arrayList = new ArrayList<boolean>();

        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(Boolean(0));
        arrayList.add(Boolean(NaN));
        arrayList.add(Boolean(""));
        arrayList.add(Boolean(null));
        arrayList.add(Boolean(undefined));
        arrayList.add(!'s');
        arrayList.add(!0);

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(9);
        expect(clonedList[0]).assertTrue();
        expect(clonedList[1]).assertFalse();
        expect(clonedList[2]).assertFalse();
        expect(clonedList[3]).assertFalse();
        expect(clonedList[4]).assertFalse();
        expect(clonedList[5]).assertFalse();
        expect(clonedList[6]).assertFalse();
        expect(clonedList[7]).assertFalse();
        expect(clonedList[8]).assertTrue();

        clonedList[0] = false;
        expect(arrayList[0]).assertTrue();
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_CLONE_02_2100
     * @tc.name      testArrayList02Clone0021
     * @tc.desc      Test clone method with normal arrays
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayList02Clone0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArrayList02Clone0021';
        let arrayList = new ArrayList<number[]>();

        arrayList.add([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
        arrayList.add([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
        arrayList.add([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
        arrayList.add([]);
        arrayList.add([256, 65536, 32768]);

        let clonedList = arrayList.clone();

        expect(clonedList.length).assertEqual(5);
        expect(clonedList[0][0]).assertEqual(72);
        expect(clonedList[0].length).assertEqual(14);
        expect(clonedList[1][9]).assertEqual(0);
        expect(clonedList[2][5]).assertEqual(87);
        expect(clonedList[2][6]).assertEqual(-111);
        expect(clonedList[3].length).assertEqual(0);

        clonedList[0][0] = 72;
        expect(arrayList[0][0]).assertEqual(72);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0100
     * @tc.name      testSubArray02List0001
     * @tc.desc      Test subArrayList with valid range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0001';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);

        let subList = arrayList.subArrayList(1, 4);

        expect(subList.length).assertEqual(3);
        expect(arrayList.length).assertEqual(5);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0200
     * @tc.name      testSubArray02List0002
     * @tc.desc      Test subArrayList with full range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0002';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("banana");
        arrayList.add("cherry");
        arrayList.add("date");

        let subList = arrayList.subArrayList(0, arrayList.length);

        expect(subList.length).assertEqual(4);
        expect(arrayList.length).assertEqual(4);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0300
     * @tc.name      testSubArray02List0003
     * @tc.desc      Test subArrayList with single element range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0003';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        arrayList.add(30);

        let subList = arrayList.subArrayList(1, 2);

        expect(subList.length).assertEqual(1);
        expect(arrayList.length).assertEqual(3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0400
     * @tc.name      testSubArray02List0004
     * @tc.desc      Test subArrayList on empty ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0004';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<boolean>();

        expect(arrayList.length).assertEqual(0);

        arrayList.add(true);
        expect(arrayList.length).assertEqual(1);

        arrayList.clear();

        expect(arrayList.length).assertEqual(0);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0500
     * @tc.name      testSubArray02List0005
     * @tc.desc      Test subArrayList with fromIndex out of range (negative)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0005';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);

        try {
          let subList = arrayList.subArrayList(-1, 2);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0600
     * @tc.name      testSubArray02List0006
     * @tc.desc      Test subArrayList with toIndex out of range
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0006';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);

        try {
          let subList = arrayList.subArrayList(0, 5);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0700
     * @tc.name      testSubArray02List0007
     * @tc.desc      Test subArrayList with fromIndex greater than toIndex
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0007';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);

        try {
          let subList = arrayList.subArrayList(2, 1);
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0800
     * @tc.name      testSubArray02List0008
     * @tc.desc      Test subArrayList with different data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0008';
        console.log(TAG + ' start');

        let strList = new ArrayList<string>();
        strList.add("A");
        strList.add("B");
        strList.add("C");
        strList.add("D");
        strList.add("E");

        let strSubList = strList.subArrayList(1, 4);
        expect(strSubList.length).assertEqual(3);
        expect(strList.length).assertEqual(5);

        interface Person {
          name: string;
          age: number;
        }

        let objList = new ArrayList<Person>();
        objList.add({ name: "Alice", age: 25 });
        objList.add({ name: "Bob", age: 30 });
        objList.add({ name: "Charlie", age: 35 });

        let objSubList = objList.subArrayList(0, 2);
        expect(objSubList.length).assertEqual(2);
        expect(objList.length).assertEqual(3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_0900
     * @tc.name      testSubArray02List0009
     * @tc.desc      Test subArrayList with large ArrayList
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0009';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();

        for (let i = 0; i < 100; i++) {
          arrayList.add(i * 10);
        }

        expect(arrayList.length).assertEqual(100);

        let subList = arrayList.subArrayList(25, 75);
        expect(subList.length).assertEqual(50);

        expect(arrayList.length).assertEqual(100);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1000
     * @tc.name      testSubArray02List0010
     * @tc.desc      Test subArrayList preserves element order
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0010';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        arrayList.add(5);
        arrayList.add(10);
        arrayList.add(15);
        arrayList.add(20);
        arrayList.add(25);

        let subList = arrayList.subArrayList(1, 4);

        expect(subList.length).assertEqual(3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1100
     * @tc.name      testSubArray02List0011
     * @tc.desc      Test subArrayList with fromIndex at boundary
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0011';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<string>();
        arrayList.add("first");
        arrayList.add("second");
        arrayList.add("third");

        let subList1 = arrayList.subArrayList(0, 2);
        expect(subList1.length).assertEqual(2);

        let subList2 = arrayList.subArrayList(2, 3);
        expect(subList2.length).assertEqual(1);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1200
     * @tc.name      testSubArray02List0012
     * @tc.desc      Test multiple subArrayList operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0012';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        for (let i = 1; i <= 10; i++) {
          arrayList.add(i);
        }

        let subList1 = arrayList.subArrayList(2, 6);
        expect(subList1.length).assertEqual(4);

        let subList2 = arrayList.subArrayList(5, 9);
        expect(subList2.length).assertEqual(4);

        let subList3 = subList1.subArrayList(1, 3);
        expect(subList3.length).assertEqual(2);

        expect(arrayList.length).assertEqual(10);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1300
     * @tc.name      testSubArray02List0013
     * @tc.desc      Test subArrayList with complex data types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0013';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number[]>();
        arrayList.add([1, 2, 3]);
        arrayList.add([4, 5, 6]);
        arrayList.add([7, 8, 9]);
        arrayList.add([10, 11, 12]);

        let subList = arrayList.subArrayList(1, 3);
        expect(subList.length).assertEqual(2);
        expect(arrayList.length).assertEqual(4);

        type MixedType = string | number | boolean;
        let mixedList = new ArrayList<MixedType>();
        mixedList.add("text");
        mixedList.add(123);
        mixedList.add(true);
        mixedList.add("another");
        mixedList.add(456);

        let mixedSubList = mixedList.subArrayList(1, 4);
        expect(mixedSubList.length).assertEqual(3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1400
     * @tc.name      testSubArray02List0014
     * @tc.desc      Test subArrayList and clear operations combined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0014';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        for (let i = 0; i < 8; i++) {
          arrayList.add(i * 10);
        }

        let subList = arrayList.subArrayList(2, 6);
        expect(subList.length).assertEqual(4);
        expect(arrayList.length).assertEqual(8);

        subList.clear();
        expect(subList.length).assertEqual(0);

        expect(arrayList.length).assertEqual(8);

        let subList2 = arrayList.subArrayList(0, 4);
        expect(subList2.length).assertEqual(4);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1500
     * @tc.name      testSubArray02List0015
     * @tc.desc      Test subArrayList with TypedArray elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0015';
        console.log(TAG + ' start');

        let int8ArrayList = new ArrayList<Int8Array>();
        int8ArrayList.add(new Int8Array([-128, 0, 127]));
        int8ArrayList.add(new Int8Array([-64, 32, 96]));
        int8ArrayList.add(new Int8Array([-32, 64, -96]));
        int8ArrayList.add(new Int8Array([0, -127, 128]));

        let int8SubList = int8ArrayList.subArrayList(1, 3);
        expect(int8SubList.length).assertEqual(2);
        expect(int8ArrayList.length).assertEqual(4);

        let uint8ArrayList = new ArrayList<Uint8Array>();
        uint8ArrayList.add(new Uint8Array([0, 128, 255]));
        uint8ArrayList.add(new Uint8Array([64, 192, 32]));

        let uint8SubList = uint8ArrayList.subArrayList(0, 1);
        expect(uint8SubList.length).assertEqual(1);

        let float32ArrayList = new ArrayList<Float32Array>();
        float32ArrayList.add(new Float32Array([1.1, 2.2, 3.3]));
        float32ArrayList.add(new Float32Array([4.4, 5.5, 6.6]));
        float32ArrayList.add(new Float32Array([7.7, 8.8, 9.9]));

        let float32SubList = float32ArrayList.subArrayList(0, 2);
        expect(float32SubList.length).assertEqual(2);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1600
     * @tc.name      testSubArray02List0016
     * @tc.desc      Test subArrayList with Date and RegExp objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0016';
        console.log(TAG + ' start');

        let dateList = new ArrayList<Date>();
        const date1 = new Date('2024-01-01');
        const date2 = new Date('2024-06-15');
        const date3 = new Date('2024-12-31');
        const date4 = new Date('2025-03-20');

        dateList.add(date1);
        dateList.add(date2);
        dateList.add(date3);
        dateList.add(date4);

        let dateSubList = dateList.subArrayList(1, 3);
        expect(dateSubList.length).assertEqual(2);
        expect(dateList.length).assertEqual(4);

        let regexList = new ArrayList<RegExp>();
        regexList.add(/test/gi);
        regexList.add(/[0-9]+/);
        regexList.add(/^[a-z]+$/i);
        regexList.add(/\s+/g);
        regexList.add(/.*/);

        let regexSubList = regexList.subArrayList(2, 5);
        expect(regexSubList.length).assertEqual(3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1700
     * @tc.name      testSubArray02List0017
     * @tc.desc      Test subArrayList with Map and Set objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0017';
        console.log(TAG + ' start');

        let mapList = new ArrayList<Map<string, string | number>>();
        const map1 = new Map<string, string | number>([['key1', 'value1'], ['key2', 123]]);
        const map2 = new Map<string, string | number>([['name', 'John'], ['age', 30]]);
        const map3 = new Map<string, string | number>([['color', 'red'], ['size', 'large']]);

        mapList.add(map1);
        mapList.add(map2);
        mapList.add(map3);

        let mapSubList = mapList.subArrayList(0, 2);
        expect(mapSubList.length).assertEqual(2);

        let setList = new ArrayList<Set<number>>();
        const set1 = new Set<number>([1, 2, 3, 4, 5]);
        const set2 = new Set<number>([10, 20, 30]);
        const set3 = new Set<number>([100, 200, 300, 400]);
        const set4 = new Set<number>([1000, 2000]);

        setList.add(set1);
        setList.add(set2);
        setList.add(set3);
        setList.add(set4);

        let setSubList = setList.subArrayList(1, 4);
        expect(setSubList.length).assertEqual(3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_02_1800
     * @tc.name      testSubArray02List0018
     * @tc.desc      Test subArrayList with ArrayBuffer and DataView
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray02List0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray02List0018';
        console.log(TAG + ' start');

        let bufferList = new ArrayList<ArrayBuffer>();
        const buffer1 = new ArrayBuffer(16);
        const buffer2 = new ArrayBuffer(32);
        const buffer3 = new ArrayBuffer(64);
        const buffer4 = new ArrayBuffer(128);

        bufferList.add(buffer1);
        bufferList.add(buffer2);
        bufferList.add(buffer3);
        bufferList.add(buffer4);

        let bufferSubList = bufferList.subArrayList(1, 3);
        expect(bufferSubList.length).assertEqual(2);
        expect(bufferList.length).assertEqual(4);

        let dataViewList = new ArrayList<DataView>();
        dataViewList.add(new DataView(new ArrayBuffer(8)));
        dataViewList.add(new DataView(new ArrayBuffer(16)));
        dataViewList.add(new DataView(new ArrayBuffer(24)));
        dataViewList.add(new DataView(new ArrayBuffer(32)));

        let dataViewSubList = dataViewList.subArrayList(0, 2);
        expect(dataViewSubList.length).assertEqual(2);
      });
  })
}