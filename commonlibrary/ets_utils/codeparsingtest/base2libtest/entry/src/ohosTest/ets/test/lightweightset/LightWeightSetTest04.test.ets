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

export default function LightWeightSetTest04() {
  describe('LightWeightSetTest04', () => {
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0001
     * @tc.name      testLightWeightSetTest04Chapter0001
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 1.5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0001';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(1.5);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0002
     * @tc.name      testLightWeightSetTest04Chapter0002
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2.999
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0002';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(2.99);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0003
     * @tc.name      testLightWeightSetTest04Chapter0003
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 123.456
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0003';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(123.456);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0004
     * @tc.name      testLightWeightSetTest04Chapter0004
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 0xcafebabe
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0004';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(0xcafebabe);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0005
     * @tc.name      testLightWeightSetTest04Chapter0005
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 0x0102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0005';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(0x0102);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0006
     * @tc.name      testLightWeightSetTest04Chapter0006
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 0x01020304
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0006';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(0x01020304);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0007
     * @tc.name      testLightWeightSetTest04Chapter0007
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 0x3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0007';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(0x3);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0008
     * @tc.name      testLightWeightSetTest04Chapter0008
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2 ** 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0008';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(2 ** 3);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0009
     * @tc.name      testLightWeightSetTest04Chapter0009
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 1e3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0009';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(1e3);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0010
     * @tc.name      testLightWeightSetTest04Chapter0010
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2.5e-2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0010';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(2.5e-2);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0011
     * @tc.name      testLightWeightSetTest04Chapter0011
     * @tc.desc      Verify LightWeightSet's getValueAt method with index BigInt(0xdecafafecacefade)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0011';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(Number(BigInt(0xdecafafecacefade)));
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0012
     * @tc.name      testLightWeightSetTest04Chapter0012
     * @tc.desc      Verify LightWeightSet's getValueAt method with index BigInt(9007199254740991)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0012';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(Number(BigInt(9007199254740991n)));
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0013
     * @tc.name      testLightWeightSetTest04Chapter0013
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0013';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(65535);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0014
     * @tc.name      testLightWeightSetTest04Chapter0014
     * @tc.desc      Verify LightWeightSet's getValueAt method with index Number.MAX_SAFE_INTEGER throws error
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0014';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(Number.MAX_SAFE_INTEGER);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0015
     * @tc.name      testLightWeightSetTest04Chapter0015
     * @tc.desc      Verify LightWeightSet's values method returns correct values for number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0015';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[0] === 1 && valuesArray[2] === 3)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0016
     * @tc.name      testLightWeightSetTest04Chapter0016
     * @tc.desc      Verify LightWeightSet's values method returns correct values for Int8Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0016';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      let arr = new Int8Array([-128,0,127]);
      lightWeightSet.add(arr);
      let values = lightWeightSet.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[0] === -128 && value[2] === 127) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0017
     * @tc.name      testLightWeightSetTest04Chapter0017
     * @tc.desc      Verify LightWeightSet's values method returns correct values for Uint16Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0017';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint16Array>();
      let arr = new Uint16Array([0,100,65535]);
      lightWeightSet.add(arr);
      let values = lightWeightSet.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[0] === 0 && value[2] === 65535) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0018
     * @tc.name      testLightWeightSetTest04Chapter0018
     * @tc.desc      Verify LightWeightSet's values method returns correct values for Float32Array type with extreme values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0018';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float32Array>();
      let arr = new Float32Array([-3.5e38,3.5e38]);
      lightWeightSet.add(arr);
      let values = lightWeightSet.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[0] === -Infinity && value[1] === Infinity) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0019
     * @tc.name      testLightWeightSetTest04Chapter0019
     * @tc.desc      Verify LightWeightSet's values method returns correct values for Float64Array type with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0019';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float64Array>();
      let arr = new Float64Array([Infinity,NaN]);
      lightWeightSet.add(arr);
      let values = lightWeightSet.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[0] === Infinity && Number.isNaN(value[1])) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0020
     * @tc.name      testLightWeightSetTest04Chapter0020
     * @tc.desc      Verify LightWeightSet's values method returns correct values for Uint8ClampedArray type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0020';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8ClampedArray>();
      let arr = new Uint8ClampedArray([255,0]);
      lightWeightSet.add(arr);
      let values = lightWeightSet.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[0] === 255 && value[1] === 0) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0021
     * @tc.name      testLightWeightSetTest04Chapter0021
     * @tc.desc      Verify LightWeightSet's values method returns correct values for BigInt64Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0021';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<BigInt64Array>();
      let arr = new BigInt64Array([255n,0n]);
      lightWeightSet.add(arr);
      let values = lightWeightSet.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[0] === 255n && value[1] === 0n) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0022
     * @tc.name      testLightWeightSetTest04Chapter0022
     * @tc.desc      Verify LightWeightSet's values method returns correct values for string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0022';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("Bob");
      lightWeightSet.add("Alice");
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[0] === "Bob" && valuesArray[1] === "Alice")
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0023
     * @tc.name      testLightWeightSetTest04Chapter0023
     * @tc.desc      Verify LightWeightSet's values method returns correct values for null and undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0023';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[0] === null && valuesArray[1] === undefined)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0024
     * @tc.name      testLightWeightSetTest04Chapter0024
     * @tc.desc      Verify LightWeightSet's values method returns correct values for special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0024';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const value1 = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const value2 = "\n\t";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[1] === "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" && valuesArray[0] === "\n\t")
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0025
     * @tc.name      testLightWeightSetTest04Chapter0025
     * @tc.desc      Verify LightWeightSet's values method returns correct values for emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0025';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const value1 = "🎅";
      const value2 = "🀄";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[1] === "🎅" && valuesArray[0] === "🀄")
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0026
     * @tc.name      testLightWeightSetTest04Chapter0026
     * @tc.desc      Verify LightWeightSet's values method returns correct values for number type with Math.floor and MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0026';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Math.floor(1.5));
      lightWeightSet.add(Number.MIN_VALUE);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[1] === Math.floor(1.5) && valuesArray[0] === Number.MIN_VALUE)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0027
     * @tc.name      testLightWeightSetTest04Chapter0027
     * @tc.desc      Verify LightWeightSet's values method returns correct values for number type with hexadecimal and exponent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0027';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0x0102);
      lightWeightSet.add(2**3);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[0] === 0x0102 && valuesArray[1] === 2**3)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0028
     * @tc.name      testLightWeightSetTest04Chapter0028
     * @tc.desc      Verify LightWeightSet's values method returns correct values for boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0028';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[1] === true && valuesArray[0] === false)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0029
     * @tc.name      testLightWeightSetTest04Chapter0029
     * @tc.desc      Verify LightWeightSet's values method returns correct values for null and undefined in boolean set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0029';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[1] === undefined && valuesArray[0] === null)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0030
     * @tc.name      testLightWeightSetTest04Chapter0030
     * @tc.desc      Verify LightWeightSet's values method returns correct values for boolean type with logical NOT operations
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0030';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(!'s');
      lightWeightSet.add(!0);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[0] === !'s' && valuesArray[1] === !0)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0031
     * @tc.name      testLightWeightSetTest04Chapter0031
     * @tc.desc      Verify LightWeightSet's values method returns correct values for Array<number> type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0031';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      let arr = [72,100,90,877];
      lightWeightSet.add(arr);
      let values = lightWeightSet.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[0] === 72 && value[2] === 90) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0032
     * @tc.name      testLightWeightSetTest04Chapter0032
     * @tc.desc      Verify LightWeightSet's values method returns correct values for array with string properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0032';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);
      let values = lightWeightSet.values();
      let result: boolean = false;
      for (let value of values) {
        if (value[1] === undefined && value[0] === undefined) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0033
     * @tc.name      testLightWeightSetTest04Chapter0033
     * @tc.desc      Verify LightWeightSet's values method returns correct values for object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0033';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:SimpleObj = {a:7,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0034
     * @tc.name      testLightWeightSetTest04Chapter0034
     * @tc.desc      Verify LightWeightSet's values method returns correct values for object type including empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0034';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:nullObj = {};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0035
     * @tc.name      testLightWeightSetTest04Chapter0035
     * @tc.desc      Verify LightWeightSet's values method returns correct values for object type with Infinity and NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0035';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:Infinity,b:"test"};
      const obj2:SimpleObj = {a:NaN,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[0] === obj1 && valuesArray[1] === obj2 || valuesArray[1] === obj1 && valuesArray[0] === obj2)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0036
     * @tc.name      testLightWeightSetTest04Chapter0036
     * @tc.desc      Verify LightWeightSet's values method returns correct values for custom class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0036';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const classA = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const classB = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(classA);
      lightWeightSet.add(classB);
      let valuesArray = Array.from(lightWeightSet.values());
      let result: boolean = false;
      if(valuesArray[1] === classA && valuesArray[0] === classB || valuesArray[0] === classA && valuesArray[1] === classB)
        result = true;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0037
     * @tc.name      testLightWeightSetTest04Chapter0037
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0037';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:number,key:number)=>{
        if(index === 0 && value === 1 && key === 1)
          result1 = true;
        if(index === 1 && value === 2 && key === 2)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0038
     * @tc.name      testLightWeightSetTest04Chapter0038
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for extreme number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0038';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Number.MAX_VALUE);
      lightWeightSet.add(Number.EPSILON);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:number,key:number)=>{
        if(index === 1 && value === Number.MAX_VALUE && key === Number.MAX_VALUE)
          result1 = true;
        if(index === 0 && value === Number.EPSILON && key === Number.EPSILON)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0039
     * @tc.name      testLightWeightSetTest04Chapter0039
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for hexadecimal and exponential number values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0039';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0x0102);
      lightWeightSet.add(1e3);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:number,key:number)=>{
        if(index === 0 && value === 0x0102 && key === 0x0102)
          result1 = true;
        if(index === 1 && value === 1e3 && key === 1e3)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0040
     * @tc.name      testLightWeightSetTest04Chapter0040
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for Int8Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0040';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([-128,127]);
      lightWeightSet.add(arr1);
      let result:boolean = false;
      lightWeightSet.forEach((value:Int8Array,key:Int8Array)=>{
        if(value[0] === -128 && value[1] === 127)
          result = true;
      })
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0041
     * @tc.name      testLightWeightSetTest04Chapter0041
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for Uint16Array type with overflow values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0041';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint16Array>();
      const arr1 = new Uint16Array([-1,65536]);
      lightWeightSet.add(arr1);
      let result:boolean = false;
      lightWeightSet.forEach((value:Uint16Array,key:Uint16Array)=>{
        if(value[0] === 65535 && value[1] === 0)
          result = true;
      })
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0042
     * @tc.name      testLightWeightSetTest04Chapter0042
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for Float64Array type with large values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0042';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float64Array>();
      const arr1 = new Float64Array([-1.8E308,1.8E308]);
      lightWeightSet.add(arr1);
      let result:boolean = false;
      lightWeightSet.forEach((value:Float64Array,key:Float64Array)=>{
        if(value[0] === -1.8E308 && value[1] === 1.8E308)
          result = true;
      })
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0043
     * @tc.name      testLightWeightSetTest04Chapter0043
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for Float64Array type with Infinity and NaN values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0043';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float64Array>();
      const arr1 = new Float64Array([Infinity,NaN]);
      lightWeightSet.add(arr1);
      let result:boolean = false;
      lightWeightSet.forEach((value:Float64Array,key:Float64Array)=>{
        if(value[0] === Infinity && Number.isNaN(value[1]))
          result = true;
      })
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0044
     * @tc.name      testLightWeightSetTest04Chapter0044
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for Int8Array type with zero values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0044';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([0,0]);
      lightWeightSet.add(arr1);
      let result:boolean = false;
      lightWeightSet.forEach((value:Int8Array,key:Int8Array)=>{
        if(value[0] === 0 && value[1] === 0)
          result = true;
      })
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0045
     * @tc.name      testLightWeightSetTest04Chapter0045
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0045';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const data1 = "aaa";
      const data2 = "abc";
      lightWeightSet.add(data1);
      lightWeightSet.add(data2);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:string,key:string)=>{
        if(index === 0 && value === data1 && key === data1)
          result1 = true;
        if(index === 1 && value === data2 && key === data2)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0046
     * @tc.name      testLightWeightSetTest04Chapter0046
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for string type with special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0046';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const data1 = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const data2 = "\n\t";
      lightWeightSet.add(data1);
      lightWeightSet.add(data2);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:string,key:string)=>{
        if(index === 1 && value === data1 && key === data1)
          result1 = true;
        if(index === 0 && value === data2 && key === data2)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0047
     * @tc.name      testLightWeightSetTest04Chapter0047
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for string type with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0047';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const data1 = "💇";
      const data2 = "🏴";
      lightWeightSet.add(data1);
      lightWeightSet.add(data2);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:string,key:string)=>{
        if(index === 0 && value === data1 && key === data1)
          result1 = true;
        if(index === 1 && value === data2 && key === data2)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0048
     * @tc.name      testLightWeightSetTest04Chapter0048
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0048';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      const data1:boolean = true;
      const data2:boolean = false;
      lightWeightSet.add(data1);
      lightWeightSet.add(data2);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:boolean,key:boolean)=>{
        if(index === 1 && value === data1 && key === data1)
          result1 = true;
        if(index === 0 && value === data2 && key === data2)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0049
     * @tc.name      testLightWeightSetTest04Chapter0049
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for undefined and null values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0049';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:boolean,key:boolean)=>{
        if(index === 1 && value === undefined && key === undefined)
          result1 = true;
        if(index === 0 && value === null && key === null)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0050
     * @tc.name      testLightWeightSetTest04Chapter0050
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for boolean expressions
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0050';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(!'s');
      lightWeightSet.add(!0);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:boolean,key:boolean)=>{
        if(index === 0 && value === !'s' && key === !'s')
          result1 = true;
        if(index === 1 && value === !0 && key === !0)
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0051
     * @tc.name      testLightWeightSetTest04Chapter0051
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for Array<number> type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0051';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72,100];
      lightWeightSet.add(arr1);
      let result:boolean = false;
      lightWeightSet.forEach((value:Array<number>,key:Array<number>)=>{
        if(value[0] === 72 && value[1] === 100)
          result = true;
      })
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0052
     * @tc.name      testLightWeightSetTest04Chapter0052
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for Array<number> type with associative array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0052';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);
      let result:boolean = false;
      lightWeightSet.forEach((value:Array<number>,key:Array<number>)=>{
        if(value[0] === undefined && value[1] === undefined)
          result = true;
      })
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0053
     * @tc.name      testLightWeightSetTest04Chapter0053
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0053';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:SimpleObj = {a:7,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:object,key:object)=>{
        if(index === 0 && value.toString() === obj1.toString() && key.toString() === obj1.toString())
          result1 = true;
        if(index === 1 && value.toString() === obj2.toString() && key.toString() === obj2.toString())
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0054
     * @tc.name      testLightWeightSetTest04Chapter0054
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for object type with empty object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0054';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:1,b:"test"};
      const obj2:nullObj = {};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:object,key:object)=>{
        if(index === 0 && value.toString() === obj1.toString() && key.toString() === obj1.toString())
          result1 = true;
        if(index === 1 && value.toString() === obj2.toString() && key.toString() === obj2.toString())
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0055
     * @tc.name      testLightWeightSetTest04Chapter0055
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for object type with Infinity and NaN properties
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0055';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:SimpleObj = {a:Infinity,b:"test"};
      const obj2:SimpleObj = {a:NaN,b:"key"};
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:object,key:object)=>{
        if(index === 0 && value.toString() === obj1.toString() && key.toString() === obj1.toString())
          result1 = true;
        if(index === 1 && value.toString() === obj2.toString() && key.toString() === obj2.toString())
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0056
     * @tc.name      testLightWeightSetTest04Chapter0056
     * @tc.desc      Verify LightWeightSet's forEach method iterates correctly for custom class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0056';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const classA = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const classB = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(classA);
      lightWeightSet.add(classB);
      let index = 0;
      let result1:boolean = false;
      let result2:boolean = false;
      lightWeightSet.forEach((value:object,key:object)=>{
        if(index === 0 && value.toString() === classA.toString() && key.toString() === classA.toString())
          result1 = true;
        if(index === 1 && value.toString() === classA.toString() && key.toString() === classA.toString())
          result2 = true;
        index++;
      })
      let result = result1 && result2 && index === 2;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0057
     * @tc.name      testLightWeightSetTest04Chapter0057
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0057';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(1);
      lightWeightSet.add(2);
      lightWeightSet.add(3);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if (entriesArray[0][0] === 1 && entriesArray[0][1] === 1 && entriesArray[2][0] === 3 && entriesArray[2][1] === 3) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0058
     * @tc.name      testLightWeightSetTest04Chapter0058
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for Int8Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0058';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      let arr = new Int8Array([-128,0,127]);
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (value[0] === -128 && value[2] === 127 && key[0] === -128 && key[2] === 127) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0059
     * @tc.name      testLightWeightSetTest04Chapter0059
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for Uint16Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0059';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint16Array>();
      let arr = new Uint16Array([0,100,65535]);
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (value[0] === 0 && value[2] === 65535 && key[0] === 0 && key[2] === 65535) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0060
     * @tc.name      testLightWeightSetTest04Chapter0060
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for Float32Array type with extreme values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0060';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float32Array>();
      let arr = new Float32Array([-3.5e38,3.5e38]);
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (value[0] === -Infinity && value[1] === Infinity && key[0] === -Infinity && key[1] === Infinity) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0061
     * @tc.name      testLightWeightSetTest04Chapter0061
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for Float64Array type with special values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0061';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Float64Array>();
      let arr = new Float64Array([Infinity,NaN]);
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (value[0] === Infinity && Number.isNaN(value[1]) && key[0] === Infinity && Number.isNaN(key[1])) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0062
     * @tc.name      testLightWeightSetTest04Chapter0062
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for Uint8ClampedArray type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0062';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8ClampedArray>();
      let arr = new Uint8ClampedArray([255,0]);
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (value[0] === 255 && value[1] === 0 && key[0] === 255 && key[1] === 0) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0063
     * @tc.name      testLightWeightSetTest04Chapter0063
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for BigInt64Array type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0063';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<BigInt64Array>();
      let arr = new BigInt64Array([255n,0n]);
      lightWeightSet.add(arr);
      let entries = lightWeightSet.entries();
      let result: boolean = false;
      for (let entry of entries) {
        let key = entry[0];
        let value = entry[1];
        if (value[0] === 255n && value[1] === 0n && key[0] === 255n && key[1] === 0n) {
          result = true;
        }
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0064
     * @tc.name      testLightWeightSetTest04Chapter0064
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0064';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("Bob");
      lightWeightSet.add("Alice");
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === "Bob" && entriesArray[0][1] === "Bob" &&
        entriesArray[1][0] === "Alice" && entriesArray[1][1] === "Alice") ||
        (entriesArray[0][0] === "Alice" && entriesArray[0][1] === "Alice" &&
          entriesArray[1][0] === "Bob" && entriesArray[1][1] === "Bob")) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0065
     * @tc.name      testLightWeightSetTest04Chapter0065
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for null and undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0065';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === null && entriesArray[0][1] === null &&
        entriesArray[1][0] === undefined && entriesArray[1][1] === undefined) ||
        (entriesArray[0][0] === undefined && entriesArray[0][1] === undefined &&
          entriesArray[1][0] === null && entriesArray[1][1] === null)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0066
     * @tc.name      testLightWeightSetTest04Chapter0066
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for special characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0066';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const value1 = "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~";
      const value2 = "\n\t";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === value1 && entriesArray[0][1] === value1 &&
        entriesArray[1][0] === value2 && entriesArray[1][1] === value2) ||
        (entriesArray[0][0] === value2 && entriesArray[0][1] === value2 &&
          entriesArray[1][0] === value1 && entriesArray[1][1] === value1)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0067
     * @tc.name      testLightWeightSetTest04Chapter0067
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0067';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const value1 = "🎅";
      const value2 = "🀄";
      lightWeightSet.add(value1);
      lightWeightSet.add(value2);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === value1 && entriesArray[0][1] === value1 &&
        entriesArray[1][0] === value2 && entriesArray[1][1] === value2) ||
        (entriesArray[0][0] === value2 && entriesArray[0][1] === value2 &&
          entriesArray[1][0] === value1 && entriesArray[1][1] === value1)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0068
     * @tc.name      testLightWeightSetTest04Chapter0068
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for number type with Math.floor and MIN_VALUE
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0068';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Math.floor(1.5));
      lightWeightSet.add(Number.MIN_VALUE);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === Math.floor(1.5) && entriesArray[0][1] === Math.floor(1.5) &&
        entriesArray[1][0] === Number.MIN_VALUE && entriesArray[1][1] === Number.MIN_VALUE) ||
        (entriesArray[0][0] === Number.MIN_VALUE && entriesArray[0][1] === Number.MIN_VALUE &&
          entriesArray[1][0] === Math.floor(1.5) && entriesArray[1][1] === Math.floor(1.5))) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0069
     * @tc.name      testLightWeightSetTest04Chapter0069
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for number type with hexadecimal and exponent
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0069';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0x0102);
      lightWeightSet.add(2**3);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === 0x0102 && entriesArray[0][1] === 0x0102 &&
        entriesArray[1][0] === 2**3 && entriesArray[1][1] === 2**3) ||
        (entriesArray[0][0] === 2**3 && entriesArray[0][1] === 2**3 &&
          entriesArray[1][0] === 0x0102 && entriesArray[1][1] === 0x0102)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0070
     * @tc.name      testLightWeightSetTest04Chapter0070
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0070';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === true && entriesArray[0][1] === true &&
        entriesArray[1][0] === false && entriesArray[1][1] === false) ||
        (entriesArray[0][0] === false && entriesArray[0][1] === false &&
          entriesArray[1][0] === true && entriesArray[1][1] === true)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST04_0071
     * @tc.name      testLightWeightSetTest04Chapter0071
     * @tc.desc      Verify LightWeightSet's entries method returns correct key-value pairs for null and undefined in boolean set
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest04Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest04Chapter0071';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(undefined);
      lightWeightSet.add(null);
      let entriesArray = Array.from(lightWeightSet.entries());
      let result: boolean = false;
      if ((entriesArray[0][0] === undefined && entriesArray[0][1] === undefined &&
        entriesArray[1][0] === null && entriesArray[1][1] === null) ||
        (entriesArray[0][0] === null && entriesArray[0][1] === null &&
          entriesArray[1][0] === undefined && entriesArray[1][1] === undefined)) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });
  })
}