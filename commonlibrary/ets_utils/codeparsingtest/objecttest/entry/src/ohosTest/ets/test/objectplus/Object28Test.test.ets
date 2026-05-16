import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import * as Object28 from './Object28Test';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object28Test() {
  describe('Object28Test', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(30);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
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
     * @tc.name   Object28Test001
     * @tc.number SUB_BUILTINS_Object28_TEST_0100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn01_testBasicFunctionality();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test002
     * @tc.number SUB_BUILTINS_Object28_TEST_0200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn02_testPropertyOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test003
     * @tc.number SUB_BUILTINS_Object28_TEST_0300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn03_testSpecialInputs();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test004
     * @tc.number SUB_BUILTINS_Object28_TEST_0400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn04_testEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test005
     * @tc.number SUB_BUILTINS_Object28_TEST_0500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn05_testSingleProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test006
     * @tc.number SUB_BUILTINS_Object28_TEST_0600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn06_testSymbolKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test007
     * @tc.number SUB_BUILTINS_Object28_TEST_0700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn07_testNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test008
     * @tc.number SUB_BUILTINS_Object28_TEST_0800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn08_testArrayAsObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test009
     * @tc.number SUB_BUILTINS_Object28_TEST_0900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn09_testArrayLike();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test010
     * @tc.number SUB_BUILTINS_Object28_TEST_1000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn10_testInheritedProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test011
     * @tc.number SUB_BUILTINS_Object28_TEST_1100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn11_testDateObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test013
     * @tc.number SUB_BUILTINS_Object28_TEST_1300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn13_testMixedKeyTypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test014
     * @tc.number SUB_BUILTINS_Object28_TEST_1400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn14_testObjectCreate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test015
     * @tc.number SUB_BUILTINS_Object28_TEST_1500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn15_testGetterProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test016
     * @tc.number SUB_BUILTINS_Object28_TEST_1600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn16_testBooleanObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test017
     * @tc.number SUB_BUILTINS_Object28_TEST_1700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn17_testNumberObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test018
     * @tc.number SUB_BUILTINS_Object28_TEST_01800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn18_testStringObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test019
     * @tc.number SUB_BUILTINS_Object28_TEST_01900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn19_testMapObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test020
     * @tc.number SUB_BUILTINS_Object28_TEST_02000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn20_testSetObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test021
     * @tc.number SUB_BUILTINS_Object28_TEST_2100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn21_testFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test022
     * @tc.number SUB_BUILTINS_Object28_TEST_2200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn22_testSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test023
     * @tc.number SUB_BUILTINS_Object28_TEST_2300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn23_testExtensibleObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test024
     * @tc.number SUB_BUILTINS_Object28_TEST_2400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn24_testNullValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test025
     * @tc.number SUB_BUILTINS_Object28_TEST_2500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn25_testUndefinedValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test026
     * @tc.number SUB_BUILTINS_Object28_TEST_2600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn26_testNestedObjects();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test027
     * @tc.number SUB_BUILTINS_Object28_TEST_2700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn27_testBigIntValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test028
     * @tc.number SUB_BUILTINS_Object28_TEST_2800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn28_testFunctionValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test029
     * @tc.number SUB_BUILTINS_Object28_TEST_2900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn29_testArrayValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test030
     * @tc.number SUB_BUILTINS_Object28_TEST_3000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn30_testRegExpValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test031
     * @tc.number SUB_BUILTINS_Object28_TEST_3100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn31_testDateValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test032
     * @tc.number SUB_BUILTINS_Object28_TEST_3200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn32_testInfinityValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test033
     * @tc.number SUB_BUILTINS_Object28_TEST_3300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn33_testNaNValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test034
     * @tc.number SUB_BUILTINS_Object28_TEST_3400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn34_testDefinedEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test035
     * @tc.number SUB_BUILTINS_Object28_TEST_3500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn35_testArrayIndices();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test036
     * @tc.number SUB_BUILTINS_Object28_TEST_3600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn36_testSparseArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test037
     * @tc.number SUB_BUILTINS_Object28_TEST_3700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn37_testArrayLikeLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test038
     * @tc.number SUB_BUILTINS_Object28_TEST_3800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn38_testMockDomElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test039
     * @tc.number SUB_BUILTINS_Object28_TEST_3900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn39_testCircularReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test040
     * @tc.number SUB_BUILTINS_Object28_TEST_4000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn40_testProxyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test041
     * @tc.number SUB_BUILTINS_Object28_TEST_4100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn41_testGeneratorObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test042
     * @tc.number SUB_BUILTINS_Object28_TEST_4200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn42_testPromiseObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test043
     * @tc.number SUB_BUILTINS_Object28_TEST_4300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn43_testDuplicateValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test044
     * @tc.number SUB_BUILTINS_Object28_TEST_4400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn44_testEmptyStringKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test045
     * @tc.number SUB_BUILTINS_Object28_TEST_4500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn45_testSpecialCharKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test046
     * @tc.number SUB_BUILTINS_Object28_TEST_4600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn46_testNumberStringKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test047
     * @tc.number SUB_BUILTINS_Object28_TEST_4700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn47_testSymbolForKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test048
     * @tc.number SUB_BUILTINS_Object28_TEST_4800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn48_testPrototypeEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test049
     * @tc.number SUB_BUILTINS_Object28_TEST_4900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn49_testOwnVsPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test050
     * @tc.number SUB_BUILTINS_Object28_TEST_5000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn50_testModifiedPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test051
     * @tc.number SUB_BUILTINS_Object28_TEST_5100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn51_testEmptyArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test052
     * @tc.number SUB_BUILTINS_Object28_TEST_5200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn52_testSingleElementArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test053
     * @tc.number SUB_BUILTINS_Object28_TEST_5300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn53_testMultiDimensionalArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test054
     * @tc.number SUB_BUILTINS_Object28_TEST_5400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn54_testTypedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test055
     * @tc.number SUB_BUILTINS_Object28_TEST_5500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn55_testArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test056
     * @tc.number SUB_BUILTINS_Object28_TEST_5600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn56_testDataView();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test057
     * @tc.number SUB_BUILTINS_Object28_TEST_5700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn57_testObjectWithFunctions();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test058
     * @tc.number SUB_BUILTINS_Object28_TEST_5800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn58_testArrowFunctionProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test059
     * @tc.number SUB_BUILTINS_Object28_TEST_5900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn59_testAsyncFunctionProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test060
     * @tc.number SUB_BUILTINS_Object28_TEST_6000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn60_testGeneratorFunctionProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test061
     * @tc.number SUB_BUILTINS_Object28_TEST_6100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn61_testClassAsProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test062
     * @tc.number SUB_BUILTINS_Object28_TEST_6200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn62_testInstanceAsProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test063
     * @tc.number SUB_BUILTINS_Object28_TEST_6300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn63_testErrorAsProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test064
     * @tc.number SUB_BUILTINS_Object28_TEST_6400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn64_testNonSerializableValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test065
     * @tc.number SUB_BUILTINS_Object28_TEST_6500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn65_testKeysValuesCorrespondence();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test066
     * @tc.number SUB_BUILTINS_Object28_TEST_6600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn66_testSymbolValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test067
     * @tc.number SUB_BUILTINS_Object28_TEST_6700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn67_testNullAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test068
     * @tc.number SUB_BUILTINS_Object28_TEST_6800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn68_testUndefinedAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test069
     * @tc.number SUB_BUILTINS_Object28_TEST_6900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn69_testNaNAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test070
     * @tc.number SUB_BUILTINS_Object28_TEST_7000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn70_testInfinityAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test071
     * @tc.number SUB_BUILTINS_Object28_TEST_7100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn71_testNegativeInfinityAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test072
     * @tc.number SUB_BUILTINS_Object28_TEST_7200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn72_testLargeNumberKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test073
     * @tc.number SUB_BUILTINS_Object28_TEST_7300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn73_testDecimalNumberKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test074
     * @tc.number SUB_BUILTINS_Object28_TEST_7400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn74_testScientificNotationKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test075
     * @tc.number SUB_BUILTINS_Object28_TEST_7500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn75_testAfterDeleteProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test076
     * @tc.number SUB_BUILTINS_Object28_TEST_7600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn76_testDynamicallyAddedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test077
     * @tc.number SUB_BUILTINS_Object28_TEST_7700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn77_testDeleteProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test079
     * @tc.number SUB_BUILTINS_Object28_TEST_7900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn79_testSealedModifyProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test080
     * @tc.number SUB_BUILTINS_Object28_TEST_8000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn80_testExtensibleAddProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test081
     * @tc.number SUB_BUILTINS_Object28_TEST_8100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn81_testDateInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test082
     * @tc.number SUB_BUILTINS_Object28_TEST_8200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn82_testRegExpInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test083
     * @tc.number SUB_BUILTINS_Object28_TEST_8300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn83_testMapInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test084
     * @tc.number SUB_BUILTINS_Object28_TEST_8400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn84_testSetInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test085
     * @tc.number SUB_BUILTINS_Object28_TEST_8500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn85_testWeakMapInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test086
     * @tc.number SUB_BUILTINS_Object28_TEST_8600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn86_testWeakSetInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test087
     * @tc.number SUB_BUILTINS_Object28_TEST_8700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn87_testArrayBufferInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test088
     * @tc.number SUB_BUILTINS_Object28_TEST_8800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn88_testPromiseInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test089
     * @tc.number SUB_BUILTINS_Object28_TEST_8900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn89_testProxyInstanceProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test090
     * @tc.number SUB_BUILTINS_Object28_TEST_9000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn90_testReflectProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test091
     * @tc.number SUB_BUILTINS_Object28_TEST_9100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn91_testMathProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test092
     * @tc.number SUB_BUILTINS_Object28_TEST_9200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn92_testJSONProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test093
     * @tc.number SUB_BUILTINS_Object28_TEST_9300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn93_testGlobalObjectProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test094
     * @tc.number SUB_BUILTINS_Object28_TEST_9400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn94_testMockDomEvent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test098
     * @tc.number SUB_BUILTINS_Object28_TEST_9800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn98_testArgumentsObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test099
     * @tc.number SUB_BUILTINS_Object28_TEST_9900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn99_testNumberConstants();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test100
     * @tc.number SUB_BUILTINS_Object28_TEST_10000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn100_testMultipleSymbolValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test101
     * @tc.number SUB_BUILTINS_Object28_TEST_10100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn101_testIntlObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test103
     * @tc.number SUB_BUILTINS_Object28_TEST_10300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn103_testPrivateClassProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test104
     * @tc.number SUB_BUILTINS_Object28_TEST_10400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn104_testObjectAssign();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test105
     * @tc.number SUB_BUILTINS_Object28_TEST_10500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn105_testUnicodePropertyNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test106
     * @tc.number SUB_BUILTINS_Object28_TEST_10600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn106_testLongPropertyNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test107
     * @tc.number SUB_BUILTINS_Object28_TEST_10700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn107_testModifiedArrayPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test108
     * @tc.number SUB_BUILTINS_Object28_TEST_10800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn108_testShadowRootMock();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test109
     * @tc.number SUB_BUILTINS_Object28_TEST_10900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn109_testAtomicsProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test110
     * @tc.number SUB_BUILTINS_Object28_TEST_11000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn110_testFinalizationRegistry();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test111
     * @tc.number SUB_BUILTINS_Object28_TEST_11100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn111_testWeakRefObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test112
     * @tc.number SUB_BUILTINS_Object28_TEST_11200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn112_testArrayCustomProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test113
     * @tc.number SUB_BUILTINS_Object28_TEST_11300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn113_testFunctionCustomProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test114
     * @tc.number SUB_BUILTINS_Object28_TEST_11400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn114_testGeneratorFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test115
     * @tc.number SUB_BUILTINS_Object28_TEST_11500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn115_testAsyncFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test116
     * @tc.number SUB_BUILTINS_Object28_TEST_11600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn116_testErrorSubclass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test118
     * @tc.number SUB_BUILTINS_Object28_TEST_11800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn118_testArrayBufferViews();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test119
     * @tc.number SUB_BUILTINS_Object28_TEST_11900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn119_testMapIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test120
     * @tc.number SUB_BUILTINS_Object28_TEST_12000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn120_testSetIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test121
     * @tc.number SUB_BUILTINS_Object28_TEST_12100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn121_testStringIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test122
     * @tc.number SUB_BUILTINS_Object28_TEST_12200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn122_testArrayIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test123
     * @tc.number SUB_BUILTINS_Object28_TEST_12300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn123_testMultiLevelPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test124
     * @tc.number SUB_BUILTINS_Object28_TEST_12400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn124_testProxyModifyProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test125
     * @tc.number SUB_BUILTINS_Object28_TEST_12500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn125_testProxyGetInterceptor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test126
     * @tc.number SUB_BUILTINS_Object28_TEST_12600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn126_testEmptyIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test127
     * @tc.number SUB_BUILTINS_Object28_TEST_12700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn127_testIterableObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test128
     * @tc.number SUB_BUILTINS_Object28_TEST_12800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn128_testObjectWithIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test129
     * @tc.number SUB_BUILTINS_Object28_TEST_12900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn129_testMathExtension();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test130
     * @tc.number SUB_BUILTINS_Object28_TEST_13000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn130_testJSONExtension();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test131
     * @tc.number SUB_BUILTINS_Object28_TEST_13100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn131_testBigIntObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test132
     * @tc.number SUB_BUILTINS_Object28_TEST_13200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn132_testSymbolHasInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test133
     * @tc.number SUB_BUILTINS_Object28_TEST_13300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn133_testSymbolToStringTag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test134
     * @tc.number SUB_BUILTINS_Object28_TEST_13400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn134_testDynamicPropertyModification();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test135
     * @tc.number SUB_BUILTINS_Object28_TEST_13500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn135_testManyProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test136
     * @tc.number SUB_BUILTINS_Object28_TEST_13600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn136_testEmojiPropertyNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test137
     * @tc.number SUB_BUILTINS_Object28_TEST_13700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn137_testControlCharPropertyNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test138
     * @tc.number SUB_BUILTINS_Object28_TEST_13800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn138_testGetterAndSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test142
     * @tc.number SUB_BUILTINS_Object28_TEST_14200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn142_testModuleNamespace();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test143
     * @tc.number SUB_BUILTINS_Object28_TEST_14300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn143_testWeakMapPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test144
     * @tc.number SUB_BUILTINS_Object28_TEST_14400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn144_testWeakSetPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test145
     * @tc.number SUB_BUILTINS_Object28_TEST_14500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn145_testArrayBufferPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test146
     * @tc.number SUB_BUILTINS_Object28_TEST_14600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn146_testDataViewPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test147
     * @tc.number SUB_BUILTINS_Object28_TEST_14700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn147_testPromisePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test148
     * @tc.number SUB_BUILTINS_Object28_TEST_14800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn148_testFunctionPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test149
     * @tc.number SUB_BUILTINS_Object28_TEST_14900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn149_testNumberPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test150
     * @tc.number SUB_BUILTINS_Object28_TEST_15000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn150_testStringPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test151
     * @tc.number SUB_BUILTINS_Object28_TEST_15100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn151_testBooleanPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test152
     * @tc.number SUB_BUILTINS_Object28_TEST_15200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn152_testDatePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test153
     * @tc.number SUB_BUILTINS_Object28_TEST_15300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn153_testRegExpPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test154
     * @tc.number SUB_BUILTINS_Object28_TEST_15400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn154_testArrayPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test155
     * @tc.number SUB_BUILTINS_Object28_TEST_15500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn155_testMapPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test156
     * @tc.number SUB_BUILTINS_Object28_TEST_15600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn156_testSetPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test157
     * @tc.number SUB_BUILTINS_Object28_TEST_15700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn157_testErrorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test161
     * @tc.number SUB_BUILTINS_Object28_TEST_16100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn161_testDeepNestedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test162
     * @tc.number SUB_BUILTINS_Object28_TEST_16200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn162_testSelfReferentialProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test163
     * @tc.number SUB_BUILTINS_Object28_TEST_16300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn163_testOtherObjectReference();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test164
     * @tc.number SUB_BUILTINS_Object28_TEST_16400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn164_testFunctionResultProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test165
     * @tc.number SUB_BUILTINS_Object28_TEST_16500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn165_testComputedPropertyNames();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test166
     * @tc.number SUB_BUILTINS_Object28_TEST_16600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn166_testTemplateLiteralKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test167
     * @tc.number SUB_BUILTINS_Object28_TEST_16700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn167_testSymbolExpressionKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test168
     * @tc.number SUB_BUILTINS_Object28_TEST_16800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn168_testClassStaticProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test169
     * @tc.number SUB_BUILTINS_Object28_TEST_16900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn169_testClassInstanceMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test170
     * @tc.number SUB_BUILTINS_Object28_TEST_17000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn170_testClassStaticMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test171
     * @tc.number SUB_BUILTINS_Object28_TEST_17100
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn171_testExtendedBuiltinClass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test172
     * @tc.number SUB_BUILTINS_Object28_TEST_17200
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn172_testDefaultPropertyValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test173
     * @tc.number SUB_BUILTINS_Object28_TEST_17300
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn173_testRegExpAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test174
     * @tc.number SUB_BUILTINS_Object28_TEST_17400
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn174_testDateAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test175
     * @tc.number SUB_BUILTINS_Object28_TEST_17500
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn175_testMapAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test176
     * @tc.number SUB_BUILTINS_Object28_TEST_17600
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn176_testSetAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test177
     * @tc.number SUB_BUILTINS_Object28_TEST_17700
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn177_testWeakMapAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test178
     * @tc.number SUB_BUILTINS_Object28_TEST_17800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn178_testWeakSetAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test179
     * @tc.number SUB_BUILTINS_Object28_TEST_17900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn179_testArrayBufferAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test180
     * @tc.number SUB_BUILTINS_Object28_TEST_1800
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn180_testDataViewAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test181
     * @tc.number SUB_BUILTINS_Object28_TEST_1810
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn181_testPromiseAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test183
     * @tc.number SUB_BUILTINS_Object28_TEST_1830
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn183_testGeneratorAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test184
     * @tc.number SUB_BUILTINS_Object28_TEST_1840
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn184_testErrorAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test188
     * @tc.number SUB_BUILTINS_Object28_TEST_1880
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn188_testIntlAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test189
     * @tc.number SUB_BUILTINS_Object28_TEST_1890
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn189_testFinalizationRegistryAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test190
     * @tc.number SUB_BUILTINS_Object28_TEST_1900
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn190_testWeakRefAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test191
     * @tc.number SUB_BUILTINS_Object28_TEST_1910
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn191_testBigIntAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test192
     * @tc.number SUB_BUILTINS_Object28_TEST_1920
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn192_testSymbolAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test193
     * @tc.number SUB_BUILTINS_Object28_TEST_1930
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn193_testFunctionAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test194
     * @tc.number SUB_BUILTINS_Object28_TEST_1940
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn194_testArrayAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test195
     * @tc.number SUB_BUILTINS_Object28_TEST_1950
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn195_testObjectAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test196
     * @tc.number SUB_BUILTINS_Object28_TEST_1960
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn196_testStringAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test197
     * @tc.number SUB_BUILTINS_Object28_TEST_1970
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn197_testNumberAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test198
     * @tc.number SUB_BUILTINS_Object28_TEST_1980
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn198_testBooleanAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test199
     * @tc.number SUB_BUILTINS_Object28_TEST_1990
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn199_testNullAsValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object28Test200
     * @tc.number SUB_BUILTINS_Object28_TEST_2000
     * @tc.desc   test object values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object28Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object28.Fn200_testUndefinedAsValue();
      expect(result).assertEqual(true);
    });
  })
}