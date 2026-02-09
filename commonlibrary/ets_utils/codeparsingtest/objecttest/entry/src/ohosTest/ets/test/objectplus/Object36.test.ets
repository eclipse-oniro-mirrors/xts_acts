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
import {
  Fn01_TestLiteralConstructor,
  Fn02_TestCustomConstructor,
  Fn03_TestInstancePrototypeIsolation,
  Fn04_TestPrototypeOverride,
  Fn05_TestFixPrototypeConstructor,
  Fn06_TestNullUndefinedConstructor,
  Fn07_TestStringConstructor,
  Fn08_TestNumberConstructor,
  Fn09_TestBooleanConstructor,
  Fn100_TestInheritErrorConstructor,
  Fn101_TestPromiseThenConstructor,
  Fn102_TestPromiseCatchConstructor,
  Fn103_TestPromiseFinallyConstructor,
  Fn104_TestPromiseAllSettledConstructor,
  Fn105_TestPromiseRaceConstructor,
  Fn10_TestDateConstructor,
  Fn11_TestRegExpConstructor,
  Fn13_TestArrowFunctionConstructor,
  Fn14_TestClassInstanceConstructor,
  Fn15_TestClassInheritanceConstructor,
  Fn16_TestObjectCreateNullConstructor,
  Fn17_TestObjectCreatePrototypeConstructor,
  Fn18_TestModifyProtoConstructorAffectInstance,
  Fn19_TestSealedObjectConstructor,
  Fn20_TestFrozenObjectConstructor,
  Fn21_TestArrayConstructorCreate,
  Fn22_TestTypedArrayConstructor,
  Fn23_TestMapConstructor,
  Fn24_TestSetConstructor,
  Fn25_TestWeakMapConstructor,
  Fn26_TestWeakSetConstructor,
  Fn27_TestPromiseConstructor,
  Fn28_TestGeneratorConstructor,
  Fn29_TestProxyConstructor,
  Fn30_TestSymbolConstructor,
  Fn31_TestBigIntConstructor,
  Fn32_TestModifyConstructorToNonFunction,
  Fn33_TestBrokenPrototypeChainConstructor,
  Fn34_TestClassStaticMethodConstructor,
  Fn35_TestInheritArrayClassConstructor,
  Fn36_TestObjectAssignConstructor,
  Fn37_TestArraySpreadConstructor,
  Fn38_TestObjectSpreadConstructor,
  Fn39_TestJsonParseConstructor,
  Fn40_TestJsonStringifyConstructor,
  Fn41_TestBoundFunctionConstructor,
  Fn42_TestClassGetterSetterConstructor,
  Fn43_TestEmptyNonEmptyObjConstructor,
  Fn44_TestClassInheritNullConstructor,
  Fn45_TestReflectConstructConstructor,
  Fn48_TestArrayBufferConstructor,
  Fn49_TestDataViewConstructor,
  Fn50_TestInt32ArrayConstructor,
  Fn51_TestClassPrivatePropConstructor,
  Fn52_TestObjectCreateClassProtoConstructor,
  Fn53_TestModifyClassProtoConstructor,
  Fn54_TestArrowFuncAsConstructor,
  Fn55_TestPromiseResolveConstructor,
  Fn56_TestPromiseRejectConstructor,
  Fn57_TestPromiseAllConstructor,
  Fn63_TestErrorConstructor,
  Fn64_TestTypeErrorConstructor,
  Fn65_TestRangeErrorConstructor,
  Fn66_TestReferenceErrorConstructor,
  Fn67_TestSyntaxErrorConstructor,
  Fn68_TestEvalErrorConstructor,
  Fn69_TestURIErrorConstructor,
  Fn70_TestIntlDateTimeFormatConstructor,
  Fn71_TestIntlNumberFormatConstructor,
  Fn72_TestIntlCollatorConstructor,
  Fn73_TestIntlPluralRulesConstructor,
  Fn74_TestIntlRelativeTimeFormatConstructor,
  Fn76_TestAtomicsConstructor,
  Fn77_TestMathConstructor,
  Fn78_TestReflectConstructor,
  Fn79_TestIntlConstructor,
  Fn80_TestObjectKeysConstructor,
  Fn81_TestObjectValuesConstructor,
  Fn82_TestObjectEntriesConstructor,
  Fn83_TestArrayFromConstructor,
  Fn84_TestArrayOfConstructor,
  Fn85_TestStringFromCharCodeConstructor,
  Fn86_TestStringFromCodePointConstructor,
  Fn87_TestNumberIsFiniteConstructor,
  Fn88_TestNumberIsIntegerConstructor,
  Fn89_TestBooleanObjLiteralConstructor,
  Fn90_TestMapEntriesIteratorConstructor,
  Fn91_TestSetValuesIteratorConstructor,
  Fn92_TestArrayKeysIteratorConstructor,
  Fn97_TestSetProtoConstructor,
  Fn98_TestClassStaticPropConstructor,
  Fn99_TestEmptyClassInstanceConstructor
} from './Object36';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object36Test() {
  describe('Object36Test', () => {
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
     * @tc.name   Object36Test001
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn01_TestLiteralConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test002
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn02_TestCustomConstructor();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object36Test003
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn03_TestInstancePrototypeIsolation();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test004
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn04_TestPrototypeOverride();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test005
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn05_TestFixPrototypeConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test006
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0600
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn06_TestNullUndefinedConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test007
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn07_TestStringConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test008
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn08_TestNumberConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test009
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_0900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn09_TestBooleanConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test010
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn10_TestDateConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test011
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn11_TestRegExpConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test013
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn13_TestArrowFunctionConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test014
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn14_TestClassInstanceConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test015
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn15_TestClassInheritanceConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test016
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1600
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn16_TestObjectCreateNullConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test017
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn17_TestObjectCreatePrototypeConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test018
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn18_TestModifyProtoConstructorAffectInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test019
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_1900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn19_TestSealedObjectConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test020
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn20_TestFrozenObjectConstructor();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object36Test021
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn21_TestArrayConstructorCreate();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test022
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn22_TestTypedArrayConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test023
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn23_TestMapConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test024
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn24_TestSetConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test025
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn25_TestWeakMapConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test026
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2600
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn26_TestWeakSetConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test027
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn27_TestPromiseConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test028
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn28_TestGeneratorConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test029
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_2900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn29_TestProxyConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test030
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn30_TestSymbolConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test031
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn31_TestBigIntConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test032
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn32_TestModifyConstructorToNonFunction();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test033
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn33_TestBrokenPrototypeChainConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test034
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn34_TestClassStaticMethodConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test035
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn35_TestInheritArrayClassConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test036
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3600
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn36_TestObjectAssignConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test037
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn37_TestArraySpreadConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test038
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn38_TestObjectSpreadConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test039
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_3900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn39_TestJsonParseConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test040
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_4000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn40_TestJsonStringifyConstructor();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object36Test041
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_4100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn41_TestBoundFunctionConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test042
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_4200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn42_TestClassGetterSetterConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test043
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_4300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn43_TestEmptyNonEmptyObjConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test044
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_4400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn44_TestClassInheritNullConstructor();
      } catch (e) {
        expect(e.message).assertEqual("Constructor is false");
      }
    });

    /**
     * @tc.name   Object36Test045
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_4500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn45_TestReflectConstructConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test048
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_4800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn48_TestArrayBufferConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test049
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_4900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn49_TestDataViewConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test050
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_5000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn50_TestInt32ArrayConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test051
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_5100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn51_TestClassPrivatePropConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test052
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_5200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn52_TestObjectCreateClassProtoConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test053
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_5300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn53_TestModifyClassProtoConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test054
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_5400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn54_TestArrowFuncAsConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test055
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_5500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn55_TestPromiseResolveConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test056
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_5600
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn56_TestPromiseRejectConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test057
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_5700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn57_TestPromiseAllConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test063
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_6300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn63_TestErrorConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test064
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_6400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn64_TestTypeErrorConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test065
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_6500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn65_TestRangeErrorConstructor();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object36Test066
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_6600
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn66_TestReferenceErrorConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test067
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_6700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn67_TestSyntaxErrorConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test068
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_6800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn68_TestEvalErrorConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test069
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_6900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn69_TestURIErrorConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test070
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn70_TestIntlDateTimeFormatConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test071
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn71_TestIntlNumberFormatConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test072
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn72_TestIntlCollatorConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test073
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn73_TestIntlPluralRulesConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test074
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn74_TestIntlRelativeTimeFormatConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test076
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7600
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn76_TestAtomicsConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test077
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn77_TestMathConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test078
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn78_TestReflectConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test079
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_7900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn79_TestIntlConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test080
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn80_TestObjectKeysConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test081
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn81_TestObjectValuesConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test082
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn82_TestObjectEntriesConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test083
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn83_TestArrayFromConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test084
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn84_TestArrayOfConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test085
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn85_TestStringFromCharCodeConstructor();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object36Test086
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8600
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn86_TestStringFromCodePointConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test087
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn87_TestNumberIsFiniteConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test088
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn88_TestNumberIsIntegerConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test089
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_8900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn89_TestBooleanObjLiteralConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test090
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_9000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn90_TestMapEntriesIteratorConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test091
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_9100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn91_TestSetValuesIteratorConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test092
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_9200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn92_TestArrayKeysIteratorConstructor();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object36Test097
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_9700
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn97_TestSetProtoConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test098
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_9800
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn98_TestClassStaticPropConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test099
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_9900
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn99_TestEmptyClassInstanceConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test100
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_10000
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn100_TestInheritErrorConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test101
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_10100
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn101_TestPromiseThenConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test102
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_10200
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn102_TestPromiseCatchConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test103
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_10300
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn103_TestPromiseFinallyConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test104
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_10400
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn104_TestPromiseAllSettledConstructor();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object36Test105
     * @tc.number SUB_BUILTINS_OBJECT36_TEST_10500
     * @tc.desc   test object constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object36Test105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn105_TestPromiseRaceConstructor();
      expect(res).assertEqual(true);
    });

  })
}