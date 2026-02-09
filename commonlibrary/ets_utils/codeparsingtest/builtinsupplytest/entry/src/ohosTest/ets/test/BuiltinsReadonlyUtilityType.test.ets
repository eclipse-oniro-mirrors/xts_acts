/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../testability/pages/CommonUtils';

export default function BuiltinsReadonlyUtilityTypeTest() {
  describe('BuiltinsReadonlyUtilityTypeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(40);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0100
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0100
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0100';
      console.log(`${caseName} test start`);
      interface Settings {
        theme?: string;
        fontSize?: number;
      }
      type ReadonlySettings = Readonly<Settings>;
      const mySettings: ReadonlySettings = {};
      console.log(JSON.stringify(mySettings));
      expect(JSON.stringify({})).assertEqual(JSON.stringify(mySettings))
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0200
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0200
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0200';
      console.log(`${caseName} test start`);
      interface Car {
        brand?: string;
        model?: string;
        year?: number;
      }
      type ReadonlyCar = Readonly<Car>;
      const myCar: ReadonlyCar = {
        brand: 'Toyota'
      };
      console.log(JSON.stringify(myCar));
      expect('Toyota').assertEqual(myCar.brand)
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0300
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0300
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0300';
      console.log(`${caseName} test start`);
      interface Movie {
        title: string;
        director: string;
        year: number;
      }
      type ReadonlyMovie = Readonly<Movie>;
      const readonlyMovie: ReadonlyMovie = {
        title: 'The Shawshank Redemption',
        director: 'Frank Darabont',
        year: 2025
      };
      console.log(JSON.stringify(readonlyMovie));
      expect('The Shawshank Redemption').assertEqual(readonlyMovie.title);
      expect('Frank Darabont').assertEqual(readonlyMovie.director);
      expect(2025).assertEqual(readonlyMovie.year);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0400
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0400
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0400';
      console.log(`${caseName} test start`);
      interface Fruit {
        name: string;
        color: string;
      }
      interface ExtendedFruit extends Fruit {
        taste?: string;
      }
      type ReadonlyExtendedFruit = Readonly<ExtendedFruit>;
      const banana: ReadonlyExtendedFruit = {
        name: 'Banana',
        color: 'Yellow',
        taste: 'Sweet'
      };
      console.log(JSON.stringify(banana));
      expect('Sweet').assertEqual(banana.taste)
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0500
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0500
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0500';
      console.log(`${caseName} test start`);
      interface Product {
        name: string;
        price: number;
      }
      type ReadonlyProduct = Readonly<Product>;
      const readonlyProduct: ReadonlyProduct = {
        name: 'Laptop',
        price: 1000
      };
      const mutableProduct = readonlyProduct as Product;
      mutableProduct.price = 1200;
      console.log(JSON.stringify(readonlyProduct));
      expect(1200).assertEqual(mutableProduct.price);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0600
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0600
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0600';
      console.log(`${caseName} test start`);
      class A {
        f1: string = "";
        f2: number = 1;
        f3: boolean = true;
      }
      let x = new A();
      let y: Readonly<A> = x;
      const newAInstance = new A();
      newAInstance.f1 = "new string";
      newAInstance.f2 = 2;
      newAInstance.f3 = false;
      y = newAInstance as Readonly<A>;
      console.log(y.f1);
      console.log(`${y.f2}`);
      console.log(`${y.f3}`);
      expect("new string").assertEqual(y.f1)
      expect(2).assertEqual(y.f2)
      expect(false).assertEqual(y.f3)
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0700
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0700
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0700';
      console.log(`${caseName} test start`);
      interface StringExample {
        text: string;
      }
      type ReadonlyStringExample = Readonly<StringExample>;
      const readonlyStringExample: ReadonlyStringExample = {
        text: 'This is a string'
      };
      console.log(JSON.stringify(readonlyStringExample));
      expect('This is a string').assertEqual(readonlyStringExample.text);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0800
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0800
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0800';
      console.log(`${caseName} test start`);
      interface NumberExample {
        num: number;
      }
      type ReadonlyNumberExample = Readonly<NumberExample>;
      const readonlyNumberExample: ReadonlyNumberExample = {
        num: 123
      };
      console.log(JSON.stringify(readonlyNumberExample));
      expect(123).assertEqual(readonlyNumberExample.num);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest0900
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_0900
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest0900';
      console.log(`${caseName} test start`);
      interface BooleanExample {
        flag: boolean;
      }
      type ReadonlyBooleanExample = Readonly<BooleanExample>;
      const readonlyBooleanExample: ReadonlyBooleanExample = {
        flag: true
      };
      console.log(JSON.stringify(readonlyBooleanExample));
      expect(true).assertEqual(readonlyBooleanExample.flag);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1000
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1000
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1000';
      console.log(`${caseName} test start`);
      interface ArrayExample {
        items: number[];
      }
      type ReadonlyArrayExample = Readonly<ArrayExample>;
      const readonlyArrayExample: ReadonlyArrayExample = {
        items: [1, 2, 3]
      };
      console.log(JSON.stringify(readonlyArrayExample));
      expect(1).assertEqual(readonlyArrayExample.items[0]);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1100
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1100
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1100';
      console.log(`${caseName} test start`);
      interface InnerObject {
        prop: string;
      }
      interface ObjectExample {
        obj: InnerObject;
      }
      type ReadonlyObjectExample = Readonly<ObjectExample>;
      const readonlyObjectExample: ReadonlyObjectExample = {
        obj: { prop: 'value' }
      };
      console.log(JSON.stringify(readonlyObjectExample));
      expect('value').assertEqual(readonlyObjectExample.obj.prop);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1200
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1200
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1200';
      console.log(`${caseName} test start`);
      interface NullExample {
        nullValue: null;
      }
      type ReadonlyNullExample = Readonly<NullExample>;
      const readonlyNullExample: ReadonlyNullExample = {
        nullValue: null
      };
      console.log(JSON.stringify(readonlyNullExample));
      expect(null).assertEqual(readonlyNullExample.nullValue);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1300
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1300
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1300';
      console.log(`${caseName} test start`);
      interface UndefinedExample {
        undefinedValue: undefined;
      }
      type ReadonlyUndefinedExample = Readonly<UndefinedExample>;
      const readonlyUndefinedExample: ReadonlyUndefinedExample = {
        undefinedValue: undefined
      };
      console.log(JSON.stringify(readonlyUndefinedExample));
      expect(undefined).assertEqual(readonlyUndefinedExample.undefinedValue);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1400
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1400
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1400';
      console.log(`${caseName} test start`);
      interface BigIntExample {
        bigIntValue: bigint;
      }
      type ReadonlyBigIntExample = Readonly<BigIntExample>;
      const readonlyBigIntExample: ReadonlyBigIntExample = {
        bigIntValue: 12345678901234567890n
      };
      console.log(`${readonlyBigIntExample}`);
      expect(12345678901234567890n).assertEqual(readonlyBigIntExample.bigIntValue);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1500
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1500
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1500';
      console.log(`${caseName} test start`);
      enum Color {
        Red,
        Green,
        Blue
      }
      interface EnumExample {
        color: Color;
      }
      type ReadonlyEnumExample = Readonly<EnumExample>;
      const readonlyEnumExample: ReadonlyEnumExample = {
        color: Color.Red
      };
      console.log(JSON.stringify(readonlyEnumExample));
      expect(Color.Red).assertEqual(readonlyEnumExample.color);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1600
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1600
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1600';
      console.log(`${caseName} test start`);
      interface TupleExample {
        tuple: [string, number];
      }
      type ReadonlyTupleExample = Readonly<TupleExample>;
      const readonlyTupleExample: ReadonlyTupleExample = {
        tuple: ['test', 1]
      };
      console.log(JSON.stringify(readonlyTupleExample));
      expect('test').assertEqual(readonlyTupleExample.tuple[0]);
      expect(1).assertEqual(readonlyTupleExample.tuple[1]);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1700
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1700
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1700';
      console.log(`${caseName} test start`);
      interface UnionExample {
        unionProp: string | number;
      }
      type ReadonlyUnionExample = Readonly<UnionExample>;
      const readonlyUnionExample: ReadonlyUnionExample = {
        unionProp: 123
      };
      console.log(JSON.stringify(readonlyUnionExample));
      expect(123).assertEqual(readonlyUnionExample.unionProp);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1800
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1800
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1800';
      console.log(`${caseName} test start`);
      interface IndexedObj {
        propA: number;
        propB: string;
      }
      type IndexKeys = keyof IndexedObj;
      interface IndexQueryExample {
        firstKey: IndexKeys;
      }
      type ReadonlyIndexQueryExample = Readonly<IndexQueryExample>;
      const readonlyIndexQueryExample: ReadonlyIndexQueryExample = {
        firstKey: 'propA'
      };
      console.log(JSON.stringify(readonlyIndexQueryExample));
      expect('propA').assertEqual(readonlyIndexQueryExample.firstKey);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest1900
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_1900
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest1900';
      console.log(`${caseName} test start`);
      interface MapExample {
        myMap: Readonly<Map<string, number>>;
      }
      const myMap = new Map<string, number>();
      myMap.set('one', 1);
      myMap.set('two', 2);
      const readonlyMapExample: MapExample = {
        myMap
      };
      console.log(JSON.stringify(Array.from(readonlyMapExample.myMap?.entries() || [])));
      expect(1).assertEqual(readonlyMapExample.myMap.get('one'));
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2000
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2000
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2000';
      console.log(`${caseName} test start`);
      interface SetExample {
        mySet: Readonly<Set<number>>;
      }
      const mySet = new Set<number>();
      mySet.add(1);
      mySet.add(2);
      const readonlySetExample: SetExample = {
        mySet
      };
      console.log(JSON.stringify(Array.from(readonlySetExample.mySet.values() || [])));
      expect(true).assertEqual(readonlySetExample.mySet.has(1));
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2100
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2100
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2100';
      console.log(`${caseName} test start`);
      interface Int8ArrayInterface {
        myInt8Array: Int8Array;
      }
      type ReadonlyInt8ArrayInterface = Readonly<Int8ArrayInterface>;
      const myInt8Array = new Int8Array([1, 2, 3]);
      const int8ArrayObj: ReadonlyInt8ArrayInterface = { myInt8Array };
      console.log(JSON.stringify(Array.from(int8ArrayObj.myInt8Array)));
      expect(int8ArrayObj.myInt8Array[1]).assertEqual(2);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2200
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2200
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2200';
      console.log(`${caseName} test start`);
      interface Uint8ArrayInterface {
        myUint8Array: Uint8Array;
      }
      type ReadonlyUint8ArrayInterface = Readonly<Uint8ArrayInterface>;
      const myUint8Array = new Uint8Array([4, 5, 6]);
      const uint8ArrayObj: ReadonlyUint8ArrayInterface = { myUint8Array };
      console.log(JSON.stringify(Array.from(uint8ArrayObj.myUint8Array)));
      expect(uint8ArrayObj.myUint8Array[1]).assertEqual(5);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2300
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2300
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2300';
      console.log(`${caseName} test start`);
      interface Uint8ClampedArrayInterface {
        myUint8ClampedArray: Uint8ClampedArray;
      }
      type ReadonlyUint8ClampedArrayInterface = Readonly<Uint8ClampedArrayInterface>;
      const myUint8ClampedArray = new Uint8ClampedArray([7, 8, 9]);
      const uint8ClampedArrayObj: ReadonlyUint8ClampedArrayInterface = { myUint8ClampedArray };
      console.log(JSON.stringify(Array.from(uint8ClampedArrayObj.myUint8ClampedArray)));
      expect(uint8ClampedArrayObj.myUint8ClampedArray[1]).assertEqual(8);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2400
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2400
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2400';
      console.log(`${caseName} test start`);
      interface Int16ArrayInterface {
        myInt16Array: Int16Array;
      }
      type ReadonlyInt16ArrayInterface = Readonly<Int16ArrayInterface>;
      const myInt16Array = new Int16Array([10, 11, 12]);
      const int16ArrayObj: ReadonlyInt16ArrayInterface = { myInt16Array };
      console.log(JSON.stringify(Array.from(int16ArrayObj.myInt16Array)));
      expect(int16ArrayObj.myInt16Array[1]).assertEqual(11);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2500
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2500
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2500';
      console.log(`${caseName} test start`);
      interface Uint16ArrayInterface {
        myUint16Array: Uint16Array;
      }
      type ReadonlyUint16ArrayInterface = Readonly<Uint16ArrayInterface>;
      const myUint16Array = new Uint16Array([13, 14, 15]);
      const uint16ArrayObj: ReadonlyUint16ArrayInterface = { myUint16Array };
      console.log(JSON.stringify(Array.from(uint16ArrayObj.myUint16Array)));
      expect(uint16ArrayObj.myUint16Array[1]).assertEqual(14);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2600
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2600
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2600';
      console.log(`${caseName} test start`);
      interface Int32ArrayInterface {
        myInt32Array: Int32Array;
      }
      type ReadonlyInt32ArrayInterface = Readonly<Int32ArrayInterface>;
      const myInt32Array = new Int32Array([16, 17, 18]);
      const int32ArrayObj: ReadonlyInt32ArrayInterface = { myInt32Array };
      console.log(JSON.stringify(Array.from(int32ArrayObj.myInt32Array)));
      expect(int32ArrayObj.myInt32Array[1]).assertEqual(17);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2700
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2700
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2700';
      console.log(`${caseName} test start`);
      interface Uint32ArrayInterface {
        myUint32Array: Uint32Array;
      }
      type ReadonlyUint32ArrayInterface = Readonly<Uint32ArrayInterface>;
      const myUint32Array = new Uint32Array([19, 20, 21]);
      const uint32ArrayObj: ReadonlyUint32ArrayInterface = { myUint32Array };
      console.log(JSON.stringify(Array.from(uint32ArrayObj.myUint32Array)));
      expect(uint32ArrayObj.myUint32Array[1]).assertEqual(20);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2800
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2800
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2800';
      console.log(`${caseName} test start`);
      interface Float32ArrayInterface {
        myFloat32Array: Float32Array;
      }
      type ReadonlyFloat32ArrayInterface = Readonly<Float32ArrayInterface>;
      const myFloat32Array = new Float32Array([22.5, 23.5, 24.5]);
      const float32ArrayObj: ReadonlyFloat32ArrayInterface = { myFloat32Array };
      console.log(JSON.stringify(Array.from(float32ArrayObj.myFloat32Array)));
      expect(float32ArrayObj.myFloat32Array[1]).assertEqual(23.5);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest2900
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_2900
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest2900';
      console.log(`${caseName} test start`);
      interface DataViewInterface {
        myDataView: Readonly<DataView>;
      }
      const buffer = new ArrayBuffer(8);
      const dataView = new DataView(buffer);
      dataView.setInt32(0, 12345, true);
      const dataViewObj: DataViewInterface = { myDataView: dataView };
      console.log(`${dataViewObj.myDataView.getInt32(0, true)}`);
      expect(dataViewObj.myDataView.getInt32(0, true)).assertEqual(12345);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.name   BuiltinsReadonlyUtilityTypeTest3000
     * @tc.number SUB_BUILTINS_READONLY_UTILITY_TEST_3000
     * @tc.desc   Readonly Utility Type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('BuiltinsReadonlyUtilityTypeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsReadonlyUtilityTypeTest3000';
      console.log(`${caseName} test start`);
      interface Float64ArrayInterface {
        myFloat64Array: Float64Array;
      }
      type ReadonlyFloat64ArrayInterface = Readonly<Float64ArrayInterface>;
      const myFloat64Array = new Float64Array([25.5, 26.5, 27.5]);
      const float64ArrayObj: ReadonlyFloat64ArrayInterface = { myFloat64Array };
      console.log(JSON.stringify(Array.from(float64ArrayObj.myFloat64Array)));
      expect(float64ArrayObj.myFloat64Array[1]).assertEqual(26.5);
      console.log(`${caseName} test end`);
      Done();
    })
  })
}