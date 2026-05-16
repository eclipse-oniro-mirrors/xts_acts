import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest06() {
  describe('VectorTest06', () => {
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
     * @tc.number    SUB_VECTOR_TEST06_0100
     * @tc.name      testVector06Chapter0001
     * @tc.desc      convertToArray object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0001';
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3]
      }

      let res = new C1();
      vector.add(res);
      let arr = vector.convertToArray();
      expect(Array.isArray(arr)).assertTrue();
      expect(arr.length).assertEqual(vector.length);
      expect(arr[0]).assertEqual(vector.get(0));
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_0200
     * @tc.name      testVector06Chapter0002
     * @tc.desc      isEmpty number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0002';
      let vector = new Vector<number>();
      expect(vector.isEmpty()).assertTrue();
      vector.add(1);
      expect(vector.isEmpty()).assertFalse();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_0300
     * @tc.name      testVector06Chapter0003
     * @tc.desc      isEmpty Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0003';
      let vector = new Vector<Int8Array>();
      expect(vector.isEmpty()).assertTrue();
      vector.add(new Int8Array([-128]));
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_0400
     * @tc.name      testVector06Chapter0004
     * @tc.desc      isEmpty Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0004';
      let vector = new Vector<Float32Array>();
      expect(vector.isEmpty()).assertTrue();
      vector.add(new Float32Array([Infinity]));
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_0500
     * @tc.name      testVector06Chapter0005
     * @tc.desc      isEmpty Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0005';
      let vector = new Vector<Float32Array>();
      expect(vector.isEmpty()).assertTrue();
      vector.add(new Float32Array([-Infinity]));
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_0600
     * @tc.name      testVector06Chapter0006
     * @tc.desc      isEmpty Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0006';
      let vector = new Vector<Float32Array>();
      expect(vector.isEmpty()).assertTrue();
      vector.add(new Float32Array([NaN]));
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_0700
     * @tc.name      testVector06Chapter0007
     * @tc.desc      isEmpty string("!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0007';
      let vector = new Vector<string>();
      expect(vector.isEmpty()).assertTrue();
      vector.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_0800
     * @tc.name      testVector06Chapter0008
     * @tc.desc      isEmpty number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0008';
      let vector = new Vector<number>();
      expect(vector.isEmpty()).assertTrue();
      vector.add(0);
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_0900
     * @tc.name      testVector06Chapter0009
     * @tc.desc      isEmpty boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0009';
      let vector = new Vector<boolean>();
      expect(vector.isEmpty()).assertTrue();
      vector.add(true);
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1000
     * @tc.name      testVector06Chapter0010
     * @tc.desc      isEmpty Array(special array with props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0010';
      let vector = new Vector<Array<number>>();
      let arr: Array<number> = [];
      arr["abc"] = 111;
      arr["aaa"] = 72;
      expect(vector.isEmpty()).assertTrue();
      vector.add(arr);
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1100
     * @tc.name      testVector06Chapter0011
     * @tc.desc      isEmpty object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0011';
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3]
      }

      expect(vector.isEmpty()).assertTrue();
      vector.add(new C1());
      expect(vector.isEmpty()).assertFalse();
      vector.clear();
      expect(vector.isEmpty()).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1200
     * @tc.name      testVector06Chapter0012
     * @tc.desc      increaseCapacityTo number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0012';
      let vector = new Vector<number>();
      const targetCapacity = 20;
      vector.add(1)
      let capacity1 = vector.getCapacity()
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity()
      expect(capacity2 >= capacity1).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1300
     * @tc.name      testVector06Chapter0013
     * @tc.desc      increaseCapacityTo Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0013';
      let vector = new Vector<Int8Array>();
      const targetCapacity = 13;
      let int8Arr = new Int8Array([-128]);
      vector.add(int8Arr)
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity()
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1)
      expect(vector.get(0)).assertEqual(int8Arr)
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_1400
     * @tc.name      testVector06Chapter0014
     * @tc.desc      increaseCapacityTo Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0014';
      let vector = new Vector<Float32Array>();
      const targetCapacity = 13;
      let float32Arr = new Float32Array([Infinity]);
      vector.add(float32Arr)
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity()
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1)
      expect(vector.get(0)).assertEqual(float32Arr)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1500
     * @tc.name      testVector06Chapter0015
     * @tc.desc      increaseCapacityTo Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0015';
      let vector = new Vector<Float32Array>();
      const targetCapacity = 13;
      let float32Arr = new Float32Array([-Infinity]);
      vector.add(float32Arr)
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity()
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1)
      expect(vector.get(0)).assertEqual(float32Arr)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1600
     * @tc.name      testVector06Chapter0016
     * @tc.desc      increaseCapacityTo Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0016';
      let vector = new Vector<Float32Array>();
      const targetCapacity = 13;
      let float32Arr = new Float32Array([NaN]);
      vector.add(float32Arr)
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity()
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1)
      expect(vector.get(0)[0]).assertNaN();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1700
     * @tc.name      testVector06Chapter0017
     * @tc.desc      increaseCapacityTo string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0017';
      let vector = new Vector<string>();
      const targetCapacity = 13;
      let strVal = '👆';
      vector.add(strVal);
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity();
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1);
      expect(vector.get(0)).assertEqual(strVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1800
     * @tc.name      testVector06Chapter0018
     * @tc.desc      increaseCapacityTo number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0018';
      let vector = new Vector<number>();
      const targetCapacity = 13;
      let numVal = 0;
      vector.add(numVal);
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity();
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1);
      expect(vector.get(0)).assertEqual(numVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_1900
     * @tc.name      testVector06Chapter0019
     * @tc.desc      increaseCapacityTo boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0019';
      let vector = new Vector<boolean>();
      const targetCapacity = 13;
      let boolVal = true;
      vector.add(boolVal);
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity();
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1);
      expect(vector.get(0)).assertEqual(boolVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2000
     * @tc.name      testVector06Chapter0020
     * @tc.desc      increaseCapacityTo Array(special array with props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0020';
      let vector = new Vector<Array<number>>();
      const targetCapacity = 13;
      let arrVal: Array<number> = [];
      arrVal["abc"] = 111;
      arrVal["aaa"] = 72;
      vector.add(arrVal);
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity();
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1);
      expect(vector.get(0)).assertEqual(arrVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2100
     * @tc.name      testVector06Chapter0021
     * @tc.desc      increaseCapacityTo object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0021';
      let vector = new Vector<object>();
      const targetCapacity = 13;
      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3];
      }
      let objVal = new C1();
      vector.add(objVal);
      vector.increaseCapacityTo(targetCapacity);
      let capacity2 = vector.getCapacity();
      expect(capacity2 >= targetCapacity).assertTrue();
      expect(capacity2 >= vector.length).assertTrue();
      expect(vector.length).assertEqual(1);
      expect(vector.get(0)).assertEqual(objVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2200
     * @tc.name      testVector06Chapter0022
     * @tc.desc      trimToCurrentLength number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0022';
      let vector = new Vector<number>();
      vector.add(1);
      vector.add(2);
      vector.add(3);
      let length=vector.length;
      vector.trimToCurrentLength();
      let capacity =vector.getCapacity()
      expect(vector.length).assertEqual(3);
      expect(capacity).assertEqual(length);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2300
     * @tc.name      testVector06Chapter0023
     * @tc.desc      trimToCurrentLength Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0023';
      let vector = new Vector<Int8Array>();
      vector.add(new Int8Array([-128]));
      let length=vector.length;
      vector.trimToCurrentLength();
      let capacity =vector.getCapacity()
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2400
     * @tc.name      testVector06Chapter0024
     * @tc.desc      trimToCurrentLength Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0024';
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([Infinity]));
      let length = vector.length;
      vector.trimToCurrentLength();
      let capacity = vector.getCapacity();
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2500
     * @tc.name      testVector06Chapter0025
     * @tc.desc      trimToCurrentLength Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0025';
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([-Infinity]));
      let length = vector.length;
      vector.trimToCurrentLength();
      let capacity = vector.getCapacity();
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2600
     * @tc.name      testVector06Chapter0026
     * @tc.desc      trimToCurrentLength Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0026';
      let vector = new Vector<Float32Array>();
      vector.add(new Float32Array([NaN]));
      let length = vector.length;
      vector.trimToCurrentLength();
      let capacity = vector.getCapacity();
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2700
     * @tc.name      testVector06Chapter0027
     * @tc.desc      trimToCurrentLength string("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0027';
      let vector = new Vector<string>();
      vector.add('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      let length = vector.length;
      vector.trimToCurrentLength();
      let capacity = vector.getCapacity();
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_2800
     * @tc.name      testVector06Chapter0028
     * @tc.desc      trimToCurrentLength number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0028';
      let vector = new Vector<number>();
      vector.add(0);
      let length = vector.length;
      vector.trimToCurrentLength();
      let capacity = vector.getCapacity();
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_2900
     * @tc.name      testVector06Chapter0029
     * @tc.desc      trimToCurrentLength boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0029';
      let vector = new Vector<boolean>();
      vector.add(true);
      let length = vector.length;
      vector.trimToCurrentLength();
      let capacity = vector.getCapacity();
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3000
     * @tc.name      testVector06Chapter0030
     * @tc.desc      trimToCurrentLength Array(special array with props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0030';
      let vector = new Vector<Array<number>>();
      let arr: Array<number> = [];
      arr["abc"] = 111;
      arr["aaa"] = 72;
      vector.add(arr);
      let length = vector.length;
      vector.trimToCurrentLength();
      let capacity = vector.getCapacity();
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3100
     * @tc.name      testVector06Chapter0031
     * @tc.desc      trimToCurrentLength object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0031';
      let vector = new Vector<object>();
      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3];
      }
      vector.add(new C1());
      let length = vector.length;
      vector.trimToCurrentLength();
      let capacity = vector.getCapacity();
      expect(capacity).assertEqual(length);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3200
     * @tc.name      testVector06Chapter0032
     * @tc.desc      toString number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0032';
      let vector = new Vector<number>();
      vector.add(1);
      vector.add(2);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('1,2');
      let nullVector= new Vector<number>();
      let nullStr = nullVector.toString();
      expect(nullStr).assertEqual('');
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3300
     * @tc.name      testVector06Chapter0033
     * @tc.desc      toString Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0033';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([-128]);
      vector.add(int8Arr);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('-128');
      expect(vector.get(0)).assertEqual(int8Arr)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3400
     * @tc.name      testVector06Chapter0034
     * @tc.desc      toString Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0034';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([Infinity]);
      vector.add(float32Arr);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('Infinity');
      expect(vector.get(0)).assertEqual(float32Arr)
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_3500
     * @tc.name      testVector06Chapter0035
     * @tc.desc      toString Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0035';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([-Infinity]);
      vector.add(float32Arr);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('-Infinity');
      expect(vector.get(0)).assertEqual(float32Arr)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3600
     * @tc.name      testVector06Chapter0036
     * @tc.desc      toString Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0036';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([NaN]);
      vector.add(float32Arr);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('NaN');
      expect(vector.get(0)).assertEqual(float32Arr)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3700
     * @tc.name      testVector06Chapter0037
     * @tc.desc      toString string("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0037';
      let vector = new Vector<string>();
      let strVal = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      vector.add(strVal);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~');
      expect(vector.get(0)).assertEqual(strVal)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3800
     * @tc.name      testVector06Chapter0038
     * @tc.desc      toString number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0038';
      let vector = new Vector<number>();
      let numVal = 0;
      vector.add(numVal);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('0');
      expect(vector.get(0)).assertEqual(numVal)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_3900
     * @tc.name      testVector06Chapter0039
     * @tc.desc      toString boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0039';
      let vector = new Vector<boolean>();
      let boolVal = true;
      vector.add(boolVal);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('true');
      expect(vector.get(0)).assertEqual(boolVal)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4000
     * @tc.name      testVector06Chapter0040
     * @tc.desc      toString Array(has NaN/Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0040';
      let vector = new Vector<Array<number>>();
      let arrVal = [72, 101, NaN, Infinity, 108, 111];
      vector.add(arrVal);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('72,101,NaN,Infinity,108,111');
      expect(vector.get(0)).assertEqual(arrVal)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4100
     * @tc.name      testVector06Chapter0041
     * @tc.desc      toString object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0041';
      let vector = new Vector<object>();
      class C1 { a: number = 1; b: string = "test"; c: Array<number> = [1,2,3] }
      let objVal = new C1();
      vector.add(objVal);
      let str = vector.toString();
      expect(typeof str).assertEqual('string');
      expect(str).assertEqual('[object Object]'); // 对象默认 toString 结果
      expect(vector.get(0)).assertEqual(objVal)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4200
     * @tc.name      testVector06Chapter0042
     * @tc.desc      copyToArray number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0042';
      let vector = new Vector<number>();
      let array = new Array<number>();
      vector.add(1);
      vector.add(2);
      vector.copyToArray(array)
      expect(array[0]).assertEqual(1);
      expect(array[1]).assertEqual(2);
      expect(array.length).assertEqual(vector.length);
      array[0] = 108
      expect(vector[0]).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4300
     * @tc.name      testVector06Chapter0043
     * @tc.desc      copyToArray Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0043';
      let vector = new Vector<Int8Array>();
      let array = new Array<Int8Array>();
      let int8Arr = new Int8Array([-128]);
      vector.add(int8Arr);
      vector.copyToArray(array)
      expect(array[0][0]).assertEqual(-128);
      expect(array.length).assertEqual(vector.length);
      array[0] = new Int8Array([108])
      expect(vector[0][0]).assertEqual(-128);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4400
     * @tc.name      testVector06Chapter0044
     * @tc.desc      copyToArray Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0044';
      let vector = new Vector<Float32Array>();
      let array = new Array<Float32Array>();
      let float32Arr = new Float32Array([Infinity]);
      vector.add(float32Arr);
      vector.copyToArray(array)
      expect(array[0][0]).assertEqual(Infinity);
      expect(array.length).assertEqual(vector.length);
      array[0] = new Float32Array([108])
      expect(vector[0][0]).assertEqual(Infinity);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4500
     * @tc.name      testVector06Chapter0045
     * @tc.desc      copyToArray Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0045';
      let vector = new Vector<Float32Array>();
      let array = new Array<Float32Array>();
      let float32Arr = new Float32Array([-Infinity]);
      vector.add(float32Arr);
      vector.copyToArray(array)
      expect(array[0][0]).assertEqual(-Infinity);
      expect(array.length).assertEqual(vector.length);
      array[0] = new Float32Array([108])
      expect(vector[0][0]).assertEqual(-Infinity);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4600
     * @tc.name      testVector06Chapter0046
     * @tc.desc      copyToArray Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0046';
      let vector = new Vector<Float32Array>();
      let array = new Array<Float32Array>();
      let float32Arr = new Float32Array([NaN]);
      vector.add(float32Arr);
      vector.copyToArray(array)
      expect(isNaN(array[0][0])).assertEqual(true); // NaN不能直接相等，需用isNaN
      expect(array.length).assertEqual(vector.length);
      array[0] = new Float32Array([108])
      expect(isNaN(vector[0][0])).assertEqual(true);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4700
     * @tc.name      testVector06Chapter0047
     * @tc.desc      copyToArray string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0047';
      let vector = new Vector<string>();
      let array = new Array<string>();
      let strVal = '👆';
      vector.add(strVal);
      vector.copyToArray(array)
      expect(array[0]).assertEqual('👆');
      expect(array.length).assertEqual(vector.length);
      array[0] = "test"
      expect(vector[0]).assertEqual('👆');
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_4800
     * @tc.name      testVector06Chapter0048
     * @tc.desc      copyToArray number(-0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0048';
      let vector = new Vector<number>();
      let array = new Array<number>();
      let numVal = -0;
      vector.add(numVal);
      vector.copyToArray(array)
      expect(array[0]).assertEqual(0); // -0 toString为0
      expect(array.length).assertEqual(vector.length);
      array[0] = 108
      expect(vector[0]).assertEqual(-0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_4900
     * @tc.name      testVector06Chapter0049
     * @tc.desc      copyToArray boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0049';
      let vector = new Vector<boolean>();
      let array = new Array<boolean>();
      let boolVal = true;
      vector.add(boolVal);
      vector.copyToArray(array)
      expect(array[0]).assertEqual(true);
      expect(array.length).assertEqual(vector.length);
      array[0] = false
      expect(vector[0]).assertEqual(true);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5000
     * @tc.name      testVector06Chapter0050
     * @tc.desc      copyToArray Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0050';
      let vector = new Vector<Array<string | number | undefined | boolean>>();
      let array = new Array<Array<string | number | undefined | boolean>>();
      let arrVal = [72, "abc", true, null, undefined, 108];
      vector.add(arrVal);
      vector.copyToArray(array)
      expect(array[0][0]).assertEqual(72);
      expect(array[0][1]).assertEqual("abc");
      expect(array[0][2]).assertEqual(true);
      expect(array[0][3]).assertEqual(null);
      expect(array[0][4]).assertEqual(undefined);
      expect(array.length).assertEqual(vector.length);
      array[0] = [108];
      expect(vector[0][0]).assertEqual(72);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5100
     * @tc.name      testVector06Chapter0051
     * @tc.desc      copyToArray object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0051';
      let vector = new Vector<object>();
      let array = new Array<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3];
      }

      let objVal = new C1();
      vector.add(objVal);
      vector.copyToArray(array)
      expect((array[0] as C1).a).assertEqual(1);
      expect((array[0] as C1).b).assertEqual("test");
      expect((array[0] as C1).c[0]).assertEqual(1);
      expect(array.length).assertEqual(vector.length);
      array[0] = new C1(); // 修改拷贝对象的属性
      expect(objVal.a).assertEqual(1); // 原对象属性不变（浅拷贝验证）
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5200
     * @tc.name      testVector06Chapter0052
     * @tc.desc      getFirstElement number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0052';
      let vector = new Vector<number>();
      vector.add(1);
      expect(vector.getFirstElement()).assertEqual(1);
      vector.add(2);
      expect(vector.getFirstElement()).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5300
     * @tc.name      testVector06Chapter0053
     * @tc.desc      getFirstElement string test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0053';
      let vector = new Vector<string>();
      expect(vector.getFirstElement()).assertUndefined()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5400
     * @tc.name      testVector06Chapter0054
     * @tc.desc      getFirstElement Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0054';
      let vector = new Vector<Int8Array>();
      let int8Array = new Int8Array([-128]);
      vector.add(int8Array);
      vector.add(new Int8Array([-128]));
      expect(vector.getFirstElement()).assertEqual(int8Array);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5500
     * @tc.name      testVector06Chapter0055
     * @tc.desc      getFirstElement Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0055';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([Infinity]);
      vector.add(float32Array);
      vector.add(new Float32Array([Infinity]));
      expect(vector.getFirstElement()).assertEqual(float32Array);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_5600
     * @tc.name      testVector06Chapter0056
     * @tc.desc      getFirstElement Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0056';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([-Infinity]);
      vector.add(float32Array);
      vector.add(new Float32Array([-Infinity]));
      expect(vector.getFirstElement()).assertEqual(float32Array);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5700
     * @tc.name      testVector06Chapter0057
     * @tc.desc      getFirstElement Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0057';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([NaN]);
      vector.add(float32Array);
      vector.add(new Float32Array([NaN]));
      expect(vector.getFirstElement()).assertEqual(float32Array);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5800
     * @tc.name      testVector06Chapter0058
     * @tc.desc      getFirstElement string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0058';
      let vector = new Vector<string>();
      let strVal = '👆';
      vector.add(strVal);
      vector.add('👆');
      expect(vector.getFirstElement()).assertEqual(strVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_5900
     * @tc.name      testVector06Chapter0059
     * @tc.desc      getFirstElement number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0059';
      let vector = new Vector<number>();
      let numVal = 0;
      vector.add(numVal);
      vector.add(0);
      expect(vector.getFirstElement()).assertEqual(numVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6000
     * @tc.name      testVector06Chapter0060
     * @tc.desc      getFirstElement boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0060';
      let vector = new Vector<boolean>();
      let boolVal = true;
      vector.add(boolVal);
      vector.add(true);
      expect(vector.getFirstElement()).assertEqual(boolVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6100
     * @tc.name      testVector06Chapter0061
     * @tc.desc      getFirstElement Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0061';
      let vector = new Vector<Array<string | number | undefined | boolean | null>>();
      let arrVal = [72, "abc", true, null, undefined, 108];
      vector.add(arrVal);
      vector.add([72, "abc", true, null, undefined, 108]);
      expect(vector.getFirstElement()).assertEqual(arrVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6200
     * @tc.name      testVector06Chapter0062
     * @tc.desc      getFirstElement object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0062';
      let vector = new Vector<object>();
      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3];
      }
      let objVal = new C1();
      vector.add(objVal);
      vector.add(new C1());
      expect(vector.getFirstElement()).assertEqual(objVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6300
     * @tc.name      testVector06Chapter0063
     * @tc.desc      getLastElement number test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0063';
      let vector = new Vector<number>();
      vector.add(1);
      expect(vector.getLastElement()).assertEqual(1);
      vector.add(2);
      expect(vector.getLastElement()).assertEqual(2);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6400
     * @tc.name      testVector06Chapter0064
     * @tc.desc      getLastElement string test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0064';
      let vector = new Vector<string>();
      expect(vector.getLastElement()).assertUndefined()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6500
     * @tc.name      testVector06Chapter0065
     * @tc.desc      getLastElement Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0065';
      let vector = new Vector<Int8Array>();
      let int8Array = new Int8Array([-128]);
      vector.add(new Int8Array([-128]));
      vector.add(int8Array);
      expect(vector.getLastElement()).assertEqual(int8Array);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_6600
     * @tc.name      testVector06Chapter0066
     * @tc.desc      getLastElement Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0066';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([Infinity]);
      vector.add(new Float32Array([Infinity]));
      vector.add(float32Array);
      expect(vector.getLastElement()).assertEqual(float32Array);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6700
     * @tc.name      testVector06Chapter0067
     * @tc.desc      getLastElement Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0067';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([-Infinity]);
      vector.add(new Float32Array([-Infinity]));
      vector.add(float32Array);
      expect(vector.getLastElement()).assertEqual(float32Array);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6800
     * @tc.name      testVector06Chapter0068
     * @tc.desc      getLastElement Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0068';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([NaN]);
      vector.add(new Float32Array([NaN]));
      vector.add(float32Array);
      expect(vector.getLastElement()).assertEqual(float32Array);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_6900
     * @tc.name      testVector06Chapter0069
     * @tc.desc      getLastElement string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0069';
      let vector = new Vector<string>();
      let strVal = '👆';
      vector.add(strVal);
      vector.add('👆');
      expect(vector.getLastElement()).assertEqual(strVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7000
     * @tc.name      testVector06Chapter0070
     * @tc.desc      getLastElement number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0070';
      let vector = new Vector<number>();
      let numVal = 0;
      vector.add(numVal);
      vector.add(0);
      expect(vector.getLastElement()).assertEqual(numVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7100
     * @tc.name      testVector06Chapter0071
     * @tc.desc      getLastElement boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0071';
      let vector = new Vector<boolean>();
      let boolVal = true;
      vector.add(boolVal);
      vector.add(true);
      expect(vector.getLastElement()).assertEqual(boolVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7200
     * @tc.name      testVector06Chapter0072
     * @tc.desc      getLastElement Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0072';
      let vector = new Vector<Array<string | number | undefined | boolean | null>>();
      let arrVal = [72, "abc", true, null, undefined, 108];
      vector.add([72, "abc", true, null, undefined, 108]);
      vector.add(arrVal);
      expect(vector.getLastElement()).assertEqual(arrVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7300
     * @tc.name      testVector06Chapter0073
     * @tc.desc      getLastElement object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0073';
      let vector = new Vector<object>();
      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3];
      }
      let objVal = new C1();
      vector.add(new C1());
      vector.add(objVal);
      expect(vector.getLastElement()).assertEqual(objVal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7400
     * @tc.name      testVector06Chapter0074
     * @tc.desc      getLastIndexFrom string test  (match normal element with different fromIndex)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0074';
      let vector = new Vector<string>();
      vector.add('a');
      vector.add('b');
      vector.add('a');
      let result1 = vector.getLastIndexFrom('a', 1);
      expect(result1).assertEqual(0);
      let result2 = vector.getLastIndexFrom('a', 2);
      expect(result2).assertEqual(2);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7500
     * @tc.name      testVector06Chapter0075
     * @tc.desc      getLastIndexFrom string test (return -1 when no matching element)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0075';
      let vector = new Vector<string>();
      vector.add('a');
      vector.add('b');
      vector.add('a');
      let result = vector.getLastIndexFrom('c', 1);
      expect(result).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7600
     * @tc.name      testVector06Chapter0076
     * @tc.desc      getLastIndexFrom string test (return -1 when calling on empty Vector)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0076';
      let vector = new Vector<string>();
      try {
        let result = vector.getLastIndexFrom('a', 0);
        expect().assertFalse()
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7700
     * @tc.name      testVector06Chapter0077
     * @tc.desc      getLastIndexFrom Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0077';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([-128]);
      vector.add(int8Arr);
      vector.add(new Int8Array([108]));
      let result = vector.getLastIndexFrom(int8Arr, 1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7800
     * @tc.name      testVector06Chapter0078
     * @tc.desc      getLastIndexFrom Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0078';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([Infinity]);
      vector.add(float32Arr);
      vector.add(new Float32Array([108]));
      let result = vector.getLastIndexFrom(float32Arr, 1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_7900
     * @tc.name      testVector06Chapter0079
     * @tc.desc      getLastIndexFrom Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0079';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([-Infinity]);
      vector.add(float32Arr);
      vector.add(new Float32Array([108]));
      let result = vector.getLastIndexFrom(float32Arr, 1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8000
     * @tc.name      testVector06Chapter0080
     * @tc.desc      getLastIndexFrom Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0080';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([NaN]);
      vector.add(float32Arr);
      vector.add(new Float32Array([108]));
      let result = vector.getLastIndexFrom(float32Arr, 1);
      // 注意：NaN !== NaN，若Vector的index逻辑是引用比较则断言0，值比较则需特殊处理
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8100
     * @tc.name      testVector06Chapter0081
     * @tc.desc      getLastIndexFrom string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0081';
      let vector = new Vector<string>();
      let strVal = '👆';
      vector.add(strVal);
      vector.add("108");
      let result = vector.getLastIndexFrom(strVal, 1);
      expect(result).assertEqual(0);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_8200
     * @tc.name      testVector06Chapter0082
     * @tc.desc      getLastIndexFrom number(2**3) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0082';
      let vector = new Vector<number>();
      let numVal = 2**3;
      vector.add(numVal);
      vector.add(108);
      let result = vector.getLastIndexFrom(numVal, 1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8300
     * @tc.name      testVector06Chapter0083
     * @tc.desc      getLastIndexFrom boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0083';
      let vector = new Vector<boolean>();
      let boolVal = true;
      vector.add(boolVal);
      vector.add(false);
      let result = vector.getLastIndexFrom(boolVal, 1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8400
     * @tc.name      testVector06Chapter0084
     * @tc.desc      getLastIndexFrom Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0084';
      let vector = new Vector<Array<string | number | undefined | boolean | null>>();
      let arrVal = [72, "abc", true, null, undefined, 108];
      vector.add(arrVal);
      vector.add([108]);
      let result = vector.getLastIndexFrom(arrVal, 1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8500
     * @tc.name      testVector06Chapter0085
     * @tc.desc      getLastIndexFrom object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0085';
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3];
      }

      let objVal = new C1();
      vector.add(objVal);
      vector.add(new C1());
      let result = vector.getLastIndexFrom(objVal, 1);
      expect(result).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8600
     * @tc.name      testVector06Chapter0086
     * @tc.desc      getIndexFrom string test  (match normal element with different fromIndex)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0086';
      let vector = new Vector<string>();
      vector.add('a');
      vector.add('b');
      vector.add('a');
      let result1 = vector.getIndexFrom('a', 0);
      expect(result1).assertEqual(0);
      let result2 = vector.getIndexFrom('a', 1);
      expect(result2).assertEqual(2);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8700
     * @tc.name      testVector06Chapter0087
     * @tc.desc      getIndexFrom number test (return -1 when no matching element)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0087';
      let vector = new Vector<string>();
      vector.add('a');
      vector.add('b');
      vector.add('a');
      let result = vector.getIndexFrom('c', 1);
      expect(result).assertEqual(-1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8800
     * @tc.name      testVector06Chapter0088
     * @tc.desc      getIndexFrom string test (return -1 when calling on empty Vector)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0088';
      let vector = new Vector<string>();
      try {
        let result = vector.getIndexFrom('a', 0);
        expect().assertFalse()
      } catch (error) {
        expect(error !== null).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_8900
     * @tc.name      testVector06Chapter0089
     * @tc.desc      getIndexFrom Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0089';
      let vector = new Vector<Int8Array>();
      let int8Arr = new Int8Array([-128]);
      vector.add(new Int8Array([108]));
      vector.add(int8Arr);
      let result = vector.getIndexFrom(int8Arr, 0);
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9000
     * @tc.name      testVector06Chapter0090
     * @tc.desc      getIndexFrom Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0090';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([Infinity]);
      vector.add(new Float32Array([108]));
      vector.add(float32Arr);
      let result = vector.getIndexFrom(float32Arr, 0);
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9100
     * @tc.name      testVector06Chapter0091
     * @tc.desc      getIndexFrom Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0091';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([-Infinity]);
      vector.add(new Float32Array([108]));
      vector.add(float32Arr);
      let result = vector.getIndexFrom(float32Arr, 0);
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9200
     * @tc.name      testVector06Chapter0092
     * @tc.desc      getIndexFrom Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0092';
      let vector = new Vector<Float32Array>();
      let float32Arr = new Float32Array([NaN]);
      vector.add(new Float32Array([108]));
      vector.add(float32Arr);
      let result = vector.getIndexFrom(float32Arr, 0);
      expect(result).assertEqual(1);
    })


    /**
     * @tc.number    SUB_VECTOR_TEST06_9300
     * @tc.name      testVector06Chapter0093
     * @tc.desc      getIndexFrom string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0093';
      let vector = new Vector<string>();
      let strVal = '👆';
      vector.add("108");
      vector.add(strVal);
      let result = vector.getIndexFrom(strVal, 0);
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9400
     * @tc.name      testVector06Chapter0094
     * @tc.desc      getIndexFrom number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0094';
      let vector = new Vector<number>();
      let numVal = 0;
      vector.add(108);
      vector.add(numVal);
      let result = vector.getIndexFrom(numVal, 0);
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9500
     * @tc.name      testVector06Chapter0095
     * @tc.desc      getIndexFrom boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0095';
      let vector = new Vector<boolean>();
      let boolVal = true;
      vector.add(false);
      vector.add(boolVal);
      let result = vector.getIndexFrom(boolVal, 0);
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9600
     * @tc.name      testVector06Chapter0096
     * @tc.desc      getIndexFrom Array(has NaN/Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0096';
      let vector = new Vector<Array<number>>();
      let arrVal = [72, 101, NaN, Infinity, 108, 111];
      vector.add([108]);
      vector.add(arrVal);
      let result = vector.getIndexFrom(arrVal, 0);
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9700
     * @tc.name      testVector06Chapter0097
     * @tc.desc      getIndexFrom object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0097';
      let vector = new Vector<object>();

      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3];
      }

      let objVal = new C1();
      vector.add(new C1());
      vector.add(objVal);
      let result = vector.getIndexFrom(objVal, 0);
      expect(result).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9800
     * @tc.name      testVector06Chapter0098
     * @tc.desc      setLength string test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0098';
      let vector = new Vector<string>();
      vector.setLength(2);
      vector.set(0,'a');
      vector.set(1,'b');
      expect(vector.get(0)).assertEqual('a')
      expect(vector.get(1)).assertEqual('b')
      vector.setLength(1);
      expect(vector.get(0)).assertEqual('a')
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_9900
     * @tc.name      testVector06Chapter0099
     * @tc.desc      setLength Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0099';
      let vector = new Vector<Int8Array>();
      vector.setLength(2)
      let int8Array = new Int8Array([-128]);
      vector.set(0,int8Array);
      vector.set(1,new Int8Array([108]));
      expect(vector.get(0)).assertEqual(int8Array)
      expect(vector.get(1)[0]).assertEqual(108)
      vector.setLength(1);
      expect(vector.get(0)).assertEqual(int8Array)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_10000
     * @tc.name      testVector06Chapter0100
     * @tc.desc      setLength string("") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0100';
      let vector = new Vector<string>();
      vector.setLength(2)
      let strVal = "";
      vector.set(0,strVal);
      vector.set(1,'108');
      expect(vector.get(0)).assertEqual(strVal)
      expect(vector.get(1)).assertEqual('108')
      vector.setLength(1);
      expect(vector.get(0)).assertEqual(strVal)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_10100
     * @tc.name      testVector06Chapter0101
     * @tc.desc      setLength number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0101';
      let vector = new Vector<number>();
      vector.setLength(2)
      let numVal = 0;
      vector.set(0,numVal);
      vector.set(1,108);
      expect(vector.get(0)).assertEqual(numVal)
      expect(vector.get(1)).assertEqual(108)
      vector.setLength(1);
      expect(vector.get(0)).assertEqual(numVal)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_10200
     * @tc.name      testVector06Chapter0102
     * @tc.desc      setLength boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0102';
      let vector = new Vector<boolean>();
      vector.setLength(2)
      let boolVal = true;
      vector.set(0,boolVal);
      vector.set(1,false);
      expect(vector.get(0)).assertEqual(boolVal)
      expect(vector.get(1)).assertEqual(false)
      vector.setLength(1);
      expect(vector.get(0)).assertEqual(boolVal)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_10300
     * @tc.name      testVector06Chapter0103
     * @tc.desc      setLength Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0103';
      let vector = new Vector<Array<string | number | undefined | boolean | null>>();
      vector.setLength(2)
      let arrVal = [72, "abc", true, null, undefined, 108];
      vector.set(0,arrVal);
      vector.set(1,[108]);
      expect(vector.get(0)).assertEqual(arrVal)
      expect(vector.get(1)[0]).assertEqual(108)
      vector.setLength(1);
      expect(vector.get(0)).assertEqual(arrVal)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_10400
     * @tc.name      testVector06Chapter0104
     * @tc.desc      setLength object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0104';
      let vector = new Vector<object>();
      vector.setLength(2)
      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = [1, 2, 3];
      }
      let objVal = new C1();
      vector.set(0,objVal);
      vector.set(1,new C1());
      expect(vector.get(0)).assertEqual(objVal)

      vector.setLength(1);
      expect(vector.get(0)).assertEqual(objVal)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_10500
     * @tc.name      testVector06Chapter0105
     * @tc.desc      get string test (normal index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0105';
      let vector = new Vector<string>();
      vector.add("Hello");
      vector.add("World");
      expect(vector.get(0)).assertEqual("Hello");
      expect(vector.get(1)).assertEqual("World");
    });

    /**
     * @tc.number    SUB_VECTOR_TEST06_10600
     * @tc.name      testVector06Chapter0106
     * @tc.desc      get string test (index out of bounds)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0106';
      let hasThrown = false;
      let errorType = '';
      try {
        let vector = new Vector<string>();
        vector.add("Hello");
        vector.add("World");
        vector.get(2);
        hasThrown = false;
      } catch (error) {
        hasThrown = true;
        errorType = error?.name || error?.constructor?.name;
      }
      expect(hasThrown).assertTrue();
      expect(errorType).assertEqual("RangeError");
    });

    /**
     * @tc.number    SUB_VECTOR_TEST06_10700
     * @tc.name      testVector06Chapter0107
     * @tc.desc      get string test (empty vector)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0107';
      let hasThrown = false;
      let errorType = '';
      try {
        let vector = new Vector<string>();
        vector.get(0);
        hasThrown = false;
      } catch (error) {
        hasThrown = true;
        errorType = error?.name || error?.constructor?.name;
      }
      expect(hasThrown).assertTrue();
      expect(errorType).assertEqual("RangeError"); // 按实际异常类型调整
    });

    /**
     * @tc.number    SUB_VECTOR_TEST06_10800
     * @tc.name      testVector06Chapter0108
     * @tc.desc      get Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0108';
      let vector = new Vector<Int8Array>();
      let int8Array = new Int8Array([-128]);
      vector.add(int8Array);
      expect(vector.get(0)).assertEqual(int8Array)
      expect(vector.get(0)[0]).assertEqual(-128)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_10900
     * @tc.name      testVector06Chapter0109
     * @tc.desc      get Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0109';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([Infinity]);
      vector.add(float32Array);
      expect(vector.get(0)).assertEqual(float32Array)
      expect(vector.get(0)[0]).assertEqual(Infinity)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_11000
     * @tc.name      testVector06Chapter0110
     * @tc.desc      get Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0110';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([-Infinity]);
      vector.add(float32Array);
      expect(vector.get(0)).assertEqual(float32Array)
      expect(vector.get(0)[0]).assertEqual(-Infinity)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_11100
     * @tc.name      testVector06Chapter0111
     * @tc.desc      get Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0111';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([NaN]);
      vector.add(float32Array);
      expect(vector.get(0)).assertEqual(float32Array)
      expect(isNaN(vector.get(0)[0])).assertTrue() // NaN不能直接断言相等
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_11200
     * @tc.name      testVector06Chapter0112
     * @tc.desc      get string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0112';
      let vector = new Vector<string>();
      let strVal = '👆';
      vector.add(strVal);
      expect(vector.get(0)).assertEqual(strVal)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_11300
     * @tc.name      testVector06Chapter0113
     * @tc.desc      get number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0113';
      let vector = new Vector<number>();
      let numVal = 0;
      vector.add(numVal);
      expect(vector.get(0)).assertEqual(numVal)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_11400
     * @tc.name      testVector06Chapter0114
     * @tc.desc      get boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0114';
      let vector = new Vector<boolean>();
      let boolVal = true;
      vector.add(boolVal);
      expect(vector.get(0)).assertEqual(boolVal)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_11500
     * @tc.name      testVector06Chapter0115
     * @tc.desc      get Array(Contains non-numeric types) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0115", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0115';
      let vector = new Vector<Array<string | number | undefined | boolean | null>>();
      let arrVal = [72, "abc", true, null, undefined, 108];
      vector.add(arrVal);
      expect(vector.get(0)).assertEqual(arrVal)
      expect(vector.get(0)[0]).assertEqual(72)
      expect(vector.get(0)[1]).assertEqual("abc")
      expect(vector.get(0)[2]).assertEqual(true)
      expect(vector.get(0)[3]).assertEqual(null)
      expect(vector.get(0)[4]).assertEqual(undefined)
      expect(vector.get(0)[5]).assertEqual(108)
      expect(vector.length).assertEqual(1)
    })

    /**
     * @tc.number    SUB_VECTOR_TEST06_11600
     * @tc.name      testVector06Chapter0116
     * @tc.desc      get object({a:1, b:"test", c:[1,2,3]}) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector06Chapter0116", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector06Chapter0116';
      let vector = new Vector<object>();
      let numArr= [1, 2, 3];
      class C1 {
        a: number = 1;
        b: string = "test";
        c: Array<number> = numArr;
      }
      let objVal = new C1();
      vector.add(objVal);
      expect(vector.get(0)).assertEqual(objVal)
      expect((vector.get(0) as C1).a).assertEqual(1)
      expect((vector.get(0) as C1).b).assertEqual("test")
      expect((vector.get(0) as C1).c).assertEqual(numArr)
      expect(vector.length).assertEqual(1)
    })

  })
}