import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, TestType, Size } from '@ohos/hypium';
import { ArrayList, util, Vector } from '@kit.ArkTS';

const sleep = (time: number): Promise<void> => {
  return new Promise<void>((resolve) => {
    setTimeout(resolve, time);
  });
};

export default function vectorTest01() {
  describe('VectorTest01', () => {
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
     * @tc.number    SUB_VECTOR_TEST01_0100
     * @tc.name      testVector01Chapter0001
     * @tc.desc      encode Int8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0001';

      // 场景1：无参构造，泛型指定为Int8Array（checklist第1类）
      const vector = new Vector<Int8Array>();
      // 断言1：验证实例是Vector类型（替代not.toBeNull()，无依赖）
      expect(vector instanceof Vector).assertTrue();
      // 断言2：验证泛型约束（通过TypeScript类型校验+运行时类型判断）
      expect(vector.constructor.name).assertEqual("Vector"); // 验证构造函数类型

    });

    /**
     * @tc.number    SUB_VECTOR_TEST01_0200
     * @tc.name      testVector01Chapter0002
     * @tc.desc      encode Uint8Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0002';

      const vector = new Vector<Uint8Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");

    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_0300
     * @tc.name      testVector01Chapter0003
     * @tc.desc      encode Uint8ClampedArray
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0003';
      const vector = new Vector<Uint8ClampedArray>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_0400
     * @tc.name      testVector01Chapter0004
     * @tc.desc      encode Int16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0004';
      const vector = new Vector<Int16Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })
    /**
     * @tc.number    SUB_VECTOR_TEST01_0500
     * @tc.name      testVector01Chapter0005
     * @tc.desc      encode Uint16Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0005';
      const vector = new Vector<Uint16Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })
    /**
     * @tc.number    SUB_VECTOR_TEST01_0600
     * @tc.name      testVector01Chapter0006
     * @tc.desc      encode Int32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0006';
      const vector = new Vector<Int32Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_0700
     * @tc.name      testVector01Chapter0007
     * @tc.desc      encode Uint32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0007';
      const vector = new Vector<Uint32Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_0800
     * @tc.name      testVector01Chapter0008
     * @tc.desc      encode Float32Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0008';
      const vector = new Vector<Float32Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_0900
     * @tc.name      testVector01Chapter0009
     * @tc.desc      encode Float64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0009';
      const vector = new Vector<Float64Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1000
     * @tc.name      testVector01Chapter0010
     * @tc.desc      encode BigInt64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0010';
      const vector = new Vector<BigInt64Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1200
     * @tc.name      testVector01Chapter0012
     * @tc.desc      encode BigUint64Array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0012';
      const vector = new Vector<BigUint64Array>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1300
     * @tc.name      testVector01Chapter0013
     * @tc.desc      encode undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0013';
      const vector = new Vector<undefined>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1400
     * @tc.name      testVector01Chapter0014
     * @tc.desc      encode null
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0014';
      const vector = new Vector<null>();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1500
     * @tc.name      testVector01Chapter0015
     * @tc.desc      encode ""
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0015';
      const vector = new Vector<"">();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1600
     * @tc.name      testVector01Chapter0016
     * @tc.desc      encode "!"#$%&'()*+,-./:;<=>?@[\]^_`{|}~"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0016';
      const vector = new Vector<"!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~">();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1700
     * @tc.name      testVector01Chapter0017
     * @tc.desc      encode "!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0017';
      const vector =
        new Vector<"!#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~">();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1800
     * @tc.name      testVector01Chapter0018
     * @tc.desc      encode "!!""##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~"
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0018';
      const vector = new Vector<"!!\"\"##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~">();
      expect(vector instanceof Vector).assertTrue();
      expect(vector.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_1900
     * @tc.name      testVector01Chapter0019
     * @tc.desc      encode 特殊转义字符
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0019';
      const vector1 = new Vector<"\a">()
      expect(vector1 instanceof Vector).assertTrue();
      expect(vector1.constructor.name).assertEqual("Vector");
      const vector2 = new Vector<"\b">()
      expect(vector2 instanceof Vector).assertTrue();
      expect(vector2.constructor.name).assertEqual("Vector");
      const vector3 = new Vector<"\v">()
      expect(vector3 instanceof Vector).assertTrue();
      expect(vector3.constructor.name).assertEqual("Vector");
      const vector4 = new Vector<"\n">()
      expect(vector4 instanceof Vector).assertTrue();
      expect(vector4.constructor.name).assertEqual("Vector");
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2000
     * @tc.name      testVector01Chapter0020
     * @tc.desc      add Int8Array([-128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0020'
      // 初始化Int8Array类型Vector
      let vector = new Vector<Int8Array>();
      let array = new Int8Array([-128]);
      let result = vector.add(array);
      expect(result).assertTrue()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2100
     * @tc.name      testVector01Chapter0021
     * @tc.desc      add Int8Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0021'
      // 初始化Int8Array类型Vector
      let vector = new Vector<Int8Array>();
      let array = new Int8Array([0]);
      let result = vector.add(array);
      expect(result).assertTrue()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2200
     * @tc.name      testVector01Chapter0022
     * @tc.desc      add Int8Array([127]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0022'
      // 初始化Int8Array类型Vector
      let vector = new Vector<Int8Array>();
      let array = new Int8Array([127]);
      let result = vector.add(array);
      expect(result).assertTrue()
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2300
     * @tc.name      testVector01Chapter0023
     * @tc.desc      add Int8Array([-129]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0023'
      let vector = new Vector<Int8Array>();
      let array = new Int8Array([-129]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 127).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2400
     * @tc.name      testVector01Chapter0024
     * @tc.desc      add Int8Array([128]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0024'
      let vector = new Vector<Int8Array>();
      let array = new Int8Array([128]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === -128).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2500
     * @tc.name      testVector01Chapter0025
     * @tc.desc      add Int8Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0025'
      let vector = new Vector<Int8Array>();
      let array = new Int8Array([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2600
     * @tc.name      testVector01Chapter0026
     * @tc.desc      add Int8Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0026'
      let vector = new Vector<Int8Array>();
      let array = new Int8Array([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2700
     * @tc.name      testVector01Chapter0027
     * @tc.desc      add Int8Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0027'
      let vector = new Vector<Int8Array>();
      let array = new Int8Array([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2800
     * @tc.name      testVector01Chapter0028
     * @tc.desc      add Uint8Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0028'
      let vector = new Vector<Uint8Array>();
      let array = new Uint8Array([0]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_2900
     * @tc.name      testVector01Chapter0029
     * @tc.desc      add Uint8Array([255]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0029'
      let vector = new Vector<Uint8Array>();
      let array = new Uint8Array([255]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 255).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3000
     * @tc.name      testVector01Chapter0030
     * @tc.desc      add Uint8Array([256]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0030'
      let vector = new Vector<Uint8Array>();
      let array = new Uint8Array([256]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3100
     * @tc.name      testVector01Chapter0031
     * @tc.desc      add Uint8Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0031'
      let vector = new Vector<Uint8Array>();
      let array = new Uint8Array([-1]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 255).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3200
     * @tc.name      testVector01Chapter0032
     * @tc.desc      add Uint8Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0032'
      let vector = new Vector<Uint8Array>();
      let array = new Uint8Array([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3300
     * @tc.name      testVector01Chapter0033
     * @tc.desc      add Uint8Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0033'
      let vector = new Vector<Uint8Array>();
      let array = new Uint8Array([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3400
     * @tc.name      testVector01Chapter0034
     * @tc.desc      add Uint8Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0034'

      let vector = new Vector<Uint8Array>();
      let array = new Uint8Array([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();

    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3500
     * @tc.name      testVector01Chapter0035
     * @tc.desc      add Uint8ClampedArray([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0035'
      let vector = new Vector<Uint8ClampedArray>();
      let array = new Uint8ClampedArray([0]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3600
     * @tc.name      testVector01Chapter0036
     * @tc.desc      add Uint8ClampedArray([255]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0036'
      let vector = new Vector<Uint8ClampedArray>();
      let array = new Uint8ClampedArray([255]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 255).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3700
     * @tc.name      testVector01Chapter0037
     * @tc.desc      add Uint8ClampedArray([256]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0037'
      let vector = new Vector<Uint8ClampedArray>();
      let array = new Uint8ClampedArray([256]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 255).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3800
     * @tc.name      testVector01Chapter0038
     * @tc.desc      add Uint8ClampedArray([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0038'
      let vector = new Vector<Uint8ClampedArray>();
      let array = new Uint8ClampedArray([-1]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_3900
     * @tc.name      testVector01Chapter0039
     * @tc.desc      add Uint8ClampedArray([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0039'
      let vector = new Vector<Uint8ClampedArray>();
      let array = new Uint8ClampedArray([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 255).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4000
     * @tc.name      testVector01Chapter0040
     * @tc.desc      add Uint8ClampedArray([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0040'
      let vector = new Vector<Uint8ClampedArray>();
      let array = new Uint8ClampedArray([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4100
     * @tc.name      testVector01Chapter0041
     * @tc.desc      add Uint8ClampedArray([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0041'
      let vector = new Vector<Uint8ClampedArray>();
      let array = new Uint8ClampedArray([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4200
     * @tc.name      testVector01Chapter0042
     * @tc.desc      add Int16Array([-32768]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0042'
      let vector = new Vector<Int16Array>();
      let array = new Int16Array([-32768]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === -32768).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4300
     * @tc.name      testVector01Chapter0043
     * @tc.desc      add Int16Array([32767]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0043'
      let vector = new Vector<Int16Array>();
      let array = new Int16Array([32767]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 32767).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4400
     * @tc.name      testVector01Chapter0044
     * @tc.desc      add Int16Array([-32769]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0044'
      let vector = new Vector<Int16Array>();
      let array = new Int16Array([-32769]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 32767).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4500
     * @tc.name      testVector01Chapter0045
     * @tc.desc      add Int16Array([32768]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0045'
      let vector = new Vector<Int16Array>();
      let array = new Int16Array([32768]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === -32768).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4600
     * @tc.name      testVector01Chapter0046
     * @tc.desc      add Int16Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0046'
      let vector = new Vector<Int16Array>();
      let array = new Int16Array([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4700
     * @tc.name      testVector01Chapter0047
     * @tc.desc      add Int16Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0047'
      let vector = new Vector<Int16Array>();
      let array = new Int16Array([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4800
     * @tc.name      testVector01Chapter0048
     * @tc.desc      add Int16Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0048'
      let vector = new Vector<Int16Array>();
      let array = new Int16Array([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_4900
     * @tc.name      testVector01Chapter0049
     * @tc.desc      add Uint16Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0049'
      let vector = new Vector<Uint16Array>();
      let array = new Uint16Array([0]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5000
     * @tc.name      testVector01Chapter0050
     * @tc.desc      add Uint16Array([65535]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0050'
      let vector = new Vector<Uint16Array>();
      let array = new Uint16Array([65535]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 65535).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5100
     * @tc.name      testVector01Chapter0051
     * @tc.desc      add Uint16Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0051'
      let vector = new Vector<Uint16Array>();
      let array = new Uint16Array([-1]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 65535).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5200
     * @tc.name      testVector01Chapter0052
     * @tc.desc      add Uint16Array([65536]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0052'
      let vector = new Vector<Uint16Array>();
      let array = new Uint16Array([65536]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5300
     * @tc.name      testVector01Chapter0053
     * @tc.desc      add Uint16Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0053'
      let vector = new Vector<Uint16Array>();
      let array = new Uint16Array([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5400
     * @tc.name      testVector01Chapter0054
     * @tc.desc      add Uint16Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0054'
      let vector = new Vector<Uint16Array>();
      let array = new Uint16Array([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5500
     * @tc.name      testVector01Chapter0055
     * @tc.desc      add Uint16Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0055'
      let vector = new Vector<Uint16Array>();
      let array = new Uint16Array([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5600
     * @tc.name      testVector01Chapter0056
     * @tc.desc      add Int32Array([-2147483648]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0056'
      let vector = new Vector<Int32Array>();
      let array = new Int32Array([-2147483648]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === -2147483648).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5700
     * @tc.name      testVector01Chapter0057
     * @tc.desc      add Int32Array([2147483647]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0057'
      let vector = new Vector<Int32Array>();
      let array = new Int32Array([2147483647]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 2147483647).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5800
     * @tc.name      testVector01Chapter0058
     * @tc.desc      add Int32Array([-2147483649]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0058'
      let vector = new Vector<Int32Array>();
      let array = new Int32Array([-2147483649]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 2147483647).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_5900
     * @tc.name      testVector01Chapter0059
     * @tc.desc      add Int32Array([2147483648]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0059'
      let vector = new Vector<Int32Array>();
      let array = new Int32Array([2147483648]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === -2147483648).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6000
     * @tc.name      testVector01Chapter0060
     * @tc.desc      add Int32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0060'
      let vector = new Vector<Int32Array>();
      let array = new Int32Array([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6100
     * @tc.name      testVector01Chapter0061
     * @tc.desc      add Int32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0061'
      let vector = new Vector<Int32Array>();
      let array = new Int32Array([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6200
     * @tc.name      testVector01Chapter0062
     * @tc.desc      add Int32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0062'
      let vector = new Vector<Int32Array>();
      let array = new Int32Array([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6300
     * @tc.name      testVector01Chapter0063
     * @tc.desc      add Uint32Array([0]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0063'
      let vector = new Vector<Uint32Array>();
      let array = new Uint32Array([0]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6400
     * @tc.name      testVector01Chapter0064
     * @tc.desc      add Uint32Array([4294967295]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0064'
      let vector = new Vector<Uint32Array>();
      let array = new Uint32Array([4294967295]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 4294967295).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6500
     * @tc.name      testVector01Chapter0065
     * @tc.desc      add Uint32Array([-1]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0065'
      let vector = new Vector<Uint32Array>();
      let array = new Uint32Array([-1]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 4294967295).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6600
     * @tc.name      testVector01Chapter0066
     * @tc.desc      add Uint32Array([4294967296]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0066'
      let vector = new Vector<Uint32Array>();
      let array = new Uint32Array([4294967296]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6700
     * @tc.name      testVector01Chapter0067
     * @tc.desc      add Uint32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0067'
      let vector = new Vector<Uint32Array>();
      let array = new Uint32Array([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6800
     * @tc.name      testVector01Chapter0068
     * @tc.desc      add Uint32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0068'
      let vector = new Vector<Uint32Array>();
      let array = new Uint32Array([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_6900
     * @tc.name      testVector01Chapter0069
     * @tc.desc      add Uint32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0069'
      let vector = new Vector<Uint32Array>();
      let array = new Uint32Array([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7000
     * @tc.name      testVector01Chapter0070
     * @tc.desc      add Float32Array([-3.4028234663852886E38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0070'
      let vector = new Vector<Float32Array>();
      let array = new Float32Array([-3.4028234663852886E38]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === -3.4028234663852886E38).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7100
     * @tc.name      testVector01Chapter0071
     * @tc.desc      add Float32Array([3.4028234663852886E38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0071'
      let vector = new Vector<Float32Array>();
      let array = new Float32Array([3.4028234663852886E38]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 3.4028234663852886E38).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7200
     * @tc.name      testVector01Chapter0072
     * @tc.desc      add Float32Array([-3.5E38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0072'
      let vector = new Vector<Float32Array>();
      let array = new Float32Array([-3.5E38]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7300
     * @tc.name      testVector01Chapter0073
     * @tc.desc      add Float32Array([3.5E38]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0073'
      let vector = new Vector<Float32Array>();
      let array = new Float32Array([3.5E38]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7400
     * @tc.name      testVector01Chapter0074
     * @tc.desc      add Float32Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0074'
      let vector = new Vector<Float32Array>();
      let array = new Float32Array([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7500
     * @tc.name      testVector01Chapter0075
     * @tc.desc      add Float32Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0075'
      let vector = new Vector<Float32Array>();
      let array = new Float32Array([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7600
     * @tc.name      testVector01Chapter0076
     * @tc.desc      add Float32Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0076'
      let vector = new Vector<Float32Array>();
      let array = new Float32Array([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7700
     * @tc.name      testVector01Chapter0077
     * @tc.desc      add Float64Array([-1.7976931348623157E308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0077", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0077'
      let vector = new Vector<Float64Array>();
      let array = new Float64Array([-1.7976931348623157E308]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === -1.7976931348623157E308).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7800
     * @tc.name      testVector01Chapter0078
     * @tc.desc      add Float64Array([1.7976931348623157E308]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0078", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0078'
      let vector = new Vector<Float64Array>();
      let array = new Float64Array([1.7976931348623157E308]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 1.7976931348623157E308).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_7900
     * @tc.name      testVector01Chapter0079
     * @tc.desc      add Float64Array([-Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0079", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0079'
      let vector = new Vector<Float64Array>();
      let array = new Float64Array([-Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8000
     * @tc.name      testVector01Chapter0080
     * @tc.desc      add Float64Array([Infinity]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0080'
      let vector = new Vector<Float64Array>();
      let array = new Float64Array([Infinity]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8100
     * @tc.name      testVector01Chapter0081
     * @tc.desc      add Float64Array([NaN]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0081", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0081'
      let vector = new Vector<Float64Array>();
      let array = new Float64Array([NaN]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8200
     * @tc.name      testVector01Chapter0082
     * @tc.desc      add BigInt64Array([-9223372036854775808n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0082", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0082'
      let vector = new Vector<BigInt64Array>();
      let array = new BigInt64Array([-9223372036854775808n]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === -9223372036854775808n).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8300
     * @tc.name      testVector01Chapter0083
     * @tc.desc      add BigInt64Array([9223372036854775807n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0083", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0083'
      let vector = new Vector<BigInt64Array>();
      let array = new BigInt64Array([9223372036854775807n]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 9223372036854775807n).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8400
     * @tc.name      testVector01Chapter0084
     * @tc.desc      add BigInt64Array([-9223372036854775809n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0084", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0084'
      let vector = new Vector<BigInt64Array>();
      let array = new BigInt64Array([-9223372036854775809n]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8500
     * @tc.name      testVector01Chapter0085
     * @tc.desc      add BigInt64Array([9223372036854775808n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0085", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0085'
      let vector = new Vector<BigInt64Array>();
      let array = new BigInt64Array([9223372036854775808n]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8600
     * @tc.name      testVector01Chapter0086
     * @tc.desc      add BigUint64Array([0n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0086", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0086'
      let vector = new Vector<BigUint64Array>();
      let array = new BigUint64Array([0n]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 0n).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8700
     * @tc.name      testVector01Chapter0087
     * @tc.desc      add BigUint64Array([18446744073709551615n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0087", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0087'
      let vector = new Vector<BigUint64Array>();
      let array = new BigUint64Array([18446744073709551615n]);
      let result = vector.add(array);
      expect(result).assertTrue();
      expect(vector[0][0] === 18446744073709551615n).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8800
     * @tc.name      testVector01Chapter0088
     * @tc.desc      add BigUint64Array([-1n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0088", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0088'
      let vector = new Vector<BigUint64Array>();
      let array = new BigUint64Array([-1n]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_8900
     * @tc.name      testVector01Chapter0089
     * @tc.desc      add BigUint64Array([18446744073709551616n]) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0089", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0089'
      let vector = new Vector<BigUint64Array>();
      let array = new BigUint64Array([18446744073709551616n]);
      let result = vector.add(array);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9000
     * @tc.name      testVector01Chapter0090
     * @tc.desc      add string(undefined) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0090'
      let vector = new Vector<string>();
      let result = vector.add(undefined);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9100
     * @tc.name      testVector01Chapter0091
     * @tc.desc      add string(null) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0091", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0091'
      let vector = new Vector<string>();
      let result = vector.add(null);
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9200
     * @tc.name      testVector01Chapter0092
     * @tc.desc      add string("") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0092", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0092'
      let vector = new Vector<string>();
      let result = vector.add("");
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9300
     * @tc.name      testVector01Chapter0093
     * @tc.desc      add string("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0093", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0093'
      let vector = new Vector<string>();
      let result = vector.add("!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~");
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9400
     * @tc.name      testVector01Chapter0094
     * @tc.desc      add string(!"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_`abcdefghijklmnopqrstuvwxyz{|}~) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0094", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0094'
      let vector = new Vector<string>();
      let result =
        vector.add('!"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~')
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9500
     * @tc.name      testVector01Chapter0095
     * @tc.desc      add string(!!""##$$%%&&''(())**++,,--..//::;;<<==>>??@@[[\\]]^^__``{{||}}~~) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0095", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0095'
      let vector = new Vector<string>();
      let result = vector.add('!!""##$$%%&&\'\'(())**++,,--..//::;;<<==>>??@@[[\\\\]]^^__``{{||}}~~')
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9600
     * @tc.name      testVector01Chapter0096
     * @tc.desc      add string(\a) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0096", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0096'
      let vector = new Vector<string>();
      let result = vector.add('\a')
      expect(result).assertTrue();
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9700
     * @tc.name      testVector01Chapter0097
     * @tc.desc      add string(\b) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0097", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0097'
      let vector = new Vector<string>();
      let result = vector.add('\b')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(8);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9800
     * @tc.name      testVector01Chapter0098
     * @tc.desc      add string(\f) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0098", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0098'
      let vector = new Vector<string>();
      let result = vector.add('\f')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(12);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_9900
     * @tc.name      testVector01Chapter0099
     * @tc.desc      add string(\n) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0099", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0099'
      let vector = new Vector<string>();
      let result = vector.add('\n')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(10);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10000
     * @tc.name      testVector01Chapter0100
     * @tc.desc      add string(\r) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0100'
      let vector = new Vector<string>();
      let result = vector.add('\r')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(13);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10100
     * @tc.name      testVector01Chapter0101
     * @tc.desc      add string(\t) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0101", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0101'
      let vector = new Vector<string>();
      let result = vector.add('\t')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(9);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10200
     * @tc.name      testVector01Chapter0102
     * @tc.desc      add string(\v) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0102", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0102'
      let vector = new Vector<string>();
      let result = vector.add('\v')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(11);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10300
     * @tc.name      testVector01Chapter0103
     * @tc.desc      add string(\\) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0103", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0103'
      let vector = new Vector<string>();
      let result = vector.add('\\')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(92);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10400
     * @tc.name      testVector01Chapter0104
     * @tc.desc      add string(\') test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0104", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0104'
      let vector = new Vector<string>();
      let result = vector.add('\'')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(39);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10500
     * @tc.name      testVector01Chapter0105
     * @tc.desc      add string(\") test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0105", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0105'
      let vector = new Vector<string>();
      let result = vector.add('\"')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(34);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10600
     * @tc.name      testVector01Chapter0106
     * @tc.desc      add string(\?) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0106", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0106'
      let vector = new Vector<string>();
      let result = vector.add('\?')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(63);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10700
     * @tc.name      testVector01Chapter0107
     * @tc.desc      add string(\0) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0107", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0107'
      let vector = new Vector<string>();
      let result = vector.add('\0')
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10800
     * @tc.name      testVector01Chapter0108
     * @tc.desc      add string(\ddd) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0108", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0108'
      let vector = new Vector<string>();
      const targetChar = String.fromCharCode(31);
      const expectedAscii = 31;
      const expectedOctal = "37";
      const result = vector.add(targetChar);
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(expectedAscii);
      expect((31).toString(8)).assertEqual(expectedOctal);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_10900
     * @tc.name      testVector01Chapter0109
     * @tc.desc      add string(\xdd) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0109", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0109'
      let vector = new Vector<string>();
      const escapeChar = '\x07';
      const expectedAscii = 7;
      const result = vector.add(escapeChar);
      expect(result).assertTrue();
      expect(vector[0].charCodeAt(0)).assertEqual(expectedAscii);
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_11000
     * @tc.name      testVector01Chapter0110
     * @tc.desc      add string(👆) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0110", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0110'
      let vector = new Vector<string>();
      let result = vector.add('👆')
      expect(result).assertTrue();
      expect(vector[0]).assertEqual('\ud83d\udc46');
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_11100
     * @tc.name      testVector01Chapter0111
     * @tc.desc      add string(👿) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0111", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0111'
      let vector = new Vector<string>();
      let result = vector.add('👿')
      expect(result).assertTrue();
      expect(vector[0]).assertEqual('\ud83d\udc7f');
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_11200
     * @tc.name      testVector01Chapter0112
     * @tc.desc      add string(👀) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0112", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0112'
      let vector = new Vector<string>();
      let result = vector.add('👀')
      expect(result).assertTrue();
      expect(vector[0]).assertEqual('\ud83d\udc40');
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_11300
     * @tc.name      testVector01Chapter0113
     * @tc.desc      add string(😼) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0113", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0113'
      let vector = new Vector<string>();
      let result = vector.add('😼')
      expect(result).assertTrue();
      expect(vector[0]).assertEqual('\ud83d\ude3c');
    })

    /**
     * @tc.number    SUB_VECTOR_TEST01_11400
     * @tc.name      testVector01Chapter0114
     * @tc.desc      add string(\udc04) test
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testVector01Chapter0114", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const TAG = 'testVector01Chapter0114'
      let vector = new Vector<string>();
      const illegalUnicode1 = '\udc04';
      const result = vector.add(illegalUnicode1);
      expect(result).assertTrue();
      const storedStr: string = vector[0];
      expect(storedStr !== undefined).assertTrue();
    })

  })
}