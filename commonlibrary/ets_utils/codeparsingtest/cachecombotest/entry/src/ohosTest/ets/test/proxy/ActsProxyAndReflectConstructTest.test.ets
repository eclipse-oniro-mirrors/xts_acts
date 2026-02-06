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
  testConstructAggregateError,
  testConstructArgsArray,
  testConstructArgsArray2,
  testConstructArgsArrayBuffer,
  testConstructArgsArrayBuffer2,
  testConstructArgsAsyncFunction,
  testConstructArgsBigInt,
  testConstructArgsBigInt2,
  testConstructArgsBigInt64Array,
  testConstructArgsCustomError,
  testConstructArgsDataView,
  testConstructArgsDate,
  testConstructArgsDate2,
  testConstructArgsError,
  testConstructArgsError2,
  testConstructArgsErrorInstance,
  testConstructArgsFunction,
  testConstructArgsGeneratorFunction2,
  testConstructArgsMap,
  testConstructArgsMap2,
  testConstructArgsNull,
  testConstructArgsObjectInstance,
  testConstructArgsObjectNull,
  testConstructArgsPromise,
  testConstructArgsPromise2,
  testConstructArgsRegExp,
  testConstructArgsRegExp2,
  testConstructArgsSet,
  testConstructArgsSharedArrayBuffer,
  testConstructArgsString,
  testConstructArgsSymbol,
  testConstructArgsSymbol2,
  testConstructArgsSymbolFor,
  testConstructArgsTypedArray,
  testConstructArgsUint8Array,
  testConstructArgsUndefined,
  testConstructArgsURIErrorInstance,
  testConstructArgsWeakMap,
  testConstructArgsWeakMap2,
  testConstructArgsWeakSet,
  testConstructArguments,
  testConstructArrayFilterMultiply,
  testConstructAsyncConstructor,
  testConstructAsyncMethods,
  testConstructClassFields,
  testConstructDataView,
  testConstructDateNowFixed,
  testConstructDefaultParams,
  testConstructDefaultParams2,
  testConstructDefaultParams3,
  testConstructDestructuring,
  testConstructErrorType,
  testConstructEvalError,
  testConstructEvalError2,
  testConstructGeneratorMethods,
  testConstructHasInstance,
  testConstructInheritance,
  testConstructInstanceMethod,
  testConstructMultiArgs,
  testConstructNestedProxy2,
  testConstructPrivateFields,
  testConstructPromise,
  testConstructPrototypeChain,
  testConstructPrototypeInheritance,
  testConstructRangeError,
  testConstructReferenceError,
  testConstructReferenceError2,
  testConstructRestArgs,
  testConstructReturnValueArray,
  testConstructReturnValueArrayBufferView,
  testConstructReturnValueBigInt64Array,
  testConstructReturnValueDate,
  testConstructReturnValueFunction,
  testConstructReturnValueJSON,
  testConstructReturnValueMap,
  testConstructReturnValueProxy,
  testConstructReturnValueRegExp,
  testConstructReturnValueSet,
  testConstructReturnValueTypedArray,
  testConstructReturnValueWeakMap,
  testConstructStaticMethod,
  testConstructStaticMethodNewTarget,
  testConstructSuperInProxy,
  testConstructSyntaxError,
  testConstructSyntaxError2,
  testConstructThisBinding,
  testConstructThisBinding2,
  testConstructToStringTag,
  testConstructTypeError,
  testConstructUint8Array,
  testConstructURIError,
  testConstructURIError2
} from './ActsProxyAndReflectConstructTest';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time));
}

export default function ActsProxyAndReflectConstructTest() {
  describe('actsProxyAndReflectConstructTest', () => {
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
     * @tc.name   testCacheProxyAndReflectConstruct_002
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_0200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructDefaultParams();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_003
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_0300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsDate();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_004
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_0400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueDate();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_005
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_0500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_006
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_0600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructErrorType();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_008
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_0800
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArrayFilterMultiply();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_009
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_0900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructDateNowFixed();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_010
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsArray();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_011
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1100
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsMap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_012
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueSet();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_013
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsWeakMap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_014
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructSyntaxError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_015
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructInheritance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_016
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructPrototypeChain();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_017
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsRegExp();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_018
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1800
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueJSON();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_019
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_1900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await testConstructPromise();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_020
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsBigInt();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_021
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2100
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructThisBinding();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_022
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsArrayBuffer();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_023
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueTypedArray();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_024
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReferenceError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_026
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructDefaultParams2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_027
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsSymbol();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_028
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2800
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructStaticMethod();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_029
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_2900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructInstanceMethod();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_031
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_3100
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsPromise();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_032
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_3200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_033
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_3300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructEvalError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_034
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_3400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructToStringTag();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_036
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_3600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueArrayBufferView();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_037
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_3700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructPrototypeInheritance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_038
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_3800
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsTypedArray();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_039
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_3900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructURIError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_040
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_4000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructHasInstance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_042
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_4200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsError2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_043
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_4300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueFunction();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_044
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_4400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArguments();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_045
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_4500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructRangeError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_046
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_4600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsWeakSet();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_047
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_4700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueMap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_049
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_4900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsUndefined();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_050
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsNull();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_051
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5100
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructSuperInProxy();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_052
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueArray();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_053
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructThisBinding2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_054
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsObjectNull();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_055
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await testConstructAsyncConstructor();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_056
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsSharedArrayBuffer();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_057
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsSet();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_058
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5800
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsDate2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_059
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_5900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsArray2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_060
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueRegExp();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_061
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6100
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructMultiArgs();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_062
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructDefaultParams3();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_063
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructRestArgs();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_064
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructDestructuring();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_065
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructPrivateFields();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_066
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructClassFields();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_067
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructGeneratorMethods();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_068
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_6800
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let result: boolean = await testConstructAsyncMethods();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_070
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructStaticMethodNewTarget();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_071
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7100
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsSymbol2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_073
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsBigInt2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_074
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructTypeError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_075
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructNestedProxy2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_076
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsFunction();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_077
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueBigInt64Array();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_078
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7800
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructSyntaxError2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_079
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_7900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsRegExp2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_080
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsArrayBuffer2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_081
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8100
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructDataView();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_082
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructUint8Array();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_083
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsMap2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_084
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsWeakMap2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_085
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReturnValueWeakMap();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_086
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsPromise2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_087
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructEvalError2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_088
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8800
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructReferenceError2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_089
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_8900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructAggregateError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_092
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_9200
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsSymbolFor();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_093
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_9300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsBigInt64Array();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_094
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_9400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsDataView();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_095
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_9500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsUint8Array();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_096
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_9600
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsAsyncFunction();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_097
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_9700
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsGeneratorFunction2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_100
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_10000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsString();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_103
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_10300
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsErrorInstance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_104
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_10400
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsURIErrorInstance();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_105
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_10500
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsCustomError();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_109
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_10900
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructURIError2();
      expect(result).assertEqual(true);
    })

    /**
     * @tc.name   testCacheProxyAndReflectConstruct_110
     * @tc.number SUB_COMMONLIBRARY_BASE_CACHE_PROXYANDREFLECT_Set_11000
     * @tc.desc   Test Proxy.handler.construct and Reflect.construct Combined Scene.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCacheProxyAndReflectConstruct_110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let result: boolean = testConstructArgsObjectInstance();
      expect(result).assertEqual(true);
    })
  })
}