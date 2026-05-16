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

function sleep(ms: number) {
  return new Promise<void>((resolve, reject) => setTimeout(resolve, ms));
}

export default function  testLightWeightSetTest03() {
  describe('testLightWeightSetTest03', () => {
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0001
     * @tc.name      testLightWeightSetTest03Chapter0001
     * @tc.desc      Verify LightWeightSet's remove method with special array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0001';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add([]);
      lightWeightSet.add({});
      let remove_data = lightWeightSet.remove([]);
      let result:boolean = remove_data === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0002
     * @tc.name      testLightWeightSetTest03Chapter0002
     * @tc.desc      Verify LightWeightSet's remove method with array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0002';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      lightWeightSet.add([72, "abc", true, null, undefined, 108]);
      lightWeightSet.add([]);
      let remove_data = lightWeightSet.remove([]);
      let result:boolean = remove_data === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0003
     * @tc.name      testLightWeightSetTest03Chapter0003
     * @tc.desc      Verify LightWeightSet's remove method with normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0003';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: 1, b: "test", c: [1, 2, 3] });
      lightWeightSet.add({ a: 10, b: "key", c: [20, 4] });
      let remove_data = lightWeightSet.remove({ a: 1, b: "test", c: [1, 2, 3] });
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0004
     * @tc.name      testLightWeightSetTest03Chapter0004
     * @tc.desc      Verify LightWeightSet's remove method with object with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0004';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ "key": "value", a: 1 });
      lightWeightSet.add({ b: 2 });
      let remove_data = lightWeightSet.remove({ b: 2 });
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0005
     * @tc.name      testLightWeightSetTest03Chapter0005
     * @tc.desc      Verify LightWeightSet's remove method with object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0005';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: 1, b: () => { } });
      lightWeightSet.add({ c: 3 });
      let remove_data = lightWeightSet.remove({ c: 3 });
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0006
     * @tc.name      testLightWeightSetTest03Chapter0006
     * @tc.desc      Verify LightWeightSet's remove method with object with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0006';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new ArrayBuffer(16) });
      lightWeightSet.add({ view: new DataView(new ArrayBuffer(16)) });
      let remove_data = lightWeightSet.remove({ view: new DataView(new ArrayBuffer(16)) });
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0007
     * @tc.name      testLightWeightSetTest03Chapter0007
     * @tc.desc      Verify LightWeightSet's remove method with object with TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0007';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new Uint8Array([72, 101, 108, 108, 111]) });
      lightWeightSet.add({});
      let remove_data = lightWeightSet.remove({});
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0008
     * @tc.name      testLightWeightSetTest03Chapter0008
     * @tc.desc      Verify LightWeightSet's remove method with object with Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0008';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ map: new Map<number, number>() });
      lightWeightSet.add({ set: new Set([1, 2, 3, 2, 1]) });
      let remove_data = lightWeightSet.remove({ set: new Set([1, 2, 3, 2, 1]) });
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0009
     * @tc.name      testLightWeightSetTest03Chapter0009
     * @tc.desc      Verify LightWeightSet's remove method with object with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0009';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: undefined, b: 1 });
      lightWeightSet.add({ a: null, b: 1 });
      let remove_data = lightWeightSet.remove({ a: null, b: 1 });
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0010
     * @tc.name      testLightWeightSetTest03Chapter0010
     * @tc.desc      Verify LightWeightSet's remove method with object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0010';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: NaN, b: 1 });
      lightWeightSet.add({ a: Infinity, b: 1 });
      let remove_data = lightWeightSet.remove({ a: Infinity, b: 1 });
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0011
     * @tc.name      testLightWeightSetTest03Chapter0011
     * @tc.desc      Verify LightWeightSet's remove method with class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0011';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      lightWeightSet.add(new testLightWeightSet("wang", 25, new Int8Array([20, 10])));
      lightWeightSet.add(new testLightWeightSet("xie", 19, new Int8Array([80, 90])));
      let remove_data = lightWeightSet.remove(new testLightWeightSet("wang", 25, new Int8Array([20, 10])));
      let result:boolean = remove_data !== undefined;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0012
     * @tc.name      testLightWeightSetTest03Chapter0012
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0012';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0013
     * @tc.name      testLightWeightSetTest03Chapter0013
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0013';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(12);
      lightWeightSet.add(88);
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0014
     * @tc.name      testLightWeightSetTest03Chapter0014
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0014';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      lightWeightSet.add(new Int8Array([20,10]));
      lightWeightSet.add(new Int8Array([30,80]));
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0015
     * @tc.name      testLightWeightSetTest03Chapter0015
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0015';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: NaN, b: 1 });
      lightWeightSet.add({ a: Infinity, b: 1 });
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0016
     * @tc.name      testLightWeightSetTest03Chapter0016
     * @tc.desc      Verify LightWeightSet's clear method
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0016';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      lightWeightSet.add(new testLightWeightSet("wang", 25, new Int8Array([20, 10])));
      lightWeightSet.add(new testLightWeightSet("xie", 19, new Int8Array([80, 90])));
      lightWeightSet.clear();
      let result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0017
     * @tc.name      testLightWeightSetTest03Chapter0017
     * @tc.desc      Verify LightWeightSet's remove method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0017';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(-1);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0018
     * @tc.name      testLightWeightSetTest03Chapter0018
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0018';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0019
     * @tc.name      testLightWeightSetTest03Chapter0019
     * @tc.desc      Verify LightWeightSet's removeAt method with index 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0019';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0020
     * @tc.name      testLightWeightSetTest03Chapter0020
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0020';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0021
     * @tc.name      testLightWeightSetTest03Chapter0021
     * @tc.desc      Verify LightWeightSet's removeAt method with undefined index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0021';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(undefined);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0022
     * @tc.name      testLightWeightSetTest03Chapter0022
     * @tc.desc      Verify LightWeightSet's removeAt method with NaN index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0022';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(NaN);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0023
     * @tc.name      testLightWeightSetTest03Chapter0023
     * @tc.desc      Verify LightWeightSet's removeAt method with -0 index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0023';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(-0);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0024
     * @tc.name      testLightWeightSetTest03Chapter0024
     * @tc.desc      Verify LightWeightSet's removeAt method with Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0024';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(Infinity);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0025
     * @tc.name      testLightWeightSetTest03Chapter0025
     * @tc.desc      Verify LightWeightSet's removeAt method with -Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0025';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(-Infinity);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0026
     * @tc.name      testLightWeightSetTest03Chapter0026
     * @tc.desc      Verify LightWeightSet's removeAt method with Number.MAX_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0026';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(Number.MAX_VALUE);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0027
     * @tc.name      testLightWeightSetTest03Chapter0027
     * @tc.desc      Verify LightWeightSet's removeAt method with Number.MIN_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0027';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(Number.MIN_VALUE);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0028
     * @tc.name      testLightWeightSetTest03Chapter0028
     * @tc.desc      Verify LightWeightSet's removeAt method with Number.EPSILON index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0028';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(Number.EPSILON);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0029
     * @tc.name      testLightWeightSetTest03Chapter0029
     * @tc.desc      Verify LightWeightSet's removeAt method with Math.floor(1.5) index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0029';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(Math.floor(1.5));
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0030
     * @tc.name      testLightWeightSetTest03Chapter0030
     * @tc.desc      Verify LightWeightSet's removeAt method with index 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0030';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(127);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0031
     * @tc.name      testLightWeightSetTest03Chapter0031
     * @tc.desc      Verify LightWeightSet's removeAt method with index 128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0031';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(128);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0032
     * @tc.name      testLightWeightSetTest03Chapter0032
     * @tc.desc      Verify LightWeightSet's removeAt method with index -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0032';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(-128);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0033
     * @tc.name      testLightWeightSetTest03Chapter0033
     * @tc.desc      Verify LightWeightSet's removeAt method with index -129
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0033';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(-129);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0034
     * @tc.name      testLightWeightSetTest03Chapter0034
     * @tc.desc      Verify LightWeightSet's removeAt method with index -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0034';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(-32768);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0035
     * @tc.name      testLightWeightSetTest03Chapter0035
     * @tc.desc      Verify LightWeightSet's removeAt method with index -32769
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0035';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(-32769);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0036
     * @tc.name      testLightWeightSetTest03Chapter0036
     * @tc.desc      Verify LightWeightSet's removeAt method with index 32767
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0036';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(32767);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0037
     * @tc.name      testLightWeightSetTest03Chapter0037
     * @tc.desc      Verify LightWeightSet's removeAt method with index 32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0037';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(32768);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0038
     * @tc.name      testLightWeightSetTest03Chapter0038
     * @tc.desc      Verify LightWeightSet's removeAt method with index -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0038';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(-2147483648);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0039
     * @tc.name      testLightWeightSetTest03Chapter0039
     * @tc.desc      Verify LightWeightSet's removeAt method with index -2147483649
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0039';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(-2147483649);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0040
     * @tc.name      testLightWeightSetTest03Chapter0040
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2147483647
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0040';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2147483647);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0041
     * @tc.name      testLightWeightSetTest03Chapter0041
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0041';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(2147483648);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0042
     * @tc.name      testLightWeightSetTest03Chapter0042
     * @tc.desc      Verify LightWeightSet's removeAt method with index -9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0042';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(-9223372036854775808);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0043
     * @tc.name      testLightWeightSetTest03Chapter0043
     * @tc.desc      Verify LightWeightSet's removeAt method with index 9223372036854775807
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0043';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(9223372036854775807);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0044
     * @tc.name      testLightWeightSetTest03Chapter0044
     * @tc.desc      Verify LightWeightSet's removeAt method with index 1.5
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0044';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(1.5);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0045
     * @tc.name      testLightWeightSetTest03Chapter0045
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2.999
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0045';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(2.99);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0046
     * @tc.name      testLightWeightSetTest03Chapter0046
     * @tc.desc      Verify LightWeightSet's removeAt method with index 123.456
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0046';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(123.456);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0047
     * @tc.name      testLightWeightSetTest03Chapter0047
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0xcafebabe
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0047';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(0xcafebabe);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0048
     * @tc.name      testLightWeightSetTest03Chapter0048
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0x0102
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0048';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0x0102);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0049
     * @tc.name      testLightWeightSetTest03Chapter0049
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0x01020304
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0049';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0x01020304);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0050
     * @tc.name      testLightWeightSetTest03Chapter0050
     * @tc.desc      Verify LightWeightSet's removeAt method with index 0x3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0050';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(0x3);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0051
     * @tc.name      testLightWeightSetTest03Chapter0051
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2 ** 3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0051';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(2 ** 3);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0052
     * @tc.name      testLightWeightSetTest03Chapter0052
     * @tc.desc      Verify LightWeightSet's removeAt method with index 1e3
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0052';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(1e3);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0053
     * @tc.name      testLightWeightSetTest03Chapter0053
     * @tc.desc      Verify LightWeightSet's removeAt method with index 2.5e-2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0053';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(2.5e-2);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0054
     * @tc.name      testLightWeightSetTest03Chapter0054
     * @tc.desc      Verify LightWeightSet's removeAt method with index BigInt(0xdecafafecacefade)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0054';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(Number(BigInt(0xdecafafecacefade)));
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0055
     * @tc.name      testLightWeightSetTest03Chapter0055
     * @tc.desc      Verify LightWeightSet's removeAt method with index BigInt(9007199254740991)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0055';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(Number(BigInt(9007199254740991n)));
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0056
     * @tc.name      testLightWeightSetTest03Chapter0056
     * @tc.desc      Verify LightWeightSet's removeAt method with index 65535
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0056';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result = lightWeightSet.removeAt(65535);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0057
     * @tc.name      testLightWeightSetTest03Chapter0057
     * @tc.desc      Verify LightWeightSet's removeAt method with index Number.MAX_SAFE_INTEGER
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0057';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.removeAt(Number.MAX_SAFE_INTEGER);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0058
     * @tc.name      testLightWeightSetTest03Chapter0058
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0058';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let get_value = lightWeightSet.getValueAt(-1);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0059
     * @tc.name      testLightWeightSetTest03Chapter0059
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0059';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(2);
      let result: boolean = get_value === "squirrel";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0060
     * @tc.name      testLightWeightSetTest03Chapter0060
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 1
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0060';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(1);
      let result: boolean = get_value === "sparrow";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0061
     * @tc.name      testLightWeightSetTest03Chapter0061
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0061';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(0);
      console.log(get_value);
      let result: boolean = get_value === "gull";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0062
     * @tc.name      testLightWeightSetTest03Chapter0062
     * @tc.desc      Verify LightWeightSet's getValueAt method with undefined index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0062';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(undefined);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0063
     * @tc.name      testLightWeightSetTest03Chapter0063
     * @tc.desc      Verify LightWeightSet's getValueAt method with NaN index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0063';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(NaN);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0064
     * @tc.name      testLightWeightSetTest03Chapter0064
     * @tc.desc      Verify LightWeightSet's getValueAt method with -0 index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0064';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-0);
      let result: boolean = get_value === "squirrel";
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0065
     * @tc.name      testLightWeightSetTest03Chapter0065
     * @tc.desc      Verify LightWeightSet's getValueAt method with Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0065';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(Infinity);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0066
     * @tc.name      testLightWeightSetTest03Chapter0066
     * @tc.desc      Verify LightWeightSet's getValueAt method with -Infinity index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0066';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(-Infinity);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0067
     * @tc.name      testLightWeightSetTest03Chapter0067
     * @tc.desc      Verify LightWeightSet's getValueAt method with Number.MAX_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0067';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(Number.MAX_VALUE);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0068
     * @tc.name      testLightWeightSetTest03Chapter0068
     * @tc.desc      Verify LightWeightSet's getValueAt method with Number.MIN_VALUE index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0068';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(Number.MIN_VALUE);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0069
     * @tc.name      testLightWeightSetTest03Chapter0069
     * @tc.desc      Verify LightWeightSet's getValueAt method with Number.EPSILON index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0069';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(Number.EPSILON);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0070
     * @tc.name      testLightWeightSetTest03Chapter0070
     * @tc.desc      Verify LightWeightSet's getValueAt method with Math.floor(1.5) index
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0070';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(Math.floor(1.5));
      let result: boolean = get_value === "sparrow";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0071
     * @tc.name      testLightWeightSetTest03Chapter0071
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 127
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0071';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(127);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0072
     * @tc.name      testLightWeightSetTest03Chapter0072
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0072';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(128);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0073
     * @tc.name      testLightWeightSetTest03Chapter0073
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -128
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0073';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-128);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0074
     * @tc.name      testLightWeightSetTest03Chapter0074
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -129
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0074';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-129);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0075
     * @tc.name      testLightWeightSetTest03Chapter0075
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0075';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-32768);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0076
     * @tc.name      testLightWeightSetTest03Chapter0076
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -32769
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0076';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-32769);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0077
     * @tc.name      testLightWeightSetTest03Chapter0077
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 32767
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0077';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(32767);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0078
     * @tc.name      testLightWeightSetTest03Chapter0078
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 32768
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0078';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(32768);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0079
     * @tc.name      testLightWeightSetTest03Chapter0079
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0079';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(-2147483648);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0080
     * @tc.name      testLightWeightSetTest03Chapter0080
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -2147483649
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0080';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(-2147483649);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0081
     * @tc.name      testLightWeightSetTest03Chapter0081
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2147483647
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0081';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let get_value = lightWeightSet.getValueAt(2147483647);
      let result: boolean = get_value === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0082
     * @tc.name      testLightWeightSetTest03Chapter0082
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 2147483648
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0082';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(2147483648);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0083
     * @tc.name      testLightWeightSetTest03Chapter0083
     * @tc.desc      Verify LightWeightSet's getValueAt method with index -9223372036854775808
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0083';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(-9223372036854775808);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST03_0084
     * @tc.name      testLightWeightSetTest03Chapter0084
     * @tc.desc      Verify LightWeightSet's getValueAt method with index 9223372036854775807
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest03Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest03Chapter0084';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");
      let result: boolean = false;
      try {
        lightWeightSet.getValueAt(9223372036854775807);
      } catch(e) {
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

  })
}