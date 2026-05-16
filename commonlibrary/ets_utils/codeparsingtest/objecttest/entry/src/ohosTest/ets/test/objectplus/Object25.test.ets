/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import * as Object25 from './Object25';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object25Test() {
  describe('Object25Test', () => {
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
     * @tc.name   Object25Test001
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_0100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn01_preventAddingNewOwnProperties();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test002
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_0200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn02_preventPrototypeReassignment();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test003
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_0300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn03_nonObjectParameterBehavior();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test004
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_0400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn04_verifyIsExtensibleReturnsFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test005
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_0500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn05_verifyReflectIsExtensibleReturnsFalse();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test006
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_0600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn06_defineNewPropWithDefinePropertyThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test007
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_0700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn07_modifyExistingWritablePropSucceeds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test009
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_0900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn09_shrinkExtensibleArrayLengthSucceeds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test010
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn10_expandExtensibleArrayLengthFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test011
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn11_sealExtensibleObjRemainsNonExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test012
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn12_frozenObjPreventExtensionsReturnsSelf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test013
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn13_reflectDefineNewPropOnExtensibleObjThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test014
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn14_modifyExistingNonWritablePropFails();
      } catch (e) {
        expect(e.message).assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object25Test015
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn15_deleteOwnPropOnExtensibleObjSucceeds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test016
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn16_extensibleArrayPopSucceeds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test017
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn17_extensibleArrayShiftSucceeds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test019
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_1900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn19_assignNewPropToExtensibleObjFails();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test020
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn20_assignUpdateExistingPropToExtensibleObjSucceeds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test021
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn21_spreadExtensibleObjNoNewProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test022
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn22_addSymbolPropToExtensibleObjFails();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property in prevent extensions");
      }
    });

    /**
     * @tc.name   Object25Test023
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn23_modifyExistingSymbolPropSucceeds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test024
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn24_addNonEnumerablePropToExtensibleObjThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test025
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn25_modifyExistingNonEnumerablePropSucceeds();
      } catch (e) {
        expect(e.message).assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object25Test026
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn26_forInExtensibleObjIncludesInherited();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test027
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn27_objectKeysExtensibleObjOnlyOwn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test028
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn28_objectValuesExtensibleObjOnlyOwn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test029
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_2900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn29_jsonStringifyExtensibleObjWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test030
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn30_preventExtensionsIdempotent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test031
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn31_reflectPreventExtensionsIdempotent();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test032
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn32_preventExtensionsOnFunctionNoNewProp();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
      ;
    });

    /**
     * @tc.name   Object25Test033
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn33_extensibleFunctionPrototypeNoNewProp();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
      ;
    });

    /**
     * @tc.name   Object25Test034
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn34_preventExtensionsOnDateNoNewProp();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
      ;
    });

    /**
     * @tc.name   Object25Test035
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn35_preventExtensionsOnRegExpNoNewProp();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
      ;
    });

    /**
     * @tc.name   Object25Test036
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn36_preventExtensionsOnClassInstanceNoNewProp();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
      ;
    });

    /**
     * @tc.name   Object25Test037
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn37_extensibleClassPrototypeNoNewMethod();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
      ;
    });

    /**
     * @tc.name   Object25Test038
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn38_childOfExtensibleProtoRemainsExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test039
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_3900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn39_childOfExtensibleProtoCantChangeProto();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test040
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_4000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn40_getPrototypeOfExtensibleObjWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test041
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_4100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn41_reflectGetPrototypeOfExtensibleObjWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test042
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_4200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn42_weakMapUseExtensibleObjAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test043
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_4300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn43_weakSetAddExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test046
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_4600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn46_getOwnPropertyDescriptorsExtensibleObjWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test047
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_4700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn47_modifyExistingPropDescOnExtensibleObj();
      } catch (e) {
        expect(e.message).assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object25Test048
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_4800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn48_cantDeleteNonConfigurablePropOnExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test050
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn50_extensibleArraySpliceDeleteSucceeds();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test051
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn51_strictModeAddPropToExtensibleObjThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test052
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn52_strictModeChangeProtoOfExtensibleObjThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test053
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn53_extensibleObjGetterWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test054
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn54_extensibleObjSetterWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test055
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn55_addGetterToExtensibleObjThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test056
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn56_modifyGetterToDataOnExtensibleObjThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test057
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn57_getOwnPropertySymbolsExtensibleObjWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test058
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn58_getOwnPropertyNamesExtensibleObjWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test059
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_5900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn59_extensibleArrayFillWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test060
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn60_extensibleArrayReverseWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test061
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn61_extensibleArraySortWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test062
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn62_mapUseExtensibleObjAsKey();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test063
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn63_setAddExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test064
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn64_objectIsExtensibleObjWithSelf();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test066
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn66_frozenPropOnExtensibleObjCantModify();
      } catch (e) {
        expect(e.message).assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object25Test067
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn67_sealedPropOnExtensibleObjCantDelete();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test068
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn68_extensibleObjToStringWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test069
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_6900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn69_extensibleObjValueOfWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test070
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn70_extensibleObjHasOwnPropertyWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test071
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn71_extensibleObjPropertyIsEnumerableWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test072
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn72_nonEnumerablePropIsNotEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test073
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn73_forOfExtensibleArrayWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test074
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn74_forOfNonIterableExtensibleObjThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test075
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn75_objectEntriesExtensibleObjWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test076
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn76_parseThenPreventExtensionsWorks();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test077
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn77_stringifyExtensibleObjWithReplacer();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test078
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn78_parseExtensibleObjWithReviver();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test079
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_7900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn79_nestedExtensibleObjInExtensibleObj();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test080
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn80_extensibleObjInNonExtensibleObj();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test081
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn81_reflectDeleteOwnPropOnExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test082
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn82_reflectDeleteNonExistentPropOnExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test083
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn83_modifyInheritedPropOnExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test084
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn84_addInheritedPropOnExtensibleObjFails();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test085
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn85_extensibleObjAsFunctionParam();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test086
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn86_extensibleObjInClosure();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test087
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn87_deleteConfigurablePropOnExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test088
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn88_cantDeleteNonConfigurableProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test089
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_8900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn89_nonEnumerablePropNotInForIn();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test090
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn90_nonWritablePropCantModify();
      } catch (e) {
        expect(e.message).assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object25Test091
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn91_definePropertiesUpdateExistingOnExtensibleObj();
      } catch (e) {
        expect(e.message).assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object25Test092
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn92_definePropertiesAddNewOnExtensibleObjThrows();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test093
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn93_proxyOfExtensibleObjNoNewProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test094
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn94_proxyOfExtensibleObjModifyExistingProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test095
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn95_proxySetTrapBlockNewPropOnExtensibleObj();
      } catch (e) {
        expect(e.message).assertContain("JSProxy::SetProperty: 'set' return false");
      }
    });

    /**
     * @tc.name   Object25Test096
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn96_proxyDefinePropertyTrapBlockNewProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test097
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn97_preventExtensionsOnPrimitiveWrapper();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test098
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn98_modifyPrimitiveWrapperExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test099
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_9900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn99_extensibleObjIsNotSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test100
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn100_extensibleObjIsNotFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test101
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn101_extensibleObjSealedAfterSeal();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test102
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn102_extensibleObjFrozenAfterFreeze();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test103
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn103_modifyLengthOnNonArrayExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test104
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn104_preventExtensionsOnErrorInstance();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test105
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn105_preventExtensionsOnPromiseInstance();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test106
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn106_preventExtensionsOnArrayBufferView();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test107
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn107_preventExtensionsOnSetInstance();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test108
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn108_preventExtensionsOnMapInstance();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test109
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_10900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn109_addSymbolSpeciesToExtensibleObjFails();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property in prevent extensions");
      }
    });

    /**
     * @tc.name   Object25Test110
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn110_addSymbolIteratorToExtensibleObjFails();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property in prevent extensions");
      }
    });

    /**
     * @tc.name   Object25Test111
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn111_extensibleIterableObjIteratorWorks();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test112
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn112_extensibleObjWithGenerator();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test113
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn113_extensibleObjWithAsyncFunc();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test115
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn115_bindExtensibleObjThis();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test116
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn116_callExtensibleObjThis();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test117
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11700
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn117_applyExtensibleObjThis();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test118
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn118_extensibleObjInArrowFuncThis();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test119
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_11900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn119_circularExtensibleObjStringify();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test120
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn120_cloneCircularExtensibleObj();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test121
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12100
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn121_extensibleObjWithLocalStorage();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test122
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12200
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn122_extensibleObjWithSessionStorage();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.name   Object25Test123
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12300
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn123_modifyInheritedWritableProp();
      } catch (e) {
        expect(e.message).assertContain("Cannot add property");
      }
    });

    /**
     * @tc.name   Object25Test124
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12400
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn124_cantModifyInheritedNonWritableProp();
      } catch (e) {
        expect(e.message).assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object25Test125
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12500
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn125_modifyPropDescWithGetDescriptors();
      } catch (e) {
        expect(e.message).assertContain("Cannot assign to read only property");
      }
    });

    /**
     * @tc.name   Object25Test126
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12600
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let result: boolean = Object25.Fn126_proxyDeletePropertyTrapOnExtensibleObj();
      } catch (e) {
        expect(e.message).assertContain("Cannot delete property");
      }
    });

    /**
     * @tc.name   Object25Test128
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12800
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn128_proxySetPrototypeOfTrapOnExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test129
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_12900
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn129_isExtensibleConsistentOnExtensibleObj();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object25Test130
     * @tc.number SUB_BUILTINS_OBJECT25_TEST_13000
     * @tc.desc   test object preventExtensions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object25Test130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = Object25.Fn130_reflectIsExtensibleConsistentOnExtensibleObj();
      expect(result).assertEqual(true);
    });
  })
}
