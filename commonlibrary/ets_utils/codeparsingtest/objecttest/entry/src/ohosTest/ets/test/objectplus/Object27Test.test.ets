import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import * as Object27 from './Object27Test';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object27Test() {
  describe('Object27Test', () => {
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
     * @tc.name   Object27Test001
     * @tc.number SUB_BUILTINS_Object27_TEST_0100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn01_basicPrototypeSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test002
     * @tc.number SUB_BUILTINS_Object27_TEST_0200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn02_inheritanceAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test003
     * @tc.number SUB_BUILTINS_Object27_TEST_0300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn03_settingPrototypeToNull();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test004
     * @tc.number SUB_BUILTINS_Object27_TEST_0400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn04_constructorAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test005
     * @tc.number SUB_BUILTINS_Object27_TEST_0500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn05_multiLevelPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test006
     * @tc.number SUB_BUILTINS_Object27_TEST_0600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn06_hasOwnPropertyAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test007
     * @tc.number SUB_BUILTINS_Object27_TEST_0700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn07_setArrayAsPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test011
     * @tc.number SUB_BUILTINS_Object27_TEST_1100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn11_instanceOfAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test012
     * @tc.number SUB_BUILTINS_Object27_TEST_1200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn12_setPrototypeOnNumberObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test014
     * @tc.number SUB_BUILTINS_Object27_TEST_1400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn14_setPrototypeOnBooleanObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test015
     * @tc.number SUB_BUILTINS_Object27_TEST_1500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn15_setPrototypeOnEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test016
     * @tc.number SUB_BUILTINS_Object27_TEST_1600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn16_isPrototypeOfAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test017
     * @tc.number SUB_BUILTINS_Object27_TEST_1700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn17_multiplePrototypeSets();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test018
     * @tc.number SUB_BUILTINS_Object27_TEST_1800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn18_setPrototypeToObjectPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test019
     * @tc.number SUB_BUILTINS_Object27_TEST_1900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn19_objectKeysAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test020
     * @tc.number SUB_BUILTINS_Object27_TEST_2000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn20_forInLoopAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test021
     * @tc.number SUB_BUILTINS_Object27_TEST_2100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn21_setPrototypeToArrayPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test022
     * @tc.number SUB_BUILTINS_Object27_TEST_2200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn22_setPrototypeOnClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test023
     * @tc.number SUB_BUILTINS_Object27_TEST_2300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn23_toStringAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test024
     * @tc.number SUB_BUILTINS_Object27_TEST_2400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn24_forInWithNullPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test025
     * @tc.number SUB_BUILTINS_Object27_TEST_2500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn25_noObjectMethodsWithNullPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test026
     * @tc.number SUB_BUILTINS_Object27_TEST_2600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn26_hasOwnPropertyWithPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test027
     * @tc.number SUB_BUILTINS_Object27_TEST_2700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn27_setPrototypeOnFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test028
     * @tc.number SUB_BUILTINS_Object27_TEST_2800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn28_setPrototypeOnConstructor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test029
     * @tc.number SUB_BUILTINS_Object27_TEST_2900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn29_protoPropertyAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test030
     * @tc.number SUB_BUILTINS_Object27_TEST_3000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn30_setPrototypeOnArrayInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test031
     * @tc.number SUB_BUILTINS_Object27_TEST_3100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn31_propertyLookupOrder();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test032
     * @tc.number SUB_BUILTINS_Object27_TEST_3200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn32_nestedPrototypeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test033
     * @tc.number SUB_BUILTINS_Object27_TEST_3300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn33_existingObjectsAffectedByPrototypeChange();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test034
     * @tc.number SUB_BUILTINS_Object27_TEST_3400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn34_setPrototypeToAnotherObjectsPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test035
     * @tc.number SUB_BUILTINS_Object27_TEST_3500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn35_getOwnPropertyNamesAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test036
     * @tc.number SUB_BUILTINS_Object27_TEST_3600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn36_prototypeWithGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test037
     * @tc.number SUB_BUILTINS_Object27_TEST_3700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn37_prototypeWithSetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test038
     * @tc.number SUB_BUILTINS_Object27_TEST_3800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn38_enumerabilityAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test041
     * @tc.number SUB_BUILTINS_Object27_TEST_4100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn41_objectAssignWithPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test042
     * @tc.number SUB_BUILTINS_Object27_TEST_4200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn42_jsonStringifyWithPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test043
     * @tc.number SUB_BUILTINS_Object27_TEST_4300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn43_prototypeAsProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test044
     * @tc.number SUB_BUILTINS_Object27_TEST_4400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn44_setPrototypeOnProxy();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test045
     * @tc.number SUB_BUILTINS_Object27_TEST_4500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn45_propertyIsEnumerableAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test046
     * @tc.number SUB_BUILTINS_Object27_TEST_4600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn46_setPrototypeToError();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test047
     * @tc.number SUB_BUILTINS_Object27_TEST_4700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn47_toStringTagAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test048
     * @tc.number SUB_BUILTINS_Object27_TEST_4800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn48_prototypeWithSymbol();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test049
     * @tc.number SUB_BUILTINS_Object27_TEST_4900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn49_objectValuesAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test050
     * @tc.number SUB_BUILTINS_Object27_TEST_5000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn50_objectEntriesAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test053
     * @tc.number SUB_BUILTINS_Object27_TEST_5300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn53_objectIsWithPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test055
     * @tc.number SUB_BUILTINS_Object27_TEST_5500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn55_valueOfAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test057
     * @tc.number SUB_BUILTINS_Object27_TEST_5700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn57_toLocaleStringAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test059
     * @tc.number SUB_BUILTINS_Object27_TEST_5900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await Object27.Fn59_prototypeWithAsyncMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test060
     * @tc.number SUB_BUILTINS_Object27_TEST_6000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn60_isPrototypeOfWithChainedPrototypes();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test061
     * @tc.number SUB_BUILTINS_Object27_TEST_6100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn61_setPrototypeToFunctionPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test062
     * @tc.number SUB_BUILTINS_Object27_TEST_6200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn62_setPrototypeOnGeneratorFunction();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test063
     * @tc.number SUB_BUILTINS_Object27_TEST_6300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn63_multipleGetPrototypeCalls();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test066
     * @tc.number SUB_BUILTINS_Object27_TEST_6600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn66_toStringReturnAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test067
     * @tc.number SUB_BUILTINS_Object27_TEST_6700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn67_prototypeAsImmutableObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test068
     * @tc.number SUB_BUILTINS_Object27_TEST_6800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn68_spreadOperatorWithPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test069
     * @tc.number SUB_BUILTINS_Object27_TEST_6900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn69_setPrototypeToArrayPrototypeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test070
     * @tc.number SUB_BUILTINS_Object27_TEST_7000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn70_concatMethodWithPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test071
     * @tc.number SUB_BUILTINS_Object27_TEST_7100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn71_prototypeWithStaticMethod();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test072
     * @tc.number SUB_BUILTINS_Object27_TEST_7200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn72_hasOwnPropertyWithPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test073
     * @tc.number SUB_BUILTINS_Object27_TEST_7300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn73_setPrototypeToErrorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test074
     * @tc.number SUB_BUILTINS_Object27_TEST_7400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn74_setPrototypeOnArrayBuffer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test077
     * @tc.number SUB_BUILTINS_Object27_TEST_7700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn77_symbolIteratorAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test078
     * @tc.number SUB_BUILTINS_Object27_TEST_7800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn78_prototypeWithIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test079
     * @tc.number SUB_BUILTINS_Object27_TEST_7900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn79_toStringAffectsJson();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test080
     * @tc.number SUB_BUILTINS_Object27_TEST_8000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn80_proxyPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test081
     * @tc.number SUB_BUILTINS_Object27_TEST_8100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn81_multiLevelProxyPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test082
     * @tc.number SUB_BUILTINS_Object27_TEST_8200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn82_instanceOfMultipleConstructors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test083
     * @tc.number SUB_BUILTINS_Object27_TEST_8300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn83_setPrototypeToPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test084
     * @tc.number SUB_BUILTINS_Object27_TEST_8400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn84_getOwnPropertyDescriptorsAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test085
     * @tc.number SUB_BUILTINS_Object27_TEST_8500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn85_prototypeWithAccessorProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test086
     * @tc.number SUB_BUILTINS_Object27_TEST_8600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn86_propertyDescriptorsAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test087
     * @tc.number SUB_BUILTINS_Object27_TEST_8700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn87_setPrototypeToSetValuesPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test089
     * @tc.number SUB_BUILTINS_Object27_TEST_8900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn89_setPrototypeToMathObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test090
     * @tc.number SUB_BUILTINS_Object27_TEST_9000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn90_setPrototypeToJsonObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test091
     * @tc.number SUB_BUILTINS_Object27_TEST_9100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn91_toStringAffectsTypeCheck();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test092
     * @tc.number SUB_BUILTINS_Object27_TEST_9200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn92_prototypeWithToStringTag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test095
     * @tc.number SUB_BUILTINS_Object27_TEST_9500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn95_extendedMethodsAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test096
     * @tc.number SUB_BUILTINS_Object27_TEST_9600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn96_nestedProxyPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test097
     * @tc.number SUB_BUILTINS_Object27_TEST_9700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn97_multiLevelSameProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test098
     * @tc.number SUB_BUILTINS_Object27_TEST_9800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn98_hasOwnPropertyVsInOperator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test099
     * @tc.number SUB_BUILTINS_Object27_TEST_9900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn99_prototypeWithSymbolIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test100
     * @tc.number SUB_BUILTINS_Object27_TEST_10000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn100_prototypeChainLength();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test101
     * @tc.number SUB_BUILTINS_Object27_TEST_10100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn101_propertyDeletionAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test103
     * @tc.number SUB_BUILTINS_Object27_TEST_10300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn103_prototypeWithNonEnumerableProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test104
     * @tc.number SUB_BUILTINS_Object27_TEST_10400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn104_preventExtensionsAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test105
     * @tc.number SUB_BUILTINS_Object27_TEST_10500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn105_prototypeAsSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test106
     * @tc.number SUB_BUILTINS_Object27_TEST_10600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn106_prototypeAsFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test107
     * @tc.number SUB_BUILTINS_Object27_TEST_10700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn107_setPrototypeOnSealedObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test108
     * @tc.number SUB_BUILTINS_Object27_TEST_10800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn108_setPrototypeOnFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test109
     * @tc.number SUB_BUILTINS_Object27_TEST_10900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn109_objectCreateWithNullPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test111
     * @tc.number SUB_BUILTINS_Object27_TEST_11100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn111_prototypeWithGettersAndSetters();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test112
     * @tc.number SUB_BUILTINS_Object27_TEST_11200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn112_superKeywordAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test113
     * @tc.number SUB_BUILTINS_Object27_TEST_11300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn113_setPrototypeToClassPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test114
     * @tc.number SUB_BUILTINS_Object27_TEST_11400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn114_setPrototypeToExtendedClassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test115
     * @tc.number SUB_BUILTINS_Object27_TEST_11500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn115_setPrototypeToNumberPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test116
     * @tc.number SUB_BUILTINS_Object27_TEST_11600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn116_setPrototypeToStringPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test117
     * @tc.number SUB_BUILTINS_Object27_TEST_11700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn117_setPrototypeToBooleanPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test118
     * @tc.number SUB_BUILTINS_Object27_TEST_11800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn118_jsonSerializationAfterSetting();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test119
     * @tc.number SUB_BUILTINS_Object27_TEST_11900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn119_setPrototypeToProxyInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test121
     * @tc.number SUB_BUILTINS_Object27_TEST_12100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn121_objectKeysVsForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test122
     * @tc.number SUB_BUILTINS_Object27_TEST_12200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn122_setPrototypeToArrayInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test127
     * @tc.number SUB_BUILTINS_Object27_TEST_12700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn127_toStringAffectsArithmetic();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test128
     * @tc.number SUB_BUILTINS_Object27_TEST_12800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await Object27.Fn128_prototypeWithAsyncIterator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test129
     * @tc.number SUB_BUILTINS_Object27_TEST_12900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn129_prototypeWithSymbolSpecies();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test136
     * @tc.number SUB_BUILTINS_Object27_TEST_13600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn136_setPrototypeToErrorInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test137
     * @tc.number SUB_BUILTINS_Object27_TEST_13700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn137_setPrototypeToEvalErrorInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test138
     * @tc.number SUB_BUILTINS_Object27_TEST_13800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn138_setPrototypeToRangeErrorInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test139
     * @tc.number SUB_BUILTINS_Object27_TEST_13900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn139_setPrototypeToReferenceErrorInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test140
     * @tc.number SUB_BUILTINS_Object27_TEST_14000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn140_setPrototypeToSyntaxErrorInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test141
     * @tc.number SUB_BUILTINS_Object27_TEST_14100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn141_setPrototypeToTypeErrorInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test142
     * @tc.number SUB_BUILTINS_Object27_TEST_14200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn142_setPrototypeToURIErrorInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test144
     * @tc.number SUB_BUILTINS_Object27_TEST_14400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn144_largePrototypeObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test145
     * @tc.number SUB_BUILTINS_Object27_TEST_14500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn145_usingObjectMethodsWithNullPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test146
     * @tc.number SUB_BUILTINS_Object27_TEST_14600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn146_customErrorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test148
     * @tc.number SUB_BUILTINS_Object27_TEST_14800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn148_setPrototypeToReflectObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test151
     * @tc.number SUB_BUILTINS_Object27_TEST_15100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn151_prototypeWithStaticClassProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test152
     * @tc.number SUB_BUILTINS_Object27_TEST_15200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn152_setPrototypeToClassInstancePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test153
     * @tc.number SUB_BUILTINS_Object27_TEST_15300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn153_objectKeysWithNullPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test156
     * @tc.number SUB_BUILTINS_Object27_TEST_15600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn156_prototypeWithCustomToStringTag();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test157
     * @tc.number SUB_BUILTINS_Object27_TEST_15700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await Object27.Fn157_prototypeWithAsyncGetter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test158
     * @tc.number SUB_BUILTINS_Object27_TEST_15800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn158_setPrototypeToGeneratorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test159
     * @tc.number SUB_BUILTINS_Object27_TEST_15900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn159_setPrototypeToDateTimeFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test160
     * @tc.number SUB_BUILTINS_Object27_TEST_16000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn160_setPrototypeToNumberFormat();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test161
     * @tc.number SUB_BUILTINS_Object27_TEST_16100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn161_toStringInDifferentContexts();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test162
     * @tc.number SUB_BUILTINS_Object27_TEST_16200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn162_multiLevelSameMethodName();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test163
     * @tc.number SUB_BUILTINS_Object27_TEST_16300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn163_setPrototypeToArraySubclassInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test164
     * @tc.number SUB_BUILTINS_Object27_TEST_16400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn164_modifyUpperPrototypeInChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test165
     * @tc.number SUB_BUILTINS_Object27_TEST_16500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn165_prototypeWithManyMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test167
     * @tc.number SUB_BUILTINS_Object27_TEST_16700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn167_prototypeWithStaticMethods();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test168
     * @tc.number SUB_BUILTINS_Object27_TEST_16800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn168_setPrototypeToFunctionInstancePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test169
     * @tc.number SUB_BUILTINS_Object27_TEST_16900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn169_prototypeWithNestedAccessors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test170
     * @tc.number SUB_BUILTINS_Object27_TEST_17000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn170_prototypeWithDynamicProperties();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test171
     * @tc.number SUB_BUILTINS_Object27_TEST_17100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn171_setPrototypeToPrototypeOfPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test172
     * @tc.number SUB_BUILTINS_Object27_TEST_17200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn172_setPrototypeToFunctionPrototypePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test173
     * @tc.number SUB_BUILTINS_Object27_TEST_17300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn173_setPrototypeToArrayPrototypePrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test174
     * @tc.number SUB_BUILTINS_Object27_TEST_17400
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn174_multiLevelIsPrototypeOf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test175
     * @tc.number SUB_BUILTINS_Object27_TEST_17500
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn175_prototypeWithSymbolMatch();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test176
     * @tc.number SUB_BUILTINS_Object27_TEST_17600
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn176_prototypeWithSymbolReplace();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test177
     * @tc.number SUB_BUILTINS_Object27_TEST_17700
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn177_prototypeWithSymbolSearch();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test178
     * @tc.number SUB_BUILTINS_Object27_TEST_17800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn178_prototypeWithSymbolSplit();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test179
     * @tc.number SUB_BUILTINS_Object27_TEST_17900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn179_prototypeWithSymbolHasInstance();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test180
     * @tc.number SUB_BUILTINS_Object27_TEST_18000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn180_prototypeWithSymbolIsConcatSpreadable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test181
     * @tc.number SUB_BUILTINS_Object27_TEST_18100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn181_setPrototypeToMapEntriesPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test182
     * @tc.number SUB_BUILTINS_Object27_TEST_18200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn182_prototypeWithSymbolSpeciesClass();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test188
     * @tc.number SUB_BUILTINS_Object27_TEST_18800
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn188_setPrototypeToArrayIteratorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test189
     * @tc.number SUB_BUILTINS_Object27_TEST_18900
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn189_setPrototypeToStringIteratorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test190
     * @tc.number SUB_BUILTINS_Object27_TEST_19000
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn190_setPrototypeToMapIteratorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test191
     * @tc.number SUB_BUILTINS_Object27_TEST_19100
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn191_setPrototypeToSetIteratorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test192
     * @tc.number SUB_BUILTINS_Object27_TEST_19200
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object27.Fn192_setPrototypeToGeneratorIteratorPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object27Test193
     * @tc.number SUB_BUILTINS_Object27_TEST_19300
     * @tc.desc   test object setPrototypeOf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object27Test193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await Object27.Fn193_setPrototypeToPromiseIteratorPrototype();
      expect(result).assertEqual(true);
    });


  })
}