/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import { LightWeightSet } from '@kit.ArkTS';

class testLightWeightSet{
  name:string = ' ';
  age:number = 0;
  grade:Int8Array = new Int8Array([80,95,87]);

  constructor(name:string,age:number,grade:Int8Array){
    this.name=name;
    this.age=age;
    this.grade=grade;
  }
}
class Person {
  name: string;
  age: number;
  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class TestClass {
  private value: number;
  private name: string;
  constructor(value: number, name: string) {
    this.value = value;
    this.name = name;
  }

  getName(): string {
    return this.name;
  }

  equals(other: TestClass | null): boolean {
    if (other == null) return false;
    return this.value === other.value;
  }

  toString(): string {
    return `${this.name}:${this.value}`;
  }
}

class Employee extends Person {
  id: number;
  constructor(id: number, name: string, age: number) {
    super(name, age);
    this.id = id;
  }
}
interface SimpleObj {
  a: number;
  b: string;
}

interface NestedInner {
  v: number;
}

interface nullObj{

}

interface INameAgeObj {
  name: string;
  age: number;
}

interface NestedMid {
  name: string;
  inner: NestedInner;
}

interface NestedObj {
  id: number;
  data: NestedMid;
}

function sleep(count: int): Promise<void> {
  return new Promise<void>((resolve: (value: PromiseLike<void>) => void, reject: (value: Error) => void) => {
    setTimeout(() => {
      resolve(Promise.resolve())
    }, count)
  })
}

function lightWeightSetEqual<T>(set: LightWeightSet<T>, arr: T[]): boolean {
  let setArr = set.toArray();
  if (setArr.length !== arr.length) return false;
  for (let i = 0; i < setArr.length; i++) {
    if (setArr[i] !== arr[i]) return false;
  }
  return true;
}

export default function LightWeightSetTest05(): void {
  describe('LightWeightSetTest05', () => {
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
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0100
     * @tc.name      testLightWeightSetTest05Chapter0001
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for boolean type with logical NOT operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0001';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(!'s');
      lightWeightSet.add(!0);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === !'s' && entriesArray[0][1] === !'s' &&
        entriesArray[1][0] === !0 && entriesArray[1][1] === !0) ||
        (entriesArray[0][0] === !0 && entriesArray[0][1] === !0 &&
          entriesArray[1][0] === !'s' && entriesArray[1][1] === !'s')) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0200
     * @tc.name      testLightWeightSetTest05Chapter0002
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for Array<number> type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0002';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      let arr = [72.0,100,90,877];
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (value[0] === 72 && value[2] === 90 && key[0] === 72 && key[2] === 90) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0300
     * @tc.name      testLightWeightSetTest05Chapter0003
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for array with string properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0003';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr: Array<number> = [];
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (key.length === 0 && value.length === 0) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0400
     * @tc.name      testLightWeightSetTest05Chapter0004
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0004';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:SimpleObj = {a:7,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === obj1 && entriesArray[0][1] === obj1 &&
        entriesArray[1][0] === obj2 && entriesArray[1][1] === obj2) ||
        (entriesArray[0][0] === obj2 && entriesArray[0][1] === obj2 &&
          entriesArray[1][0] === obj1 && entriesArray[1][1] === obj1)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0500
     * @tc.name      testLightWeightSetTest05Chapter0005
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for object type including empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0005';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:nullObj = {};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === obj1 && entriesArray[0][1] === obj1 &&
        entriesArray[1][0] === obj2 && entriesArray[1][1] === obj2) ||
        (entriesArray[0][0] === obj2 && entriesArray[0][1] === obj2 &&
          entriesArray[1][0] === obj1 && entriesArray[1][1] === obj1)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0600
     * @tc.name      testLightWeightSetTest05Chapter0006
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for object type with Infinity and NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0006';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:Infinity,b:"test"};
      const obj2:SimpleObj = {a:NaN,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === obj1 && entriesArray[0][1] === obj1 &&
        entriesArray[1][0] === obj2 && entriesArray[1][1] === obj2) ||
        (entriesArray[0][0] === obj2 && entriesArray[0][1] === obj2 &&
          entriesArray[1][0] === obj1 && entriesArray[1][1] === obj1)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0700
     * @tc.name      testLightWeightSetTest05Chapter0007
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for custom class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0007';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const classA = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const classB = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(classA);
      lightWeightSet.add(classB);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === classA && entriesArray[0][1] === classA &&
        entriesArray[1][0] === classB && entriesArray[1][1] === classB) ||
        (entriesArray[0][0] === classB && entriesArray[0][1] === classB &&
          entriesArray[1][0] === classA && entriesArray[1][1] === classA)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0800
     * @tc.name      testLightWeightSetTest05Chapter0008
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0008';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      let valuesArray: number[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[0] === 1 && valuesArray[2] === 3) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_0900
     * @tc.name      testLightWeightSetTest05Chapter0009
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for Int8Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0009';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      let arr = new Int8Array([-128,0,127]);
      lightWeightSet.add(arr);
      let result: boolean = false;
      for (let value of lightWeightSet) {
        if (value[0] === -128 && value[2] === 127) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1000
     * @tc.name      testLightWeightSetTest05Chapter0010
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for Uint16Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0010';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint16Array>();
      let arr = new Uint16Array([0,100,65535]);
      lightWeightSet.add(arr);
      let result: boolean = false;
      for (let value of lightWeightSet) {
        if (value[0] === 0 && value[2] === 65535) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1100
     * @tc.name      testLightWeightSetTest05Chapter0011
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for Float32Array type with extreme values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0011';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float32Array>();
      let arr = new Float32Array([-3.5e38,3.5e38]);
      lightWeightSet.add(arr);
      let result: boolean = false;
      for (let value of lightWeightSet) {
        if (value[0] === -Infinity && value[1] === Infinity) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1200
     * @tc.name      testLightWeightSetTest05Chapter0012
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for Float64Array type with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0012';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float64Array>();
      let arr = new Float64Array([Infinity,NaN]);
      lightWeightSet.add(arr);
      let result: boolean = false;
      for (let value of lightWeightSet) {
        if (value[0] === Infinity && Number.isNaN(value[1])) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1300
     * @tc.name      testLightWeightSetTest05Chapter0013
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for Uint8ClampedArray type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0013';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8ClampedArray>();
      let arr = new Uint8ClampedArray([255,0]);
      lightWeightSet.add(arr);
      let result: boolean = false;
      for (let value of lightWeightSet) {
        if (value[0] === 255 && value[1] === 0) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1400
     * @tc.name      testLightWeightSetTest05Chapter0014
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for BigInt64Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0014';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<BigInt64Array>();
      let arr = new BigInt64Array([255n,0n]);
      lightWeightSet.add(arr);
      let result: boolean = false;
      for (let value of lightWeightSet) {
        if (value[0] === 255n && value[1] === 0n) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1500
     * @tc.name      testLightWeightSetTest05Chapter0015
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0015';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("Bob");
      lightWeightSet.add("Alice");
      let valuesArray: string[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[0] === "Bob" && valuesArray[1] === "Alice") {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1600
     * @tc.name      testLightWeightSetTest05Chapter0016
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for null and undefined in string set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0016';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string | null | undefined>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let valuesArray: (string | null | undefined)[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[0] === null && valuesArray[1] === undefined) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1700
     * @tc.name      testLightWeightSetTest05Chapter0017
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0017';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const value1 = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const value2 = "\n\t";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let valuesArray: string[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[1] === "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" && valuesArray[0] === "\n\t") {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1800
     * @tc.name      testLightWeightSetTest05Chapter0018
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0018';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const value1 = "🎅";
      const value2 = "🎵";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let valuesArray: string[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[0] === "🎅" && valuesArray[1] === "🎵") {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_1900
     * @tc.name      testLightWeightSetTest05Chapter0019
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for number type with Math.floor and MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0019';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Math.floor(1.5));
      lightWeightSet.add(Number.MIN_VALUE);
      let valuesArray: number[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[1] === Math.floor(1.5) && valuesArray[0] === Number.MIN_VALUE) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2000
     * @tc.name      testLightWeightSetTest05Chapter0020
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for number type with hexadecimal and exponent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0020';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0x0102 as number);
      lightWeightSet.add(2 ** 3 as number);
      let valuesArray: number[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      expect(valuesArray.length).assertEqual(2);
      let result: boolean = lightWeightSet.has(0x0102 as number) && lightWeightSet.has(2 ** 3 as number);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2100
     * @tc.name      testLightWeightSetTest05Chapter0021
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0021';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);
      let valuesArray: boolean[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[1] === true && valuesArray[0] === false) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2200
     * @tc.name      testLightWeightSetTest05Chapter0022
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for null and undefined in boolean set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0022';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean | null | undefined>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let valuesArray: (boolean | null | undefined)[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[1] === undefined && valuesArray[0] === null) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2300
     * @tc.name      testLightWeightSetTest05Chapter0023
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for boolean type with logical NOT operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0023';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(!'s');
      lightWeightSet.add(!0);
      let valuesArray: boolean[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[0] === !'s' && valuesArray[1] === !0) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2400
     * @tc.name      testLightWeightSetTest05Chapter0024
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for Array<number> type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0024';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      let arr = [72.0,100,90,877];
      lightWeightSet.add(arr);
      let result: boolean = false;
      for (let value of lightWeightSet) {
        if (value[0] === 72 && value[2] === 90) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2500
     * @tc.name      testLightWeightSetTest05Chapter0025
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for array with string properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0025';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr: Array<number> = [];
      lightWeightSet.add(arr);
      let result: boolean = false;
      for (let value of lightWeightSet) {
        if (value.length === 0) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2600
     * @tc.name      testLightWeightSetTest05Chapter0026
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0026';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:SimpleObj = {a:7,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let valuesArray: object[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2700
     * @tc.name      testLightWeightSetTest05Chapter0027
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for object type including empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0027';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:nullObj = {};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let valuesArray: object[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2800
     * @tc.name      testLightWeightSetTest05Chapter0028
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for object type with Infinity and NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0028';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:Infinity,b:"test"};
      const obj2:SimpleObj = {a:NaN,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let valuesArray: object[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_2900
     * @tc.name      testLightWeightSetTest05Chapter0029
     * @tc.desc      Verify LightWeightSet's iterator returns correct values for custom class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0029';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const classA = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const classB = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(classA);
      lightWeightSet.add(classB);
      let valuesArray: testLightWeightSet[] = [];
      for (let val of lightWeightSet) {
        valuesArray.push(val);
      }
      let result: boolean = false;
      if (valuesArray[1] === classA && valuesArray[0] === classB || valuesArray[0] === classA && valuesArray[1] === classB) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3000
     * @tc.name      testLightWeightSetTest05Chapter0030
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0030';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      let obj: Array<number> = [1.0, 2.0, 3.0];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3100
     * @tc.name      testLightWeightSetTest05Chapter0031
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for Int8Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0031';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      let arr = new Int8Array([-128,0,127]);
      lightWeightSet.add(arr);
      let obj = new Int8Array([-128,0,127]);
      let result = lightWeightSetEqual(lightWeightSet, [obj]);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3200
     * @tc.name      testLightWeightSetTest05Chapter0032
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for Uint16Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0032';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint16Array>();
      let arr = new Uint16Array([0,100,65535]);
      lightWeightSet.add(arr);
      let obj = [new Uint16Array([0,100,65535])];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3300
     * @tc.name      testLightWeightSetTest05Chapter0033
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for Float32Array type with extreme values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0033';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float32Array>();
      let arr = new Float32Array([-3.5e38,3.5e38]);
      lightWeightSet.add(arr);
      let obj = [new Float32Array([-3.5e38,3.5e38])];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3400
     * @tc.name      testLightWeightSetTest05Chapter0034
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for Float64Array type with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0034';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float64Array>();
      let arr = new Float64Array([Infinity,NaN]);
      lightWeightSet.add(arr);
      let obj = [new Float64Array([Infinity,NaN])];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3500
     * @tc.name      testLightWeightSetTest05Chapter0035
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for Uint8ClampedArray type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0035';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8ClampedArray>();
      let arr = new Uint8ClampedArray([255,0]);
      lightWeightSet.add(arr);
      let obj = [new Uint8ClampedArray([255,0])];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3600
     * @tc.name      testLightWeightSetTest05Chapter0036
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for BigInt64Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0036';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<BigInt64Array>();
      let arr = new BigInt64Array([255n,0n]);
      lightWeightSet.add(arr);
      let obj = [new BigInt64Array([255n,0n])];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3700
     * @tc.name      testLightWeightSetTest05Chapter0037
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0037';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("Bob");
      lightWeightSet.add("Alice");
      let obj = ["Bob", "Alice"];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3800
     * @tc.name      testLightWeightSetTest05Chapter0038
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for null and undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0038';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string | null | undefined>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let obj: (string | null | undefined)[] = [null, undefined];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_3900
     * @tc.name      testLightWeightSetTest05Chapter0039
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0039';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const value1 = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const value2 = "\n\t";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let obj = [value1, value2];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4000
     * @tc.name      testLightWeightSetTest05Chapter0040
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0040';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const value1 = "🎅";
      const value2 = "🎵";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let obj = [value1, value2];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4100
     * @tc.name      testLightWeightSetTest05Chapter0041
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for number type with Math.floor and MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0041';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Math.floor(1.5));
      lightWeightSet.add(Number.MIN_VALUE);
      let obj = [Math.floor(1.5), Number.MIN_VALUE];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4200
     * @tc.name      testLightWeightSetTest05Chapter0042
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for number type with hexadecimal and exponent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0042';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0x0102 as number);
      lightWeightSet.add(2 ** 3 as number);
      let obj: number[] = [0x0102 as number, 2 ** 3 as number];
      expect(lightWeightSet.length).assertEqual(obj.length);
      expect(lightWeightSet.has(obj[0])).assertTrue();
      expect(lightWeightSet.has(obj[1])).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4300
     * @tc.name      testLightWeightSetTest05Chapter0043
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0043';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);
      let obj = [true, false];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4400
     * @tc.name      testLightWeightSetTest05Chapter0044
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for null and undefined in boolean set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0044';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean | null | undefined>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let obj: (boolean | null | undefined)[] = [undefined, null];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4500
     * @tc.name      testLightWeightSetTest05Chapter0045
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for boolean type with logical NOT operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0045';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(!'s');
      lightWeightSet.add(!0);
      let obj = [!'s', !0];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4600
     * @tc.name      testLightWeightSetTest05Chapter0046
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for Array<number> type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0046';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      let arr = [72.0,100,90,877];
      lightWeightSet.add(arr);
      let obj: Array<Array<number>> = [[72.0, 100.0, 90.0, 877.0]];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4700
     * @tc.name      testLightWeightSetTest05Chapter0047
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for array with string properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0047';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr: Array<number> = [];
      lightWeightSet.add(arr);
      let obj: Array<Array<number>> = [[]];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4800
     * @tc.name      testLightWeightSetTest05Chapter0048
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0048';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:SimpleObj = {a:7,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let result: boolean = lightWeightSet.has(obj1) && lightWeightSet.has(obj2);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_4900
     * @tc.name      testLightWeightSetTest05Chapter0049
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for object type including empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0049';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:nullObj = {};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      const obj3:SimpleObj = {a:1,b:"test"};
      const obj4:nullObj = {};
      let obj: Array<object> = [obj3, obj4];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5000
     * @tc.name      testLightWeightSetTest05Chapter0050
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for object type with Infinity and NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0050';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:Infinity,b:"test"};
      const obj2:SimpleObj = {a:NaN,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      const obj3:SimpleObj = {a:Infinity,b:"test"};
      const obj4:SimpleObj = {a:NaN,b:"key"};
      let obj: Array<object> = [obj3, obj4];
      let result = lightWeightSetEqual(lightWeightSet, obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5100
     * @tc.name      testLightWeightSetTest05Chapter0051
     * @tc.desc      Verify LightWeightSet's equal method returns correct result for custom class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0051';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const classA = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const classB = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(classA);
      lightWeightSet.add(classB);
      expect(lightWeightSet.length).assertEqual(2);
      expect(lightWeightSet.has(classA)).assertTrue();
      expect(lightWeightSet.has(classB)).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5200
     * @tc.name      testLightWeightSetTest05Chapter0052
     * @tc.desc      Get a string length in the lightWeightSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0052';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      let result = lightWeightSet.toString();
      expect(result.length).assertEqual(8);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5300
     * @tc.name      testLightWeightSetTest05Chapter0053
     * @tc.desc      Get a string containing all keys and values in the container.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0053';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      let result = lightWeightSet.toString();
      expect(result).assertEqual("squirrel");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5400
     * @tc.name      testLightWeightSetTest05Chapter0054
     * @tc.desc      Get a string containing all keys and values in the container,test Int8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0054';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const value_1 = new Int8Array([100]);
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      expect(result).assertEqual("100");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5500
     * @tc.name      testLightWeightSetTest05Chapter0055
     * @tc.desc      Get a string containing all keys and values in the container,test Float32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0055';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float32Array>();
      const value_1 = new Float32Array([Infinity]);
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      expect(result).assertEqual("Infinity");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5600
     * @tc.name      testLightWeightSetTest05Chapter0056
     * @tc.desc      Get a string containing all keys and values in the container,test number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0056';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      let value_1: number = Number.MAX_VALUE;
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      expect(result).assertEqual("1.7976931348623157e+308");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5700
     * @tc.name      testLightWeightSetTest05Chapter0057
     * @tc.desc      Get a string containing all keys and values in the container,test boolean false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0057';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      let value_1: boolean = false;
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      expect(result).assertEqual("false");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5800
     * @tc.name      testLightWeightSetTest05Chapter0058
     * @tc.desc      Get a string containing all keys and values in the container,test boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0058';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      let value_1: boolean = true;
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      expect(result).assertEqual("true");
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_5900
     * @tc.name      testLightWeightSetTest05Chapter0059
     * @tc.desc      Get a string containing all keys and values in the container,test Unit8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0059';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const value_1 = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      if (result.includes(',')) {
        const parts = result.split(',');
        const numbers: number[] = [];
        for (let i = 0; i < parts.length; i++) {
          numbers.push(Number(parts[i]));
        }
        let str = '';
        for (let i = 0; i < numbers.length; i++) {
          str += String.fromCharCode(numbers[i].toInt());
        }
        expect(str).assertEqual("HelloWorld123?");
      } else {
        expect(result).assertEqual("HelloWorld123?");
      }
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6000
     * @tc.name      testLightWeightSetTest05Chapter0060
     * @tc.desc      Get a string containing all keys and values in the container,test class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0060';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<TestClass>();
      let value_1 = new TestClass(1, "First");
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      expect(result).assertEqual("First:1");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6100
     * @tc.name      testLightWeightSetTest05Chapter0061
     * @tc.desc      Get a string containing all keys and values in the container,test object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2[object Object]
     */
    it("testLightWeightSetTest05Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0061';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      let value_1: INameAgeObj = { name: 'Alice', age: 25 };
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      expect(typeof result).assertEqual("string");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6200
     * @tc.name      testLightWeightSetTest05Chapter0062
     * @tc.desc      Get a array length in the lightWeightSet
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0062';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      let result = lightWeightSet.toArray();
      expect(result.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6300
     * @tc.name      testLightWeightSetTest05Chapter0063
     * @tc.desc      Get a first value of Array containing all keys and values in the container.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0063';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      let result = lightWeightSet.toArray();
      expect(result[0]).assertEqual("squirrel");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6400
     * @tc.name      testLightWeightSetTest05Chapter0064
     * @tc.desc      Get a array containing all keys and values in the container,test Int8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0064';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const value_1 = new Int8Array([100]);
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6500
     * @tc.name      testLightWeightSetTest05Chapter0065
     * @tc.desc      Get a array containing all keys and values in the container,test Float32Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0065';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float32Array>();
      const value_1 = new Float32Array([Infinity]);
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result.length).assertEqual(1);
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6600
     * @tc.name      testLightWeightSetTest05Chapter0066
     * @tc.desc      Get a array containing all keys and values in the container,test number.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0066';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      let value_1: number = Number.MAX_VALUE;
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result[0]).assertEqual(1.7976931348623157e+308);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6700
     * @tc.name      testLightWeightSetTest05Chapter0067
     * @tc.desc      Get a array containing all keys and values in the container,test boolean false
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0067';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      let value_1: boolean = false;
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result[0]).assertEqual(false);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6800
     * @tc.name      testLightWeightSetTest05Chapter0068
     * @tc.desc      Get a array containing all keys and values in the container,test boolean true
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0068';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      let value_1: boolean = true;
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result[0]).assertEqual(true);
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_6900
     * @tc.name      testLightWeightSetTest05Chapter0069
     * @tc.desc      Get a array containing all keys and values in the container,test Unit8Array.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0069';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const value_1 = new Uint8Array([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result[0].length).assertEqual(14);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_7000
     * @tc.name      testLightWeightSetTest05Chapter0070
     * @tc.desc      Get a array containing all keys and values in the container,test class
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest05Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0070';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<TestClass>();
      let value_1 = new TestClass(1, "First");
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_COMMONLIBRARY_UTIL_LIGHTWEIGHTSET_TESTFIVE_7100
     * @tc.name      testLightWeightSetTest05Chapter0071
     * @tc.desc      Get a array containing all keys and values in the container,test object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2[object Object]
     */
    it("testLightWeightSetTest05Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest05Chapter0071';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      let value_1: INameAgeObj = { name: 'Alice', age: 25 };
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result.length).assertEqual(1);
      console.log(TAG + 'end');
    });
  })
}
