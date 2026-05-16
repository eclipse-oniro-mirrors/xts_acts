import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest03() {
  describe('VectorTest03', () => {
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
     * @tc.number    SUB_VECTOR_TEST03_0100
     * @tc.name      testVector03Chapter0001
     * @tc.desc      insert Uint32Array(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0001'
      let vector = new Vector<Uint32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint32Array([i]))
      }
      let length = vector.length;
      let number = new Uint32Array([0])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_0200
     * @tc.name      testVector03Chapter0002
     * @tc.desc      insert Uint32Array(4294967295) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0002'
      let vector = new Vector<Uint32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint32Array([i]))
      }
      let length = vector.length;
      let number = new Uint32Array([4294967295])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(4294967295);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_0300
     * @tc.name      testVector03Chapter0003
     * @tc.desc      insert Uint32Array(-1) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0003'
      let vector = new Vector<Uint32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint32Array([i]))
      }
      let length = vector.length;
      let number = new Uint32Array([-1])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(4294967295);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_0400
     * @tc.name      testVector03Chapter0004
     * @tc.desc      insert Uint32Array(4294967296) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0004'
      let vector = new Vector<Uint32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint32Array([i]))
      }
      let length = vector.length;
      let number = new Uint32Array([4294967296])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_0500
     * @tc.name      testVector03Chapter0005
     * @tc.desc      insert Float32Array(-3.4028234663852886E38) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0005'
      let vector = new Vector<Float32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float32Array([i]))
      }
      let length = vector.length;
      let number = new Float32Array([-3.4028234663852886E38])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-3.4028234663852886E38);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_0600
     * @tc.name      testVector03Chapter0006
     * @tc.desc      insert Float32Array(3.4028234663852886E38) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0006'
      let vector = new Vector<Float32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float32Array([i]))
      }
      let length = vector.length;
      let number = new Float32Array([3.4028234663852886E38])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(3.4028234663852886E38);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_0700
     * @tc.name      testVector03Chapter0007
     * @tc.desc      insert Float32Array(1.199999978106707e-38) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0007'
      let vector = new Vector<Float32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float32Array([i]))
      }
      let length = vector.length;
      let number = new Float32Array([1.199999978106707e-38])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(1.199999978106707e-38);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_0800
     * @tc.name      testVector03Chapter0008
     * @tc.desc      insert Float64Array(-1.7976931348623157E308) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0008'
      let vector = new Vector<Float64Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float64Array([i]))
      }
      let length = vector.length;
      let number = new Float64Array([-1.7976931348623157E308])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-1.7976931348623157E308);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_0900
     * @tc.name      testVector03Chapter0009
     * @tc.desc      insert Float64Array(1.7976931348623157E308) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0009'
      let vector = new Vector<Float64Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float64Array([i]))
      }
      let length = vector.length;
      let number = new Float64Array([1.7976931348623157E308])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(1.7976931348623157E308);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1000
     * @tc.name      testVector03Chapter0010
     * @tc.desc      insert Float64Array(-1.8E308) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0010'
      let vector = new Vector<Float64Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float64Array([i]))
      }
      let length = vector.length;
      let number = new Float64Array([-1.8E308])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-1.8E308);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1100
     * @tc.name      testVector03Chapter0011
     * @tc.desc      insert Float64Array(1.8E308) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0011'
      let vector = new Vector<Float64Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float64Array([i]))
      }
      let length = vector.length;
      let number = new Float64Array([1.8E308])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(1.8E308);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1200
     * @tc.name      testVector03Chapter0012
     * @tc.desc      insert BigInt64Array(-9223372036854775808n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0012'
      let vector = new Vector<BigInt64Array>();
      for (let i = 0; i < 10; i++) {
        let num = BigInt(i)
        vector.add(new BigInt64Array([num]))
      }
      let length = vector.length;
      let number = new BigInt64Array([-9223372036854775808n])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-9223372036854775808n);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1300
     * @tc.name      testVector03Chapter0013
     * @tc.desc      insert BigInt64Array(9223372036854775807n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0013'
      let vector = new Vector<BigInt64Array>();
      for (let i = 0; i < 10; i++) {
        let num = BigInt(i)
        vector.add(new BigInt64Array([num]))
      }
      let length = vector.length;
      let number = new BigInt64Array([9223372036854775807n])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(9223372036854775807n);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1400
     * @tc.name      testVector03Chapter0014
     * @tc.desc      insert BigInt64Array(-9223372036854775809n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0014'
      let vector = new Vector<BigInt64Array>();
      for (let i = 0; i < 10; i++) {
        let num = BigInt(i)
        vector.add(new BigInt64Array([num]))
      }
      let length = vector.length;
      let number = new BigInt64Array([-9223372036854775809n])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(9223372036854775807n);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1500
     * @tc.name      testVector03Chapter0015
     * @tc.desc      insert BigInt64Array(9223372036854775808n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0015'
      let vector = new Vector<BigInt64Array>();
      for (let i = 0; i < 10; i++) {
        let num = BigInt(i)
        vector.add(new BigInt64Array([num]))
      }
      let length = vector.length;
      let number = new BigInt64Array([9223372036854775808n])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-9223372036854775808n);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1600
     * @tc.name      testVector03Chapter0016
     * @tc.desc      insert BigUint64Array(0n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0016'
      let vector = new Vector<BigUint64Array>();
      for (let i = 0; i < 10; i++) {
        let num = BigInt(i)
        vector.add(new BigUint64Array([num]))
      }
      let length = vector.length;
      let number = new BigUint64Array([0n])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0n);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1700
     * @tc.name      testVector03Chapter0017
     * @tc.desc      insert BigUint64Array(18446744073709551615n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0017'
      let vector = new Vector<BigUint64Array>();
      for (let i = 0; i < 10; i++) {
        let num = BigInt(i)
        vector.add(new BigUint64Array([num]))
      }
      let length = vector.length;
      let number = new BigUint64Array([18446744073709551615n])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(18446744073709551615n);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1800
     * @tc.name      testVector03Chapter0018
     * @tc.desc      insert BigUint64Array(18446744073709551616n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0018'
      let vector = new Vector<BigUint64Array>();
      for (let i = 0; i < 10; i++) {
        let num = BigInt(i)
        vector.add(new BigUint64Array([num]))
      }
      let length = vector.length;
      let number = new BigUint64Array([18446744073709551616n])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0n);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_1900
     * @tc.name      testVector03Chapter0019
     * @tc.desc      insert Float32Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0019'
      let vector = new Vector<Float32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float32Array([i]))
      }
      let length = vector.length;
      let number = new Float32Array([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(Infinity);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2000
     * @tc.name      testVector03Chapter0020
     * @tc.desc      insert Float32Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0020'
      let vector = new Vector<Float32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float32Array([i]))
      }
      let length = vector.length;
      let number = new Float32Array([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-Infinity);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2100
     * @tc.name      testVector03Chapter0021
     * @tc.desc      insert Float32Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0021'
      let vector = new Vector<Float32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float32Array([i]))
      }
      let length = vector.length;
      let number = new Float32Array([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertNaN();
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2200
     * @tc.name      testVector03Chapter0022
     * @tc.desc      insert Float64Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0022'
      let vector = new Vector<Float64Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float64Array([i]))
      }
      let length = vector.length;
      let number = new Float64Array([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(Infinity);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2300
     * @tc.name      testVector03Chapter0023
     * @tc.desc      insert Float64Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0023'
      let vector = new Vector<Float64Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float64Array([i]))
      }
      let length = vector.length;
      let number = new Float64Array([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(-Infinity);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2400
     * @tc.name      testVector03Chapter0024
     * @tc.desc      insert Float64Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0024'
      let vector = new Vector<Float64Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Float64Array([i]))
      }
      let length = vector.length;
      let number = new Float64Array([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertNaN();
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2500
     * @tc.name      testVector03Chapter0025
     * @tc.desc      insert Int8Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0025'
      let vector = new Vector<Int8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int8Array([i]))
      }
      let length = vector.length;
      let number = new Int8Array([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2600
     * @tc.name      testVector03Chapter0026
     * @tc.desc      insert Int8Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0026'
      let vector = new Vector<Int8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int8Array([i]))
      }
      let length = vector.length;
      let number = new Int8Array([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2700
     * @tc.name      testVector03Chapter0027
     * @tc.desc      insert Int8Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0027'
      let vector = new Vector<Int8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int8Array([i]))
      }
      let length = vector.length;
      let number = new Int8Array([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2800
     * @tc.name      testVector03Chapter0028
     * @tc.desc      insert Uint8Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0028'
      let vector = new Vector<Uint8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8Array([i]))
      }
      let length = vector.length;
      let number = new Uint8Array([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_2900
     * @tc.name      testVector03Chapter0029
     * @tc.desc      insert Uint8Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0029'
      let vector = new Vector<Uint8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8Array([i]))
      }
      let length = vector.length;
      let number = new Uint8Array([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3000
     * @tc.name      testVector03Chapter0030
     * @tc.desc      insert Uint8Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0030'
      let vector = new Vector<Uint8Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8Array([i]))
      }
      let length = vector.length;
      let number = new Uint8Array([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3100
     * @tc.name      testVector03Chapter0031
     * @tc.desc      insert Int16Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0031'
      let vector = new Vector<Int16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int16Array([i]))
      }
      let length = vector.length;
      let number = new Int16Array([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3200
     * @tc.name      testVector03Chapter0032
     * @tc.desc      insert Int16Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0032'
      let vector = new Vector<Int16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int16Array([i]))
      }
      let length = vector.length;
      let number = new Int16Array([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3300
     * @tc.name      testVector03Chapter0033
     * @tc.desc      insert Int16Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0033'
      let vector = new Vector<Int16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int16Array([i]))
      }
      let length = vector.length;
      let number = new Int16Array([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3400
     * @tc.name      testVector03Chapter0034
     * @tc.desc      insert Uint16Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0034'
      let vector = new Vector<Uint16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint16Array([i]))
      }
      let length = vector.length;
      let number = new Uint16Array([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3500
     * @tc.name      testVector03Chapter0035
     * @tc.desc      insert Uint16Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0035'
      let vector = new Vector<Uint16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint16Array([i]))
      }
      let length = vector.length;
      let number = new Uint16Array([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3600
     * @tc.name      testVector03Chapter0036
     * @tc.desc      insert Uint16Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0036'
      let vector = new Vector<Uint16Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint16Array([i]))
      }
      let length = vector.length;
      let number = new Uint16Array([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3700
     * @tc.name      testVector03Chapter0037
     * @tc.desc      insert Int32Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0037'
      let vector = new Vector<Int32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int32Array([i]))
      }
      let length = vector.length;
      let number = new Int32Array([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3800
     * @tc.name      testVector03Chapter0038
     * @tc.desc      insert Int32Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0038'
      let vector = new Vector<Int32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int32Array([i]))
      }
      let length = vector.length;
      let number = new Int32Array([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_3900
     * @tc.name      testVector03Chapter0039
     * @tc.desc      insert Int32Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0039'
      let vector = new Vector<Int32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Int32Array([i]))
      }
      let length = vector.length;
      let number = new Int32Array([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4000
     * @tc.name      testVector03Chapter0040
     * @tc.desc      insert Uint32Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0040'
      let vector = new Vector<Uint32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint32Array([i]))
      }
      let length = vector.length;
      let number = new Uint32Array([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4100
     * @tc.name      testVector03Chapter0041
     * @tc.desc      insert Uint32Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0041'
      let vector = new Vector<Uint32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint32Array([i]))
      }
      let length = vector.length;
      let number = new Uint32Array([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4200
     * @tc.name      testVector03Chapter0042
     * @tc.desc      insert Uint32Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0042'
      let vector = new Vector<Uint32Array>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint32Array([i]))
      }
      let length = vector.length;
      let number = new Uint32Array([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4300
     * @tc.name      testVector03Chapter0043
     * @tc.desc      insert Uint8ClampedArray(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0043'
      let vector = new Vector<Uint8ClampedArray>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8ClampedArray([i]))
      }
      let length = vector.length;
      let number = new Uint8ClampedArray([Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(255);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4400
     * @tc.name      testVector03Chapter0044
     * @tc.desc      insert Uint8ClampedArray(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0044'
      let vector = new Vector<Uint8ClampedArray>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8ClampedArray([i]))
      }
      let length = vector.length;
      let number = new Uint8ClampedArray([-Infinity])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4500
     * @tc.name      testVector03Chapter0045
     * @tc.desc      insert Uint8ClampedArray(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0045'
      let vector = new Vector<Uint8ClampedArray>();
      for (let i = 0; i < 10; i++) {
        vector.add(new Uint8ClampedArray([i]))
      }
      let length = vector.length;
      let number = new Uint8ClampedArray([NaN])
      vector.insert(number, 3)
      expect(vector[3][0]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4600
     * @tc.name      testVector03Chapter0046
     * @tc.desc      insert BigInt64Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0046'
      try {
        let vector = new Vector<BigInt64Array>();
        for (let i = 0; i < 10; i++) {
          let num = BigInt(i)
          vector.add(new BigInt64Array([num]))
        }
        let length = vector.length;
        let number = new BigInt64Array([BigInt(Infinity)])
        vector.insert(number, 3)
        expect().assertFail();
      } catch (error) {
        expect(error !== null).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4700
     * @tc.name      testVector03Chapter0047
     * @tc.desc      insert BigInt64Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0047'
      try {
        let vector = new Vector<BigInt64Array>();
        for (let i = 0; i < 10; i++) {
          let num = BigInt(i)
          vector.add(new BigInt64Array([num]))
        }
        let length = vector.length;
        let number = new BigInt64Array([BigInt(-Infinity)])
        vector.insert(number, 3)
        expect().assertFalse();
      } catch (error) {
        expect(error !== null).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4800
     * @tc.name      testVector03Chapter0048
     * @tc.desc      insert BigInt64Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0048'
      try {
        let vector = new Vector<BigInt64Array>();
        for (let i = 0; i < 10; i++) {
          let num = BigInt(i)
          vector.add(new BigInt64Array([num]))
        }
        let length = vector.length;
        let number = new BigInt64Array([BigInt(NaN)])
        vector.insert(number, 3)
        expect().assertFail();
      } catch (error) {
        expect(error !== null).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_4900
     * @tc.name      testVector03Chapter0049
     * @tc.desc      insert BigUint64Array(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0049'
      try {
        let vector = new Vector<BigUint64Array>();
        for (let i = 0; i < 10; i++) {
          let num = BigInt(i)
          vector.add(new BigUint64Array([num]))
        }
        let length = vector.length;
        let number = new BigUint64Array([BigInt(Infinity)])
        vector.insert(number, 3)
        expect().assertFail();
      } catch (error) {
        expect(error !== null).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5000
     * @tc.name      testVector03Chapter0050
     * @tc.desc      insert BigUint64Array(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0050'
      try {
        let vector = new Vector<BigUint64Array>();
        for (let i = 0; i < 10; i++) {
          let num = BigInt(i)
          vector.add(new BigUint64Array([num]))
        }
        let length = vector.length;
        let number = new BigUint64Array([BigInt(-Infinity)])
        vector.insert(number, 3)
        expect().assertFail();
      } catch (error) {
        expect(error !== null).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5100
     * @tc.name      testVector03Chapter0051
     * @tc.desc      insert BigUint64Array(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0051'
      try {
        let vector = new Vector<BigUint64Array>();
        for (let i = 0; i < 10; i++) {
          let num = BigInt(i)
          vector.add(new BigUint64Array([num]))
        }
        let length = vector.length;
        let number = new BigUint64Array([BigInt(NaN)])
        vector.insert(number, 3)
        expect().assertFail();
      } catch (error) {
        expect(error !== null).assertTrue()
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5200
     * @tc.name      testVector03Chapter0052
     * @tc.desc      insert String(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0052'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert(undefined, 3)
      expect(vector[3]).assertUndefined();
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5300
     * @tc.name      testVector03Chapter0053
     * @tc.desc      insert String(null) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0053'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert(null, 3)
      expect(vector[3]).assertNull();
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5400
     * @tc.name      testVector03Chapter0054
     * @tc.desc      insert String("") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0054'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert("", 3)
      expect(vector[3] === "").assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5500
     * @tc.name      testVector03Chapter0055
     * @tc.desc      insert String(!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0055'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('"!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~"', 3)
      expect(vector[3]).assertEqual('"!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~"');
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5600
     * @tc.name      testVector03Chapter0056
     * @tc.desc      insert String(ASCII) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0056'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      let str = '!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~'
      vector.insert(str, 3)
      expect(vector[3]).assertEqual(str);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5700
     * @tc.name      testVector03Chapter0057
     * @tc.desc      insert String(double ASCII) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0057'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      let str = '!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~'
      vector.insert(str, 3)
      expect(vector[3]).assertEqual(str);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5800
     * @tc.name      testVector03Chapter0058
     * @tc.desc      insert String(\a) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0058'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u0007', 3)
      expect(vector[3]).assertEqual('\u0007');
      expect(vector[3].charCodeAt(0)).assertEqual(7);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_5900
     * @tc.name      testVector03Chapter0059
     * @tc.desc      insert String(\b) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0059'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u0008', 3)
      expect(vector[3]).assertEqual('\u0008');
      expect(vector[3].charCodeAt(0)).assertEqual(8);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6000
     * @tc.name      testVector03Chapter0060
     * @tc.desc      insert String(\f) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0060'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u000C', 3)
      expect(vector[3]).assertEqual('\u000C');
      expect(vector[3].charCodeAt(0)).assertEqual(12);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6100
     * @tc.name      testVector03Chapter0061
     * @tc.desc      insert String(\n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0061'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u000A', 3)
      expect(vector[3]).assertEqual('\u000A');
      expect(vector[3].charCodeAt(0)).assertEqual(10);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6200
     * @tc.name      testVector03Chapter0062
     * @tc.desc      insert String(\r) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0062'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u000D', 3)
      expect(vector[3]).assertEqual('\u000D');
      expect(vector[3].charCodeAt(0)).assertEqual(13);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6300
     * @tc.name      testVector03Chapter0063
     * @tc.desc      insert String(\t) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0063'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u0009', 3)
      expect(vector[3]).assertEqual('\u0009');
      expect(vector[3].charCodeAt(0)).assertEqual(9);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6400
     * @tc.name      testVector03Chapter0064
     * @tc.desc      insert String(\v) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0064'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u000B', 3)
      expect(vector[3]).assertEqual('\u000B');
      expect(vector[3].charCodeAt(0)).assertEqual(11);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6500
     * @tc.name      testVector03Chapter0065
     * @tc.desc      insert String(\\) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0065'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u005C', 3)
      expect(vector[3]).assertEqual('\u005C');
      expect(vector[3].charCodeAt(0)).assertEqual(92);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6600
     * @tc.name      testVector03Chapter0066
     * @tc.desc      insert String(\0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0066'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u0000', 3)
      expect(vector[3]).assertEqual('\u0000');
      expect(vector[3].charCodeAt(0)).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6700
     * @tc.name      testVector03Chapter0067
     * @tc.desc      insert String(\') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0067'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u0027', 3)
      expect(vector[3]).assertEqual('\u0027');
      expect(vector[3].charCodeAt(0)).assertEqual(39);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6800
     * @tc.name      testVector03Chapter0068
     * @tc.desc      insert String(\") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0068'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u0022', 3)
      expect(vector[3]).assertEqual('\u0022');
      expect(vector[3].charCodeAt(0)).assertEqual(34);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_6900
     * @tc.name      testVector03Chapter0069
     * @tc.desc      insert String(\?) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0069'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\u003F', 3)
      expect(vector[3]).assertEqual('\u003F');
      expect(vector[3].charCodeAt(0)).assertEqual(63);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7000
     * @tc.name      testVector03Chapter0070
     * @tc.desc      insert String(\ddd) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0070'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(0o47, 3)
      expect(vector[3]).assertEqual(0o47);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7100
     * @tc.name      testVector03Chapter0071
     * @tc.desc      insert String(\xhh) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0071'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\x41', 3)
      expect(vector[3]).assertEqual('\x41');
      expect(vector[3].charCodeAt(0)).assertEqual(65);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7200
     * @tc.name      testVector03Chapter0072
     * @tc.desc      insert String(👆) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0072'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('👆', 3)
      expect(vector[3]).assertEqual('\ud83d\udc46');
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7300
     * @tc.name      testVector03Chapter0073
     * @tc.desc      insert String(👿) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0073'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('👿', 3)
      expect(vector[3]).assertEqual('\ud83d\udc7f');
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7400
     * @tc.name      testVector03Chapter0074
     * @tc.desc      insert String(👀) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0074'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('👀', 3)
      expect(vector[3]).assertEqual('\ud83d\udc40');
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7500
     * @tc.name      testVector03Chapter0075
     * @tc.desc      insert String('\udc7f') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0075'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('\udc7f', 3)
      expect(vector[3] !== '👿').assertTrue()
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7600
     * @tc.name      testVector03Chapter0076
     * @tc.desc      insert String("0") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0076'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('0', 3)
      expect(vector[3]).assertEqual('0');
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7700
     * @tc.name      testVector03Chapter0077
     * @tc.desc      insert String("NaN") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0077'
      let vector = new Vector<String>();
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      let length = vector.length;
      vector.insert('NaN', 3)
      expect(vector[3]).assertEqual('NaN');
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7800
     * @tc.name      testVector03Chapter0078
     * @tc.desc      insert sliceString test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0078'
      let vector = new Vector<String>();
      let str = "{k1:value1,k2:value2}"
      for (let i = 0; i < 10; i++) {
        vector.add(i.toString())
      }
      vector.insert(str, 3)
      for (let i = 0; i < 100; i++) {
        expect(vector[3].substring(0, str.length - 2)).assertEqual(str.substring(0, str.length - 2))
      }
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_7900
     * @tc.name      testVector03Chapter0079
     * @tc.desc      insert number(0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0079'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(0, 3)
      expect(vector[3]).assertEqual(0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8000
     * @tc.name      testVector03Chapter0080
     * @tc.desc      insert number(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0080'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(undefined, 3)
      expect(vector[3]).assertEqual(undefined);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8100
     * @tc.name      testVector03Chapter0081
     * @tc.desc      insert number(NaN) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0081'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(NaN, 3)
      expect(vector[3]).assertNaN();
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8200
     * @tc.name      testVector03Chapter0082
     * @tc.desc      insert number(-0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0082'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(-0, 3)
      expect(vector[3]).assertEqual(-0);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8300
     * @tc.name      testVector03Chapter0083
     * @tc.desc      insert number(Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0083'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(Infinity, 3)
      expect(vector[3]).assertEqual(Infinity);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8400
     * @tc.name      testVector03Chapter0084
     * @tc.desc      insert number(-Infinity) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0084'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(-Infinity, 3)
      expect(vector[3]).assertEqual(-Infinity);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8500
     * @tc.name      testVector03Chapter0085
     * @tc.desc      insert number(Number.MAX_VALUE) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0085'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(Number.MAX_VALUE, 3)
      expect(vector[3]).assertEqual(Number.MAX_VALUE);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8600
     * @tc.name      testVector03Chapter0086
     * @tc.desc      insert number(Number.MIN_VALUE) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0086'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(Number.MIN_VALUE, 3)
      expect(vector[3]).assertEqual(Number.MIN_VALUE);
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8700
     * @tc.name      testVector03Chapter0087
     * @tc.desc      insert number(Math.floor(1.5)) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0087'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(Math.floor(1.5), 3)
      expect(vector[3]).assertEqual(Math.floor(1.5));
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8800
     * @tc.name      testVector03Chapter0088
     * @tc.desc      insert number(Math.ceil(1.5)) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0088'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(Math.ceil(1.5), 3)
      expect(vector[3]).assertEqual(Math.ceil(1.5));
      expect(vector.length).assertEqual(length + 1);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST03_8900
     * @tc.name      testVector03Chapter0089
     * @tc.desc      insert number(Number.EPSILON) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector03Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector03Chapter0089'
      let vector = new Vector<number>();
      for (let i = 0; i < 10; i++) {
        vector.add(i)
      }
      let length = vector.length;
      vector.insert(Number.EPSILON, 3)
      expect(vector[3]).assertEqual(2.220446049250313e-16);
      expect(vector.length).assertEqual(length + 1);
    })

  })
}