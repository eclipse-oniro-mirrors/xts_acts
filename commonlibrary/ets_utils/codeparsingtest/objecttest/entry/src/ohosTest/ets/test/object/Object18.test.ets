/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
  Fn01_testNormalObjectNotFrozen,
  Fn02_testFrozenObject,
  Fn03_testNonObjectParameter,
  Fn07_testFrozenEmptyObject,
  Fn08_testFrozenObjPrototype,
  Fn09_testFrozenObjWithAccessor,
  Fn10_testNestedObjFreeze,
  Fn11_testReconfigureFrozenProp,
  Fn14_testFrozenObjIsExtensible,
  Fn15_testFrozenPropDescriptors,
  Fn16_testNullUndefinedParameter,
  Fn17_testFrozenPropEnumerability,
  Fn23_testFrozenObjToString,
  Fn24_testFrozenObjWithDate,
  Fn25_testFrozenObjObjectKeys,
  Fn26_testFrozenObjWithRegExp,
  Fn27_testFrozenObjHasOwnProperty,
  Fn29_testFrozenObjGetPrototype,
  Fn30_testFrozenObjWithMap,
  Fn32_testFrozenObjWithSet,
  Fn35_testFrozenObjPropDescValue,
  Fn37_testFrozenObjPrototypeChain,
  Fn40_testFrozenObjWithNestedArray,
  Fn43_testFrozenObjGetOwnNames,
  Fn47_testFrozenObjIsSealed,
  Fn53_testFrozenObjPropDescEnumerable,
  Fn54_testFrozenObjWithDateModify,
  Fn57_testFrozenObjPreventExt,
  Fn61_testFrozenObjAccessorDescPreserve,
  Fn68_testFrozenObjWithDateReset,
  Fn75_testFrozenObjWithSymbolProto
} from './Object18';


function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function Object18Test() {
  describe('Object18Test', () => {
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
     * @tc.name   Object18Test001
     * @tc.number SUB_BUILTINS_Object18_TEST_0100
     * @tc.desc   test object create (direct and inherited property)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn01_testNormalObjectNotFrozen();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test002
     * @tc.number SUB_BUILTINS_Object18_TEST_0200
     * @tc.desc   test object create (null prototype)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn02_testFrozenObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test003
     * @tc.number SUB_BUILTINS_Object18_TEST_0300
     * @tc.desc   test non-object parameter handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn03_testNonObjectParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test007
     * @tc.number SUB_BUILTINS_Object18_TEST_0700
     * @tc.desc   test freezing empty objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn07_testFrozenEmptyObject();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test008
     * @tc.number SUB_BUILTINS_Object18_TEST_0800
     * @tc.desc   test frozen object prototype handling
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn08_testFrozenObjPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test009
     * @tc.number SUB_BUILTINS_Object18_TEST_0900
     * @tc.desc   test frozen objects with accessor properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn09_testFrozenObjWithAccessor();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test010
     * @tc.number SUB_BUILTINS_Object18_TEST_1000
     * @tc.desc   test freezing nested objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn10_testNestedObjFreeze();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test011
     * @tc.number SUB_BUILTINS_Object18_TEST_1100
     * @tc.desc   test reconfiguring frozen properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn11_testReconfigureFrozenProp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test014
     * @tc.number SUB_BUILTINS_Object18_TEST_1400
     * @tc.desc   test extensibility of frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn14_testFrozenObjIsExtensible();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test015
     * @tc.number SUB_BUILTINS_Object18_TEST_1500
     * @tc.desc   test property descriptors of frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn15_testFrozenPropDescriptors();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test016
     * @tc.number SUB_BUILTINS_Object18_TEST_1600
     * @tc.desc   test handling null and undefined parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn16_testNullUndefinedParameter();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test017
     * @tc.number SUB_BUILTINS_Object18_TEST_1700
     * @tc.desc   test enumerability of frozen properties
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn17_testFrozenPropEnumerability();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test023
     * @tc.number SUB_BUILTINS_Object18_TEST_2300
     * @tc.desc   test toString method on frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn23_testFrozenObjToString();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test024
     * @tc.number SUB_BUILTINS_Object18_TEST_2400
     * @tc.desc   test frozen objects containing Date objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn24_testFrozenObjWithDate();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test025
     * @tc.number SUB_BUILTINS_Object18_TEST_2500
     * @tc.desc   test Object.keys on frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn25_testFrozenObjObjectKeys();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test026
     * @tc.number SUB_BUILTINS_Object18_TEST_2600
     * @tc.desc   test frozen objects containing RegExp objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn26_testFrozenObjWithRegExp();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test027
     * @tc.number SUB_BUILTINS_Object18_TEST_2700
     * @tc.desc   test hasOwnProperty on frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn27_testFrozenObjHasOwnProperty();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test029
     * @tc.number SUB_BUILTINS_Object18_TEST_2900
     * @tc.desc   test getting prototype of frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn29_testFrozenObjGetPrototype();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test030
     * @tc.number SUB_BUILTINS_Object18_TEST_3000
     * @tc.desc   test frozen objects containing Map objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn30_testFrozenObjWithMap();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test032
     * @tc.number SUB_BUILTINS_Object18_TEST_3200
     * @tc.desc   test frozen objects containing Set objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn32_testFrozenObjWithSet();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test035
     * @tc.number SUB_BUILTINS_Object18_TEST_3500
     * @tc.desc   test value in property descriptors of frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn35_testFrozenObjPropDescValue();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test037
     * @tc.number SUB_BUILTINS_Object18_TEST_3700
     * @tc.desc   test prototype chain of frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn37_testFrozenObjPrototypeChain();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test040
     * @tc.number SUB_BUILTINS_Object18_TEST_4000
     * @tc.desc   test frozen objects containing nested arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn40_testFrozenObjWithNestedArray();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test043
     * @tc.number SUB_BUILTINS_Object18_TEST_4300
     * @tc.desc   test Object.getOwnPropertyNames on frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn43_testFrozenObjGetOwnNames();
      expect(result).assertEqual(true);
    });


    /**
     * @tc.name   Object18Test047
     * @tc.number SUB_BUILTINS_Object18_TEST_4700
     * @tc.desc   test Object.isSealed on frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn47_testFrozenObjIsSealed();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test053
     * @tc.number SUB_BUILTINS_Object18_TEST_5300
     * @tc.desc   test enumerable in property descriptors of frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn53_testFrozenObjPropDescEnumerable();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test054
     * @tc.number SUB_BUILTINS_Object18_TEST_5400
     * @tc.desc   test modifying Date properties in frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn54_testFrozenObjWithDateModify();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test057
     * @tc.number SUB_BUILTINS_Object18_TEST_5700
     * @tc.desc   test preventExtensions on already frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn57_testFrozenObjPreventExt();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test061
     * @tc.number SUB_BUILTINS_Object18_TEST_6100
     * @tc.desc   test preservation of accessor descriptors in frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn61_testFrozenObjAccessorDescPreserve();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test068
     * @tc.number SUB_BUILTINS_Object18_TEST_6800
     * @tc.desc   test resetting Date properties in frozen objects
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn68_testFrozenObjWithDateReset();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.name   Object18Test075
     * @tc.number SUB_BUILTINS_Object18_TEST_7500
     * @tc.desc   test frozen objects with symbol prototypes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('Object18Test075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = Fn75_testFrozenObjWithSymbolProto();
      expect(result).assertEqual(true);
    });
  })
}