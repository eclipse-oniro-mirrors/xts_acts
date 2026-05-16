/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import hilog from '@ohos.hilog'
export async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

function getFirstElement<T = number>(arr: T[]): T | undefined {
  if (arr.length === 0) {
    return undefined;
  }
  return arr[0];
}

class KeyValuePair {
  key: string;

  constructor(key: string) {
    this.key = key;
  }
}

class DataStorage<T = string> {
  private data: T;

  constructor(initialData: T) {
    this.data = initialData;
  }

  getData(): T {
    return this.data;
  }

  setData(newData: T): void {
    this.data = newData;
  }
}

class Wrapper<T = string> {
  private data: T;

  constructor(initialData: T) {
    this.data = initialData;
  }

  getData(): T {
    return this.data;
  }

  setData(newData: T): void {
    this.data = newData;
  }

  static create<T = string>(initialData: T): Wrapper<T> {
    return new Wrapper<T>(initialData);
  }
}

class DataWrapper<T = Object> {
  private data: T;

  constructor(initialData: T) {
    this.data = initialData;
  }

  getData(): T {
    return this.data;
  }

  setData(newData: T): void {
    this.data = newData;
  }

  static create<T = Object>(initialData: T): DataWrapper<T> {
    return new DataWrapper<T>(initialData);
  }
}

class OptionalPair<T, U = null | undefined> {
  private value1: T;
  private value2: U;

  constructor(value1: T, value2: U) {
    this.value1 = value1;
    this.value2 = value2;
  }

  getValue1(): T {
    return this.value1;
  }

  getValue2(): U {
    return this.value2;
  }
}
class Pair<T1 = number, T2 = string> {
  private value1: T1;
  private value2: T2;

  constructor(value1: T1, value2: T2) {
    this.value1 = value1;
    this.value2 = value2;
  }

  getValue1(): T1 {
    return this.value1;
  }

  getValue2(): T2 {
    return this.value2;
  }
}

class ExtendedPair<T1 = number, T2 = string, T3 = boolean> extends Pair<T1, T2> {
  private value3: T3;

  constructor(value1: T1, value2: T2, value3: T3) {
    super(value1, value2);
    this.value3 = value3;
  }

  getValue3(): T3 {
    return this.value3;
  }
}

class Pair07<T1 = number, T2 = string> {
  private value1: T1;
  private value2: T2;

  constructor(value1: T1, value2: T2) {
    this.value1 = value1;
    this.value2 = value2;
  }

  getValue1(): T1 {
    return this.value1;
  }

  getValue2(): T2 {
    return this.value2;
  }
}

class ExtendedPair07<T1 = number, T2 = string, T3 = boolean> extends Pair07<T1, T2> {
  private value3: T3;

  constructor(value1: T1, value2: T2, value3: T3) {
    super(value1, value2);
    this.value3 = value3;
  }

  getValue3(): T3 {
    return this.value3;
  }
}
class Container<T1 = int, T2 = string, T3 = boolean> {
  private value1: T1;
  private value2: T2;
  private value3: T3;

  constructor(value1: T1, value2: T2, value3: T3) {
    this.value1 = value1;
    this.value2 = value2;
    this.value3 = value3;
  }

  getValue1(): T1 {
    return this.value1;
  }

  getValue2(): T2 {
    return this.value2;
  }

  getValue3(): T3 {
    return this.value3;
  }
}
class Container09<T1 = int, T2 = string, T3 = boolean> {
  private value1: T1;
  private value2: T2;
  private value3: T3;

  constructor(value1: T1, value2: T2, value3: T3) {
    this.value1 = value1;
    this.value2 = value2;
    this.value3 = value3;
  }

  getValue1(): T1 {
    return this.value1;
  }

  getValue2(): T2 {
    return this.value2;
  }

  getValue3(): T3 {
    return this.value3;
  }
}
class MultiTypeContainer<T1 = int, T2 = string, T3 = boolean, T4 = KeyValuePair> {
  private value1: T1;
  private value2: T2;
  private value3: T3;
  private value4: T4;

  constructor(value1: T1, value2: T2, value3: T3, value4: T4) {
    this.value1 = value1;
    this.value2 = value2;
    this.value3 = value3;
    this.value4 = value4;
  }

  getValue1(): T1 {
    return this.value1;
  }

  getValue2(): T2 {
    return this.value2;
  }

  getValue3(): T3 {
    return this.value3;
  }

  getValue4(): T4 {
    return this.value4;
  }
}
class MultiTypeContainer11<T3, T4, T1 = number, T2 = string> {
  private value1: T1;
  private value2: T2;
  private value3: T3;
  private value4: T4;

  constructor(value3: T3, value4: T4, value1: T1, value2: T2) {
    this.value1 = value1;
    this.value2 = value2;
    this.value3 = value3;
    this.value4 = value4;
  }


  getValue1(): T1 {
    return this.value1;
  }

  getValue2(): T2 {
    return this.value2;
  }

  getValue3(): T3 {
    return this.value3;
  }

  getValue4(): T4 {
    return this.value4;
  }
}
class G12<T = boolean> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }
}
class G13<T = boolean, U = T[]> {
  private value: T;
  private values: U;

  constructor(value: T, values: U) {
    this.value = value;
    this.values = values;
  }

  getValueAndValues(): [T, U] {
    return [this.value, this.values];
  }
}
class G14<T = string, U = T[]> {
  private value: T;
  private values: U;

  constructor(value: T, values: U) {
    this.value = value;
    this.values = values;
  }

  getValueAndValues(): [T, U] {
    return [this.value, this.values];
  }
}
class G16<T, U = T> {
  private value1: T;
  private value2: U;

  constructor(value1: T, value2: U) {
    this.value1 = value1;
    this.value2 = value2;
  }

  areEqual(): boolean {
    return String(this.value1) === String(this.value2);
  }
}

class G18<T, U = T> {
  private value1: T;
  private value2: U;

  constructor(value1: T, value2: U) {
    this.value1 = value1;
    this.value2 = value2;
  }

  areTypesEqual(): boolean {
    return typeof this.value1 === typeof this.value2;
  }
}

class G22<T, U = T, R = T> {
  private value1: T;
  private value2: U;

  constructor(value1: T, value2: U) {
    this.value1 = value1;
    this.value2 = value2;
  }

  mapValues(mapper: (v1: T, v2: U) => R): R {
    return mapper(this.value1, this.value2);
  }
}
class G23 {
  areEqual<T, U>(value1: T, value2: U): boolean {
    return String(value1) === String(value2);
  }
}

class G24 {
  logicalAnd<T, U>(value1: T, value2: U): boolean {
    return Boolean(value1) && Boolean(value2);
  }
}
class G25 {
  combineToArray<T, U>(value1: T, value2: U): (T | U)[] {
    return [value1, value2];
  }
}

class G27 {
  mapValues<T, U, R>(value1: T, value2: U, mapper: (v1: T, v2: U) => R): R {
    return mapper(value1, value2);
  }
}
class G28 {
  randomSelect<T, U>(value1: T, value2: U): T | U {
    return Math.random() > 0.5 ? value1 : value2;
  }
}
class G29<T, U = T, V = U> {
  private value1: T;
  private value2: U;
  private value3: V;

  constructor(value1: T, value2: U, value3: V) {
    this.value1 = value1;
    this.value2 = value2;
    this.value3 = value3;
  }

  getValue1(): T {
    return this.value1;
  }

  getValue2(): U {
    return this.value2;
  }

  getValue3(): V {
    return this.value3;
  }
}
class G30<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  assignTo(other: G30<T>): void {
    other.value = this.value;
  }
}
class G31<T extends U, U> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  assignTo(other: G31<U, U>): void {
    other.value = this.value;
  }
}
interface User {
  id: number;
  name: string;
}
interface UserData {
  name: string;
  age: number;
}

export default function builtinsGenericsDefaultTest() {
  describe('BuiltinsGenericsDefaultTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action,which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action,which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action,which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(async () => {
      await sleep(50);
      // Presets a clear action,which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_0100
     * @tc.name builtinsGenericsDefaultTest0100
     * @tc.desc test Basic data types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest0100';
      console.info(`${caseName} test start`);
      const stringStorage = new DataStorage('Hello, world!');
      console.log(stringStorage.getData());
      expect(stringStorage.getData()).assertEqual('Hello, world!')
      stringStorage.setData('Goodbye, world!');
      console.log(stringStorage.getData());
      expect(stringStorage.getData()).assertEqual('Goodbye, world!')
      const numberStorage = new DataStorage<number>(42);
      console.log(numberStorage.getData().toString());
      expect(numberStorage.getData()).assertEqual(42)
      numberStorage.setData(100);
      console.log(numberStorage.getData().toString());
      expect(numberStorage.getData()).assertEqual(100)
      const booleanStorage = new DataStorage<boolean>(true);
      expect(booleanStorage.getData().toString()).assertEqual('true')
      booleanStorage.setData(false);
      expect(booleanStorage.getData().toString()).assertEqual('false')
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_0200
     * @tc.name builtinsGenericsDefaultTest0200
     * @tc.desc test Basic data types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest0200';
      console.info(`${caseName} test start`);
      const numbers: number[] = [1, 2, 3];
      console.log(getFirstElement(numbers)?.toString());
      expect(getFirstElement(numbers)).assertEqual(1);
      const strings: string[] = ['apple', 'banana', 'cherry'];
      console.log(getFirstElement<string>(strings)?.toString());
      expect(getFirstElement<string>(strings)).assertEqual('apple');
      const booleans: boolean[] = [true, false, true];
      expect(getFirstElement<boolean>(booleans)).assertTrue();
      const emptyArray: number[] = [];
      expect(getFirstElement<number>(emptyArray)).assertEqual(undefined);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_0400
     * @tc.name builtinsGenericsDefaultTest0400
     * @tc.desc test Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest0400';
      console.info(`${caseName} test start`);
      const objectWrapper = DataWrapper.create<UserData>({
        name: 'Alice', age: 30
      });
      console.log(objectWrapper.getData().name);
      expect(objectWrapper.getData().name).assertEqual('Alice');
      expect(objectWrapper.getData().age).assertEqual(30);
      objectWrapper.setData({
        name: 'Bob', age: 25
      });
      console.log(objectWrapper.getData().name);
      expect(objectWrapper.getData().name).assertEqual('Bob');
      expect(objectWrapper.getData().age).assertEqual(25);
      const stringWrapper = DataWrapper.create<string>('Hello, world!');
      console.log(stringWrapper.getData());
      expect(stringWrapper.getData()).assertEqual('Hello, world!');
      const numberWrapper = DataWrapper.create<number>(42);
      console.log(numberWrapper.getData().toString());
      expect(numberWrapper.getData()).assertEqual(42);
      const userWrapper = DataWrapper.create<User>({
        id: 1, name: 'Charlie'
      });
      console.log(userWrapper.getData().name);
      expect(userWrapper.getData().name).assertEqual('Charlie');
      userWrapper.setData({
        id: 2, name: 'David'
      });
      expect(userWrapper.getData().name).assertEqual('David');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_0500
     * @tc.name builtinsGenericsDefaultTest0500
     * @tc.desc test Null、undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest0500';
      console.info(`${caseName} test start`);
      const pairWithNull = new OptionalPair<string, null>('Hello', null);
      const pairWithUndefined = new OptionalPair<string, undefined>('TypeScript', undefined);
      const pairWithCustom = new OptionalPair<string, int>('Custom', 42);
      expect(pairWithNull.getValue2()).assertEqual(null);
      expect(pairWithUndefined.getValue2()).assertEqual(undefined);
      expect(pairWithCustom.getValue2()).assertEqual(42);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_0600
     * @tc.name builtinsGenericsDefaultTest0600
     * @tc.desc test Null、undefinedCustom type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest0600';
      console.info(`${caseName} test start`);
      const defaultPair = new Pair(42, 'Hello');
      const extendedPair = new ExtendedPair(100, 'World', true);
      expect(defaultPair.getValue1()).assertEqual(42);
      expect(defaultPair.getValue2()).assertEqual('Hello');
      expect(extendedPair.getValue1()).assertEqual(100);
      expect(extendedPair.getValue2()).assertEqual('World');
      expect(extendedPair.getValue3()).assertEqual(true);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_0700
     * @tc.name builtinsGenericsDefaultTest0700
     * @tc.desc test Custom type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest0700';
      console.info(`${caseName} test start`);
      const defaultPair = new Pair07(42, 'Hello');
      const extendedPair = new ExtendedPair07(100, 'World', true);
      expect(defaultPair.getValue1()).assertEqual(42);
      expect(defaultPair.getValue2()).assertEqual('Hello');
      expect(extendedPair.getValue1()).assertEqual(100);
      expect(extendedPair.getValue2()).assertEqual('World');
      expect(extendedPair.getValue3()).assertEqual(true);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_0800
     * @tc.name builtinsGenericsDefaultTest0800
     * @tc.desc test Different types of values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest0800';
      console.info(`${caseName} test start`);
      const defaultContainer = new Container(42, 'Hello', true);
      const customContainer = new Container<string, int, boolean>('TypeScript', 100, false);
      expect(defaultContainer.getValue1()).assertEqual(42);
      expect(defaultContainer.getValue2()).assertEqual('Hello');
      expect(defaultContainer.getValue3()).assertEqual(true);
      expect(customContainer.getValue1()).assertEqual('TypeScript');
      expect(customContainer.getValue2()).assertEqual(100);
      expect(customContainer.getValue3()).assertEqual(false);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_0900
     * @tc.name builtinsGenericsDefaultTest0900
     * @tc.desc test Different types of values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest0900';
      console.info(`${caseName} test start`);
      const defaultContainer = new Container09(42, 'Hello', true);
      const customContainer = new Container09<string,int,boolean>('TypeScript', 100, false);
      expect(defaultContainer.getValue1()).assertEqual(42);
      expect(defaultContainer.getValue2()).assertEqual('Hello');
      expect(defaultContainer.getValue3()).assertEqual(true);
      expect(customContainer.getValue1()).assertEqual('TypeScript');
      expect(customContainer.getValue2()).assertEqual(100);
      expect(customContainer.getValue3()).assertEqual(false);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_1000
     * @tc.name builtinsGenericsDefaultTest1000
     * @tc.desc test There are multiple types of parameters, all with default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest1000';
      console.info(`${caseName} test start`);
      const defaultContainer = new MultiTypeContainer(42, 'Hello', true, new KeyValuePair('value'));
      const customContainer = new MultiTypeContainer<string, int,boolean,KeyValuePair>('TypeScript', 100, false, new KeyValuePair('customValue'));
      expect(defaultContainer.getValue1()).assertEqual(42);
      expect(defaultContainer.getValue2()).assertEqual('Hello');
      expect(defaultContainer.getValue3()).assertEqual(true);
      expect(defaultContainer.getValue4().key).assertEqual('value');
      expect(customContainer.getValue1()).assertEqual('TypeScript');
      expect(customContainer.getValue2()).assertEqual(100);
      expect(customContainer.getValue3()).assertEqual(false);
      expect(customContainer.getValue4().key).assertEqual('customValue');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_1100
     * @tc.name builtinsGenericsDefaultTest1100
     * @tc.desc test The front ones have default values, and the later ones don't
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest1100';
      console.info(`${caseName} test start`);
      const customContainer =
        new MultiTypeContainer11<boolean, Array<number>, number, string>(false, [1, 2, 3], 100, 'World');
      expect(customContainer.getValue1()).assertEqual(100);
      expect(customContainer.getValue2()).assertEqual('World');
      expect(customContainer.getValue3()).assertEqual(false);
      expect(customContainer.getValue4().toString()).assertEqual('1,2,3');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_1200
     * @tc.name builtinsGenericsDefaultTest1200
     * @tc.desc test The default value is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest1200';
      console.info(`${caseName} test start`);
      const example = new G12(true);
      expect(example.getValue()).assertEqual(true);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_1600
     * @tc.name builtinsGenericsDefaultTest1600
     * @tc.desc test There is no default value in front and there is in the back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest1600';
      console.info(`${caseName} test start`);
      const example = new G16<int,int>(10, 10);
      expect(example.areEqual()).assertEqual(true);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_1800
     * @tc.name builtinsGenericsDefaultTest1800
     * @tc.desc test The latter default is the preceding generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest1800';
      console.info(`${caseName} test start`);
      const example = new G18<int, string>(10, '10');
      expect(example.areTypesEqual()).assertEqual(false);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_2200
     * @tc.name builtinsGenericsDefaultTest2200
     * @tc.desc test The latter default is the preceding generic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest2200';
      console.info(`${caseName} test start`);
      const example = new G22<int, int, int>(10, 20);
      expect(example.mapValues((v1, v2) => v1 + v2)).assertEqual(30);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_2300
     * @tc.name builtinsGenericsDefaultTest2300
     * @tc.desc test The generic method is used in generic classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest2300';
      console.info(`${caseName} test start`);
      const example1 = new G23();
      expect(example1.areEqual(10, '10')).assertEqual(true);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_2400
     * @tc.name builtinsGenericsDefaultTest2400
     * @tc.desc test The generic method is used in generic classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest2400';
      console.info(`${caseName} test start`);
      const example = new G24();
      expect(example.logicalAnd(true, false)).assertEqual(false);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })


    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_2500
     * @tc.name builtinsGenericsDefaultTest2500
     * @tc.desc test The generic method is used in generic classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest2500';
      console.info(`${caseName} test start`);
      const example = new G25();
      expect(example.combineToArray(10, 'hello').toString()).assertEqual('10,hello');
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_2700
     * @tc.name builtinsGenericsDefaultTest2700
     * @tc.desc test The generic method is used in generic classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest2700';
      console.info(`${caseName} test start`);
      const example = new G27();
      expect(example.mapValues<int,int,int>(10, 20, (v1, v2) => v1 + v2)).assertEqual(30);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_2800
     * @tc.name builtinsGenericsDefaultTest2800
     * @tc.desc test The generic method is used in generic classes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest2800';
      console.info(`${caseName} test start`);
      const example = new G28();
      const result = example.randomSelect(10, 'hello');
      expect([10, 'hello']).assertContain(result);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })

    /**
     * @tc.number SUB_BUILTINS_GENERICS_DEFAULT_TEST_2900
     * @tc.name builtinsGenericsDefaultTest2900
     * @tc.desc test Multiple generics are assigned to each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsGenericsDefaultTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async (Done: Function) => {
      const caseName = 'builtinsGenericsDefaultTest2900';
      console.info(`${caseName} test start`);
      const pair1 = new G29<int,int,string>(42, 100, 'hello');
      expect(pair1.getValue1()).assertEqual(42);
      expect(pair1.getValue2()).assertEqual(100);
      expect(pair1.getValue3()).assertEqual('hello');
      const pair2 = new G29<int,int,int>(42, 100, 11);
      expect(pair2.getValue1()).assertEqual(42);
      expect(pair2.getValue2()).assertEqual(100);
      expect(pair2.getValue3()).assertEqual(11);
      console.info(`${caseName} test end`);
      Done.unsafeCall();
    })
  })
}