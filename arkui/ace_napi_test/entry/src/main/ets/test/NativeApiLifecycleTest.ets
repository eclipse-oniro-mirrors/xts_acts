/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "hypium/index"

// @ts-ignore
import napitest from 'libnapitest.so'

export default function napiLifecycleTest() {

  describe('napiLifecycleTest', function () {
    let value;
    let obj;

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0001
     * @tc.name      createAsyncResource0001
     * @tc.desc      aceNapiEtsTest
     */
    it('createAsyncResource0001', 0, async function (done) {
      console.info('createAsyncResource start');
      value = napitest.createAsyncResource({ foo: 'bar' } , false);
      console.info('createAsyncResource napiLifecycleTest result is: ');
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0002
     * @tc.name      destroyAsyncResource0002
     * @tc.desc      aceNapiEtsTest
     */
    it('destroyAsyncResource0002', 0, async function (done) {
      console.info('destroyAsyncResource start');
      obj = napitest.createAsyncResource({ foo: 'bar' } , false);
      value = napitest.destroyAsyncResource(obj);
      console.info('destroyAsyncResource napiLifecycleTest result is: ');
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0003
     * @tc.name      runInCallbackScope0003
     * @tc.desc      aceNapiEtsTest
     */
    it('runInCallbackScope0003', 0, async function (done) {
      console.info('runInCallbackScope start');
      value = napitest.runInCallbackScope({}, 'test-resource', () => 42);
      console.info('runInCallbackScope napiLifecycleTest result is: ' + value);
      expect(value).assertEqual(42);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0004
     * @tc.name      testResolveAsync0004
     * @tc.desc      aceNapiEtsTest
     */
    it('testResolveAsync0004', 0, async function (done) {
      console.info('testResolveAsync start');
      value = napitest.testResolveAsync();
      console.info('testResolveAsync END');
      expect(value instanceof Promise).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0005
     * @tc.name      testSetInstanceData0005
     * @tc.desc      aceNapiEtsTest
     */
    it('testSetInstanceData0005', 0, async function (done) {
      value = napitest.napiSetInstanceData();
      expect(value).assertEqual(1);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0006
     * @tc.name      asyncWorkCallback0006
     * @tc.desc      aceNapiEtsTest
     */
    it('asyncWorkCallback0006', 0, async function (done) {
      console.info('asyncWorkCallback start');

      new Promise((resolve) => {
        let value = napitest.asyncWorkCallback(resolve);
        console.info('asyncWorkCallback napiLifecycleTest result is:  ' + value + "--" + JSON.stringify(value));
        expect(value == undefined).assertTrue();
      })
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0007
     * @tc.name      napiAsyncCleanUpHook0007
     * @tc.desc      aceNapiEtsTest
     */
    it('napiAsyncCleanUpHook0007', 0, async function (done) {
      console.info('napiAsyncCleanUpHook start');
      value = napitest.napiAsyncCleanUpHook();
      console.info('napiAsyncCleanUpHook napiLifecycleTest result is:  ' + value + "--" + JSON.stringify(value));
      expect(value == undefined).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0008
     * @tc.name      napiEnvCleanupHook0008
     * @tc.desc      aceNapiEtsTest
     */
    it('napiEnvCleanupHook0008', 0, async function (done) {
      console.info('napiEnvCleanUpHook start');
      value = napitest.napiEnvCleanUpHook();
      console.info('napiEnvCleanUpHook napiLifecycleTest result is: ' + value + "--" + JSON.stringify(value));
      expect(value == undefined).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0009
     * @tc.name      napiGetModuleFileName0009
     * @tc.desc      aceNapiEtsTest
     */
    it('napiGetModuleFileName0009', 0, async function (done) {
      console.info('napiGetModuleFileName start');
      value = napitest.getModuleFileName().indexOf(".so");
      console.info('napiGetModuleFileName napiLifecycleTest result is: ' + value + "--" + JSON.stringify(value));
      expect(value > 0).assertTrue();
      done();
    });
  })
}