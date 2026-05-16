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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  Fn01_TestProtoLiteralPoint,
  Fn02_TestProtoSetterModify,
  Fn03_TestProtoNullPrototypeObj,
  Fn04_TestProtoNonExtensibleObj,
  Fn05_TestProtoInvalidValueAssign,
  Fn06_TestProtoConstructorInstance,
  Fn07_TestProtoInheritProperty,
  Fn08_TestProtoDynamicChainUpdate,
  Fn09_TestProtoArrayInstance,
  Fn101_TestProtoClassSuperPrototype,
  Fn106_TestProtoProxyTrapModify,
  Fn107_TestProtoAssignMathObject,
  Fn108_TestProtoVsObjectKeysExtendedProto,
  Fn109_TestProtoAssignJSONObject,
  Fn10_TestProtoDateInstance,
  Fn110_TestProtoNestedProxy,
  Fn111_TestProtoAssignAtomicsObject,
  Fn112_TestProtoVsGetOwnPropertyDescriptors,
  Fn11_TestProtoFrozenObject,
  Fn12_TestProtoSealedObject,
  Fn13_TestProtoAssignNull,
  Fn14_TestProtoFunctionInstance,
  Fn15_TestProtoArrowFunction,
  Fn16_TestProtoClassInstance,
  Fn17_TestProtoClassInheritance,
  Fn18_TestProtoObjectPrototype,
  Fn19_TestProtoVsGetPrototypeOf,
  Fn20_TestProtoVsSetPrototypeOf,
  Fn21_TestProtoTypedArrayInstance,
  Fn22_TestProtoMapInstance,
  Fn23_TestProtoSetInstance,
  Fn24_TestProtoPromiseInstance,
  Fn25_TestProtoErrorInstance,
  Fn26_TestProtoOwnPropPriority,
  Fn27_TestProtoAssignPlainObject,
  Fn28_TestProtoTypedArrayPrototype,
  Fn29_TestProtoFunctionPrototype,
  Fn30_TestProtoNonConfigurableProto,
  Fn31_TestProtoArrayPrototype,
  Fn32_TestProtoCircularReference,
  Fn33_TestProtoSymbolInstance,
  Fn34_TestProtoBigIntInstance,
  Fn35_TestProtoNonExistentProp,
  Fn36_TestProtoClassStaticMethod,
  Fn37_TestProtoProxyInstance,
  Fn38_TestProtoVsInOperator,
  Fn39_TestProtoVsHasOwnProperty,
  Fn40_TestProtoDatePrototype,
  Fn41_TestProtoAssignFunction,
  Fn43_TestProtoVsObjectKeys,
  Fn44_TestProtoAssignArrayPrototype,
  Fn45_TestProtoStrictMode,
  Fn46_TestProtoErrorSubclassInstance,
  Fn47_TestProtoNullNoObjectMethods,
  Fn48_TestProtoVsGetOwnPropertyNames,
  Fn49_TestProtoClassPrivateField,
  Fn50_TestProtoAssignRegExpPrototype,
  Fn51_TestProtoRegExpInstance,
  Fn52_TestProtoVsObjectValues,
  Fn53_TestProtoVsObjectEntries,
  Fn54_TestProtoAssignBigIntPrototype,
  Fn56_TestProtoAssignSymbolPrototype,
  Fn57_TestProtoVsInstanceof,
  Fn58_TestProtoAssignPromisePrototype,
  Fn59_TestProtoProxyTargetPrototype,
  Fn60_TestProtoAssignMapPrototype,
  Fn61_TestProtoAssignSetPrototype,
  Fn62_TestProtoInArrowFunction,
  Fn63_TestProtoAssignWeakMapPrototype,
  Fn64_TestProtoWeakMapInstance,
  Fn65_TestProtoAssignWeakSetPrototype,
  Fn66_TestProtoWeakSetInstance,
  Fn67_TestProtoVsObjectCreate,
  Fn68_TestProtoNestedObject,
  Fn69_TestProtoAssignArrayBufferPrototype,
  Fn70_TestProtoArrayBufferInstance,
  Fn71_TestProtoAssignDataViewPrototype,
  Fn72_TestProtoDataViewInstance,
  Fn73_TestProtoVsIsPrototypeOf,
  Fn76_TestProtoInAsyncFunction,
  Fn82_TestProtoInClassStaticBlock,
  Fn87_TestProtoVsReflectGetPrototypeOf,
  Fn88_TestProtoVsReflectSetPrototypeOf,
  Fn93_TestProtoInGeneratorFunction,
  Fn94_TestProtoAssignIntlDateTimeFormatPrototype,
  Fn95_TestProtoIntlDateTimeFormatInstance,
  Fn96_TestProtoAssignIntlNumberFormatPrototype,
  Fn97_TestProtoIntlNumberFormatInstance,
  Fn98_TestProtoVsObjectPrototypeIsPrototypeOf
} from './Object35';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function Object35Test() {
  describe('Object35Test', () => {
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
     * @tc.name   Object35Test001
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn01_TestProtoLiteralPoint();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test002
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn02_TestProtoSetterModify();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object35Test003
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn03_TestProtoNullPrototypeObj();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test004
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0400
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn04_TestProtoNonExtensibleObj();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test005
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0500
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn05_TestProtoInvalidValueAssign();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test006
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn06_TestProtoConstructorInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test007
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn07_TestProtoInheritProperty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test008
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn08_TestProtoDynamicChainUpdate();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test009
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_0900
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn09_TestProtoArrayInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test010
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1000
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn10_TestProtoDateInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test011
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn11_TestProtoFrozenObject();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test012
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn12_TestProtoSealedObject();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test013
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn13_TestProtoAssignNull();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test014
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1400
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn14_TestProtoFunctionInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test015
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1500
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn15_TestProtoArrowFunction();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test016
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn16_TestProtoClassInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test017
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn17_TestProtoClassInheritance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test018
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn18_TestProtoObjectPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test019
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_1900
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn19_TestProtoVsGetPrototypeOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test020
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2000
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn20_TestProtoVsSetPrototypeOf();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object35Test021
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn21_TestProtoTypedArrayInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test022
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn22_TestProtoMapInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test023
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn23_TestProtoSetInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test024
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2400
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn24_TestProtoPromiseInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test025
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2500
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn25_TestProtoErrorInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test026
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn26_TestProtoOwnPropPriority();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test027
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn27_TestProtoAssignPlainObject();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test028
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn28_TestProtoTypedArrayPrototype();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object35Test029
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_2900
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn29_TestProtoFunctionPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test030
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3000
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn30_TestProtoNonConfigurableProto();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object35Test031
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn31_TestProtoArrayPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test032
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn32_TestProtoCircularReference();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object35Test033
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn33_TestProtoSymbolInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test034
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3400
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn34_TestProtoBigIntInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test035
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3500
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn35_TestProtoNonExistentProp();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test036
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn36_TestProtoClassStaticMethod();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test037
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn37_TestProtoProxyInstance();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object35Test038
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn38_TestProtoVsInOperator();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test039
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_3900
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn39_TestProtoVsHasOwnProperty();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test040
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4000
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn40_TestProtoDatePrototype();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object35Test041
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn41_TestProtoAssignFunction();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test043
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn43_TestProtoVsObjectKeys();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test044
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4400
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn44_TestProtoAssignArrayPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test045
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4500
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn45_TestProtoStrictMode();
      expect(res).assertEqual(true);
    });
    /**
     * @tc.name   Object35Test046
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn46_TestProtoErrorSubclassInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test047
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn47_TestProtoNullNoObjectMethods();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test048
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn48_TestProtoVsGetOwnPropertyNames();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test049
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_4900
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn49_TestProtoClassPrivateField();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test050
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5000
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn50_TestProtoAssignRegExpPrototype();
      } catch (e) {
        expect(e.message)
          .assertContain("this does not have [[RegExpMatcher]]");
      }
    });

    /**
     * @tc.name   Object35Test051
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn51_TestProtoRegExpInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test052
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn52_TestProtoVsObjectValues();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test053
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn53_TestProtoVsObjectEntries();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test054
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5400
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn54_TestProtoAssignBigIntPrototype();
      } catch (e) {
        expect(e.message).assertContain("not BigInt type");
      }
    });

    /**
     * @tc.name   Object35Test055
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5500
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    // it('Object35Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
    //   let res = Fn55_TestProtoInClassGetterSetter();
    //   expect(res).assertEqual(true);
    // });

    /**
     * @tc.name   Object35Test056
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn56_TestProtoAssignSymbolPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test057
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn57_TestProtoVsInstanceof();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test058
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn58_TestProtoAssignPromisePrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test059
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_5900
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn59_TestProtoProxyTargetPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test060
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6000
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn60_TestProtoAssignMapPrototype();
      } catch (e) {
        expect(e.message).assertContain("obj is not JSMap");
      }
    });

    /**
     * @tc.name   Object35Test061
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn61_TestProtoAssignSetPrototype();
      } catch (e) {
        expect(e.message).assertContain("obj is not JSSet");
      }
    });

    /**
     * @tc.name   Object35Test062
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn62_TestProtoInArrowFunction();
      } catch (e) {
        expect(e.message).assertContain("Cannot read property __proto__ of undefined");
      }
    });

    /**
     * @tc.name   Object35Test063
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn63_TestProtoAssignWeakMapPrototype();
      } catch (e) {
        expect(e.message).assertContain("obj is not JSWeakMap.");
      }
    });

    /**
     * @tc.name   Object35Test064
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6400
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn64_TestProtoWeakMapInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test065
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6500
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn65_TestProtoAssignWeakSetPrototype();
      } catch (e) {
        expect(e.message).assertContain("obj is not JSWeakSet");
      }
    });
    /**
     * @tc.name   Object35Test066
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn66_TestProtoWeakSetInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test067
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn67_TestProtoVsObjectCreate();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test068
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn68_TestProtoNestedObject();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test069
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_6900
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn69_TestProtoAssignArrayBufferPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test070
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_7000
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn70_TestProtoArrayBufferInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test071
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_7100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn71_TestProtoAssignDataViewPrototype();
      } catch (e) {
        expect(e.message)
          .assertContain("view is not dataview");
      }
    });

    /**
     * @tc.name   Object35Test072
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_7200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn72_TestProtoDataViewInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test073
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_7300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn73_TestProtoVsIsPrototypeOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test076
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_7600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn76_TestProtoInAsyncFunction();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test082
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_8200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn82_TestProtoInClassStaticBlock();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test087
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_8700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn87_TestProtoVsReflectGetPrototypeOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test088
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_8800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn88_TestProtoVsReflectSetPrototypeOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test093
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_9300
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn93_TestProtoInGeneratorFunction();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test094
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_9400
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn94_TestProtoAssignIntlDateTimeFormatPrototype();
      } catch (e) {
        expect(e.message)
          .assertEqual("Error: Method UnwrapDateTimeFormat called on incompatible receiver #<DateTimeFormat>");
      }
    });

    /**
     * @tc.name   Object35Test095
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_9500
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn95_TestProtoIntlDateTimeFormatInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test096
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_9600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      try {
        let res = Fn96_TestProtoAssignIntlNumberFormatPrototype();
      } catch (e) {
        expect(e.message).assertEqual("Error: Method UnwrapNumberFormat called on incompatible receiver undefined");
      }
    });

    /**
     * @tc.name   Object35Test097
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_9700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn97_TestProtoIntlNumberFormatInstance();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test098
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_9800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn98_TestProtoVsObjectPrototypeIsPrototypeOf();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test101
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_10100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn101_TestProtoClassSuperPrototype();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test106
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_10600
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn106_TestProtoProxyTrapModify();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object35Test107
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_10700
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn107_TestProtoAssignMathObject();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test108
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_10800
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn108_TestProtoVsObjectKeysExtendedProto();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test109
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_10900
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn109_TestProtoAssignJSONObject();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test110
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_11000
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn110_TestProtoNestedProxy();
      expect(res).assertEqual(false);
    });

    /**
     * @tc.name   Object35Test111
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_11100
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn111_TestProtoAssignAtomicsObject();
      expect(res).assertEqual(true);
    });

    /**
     * @tc.name   Object35Test112
     * @tc.number SUB_BUILTINS_OBJECT35_TEST_11200
     * @tc.desc   test object __proto__
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object35Test112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let res = Fn112_TestProtoVsGetOwnPropertyDescriptors();
      expect(res).assertEqual(true);
    });
  })
}