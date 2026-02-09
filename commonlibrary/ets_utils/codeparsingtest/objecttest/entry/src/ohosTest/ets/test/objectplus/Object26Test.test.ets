import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import * as Object26 from './Object26Test';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object26Test() {
  describe('Object26Test', () => {
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
     * @tc.name   Object26Test001
     * @tc.number SUB_BUILTINS_Object26_TEST_0100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn01_cannotAddNewProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test002
     * @tc.number SUB_BUILTINS_Object26_TEST_0200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn02_cannotDeleteProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test003
     * @tc.number SUB_BUILTINS_Object26_TEST_0300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn03_canModifyExistingProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test004
     * @tc.number SUB_BUILTINS_Object26_TEST_0400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn04_shouldBeSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test005
     * @tc.number SUB_BUILTINS_Object26_TEST_0500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn05_cannotChangeConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test006
     * @tc.number SUB_BUILTINS_Object26_TEST_0600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn06_cannotMakeWritableToNonWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test007
     * @tc.number SUB_BUILTINS_Object26_TEST_0700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn07_cannotChangePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test008
     * @tc.number SUB_BUILTINS_Object26_TEST_0800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn08_sealedArrayCannotAddElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test009
     * @tc.number SUB_BUILTINS_Object26_TEST_0900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn09_sealedArrayCannotDeleteElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test010
     * @tc.number SUB_BUILTINS_Object26_TEST_1000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn10_cannotModifyNonWritableProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test011
     * @tc.number SUB_BUILTINS_Object26_TEST_1100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn11_definePropertyAddFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test012
     * @tc.number SUB_BUILTINS_Object26_TEST_1200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn12_definePropertyModifyValueWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test013
     * @tc.number SUB_BUILTINS_Object26_TEST_1300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn13_inheritedPropertiesUnaffected();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test014
     * @tc.number SUB_BUILTINS_Object26_TEST_1400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn14_sealedEmptyObjectCannotAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test015
     * @tc.number SUB_BUILTINS_Object26_TEST_1500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn15_cannotDeleteSymbolProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test016
     * @tc.number SUB_BUILTINS_Object26_TEST_1600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn16_cannotDeleteNonEnumerableProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test017
     * @tc.number SUB_BUILTINS_Object26_TEST_1700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn17_accessorSetterWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test018
     * @tc.number SUB_BUILTINS_Object26_TEST_1800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn18_assignAddsNothing();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test019
     * @tc.number SUB_BUILTINS_Object26_TEST_1900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn19_cannotChangeEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test020
     * @tc.number SUB_BUILTINS_Object26_TEST_2000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn20_propertyConfigurableIsFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test021
     * @tc.number SUB_BUILTINS_Object26_TEST_2100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn21_deleteNonExistentReturnsFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test022
     * @tc.number SUB_BUILTINS_Object26_TEST_2200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn22_preventExtensionsOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test023
     * @tc.number SUB_BUILTINS_Object26_TEST_2300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn23_sealFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test024
     * @tc.number SUB_BUILTINS_Object26_TEST_2400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn24_resealObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test025
     * @tc.number SUB_BUILTINS_Object26_TEST_2500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn25_cannotChangeToAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test026
     * @tc.number SUB_BUILTINS_Object26_TEST_2600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn26_toStringWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test027
     * @tc.number SUB_BUILTINS_Object26_TEST_2700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn27_forInEnumerates();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test028
     * @tc.number SUB_BUILTINS_Object26_TEST_2800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn28_objectKeysWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test029
     * @tc.number SUB_BUILTINS_Object26_TEST_2900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn29_getOwnPropertyNamesWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test030
     * @tc.number SUB_BUILTINS_Object26_TEST_3000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn30_getOwnPropertySymbolsWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test031
     * @tc.number SUB_BUILTINS_Object26_TEST_3100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn31_sealedArrayModifyElement();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test032
     * @tc.number SUB_BUILTINS_Object26_TEST_3200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn32_sealedArrayPushFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test033
     * @tc.number SUB_BUILTINS_Object26_TEST_3300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn33_sealedArrayPopFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test034
     * @tc.number SUB_BUILTINS_Object26_TEST_3400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn34_cannotChangeGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test035
     * @tc.number SUB_BUILTINS_Object26_TEST_3500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn35_cannotChangeSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test036
     * @tc.number SUB_BUILTINS_Object26_TEST_3600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn36_nestedObjectModifiable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test037
     * @tc.number SUB_BUILTINS_Object26_TEST_3700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn37_inOperatorWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test038
     * @tc.number SUB_BUILTINS_Object26_TEST_3800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn38_hasOwnPropertyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test039
     * @tc.number SUB_BUILTINS_Object26_TEST_3900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn39_valueOfWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test040
     * @tc.number SUB_BUILTINS_Object26_TEST_4000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean | undefined = Object26.Fn40_writableRemainsTrue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test041
     * @tc.number SUB_BUILTINS_Object26_TEST_4100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn41_nonWritableRemains();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test042
     * @tc.number SUB_BUILTINS_Object26_TEST_4200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn42_getPrototypeWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test043
     * @tc.number SUB_BUILTINS_Object26_TEST_4300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn43_canDeletePrototypeProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test044
     * @tc.number SUB_BUILTINS_Object26_TEST_4400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn44_canAddToPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test045
     * @tc.number SUB_BUILTINS_Object26_TEST_4500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn45_sealedFunctionNoNewProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test046
     * @tc.number SUB_BUILTINS_Object26_TEST_4600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn46_cannotChangeFunctionName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test047
     * @tc.number SUB_BUILTINS_Object26_TEST_4700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn47_jsonStringifyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test048
     * @tc.number SUB_BUILTINS_Object26_TEST_4800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn48_objectEntriesWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test049
     * @tc.number SUB_BUILTINS_Object26_TEST_4900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn49_objectValuesWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test050
     * @tc.number SUB_BUILTINS_Object26_TEST_5000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn50_cannotAddNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test051
     * @tc.number SUB_BUILTINS_Object26_TEST_5100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn51_canChangeValueType();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test052
     * @tc.number SUB_BUILTINS_Object26_TEST_5200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn52_canModifyNullValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test053
     * @tc.number SUB_BUILTINS_Object26_TEST_5300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn53_canModifyUndefinedValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test054
     * @tc.number SUB_BUILTINS_Object26_TEST_5400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn54_sealedObjectIsNonExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test055
     * @tc.number SUB_BUILTINS_Object26_TEST_5500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn55_sealNonExtensibleObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test056
     * @tc.number SUB_BUILTINS_Object26_TEST_5600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn56_cannotModifyNonWritableWithDefine();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test057
     * @tc.number SUB_BUILTINS_Object26_TEST_5700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn57_reflectDeleteFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test058
     * @tc.number SUB_BUILTINS_Object26_TEST_5800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn58_reflectSetAddFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test059
     * @tc.number SUB_BUILTINS_Object26_TEST_5900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn59_reflectSetModifyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test060
     * @tc.number SUB_BUILTINS_Object26_TEST_6000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn60_reflectDefineAddFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test061
     * @tc.number SUB_BUILTINS_Object26_TEST_6100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn61_reflectDefineModifyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test062
     * @tc.number SUB_BUILTINS_Object26_TEST_6200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn62_reflectDefineConfigurableFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test063
     * @tc.number SUB_BUILTINS_Object26_TEST_6300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn63_cannotDeleteMultipleProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test064
     * @tc.number SUB_BUILTINS_Object26_TEST_6400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn64_cannotAddMultipleProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test065
     * @tc.number SUB_BUILTINS_Object26_TEST_6500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn65_nonEnumerableRemains();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test066
     * @tc.number SUB_BUILTINS_Object26_TEST_6600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn66_sealedDateCanModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test067
     * @tc.number SUB_BUILTINS_Object26_TEST_6700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn67_objectHasOwnWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test068
     * @tc.number SUB_BUILTINS_Object26_TEST_6800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn68_createWithSealedPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test069
     * @tc.number SUB_BUILTINS_Object26_TEST_6900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn69_instanceCanAddProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test070
     * @tc.number SUB_BUILTINS_Object26_TEST_7000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn70_spreadOperatorWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test071
     * @tc.number SUB_BUILTINS_Object26_TEST_7100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn71_assignToNewObjectWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test072
     * @tc.number SUB_BUILTINS_Object26_TEST_7200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn72_arrayPropertyModifiable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test073
     * @tc.number SUB_BUILTINS_Object26_TEST_7300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn73_objectPropertyModifiable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test074
     * @tc.number SUB_BUILTINS_Object26_TEST_7400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn74_objectIsSame();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test075
     * @tc.number SUB_BUILTINS_Object26_TEST_7500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn75_typeOfWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test076
     * @tc.number SUB_BUILTINS_Object26_TEST_7600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn76_instanceOfWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test077
     * @tc.number SUB_BUILTINS_Object26_TEST_7700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn77_sealedMapCannotAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test078
     * @tc.number SUB_BUILTINS_Object26_TEST_7800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn78_sealedSetCannotAdd();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test079
     * @tc.number SUB_BUILTINS_Object26_TEST_7900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn79_inheritedPropertiesModifiable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test080
     * @tc.number SUB_BUILTINS_Object26_TEST_8000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn80_allPropertiesNonConfigurable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test081
     * @tc.number SUB_BUILTINS_Object26_TEST_8100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn81_canModifyToObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test082
     * @tc.number SUB_BUILTINS_Object26_TEST_8200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn82_canModifyFunctionProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test083
     * @tc.number SUB_BUILTINS_Object26_TEST_8300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn83_deleteNonExistentNoEffect();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test084
     * @tc.number SUB_BUILTINS_Object26_TEST_8400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn84_keysLengthSame();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test085
     * @tc.number SUB_BUILTINS_Object26_TEST_8500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn85_getNamesLengthSame();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test086
     * @tc.number SUB_BUILTINS_Object26_TEST_8600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn86_sealedArrayIterable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test087
     * @tc.number SUB_BUILTINS_Object26_TEST_8700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn87_preventThenSeal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test088
     * @tc.number SUB_BUILTINS_Object26_TEST_8800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn88_sealReturnsSelf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test089
     * @tc.number SUB_BUILTINS_Object26_TEST_8900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean | undefined = Object26.Fn89_descriptorWritableCorrect();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test090
     * @tc.number SUB_BUILTINS_Object26_TEST_9000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn90_cannotAssignNonWritable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test091
     * @tc.number SUB_BUILTINS_Object26_TEST_9100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn91_hasOwnNonExistent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test092
     * @tc.number SUB_BUILTINS_Object26_TEST_9200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn92_canModifySymbolProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test093
     * @tc.number SUB_BUILTINS_Object26_TEST_9300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn93_canModifyNonEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test094
     * @tc.number SUB_BUILTINS_Object26_TEST_9400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn94_canOverrideToString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test095
     * @tc.number SUB_BUILTINS_Object26_TEST_9500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn95_canOverrideValueOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test096
     * @tc.number SUB_BUILTINS_Object26_TEST_9600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn96_getDescriptorWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test097
     * @tc.number SUB_BUILTINS_Object26_TEST_9700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn97_enumerableRemains();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test098
     * @tc.number SUB_BUILTINS_Object26_TEST_9800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn98_keysOrderPreserved();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test099
     * @tc.number SUB_BUILTINS_Object26_TEST_9900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn99_canModifyNaNValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test100
     * @tc.number SUB_BUILTINS_Object26_TEST_10000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn100_canModifyInfinityValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test101
     * @tc.number SUB_BUILTINS_Object26_TEST_10100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn101_canModifyBigIntValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test102
     * @tc.number SUB_BUILTINS_Object26_TEST_10200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn102_canModifySymbolValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test103
     * @tc.number SUB_BUILTINS_Object26_TEST_10300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn103_canModifyFunctionValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test104
     * @tc.number SUB_BUILTINS_Object26_TEST_10400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn104_canModifyRegExpValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test105
     * @tc.number SUB_BUILTINS_Object26_TEST_10500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn105_canModifyDateValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test106
     * @tc.number SUB_BUILTINS_Object26_TEST_10600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn106_destructuringWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test107
     * @tc.number SUB_BUILTINS_Object26_TEST_10700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn107_computedPropertyNameWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test108
     * @tc.number SUB_BUILTINS_Object26_TEST_10800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn108_arrayDestructuringWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test109
     * @tc.number SUB_BUILTINS_Object26_TEST_10900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn109_arithmeticOperationsWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test110
     * @tc.number SUB_BUILTINS_Object26_TEST_11000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn110_stringConcatenationWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test111
     * @tc.number SUB_BUILTINS_Object26_TEST_11100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn111_propertyAsFunctionParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test112
     * @tc.number SUB_BUILTINS_Object26_TEST_11200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn112_sealedAsFunctionParam();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test113
     * @tc.number SUB_BUILTINS_Object26_TEST_11300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn113_sealedAsReturnvalue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test114
     * @tc.number SUB_BUILTINS_Object26_TEST_11400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn114_jsonParseModifyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test115
     * @tc.number SUB_BUILTINS_Object26_TEST_11500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn115_templateStringWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test116
     * @tc.number SUB_BUILTINS_Object26_TEST_11600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn116_freezeNestedValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test117
     * @tc.number SUB_BUILTINS_Object26_TEST_11700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn117_resealNestedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test118
     * @tc.number SUB_BUILTINS_Object26_TEST_11800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn118_preventExtensionsNested();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test119
     * @tc.number SUB_BUILTINS_Object26_TEST_11900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn119_canModifyWeakMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test120
     * @tc.number SUB_BUILTINS_Object26_TEST_12000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn120_canModifyWeakSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test121
     * @tc.number SUB_BUILTINS_Object26_TEST_12100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn121_canModifyMapContent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test122
     * @tc.number SUB_BUILTINS_Object26_TEST_12200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn122_canModifySetContent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test123
     * @tc.number SUB_BUILTINS_Object26_TEST_12300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn123_canModifyError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test124
     * @tc.number SUB_BUILTINS_Object26_TEST_12400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn124_canModifyPromise();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test125
     * @tc.number SUB_BUILTINS_Object26_TEST_12500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn125_canModifyGenerator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test126
     * @tc.number SUB_BUILTINS_Object26_TEST_12600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn126_canModifyAsyncFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test127
     * @tc.number SUB_BUILTINS_Object26_TEST_12700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn127_fromEntriesWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test128
     * @tc.number SUB_BUILTINS_Object26_TEST_12800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn128_valuesIterationWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test129
     * @tc.number SUB_BUILTINS_Object26_TEST_12900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn129_entriesIterationWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test130
     * @tc.number SUB_BUILTINS_Object26_TEST_13000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn130_getDescriptorsWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test131
     * @tc.number SUB_BUILTINS_Object26_TEST_13100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn131_definePropertyModifyValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test132
     * @tc.number SUB_BUILTINS_Object26_TEST_13200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn132_cannotChangeToGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test133
     * @tc.number SUB_BUILTINS_Object26_TEST_13300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn133_cannotChangeToSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test134
     * @tc.number SUB_BUILTINS_Object26_TEST_13400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn134_cannotChangeAccessorToData();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test135
     * @tc.number SUB_BUILTINS_Object26_TEST_13500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn135_destructuringAssignmentModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test136
     * @tc.number SUB_BUILTINS_Object26_TEST_13600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn136_objectIsComparison();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test137
     * @tc.number SUB_BUILTINS_Object26_TEST_13700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn137_sealedAsMapKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test138
     * @tc.number SUB_BUILTINS_Object26_TEST_13800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn138_sealedInSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test139
     * @tc.number SUB_BUILTINS_Object26_TEST_13900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn139_jsonStringifyCorrect();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test140
     * @tc.number SUB_BUILTINS_Object26_TEST_14000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn140_modifyUndefinedProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test141
     * @tc.number SUB_BUILTINS_Object26_TEST_14100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn141_modifyNullProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test142
     * @tc.number SUB_BUILTINS_Object26_TEST_14200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn142_modifyBooleanProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test143
     * @tc.number SUB_BUILTINS_Object26_TEST_14300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn143_modifyStringProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test144
     * @tc.number SUB_BUILTINS_Object26_TEST_14400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn144_modifyArrayElements();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test145
     * @tc.number SUB_BUILTINS_Object26_TEST_14500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn145_modifyArrayLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test146
     * @tc.number SUB_BUILTINS_Object26_TEST_14600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn146_useArrayMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test147
     * @tc.number SUB_BUILTINS_Object26_TEST_14700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn147_addToNestedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test148
     * @tc.number SUB_BUILTINS_Object26_TEST_14800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn148_deleteFromNestedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test149
     * @tc.number SUB_BUILTINS_Object26_TEST_14900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn149_modifyNestedObjectProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test150
     * @tc.number SUB_BUILTINS_Object26_TEST_15000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn150_modifyClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test151
     * @tc.number SUB_BUILTINS_Object26_TEST_15100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn151_sealedInstanceNoNewProps();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test152
     * @tc.number SUB_BUILTINS_Object26_TEST_15200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn152_sealedInstanceNoDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test153
     * @tc.number SUB_BUILTINS_Object26_TEST_15300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn153_sealedInstanceModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test154
     * @tc.number SUB_BUILTINS_Object26_TEST_15400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn154_modifyArrowFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test155
     * @tc.number SUB_BUILTINS_Object26_TEST_15500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn155_modifyBoundFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test156
     * @tc.number SUB_BUILTINS_Object26_TEST_15600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn156_incrementNumberProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test157
     * @tc.number SUB_BUILTINS_Object26_TEST_15700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn157_decrementNumberProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test158
     * @tc.number SUB_BUILTINS_Object26_TEST_15800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn158_concatStringProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test159
     * @tc.number SUB_BUILTINS_Object26_TEST_15900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn159_logicalOperations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test160
     * @tc.number SUB_BUILTINS_Object26_TEST_16000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn160_comparisonOperations();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test161
     * @tc.number SUB_BUILTINS_Object26_TEST_16100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn161_typeOfProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test162
     * @tc.number SUB_BUILTINS_Object26_TEST_16200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn162_instanceOfProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test163
     * @tc.number SUB_BUILTINS_Object26_TEST_16300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn163_objectKeysWithSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test164
     * @tc.number SUB_BUILTINS_Object26_TEST_16400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn164_objectValuesWithSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test165
     * @tc.number SUB_BUILTINS_Object26_TEST_16500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn165_objectEntriesWithSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test166
     * @tc.number SUB_BUILTINS_Object26_TEST_16600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn166_assignFromSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test167
     * @tc.number SUB_BUILTINS_Object26_TEST_16700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn167_objectIsWithProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test168
     * @tc.number SUB_BUILTINS_Object26_TEST_16800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn168_modifyNaNToNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test169
     * @tc.number SUB_BUILTINS_Object26_TEST_16900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn169_modifyInfinityToNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test170
     * @tc.number SUB_BUILTINS_Object26_TEST_17000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn170_modifyNegativeInfinityToNumber();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test171
     * @tc.number SUB_BUILTINS_Object26_TEST_17100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn171_arrayForEachOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test172
     * @tc.number SUB_BUILTINS_Object26_TEST_17200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn172_arrayMapOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test173
     * @tc.number SUB_BUILTINS_Object26_TEST_17300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn173_arrayFilterOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test174
     * @tc.number SUB_BUILTINS_Object26_TEST_17400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn174_arrayReduceOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test175
     * @tc.number SUB_BUILTINS_Object26_TEST_17500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn175_nestedObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test176
     * @tc.number SUB_BUILTINS_Object26_TEST_17600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn176_nestedObjectValues();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test177
     * @tc.number SUB_BUILTINS_Object26_TEST_17700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn177_nestedObjectEntries();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test178
     * @tc.number SUB_BUILTINS_Object26_TEST_17800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn178_regexTestOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test179
     * @tc.number SUB_BUILTINS_Object26_TEST_17900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean | null = Object26.Fn179_regexExecOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test180
     * @tc.number SUB_BUILTINS_Object26_TEST_18000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn180_dateGetFullYearOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test181
     * @tc.number SUB_BUILTINS_Object26_TEST_18100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn181_dateSetFullYearOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test182
     * @tc.number SUB_BUILTINS_Object26_TEST_18200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn182_mapGetOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test183
     * @tc.number SUB_BUILTINS_Object26_TEST_18300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn183_mapSetOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test184
     * @tc.number SUB_BUILTINS_Object26_TEST_18400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn184_setAddOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test185
     * @tc.number SUB_BUILTINS_Object26_TEST_18500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn185_setDeleteOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test186
     * @tc.number SUB_BUILTINS_Object26_TEST_18600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn186_weakMapSetOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test187
     * @tc.number SUB_BUILTINS_Object26_TEST_18700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn187_weakSetAddOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test188
     * @tc.number SUB_BUILTINS_Object26_TEST_18800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn188_errorMessageOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test189
     * @tc.number SUB_BUILTINS_Object26_TEST_18900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn189_modifyErrorMessage();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test190
     * @tc.number SUB_BUILTINS_Object26_TEST_19000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await Object26.Fn190_promiseThenOnSealed();
      console.info('ObjectTest == ' + result);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test191
     * @tc.number SUB_BUILTINS_Object26_TEST_19100
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn191_generatorIterateOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test192
     * @tc.number SUB_BUILTINS_Object26_TEST_19200
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await Object26.Fn192_asyncFunctionCallOnSealed();
      console.info('ObjectTest == ' + result);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test193
     * @tc.number SUB_BUILTINS_Object26_TEST_19300
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn193_objectHasOwnOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test194
     * @tc.number SUB_BUILTINS_Object26_TEST_19400
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn194_inOperatorOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test195
     * @tc.number SUB_BUILTINS_Object26_TEST_19500
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn195_hasOwnPropertyOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test196
     * @tc.number SUB_BUILTINS_Object26_TEST_19600
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn196_arrayIncludesOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test197
     * @tc.number SUB_BUILTINS_Object26_TEST_19700
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn197_arrayIndexOfOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test198
     * @tc.number SUB_BUILTINS_Object26_TEST_19800
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn198_arrayLastIndexOfOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test199
     * @tc.number SUB_BUILTINS_Object26_TEST_19900
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn199_stringIncludesOnSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object26Test200
     * @tc.number SUB_BUILTINS_Object26_TEST_20000
     * @tc.desc   test object seal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object26Test200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object26.Fn200_stringIndexOfOnSealed();
      expect(result).assertEqual(true);
    });
  })
}