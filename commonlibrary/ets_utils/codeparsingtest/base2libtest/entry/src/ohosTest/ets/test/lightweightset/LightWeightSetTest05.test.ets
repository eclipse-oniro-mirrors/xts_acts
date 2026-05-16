import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
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

  equals(other: TestClass): boolean {
    if (!(other instanceof TestClass)) return false;
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

interface NestedMid {
  name: string;
  inner: NestedInner;
}

interface NestedObj {
  id: number;
  data: NestedMid;
}

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function LightWeightSetTest05() {
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0001
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0002
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
      let arr = [72,100,90,877];
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0003
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
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (value[1] === undefined && value[0] === undefined &&
          key[1] === undefined && key[0] === undefined) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0004
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0005
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0006
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0007
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0008
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: number[] = [];
      let temp: IteratorResult<number> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[0] === 1 && valuesArray[2] === 3) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0009
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
      let iter = lightWeightSet[Symbol.iterator]();
      let result: boolean = false;
      let temp: IteratorResult<Int8Array> = iter.next();
      while (!temp.done) {
        let value = temp.value;
        if (value[0] === -128 && value[2] === 127) {
          result = true;
        }
        temp = iter.next();
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0010
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
      let iter = lightWeightSet[Symbol.iterator]();
      let result: boolean = false;
      let temp: IteratorResult<Uint16Array> = iter.next();
      while (!temp.done) {
        let value = temp.value;
        if (value[0] === 0 && value[2] === 65535) {
          result = true;
        }
        temp = iter.next();
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0011
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
      let iter = lightWeightSet[Symbol.iterator]();
      let result: boolean = false;
      let temp: IteratorResult<Float32Array> = iter.next();
      while (!temp.done) {
        let value = temp.value;
        if (value[0] === -Infinity && value[1] === Infinity) {
          result = true;
        }
        temp = iter.next();
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0012
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
      let iter = lightWeightSet[Symbol.iterator]();
      let result: boolean = false;
      let temp: IteratorResult<Float64Array> = iter.next();
      while (!temp.done) {
        let value = temp.value;
        if (value[0] === Infinity && Number.isNaN(value[1])) {
          result = true;
        }
        temp = iter.next();
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0013
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
      let iter = lightWeightSet[Symbol.iterator]();
      let result: boolean = false;
      let temp: IteratorResult<Uint8ClampedArray> = iter.next();
      while (!temp.done) {
        let value = temp.value;
        if (value[0] === 255 && value[1] === 0) {
          result = true;
        }
        temp = iter.next();
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0014
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
      let iter = lightWeightSet[Symbol.iterator]();
      let result: boolean = false;
      let temp: IteratorResult<BigInt64Array> = iter.next();
      while (!temp.done) {
        let value = temp.value;
        if (value[0] === 255n && value[1] === 0n) {
          result = true;
        }
        temp = iter.next();
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0015
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: string[] = [];
      let temp: IteratorResult<string> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[0] === "Bob" && valuesArray[1] === "Alice") {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0016
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: (string | null | undefined)[] = [];
      let temp: IteratorResult<string | null | undefined> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[0] === null && valuesArray[1] === undefined) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0017
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: string[] = [];
      let temp: IteratorResult<string> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[1] === "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" && valuesArray[0] === "\n\t") {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0018
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
      const value2 = "🀄";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: string[] = [];
      let temp: IteratorResult<string> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[1] === "🎅" && valuesArray[0] === "🀄") {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0019
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: number[] = [];
      let temp: IteratorResult<number> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[1] === Math.floor(1.5) && valuesArray[0] === Number.MIN_VALUE) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0020
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
      lightWeightSet.add(0x0102);
      lightWeightSet.add(2**3);
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: number[] = [];
      let temp: IteratorResult<number> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[0] === 0x0102 && valuesArray[1] === 2**3) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0021
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: boolean[] = [];
      let temp: IteratorResult<boolean> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[1] === true && valuesArray[0] === false) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0022
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: (boolean | null | undefined)[] = [];
      let temp: IteratorResult<boolean | null | undefined> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[1] === undefined && valuesArray[0] === null) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0023
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: boolean[] = [];
      let temp: IteratorResult<boolean> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[0] === !'s' && valuesArray[1] === !0) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0024
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
      let arr = [72,100,90,877];
      lightWeightSet.add(arr);
      let iter = lightWeightSet[Symbol.iterator]();
      let result: boolean = false;
      let temp: IteratorResult<Array<number>> = iter.next();
      while (!temp.done) {
        let value = temp.value;
        if (value[0] === 72 && value[2] === 90) {
          result = true;
        }
        temp = iter.next();
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0025
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
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);
      let iter = lightWeightSet[Symbol.iterator]();
      let result: boolean = false;
      let temp: IteratorResult<Array<number>> = iter.next();
      while (!temp.done) {
        let value = temp.value;
        if (value[1] === undefined && value[0] === undefined) {
          result = true;
        }
        temp = iter.next();
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0026
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: object[] = [];
      let temp: IteratorResult<object> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0027
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: object[] = [];
      let temp: IteratorResult<object> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0028
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: object[] = [];
      let temp: IteratorResult<object> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0029
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
      let iter = lightWeightSet[Symbol.iterator]();
      let valuesArray: testLightWeightSet[] = [];
      let temp: IteratorResult<testLightWeightSet> = iter.next();
      while (!temp.done) {
        valuesArray.push(temp.value);
        temp = iter.next();
      }
      let result: boolean = false;
      if (valuesArray[1] === classA && valuesArray[0] === classB || valuesArray[0] === classA && valuesArray[1] === classB) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0030
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
      let obj = [1, 2, 3];
      let result = lightWeightSet.equal(obj);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0031
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
      let result = lightWeightSet.equal([obj]);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0032
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0033
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0034
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0035
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0036
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0037
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0038
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0039
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0040
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
      const value2 = "🀄";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let obj = [value1, value2];
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0041
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0042
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
      lightWeightSet.add(0x0102);
      lightWeightSet.add(2**3);
      let obj = [0x0102, 2**3];
      let result = lightWeightSet.equal(obj);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0043
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0044
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0045
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
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0046
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
      let arr = [72,100,90,877];
      lightWeightSet.add(arr);
      let obj = [[72,100,90,877]];
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0047
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
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);
      let obj = [[]];
      obj[0]["abc"] = 111;
      obj[0]["aaa"] = 222;
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0048
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
      let obj = [obj1, obj2];
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0049
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
      let obj = [obj1, obj2];
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0050
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
      let obj = [obj1, obj2];
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0051
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
      let obj = [classA, classB];
      let result = lightWeightSet.equal(obj);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0052
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0053
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0054
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0055
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0056
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0057
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0058
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0059
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
        const numbers = result.split(',').map(Number);
        const str = String.fromCharCode(...numbers);
        expect(str).assertEqual("HelloWorld123?");
      } else {
        expect(result).assertEqual("HelloWorld123?");
      }
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0060
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0061
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
      let value_1 = new Object({ name: 'Alice', age: 25 });
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toString();
      expect(typeof result).assertEqual("string");
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0062
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0063
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0064
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0065
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0066
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0067
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0068
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0069
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0070
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST05_0071
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
      let value_1 = new Object({ name: 'Alice', age: 25 });
      lightWeightSet.add(value_1);
      let result = lightWeightSet.toArray();
      expect(result.length).assertEqual(1);
      console.log(TAG + 'end');
    });
  })
}