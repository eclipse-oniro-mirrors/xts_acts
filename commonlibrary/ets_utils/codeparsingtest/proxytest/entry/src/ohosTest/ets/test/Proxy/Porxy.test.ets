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
  testApplyInterceptCall28,
  testApplyModifyThis81,
  testApplyReturnNonFunction66,
  testArrayProxyLength38,
  testConstructReturnDerived82,
  testConstructReturnNonObject29,
  testDefinePropertyConfigInvariant52,
  testDefinePropertyInvariant21,
  testDeleteNonExistentProperty68,
  testDeleteThrowError93,
  testGetArrayIndex41,
  testGetDescCustom69,
  testGetInheritedProperty24,
  testGetInvariant25,
  testGetOwnPropertyDescriptorInvariant19,
  testGetOwnPropertyDescriptorTrap18,
  testGetPrototypeOfInvariant12,
  testGetPrototypeOfTrap11,
  testGetRecursion64,
  testGetSymbolProperty42,
  testGetThisBinding40,
  testGetTrapError91,
  testGetUndefinedProperty73,
  testHasHideEnumerable77,
  testHasInheritedProperty47,
  testHasInvariantExtensible48,
  testHasSymbolIterator78,
  testHasVirtualProperty97,
  testIsExtensibleInvariant16,
  testMultiLayerProxy100,
  testMultiLevelProxyPrototype63,
  testNestedProxy37,
  testOwnKeysDynamicKeys98,
  testOwnKeysFilterNonEnumerable49,
  testOwnKeysFilterSymbols39,
  testOwnKeysInvariant10,
  testOwnKeysInvariant23,
  testOwnKeysOnlySymbols79,
  testOwnKeysSymbolInvariant50,
  testPreventExtensionsTrap17,
  testPropertyAccessLog95,
  testPropertyAlias96,
  testProxyApplyTrap5,
  testProxyArrayBuffer72,
  testProxyAsPrototype62,
  testProxyClassInstanceMethod90,
  testProxyClassStaticMethod89,
  testProxyConstructTrap6,
  testProxyDateObject60,
  testProxyDeleteProperty4,
  testProxyFunctionPrototype59,
  testProxyGetTrap1,
  testProxyHasTrap3,
  testProxyMapGet61,
  testProxyPromiseThen99,
  testProxyRegExpTest71,
  testProxySetTrap2,
  testReflectApply30,
  testReflectApplyNoArgs56,
  testReflectConstruct31,
  testReflectConstructNewTarget83,
  testReflectDefineProperty9,
  testReflectDelete33,
  testReflectDeleteArray86,
  testReflectForwarding8,
  testReflectGetDesc34,
  testReflectGetInherited55,
  testReflectGetReceiver84,
  testReflectHas32,
  testReflectIsExtensible54,
  testReflectSetAccessor85,
  testReflectSetPrototype53,
  testRevocableProxy7,
  testRevokedGetDesc87,
  testRevokedProxyApply35,
  testRevokedProxyConstruct36,
  testRevokedProxyHas57,
  testRevokedProxyOwnKeys58,
  testRevokedSetPrototype88,
  testSetAccessorInvariant46,
  testSetAndDefine92,
  testSetArrayIndex44,
  testSetInheritedProperty26,
  testSetModifyOtherProperty65,
  testSetPrototypeOfInvariant14,
  testSetPrototypeOfTrap13,
  testSetStrictMode27,
  testSetSymbolProperty75,
  testSetValueRange74
} from './Proxy';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}


export default function proxyTest() {
  describe('proxyTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
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
     * @tc.number SUB_BUILTINS_PROXY_TEST_0100
     * @tc.name proxyTest001
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyGetTrap1();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_0200
     * @tc.name proxyTest002
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxySetTrap2();
      expect(result).assertEqual(3);
    });
    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_0300
     * @tc.name proxyTest003
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyHasTrap3();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_0400
     * @tc.name proxyTest004
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyDeleteProperty4();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_0500
     * @tc.name proxyTest005
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyApplyTrap5();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_0600
     * @tc.name proxyTest006
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyConstructTrap6();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_0700
     * @tc.name proxyTest007
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRevocableProxy7();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_0800
     * @tc.name proxyTest008
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectForwarding8();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_0900
     * @tc.name proxyTest009
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectDefineProperty9();
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1000
     * @tc.name proxyTest010
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysInvariant10();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1100
     * @tc.name proxyTest011
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetPrototypeOfTrap11();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1200
     * @tc.name proxyTest012
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetPrototypeOfInvariant12();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1300
     * @tc.name proxyTest013
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfTrap13();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1400
     * @tc.name proxyTest014
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetPrototypeOfInvariant14();
      expect(result).assertEqual(1);

    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1600
     * @tc.name proxyTest016
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testIsExtensibleInvariant16();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1700
     * @tc.name proxyTest017
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPreventExtensionsTrap17();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1800
     * @tc.name proxyTest018
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyDescriptorTrap18();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_1900
     * @tc.name proxyTest019
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetOwnPropertyDescriptorInvariant19();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_2100
     * @tc.name proxyTest021
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDefinePropertyInvariant21();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_2300
     * @tc.name proxyTest023
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysInvariant23();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_2400
     * @tc.name proxyTest024
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetInheritedProperty24();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_2500
     * @tc.name proxyTest025
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetInvariant25();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_2600
     * @tc.name proxyTest026
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetInheritedProperty26();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_2700
     * @tc.name proxyTest027
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetStrictMode27();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_2800
     * @tc.name proxyTest028
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testApplyInterceptCall28();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_2900
     * @tc.name proxyTest029
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructReturnNonObject29();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3000
     * @tc.name proxyTest030
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectApply30();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3100
     * @tc.name proxyTest031
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectConstruct31();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3200
     * @tc.name proxyTest032
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectHas32();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3300
     * @tc.name proxyTest033
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectDelete33();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3400
     * @tc.name proxyTest034
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectGetDesc34();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3500
     * @tc.name proxyTest035
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRevokedProxyApply35();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3600
     * @tc.name proxyTest036
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRevokedProxyConstruct36();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3700
     * @tc.name proxyTest037
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testNestedProxy37();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3800
     * @tc.name proxyTest038
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testArrayProxyLength38();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_3900
     * @tc.name proxyTest039
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysFilterSymbols39();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_4000
     * @tc.name proxyTest040
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetThisBinding40();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_4100
     * @tc.name proxyTest041
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetArrayIndex41();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_4200
     * @tc.name proxyTest042
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetSymbolProperty42();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_4400
     * @tc.name proxyTest044
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetArrayIndex44();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_4600
     * @tc.name proxyTest046
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetAccessorInvariant46();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_4700
     * @tc.name proxyTest047
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasInheritedProperty47();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_4800
     * @tc.name proxyTest048
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasInvariantExtensible48();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_4900
     * @tc.name proxyTest049
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysFilterNonEnumerable49();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5000
     * @tc.name proxyTest050
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysSymbolInvariant50();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5200
     * @tc.name proxyTest052
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDefinePropertyConfigInvariant52();
      expect(result).assertEqual(1);
    });
    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5300
     * @tc.name proxyTest053
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectSetPrototype53();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5400
     * @tc.name proxyTest054
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectIsExtensible54();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5500
     * @tc.name proxyTest055
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectGetInherited55();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5600
     * @tc.name proxyTest056
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectApplyNoArgs56();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5700
     * @tc.name proxyTest057
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRevokedProxyHas57();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5800
     * @tc.name proxyTest058
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRevokedProxyOwnKeys58();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_5900
     * @tc.name proxyTest059
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyFunctionPrototype59();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6000
     * @tc.name proxyTest060
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyDateObject60();
      expect(result).assertEqual(true);
    });
    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6100
     * @tc.name proxyTest061
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyMapGet61();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6200
     * @tc.name proxyTest062
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyAsPrototype62();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6300
     * @tc.name proxyTest063
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultiLevelProxyPrototype63();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6400
     * @tc.name proxyTest064
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetRecursion64();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6500
     * @tc.name proxyTest065
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetModifyOtherProperty65();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6600
     * @tc.name proxyTest066
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testApplyReturnNonFunction66();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6800
     * @tc.name proxyTest068
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteNonExistentProperty68();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_6900
     * @tc.name proxyTest069
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetDescCustom69();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_7100
     * @tc.name proxyTest071
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyRegExpTest71();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_7200
     * @tc.name proxyTest072
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyArrayBuffer72();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_7300
     * @tc.name proxyTest073
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetUndefinedProperty73();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_7400
     * @tc.name proxyTest074
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetValueRange74();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_7500
     * @tc.name proxyTest075
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetSymbolProperty75();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_7700
     * @tc.name proxyTest077
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasHideEnumerable77();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_7800
     * @tc.name proxyTest078
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasSymbolIterator78();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_7900
     * @tc.name proxyTest079
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysOnlySymbols79();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8100
     * @tc.name proxyTest081
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testApplyModifyThis81();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8200
     * @tc.name proxyTest082
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testConstructReturnDerived82();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8300
     * @tc.name proxyTest083
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectConstructNewTarget83();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8400
     * @tc.name proxyTest084
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectGetReceiver84();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8500
     * @tc.name proxyTest085
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectSetAccessor85();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8600
     * @tc.name proxyTest086
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testReflectDeleteArray86();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8700
     * @tc.name proxyTest087
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRevokedGetDesc87();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8800
     * @tc.name proxyTest088
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testRevokedSetPrototype88();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_8900
     * @tc.name proxyTest089
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyClassStaticMethod89();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9000
     * @tc.name proxyTest090
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testProxyClassInstanceMethod90();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9100
     * @tc.name proxyTest091
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testGetTrapError91();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9200
     * @tc.name proxyTest092
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testSetAndDefine92();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9300
     * @tc.name proxyTest093
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testDeleteThrowError93();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9500
     * @tc.name proxyTest095
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPropertyAccessLog95();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9600
     * @tc.name proxyTest096
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testPropertyAlias96();
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9700
     * @tc.name proxyTest097
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testHasVirtualProperty97();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9800
     * @tc.name proxyTest098
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testOwnKeysDynamicKeys98();
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_9900
     * @tc.name proxyTest099
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result = await testProxyPromiseThen99();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_BUILTINS_PROXY_TEST_10000
     * @tc.name proxyTest100
     * @tc.desc test proxy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('proxyTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result = testMultiLayerProxy100();
      expect(result).assertEqual(true);
    });

  })
}


