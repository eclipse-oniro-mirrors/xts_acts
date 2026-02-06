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
  testArrayBufferByteLength,
  testArrayFilter,
  testArrayFindLast,
  testArrayFindLastIndex,
  testArrayFlatMap,
  testArrayLength,
  testArrayMethodPush,
  testArrayPrototypeAt,
  testArrayReduceRight,
  testArrayToReversed,
  testArrayToSorted,
  testArrayToSpliced,
  testBasicProperty,
  testBigIntLocaleString,
  testClassInstance,
  testClassInstanceMethod,
  testConstructorProperty,
  testDataViewGetUint8,
  testDateInstanceLocaleString,
  testDateLocaleDateString,
  testDatePrototype,
  testErrorCauseInstance,
  testErrorCauseStatic,
  testErrorName,
  testErrorStack,
  testFunctionLength,
  testGetProtoProperty,
  testGetterProperty,
  testInfinityValue,
  testIntlDateTimeFormat,
  testIntlRelativeTimeFormat,
  testMapClear,
  testMapSize,
  testNaNValue,
  testNestedGetter,
  testNestedProxy,
  testNonConfigurableProperty,
  testNonEnumerableProperty,
  testNonExistentProperty,
  testNullValue,
  testNumericStringProperty,
  testObjectHasOwn,
  testObjectHasOwnProperty,
  testObjectMethodHasOwnProperty,
  testObjectToString,
  testOverrideInTarget,
  testPromiseAll,
  testPromiseAllSettled,
  testPromiseAny,
  testPromiseFinally,
  testPromiseThen,
  testPrototypeChain,
  testPrototypeGetter,
  testProxyGetInherited,
  testProxyGetOwn,
  testProxyModifyTarget,
  testProxyModifyTarget2,
  testProxyOverride,
  testProxyRevocableRevoke,
  testProxyWithArrayPrototype,
  testProxyWithErrorPrototype,
  testProxyWithFunctionPrototype,
  testProxyWithGlobalThis,
  testProxyWithMapPrototype,
  testProxyWithObjectPrototype,
  testProxyWithRegExpPrototype,
  testProxyWithSetPrototype,
  testRecursiveProxy,
  testReflectNonObject,
  testRegExpSource,
  testSetClear,
  testSetSize,
  testSetterAccess,
  testSpecialCharProperty,
  testSymbolAsyncIterator,
  testSymbolForProxy,
  testSymbolHasInstance,
  testSymbolIsConcatSpreadable,
  testSymbolIterator,
  testSymbolMatch,
  testSymbolProperty,
  testSymbolReplace,
  testSymbolSearch,
  testSymbolSpecies,
  testSymbolSplit,
  testSymbolToPrimitive,
  testSymbolToStringTag,
  testTripleNestedProxy,
  testTypedArrayLength,
  testUndefinedValue,
  testValueOfMethod,
  testWeakRefDeref
} from './ActsProxyAndReflectGetTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ActsProxyAndReflectGetTest() {
  describe('actsProxyAndReflectGetTest', () => {
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
     * @tc.name   testCacheProxyAndReflectGet_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testBasicProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPrototypeChain();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0300
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0400
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetterProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNonEnumerableProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_006
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNonConfigurableProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNumericStringProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_008
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSpecialCharProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_0900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNonExistentProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_010
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNestedProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_011
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNestedGetter();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_012
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetterAccess();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1300
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayLength();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1400
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructorProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_015
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testReflectNonObject();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPrototypeGetter();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testOverrideInTarget();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testUndefinedValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_019
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_1900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNullValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyOverride();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_021
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolHasInstance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolIsConcatSpreadable();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2300
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolSpecies();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2400
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolMatch();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_025
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolReplace();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolSearch();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolSplit();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolAsyncIterator();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_029
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_2900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolToStringTag();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_030
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testFunctionLength();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_032
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testClassInstance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3300
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayMethodPush();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_034
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3400
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectMethodHasOwnProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDatePrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRegExpSource();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testErrorName();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_038
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMapSize();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_039
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_3900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetSize();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_040
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyModifyTarget();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_041
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testTripleNestedProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithArrayPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_043
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4300
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithObjectPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4400
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithFunctionPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithRegExpPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_046
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithErrorPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithMapPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_048
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_4800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithSetPrototype();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_050
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyWithGlobalThis();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_052
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testTypedArrayLength();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_053
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5300
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPromiseThen();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5400
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testWeakRefDeref();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testRecursiveProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_056
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testNaNValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testInfinityValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_058
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolToPrimitive();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_059
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_5900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testValueOfMethod();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_060
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_6000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayBufferByteLength();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_061
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_6100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDataViewGetUint8();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_6200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testIntlDateTimeFormat();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_064
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_6400
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testGetProtoProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_065
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_6500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyModifyTarget2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_066
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_6600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetOwn();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_6700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyGetInherited();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_069
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_6900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testClassInstanceMethod();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_070
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_7000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDateInstanceLocaleString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_071
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_7100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolIterator();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_072
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_7200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testProxyRevocableRevoke();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_076
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_7600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSymbolForProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_077
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_7700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testErrorStack();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_078
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_7800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayFilter();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_079
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_7900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectHasOwnProperty();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_080
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPromiseAll();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_081
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPromiseAny();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_082
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8200
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayPrototypeAt();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_083
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8300
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testBigIntLocaleString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_085
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testIntlRelativeTimeFormat();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_086
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayFindLast();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayFindLastIndex();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayToReversed();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_089
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_8900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayToSorted();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_090
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_9000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayToSpliced();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_091
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_9100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectHasOwn();
      expect(result).assertEqual(true);
    })


    /**
     * @tc.name   testCacheProxyAndReflectGet_098
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_9800
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testErrorCauseStatic();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_099
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_9900
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testErrorCauseInstance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_100
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_10000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPromiseFinally();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_101
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_10100
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testDateLocaleDateString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_103
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_10300
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayFlatMap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_104
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_10400
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testArrayReduceRight();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_105
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_10500
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testObjectToString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_106
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_10600
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testMapClear();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_107
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_10700
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testSetClear();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectGet_110
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_GET_11000
     * @tc.desc   Test Proxy.handler.get and Reflect.get Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectGet_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testPromiseAllSettled();
      expect(result).assertEqual(true);
    })
  })
}