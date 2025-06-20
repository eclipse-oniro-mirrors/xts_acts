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
import { hasProperty, sleep } from '../testability/pages/CommonUtils';

export default function BuiltinsPartialUtilityTypeTest() {
  describe('BuiltinsPartialUtilityTypeTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100)
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
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0100
     * @tc.name BuiltinsPartialUtilityTypeTest0100
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
        const caseName = 'BuiltinsPartialUtilityTypeTest0100';
        console.log(`${caseName} test start`);
        interface User {
          name: string;
          age: number;
        }
        type PartialUser = Partial<User>;
        const partialUser: PartialUser = {
          name: 'John'
        };
        expect('John').assertEqual(partialUser.name);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0200
     * @tc.name BuiltinsPartialUtilityTypeTest0200
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
        const caseName = 'BuiltinsPartialUtilityTypeTest0200';
        console.log(`${caseName} test start`);
        interface User {
          name: string;
          age: number;
        }
        class UserManager {
          private _user: Partial<User> = {};
          get name(): string | undefined {
            return this._user.name;
          };
          set name(value: string | undefined) {
            this._user.name = value;
          };
          get age(): number | undefined {
            return this._user.age;
          };
          set age(value: number | undefined) {
            this._user.age = value;
          };
        }
        const manager = new UserManager();
        manager.name = 'Alice';
        console.log(manager.name);
        expect('Alice').assertEqual(manager.name);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0300
     * @tc.name BuiltinsPartialUtilityTypeTest0300
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
        const caseName = 'BuiltinsPartialUtilityTypeTest0300';
        console.log(`${caseName} test start`);
        interface Issue {
          title: string;
          description: string;
        }
        const partialIssue: Partial<Issue> = {
          title: 'Test Title'
        };
        let result = hasProperty(partialIssue, 'title');
        let result1 = hasProperty(partialIssue, 'description');
        console.log(`${result}`);
        console.log(`${result1}`);
        expect(true).assertEqual(result);
        expect(false).assertEqual(result1);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0400
     * @tc.name BuiltinsPartialUtilityTypeTest0400
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
        const caseName = 'BuiltinsPartialUtilityTypeTest0400';
        console.log(`${caseName} test start`);
        interface UserInfo {
          name: string;
          age: number;
          email: string;
        }
        type PartialUser = Partial<UserInfo>;
        const emptyUser: PartialUser = {};
        console.log(`${emptyUser}`);
        expect(JSON.stringify({})).assertEqual(JSON.stringify(emptyUser));
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0500
     * @tc.name BuiltinsPartialUtilityTypeTest0500
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
        const caseName = 'BuiltinsPartialUtilityTypeTest0500';
        console.log(`${caseName} test start`);
        interface UserInfos {
          name: string;
          age: number;
          email: string;
        }
        type PartialUser = Partial<UserInfos>;
        class UserManager {
          private _user: PartialUser = {};
          get name(): string | undefined {
            return this._user.name;
          }
          set name(value: string | undefined) {
            this._user.name = value;
          }
          get age(): number | undefined {
            return this._user.age;
          }
          set age(value: number | undefined) {
            this._user.age = value;
          }
          get email(): string | undefined {
            return this._user.email;
          }
          set email(value: string | undefined) {
            this._user.email = value;
          }
          get userInfo(): PartialUser {
            return this._user;
          }
        }
        const manager = new UserManager();
        manager.name = 'John';
        manager.age = 30;
        expect('John').assertEqual(manager.name);
        expect(30).assertEqual(manager.age);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0600
     * @tc.name BuiltinsPartialUtilityTypeTest0600
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
        const caseName = 'BuiltinsPartialUtilityTypeTest0600';
        console.log(`${caseName} test start`);
        interface Book {
          title: string;
          author: string;
          year: number;
        }
        type PartialBook = Partial<Book>;
        const book: PartialBook = {
          title: 'Open',
          author: 'Hua',
          year: 1925,
        };
        console.log(JSON.stringify(book));
        expect('Open').assertEqual(book.title);
        expect(1925).assertEqual(book.year);
        expect('Hua').assertEqual(book.author);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0700
     * @tc.name BuiltinsPartialUtilityTypeTest0700
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
        const caseName = 'BuiltinsPartialUtilityTypeTest0700';
        console.log(`${caseName} test start`);
        interface BookInfo {
          title: string;
          author: string;
          year: number;
        }
        type PartialBook = Partial<BookInfo>;
        let year = 23;
        const book: PartialBook = {
          title: 'Hello',
          author: 'Xiao Ming',
        };
        book.year = year;
        console.log(JSON.stringify(book));
        expect(23).assertEqual(book.year);
        console.log(`${caseName} test end`);
        Done();
      })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0800
     * @tc.name BuiltinsPartialUtilityTypeTest0800
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest0800';
      console.log(`${caseName} test start`);
      interface NumberInterface {
        num: number;
      }
      type PartialNumberInterface = Partial<NumberInterface>;
      const numberObj: PartialNumberInterface = { num: 42 };
      console.log(JSON.stringify(numberObj));
      expect(numberObj.num).assertEqual(42);
      console.log(`${caseName} test end`);
      Done();
    })



    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_0900
     * @tc.name BuiltinsPartialUtilityTypeTest0900
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest0900';
      console.log(`${caseName} test start`);
      interface StringInterface {
        str: string;
      }
      type PartialStringInterface = Partial<StringInterface>;
      const stringObj: PartialStringInterface = { str: 'Hello' };
      console.log(JSON.stringify(stringObj));
      expect(stringObj.str).assertEqual('Hello');
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1000
     * @tc.name BuiltinsPartialUtilityTypeTest1000
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1000';
      console.log(`${caseName} test start`);
      interface BooleanInterface {
        bool: boolean;
      }
      type PartialBooleanInterface = Partial<BooleanInterface>;
      const booleanObj: PartialBooleanInterface = { bool: true };
      console.log(JSON.stringify(booleanObj));
      expect(booleanObj.bool).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1100
     * @tc.name BuiltinsPartialUtilityTypeTest1100
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1100';
      console.log(`${caseName} test start`);
      interface NullInterface {
        nullVal: null;
      }
      type PartialNullInterface = Partial<NullInterface>;
      const nullObj: PartialNullInterface = { nullVal: null };
      console.log(JSON.stringify(nullObj));
      expect(nullObj.nullVal).assertEqual(null);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1200
     * @tc.name BuiltinsPartialUtilityTypeTest1200
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1200';
      console.log(`${caseName} test start`);
      interface UndefinedInterface {
        undefinedVal: undefined;
      }
      type PartialUndefinedInterface = Partial<UndefinedInterface>;
      const undefinedObj: PartialUndefinedInterface = { undefinedVal: undefined };
      console.log(JSON.stringify(undefinedObj));
      expect(undefinedObj.undefinedVal).assertEqual(undefined);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1300
     * @tc.name BuiltinsPartialUtilityTypeTest1300
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1300';
      console.log(`${caseName} test start`);
      interface ArrayInterface {
        numArray: number[];
      }
      type PartialArrayInterface = Partial<ArrayInterface>;
      const arrayObj: PartialArrayInterface = { numArray: [1, 2, 3] };
      console.log(JSON.stringify(arrayObj));
      expect(arrayObj.numArray?.length).assertEqual(3);
      expect(arrayObj.numArray?.[0]).assertEqual(1);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1400
     * @tc.name BuiltinsPartialUtilityTypeTest1400
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1400';
      console.log(`${caseName} test start`);
      interface Person{
        name:string,
        age:number
      }
      interface NestedObjectInterface {
        person: Person;
      }
      type PartialNestedObjectInterface = Partial<NestedObjectInterface>;
      const nestedObj: PartialNestedObjectInterface = {
        person: { name: 'Alice', age: 25 }
      };
      console.log(JSON.stringify(nestedObj));
      expect(nestedObj.person?.name).assertEqual('Alice');
      expect(nestedObj.person?.age).assertEqual(25);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1500
     * @tc.name BuiltinsPartialUtilityTypeTest1500
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1500';
      console.log(`${caseName} test start`);
      interface FunctionInterface {
        add: (a: number, b: number) => number;
      }
      type PartialFunctionInterface = Partial<FunctionInterface>;
      const add = (a: number, b: number): number => a + b;
      const functionObj: PartialFunctionInterface = { add };
      console.log(JSON.stringify({ add: 'function' }));
      expect(functionObj.add?.(2, 3)).assertEqual(5);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1600
     * @tc.name BuiltinsPartialUtilityTypeTest1600
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1600';
      console.log(`${caseName} test start`);
      interface TupleInterface {
        tuple: [string, number];
      }
      type PartialTupleInterface = Partial<TupleInterface>;
      const tupleObj: PartialTupleInterface = { tuple: ['TypeScript', 2012] };
      console.log(JSON.stringify(tupleObj));
      expect(tupleObj.tuple?.[0]).assertEqual('TypeScript');
      expect(tupleObj.tuple?.[1]).assertEqual(2012);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1700
     * @tc.name BuiltinsPartialUtilityTypeTest1700
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1700';
      console.log(`${caseName} test start`);
      enum Color {
        Red,
        Green,
        Blue
      }
      interface EnumInterface {
        color: Color;
      }
      type PartialEnumInterface = Partial<EnumInterface>;
      const enumObj: PartialEnumInterface = { color: Color.Green };
      console.log(JSON.stringify(enumObj));
      expect(enumObj.color).assertEqual(1);
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1800
     * @tc.name BuiltinsPartialUtilityTypeTest1800
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1800';
      console.log(`${caseName} test start`);
      interface UnionInterface {
        value: string | number;
      }
      type PartialUnionInterface = Partial<UnionInterface>;
      const unionObjString: PartialUnionInterface = { value: 'test string' };
      const unionObjNumber: PartialUnionInterface = { value: 123 };

      console.log(JSON.stringify(unionObjString));
      expect(typeof unionObjString.value).assertEqual('string');
      console.log(JSON.stringify(unionObjNumber));
      expect(typeof unionObjNumber.value).assertEqual('number');
      console.log(`${caseName} test end`);
      Done();
    })
    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_1900
     * @tc.name BuiltinsPartialUtilityTypeTest1900
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest1900';
      console.log(`${caseName} test start`);
      interface MapInterface {
        myMap: Map<string, number>;
      }
      type PartialMapInterface = Partial<MapInterface>;
      const myMap = new Map<string, number>();
      myMap.set('one', 1);
      const mapObj: PartialMapInterface = { myMap };
      console.log(JSON.stringify(Array.from(mapObj.myMap?.entries() || [])));
      expect(mapObj.myMap?.get('one')).assertEqual(1);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2000
     * @tc.name BuiltinsPartialUtilityTypeTest2000
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2000';
      console.log(`${caseName} test start`);
      interface SetInterface {
        mySet: Set<number>;
      }
      type PartialSetInterface = Partial<SetInterface>;
      const mySet = new Set<number>([1, 2, 3]);
      const setObj: PartialSetInterface = { mySet };
      console.log(JSON.stringify(Array.from(setObj.mySet?.values() || [])));
      expect(setObj.mySet?.has(2)).assertEqual(true);
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2100
     * @tc.name BuiltinsPartialUtilityTypeTest2100
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2100';
      console.log(`${caseName} test start`);
      interface Int8ArrayInterface {
        myInt8Array: Int8Array;
      }
      type PartialInt8ArrayInterface = Partial<Int8ArrayInterface>;
      const myInt8Array = new Int8Array([1, 2, 3]);
      const int8ArrayObj: PartialInt8ArrayInterface = { myInt8Array: myInt8Array ?? new Int8Array() };
      console.log(JSON.stringify(Array.from(int8ArrayObj.myInt8Array ?? new Int8Array())));
      if (int8ArrayObj.myInt8Array) {
        expect(int8ArrayObj.myInt8Array[1]).assertEqual(2);
      }else {
        throw new Error('myUint8ClampedArray is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2200
     * @tc.name BuiltinsPartialUtilityTypeTest2200
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2200';
      console.log(`${caseName} test start`);
      interface Uint8ArrayInterface {
        myUint8Array: Uint8Array;
      }
      type PartialUint8ArrayInterface = Partial<Uint8ArrayInterface>;
      const myUint8Array = new Uint8Array([10, 20, 30]);
      const uint8ArrayObj: PartialUint8ArrayInterface = { myUint8Array: myUint8Array ?? new Uint8Array() };
      console.log(JSON.stringify(Array.from(uint8ArrayObj.myUint8Array ?? new Uint8Array())));
      if (uint8ArrayObj.myUint8Array) {
        expect(uint8ArrayObj.myUint8Array[1]).assertEqual(20);
      }else {
        throw new Error('myUint8ClampedArray is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2300
     * @tc.name BuiltinsPartialUtilityTypeTest2300
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2300';
      console.log(`${caseName} test start`);
      interface Uint8ClampedArrayInterface {
        myUint8ClampedArray: Uint8ClampedArray;
      }
      type PartialUint8ClampedArrayInterface = Partial<Uint8ClampedArrayInterface>;
      const myUint8ClampedArray = new Uint8ClampedArray([10, 256, 30]);
      const uint8ClampedArrayObj: PartialUint8ClampedArrayInterface = { myUint8ClampedArray: myUint8ClampedArray ?? new Uint8ClampedArray() };
      console.log(JSON.stringify(Array.from(uint8ClampedArrayObj.myUint8ClampedArray ?? new Uint8ClampedArray())));
      if (uint8ClampedArrayObj.myUint8ClampedArray) {
        expect(uint8ClampedArrayObj.myUint8ClampedArray[1]).assertEqual(255);
      }else {
        throw new Error('myUint8ClampedArray is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2400
     * @tc.name BuiltinsPartialUtilityTypeTest2400
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2400';
      console.log(`${caseName} test start`);
      interface Int16ArrayInterface {
        myInt16Array: Int16Array;
      }
      type PartialInt16ArrayInterface = Partial<Int16ArrayInterface>;
      const myInt16Array = new Int16Array([100, 200, 300]);
      const int16ArrayObj: PartialInt16ArrayInterface = { myInt16Array: myInt16Array ?? new Int16Array() };
      console.log(JSON.stringify(Array.from(int16ArrayObj.myInt16Array ?? new Int16Array())));
      if (int16ArrayObj.myInt16Array) {
        expect(int16ArrayObj.myInt16Array[1]).assertEqual(200);
      } else {
        throw new Error('myInt16Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })
    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2500
     * @tc.name BuiltinsPartialUtilityTypeTest2500
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2500';
      console.log(`${caseName} test start`);
      interface Uint16ArrayInterface {
        myUint16Array: Uint16Array;
      }
      type PartialUint16ArrayInterface = Partial<Uint16ArrayInterface>;
      const myUint16Array = new Uint16Array([1000, 2000, 3000]);
      const uint16ArrayObj: PartialUint16ArrayInterface = { myUint16Array: myUint16Array ?? new Uint16Array() };
      console.log(JSON.stringify(Array.from(uint16ArrayObj.myUint16Array ?? new Uint16Array())));
      if (uint16ArrayObj.myUint16Array) {
        expect(uint16ArrayObj.myUint16Array[1]).assertEqual(2000);
      } else {
        throw new Error('myUint16Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2600
     * @tc.name BuiltinsPartialUtilityTypeTest2600
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2600';
      console.log(`${caseName} test start`);
      interface Int32ArrayInterface {
        myInt32Array: Int32Array;
      }
      type PartialInt32ArrayInterface = Partial<Int32ArrayInterface>;
      const myInt32Array = new Int32Array([10000, 20000, 30000]);
      const int32ArrayObj: PartialInt32ArrayInterface = { myInt32Array: myInt32Array ?? new Int32Array() };
      console.log(JSON.stringify(Array.from(int32ArrayObj.myInt32Array ?? new Int32Array())));
      if (int32ArrayObj.myInt32Array) {
        expect(int32ArrayObj.myInt32Array[1]).assertEqual(20000);
      } else {
        throw new Error('myInt32Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2700
     * @tc.name BuiltinsPartialUtilityTypeTest2700
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2700';
      console.log(`${caseName} test start`);
      interface Uint32ArrayInterface {
        myUint32Array: Uint32Array;
      }
      type PartialUint32ArrayInterface = Partial<Uint32ArrayInterface>;
      const myUint32Array = new Uint32Array([100000, 200000, 300000]);
      const uint32ArrayObj: PartialUint32ArrayInterface = { myUint32Array: myUint32Array ?? new Uint32Array() };
      console.log(JSON.stringify(Array.from(uint32ArrayObj.myUint32Array ?? new Uint32Array())));
      if (uint32ArrayObj.myUint32Array) {
        expect(uint32ArrayObj.myUint32Array[1]).assertEqual(200000);
      } else {
        throw new Error('myUint32Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2800
     * @tc.name BuiltinsPartialUtilityTypeTest2800
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2800';
      console.log(`${caseName} test start`);
      interface Float32ArrayInterface {
        myFloat32Array: Float32Array;
      }
      type PartialFloat32ArrayInterface = Partial<Float32ArrayInterface>;
      const myFloat32Array = new Float32Array([1.1, 2.2, 3.3]);
      const float32ArrayObj: PartialFloat32ArrayInterface = { myFloat32Array: myFloat32Array ?? new Float32Array() };
      console.log(JSON.stringify(Array.from(float32ArrayObj.myFloat32Array ?? new Float32Array())));
      if (float32ArrayObj.myFloat32Array) {
        expect(float32ArrayObj.myFloat32Array[1]).assertEqual(2.200000047683716);
      } else {
        throw new Error('myFloat32Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })


    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_2900
     * @tc.name BuiltinsPartialUtilityTypeTest2900
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest2900';
      console.log(`${caseName} test start`);
      interface Float64ArrayInterface {
        myFloat64Array: Float64Array;
      }
      type PartialFloat64ArrayInterface = Partial<Float64ArrayInterface>;
      const myFloat64Array = new Float64Array([1.11, 2.22, 3.33]);
      const float64ArrayObj: PartialFloat64ArrayInterface = { myFloat64Array: myFloat64Array ?? new Float64Array() };
      console.log(JSON.stringify(Array.from(float64ArrayObj.myFloat64Array ?? new Float64Array())));
      if (float64ArrayObj.myFloat64Array) {
        expect(float64ArrayObj.myFloat64Array[1]).assertEqual(2.22);
      } else {
        throw new Error('myFloat64Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })

    /**
     * @tc.number SUB_BUILTINS_PARTIAL_UTILITY_TEST_3000
     * @tc.name BuiltinsPartialUtilityTypeTest3000
     * @tc.desc Partial Utility Type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('BuiltinsPartialUtilityTypeTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'BuiltinsPartialUtilityTypeTest3000';
      console.log(`${caseName} test start`);
      interface BigInt64ArrayInterface {
        myBigInt64Array: BigInt64Array;
      }
      type PartialBigInt64ArrayInterface = Partial<BigInt64ArrayInterface>;
      const myBigInt64Array = new BigInt64Array([1n, 2n, 3n]);
      const bigInt64ArrayObj: PartialBigInt64ArrayInterface = { myBigInt64Array: myBigInt64Array ?? new BigInt64Array() };
      if (bigInt64ArrayObj.myBigInt64Array) {
        expect(bigInt64ArrayObj.myBigInt64Array[1]).assertEqual(2n);
      } else {
        throw new Error('myBigInt64Array is undefined');
      }
      console.log(`${caseName} test end`);
      Done();
    })
  })
}