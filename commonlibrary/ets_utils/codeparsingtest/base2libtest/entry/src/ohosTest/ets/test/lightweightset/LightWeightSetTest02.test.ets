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

export default function testLightWeightSetTest02() {
  describe('testLightWeightSetTest02', () => {
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
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0001
     * @tc.name      testLightWeightSetTest02Chapter0001
     * @tc.desc      Verify LightWeightSet's has method with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0001';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(NaN);
      lightWeightSet.add(-0);

      let result = lightWeightSet.has(NaN);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0002
     * @tc.name      testLightWeightSetTest02Chapter0002
     * @tc.desc      Verify LightWeightSet's has method with Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0002';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Infinity);
      lightWeightSet.add(-Infinity);

      let result = lightWeightSet.has(Infinity);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0003
     * @tc.name      testLightWeightSetTest02Chapter0003
     * @tc.desc      Verify LightWeightSet's has method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0003';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);

      let result = lightWeightSet.has(false);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0004
     * @tc.name      testLightWeightSetTest02Chapter0004
     * @tc.desc      Verify LightWeightSet's has method with array with normal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0004';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const arr2 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0005
     * @tc.name      testLightWeightSetTest02Chapter0005
     * @tc.desc      Verify LightWeightSet's has method with array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0005';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      lightWeightSet.add(arr1);
      lightWeightSet.add([1, 2, 3]);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0006
     * @tc.name      testLightWeightSetTest02Chapter0006
     * @tc.desc      Verify LightWeightSet's has method with special array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0006';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);
      lightWeightSet.add({});

      let result = lightWeightSet.has(arr);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0007
     * @tc.name      testLightWeightSetTest02Chapter0007
     * @tc.desc      Verify LightWeightSet's has method with array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0007';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      const arr1 = [72, "abc", true, null, undefined, 108];
      lightWeightSet.add(arr1);
      lightWeightSet.add([]);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0008
     * @tc.name      testLightWeightSetTest02Chapter0008
     * @tc.desc      Verify LightWeightSet's has method with normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0008';
      console.log(TAG + 'start');
      interface Obj {
        a: number;
        b: string;
        c: Array<number>;
      }
      let lightWeightSet = new LightWeightSet<object>();
      const obj1: Obj = { a: 1, b: "test", c: [1, 2, 3] };
      const obj2: Obj = { a: 10, b: "key", c: [20, 4] };
      lightWeightSet.add(obj1);
      lightWeightSet.add(obj2);

      let result = lightWeightSet.has(obj1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0009
     * @tc.name      testLightWeightSetTest02Chapter0009
     * @tc.desc      Verify LightWeightSet's has method with object with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0009';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ "key": "value", a: 1 });
      lightWeightSet.add({ b: 2 });

      let result = lightWeightSet.has({ b: 2 });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0010
     * @tc.name      testLightWeightSetTest02Chapter0010
     * @tc.desc      Verify LightWeightSet's has method with object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0010';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: 1, b: () => { } });
      lightWeightSet.add({ c: 3 });

      let result = lightWeightSet.has({ c: 3 });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0011
     * @tc.name      testLightWeightSetTest02Chapter0011
     * @tc.desc      Verify LightWeightSet's has method with object with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0011';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new ArrayBuffer(16) });
      lightWeightSet.add({ view: new DataView(new ArrayBuffer(16)) });

      let result = lightWeightSet.has({ view: new DataView(new ArrayBuffer(16)) });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0012
     * @tc.name      testLightWeightSetTest02Chapter0012
     * @tc.desc      Verify LightWeightSet's has method with object with TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0012';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new Uint8Array([72, 101, 108, 108, 111]) });
      lightWeightSet.add({});

      let result = lightWeightSet.has({});
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0013
     * @tc.name      testLightWeightSetTest02Chapter0013
     * @tc.desc      Verify LightWeightSet's has method with object with Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0013';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ map: new Map<number, number>() });
      lightWeightSet.add({ set: new Set([1, 2, 3, 2, 1]) });

      let result = lightWeightSet.has({ set: new Set([1, 2, 3, 2, 1]) });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0014
     * @tc.name      testLightWeightSetTest02Chapter0014
     * @tc.desc      Verify LightWeightSet's has method with class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0014';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const test = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const test1 = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(test);
      lightWeightSet.add(test1);

      let result = lightWeightSet.has(test1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0015
     * @tc.name      testLightWeightSetTest02Chapter0015
     * @tc.desc      Verify LightWeightSet's has method with object with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0015';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: undefined, b: 1 });
      lightWeightSet.add({ a: null, b: 1 });

      let result = lightWeightSet.has({ a: null, b: 1 });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0016
     * @tc.name      testLightWeightSetTest02Chapter0016
     * @tc.desc      Verify LightWeightSet's has method with object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0016';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: NaN, b: 1 });
      lightWeightSet.add({ a: Infinity, b: 1 });

      let result = lightWeightSet.has({ a: Infinity, b: 1 });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0017
     * @tc.name      testLightWeightSetTest02Chapter0017
     * @tc.desc      Verify LightWeightSet's has method with object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0017';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.increaseCapacityTo(10);
	  for (let i = 0; i < 10; i++) {
        lightWeightSet.add('a');
      }

      expect(lightWeightSet.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0018
     * @tc.name      testLightWeightSetTest02Chapter0018
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with byte boundary lower value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0018';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-128);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0019
     * @tc.name      testLightWeightSetTest02Chapter0019
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with byte boundary upper value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0019';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.increaseCapacityTo(127);
	  for (let i = 0; i < 127; i++) {
        lightWeightSet.add('a');
      }

      expect(lightWeightSet.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0020
     * @tc.name      testLightWeightSetTest02Chapter0020
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with byte below lower boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0020';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-129);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0021
     * @tc.name      testLightWeightSetTest02Chapter0021
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with byte above upper boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0021';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.increaseCapacityTo(128);
	  for (let i = 0; i < 128; i++) {
        lightWeightSet.add('a');
      }

      expect(lightWeightSet.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0022
     * @tc.name      testLightWeightSetTest02Chapter0022
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with short boundary lower value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0022';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-32768);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0023
     * @tc.name      testLightWeightSetTest02Chapter0023
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with short boundary upper value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0023';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.increaseCapacityTo(32767);
	  for (let i = 0; i < 32767; i++) {
        lightWeightSet.add('a');
      }

      expect(lightWeightSet.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0024
     * @tc.name      testLightWeightSetTest02Chapter0024
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with short below lower boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0024';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-32769);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0025
     * @tc.name      testLightWeightSetTest02Chapter0025
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with short above upper boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0025';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.increaseCapacityTo(32768);
      for (let i = 0; i < 32768; i++) {
        lightWeightSet.add('a');
      }

      expect(lightWeightSet.length).assertEqual(1);
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0026
     * @tc.name      testLightWeightSetTest02Chapter0026
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with int boundary lower value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0026';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-2147483648);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });


    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0028
     * @tc.name      testLightWeightSetTest02Chapter0028
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with int below lower boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0028';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-2147483649);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0029
     * @tc.name      testLightWeightSetTest02Chapter0029
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with int above upper boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0029';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(2147483648);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0030
     * @tc.name      testLightWeightSetTest02Chapter0030
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with long boundary lower value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0030';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-9223372036854775808);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0031
     * @tc.name      testLightWeightSetTest02Chapter0031
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with long boundary upper value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0031';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(9223372036854775807);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0032
     * @tc.name      testLightWeightSetTest02Chapter0032
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with long below lower boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0032';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-9223372036854775809);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0033
     * @tc.name      testLightWeightSetTest02Chapter0033
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with long above upper boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0033';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(9223372036854775808);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0034
     * @tc.name      testLightWeightSetTest02Chapter0034
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with char boundary lower value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0034';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(0);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0036
     * @tc.name      testLightWeightSetTest02Chapter0036
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with char below lower boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0036';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-1);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0038
     * @tc.name      testLightWeightSetTest02Chapter0038
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with float boundary positive lower value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0038';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(1.40129846432481707e-45);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0039
     * @tc.name      testLightWeightSetTest02Chapter0039
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with float boundary positive upper value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0039';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(3.40282346638528860e+38);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0040
     * @tc.name      testLightWeightSetTest02Chapter0040
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with float below positive lower boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0040';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(1.40129846432481706e-45);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0041
     * @tc.name      testLightWeightSetTest02Chapter0041
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with float above positive upper boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0041';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(3.40282346638528861e+38);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0042
     * @tc.name      testLightWeightSetTest02Chapter0042
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with double boundary positive lower value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0042';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(4.94065645841246544e-324);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0043
     * @tc.name      testLightWeightSetTest02Chapter0043
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with double boundary positive upper value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0043';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(1.79769313486231570e+308);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0044
     * @tc.name      testLightWeightSetTest02Chapter0044
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with double below positive lower boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0044';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(4.94065645841246543e-324);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0045
     * @tc.name      testLightWeightSetTest02Chapter0045
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with double above positive upper boundary value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0045';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(1.79769313486231571e+308);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0046
     * @tc.name      testLightWeightSetTest02Chapter0046
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with -Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0046';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-Infinity);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0047
     * @tc.name      testLightWeightSetTest02Chapter0047
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with undefined value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0047';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(undefined);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0048
     * @tc.name      testLightWeightSetTest02Chapter0048
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with NaN value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0048';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(NaN);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0049
     * @tc.name      testLightWeightSetTest02Chapter0049
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with -0 value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0049';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-0);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0050
     * @tc.name      testLightWeightSetTest02Chapter0050
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0050';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(Infinity);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0051
     * @tc.name      testLightWeightSetTest02Chapter0051
     * @tc.desc      Verify LightWeightSet's increaseCapacityTo method with -Infinity value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0051';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      let result:boolean = false;
      try{
        lightWeightSet.increaseCapacityTo(-Infinity);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0052
     * @tc.name      testLightWeightSetTest02Chapter0052
     * @tc.desc      Verify LightWeightSet's getIndexOf method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0052';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let index = lightWeightSet.getIndexOf("sparrow");
      let result:boolean = index === 2;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0053
     * @tc.name      testLightWeightSetTest02Chapter0053
     * @tc.desc      Verify LightWeightSet's getIndexOf method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0053';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let index = lightWeightSet.getIndexOf("sparrow");
      let result:boolean = index === 1;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0054
     * @tc.name      testLightWeightSetTest02Chapter0054
     * @tc.desc      Verify LightWeightSet's getIndexOf method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0054';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([-128, 127]);
      const arr2 = new Int8Array([-129, 128]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let index = lightWeightSet.getIndexOf(arr1);
      let result:boolean = index === 0 || index === 1;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0055
     * @tc.name      testLightWeightSetTest02Chapter0055
     * @tc.desc      Verify LightWeightSet's getIndexOf method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0055';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const arr1 = new Uint8Array([0, 255]);
      const arr2 = new Uint8Array([256]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let index = lightWeightSet.getIndexOf(arr1);
      let result:boolean = index === 0 || index ===1;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0056
     * @tc.name      testLightWeightSetTest02Chapter0056
     * @tc.desc      Verify LightWeightSet's getIndexOf method with special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0056';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      lightWeightSet.add("");

      let index = lightWeightSet.getIndexOf('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0057
     * @tc.name      testLightWeightSetTest02Chapter0057
     * @tc.desc      Verify LightWeightSet's getIndexOf method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0057';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const asciiStr = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      lightWeightSet.add(asciiStr);
      lightWeightSet.add("abc123");

      let index = lightWeightSet.getIndexOf(asciiStr);
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0058
     * @tc.name      testLightWeightSetTest02Chapter0058
     * @tc.desc      Verify LightWeightSet's getIndexOf method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0058';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("👆");
      lightWeightSet.add("👿");
      lightWeightSet.add("👀");
      lightWeightSet.add("💯");

      let index = lightWeightSet.getIndexOf("👿");
      let result:boolean = index === 1;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0059
     * @tc.name      testLightWeightSetTest02Chapter0059
     * @tc.desc      Verify LightWeightSet's getIndexOf method with number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0059';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0);
      lightWeightSet.add(undefined);

      let index = lightWeightSet.getIndexOf(0);
      let result:boolean = index === 0;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0060
     * @tc.name      testLightWeightSetTest02Chapter0060
     * @tc.desc      Verify LightWeightSet's getIndexOf method with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0060';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(NaN);
      lightWeightSet.add(-0);

      let index = lightWeightSet.getIndexOf(NaN);
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0061
     * @tc.name      testLightWeightSetTest02Chapter0061
     * @tc.desc      Verify LightWeightSet's getIndexOf method with Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0061';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Infinity);
      lightWeightSet.add(-Infinity);

      let index = lightWeightSet.getIndexOf(Infinity);
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0062
     * @tc.name      testLightWeightSetTest02Chapter0062
     * @tc.desc      Verify LightWeightSet's getIndexOf method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0062';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);

      let index = lightWeightSet.getIndexOf(true);
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0063
     * @tc.name      testLightWeightSetTest02Chapter0063
     * @tc.desc      Verify LightWeightSet's getIndexOf method with array with normal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0063';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const arr2 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let index = lightWeightSet.getIndexOf(arr1);
      let result:boolean = index === 0 || index===1;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0064
     * @tc.name      testLightWeightSetTest02Chapter0064
     * @tc.desc      Verify LightWeightSet's getIndexOf method with array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0064';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      lightWeightSet.add(arr1);
      lightWeightSet.add([1, 2, 3]);

      let index = lightWeightSet.getIndexOf(arr1);
      let result:boolean = index === 0 || index === 1;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0065
     * @tc.name      testLightWeightSetTest02Chapter0065
     * @tc.desc      Verify LightWeightSet's getIndexOf method with special array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0065';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);
      lightWeightSet.add({});

      let index = lightWeightSet.getIndexOf(arr);
      let result:boolean = index === 0 || index === 1;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0066
     * @tc.name      testLightWeightSetTest02Chapter0066
     * @tc.desc      Verify LightWeightSet's getIndexOf method with array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0066';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      const arr1 = [72, "abc", true, null, undefined, 108];
      lightWeightSet.add(arr1);
      lightWeightSet.add([]);

      let index = lightWeightSet.getIndexOf(arr1);
      let result:boolean = index === 0 || index === 1;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0067
     * @tc.name      testLightWeightSetTest02Chapter0067
     * @tc.desc      Verify LightWeightSet's getIndexOf method with normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0067';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: 1, b: "test", c: [1, 2, 3] });
      lightWeightSet.add({ a: 10, b: "key", c: [20, 4] });

      let index = lightWeightSet.getIndexOf({ a: 1, b: "test", c: [1, 2, 3] });
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0068
     * @tc.name      testLightWeightSetTest02Chapter0068
     * @tc.desc      Verify LightWeightSet's getIndexOf method with object with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0068';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ "key": "value", a: 1 });
      lightWeightSet.add({ b: 2 });

      let index = lightWeightSet.getIndexOf({ "key": "value", a: 1 });
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0069
     * @tc.name      testLightWeightSetTest02Chapter0069
     * @tc.desc      Verify LightWeightSet's getIndexOf method with object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0069';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: 1, b: () => { } });
      lightWeightSet.add({ c: 3 });

      let index = lightWeightSet.getIndexOf({ a: 1, b: () => { } });
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0070
     * @tc.name      testLightWeightSetTest02Chapter0070
     * @tc.desc      Verify LightWeightSet's getIndexOf method with object with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0070';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new ArrayBuffer(16) });
      lightWeightSet.add({ view: new DataView(new ArrayBuffer(16)) });

      let index = lightWeightSet.getIndexOf({ buffer: new ArrayBuffer(16) });
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0071
     * @tc.name      testLightWeightSetTest02Chapter0071
     * @tc.desc      Verify LightWeightSet's getIndexOf method with object with TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0071';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new Uint8Array([72, 101, 108, 108, 111]) });
      lightWeightSet.add({});

      let index = lightWeightSet.getIndexOf({ buffer: new Uint8Array([72, 101, 108, 108, 111]) });
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0072
     * @tc.name      testLightWeightSetTest02Chapter0072
     * @tc.desc      Verify LightWeightSet's getIndexOf method with object with Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0072';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ map: new Map<number, number>() });
      lightWeightSet.add({ set: new Set([1, 2, 3, 2, 1]) });

      let index = lightWeightSet.getIndexOf({ map: new Map<number, number>() });
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0073
     * @tc.name      testLightWeightSetTest02Chapter0073
     * @tc.desc      Verify LightWeightSet's getIndexOf method with class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0073';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const test = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const test1 = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(test);
      lightWeightSet.add(test1);

      let index = lightWeightSet.getIndexOf(test);
      let result:boolean = index === 0 || index ===1;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0074
     * @tc.name      testLightWeightSetTest02Chapter0074
     * @tc.desc      Verify LightWeightSet's getIndexOf method with object with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0074';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: undefined, b: 1 });
      lightWeightSet.add({ a: null, b: 1 });

      let index = lightWeightSet.getIndexOf({ a: undefined, b: 1 });
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0075
     * @tc.name      testLightWeightSetTest02Chapter0075
     * @tc.desc      Verify LightWeightSet's getIndexOf method with object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0075';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: NaN, b: 1 });
      lightWeightSet.add({ a: Infinity, b: 1 });

      let index = lightWeightSet.getIndexOf({ a: NaN, b: 1 });
      let result:boolean = index === 0;
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0076
     * @tc.name      testLightWeightSetTest02Chapter0076
     * @tc.desc      Verify LightWeightSet's remove method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0076';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let remove_data = lightWeightSet.remove("sparrow");
      let result:boolean = remove_data === "sparrow";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0077
     * @tc.name      testLightWeightSetTest02Chapter0077
     * @tc.desc      Verify LightWeightSet's remove method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0077';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      lightWeightSet.add(new Int8Array([-128, 127]));
      lightWeightSet.add(new Int8Array([-129, 128]));

      let remove_data = lightWeightSet.remove(new Int8Array([-129, 128]));
      let result:boolean = remove_data === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0078
     * @tc.name      testLightWeightSetTest02Chapter0078
     * @tc.desc      Verify LightWeightSet's remove method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0078';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      lightWeightSet.add(new Uint8Array([0, 255]));
      lightWeightSet.add(new Uint8Array([256]));

      let remove_data = lightWeightSet.remove(new Uint8Array([0, 255]));
      let result:boolean = remove_data === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0079
     * @tc.name      testLightWeightSetTest02Chapter0079
     * @tc.desc      Verify LightWeightSet's remove method with special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0079';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      lightWeightSet.add("");

      let remove_data = lightWeightSet.remove("");
      let result:boolean = remove_data === "";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0080
     * @tc.name      testLightWeightSetTest02Chapter0080
     * @tc.desc      Verify LightWeightSet's remove method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0080';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
      lightWeightSet.add("abc123");

      let remove_data = lightWeightSet.remove("abc123");
      let result:boolean = remove_data === "abc123";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0081
     * @tc.name      testLightWeightSetTest02Chapter0081
     * @tc.desc      Verify LightWeightSet's remove method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0081';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("👆");
      lightWeightSet.add("👿");
      lightWeightSet.add("👀");
      lightWeightSet.add("💯");

      let remove_data = lightWeightSet.remove("💯");
      let result:boolean = remove_data === "💯";
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0082
     * @tc.name      testLightWeightSetTest02Chapter0082
     * @tc.desc      Verify LightWeightSet's remove method with number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0082';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0);
      lightWeightSet.add(undefined);

      let remove_data = lightWeightSet.remove(0);
      let result:boolean = remove_data === 0;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0083
     * @tc.name      testLightWeightSetTest02Chapter0083
     * @tc.desc      Verify LightWeightSet's remove method with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0083';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(NaN);
      lightWeightSet.add(-0);

      let remove_data = lightWeightSet.remove(NaN);
      let result:boolean = Number.isNaN(remove_data);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0084
     * @tc.name      testLightWeightSetTest02Chapter0084
     * @tc.desc      Verify LightWeightSet's remove method with Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0084';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Infinity);
      lightWeightSet.add(-Infinity);

      let remove_data = lightWeightSet.remove(Infinity);
      let result:boolean = remove_data === Infinity;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0085
     * @tc.name      testLightWeightSetTest02Chapter0085
     * @tc.desc      Verify LightWeightSet's remove method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0085';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);

      let remove_data = lightWeightSet.remove(false);
      let result:boolean = remove_data === false;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0086
     * @tc.name      testLightWeightSetTest02Chapter0086
     * @tc.desc      Verify LightWeightSet's remove method with array with normal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0086';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      lightWeightSet.add([72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63]);
      lightWeightSet.add([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);

      let remove_data = lightWeightSet.remove([72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63]);
      let result:boolean = remove_data === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST02_0087
     * @tc.name      testLightWeightSetTest02Chapter0087
     * @tc.desc      Verify LightWeightSet's remove method with array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest02Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest02Chapter0087';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      lightWeightSet.add([72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63]);
      lightWeightSet.add([1, 2, 3]);

      let remove_data = lightWeightSet.remove([1, 2, 3]);
      let result:boolean = remove_data === undefined;
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

  })
}