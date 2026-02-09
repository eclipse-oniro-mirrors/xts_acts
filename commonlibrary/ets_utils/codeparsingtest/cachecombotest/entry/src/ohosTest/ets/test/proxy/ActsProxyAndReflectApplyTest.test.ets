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
  testApplyArgsAppend,
  testApplyArgsArray,
  testApplyArgsArrayBuffer,
  testApplyArgsBigInt,
  testApplyArgsBoolean,
  testApplyArgsCache,
  testApplyArgsCountValidation,
  testApplyArgsDate,
  testApplyArgsDefault,
  testApplyArgsError,
  testApplyArgsFunction,
  testApplyArgsFunction2,
  testApplyArgsGenerator,
  testApplyArgsModifyFirst,
  testApplyArgsMustBeNumber,
  testApplyArgsMustBeObject,
  testApplyArgsNull,
  testApplyArgsRegExp,
  testApplyArgsRegExpFlags,
  testApplyArgsRemoveFirst,
  testApplyArgsReset,
  testApplyArgsSet,
  testApplyArgsSortAscending,
  testApplyArgsSymbolIterator,
  testApplyArgsToNumber,
  testApplyArgsToUpperCase,
  testApplyArgsTruncate,
  testApplyArgsTypedArray,
  testApplyArgsUndefinedToZero,
  testApplyArgsWeakMap,
  testApplyArgsWeakSet,
  testApplyArguments,
  testApplyArrayPushReturnValueOverride,
  testApplyAsyncFunction,
  testApplyAsyncFunction2,
  testApplyBasic,
  testApplyCallCount,
  testApplyDateNowFixed,
  testApplyDateNowOverride,
  testApplyDefaultParams,
  testApplyErrorHandling,
  testApplyErrorSpecific,
  testApplyErrorStack,
  testApplyErrorToString,
  testApplyErrorType,
  testApplyJSONParseFix,
  testApplyMathMaxFilterNegative,
  testApplyMathMaxMultiply,
  testApplyMathMinMultiply,
  testApplyNestedProxy,
  testApplyObjectCreate,
  testApplyObjectDefinePropertyEnhance,
  testApplyObjectGetOwnPropertyNames,
  testApplyObjectKeysFilterString,
  testApplyRangeError,
  testApplyRecursiveSelfCall,
  testApplyRetryOnError,
  testApplyReturnValueAddSuffix,
  testApplyReturnValueAddTen,
  testApplyReturnValueArray,
  testApplyReturnValueBigInt,
  testApplyReturnValueDataView,
  testApplyReturnValueDate,
  testApplyReturnValueDestructure,
  testApplyReturnValueFunction,
  testApplyReturnValueFunction2,
  testApplyReturnValueGenerator,
  testApplyReturnValueMap,
  testApplyReturnValueModify,
  testApplyReturnValueNull,
  testApplyReturnValueOverride,
  testApplyReturnValueOverrideIfContains3,
  testApplyReturnValuePromise,
  testApplyReturnValueSymbol,
  testApplyReturnValueToString,
  testApplySetTimeoutUnit,
  testApplyThisAndArgsModify,
  testApplyThisAndReturnValue,
  testApplyThisArg,
  testApplyThisArgArray,
  testApplyThisArgNull,
  testApplyThisArgProxy,
  testApplyThisArgString,
  testApplyThisArgUndefined,
  testApplyThreeLayerProxy
} from './ActsProxyAndReflectApplyTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ActsProxyAndReflectApplyTest() {
  describe('actsProxyAndReflectApplyTest', () => {
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
     * @tc.name   testCacheProxyAndReflectApply_001
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0100
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyBasic();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThisArg();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0300
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsAppend();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsRemoveFirst();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueOverride();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_006
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsModifyFirst();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_007
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThisAndReturnValue();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_008
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0800
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsReset();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_0900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueModify();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_010
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_1000
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThisAndArgsModify();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_012
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_1200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArrayPushReturnValueOverride();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_1300
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyMathMaxMultiply();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_1400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyMathMaxFilterNegative();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_015
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_1500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThisArgNull();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_1600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsUndefinedToZero();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_1700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThisArgUndefined();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2000
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueToString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_021
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2100
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsToNumber();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsDefault();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2300
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsTruncate();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueAddTen();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_025
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueOverrideIfContains3();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThisArgProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2800
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyRecursiveSelfCall();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_029
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_2900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyErrorHandling();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_035
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_3500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyObjectKeysFilterString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_3700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyDateNowOverride();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_039
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_3900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyObjectDefinePropertyEnhance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_041
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_4100
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await testApplyAsyncFunction();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_4200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsMustBeNumber();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_043
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_4300
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyCallCount();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_4400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsSortAscending();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_4500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThisArgArray();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_046
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_4600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsMustBeObject();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_4700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsCache();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_048
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_4800
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyRetryOnError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_050
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_5000
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueDestructure();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_5400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsCountValidation();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_5500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueAddSuffix();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_056
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_5600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyErrorToString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_5700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsToUpperCase();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_058
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_5800
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyMathMinMultiply();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_059
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_5900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyObjectGetOwnPropertyNames();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_6200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueSymbol();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_063
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_6300
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsFunction();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_064
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_6400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueFunction();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_065
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_6500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThisArgString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_066
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_6600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsBoolean();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_6700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsNull();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_068
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_6800
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueNull();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_069
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_6900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyErrorSpecific();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_070
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_7000
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsRegExp();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_072
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_7200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyDefaultParams();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_073
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_7300
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsDate();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_074
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_7400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueDate();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_075
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_7500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_076
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_7600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyErrorType();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_077
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_7700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyNestedProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_079
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_7900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyDateNowFixed();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_080
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8000
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await testApplySetTimeoutUnit();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_081
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8100
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyJSONParseFix();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_082
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyObjectCreate();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_084
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsArray();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_085
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueArray();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_086
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsSet();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueMap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8800
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsWeakMap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_089
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_8900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyErrorStack();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_090
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_9000
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsBigInt();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_091
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_9100
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueBigInt();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_092
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_9200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsSymbolIterator();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_093
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_9300
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueGenerator();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_096
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_9600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsRegExpFlags();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_099
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_9900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsArrayBuffer();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_100
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10000
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueDataView();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_101
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10100
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsTypedArray();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_102
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10200
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await testApplyReturnValuePromise();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_103
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10300
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsWeakSet();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_104
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10400
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArguments();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_105
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10500
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsFunction2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_106
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10600
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyReturnValueFunction2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_107
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10700
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyRangeError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_108
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10800
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyThreeLayerProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_109
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_10900
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testApplyArgsGenerator();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectApply_110
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_APPLY_11000
     * @tc.desc   Test Proxy.handler.apply and Reflect.apply Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectApply_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await testApplyAsyncFunction2();
      expect(result).assertEqual(true);
    })
  })
}