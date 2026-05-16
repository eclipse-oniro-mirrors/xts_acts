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

export default function testLightWeightSetTest01() {
  describe('testLightWeightSetTest01', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });
    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
    });
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0001
     * @tc.name      testLightWeightSetTest01Chapter0001
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0001';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string | number>();
      expect(lightWeightSet.length).assertEqual(0);
      expect(lightWeightSet instanceof LightWeightSet).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0002
     * @tc.name      testLightWeightSetTest01Chapter0002
     * @tc.desc      Verify normal construction
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0002';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string | string>();
      expect(lightWeightSet.length).assertEqual(0);
      expect(lightWeightSet.constructor.name).assertEqual("LightWeightSet");
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0003
     * @tc.name      testLightWeightSetTest01Chapter0003
     * @tc.desc      Verify that the newly created LightWeightSet is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0003';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0004
     * @tc.name      testLightWeightSetTest01Chapter0004
     * @tc.desc      Verify that the newly created LightWeightSet is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0004';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number | number>();
      const result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0005
     * @tc.name      testLightWeightSetTest01Chapter0005
     * @tc.desc      Verify that the newly created LightWeightSet is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0005';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number | string>();
      const result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0006
     * @tc.name      testLightWeightSetTest01Chapter0006
     * @tc.desc      Verify that the newly created LightWeightSet is empty
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0006';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number | string | number>();
      const result = lightWeightSet.isEmpty();
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0007
     * @tc.name      testLightWeightSetTest01Chapter0007
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0007';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<Int8Array>();
      const result = lightWeightSet.add(new Int8Array([20]));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0008
     * @tc.name      testLightWeightSetTest01Chapter0008
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0008';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<Uint8Array>();
      const result = lightWeightSet.add(new Uint8Array([-1]));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0009
     * @tc.name      testLightWeightSetTest01Chapter0009
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0009';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<Float32Array>();
      const result = lightWeightSet.add(new Float32Array([-3.4028234663852886e38]));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0010
     * @tc.name      testLightWeightSetTest01Chapter0010
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0010';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<BigInt64Array>();
      const result = lightWeightSet.add(new BigInt64Array([-9223372036854775808n]));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0011
     * @tc.name      testLightWeightSetTest01Chapter0011
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0011';
      console.log(TAG + 'start');
      const test_value:Float32Array = new Float32Array([Infinity]);
      const lightWeightSet = new LightWeightSet<Float32Array>();
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0012
     * @tc.name      testLightWeightSetTest01Chapter0012
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0012';
      console.log(TAG + 'start');
      const test_value:Float64Array = new Float64Array([NaN]);
      const lightWeightSet = new LightWeightSet<Float64Array>();
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0013
     * @tc.name      testLightWeightSetTest01Chapter0013
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0013';
      console.log(TAG + 'start');
      const test_value:Int32Array = new Int32Array([0]);
      const lightWeightSet = new LightWeightSet<Int32Array>();
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0014
     * @tc.name      testLightWeightSetTest01Chapter0014
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0014';
      console.log(TAG + 'start');
      const test_value:Uint8ClampedArray = new Uint8ClampedArray([Infinity]);
      const lightWeightSet = new LightWeightSet<Uint8ClampedArray>();
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0015
     * @tc.name      testLightWeightSetTest01Chapter0015
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0015';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<BigInt64Array>();
      let result:boolean = false;
      try{
        const test_value:BigInt64Array = new BigInt64Array([BigInt(NaN)]);
        lightWeightSet.add(test_value);
      }catch(e){
        result = true;
      }
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0016
     * @tc.name      testLightWeightSetTest01Chapter0016
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0016';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add(undefined);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0017
     * @tc.name      testLightWeightSetTest01Chapter0017
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0017';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add(" ");
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0018
     * @tc.name      testLightWeightSetTest01Chapter0018
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0018';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add('<=>');
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0019
     * @tc.name      testLightWeightSetTest01Chapter0019
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0019';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add('\n\t');
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0020
     * @tc.name      testLightWeightSetTest01Chapter0020
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0020';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add('👀');
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0021
     * @tc.name      testLightWeightSetTest01Chapter0021
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0021';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add("{k1:value1,k2:value2}");
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0022
     * @tc.name      testLightWeightSetTest01Chapter0022
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0022';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<string>();
      const result = lightWeightSet.add("NaN");
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0023
     * @tc.name      testLightWeightSetTest01Chapter0023
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0023';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.add(Number.EPSILON);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0024
     * @tc.name      testLightWeightSetTest01Chapter0024
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0024';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.add(1e3);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0025
     * @tc.name      testLightWeightSetTest01Chapter0025
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0025';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.add(0x0102);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0026
     * @tc.name      testLightWeightSetTest01Chapter0026
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0026';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<number>();
      const result = lightWeightSet.add(Number(BigInt(9007199254740991n)));
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0027
     * @tc.name      testLightWeightSetTest01Chapter0027
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0027';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<boolean>();
      const result = lightWeightSet.add(false);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0028
     * @tc.name      testLightWeightSetTest01Chapter0028
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0028';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<boolean>();
      const result = lightWeightSet.add(null);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0029
     * @tc.name      testLightWeightSetTest01Chapter0029
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0029';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<boolean>();
      const result = lightWeightSet.add(!'s');
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0030
     * @tc.name      testLightWeightSetTest01Chapter0030
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0030';
      console.log(TAG + 'start');
      const lightWeightSet = new LightWeightSet<Int8Array>();
      const test_value:Int8Array = new Int8Array([20,-30,58,100]);
      const result = lightWeightSet.add(test_value);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0031
     * @tc.name      testLightWeightSetTest01Chapter0031
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0031';
      console.log(TAG + 'start');
      interface test{
        x:number;
        y:string;
        z:Int8Array;
      }
      const Test1:test = {x:1,y:"test",z:new Int8Array([20])};
      const lightWeightSet = new LightWeightSet<object>();
      const result = lightWeightSet.add(Test1);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0032
     * @tc.name      testLightWeightSetTest01Chapter0032
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0032';
      console.log(TAG + 'start');
      const testA = new testLightWeightSet("li",20,new Int8Array([20,30,40]));
      const lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const result = lightWeightSet.add(testA);
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0033
     * @tc.name      testLightWeightSetTest01Chapter0033
     * @tc.desc      Verify that the created LightWeightSet is not empty after adding key-value pairs
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0033';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      let set = new LightWeightSet<string>();
      set.add("gull");
      lightWeightSet.addAll(set);
      let result = lightWeightSet.has("gull");
      expect(result).assertTrue();
      console.log(TAG + 'end');

    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0034
     * @tc.name      testLightWeightSetTest01Chapter0034
     * @tc.desc      Verify LightWeightSet can store Int8Array with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0034';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([-128, 127]);
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Int8Array>();
      const arr2 = new Int8Array([-129, 128]);
      set.add(arr2);

      lightWeightSet.addAll(set);
      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0035
     * @tc.name      testLightWeightSetTest01Chapter0035
     * @tc.desc      Verify LightWeightSet can store Uint8Array with boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0035';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const arr1 = new Uint8Array([0, 255]);
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Uint8Array>();
      const arr2 = new Uint8Array([256]);
      set.add(arr2);

      lightWeightSet.addAll(set);
      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0036
     * @tc.name      testLightWeightSetTest01Chapter0036
     * @tc.desc      Verify LightWeightSet can store special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0036';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');

      let set = new LightWeightSet<string>();
      set.add("");
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0037
     * @tc.name      testLightWeightSetTest01Chapter0037
     * @tc.desc      Verify LightWeightSet can store ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0037';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');

      let set = new LightWeightSet<string>();
      set.add("abc123");
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~');
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0038
     * @tc.name      testLightWeightSetTest01Chapter0038
     * @tc.desc      Verify LightWeightSet can store emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0038';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("👆");
      lightWeightSet.add("👿");

      let set = new LightWeightSet<string>();
      set.add("👀");
      set.add("💯");
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has("💯");
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0039
     * @tc.name      testLightWeightSetTest01Chapter0039
     * @tc.desc      Verify LightWeightSet can store number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0039';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0);

      let set = new LightWeightSet<number>();
      set.add(undefined);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(0);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0040
     * @tc.name      testLightWeightSetTest01Chapter0040
     * @tc.desc      Verify LightWeightSet can store NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0040';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(NaN);

      let set = new LightWeightSet<number>();
      set.add(-0);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(NaN);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0041
     * @tc.name      testLightWeightSetTest01Chapter0041
     * @tc.desc      Verify LightWeightSet can store Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0041';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Infinity);

      let set = new LightWeightSet<number>();
      set.add(-Infinity);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(Infinity);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0042
     * @tc.name      testLightWeightSetTest01Chapter0042
     * @tc.desc      Verify LightWeightSet can store boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0042';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);

      let set = new LightWeightSet<boolean>();
      set.add(false);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(false);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0043
     * @tc.name      testLightWeightSetTest01Chapter0043
     * @tc.desc      Verify LightWeightSet can store array with normal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0043';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Array<number>>();
      const arr2 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      set.add(arr2);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0044
     * @tc.name      testLightWeightSetTest01Chapter0044
     * @tc.desc      Verify LightWeightSet can store array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0044';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Array<number>>();
      set.add([1, 2, 3]);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0045
     * @tc.name      testLightWeightSetTest01Chapter0045
     * @tc.desc      Verify LightWeightSet can store special array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0045';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);

      let set = new LightWeightSet<object>();
      set.add({});
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(arr);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0046
     * @tc.name      testLightWeightSetTest01Chapter0046
     * @tc.desc      Verify LightWeightSet can store array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0046';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      const arr1 = [72, "abc", true, null, undefined, 108];
      lightWeightSet.add(arr1);

      let set = new LightWeightSet<Array<string>>();
      set.add([]);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0047
     * @tc.name      testLightWeightSetTest01Chapter0047
     * @tc.desc      Verify LightWeightSet can store normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0047';
      console.log(TAG + 'start');
      interface obj{
        a:number;
        b:string;
        c:Array<number>;
      }
      let lightWeightSet = new LightWeightSet<object>();
      const obj1:obj = { a: 1, b: "test", c: [1, 2, 3] };
      lightWeightSet.add(obj1);

      let set = new LightWeightSet<object>();
      const obj2:obj = { a: 10, b: "key", c: [20,4] };
      set.add(obj2);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(obj1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0048
     * @tc.name      testLightWeightSetTest01Chapter0048
     * @tc.desc      Verify LightWeightSet can store object with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0048';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ "key": "value", a: 1 });

      let set = new LightWeightSet<object>();
      set.add({ b: 2 });
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has({ b: 2 });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0049
     * @tc.name      testLightWeightSetTest01Chapter0049
     * @tc.desc      Verify LightWeightSet can store object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0049';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: 1, b: () => { } });

      let set = new LightWeightSet<object>();
      set.add({ c: 3 });
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has({ c: 3 });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0050
     * @tc.name      testLightWeightSetTest01Chapter0050
     * @tc.desc      Verify LightWeightSet can store object with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0050';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new ArrayBuffer(16) });

      let set = new LightWeightSet<object>();
      set.add({ view: new DataView(new ArrayBuffer(16)) });
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has({ view: new DataView(new ArrayBuffer(16)) });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0051
     * @tc.name      testLightWeightSetTest01Chapter0051
     * @tc.desc      Verify LightWeightSet can store object with TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0051';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new Uint8Array([72, 101, 108, 108, 111]) });

      let set = new LightWeightSet<object>();
      set.add({});
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has({});
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0052
     * @tc.name      testLightWeightSetTest01Chapter0052
     * @tc.desc      Verify LightWeightSet can store object with Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0052';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ map: new Map<number,number>() });

      let set = new LightWeightSet<object>();
      set.add({ set: new Set([1, 2, 3, 2, 1]) });
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has({ set: new Set([1, 2, 3, 2, 1]) });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0053
     * @tc.name      testLightWeightSetTest01Chapter0053
     * @tc.desc      Verify LightWeightSet can store class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0053';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const test = new testLightWeightSet("wang",25,new Int8Array([20,10]));
      lightWeightSet.add(test);

      let set = new LightWeightSet<testLightWeightSet>();
      const test1 = new testLightWeightSet("xie",19,new Int8Array([80,90]));
      set.add(test1);
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has(test1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });
    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0054
     * @tc.name      testLightWeightSetTest01Chapter0054
     * @tc.desc      Verify LightWeightSet can store object with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0054';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: undefined, b: 1 });

      let set = new LightWeightSet<object>();
      set.add({ a: null, b: 1 });
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has({ a: null, b: 1 });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0055
     * @tc.name      testLightWeightSetTest01Chapter0055
     * @tc.desc      Verify LightWeightSet can store object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0055';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: NaN, b: 1 });

      let set = new LightWeightSet<object>();
      set.add({ a: Infinity, b: 1 });
      lightWeightSet.addAll(set);

      let result = lightWeightSet.has({ a: Infinity, b: 1 });
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0056
     * @tc.name      testLightWeightSetTest01Chapter0056
     * @tc.desc      Verify LightWeightSet's hasAll method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0056';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let set = new LightWeightSet<string>();
      set.add("sparrow");
      set.add("gull");

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0057
     * @tc.name      testLightWeightSetTest01Chapter0057
     * @tc.desc      Verify LightWeightSet's hasAll method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0057';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([-128, 127]);
      const arr2 = new Int8Array([-129, 128]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let set = new LightWeightSet<Int8Array>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0058
     * @tc.name      testLightWeightSetTest01Chapter0058
     * @tc.desc      Verify LightWeightSet's hasAll method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0058';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const arr1 = new Uint8Array([0, 255]);
      const arr2 = new Uint8Array([256]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let set = new LightWeightSet<Uint8Array>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0059
     * @tc.name      testLightWeightSetTest01Chapter0059
     * @tc.desc      Verify LightWeightSet's hasAll method with special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0059';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      lightWeightSet.add("");

      let set = new LightWeightSet<string>();
      set.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0060
     * @tc.name      testLightWeightSetTest01Chapter0060
     * @tc.desc      Verify LightWeightSet's hasAll method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0060';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const asciiStr = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      lightWeightSet.add(asciiStr);
      lightWeightSet.add("abc123");

      let set = new LightWeightSet<string>();
      set.add(asciiStr);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0061
     * @tc.name      testLightWeightSetTest01Chapter0061
     * @tc.desc      Verify LightWeightSet's hasAll method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0061';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("👆");
      lightWeightSet.add("👿");
      lightWeightSet.add("👀");
      lightWeightSet.add("💯");

      let set = new LightWeightSet<string>();
      set.add("💯");
      set.add("👀");

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0062
     * @tc.name      testLightWeightSetTest01Chapter0062
     * @tc.desc      Verify LightWeightSet's hasAll method with number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0062';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0);
      lightWeightSet.add(undefined);

      let set = new LightWeightSet<number>();
      set.add(0);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0063
     * @tc.name      testLightWeightSetTest01Chapter0063
     * @tc.desc      Verify LightWeightSet's hasAll method with NaN
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0063';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(NaN);
      lightWeightSet.add(-0);

      let set = new LightWeightSet<number>();
      set.add(NaN);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0064
     * @tc.name      testLightWeightSetTest01Chapter0064
     * @tc.desc      Verify LightWeightSet's hasAll method with Infinity and -Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0064';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(Infinity);
      lightWeightSet.add(-Infinity);

      let set = new LightWeightSet<number>();
      set.add(Infinity);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0065
     * @tc.name      testLightWeightSetTest01Chapter0065
     * @tc.desc      Verify LightWeightSet's hasAll method with boolean values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0065';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<boolean>();
      lightWeightSet.add(true);
      lightWeightSet.add(false);

      let set = new LightWeightSet<boolean>();
      set.add(false);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0066
     * @tc.name      testLightWeightSetTest01Chapter0066
     * @tc.desc      Verify LightWeightSet's hasAll method with array with normal values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0066';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 100, 49, 50, 51, 63];
      const arr2 = [72, 101, 108, 108, 111, 87, 111, 114, 108, 0, 0, 0, 0, 0, 100, 49, 50, 51, 63];
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let set = new LightWeightSet<Array<number>>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0067
     * @tc.name      testLightWeightSetTest01Chapter0067
     * @tc.desc      Verify LightWeightSet's hasAll method with array with negative numbers
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0067';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number>>();
      const arr1 = [72, 101, 108, 108, 111, 87, -111, 114, 108, 100, -49, 50, 51, -63];
      lightWeightSet.add(arr1);
      lightWeightSet.add([1, 2, 3]);

      let set = new LightWeightSet<Array<number>>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0068
     * @tc.name      testLightWeightSetTest01Chapter0068
     * @tc.desc      Verify LightWeightSet's hasAll method with special array object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0068';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      const arr = [];
      arr["abc"] = 111;
      arr["aaa"] = 222;
      lightWeightSet.add(arr);
      lightWeightSet.add({});

      let set = new LightWeightSet<object>();
      set.add(arr);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0069
     * @tc.name      testLightWeightSetTest01Chapter0069
     * @tc.desc      Verify LightWeightSet's hasAll method with array with mixed types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0069';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      const arr1 = [72, "abc", true, null, undefined, 108];
      lightWeightSet.add(arr1);
      lightWeightSet.add([]);

      let set = new LightWeightSet<Array<number | string | boolean | null | undefined>>();
      set.add(arr1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0070
     * @tc.name      testLightWeightSetTest01Chapter0070
     * @tc.desc      Verify LightWeightSet's hasAll method with normal object
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0070';
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

      let set = new LightWeightSet<object>();
      set.add(obj1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0071
     * @tc.name      testLightWeightSetTest01Chapter0071
     * @tc.desc      Verify LightWeightSet's hasAll method with object with Symbol key
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0071';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ "key": "value", a: 1 });
      lightWeightSet.add({ b: 2 });

      let set = new LightWeightSet<object>();
      set.add({ b: 2 });

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0072
     * @tc.name      testLightWeightSetTest01Chapter0072
     * @tc.desc      Verify LightWeightSet's hasAll method with object with function property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0072';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: 1, b: () => { } });
      lightWeightSet.add({ c: 3 });

      let set = new LightWeightSet<object>();
      set.add({ c: 3 });

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0073
     * @tc.name      testLightWeightSetTest01Chapter0073
     * @tc.desc      Verify LightWeightSet's hasAll method with object with ArrayBuffer
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0073';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new ArrayBuffer(16) });
      lightWeightSet.add({ view: new DataView(new ArrayBuffer(16)) });

      let set = new LightWeightSet<object>();
      set.add({ view: new DataView(new ArrayBuffer(16)) });

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0074
     * @tc.name      testLightWeightSetTest01Chapter0074
     * @tc.desc      Verify LightWeightSet's hasAll method with object with TypedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0074';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ buffer: new Uint8Array([72, 101, 108, 108, 111]) });
      lightWeightSet.add({});

      let set = new LightWeightSet<object>();
      set.add({});

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0075
     * @tc.name      testLightWeightSetTest01Chapter0075
     * @tc.desc      Verify LightWeightSet's hasAll method with object with Map
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0075';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ map: new Map<number, number>() });
      lightWeightSet.add({ set: new Set([1, 2, 3, 2, 1]) });

      let set = new LightWeightSet<object>();
      set.add({ set: new Set([1, 2, 3, 2, 1]) });

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0076
     * @tc.name      testLightWeightSetTest01Chapter0076
     * @tc.desc      Verify LightWeightSet's hasAll method with class instances
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0076';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<testLightWeightSet>();
      const test = new testLightWeightSet("wang", 25, new Int8Array([20, 10]));
      const test1 = new testLightWeightSet("xie", 19, new Int8Array([80, 90]));
      lightWeightSet.add(test);
      lightWeightSet.add(test1);

      let set = new LightWeightSet<testLightWeightSet>();
      set.add(test1);

      let result = lightWeightSet.hasAll(set);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0077
     * @tc.name      testLightWeightSetTest01Chapter0077
     * @tc.desc      Verify LightWeightSet's hasAll method with object with undefined property
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0077';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: undefined, b: 1 });
      lightWeightSet.add({ a: null, b: 1 });

      let set = new LightWeightSet<object>();
      set.add({ a: null, b: 1 });

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0078
     * @tc.name      testLightWeightSetTest01Chapter0078
     * @tc.desc      Verify LightWeightSet's hasAll method with object with NaN and Infinity
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0078';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<object>();
      lightWeightSet.add({ a: NaN, b: 1 });
      lightWeightSet.add({ a: Infinity, b: 1 });

      let set = new LightWeightSet<object>();
      set.add({ a: Infinity, b: 1 });

      let result = lightWeightSet.hasAll(set);
      expect(result).assertFalse();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0079
     * @tc.name      testLightWeightSetTest01Chapter0079
     * @tc.desc      Verify LightWeightSet's has method with string elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0079';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("squirrel");
      lightWeightSet.add("sparrow");
      lightWeightSet.add("gull");

      let result = lightWeightSet.has("sparrow");
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0080
     * @tc.name      testLightWeightSetTest01Chapter0080
     * @tc.desc      Verify LightWeightSet's has method with Int8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0080';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Int8Array>();
      const arr1 = new Int8Array([-128, 127]);
      const arr2 = new Int8Array([-129, 128]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0081
     * @tc.name      testLightWeightSetTest01Chapter0081
     * @tc.desc      Verify LightWeightSet's has method with Uint8Array boundary values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0081';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<Uint8Array>();
      const arr1 = new Uint8Array([0, 255]);
      const arr2 = new Uint8Array([256]);
      lightWeightSet.add(arr1);
      lightWeightSet.add(arr2);

      let result = lightWeightSet.has(arr1);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0082
     * @tc.name      testLightWeightSetTest01Chapter0082
     * @tc.desc      Verify LightWeightSet's has method with special strings
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0082';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      lightWeightSet.add("");

      let result = lightWeightSet.has('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0083
     * @tc.name      testLightWeightSetTest01Chapter0083
     * @tc.desc      Verify LightWeightSet's has method with ASCII characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0083';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      const asciiStr = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~';
      lightWeightSet.add(asciiStr);
      lightWeightSet.add("abc123");

      let result = lightWeightSet.has(asciiStr);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0084
     * @tc.name      testLightWeightSetTest01Chapter0084
     * @tc.desc      Verify LightWeightSet's has method with emoji characters
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0084';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<string>();
      lightWeightSet.add("👆");
      lightWeightSet.add("👿");
      lightWeightSet.add("👀");
      lightWeightSet.add("💯");

      let result = lightWeightSet.has("💯");
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });

    /**
     * @tc.number    SUB_LIGHTWEIGHTSET_TEST01_0085
     * @tc.name      testLightWeightSetTest01Chapter0085
     * @tc.desc      Verify LightWeightSet's has method with number 0
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testLightWeightSetTest01Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testLightWeightSetTest01Chapter0085';
      console.log(TAG + 'start');
      let lightWeightSet = new LightWeightSet<number>();
      lightWeightSet.add(0);
      lightWeightSet.add(undefined);

      let result = lightWeightSet.has(0);
      expect(result).assertTrue();
      console.log(TAG + 'end');
    });
  });
}