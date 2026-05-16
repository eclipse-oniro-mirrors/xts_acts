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
  testArrayLength,
  testProxyString,
  testSetAfterRevocableRevoke,
  testSetArgumentsProperty,
  testSetArrayBufferProperty,
  testSetArrayIndex100,
  testSetArrayIndex123,
  testSetArrayIndexProperty,
  testSetBasicProperty,
  testSetBigIntValue,
  testSetCalleeProperty,
  testSetCallerProperty,
  testSetConstructorProperty,
  testSetDataViewProperty,
  testSetDefineGetterProperty,
  testSetDefineSetterProperty,
  testSetEmptyStringProperty,
  testSetErrorMessage,
  testSetErrorStackProperty,
  testSetFunctionCustomProperty,
  testSetFunctionPrototype,
  testSetHasOwnPropertyProperty,
  testSetInfinityValue,
  testSetInheritedProperty,
  testSetLengthOnObject,
  testSetLookupGetterProperty,
  testSetLookupSetterProperty,
  testSetMapCustomProperty,
  testSetMapGetProperty,
  testSetMapSetProperty,
  testSetNaN,
  testSetNaNValue,
  testSetNegativeZeroValue,
  testSetNestedProxyProperty,
  testSetNonConfigurableProperty,
  testSetNull,
  testSetNullValue,
  testSetOnNullPrototype,
  testSetOnSet,
  testSetOnWeakSet,
  testSetPromiseProperty,
  testSetPromiseThen,
  testSetPropertyIsEnumerableProperty,
  testSetPropertyWithNumericString,
  testSetProtoAsProperty,
  testSetProtoStringOnNullPrototype,
  testSetProtoStringProperty,
  testSetReadOnlyProperty,
  testSetRegExpLastIndex,
  testSetRegExpValue,
  testSetStringSymbolIterator,
  testSetSymbolAsyncIterator,
  testSetSymbolForValue,
  testSetSymbolHasInstanceProperty,
  testSetSymbolIterator,
  testSetSymbolOnNullPrototype,
  testSetSymbolProperty,
  testSetSymbolProtoProperty,
  testSetSymbolStringProperty,
  testSetSymbolToStringTag,
  testSetSymbolValue,
  testSetToJSONProperty,
  testSetToLocaleStringProperty,
  testSetToStringProperty,
  testSetTrapReturnsTrue,
  testSetTrapThisContext,
  testSetTriggersHasTrap,
  testSetTriggersOwnKeysTrap,
  testSetTypedArrayProperty,
  testSetUndefined,
  testSetValueOfProperty,
  testSetWeakMapProperty,
  testSetWithDifferentHandlerObject,
  testSetWithNonEnumerableProperty,
  testSetWithNonObjectReceiver,
  testSetWithProxyReceiver,
  testSetWithReceiver,
  testSetWithSetter,
  testSetWithSymbolProperty,
  testSetWithTargetHasProto
} from './ActsProxyAndReflectSetTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ActsProxyAndReflectSetTest() {
  describe('actsProxyAndReflectSetTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(20);
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
     * @tc.name   testCacheProxyAndReflectSet_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetBasicProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetInheritedProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNonConfigurableProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetReadOnlyProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetTriggersHasTrap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_0900
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetAfterRevocableRevoke();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetRegExpLastIndex();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetMapCustomProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_015
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetTriggersOwnKeysTrap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithReceiver();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetArrayIndexProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_1800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetStringSymbolIterator();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithSetter();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetUndefined();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNull();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNaN();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_025
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetRegExpValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetOnNullPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithDifferentHandlerObject();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_2800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_030
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetProtoAsProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_031
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithSymbolProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_032
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetTrapReturnsTrue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetArrayBufferProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_034
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetDataViewProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetErrorMessage();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetPromiseThen();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithProxyReceiver();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_038
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_3800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWeakMapProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_040
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNestedProxyProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_041
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolToStringTag();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetConstructorProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithNonEnumerableProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithNonObjectReceiver();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_046
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetArrayIndex123();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetBigIntValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_048
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetMapSetProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_049
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_4900
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetOnSet();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_050
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetOnWeakSet();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_051
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetTrapThisContext();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_052
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetDefineGetterProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_053
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetErrorStackProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetPromiseProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolHasInstanceProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_056
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetInfinityValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetPropertyWithNumericString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_058
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_5800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolOnNullPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_060
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_6000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolProtoProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_061
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_6100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetLengthOnObject();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_6200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetEmptyStringProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_063
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_6300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNegativeZeroValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_064
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_6400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetMapGetProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_065
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_6500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetArrayIndex100();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_6700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetHasOwnPropertyProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_068
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_6800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetToStringProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_070
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_7000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetFunctionCustomProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_071
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_7100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolIterator();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_074
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_7400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetTypedArrayProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_075
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_7500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetProtoStringProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_081
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_8100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetArgumentsProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_082
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_8200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetCallerProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_083
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_8300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetCalleeProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_085
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_8500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetFunctionPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_086
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_8600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetDefineSetterProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_8700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetLookupGetterProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_8800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetLookupSetterProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_089
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_8900
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_090
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9000
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolStringProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_091
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9100
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNaNValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_092
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9200
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetNullValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_093
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9300
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetProtoStringOnNullPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_094
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9400
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetWithTargetHasProto();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_095
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9500
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolForValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_096
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetValueOfProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_097
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9700
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetToLocaleStringProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_098
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9800
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetToJSONProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_099
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_9900
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetPropertyIsEnumerableProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_106
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_10600
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayLength();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectSet_109
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_SET_10900
     * @tc.desc   Test Proxy.handler.set and Reflect.set Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectSet_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSymbolAsyncIterator();
      expect(result).assertEqual(true);
    })
  })
}