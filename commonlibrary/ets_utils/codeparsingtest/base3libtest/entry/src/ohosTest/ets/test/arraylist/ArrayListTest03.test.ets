import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { ArrayList } from '@kit.ArkTS';

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function ArrayList_03Test() {
  describe('ArrayList_03Test', () => {
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
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_03_1900
     * @tc.name      testSubArray03List0019
     * @tc.desc      Test subArrayList with complex nested objects
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray03List0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray03List0019';
        console.log(TAG + ' start');

        interface Address {
          street: string;
          city: string;
          zipCode: number;
        }

        interface Person {
          id: number;
          name: string;
          age: number;
          address: Address;
          hobbies: string[];
        }

        let personList = new ArrayList<Person>();

        const person1: Person = {
          id: 1,
          name: "Alice",
          age: 25,
          address: { street: "123 Main St", city: "New York", zipCode: 10001 },
          hobbies: ["reading", "swimming", "coding"]
        };

        const person2: Person = {
          id: 2,
          name: "Bob",
          age: 30,
          address: { street: "456 Oak Ave", city: "Los Angeles", zipCode: 90001 },
          hobbies: ["gaming", "hiking"]
        };

        const person3: Person = {
          id: 3,
          name: "Charlie",
          age: 35,
          address: { street: "789 Pine Rd", city: "Chicago", zipCode: 60601 },
          hobbies: ["cooking", "photography", "traveling", "music"]
        };

        const person4: Person = {
          id: 4,
          name: "Diana",
          age: 28,
          address: { street: "101 Elm Blvd", city: "Miami", zipCode: 33101 },
          hobbies: ["yoga", "painting"]
        };

        personList.add(person1);
        personList.add(person2);
        personList.add(person3);
        personList.add(person4);

        let personSubList = personList.subArrayList(1, 4);
        expect(personSubList.length).assertEqual(3);
        expect(personList.length).assertEqual(4);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_03_2000
     * @tc.name      testSubArray03List0020
     * @tc.desc      Test subArrayList with functions and promises
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray03List0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray03List0020';
        console.log(TAG + ' start');

        interface TestObject {
          name: string;
        }

        let functionList = new ArrayList<string | number | TestObject | number[]>();

        const func1 = (): string => "Hello World";
        const func2 = (): number => 42;
        const func3 = (): TestObject => ({ name: "Test" });
        const func4 = (): number[] => [1, 2, 3];
        const func5 = (): string => "Named function";

        functionList.add(func1);
        functionList.add(func2);
        functionList.add(func3);
        functionList.add(func4);
        functionList.add(func5);

        let functionSubList = functionList.subArrayList(2, 5);
        expect(functionSubList.length).assertEqual(3);

        type PromiseReturnType = string | number | number[] | Error;

        let promiseList = new ArrayList<Promise<PromiseReturnType>>();

        const promise1: Promise<string> = Promise.resolve("Success");
        const promise2: Promise<number> = new Promise((resolve) => setTimeout(() => resolve(100), 100));
        const promise3: Promise<Error> = Promise.reject(new Error("Test error"));
        const promise4: Promise<number[]> = Promise.resolve([1, 2, 3]);

        promiseList.add(promise1 as Promise<PromiseReturnType>);
        promiseList.add(promise2 as Promise<PromiseReturnType>);
        promiseList.add(promise3 as Promise<PromiseReturnType>);
        promiseList.add(promise4 as Promise<PromiseReturnType>);

        let promiseSubList = promiseList.subArrayList(1, 3);
        expect(promiseSubList.length).assertEqual(2);

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_03_2100
     * @tc.name      testSubArray03List0021
     * @tc.desc      Test subArrayList with BigInt
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray03List0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray03List0021';
        console.log(TAG + ' start');

        let bigIntList = new ArrayList<bigint>();
        bigIntList.add(12345678901234567890n);
        bigIntList.add(0n);
        bigIntList.add(-9999999999999999999n);
        bigIntList.add(BigInt(Number.MAX_SAFE_INTEGER));
        bigIntList.add(BigInt("999999999999999999999"));

        let bigIntSubList = bigIntList.subArrayList(1, 4);
        expect(bigIntSubList.length).assertEqual(3);
        expect(bigIntList.length).assertEqual(5);

        expect(bigIntSubList[0]).assertEqual(0n);
        expect(bigIntSubList[1]).assertEqual(-9999999999999999999n);
        expect(bigIntSubList[2]).assertEqual(BigInt(Number.MAX_SAFE_INTEGER));

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_03_2200
     * @tc.name      testSubArray03List0022
     * @tc.desc      Test subArrayList with null, undefined, and special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray03List0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray03List0022';
        console.log(TAG + ' start');

        type SpecialType = number | string | boolean | null | undefined | object;
        let specialList = new ArrayList<SpecialType>();

        specialList.add(null);
        specialList.add(undefined);
        specialList.add(NaN);
        specialList.add(Infinity);
        specialList.add(-Infinity);
        specialList.add(0);
        specialList.add(-0);
        specialList.add("");
        specialList.add("null");
        specialList.add("undefined");
        specialList.add({});
        specialList.add([]);

        expect(specialList.length).assertEqual(12);

        let specialSubList = specialList.subArrayList(2, 8);
        expect(specialSubList.length).assertEqual(6);

        let specialSubList2 = specialSubList.subArrayList(1, 4);
        expect(specialSubList2.length).assertEqual(3);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_03_2300
     * @tc.name      testSubArray03List0023
     * @tc.desc      Test subArrayList with circular references
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray03List0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray03List0023';
        console.log(TAG + ' start');

        interface CircularObject {
          id: number;
          name: string;
          next?: CircularObject;
        }

        let circularList = new ArrayList<CircularObject>();

        const obj1: CircularObject = { id: 1, name: "First" };
        const obj2: CircularObject = { id: 2, name: "Second", next: obj1 };
        const obj3: CircularObject = { id: 3, name: "Third", next: obj2 };
        const obj4: CircularObject = { id: 4, name: "Fourth", next: obj3 };

        obj1.next = obj4;

        circularList.add(obj1);
        circularList.add(obj2);
        circularList.add(obj3);
        circularList.add(obj4);

        expect(circularList.length).assertEqual(4);

        let circularSubList = circularList.subArrayList(1, 4);
        expect(circularSubList.length).assertEqual(3);

        expect(circularList.length).assertEqual(4);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_03_2400
     * @tc.name      testSubArray03List0024
     * @tc.desc      Test subArrayList with mixed complex types
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testSubArray03List0024', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray03List0024';
        console.log(TAG + ' start');

        interface MixedObject {
          prop1: string;
          prop2: number;
          prop3: number[];
        }

        type MapValueType = string | number;

        type FuncReturnType = string | number | boolean | MixedObject | number[];

        type PromiseReturnType = string | number | boolean | MixedObject | number[] | Error;

        type MixedComplexType =
          | number
          | string
          | boolean
          | null
          | undefined
          | Int8Array
          | Uint8Array
          | Date
          | RegExp
          | Map<string, MapValueType>
          | Set<number>
          | ArrayBuffer
          | DataView
          | Promise<PromiseReturnType>
          | (() => FuncReturnType)
          | bigint
          | MixedObject;

        let mixedList = new ArrayList<MixedComplexType>();

        mixedList.add(42);
        mixedList.add("Hello World");
        mixedList.add(true);
        mixedList.add(null);
        mixedList.add(undefined);
        mixedList.add(new Int8Array([1, 2, 3]));
        mixedList.add(new Uint8Array([255, 0, 128]));
        mixedList.add(new Date());
        mixedList.add(/test/gi);

        const testMap = new Map<string, MapValueType>([['key', 'value'], ['num', 123]]);
        mixedList.add(testMap);

        const testSet = new Set<number>([1, 2, 3, 4, 5]);
        mixedList.add(testSet);

        mixedList.add(new ArrayBuffer(16));
        mixedList.add(new DataView(new ArrayBuffer(8)));
        mixedList.add(Promise.resolve("done") as Promise<PromiseReturnType>);
        mixedList.add(() => "function result");
        mixedList.add(999999999999999999n);

        mixedList.add({ prop1: "value", prop2: 123, prop3: [1, 2, 3] });

        expect(mixedList.length).assertEqual(17);

        let mixedSubList = mixedList.subArrayList(5, 15);
        expect(mixedSubList.length).assertEqual(10);

        let nestedSubList = mixedSubList.subArrayList(3, 7);
        expect(nestedSubList.length).assertEqual(4);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_SUBARRAYLIST_03_2500
     * @tc.name      testSubArray03List0025
     * @tc.desc      Test subArrayList with performance measurement
     * @tc.size      LargeTest
     * @tc.type      Performance
     * @tc.level     Level 2
     */
    it('testSubArray03List0025', TestType.PERFORMANCE | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testSubArray03List0025';
        console.log(TAG + ' start');

        const sizes = [100, 1000, 10000, 50000];

        for (const size of sizes) {
          console.log(`\nTesting performance with size: ${size}`);

          let arrayList = new ArrayList<number>();

          const fillStart = Date.now();
          for (let i = 0; i < size; i++) {
            arrayList.add(i);
          }
          const fillTime = Date.now() - fillStart;

          expect(arrayList.length).assertEqual(size);

          console.log(`Filled ${size} elements in ${fillTime}ms`);

          const subStart = Date.now();
          let subList = arrayList.subArrayList(size / 4, (size * 3) / 4);
          const subTime = Date.now() - subStart;

          expect(subList.length).assertEqual(size / 2);
          expect(arrayList.length).assertEqual(size);

          console.log(`SubArrayList operation for ${size} elements took ${subTime}ms`);
          console.log(`SubList length: ${subList.length}`);

          subList.clear();
          expect(subList.length).assertEqual(0);

          expect(arrayList.length).assertEqual(size);
        }


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0100
     * @tc.name      testArray03ListIndex0001
     * @tc.desc      Test accessing ArrayList with number type using index operator
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0001';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        arrayList.add(30);
        arrayList.add(40);
        arrayList.add(50);

        expect(arrayList[0]).assertEqual(10);
        expect(arrayList[1]).assertEqual(20);
        expect(arrayList[2]).assertEqual(30);
        expect(arrayList[3]).assertEqual(40);
        expect(arrayList[4]).assertEqual(50);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0200
     * @tc.name      testArray03ListIndex0002
     * @tc.desc      Test accessing ArrayList with string type using index operator
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0002';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();
        arrayList.add("apple");
        arrayList.add("banana");
        arrayList.add("cherry");
        arrayList.add("date");
        arrayList.add("elderberry");

        expect(arrayList[0]).assertEqual("apple");
        expect(arrayList[1]).assertEqual("banana");
        expect(arrayList[2]).assertEqual("cherry");
        expect(arrayList[3]).assertEqual("date");
        expect(arrayList[4]).assertEqual("elderberry");


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0300
     * @tc.name      testArray03ListIndex0003
     * @tc.desc      Test accessing ArrayList with boolean type using index operator
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0003';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<boolean>();
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);
        arrayList.add(false);
        arrayList.add(true);

        expect(arrayList[0]).assertTrue();
        expect(arrayList[1]).assertFalse();
        expect(arrayList[2]).assertTrue();
        expect(arrayList[3]).assertFalse();
        expect(arrayList[4]).assertTrue();


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0400
     * @tc.name      testArray03ListIndex0004
     * @tc.desc      Test accessing ArrayList with Int8Array type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0004';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Int8Array>();
        const int8Array1: Int8Array = new Int8Array([-128, 0, 127]);
        const int8Array2: Int8Array = new Int8Array([-64, 32, 96]);
        const int8Array3: Int8Array = new Int8Array([-32, 64, -96]);

        arrayList.add(int8Array1);
        arrayList.add(int8Array2);
        arrayList.add(int8Array3);

        expect(arrayList[0]).assertDeepEquals(int8Array1);
        expect(arrayList[1]).assertDeepEquals(int8Array2);
        expect(arrayList[2]).assertDeepEquals(int8Array3);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0500
     * @tc.name      testArray03ListIndex0005
     * @tc.desc      Test accessing ArrayList with Uint8Array type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0005';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Uint8Array>();
        const uint8Array1: Uint8Array = new Uint8Array([0, 128, 255]);
        const uint8Array2: Uint8Array = new Uint8Array([64, 192, 32]);
        const uint8Array3: Uint8Array = new Uint8Array([255, 0, 128]);

        arrayList.add(uint8Array1);
        arrayList.add(uint8Array2);
        arrayList.add(uint8Array3);

        expect(arrayList[0]).assertDeepEquals(uint8Array1);
        expect(arrayList[1]).assertDeepEquals(uint8Array2);
        expect(arrayList[2]).assertDeepEquals(uint8Array3);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0600
     * @tc.name      testArray03ListIndex0006
     * @tc.desc      Test accessing ArrayList with Float32Array type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0006';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Float32Array>();
        const float32Array1: Float32Array = new Float32Array([1.1, 2.2, 3.3]);
        const float32Array2: Float32Array = new Float32Array([4.4, 5.5, 6.6]);
        const float32Array3: Float32Array = new Float32Array([7.7, 8.8, 9.9]);

        arrayList.add(float32Array1);
        arrayList.add(float32Array2);
        arrayList.add(float32Array3);

        expect(arrayList[0]).assertDeepEquals(float32Array1);
        expect(arrayList[1]).assertDeepEquals(float32Array2);
        expect(arrayList[2]).assertDeepEquals(float32Array3);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0700
     * @tc.name      testArray03ListIndex0007
     * @tc.desc      Test accessing ArrayList with union type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0007';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number | string | boolean>();
        arrayList.add(100);
        arrayList.add("test");
        arrayList.add(true);
        arrayList.add(200);
        arrayList.add("another");

        expect(arrayList[0]).assertEqual(100);
        expect(arrayList[1]).assertEqual("test");
        expect(arrayList[2]).assertTrue();
        expect(arrayList[3]).assertEqual(200);
        expect(arrayList[4]).assertEqual("another");


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0800
     * @tc.name      testArray03ListIndex0008
     * @tc.desc      Test accessing ArrayList with array type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0008';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number[]>();
        const array1: number[] = [1, 2, 3];
        const array2: number[] = [4, 5, 6];
        const array3: number[] = [7, 8, 9];

        arrayList.add(array1);
        arrayList.add(array2);
        arrayList.add(array3);

        expect(arrayList[0]).assertDeepEquals(array1);
        expect(arrayList[1]).assertDeepEquals(array2);
        expect(arrayList[2]).assertDeepEquals(array3);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_0900
     * @tc.name      testArray03ListIndex0009
     * @tc.desc      Test accessing ArrayList with boundary indices using index operator
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0009';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(1);
        arrayList.add(2);
        arrayList.add(3);
        arrayList.add(4);
        arrayList.add(5);

        expect(arrayList[0]).assertEqual(1);
        expect(arrayList[arrayList.length - 1]).assertEqual(5);


      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1000
     * @tc.name      testArray03ListIndex0010
     * @tc.desc      Test accessing ArrayList using index operator with boundary indices
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0010';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<string>();

        arrayList.add("first");
        arrayList.add("second");
        arrayList.add("third");
        arrayList.add("fourth");

        expect(arrayList[0]).assertEqual("first");
        expect(arrayList[arrayList.length - 1]).assertEqual("fourth");
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1100
     * @tc.name      testArray03ListIndex0011
     * @tc.desc      Test accessing ArrayList with negative index using index operator
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0011';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        arrayList.add(30);

        try {
          let result = arrayList[-1];
          expect().assertFail();
        } catch (error) {
          expect(error.code).assertEqual(10200001);
        }

      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1200
     * @tc.name      testArray03ListIndex0012
     * @tc.desc      Test accessing ArrayList using index operator with valid range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0012';
        console.log(TAG + ' start');

        let arrayList = new ArrayList<number>();
        arrayList.add(10);
        arrayList.add(20);
        arrayList.add(30);
        arrayList.add(40);
        arrayList.add(50);

        expect(arrayList.length).assertEqual(5);

        expect(arrayList[0]).assertEqual(10);
        expect(arrayList[1]).assertEqual(20);
        expect(arrayList[2]).assertEqual(30);
        expect(arrayList[3]).assertEqual(40);
        expect(arrayList[4]).assertEqual(50);

        expect(arrayList[arrayList.length - 1]).assertEqual(50);
        expect(arrayList[arrayList.length - 2]).assertEqual(40);
        expect(arrayList[arrayList.length - 3]).assertEqual(30);
        expect(arrayList[arrayList.length - 4]).assertEqual(20);
        expect(arrayList[arrayList.length - 5]).assertEqual(10);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1300
     * @tc.name      testArray03ListIndex0013
     * @tc.desc      Test accessing ArrayList with Date type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0013';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Date>();
        const date1: Date = new Date('2024-01-01');
        const date2: Date = new Date('2024-06-15');
        const date3: Date = new Date('2024-12-31');

        arrayList.add(date1);
        arrayList.add(date2);
        arrayList.add(date3);

        expect(arrayList[0]).assertDeepEquals(date1);
        expect(arrayList[1]).assertDeepEquals(date2);
        expect(arrayList[2]).assertDeepEquals(date3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1400
     * @tc.name      testArray03ListIndex0014
     * @tc.desc      Test accessing ArrayList with RegExp type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0014';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<RegExp>();
        const regex1: RegExp = /test/gi;
        const regex2: RegExp = /[0-9]+/;
        const regex3: RegExp = /^[a-z]+$/i;

        arrayList.add(regex1);
        arrayList.add(regex2);
        arrayList.add(regex3);

        expect(arrayList[0].toString()).assertEqual(regex1.toString());
        expect(arrayList[1].toString()).assertEqual(regex2.toString());
        expect(arrayList[2].toString()).assertEqual(regex3.toString());
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1500
     * @tc.name      testArray03ListIndex0015
     * @tc.desc      Test accessing ArrayList with Map type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0015';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Map<string, number>>();
        const map1: Map<string, number> = new Map([['key1', 1], ['key2', 2]]);
        const map2: Map<string, number> = new Map([['key3', 3], ['key4', 4]]);
        const map3: Map<string, number> = new Map([['key5', 5], ['key6', 6]]);

        arrayList.add(map1);
        arrayList.add(map2);
        arrayList.add(map3);

        expect(arrayList[0]).assertDeepEquals(map1);
        expect(arrayList[1]).assertDeepEquals(map2);
        expect(arrayList[2]).assertDeepEquals(map3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1600
     * @tc.name      testArray03ListIndex0016
     * @tc.desc      Test accessing ArrayList with Set type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0016';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<Set<number>>();
        const set1: Set<number> = new Set([1, 2, 3, 4, 5]);
        const set2: Set<number> = new Set([10, 20, 30]);
        const set3: Set<number> = new Set([100, 200, 300, 400]);

        arrayList.add(set1);
        arrayList.add(set2);
        arrayList.add(set3);

        expect(arrayList[0]).assertDeepEquals(set1);
        expect(arrayList[1]).assertDeepEquals(set2);
        expect(arrayList[2]).assertDeepEquals(set3);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1700
     * @tc.name      testArray03ListIndex0017
     * @tc.desc      Test accessing ArrayList with custom object type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0017';
        console.log(TAG + ' start');
        class Person {
          name: string;
          age: number;

          constructor(name: string, age: number) {
            this.name = name;
            this.age = age;
          }
        }

        let arrayList = new ArrayList<Person>();
        const person1: Person = new Person("Alice", 25);
        const person2: Person = new Person("Bob", 30);
        const person3: Person = new Person("Charlie", 35);

        arrayList.add(person1);
        arrayList.add(person2);
        arrayList.add(person3);

        expect(arrayList[0].name).assertEqual("Alice");
        expect(arrayList[0].age).assertEqual(25);
        expect(arrayList[1].name).assertEqual("Bob");
        expect(arrayList[1].age).assertEqual(30);
        expect(arrayList[2].name).assertEqual("Charlie");
        expect(arrayList[2].age).assertEqual(35);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1800
     * @tc.name      testArray03ListIndex0018
     * @tc.desc      Test accessing ArrayList with ArrayBuffer type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0018';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<ArrayBuffer>();
        const buffer1: ArrayBuffer = new ArrayBuffer(16);
        const buffer2: ArrayBuffer = new ArrayBuffer(32);
        const buffer3: ArrayBuffer = new ArrayBuffer(64);

        arrayList.add(buffer1);
        arrayList.add(buffer2);
        arrayList.add(buffer3);

        expect(arrayList[0].byteLength).assertEqual(16);
        expect(arrayList[1].byteLength).assertEqual(32);
        expect(arrayList[2].byteLength).assertEqual(64);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_1900
     * @tc.name      testArray03ListIndex0019
     * @tc.desc      Test accessing ArrayList with DataView type using index operator
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0019';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<DataView>();
        const dataView1: DataView = new DataView(new ArrayBuffer(8));
        const dataView2: DataView = new DataView(new ArrayBuffer(16));
        const dataView3: DataView = new DataView(new ArrayBuffer(24));

        arrayList.add(dataView1);
        arrayList.add(dataView2);
        arrayList.add(dataView3);

        expect(arrayList[0].byteLength).assertEqual(8);
        expect(arrayList[1].byteLength).assertEqual(16);
        expect(arrayList[2].byteLength).assertEqual(24);
      });

    /**
     * @tc.number    SUB_UTIL_ARRAYLIST_INDEX_03_2000
     * @tc.name      testArray03ListIndex0020
     * @tc.desc      Test accessing large ArrayList using index operator
     * @tc.size      LargeTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArray03ListIndex0020', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2,
      (): void => {
        const TAG = 'testArray03ListIndex0020';
        console.log(TAG + ' start');
        let arrayList = new ArrayList<number>();

        for (let i = 0; i < 10000; i++) {
          arrayList.add(i * 10);
        }

        expect(arrayList[0]).assertEqual(0);
        expect(arrayList[5000]).assertEqual(50000);
        expect(arrayList[9999]).assertEqual(99990);
      });
  })
}