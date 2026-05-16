import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest07() {
  describe('VectorTest07', () => {
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
     * @tc.number    SUB_VECTOR_TEST07_0100
     * @tc.name      testVector07Chapter0001
     * @tc.desc      set(index, value) test (normal valid index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0001';
      let vector = new Vector<number>();
      vector.add(1);
      vector.set(0, 2);
      expect(vector.get(0)).assertEqual(2);
      expect(vector.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_VECTOR_TEST07_0200
     * @tc.name      testVector07Chapter0002
     * @tc.desc      set(index, value) test (positive index out of bounds)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0002';
      let hasThrown = false;
      let errorType = '';
      try {
        let vector = new Vector<number>();
        vector.setLength(1);
        vector.set(1, 2);
        hasThrown = false;
      } catch (error) {
        hasThrown = true;
        errorType = error?.name || error?.constructor?.name;
      }
      expect(hasThrown).assertTrue();
      expect(errorType).assertEqual("RangeError");
    });

    /**
     * @tc.number    SUB_VECTOR_TEST07_0300
     * @tc.name      testVector07Chapter0003
     * @tc.desc      set(index, value) test (negative index)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0003';
      let hasThrown = false;
      let errorType = '';
      try {
        let vector = new Vector<number>();
        vector.set(-1, 2);
        hasThrown = false;
      } catch (error) {
        hasThrown = true;
        errorType = error?.name || error?.constructor?.name;
      }
      expect(hasThrown).assertTrue();
      expect(errorType).assertEqual("RangeError");
    });

    /**
     * @tc.number    SUB_VECTOR_TEST07_0400
     * @tc.name      testVector07Chapter0004
     * @tc.desc      set(index, value) test (index is a float)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0004';
      let hasThrown = false;
      let errorType = '';
      try {
        let vector = new Vector<number>();
        vector.set(1.1, 2);
        hasThrown = false;
      } catch (error) {
        hasThrown = true;
        errorType = error?.name || error?.constructor?.name;
      }
      expect(hasThrown).assertTrue();
      expect(errorType).assertEqual("RangeError");
    });

    /**
     * @tc.number    SUB_VECTOR_TEST07_0500
     * @tc.name      testVector07Chapter0005
     * @tc.desc      set Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0005';
      let vector = new Vector<Int8Array>();
      let int8Array = new Int8Array([-128]);
      vector.add(new Int8Array([108]));
      vector.set(0,int8Array);
      expect(vector[0]).assertEqual(int8Array);
      expect(vector[0][0]).assertEqual(-128);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_0600
     * @tc.name      testVector07Chapter0006
     * @tc.desc      set Int8Array([127]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0006';
      let vector = new Vector<Int8Array>();
      let int8Array = new Int8Array([127]);
      vector.add(new Int8Array([108]));
      vector.set(0,int8Array);
      expect(vector[0]).assertEqual(int8Array);
      expect(vector[0][0]).assertEqual(127);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_0700
     * @tc.name      testVector07Chapter0007
     * @tc.desc      set Int8Array([-129]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0007';
      let vector = new Vector<Int8Array>();
      let int8Array = new Int8Array([-129]);
      vector.add(new Int8Array([108]));
      vector.set(0,int8Array);
      expect(vector[0]).assertEqual(int8Array);
      expect(vector[0][0]).assertEqual(127);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_0800
     * @tc.name      testVector07Chapter0008
     * @tc.desc      set Int8Array([128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0008';
      let vector = new Vector<Int8Array>();
      let int8Array = new Int8Array([128]);
      vector.add(new Int8Array([108]));
      vector.set(0,int8Array);
      expect(vector[0]).assertEqual(int8Array);
      expect(vector[0][0]).assertEqual(-128);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_0900
     * @tc.name      testVector07Chapter0009
     * @tc.desc      set Int8Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0009';
      let vector = new Vector<Int8Array>();
      let int8Array = new Int8Array([0]);
      vector.add(new Int8Array([108]));
      vector.set(0,int8Array);
      expect(vector[0]).assertEqual(int8Array);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1000
     * @tc.name      testVector07Chapter0010
     * @tc.desc      set Uint8Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0010';
      let vector = new Vector<Uint8Array>();
      let uint8Array = new Uint8Array([0]);
      vector.add(new Uint8Array([108]));
      vector.set(0,uint8Array);
      expect(vector[0]).assertEqual(uint8Array);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1100
     * @tc.name      testVector07Chapter0011
     * @tc.desc      set Uint8Array([255]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0011';
      let vector = new Vector<Uint8Array>();
      let uint8Array = new Uint8Array([255]);
      vector.add(new Uint8Array([108]));
      vector.set(0,uint8Array);
      expect(vector[0]).assertEqual(uint8Array);
      expect(vector[0][0]).assertEqual(255);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1200
     * @tc.name      testVector07Chapter0012
     * @tc.desc      set Uint8Array([256]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0012';
      let vector = new Vector<Uint8Array>();
      let uint8Array = new Uint8Array([256]);
      vector.add(new Uint8Array([108]));
      vector.set(0,uint8Array);
      expect(vector[0]).assertEqual(uint8Array);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1300
     * @tc.name      testVector07Chapter0013
     * @tc.desc      set Uint8Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0013';
      let vector = new Vector<Uint8Array>();
      let uint8Array = new Uint8Array([-1]);
      vector.add(new Uint8Array([108]));
      vector.set(0,uint8Array);
      expect(vector[0]).assertEqual(uint8Array);
      expect(vector[0][0]).assertEqual(255);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1400
     * @tc.name      testVector07Chapter0014
     * @tc.desc      set Uint8ClampedArray([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0014';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArray = new Uint8ClampedArray([0]);
      vector.add(new Uint8ClampedArray([108]));
      vector.set(0,uint8ClampedArray);
      expect(vector[0]).assertEqual(uint8ClampedArray);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1500
     * @tc.name      testVector07Chapter0015
     * @tc.desc      set Uint8ClampedArray([255]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0015';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArray = new Uint8ClampedArray([255]);
      vector.add(new Uint8ClampedArray([108]));
      vector.set(0,uint8ClampedArray);
      expect(vector[0]).assertEqual(uint8ClampedArray);
      expect(vector[0][0]).assertEqual(255);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1600
     * @tc.name      testVector07Chapter0016
     * @tc.desc      set Uint8ClampedArray([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0016';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArray = new Uint8ClampedArray([-1]);
      vector.add(new Uint8ClampedArray([108]));
      vector.set(0,uint8ClampedArray);
      expect(vector[0]).assertEqual(uint8ClampedArray);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1700
     * @tc.name      testVector07Chapter0017
     * @tc.desc      set Uint8ClampedArray([256]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0017';
      let vector = new Vector<Uint8ClampedArray>();
      let uint8ClampedArray = new Uint8ClampedArray([256]);
      vector.add(new Uint8ClampedArray([108]));
      vector.set(0,uint8ClampedArray);
      expect(vector[0]).assertEqual(uint8ClampedArray);
      expect(vector[0][0]).assertEqual(255);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1800
     * @tc.name      testVector07Chapter0018
     * @tc.desc      set Int16Array([-32768]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0018';
      let vector = new Vector<Int16Array>();
      let int16Array = new Int16Array([-32768]);
      vector.add(new Int16Array([108]));
      vector.set(0,int16Array);
      expect(vector[0]).assertEqual(int16Array);
      expect(vector[0][0]).assertEqual(-32768);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_1900
     * @tc.name      testVector07Chapter0019
     * @tc.desc      set Int16Array([32767]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0019';
      let vector = new Vector<Int16Array>();
      let int16Array = new Int16Array([32767]);
      vector.add(new Int16Array([108]));
      vector.set(0,int16Array);
      expect(vector[0]).assertEqual(int16Array);
      expect(vector[0][0]).assertEqual(32767);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2000
     * @tc.name      testVector07Chapter0020
     * @tc.desc      set Int16Array([-32769]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0020';
      let vector = new Vector<Int16Array>();
      let int16Array = new Int16Array([-32769]);
      vector.add(new Int16Array([108]));
      vector.set(0,int16Array);
      expect(vector[0]).assertEqual(int16Array);
      expect(vector[0][0]).assertEqual(32767);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2100
     * @tc.name      testVector07Chapter0021
     * @tc.desc      set Int16Array([32768]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0021';
      let vector = new Vector<Int16Array>();
      let int16Array = new Int16Array([32768]);
      vector.add(new Int16Array([108]));
      vector.set(0,int16Array);
      expect(vector[0]).assertEqual(int16Array);
      expect(vector[0][0]).assertEqual(-32768);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2200
     * @tc.name      testVector07Chapter0022
     * @tc.desc      set Uint16Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0022';
      let vector = new Vector<Uint16Array>();
      let uint16Array = new Uint16Array([0]);
      vector.add(new Uint16Array([108]));
      vector.set(0,uint16Array);
      expect(vector[0]).assertEqual(uint16Array);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2300
     * @tc.name      testVector07Chapter0023
     * @tc.desc      set Uint16Array([65535]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0023';
      let vector = new Vector<Uint16Array>();
      let uint16Array = new Uint16Array([65535]);
      vector.add(new Uint16Array([108]));
      vector.set(0,uint16Array);
      expect(vector[0]).assertEqual(uint16Array);
      expect(vector[0][0]).assertEqual(65535);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2400
     * @tc.name      testVector07Chapter0024
     * @tc.desc      set Uint16Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0024';
      let vector = new Vector<Uint16Array>();
      let uint16Array = new Uint16Array([-1]);
      vector.add(new Uint16Array([108]));
      vector.set(0,uint16Array);
      expect(vector[0]).assertEqual(uint16Array);
      expect(vector[0][0]).assertEqual(65535);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2500
     * @tc.name      testVector07Chapter0025
     * @tc.desc      set Uint16Array([65536]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0025';
      let vector = new Vector<Uint16Array>();
      let uint16Array = new Uint16Array([65536]);
      vector.add(new Uint16Array([108]));
      vector.set(0,uint16Array);
      expect(vector[0]).assertEqual(uint16Array);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2600
     * @tc.name      testVector07Chapter0026
     * @tc.desc      set Int32Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0026';
      let vector = new Vector<Int32Array>();
      let int32Array = new Int32Array([0]);
      vector.add(new Int32Array([108]));
      vector.set(0,int32Array);
      expect(vector[0]).assertEqual(int32Array);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2700
     * @tc.name      testVector07Chapter0027
     * @tc.desc      set Int32Array([2147483647]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0027';
      let vector = new Vector<Int32Array>();
      let int32Array = new Int32Array([2147483647]);
      vector.add(new Int32Array([108]));
      vector.set(0,int32Array);
      expect(vector[0]).assertEqual(int32Array);
      expect(vector[0][0]).assertEqual(2147483647);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2800
     * @tc.name      testVector07Chapter0028
     * @tc.desc      set Int32Array([-2147483648]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0028';
      let vector = new Vector<Int32Array>();
      let int32Array = new Int32Array([-2147483648]);
      vector.add(new Int32Array([108]));
      vector.set(0,int32Array);
      expect(vector[0]).assertEqual(int32Array);
      expect(vector[0][0]).assertEqual(-2147483648);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_2900
     * @tc.name      testVector07Chapter0029
     * @tc.desc      set Int32Array([-2147483649]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0029';
      let vector = new Vector<Int32Array>();
      let int32Array = new Int32Array([-2147483649]);
      vector.add(new Int32Array([108]));
      vector.set(0,int32Array);
      expect(vector[0]).assertEqual(int32Array);
      expect(vector[0][0]).assertEqual(2147483647);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3000
     * @tc.name      testVector07Chapter0030
     * @tc.desc      set Int32Array([2147483648]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0030';
      let vector = new Vector<Int32Array>();
      let int32Array = new Int32Array([2147483648]);
      vector.add(new Int32Array([108]));
      vector.set(0,int32Array);
      expect(vector[0]).assertEqual(int32Array);
      expect(vector[0][0]).assertEqual(-2147483648);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3100
     * @tc.name      testVector07Chapter0031
     * @tc.desc      set Uint32Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0031';
      let vector = new Vector<Uint32Array>();
      let uint32Array = new Uint32Array([0]);
      vector.add(new Uint32Array([108]));
      vector.set(0,uint32Array);
      expect(vector[0]).assertEqual(uint32Array);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3200
     * @tc.name      testVector07Chapter0032
     * @tc.desc      set Uint32Array([4294967295]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0032';
      let vector = new Vector<Uint32Array>();
      let uint32Array = new Uint32Array([4294967295]);
      vector.add(new Uint32Array([108]));
      vector.set(0,uint32Array);
      expect(vector[0]).assertEqual(uint32Array);
      expect(vector[0][0]).assertEqual(4294967295);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3300
     * @tc.name      testVector07Chapter0033
     * @tc.desc      set Uint32Array([4294967296]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0033';
      let vector = new Vector<Uint32Array>();
      let uint32Array = new Uint32Array([4294967296]);
      vector.add(new Uint32Array([108]));
      vector.set(0,uint32Array);
      expect(vector[0]).assertEqual(uint32Array);
      expect(vector[0][0]).assertEqual(0);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3400
     * @tc.name      testVector07Chapter0034
     * @tc.desc      set Uint32Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0034';
      let vector = new Vector<Uint32Array>();
      let uint32Array = new Uint32Array([-1]);
      vector.add(new Uint32Array([108]));
      vector.set(0,uint32Array);
      expect(vector[0]).assertEqual(uint32Array);
      expect(vector[0][0]).assertEqual(4294967295);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3500
     * @tc.name      testVector07Chapter0035
     * @tc.desc      set Float32Array([-3.4028234663852886e38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0035';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([-3.4028234663852886e38]);
      vector.add(new Float32Array([108]));
      vector.set(0,float32Array);
      expect(vector[0]).assertEqual(float32Array);
      expect(vector[0][0]).assertEqual(-3.4028234663852886e38);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3600
     * @tc.name      testVector07Chapter0036
     * @tc.desc      set Float32Array([3.4028234663852886e38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0036';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([3.4028234663852886e38]);
      vector.add(new Float32Array([108]));
      vector.set(0,float32Array);
      expect(vector[0]).assertEqual(float32Array);
      expect(vector[0][0]).assertEqual(3.4028234663852886e38);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3700
     * @tc.name      testVector07Chapter0037
     * @tc.desc      set Float32Array([-3.5e38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0037';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([-3.5e38]);
      vector.add(new Float32Array([108]));
      vector.set(0,float32Array);
      expect(vector[0]).assertEqual(float32Array);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3800
     * @tc.name      testVector07Chapter0038
     * @tc.desc      set Float32Array([3.5e38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0038';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([3.5e38]);
      vector.add(new Float32Array([108]));
      vector.set(0,float32Array);
      expect(vector[0]).assertEqual(float32Array);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_3900
     * @tc.name      testVector07Chapter0039
     * @tc.desc      set Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0039';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([Infinity]);
      vector.add(new Float32Array([108]));
      vector.set(0,float32Array);
      expect(vector[0]).assertEqual(float32Array);
      expect(vector[0][0]).assertEqual(Infinity);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4000
     * @tc.name      testVector07Chapter0040
     * @tc.desc      set Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0040';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([-Infinity]);
      vector.add(new Float32Array([108]));
      vector.set(0,float32Array);
      expect(vector[0]).assertEqual(float32Array);
      expect(vector[0][0]).assertEqual(-Infinity);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4100
     * @tc.name      testVector07Chapter0041
     * @tc.desc      set Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0041';
      let vector = new Vector<Float32Array>();
      let float32Array = new Float32Array([NaN]);
      vector.add(new Float32Array([108]));
      vector.set(0,float32Array);
      expect(vector[0]).assertEqual(float32Array);
      expect(isNaN(vector[0][0])).assertTrue();
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4200
     * @tc.name      testVector07Chapter0042
     * @tc.desc      set Float64Array([-1.7976931348623157e308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0042';
      let vector = new Vector<Float64Array>();
      let float64Array = new Float64Array([-1.7976931348623157e308]);
      vector.add(new Float64Array([108]));
      vector.set(0,float64Array);
      expect(vector[0]).assertEqual(float64Array);
      expect(vector[0][0]).assertEqual(-1.7976931348623157e308);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4300
     * @tc.name      testVector07Chapter0043
     * @tc.desc      set Float64Array([1.7976931348623157e308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0043';
      let vector = new Vector<Float64Array>();
      let float64Array = new Float64Array([1.7976931348623157e308]);
      vector.add(new Float64Array([108]));
      vector.set(0,float64Array);
      expect(vector[0]).assertEqual(float64Array);
      expect(vector[0][0]).assertEqual(1.7976931348623157e308);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4400
     * @tc.name      testVector07Chapter0044
     * @tc.desc      set Float64Array([-1.8E308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0044';
      let vector = new Vector<Float64Array>();
      let float64Array = new Float64Array([-1.8E308]);
      vector.add(new Float64Array([108]));
      vector.set(0,float64Array);
      expect(vector[0]).assertEqual(float64Array);
      expect(vector[0][0]).assertEqual(-1.8E308);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4500
     * @tc.name      testVector07Chapter0045
     * @tc.desc      set Float64Array([1.8E308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0045';
      let vector = new Vector<Float64Array>();
      let float64Array = new Float64Array([1.8E308]);
      vector.add(new Float64Array([108]));
      vector.set(0,float64Array);
      expect(vector[0]).assertEqual(float64Array);
      expect(vector[0][0]).assertEqual(1.8E308);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4600
     * @tc.name      testVector07Chapter0046
     * @tc.desc      set Float64Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0046';
      let vector = new Vector<Float64Array>();
      let float64Array = new Float64Array([Infinity]);
      vector.add(new Float64Array([108]));
      vector.set(0,float64Array);
      expect(vector[0]).assertEqual(float64Array);
      expect(vector[0][0]).assertEqual(Infinity);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4700
     * @tc.name      testVector07Chapter0047
     * @tc.desc      set Float64Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0047';
      let vector = new Vector<Float64Array>();
      let float64Array = new Float64Array([-Infinity]);
      vector.add(new Float64Array([108]));
      vector.set(0,float64Array);
      expect(vector[0]).assertEqual(float64Array);
      expect(vector[0][0]).assertEqual(-Infinity);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4800
     * @tc.name      testVector07Chapter0048
     * @tc.desc      set Float64Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0048';
      let vector = new Vector<Float64Array>();
      let float64Array = new Float64Array([NaN]);
      vector.add(new Float64Array([108]));
      vector.set(0,float64Array);
      expect(vector[0]).assertEqual(float64Array);
      expect(isNaN(vector[0][0])).assertTrue();
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_4900
     * @tc.name      testVector07Chapter0049
     * @tc.desc      set BigInt64Array([-9223372036854775808n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0049';
      let vector = new Vector<BigInt64Array>();
      let bigInt64Array = new BigInt64Array([-9223372036854775808n]);
      vector.add(new BigInt64Array([108n]));
      vector.set(0,bigInt64Array);
      expect(vector[0]).assertEqual(bigInt64Array);
      expect(vector[0][0]).assertEqual(-9223372036854775808n);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5000
     * @tc.name      testVector07Chapter0050
     * @tc.desc      set BigInt64Array([9223372036854775807n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0050';
      let vector = new Vector<BigInt64Array>();
      let bigInt64Array = new BigInt64Array([9223372036854775807n]);
      vector.add(new BigInt64Array([108n]));
      vector.set(0,bigInt64Array);
      expect(vector[0]).assertEqual(bigInt64Array);
      expect(vector[0][0]).assertEqual(9223372036854775807n);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5100
     * @tc.name      testVector07Chapter0051
     * @tc.desc      set BigInt64Array([-9223372036854775809n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0051';
      let vector = new Vector<BigInt64Array>();
      let bigInt64Array = new BigInt64Array([-9223372036854775809n]);
      vector.add(new BigInt64Array([108n]));
      vector.set(0,bigInt64Array);
      expect(vector[0]).assertEqual(bigInt64Array);
      expect(vector[0][0]).assertEqual(9223372036854775807n);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5200
     * @tc.name      testVector07Chapter0052
     * @tc.desc      set BigInt64Array([9223372036854775808n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0052';
      let vector = new Vector<BigInt64Array>();
      let bigInt64Array = new BigInt64Array([9223372036854775808n]);
      vector.add(new BigInt64Array([108n]));
      vector.set(0,bigInt64Array);
      expect(vector[0]).assertEqual(bigInt64Array);
      expect(vector[0][0]).assertEqual(-9223372036854775808n);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5300
     * @tc.name      testVector07Chapter0053
     * @tc.desc      set BigUint64Array([0n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0053';
      let vector = new Vector<BigUint64Array>();
      let bigUint64Array = new BigUint64Array([0n]);
      vector.add(new BigUint64Array([108n]));
      vector.set(0,bigUint64Array);
      expect(vector[0]).assertEqual(bigUint64Array);
      expect(vector[0][0]).assertEqual(0n);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5400
     * @tc.name      testVector07Chapter0054
     * @tc.desc      set BigUint64Array([18446744073709551615n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0054';
      let vector = new Vector<BigUint64Array>();
      let bigUint64Array = new BigUint64Array([18446744073709551615n]);
      vector.add(new BigUint64Array([108n]));
      vector.set(0,bigUint64Array);
      expect(vector[0]).assertEqual(bigUint64Array);
      expect(vector[0][0]).assertEqual(18446744073709551615n);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5500
     * @tc.name      testVector07Chapter0055
     * @tc.desc      set BigUint64Array([18446744073709551616n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0055';
      let vector = new Vector<BigUint64Array>();
      let bigUint64Array = new BigUint64Array([18446744073709551616n]);
      vector.add(new BigUint64Array([108n]));
      vector.set(0,bigUint64Array);
      expect(vector[0]).assertEqual(bigUint64Array);
      expect(vector[0][0]).assertEqual(0n);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5600
     * @tc.name      testVector07Chapter0056
     * @tc.desc      set string(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0056';
      let vector = new Vector<string | undefined>();
      let strVal = undefined;
      vector.add("108");
      vector.set(0,strVal);
      expect(vector[0]).assertEqual(strVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5700
     * @tc.name      testVector07Chapter0057
     * @tc.desc      set string(null) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0057';
      let vector = new Vector<string | null>();
      let strVal = null;
      vector.add("108");
      vector.set(0,strVal);
      expect(vector[0]).assertEqual(strVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5800
     * @tc.name      testVector07Chapter0058
     * @tc.desc      set string("") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0058';
      let vector = new Vector<string>();
      let strVal = "";
      vector.add("108");
      vector.set(0,strVal);
      expect(vector[0]).assertEqual(strVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_5900
     * @tc.name      testVector07Chapter0059
     * @tc.desc      set string("!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0059';
      let vector = new Vector<string>();
      let strVal = '!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~';
      vector.add("108");
      vector.set(0,strVal);
      expect(vector[0]).assertEqual(strVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6000
     * @tc.name      testVector07Chapter0060
     * @tc.desc      set string('👆') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0060';
      let vector = new Vector<string>();
      let strVal = '👆';
      vector.add("108");
      vector.set(0,strVal);
      expect(vector[0]).assertEqual(strVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6100
     * @tc.name      testVector07Chapter0061
     * @tc.desc      set number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0061';
      let vector = new Vector<number>();
      let numVal = 0;
      vector.add(108);
      vector.set(0,numVal);
      expect(vector[0]).assertEqual(numVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6200
     * @tc.name      testVector07Chapter0062
     * @tc.desc      set number(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0062';
      let vector = new Vector<number>();
      let numVal = NaN;
      vector.add(108);
      vector.set(0,numVal);
      expect(isNaN(vector[0])).assertTrue();
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6300
     * @tc.name      testVector07Chapter0063
     * @tc.desc      set number(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0063';
      let vector = new Vector<number>();
      let numVal = Infinity;
      vector.add(108);
      vector.set(0,numVal);
      expect(vector[0]).assertEqual(numVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6400
     * @tc.name      testVector07Chapter0064
     * @tc.desc      set number(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0064';
      let vector = new Vector<number>();
      let numVal = -Infinity;
      vector.add(108);
      vector.set(0,numVal);
      expect(vector[0]).assertEqual(numVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6500
     * @tc.name      testVector07Chapter0065
     * @tc.desc      set number(-0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0065';
      let vector = new Vector<number>();
      let numVal = -0;
      vector.add(108);
      vector.set(0,numVal);
      expect(vector[0]).assertEqual(numVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6600
     * @tc.name      testVector07Chapter0066
     * @tc.desc      set number(1.7976931348623157e+308) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0066';
      let vector = new Vector<number>();
      let numVal = 1.7976931348623157e+308;
      vector.add(108);
      vector.set(0,numVal);
      expect(vector[0]).assertEqual(numVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6700
     * @tc.name      testVector07Chapter0067
     * @tc.desc      set number(5e-324) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0067';
      let vector = new Vector<number>();
      let numVal = 5e-324;
      vector.add(108);
      vector.set(0,numVal);
      expect(vector[0]).assertEqual(numVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6800
     * @tc.name      testVector07Chapter0068
     * @tc.desc      set number(2**53-1) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0068';
      let vector = new Vector<number>();
      let numVal = 2**53 - 1;
      vector.add(108);
      vector.set(0,numVal);
      expect(vector[0]).assertEqual(numVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_6900
     * @tc.name      testVector07Chapter0069
     * @tc.desc      set BigInt(9007199254740991n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0069';
      let vector = new Vector<BigInt>();
      let bigIntVal = 9007199254740991n;
      vector.add(108n);
      vector.set(0,bigIntVal);
      expect(vector[0]).assertEqual(bigIntVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_7000
     * @tc.name      testVector07Chapter0070
     * @tc.desc      set boolean(true) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0070';
      let vector = new Vector<boolean>();
      let boolVal = true;
      vector.add(false);
      vector.set(0,boolVal);
      expect(vector[0]).assertEqual(boolVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_7100
     * @tc.name      testVector07Chapter0071
     * @tc.desc      set boolean(false) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0071';
      let vector = new Vector<boolean>();
      let boolVal = false;
      vector.add(true);
      vector.set(0,boolVal);
      expect(vector[0]).assertEqual(boolVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_7200
     * @tc.name      testVector07Chapter0072
     * @tc.desc      set boolean(null) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0072';
      let vector = new Vector<boolean | null>();
      let boolVal = null;
      vector.add(true);
      vector.set(0,boolVal);
      expect(vector[0]).assertEqual(boolVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_7300
     * @tc.name      testVector07Chapter0073
     * @tc.desc      set boolean(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0073';
      let vector = new Vector<boolean | undefined>();
      let boolVal = undefined;
      vector.add(true);
      vector.set(0,boolVal);
      expect(vector[0]).assertEqual(boolVal);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_7400
     * @tc.name      testVector07Chapter0074
     * @tc.desc      set Uint8Array([72,101,108,108,111,87,111,114,108,100,49,50,51,63]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0074';
      let vector = new Vector<Uint8Array>();
      let uint8Array = new Uint8Array([72,101,108,108,111,87,111,114,108,100,49,50,51,63]);
      vector.add(new Uint8Array([108]));
      vector.set(0,uint8Array);
      expect(vector[0]).assertEqual(uint8Array);
      expect(vector[0][0]).assertEqual(72);
      expect(vector[0][13]).assertEqual(63);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_7500
     * @tc.name      testVector07Chapter0075
     * @tc.desc      set Array(more zero) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0075';
      let vector = new Vector<Array<number>>();
      let arrVal = [72,101,108,108,111,87,111,114,108,0,0,0,0,0,100,49,50,51,63];
      vector.add([108]);
      vector.set(0,arrVal);
      expect(vector[0]).assertEqual(arrVal);
      expect(vector[0][9]).assertEqual(0);
      expect(vector[0][18]).assertEqual(63);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_7600
     * @tc.name      testVector07Chapter0076
     * @tc.desc      set Array(negative number) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0076';
      let vector = new Vector<Array<number>>();
      let arrVal = [72,101,108,108,111,87,-111,114,108,100,-49,50,51,-63];
      vector.add([108]);
      vector.set(0,arrVal);
      expect(vector[0]).assertEqual(arrVal);
      expect(vector[0][6]).assertEqual(-111);
      expect(vector[0][10]).assertEqual(-49);
      expect(vector[0][13]).assertEqual(-63);
      expect(vector.length).assertEqual(1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST07_7700
     * @tc.name      testVector07Chapter0077
     * @tc.desc      set Array(special array with props) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector07Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector07Chapter0077';
      let vector = new Vector<Array<number>>();
      let arrVal: Array<number> = [];
      arrVal["abc"] = 111;
      arrVal["aaa"] = 72;
      vector.add([]);
      vector.set(0,arrVal);
      expect(vector[0]).assertEqual(arrVal);
      expect(vector[0]["abc"]).assertEqual(111);
      expect(vector[0]["aaa"]).assertEqual(72);
      expect(vector.length).assertEqual(1);
    })

  })
}
