/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import worker from '@ohos.worker';


function promiseCase() {
  let p = new Promise(function (resolve, reject) {
      setTimeout(function () {
          resolve(0)
      }, 100)
  }).then(undefined, (error) => {
  })
  return p
}

export default function nativeApiStringJsunit() {

  describe('napiStringTest', function () {
    const empty = 'hh';
    let value;
    let obj;

    async function sleep(time) {
      return new Promise((resolve, reject) => {
        setTimeout(() => {
          resolve("ok")
        }, time)
      }).then(() => {
        console.info( `sleep ${time} over...`)
      })
    }

    /**
    * run after testcase
    */
    afterEach(async function () {
      console.info('[napiStringTest] after each called')
      value == '';
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0001
     * @tc.name      napiStringTest001
     * @tc.desc      aceNapiEtsTest
     */
    it('napiStringTest001', 0, async function (done) {
      console.info('napiStringTest001 START');
      value = napitest.TestLatin1(empty)
      console.info('napiStringTest001 testString result is: ' + value);
      expect(value).assertEqual(empty)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0002
     * @tc.name      napCreateArrayBuffer002
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateArrayBuffer002', 0, async function (done) {
      console.info('napiCreateArrayBuffer002 START');
      value = napitest.napCreateArrayBuffer();
      console.info('napiCreateArrayBuffer testString result is: ' + JSON.stringify(value));
      expect(value instanceof ArrayBuffer).assertTrue();
      done();
    });

     /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0003
     * @tc.name      naiGetArrayBufferInfo003
     * @tc.desc      aceNapiEtsTest
     */
    it('napiGetArrayBufferInfo003', 0, async function (done) {
      console.info('napiGetArrayBufferInfo003 START');
      value = napitest.naiGetArrayBufferInfo();
      console.info('napiGetArrayBufferInfo testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(1024);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0004
     * @tc.name      napiCreateFunction004
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateFunction004', 0, async function (done) {
      console.info('napiCreateFunction004 START');
      let func = napitest.napiCreateFunction();
      value = func();
      console.info('napiCreateFunction testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(666);
      done();
    });

     /**
      * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0005
      * @tc.name      napiDefineClass005
      * @tc.desc      aceNapiEtsTest
      */

    it('napiDefineClass005', 0, async function (done) {
      console.info('napiDefineClass005 START');
      value = napitest.napiDefineClass();
      console.info('napiDefineClass testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0006
     * @tc.name      napiCancelAsyncWork006
     * @tc.desc      aceNapiEtsTest
    */
    it('napiCancelAsyncWork006', 0, async function (done) {
       console.info('napiCancelAsyncWork006 START');
       value = napitest.napiCancelAsyncWork();
       console.info('napiCancelAsyncWork testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0007
     * @tc.name      napiRunScriptPath007
     * @tc.desc      aceNapiEtsTest
     */
     it('napiRunScriptPath007', 0, async function (done) {
       console.info('napiRunScriptPath START');
       value = napitest.napiRunScriptPath();
       console.info('napiRunScriptPath testString result is: ' + JSON.stringify(value));
       expect(value).assertEqual(0)
       done();
     });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0008
     * @tc.name      napiCallThreadsafeFunction008
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCallThreadsafeFunction008', 0, async function (done) {
      console.info('napiCallThreadsafeFunction START');
      value = napitest.napiCallThreadsafeFunction();
      console.info('napiCallThreadsafeFunction testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0009
     * @tc.name      napiCreateThreadsafeFunction009
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateThreadsafeFunction009', 0, async function (done) {
      console.info('napiCreateThreadsafeFunction START');
      value = napitest.napiCreateThreadsafeFunction();
      console.info('napiCreateThreadsafeFunction testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0010
     * @tc.name      napiRefthreadSafeFunction010
     * @tc.desc      aceNapiEtsTest
     */
    it('napiRefthreadSafeFunction010', 0, async function (done) {
      console.info('napiRefthreadSafeFunction START');
      value = napitest.napiRefthreadSafeFunction();
      console.info('napiRefthreadSafeFunction testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0011
     * @tc.name      napiCreateDate011
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateDate011', 0, async function (done) {
      console.info('napiCreateDate START');
      value = napitest.napiCreateDate();
      console.info('napiCreateDate testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(1)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0012
     * @tc.name      napiCreateBigintUint64012
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateBigintUint64012', 0, async function (done) {
      console.info('napiCreateBigintUint64 START');
      value = napitest.napiCreateBigintUint64();
      console.info('napiCreateBigintUint64 testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(1)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0013
     * @tc.name      napiCreateBigintInt64013
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateBigintInt64013', 0, async function (done) {
      console.info('napiCreateBigintInt64 START');
      value = napitest.napiCreateBigintInt64();
      console.info('napiCreateBigintInt64 testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(1)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0014
     * @tc.name      napiCreateBigintWords014
     * @tc.desc      aceNapiEtsTest
     */
    it('napiCreateBigintWords014', 0, async function (done) {
      console.info('napiCreateBigintWords START');
      value = napitest.napiCreateBigintWords();
      console.info('napiCreateBigintWords testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(1)
      done();
    });

     /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0015
     * @tc.name      napiGetCbInfo015
     * @tc.desc      aceNapiEtsTest
     */
    it('napiGetCbInfo015', 0, async function (done) {
      console.info('napiGetCbInfo015 START');
      value = napitest.napiGetCbInfo(12.06);
      console.info('napiGetCbInfo015 testString result is: ' + JSON.stringify(value));
      expect(value == 12.06).assertTrue
      done();
    });

   /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0016
    * @tc.name      aceNapiTest016
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest016', 0, async function (done) {
      console.info('aceNapiTest016 START');
      value = napitest.referenceRefAndUnref();
      console.info('aceNapiTest016 testString result is: ' + value + "---" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0017
    * @tc.name      napicreateSymbol017
    * @tc.desc      aceNapiEtsTest
    */
    it('napicreateSymbol017', 0, async function (done) {
      console.info('napicreateSymbol017 START');
      let value = napitest.createSymbol('symbol');
      console.info('napicreateSymbol017 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

   /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0018
    * @tc.name      napicreateAndGetInt018
    * @tc.desc      aceNapiEtsTest
    */
    it('napicreateAndGetInt018', 0, async function (done) {
      console.info('napicreateAndGetInt018 START');
      let value = napitest.createAndGetInt64(6);
      console.info('napicreateAndGetInt018 testString result is: '+ value + "---" + JSON.stringify(value));
      expect(value).assertEqual(6);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0019
    * @tc.name      aceNapiTest019
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest019', 0, async function (done) {
      console.info('aceNapiTest019 START');
      value = napitest.getTypedArrayInfo();
      console.info('aceNapiTest019 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0020
    * @tc.name      napigetDataView020
    * @tc.desc      aceNapiEtsTest
    */
    it('napigetDataView020', 0, async function (done) {
      console.info('napigetDataView020 START');
      var buffer = new ArrayBuffer(2);
      let dView = new DataView(buffer).setInt16(0, 256, true);
      let value = napitest.getDataViewInfo(dView);
      console.info('napigetDataView020 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0021
    * @tc.name      aceNapiTest021
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest021', 0, async function (done) {
      console.info('aceNapiTest021 START');
      let value = napitest.openAndCloseHandleScope();
      console.info('aceNapiTest021 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value == undefined).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0022
    * @tc.name      aceNapiTest022
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest022', 0, async function (done) {
      console.info('aceNapiTest022 START');
      value = napitest.openAndCloseEscapableHandleScope();
      console.info('aceNapiTest022 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0023
    * @tc.name      aceNapiTest023
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest023', 0, async function (done) {
      console.info('aceNapiTest023 START');
      let value = napitest.createReference();
      console.info('aceNapiTest023 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0024
    * @tc.name      aceNapiTest024
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest024', 0, async function (done) {
      console.info('aceNapiTest024 START');
      var array = [1,2];
      let value = napitest.createArrayAndGetLength(array);
      console.info('aceNapiTest024 testString result is: ' + value + "--" + JSON.stringify(value));
      let obj = JSON.stringify(value);
      expect(obj).assertEqual('[1,2]');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0025
    * @tc.name      aceNapiTest025
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest025', 0, async function (done) {
      console.info('aceNapiTest025 START');
      let value = napitest.getArrayWithLength([1,2]);
      console.info('aceNapiTest025 testString result is: ' + value + "--" + JSON.stringify(value));
      obj = JSON.stringify(value);
      expect(obj).assertEqual('[0,1,2,3]');
      done();
    });


    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0026
    * @tc.name      aceNapiTest026
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest026', 0, async function (done) {
      console.info('aceNapiTest026 START');
      let value = napitest.createExternal();
      console.info('aceNapiTest026 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0027
    * @tc.name      aceNapiTest027
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest027', 0, async function (done) {
      console.info('aceNapiTest027 START');
      let value = napitest.createExternalArraybuffer();
      console.info('aceNapiTest027 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof ArrayBuffer).assertTrue();
      let view = new Int32Array(value);      
      expect(view[0]).assertEqual(666);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0028
    * @tc.name      aceNapiTest028
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest028', 0, async function (done) {
      console.info('aceNapiTest028 START');
      value = napitest.createObject();
      console.info('aceNapiTest028 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0029
    * @tc.name      aceNapiTest029
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest029', 0, async function (done) {
      console.info('aceNapiTest029 START');
      let value = napitest.createSymbol("teststr");
      console.info('aceNapiTest029 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0030
    * @tc.name      aceNapiTest030
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest030', 0, async function (done) {
      console.info('aceNapiTest030 START');
      let value = napitest.createTypeArray();
      console.info('aceNapiTest030 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Int32Array).assertTrue();
      expect(value.length).assertEqual(4);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0031
    * @tc.name      aceNapiTest031
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest031', 0, async function (done) {
      console.info('aceNapiTest031 START');
      let value = napitest.createDataView();
      console.info('aceNapiTest031 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof DataView).assertTrue();
      value.setInt16(1, 42);
      expect(value.getInt16(1)).assertEqual(42);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0032
    * @tc.name      aceNapiTest032
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest032', 0, async function (done) {
      console.info('aceNapiTest032 START');
      let value = napitest.createAndGetInt32(32);
      console.info('aceNapiTest032 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(32);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0033
    * @tc.name      aceNapiTest033
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest033', 0, async function (done) {
      console.info('aceNapiTest033 START');
      let value = napitest.createAndGetUInt32(12);
      console.info('aceNapiTest033 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(12);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0034
    * @tc.name      aceNapiTest034
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest034', 0, async function (done) {
      console.info('aceNapiTest034 START');
      let value = napitest.createAndGetInt64(23);
      console.info('aceNapiTest034 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(23);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0035
    * @tc.name      aceNapiTest035
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest035', 0, async function (done) {
      console.info('aceNapiTest035 START');
      let value = napitest.createDouble(24.67);
      console.info('aceNapiTest035 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(24.67);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0036
    * @tc.name      aceNapiTest036
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest036', 0, async function (done) {
      console.info('aceNapiTest036 START');
      let value = napitest.createAndGetStringLatin1("tst");
      console.info('aceNapiTest036 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual("tst");
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0037
    * @tc.name      aceNapiTest037
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest037', 0, async function (done) {
      console.info('aceNapiTest037 START');
      let value = napitest.createAndGetStringUtf8('he');
      console.info('aceNapiTest037 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('he');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0038
    * @tc.name      aceNapiTest038
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest038', 0, async function (done) {
      console.info('aceNapiTest038 START');
      value = napitest.getPrototype();
      console.info('aceNapiTest038 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      function testFunc() {
          this.a = 0
      }
      value = napitest.getPrototype2(testFunc);
      console.info('aceNapiTest038 testString result is: ' + value + "--" + JSON.stringify(value));
      console.info('aceNapiTest038 testString Object.getPrototypeOf(testObj) is: ' + Object.getPrototypeOf(testFunc) + "--" + JSON.stringify(Object.getPrototypeOf(testFunc)));
      expect(value === Object.getPrototypeOf(testFunc)).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0039
    * @tc.name      aceNapiTest039
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest039', 0, async function (done) {
      console.info('aceNapiTest039 START');
      let value = napitest.getValueBool(false);
      console.info('aceNapiTest039 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertFalse();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0040
    * @tc.name      aceNapiTest040
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest040', 0, async function (done) {
      console.info('aceNapiTest040 START');
      value = napitest.getValueDouble(24.5);
      console.info('aceNapiTest040 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value === 24.5).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0041
    * @tc.name      aceNapiTest041
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest041', 0, async function (done) {
      console.info('aceNapiTest041 START');
      let value = napitest.getValueExternal();
      console.info('aceNapiTest041 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0042
    * @tc.name      aceNapiTest042
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest042', 0, async function (done) {
      console.info('aceNapiTest042 START');
      let value = napitest.getNull();
      console.info('aceNapiTest042 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0043
    * @tc.name      aceNapiTest043
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest043', 0, async function (done) {
      console.info('aceNapiTest043 START');
      let value = napitest.getUndefined();
      console.info('aceNapiTest043 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_00044
    * @tc.name      aceNapiTest044
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest044', 0, async function (done) {
      console.info('aceNapiTest044 START');
      value = napitest.coerceToBool(0);
      console.info('aceNapiTest044 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertFalse();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0045
    * @tc.name      aceNapiTest045
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest045', 0, async function (done) {
      console.info('aceNapiTest045 START');
      value = napitest.coerceToNumber('12');
      console.info('aceNapiTest045 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(12);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0046
    * @tc.name      aceNapiTest046
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest046', 0, async function (done) {
      console.info('aceNapiTest046 START');
      let value = napitest.coerceToObject([2,3]);
      console.info('aceNapiTest046 testString result is: ' + value + "--" + JSON.stringify(value));
      let obj = JSON.stringify(value);
      expect(obj).assertEqual('[2,3]');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0047
    * @tc.name      aceNapiTest047
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest047', 0, async function (done) {
      console.info('aceNapiTest047 START');
      let number = 123;
      value = napitest.coerceToString(number);
      console.info('aceNapiTest047 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(number.toString());
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0048
    * @tc.name      aceNapiTest048
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest048', 0, async function (done) {
      console.info('aceNapiTest048 START');
      let value = napitest.instanceOf();
      console.info('aceNapiTest048 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0049
    * @tc.name      aceNapiTest049
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest049', 0, async function (done) {
      console.info('aceNapiTest049 START');
      let value = napitest.isArray();
      console.info('aceNapiTest049 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

   /* @tc.number    SUB_ACE_BASIC_ETS_NAPI_0050
    * @tc.name      aceNapiTest050
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest050', 0, async function (done) {
      console.info('aceNapiTest050 START');
      const date1 = new Date('December 17, 1995 03:24:00');
      value = napitest.isDate(date1);
      console.info('aceNapiTest050 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0051
    * @tc.name      aceNapiTest051
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest051', 0, async function (done) {
      console.info('aceNapiTest051 START');
      let value = napitest.strictEquals();
      console.info('aceNapiTest051 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0052
    * @tc.name      aceNapiTest052
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest052', 0, async function (done) {
      console.info('aceNapiTest052 START');
      let value = napitest.getPropertyNames();
      console.info('aceNapiTest052 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0053
    * @tc.name      aceNapiTest053
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest053', 0, async function (done) {
      console.info('aceNapiTest053 START');
      let value = napitest.setProperty();
      console.info('aceNapiTest053 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0054
    * @tc.name      aceNapiTest054
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest054', 0, async function (done) {
      console.info('aceNapiTest054 START');
      let value = napitest.getProperty();
      console.info('aceNapiTest054 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0055
    * @tc.name      aceNapiTest055
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest055', 0, async function (done) {
      console.info('aceNapiTest055 START');
      let value = napitest.hasProperty();
      console.info('aceNapiTest055 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0056
    * @tc.name      aceNapiTest056
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest056', 0, async function (done) {
      console.info('aceNapiTest056 START');
      let testObj = {
          'a':1,
          'b':2
      }
      value = napitest.setAndDeleteProperty(testObj, 'a');
      console.info('aceNapiTest056 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value === 0).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0057
    * @tc.name      aceNapiTest057
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest057', 0, async function (done) {
      console.info('aceNapiTest057 START');
      let testObj = {
        'a':1,
        'b':2
      }
      value = napitest.hasOwnProperty(testObj, 'a');
      console.info('aceNapiTest057 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0058
    * @tc.name      aceNapiTest058
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest058', 0, async function (done) {
      console.info('aceNapiTest058 START');
      let value = napitest.setNamedProperty([1,2], "e", false);
      console.info('aceNapiTest058 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0059
    * @tc.name      aceNapiTest059
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest059', 0, async function (done) {
      console.info('aceNapiTest059 START');
      let obj = {
                 foo: "bar",
                 age: 42,
                 baz: { myProp: 12 },
                };
      let value = napitest.getNamedProperty(obj, "foo");
      console.info('aceNapiTest059 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('bar');
      done();
    });

     /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0060
    * @tc.name      aceNapiTest060
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest060', 0, async function (done) {
      console.info('aceNapiTest060 START');
      let obj = {
                 foo: "bar",
                 age: 42,
                 baz: { myProp: 12 },
                };
      let value = napitest.hasNamedProperty(obj, "foo");
      console.info('aceNapiTest060 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0061
    * @tc.name      aceNapiTest061
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest061', 0, async function (done) {
      console.info('aceNapiTest061 START');
      let value = napitest.setElement();
      console.info('aceNapiTest061 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0062
    * @tc.name      aceNapiTest062
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest062', 0, async function (done) {
      console.info('aceNapiTest062 START');
      let value = napitest.getElement();
      console.info('aceNapiTest062 testString result is: ' + value + "--" + JSON.stringify(value));
      let fi = value.envIsNull;
      expect(value instanceof Object).assertTrue(); 
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0063
    * @tc.name      aceNapiTest063
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest063', 0, async function (done) {
      console.info('aceNapiTest063 START');
      let value = napitest.hasElement();
      console.info('aceNapiTest063 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue(); 
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0064
    * @tc.name      aceNapiTest064
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest064', 0, async function (done) {
      console.info('aceNapiTest064 START');
      let value = napitest.deleteElement();
      console.info('aceNapiTest064 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue(); 
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0065
    * @tc.name      aceNapiTest065
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest065', 0, async function (done) {
      console.info('aceNapiTest065 START');
      let value = napitest.defineProperties();
      console.info('aceNapiTest065 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof Object).assertTrue(); 
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0066
    * @tc.name      aceNapiTest066
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest066', 0, async function (done) {
      console.info('aceNapiTest066 START');
      let value = napitest.wrap();
      console.info('aceNapiTest066 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0067
    * @tc.name      aceNapiTest067
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest067', 0, async function (done) {
      console.info('aceNapiTest067 START');
      let value = napitest.unwrap();
      console.info('aceNapiTest067 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0068
    * @tc.name      aceNapiTest068
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest068', 0, async function (done) {
      console.info('aceNapiTest068 START');
      let value = napitest.removeWrap();
      console.info('aceNapiTest068 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0069
    * @tc.name      aceNapiTest069
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest069', 0, async function (done) {
      console.info('aceNapiTest069 START');
      let value = napitest.getVersion();
      console.info('aceNapiTest069 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(8);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0070
    * @tc.name      aceNapiTest070
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest070', 0, async function (done) {
      console.info('aceNapiTest070 START');
      let value = napitest.createPromise();
      console.info('aceNapiTest070 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0071
    * @tc.name      aceNapiTest071
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest071', 0, async function (done) {
      console.info('aceNapiTest071 START');
      let value = napitest.resolveAndRejectDeferred();
      console.info('aceNapiTest071 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });


    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0072
    * @tc.name      aceNapiTest072
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest072', 0, async function (done) {
      console.info('aceNapiTest072 START');
      let value = napitest.isPromise();
      console.info('aceNapiTest072 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });


    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0073
    * @tc.name      aceNapiTest073
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest073', 0, async function (done) {
      console.info('aceNapiTest073 START');
      let value = napitest.runScript("25");
      console.info('aceNapiTest073 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value == undefined).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0074
     * @tc.name      aceNapiTest074
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest074', 0, async function (done) {
      console.info('aceNapiTest074 START');
      function testFunc() {
          return 666;
      }
      value = napitest.callFunction(testFunc);
      console.info('aceNapiTest074 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value === 666).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0075
     * @tc.name      aceNapiTest075
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest075', 0, async function (done) {
      console.info('aceNapiTest075 START');
      value = napitest.getUvEventLoop();
      console.info('aceNapiTest075 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value === undefined).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0076
     * @tc.name      aceNapiTest076
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest076', 0, async function (done) {
      console.info('aceNapiTest076 START');
      let myClass = new napitest.myClass();
      value = myClass.sayHello();
      console.info('aceNapiTest076 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value === 666).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0077
     * @tc.name      aceNapiTest077
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest077', 0, async function (done) {
      console.info('aceNapiTest077 START');
      value = napitest.getGlobal();
      console.info('aceNapiTest077 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value === undefined).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0078
     * @tc.name      aceNapiTest078
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest078', 0, async function (done) {
      console.info('aceNapiTest078 START');
      value = napitest.testAsyncWork(1000, (input) => {
          console.info('testAsyncWork ' + (input * 2));
          return input * 2;
      });
      console.info('aceNapiTest078 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value === 0).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0079
     * @tc.name      aceNapiTest079
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest079', 0, async function (done) {
      console.info('aceNapiTest079 START');
      value = napitest.testPromise(1).then(
          (result)=>{
            console.info('aceNapiTest079 testString resolve1 result is: ' + result + "--" + JSON.stringify(result));
            expect(result > 0).assertTrue();
            done();
          }, (result) =>{
            console.info('aceNapiTest079 testString reject1 result is: ' + result + "--" + JSON.stringify(result));
            expect(result < 0).assertTrue();
            done();
          }
      );
      value = napitest.testPromise(-1).then(
        (result)=>{
          console.info('aceNapiTest079 testString resolve2 result is: ' + result + "--" + JSON.stringify(result));
          expect(result > 0).assertTrue();
          done();
        }, (result) =>{
          console.info('aceNapiTest079 testString reject2 result is: ' + result + "--" + JSON.stringify(result));
          expect(result < 0).assertTrue();
          done();
        }
      );
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0080
     * @tc.name      aceNapiTest080
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest080', 0, async function (done) {
      console.info('aceNapiTest080 START');
      value = napitest.ThreadSafeTest(() => {
          return 666;
      });
      expect(value === 1).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0081
    * @tc.name      aceNapiTest081
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest081', 0, async function (done) {
      console.info('aceNapiTest081 START');
      try {
        napitest.getAndClearLastException();
        console.info('aceNapiTest081 testString result is: ' + value + "--" + JSON.stringify(value));
      } catch (err) {
          console.info('aceNapiTest081 testString result is err: ' + err + "--" + JSON.stringify(err));
          let er = JSON.stringify(err)
          expect(er === '{"code":"600"}').assertTrue();
      }
      done();
    });

     /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0082
    * @tc.name      aceNapiTest082
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest082', 0, async function (done) {
      console.info('aceNapiTest082 START');
      let value = napitest.getLastErrorInfo();
      console.info('aceNapiTest082 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(6);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0083
    * @tc.name      aceNapiTest083
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest083', 0, async function (done) {
      console.info('aceNapiTest083 START');
      let value = napitest.cleanUpErrorInfo();
      console.info('aceNapiTest083 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0084
    * @tc.name      aceNapiTest084
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest084', 0, async function (done) {
      console.info('aceNapiTest084 START');
      try {
         let value = napitest.throwExistingError();
         console.info('aceNapiTest084 testString result is: ' + value + "--" + JSON.stringify(value));
         expect(value).assertEqual(0);
         done();
      } catch (err) {
        console.info('aceNapiTest084 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er).assertEqual('{"code":"600"}');
        done(); 
      }     
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0085
    * @tc.name      aceNapiTest085
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest085', 0, async function (done) {
      console.info('aceNapiTest085 START');
      try {
         let value = napitest.throwError();
         console.info('aceNapiTest085 testString result is: ' + value + "--" + JSON.stringify(value));
         expect(value).assertEqual(0);
         done();
      } catch (err) {
        console.info('aceNapiTest085 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er).assertEqual('{"code":"500"}');
        done(); 
      }     
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0086
    * @tc.name      aceNapiTest086
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest086', 0, async function (done) {
      console.info('aceNapiTest086 START');
      try {
        let value = napitest.throwTypeError();
        console.info('aceNapiTest086 testString result is: ' + value + "--" + JSON.stringify(value));
        expect(value).assertEqual(0);
        done();
      } catch (err) {
        console.info('aceNapiTest086 testString result is err: ' + err + "--" + JSON.stringify(err));
        expect(err instanceof TypeError).assertTrue();
        done(); 
      }     
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0087
    * @tc.name      aceNapiTest087
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest087', 0, async function (done) {
      console.info('aceNapiTest087 START');
      try {
        let value = napitest.throwRangeError();
        console.info('aceNapiTest087 testString result is: ' + value + "--" + JSON.stringify(value));
        expect(value).assertEqual(0);
        done();
      } catch (err) {
        console.info('aceNapiTest087 testString result is err: ' + err + "--" + JSON.stringify(err));
        expect(err instanceof RangeError).assertTrue();
        done(); 
      }     
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0088
    * @tc.name      aceNapiTest088
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest088', 0, async function (done) {
      console.info('aceNapiTest088 START');
      let value = napitest.isError(false);
      console.info('aceNapiTest088 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertFalse();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0089
    * @tc.name      aceNapiTest089
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest089', 0, async function (done) {
      console.info('aceNapiTest089 START');
      let value = napitest.createError();
      console.info('aceNapiTest089 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });


     /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0090
     * @tc.name      aceNapiTest090
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest090', 0, async function (done) {
      console.info('aceNapiTest090 START');
      let value = napitest.createTypeError();
      console.info('aceNapiTest090 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0091
    * @tc.name      aceNapiTest091
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest091', 0, async function (done) {
      console.info('aceNapiTest091 START');
      let value = napitest.createRangeError();
      console.info('aceNapiTest091 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0092
    * @tc.name      aceNapiTest092
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest092', 0, async function (done) {
      console.info('aceNapiTest092 START');
      let value = napitest.isExceptionPending();
      console.info('aceNapiTest092 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0093
    * @tc.name      aceNapiTest093
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest093', 0, async function (done) {
      console.info('aceNapiTest093 START');
      let value = napitest.createAndGetStringUtf16('he');
      console.info('aceNapiTest093 testString result is: ' + value + "--" + JSON.stringify(value));
      let value1 = napitest.stringUtf16OfCase('abc2r42');
      console.info('aceNapiTest093 testString result is: ' + value1 + "--" + JSON.stringify(value1));
      expect(value).assertEqual('he');
      expect(value1).assertEqual('abc2');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0094
    * @tc.name      aceNapiTest094
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest094', 0, async function (done) {
      console.info('aceNapiTest094 START');
      let valueeEmpty = napitest.createAndGetStringUtf16(' ');
      console.info('aceNapiTest094 testString result is: ' + valueeEmpty + "--" + JSON.stringify(valueeEmpty));
      let value = napitest.createAndGetStringUtf16('中文');
      console.info('aceNapiTest094 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(valueeEmpty).assertEqual(' ');
      expect(value).assertEqual('中文');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0095
    * @tc.name      aceNapiTest095
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest095', 0, async function (done) {
      console.info('aceNapiTest095 START');
      let obj1 = napitest.typeTaggedInstance(0);
      let obj2 = napitest.typeTaggedInstance(1);
      let obj3 = napitest.typeTaggedInstance(2);
      let obj4 = napitest.typeTaggedInstance(3);
      let isTag = napitest.checkTypeTag(0, obj1);
      let isTag1 = napitest.checkTypeTag(1, obj2);
      let isTag2 = napitest.checkTypeTag(2, obj3);
      let isTag3 = napitest.checkTypeTag(3, obj4);
      console.info('aceNapiTest095 testTypeTag result is: ' + isTag + "--" + JSON.stringify(isTag));
      expect(isTag).assertTrue();
      console.info('aceNapiTest095 testTypeTag result is: ' + isTag1 + "--" + JSON.stringify(isTag1));
      expect(isTag1).assertTrue();
      console.info('aceNapiTest095 testTypeTag result is: ' + isTag2 + "--" + JSON.stringify(isTag2));
      expect(isTag2).assertTrue();
      console.info('aceNapiTest095 testTypeTag result is: ' + isTag3 + "--" + JSON.stringify(isTag3));
      expect(isTag3).assertTrue();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0096
    * @tc.name      aceNapiTest096
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest096', 0, async function (done) {
      console.info('aceNapiTest096 START');
      let obj1 = napitest.typeTaggedInstance(0);
      let obj2 = napitest.typeTaggedInstance(1);
      let obj3 = napitest.typeTaggedInstance(2);
      let obj4 = napitest.typeTaggedInstance(3);
      let isTag = napitest.checkTypeTag(1, obj1);
      let isTag1 = napitest.checkTypeTag(0, obj2);
      let isTag2 = napitest.checkTypeTag(1, obj4);
      let isTag3 = napitest.checkTypeTag(3, obj3);
      let isTag4 = napitest.checkTypeTag(4, obj3);
      console.info('aceNapiTest096 testTypeTag result is: ' + isTag + "--" + JSON.stringify(isTag));
      expect(isTag).assertFalse();
      console.info('aceNapiTest096 testTypeTag result is: ' + isTag1 + "--" + JSON.stringify(isTag1));
      expect(isTag1).assertFalse();
      console.info('aceNapiTest096 testTypeTag result is: ' + isTag2 + "--" + JSON.stringify(isTag2));
      expect(isTag2).assertFalse();
      console.info('aceNapiTest096 testTypeTag result is: ' + isTag3 + "--" + JSON.stringify(isTag3));
      expect(isTag3).assertFalse();
      console.info('aceNapiTest096 testTypeTag result is: ' + isTag4 + "--" + JSON.stringify(isTag4));
      expect(isTag4).assertFalse();
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0097
    * @tc.name      aceNapiTest097
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest097', 0, async function (done) {
      console.info('aceNapiTest097 START');
      value = napitest.coerceToString('String Test');
      console.info('aceNapiTest097 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('String Test');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0098
    * @tc.name      aceNapiTest098
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest098', 0, async function (done) {
      console.info('aceNapiTest098 START');
      value = napitest.coerceToString(false);
      console.info('aceNapiTest098 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('false');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0099
    * @tc.name      aceNapiTest099
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest099', 0, async function (done) {
      console.info('aceNapiTest099 START');
      value = napitest.coerceToString(undefined);
      console.info('aceNapiTest099 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('undefined');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0100
    * @tc.name      aceNapiTest100
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest100', 0, async function (done) {
      console.info('aceNapiTest100 START');
      value = napitest.coerceToString(null);
      console.info('aceNapiTest100 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('null');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0101
    * @tc.name      aceNapiTest101
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest101', 0, async function (done) {
      console.info('aceNapiTest101 START');
      value = napitest.coerceToString(true);
      console.info('aceNapiTest101 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('true');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0102
    * @tc.name      aceNapiTest102
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest102', 0, async function (done) {
      console.info('aceNapiTest102 START');
      let bigintNum = napitest.napiCreateBigintInt64();
      value = napitest.coerceToString(bigintNum);
      console.info('aceNapiTest102 testString result is: ' + JSON.stringify(bigintNum));
      console.info('aceNapiTest102 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(bigintNum.toString());
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0103
    * @tc.name      aceNapiTest103
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest103', 0, async function (done) {
      console.info('aceNapiTest103 START');
      const arr = [1, 2, 3];
      value = napitest.coerceToString(arr);
      console.info('aceNapiTest103 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(arr.toString());
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0104
    * @tc.name      aceNapiTest104
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest104', 0, async function (done) {
      console.info('aceNapiTest104 START');
      let value = napitest.stringUtf16OfLengthLeZero('string utf16 test');
      console.info('aceNapiTest104 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('string utf16 test');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0105
    * @tc.name      aceNapiTest105
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest105', 0, async function (done) {
      console.info('aceNapiTest105 START');
      let copied = napitest.stringUtf16OfLengthEqOne('string utf16 test1');
      console.info('aceNapiTest105 testString result is: ' + copied + "--" + JSON.stringify(copied));
      expect(copied).assertEqual(0);
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0106
    * @tc.name      aceNapiTest106
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest106', 0, async function (done) {
      console.info('aceNapiTest106 START');
      let value = napitest.stringUtf8OfLengthLeZero('string utf8 test');
      console.info('aceNapiTest106 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('string utf8 test');
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0107
    * @tc.name      aceNapiTest107
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest107', 0, async function (done) {
      console.info('aceNapiTest107 START');
      function InputString() {
        const boolInput = true;
        napitest.TestUtf8(boolInput);
      }
      expect(InputString).assertThrowError(
        "assertion (valuetype == napi_string) failed: Wrong type of argment. Expects a string.");
      done();
    });

    /**
    * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0108
    * @tc.name      aceNapiTest108
    * @tc.desc      aceNapiEtsTest
    */
    it('aceNapiTest108', 0, async function (done) {
      console.info('aceNapiTest108 START');
      function InputString() {
        const numberInput = 123;
        napitest.TestUtf16(numberInput);
      }
      expect(InputString).assertThrowError(
        "assertion (valuetype == napi_string) failed: Wrong type of argment. Expects a string.");
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0109
     * @tc.name      aceNapiTest109
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest109', 0, async function (done) {
      console.info('aceNapiTest109 START');
      function InputString() {
        const numberInput = 123;
        napitest.TestLatin1(numberInput);
      }
      expect(InputString).assertThrowError(
        "assertion (valuetype == napi_string) failed: Wrong type of argment. Expects a string.");
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0110
     * @tc.name      aceNapiTest110
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest110', 0, async function (done) {
      console.info('aceNapiTest110 START');
      let func = napitest.NapiCreateFunctionTwo();
      value = func();
      console.info('aceNapiTest111 testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(666);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0111
     * @tc.name      aceNapiTest111
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest111', 0, async function (done) {
      console.info('aceNapiTest111 START');
      function testFunc() {
        napitest.NewTargetTest();
      }
      expect(testFunc).assertThrowError("InstanceOf error when type of target is not Object");
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0112
     * @tc.name      aceNapiTest112
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest112', 0, async function (done) {
      console.info('aceNapiTest112 START');
      function testFunc() {
        throw new Error('error');
      }
      function testCall() {
        napitest.callFunction(testFunc);
      }
      expect(testCall).assertThrowError("error");
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0113
     * @tc.name      aceNapiTest113
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest113', 0, async function (done) {
      console.info('aceNapiTest113 START');
      function testFunc() {
        return 'hello';
      }
      value = napitest.callFunction(testFunc);
      console.info('aceNapiTest114 testString result is: ' + JSON.stringify(value));
      expect(value.toString() === 'hello').assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0114
     * @tc.name      napiLoadModule0114
     * @tc.desc      aceNapiEtsTest
     */
    it('napiLoadModule0114', 0, async function (done) {
      console.info('napiLoadModule START');
      value = napitest.napiLoadModule();
      console.info('napiLoadModule testString result is: ' + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0115
     * @tc.name      aceNapiTest0115
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0115', 0, async function (done) {
      console.info('aceNapiTest0115 START');
      value = napitest.asyncWorkWithQos(1000, (input) => {
        console.info('asyncWorkWithQos ' + (input * 2));
        return input * 2;
      });
      console.info('aceNapiTest0115 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value === 0).assertTrue();
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0116
     * @tc.name      aceNapiTest0116
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0116', 0, async function (done) {
      console.info('aceNapiTest0116 START');
      value = napitest.coerceToNativeBindingObject();
      console.info('aceNapiTest0116 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(2000);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0117
     * @tc.name      aceNapiTest0117
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0117', 0, async function (done) {
      console.info('aceNapiTest0117 START');
      value = napitest.createObjectWithProperties();
      console.info('aceNapiTest0117 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0118
     * @tc.name      aceNapiTest0118
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0118', 0, async function (done) {
      console.info('aceNapiTest0118 START');
      value = napitest.createObjectWithNamedProperties();
      console.info('aceNapiTest0118 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0119
     * @tc.name      aceNapiTest0119
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0119', 0, async function (done) {
      console.info('aceNapiTest0119 START');
      const hook_result = {
        id: null,
        resource: null,
        init_called: false,
        destroy_called: false,
      };
      const resourceWrap = napitest.createAsyncResource(
        /**
         * set resource to NULL to generate a managed resource object
         */
        undefined,
      );
      expect(hook_result.destroy_called).assertFalse();
      const recv = {};
      napitest.makeCallback(resourceWrap, recv, function callback() {
        expect(hook_result.destroy_called).assertFalse();
        expect(this).assertEqual(recv);
      });
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0120
     * @tc.name      aceNapiTest0120
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0120', 0, async function (done) {
      console.info('aceNapiTest0120 START');
      function myMultiArgFunc(arg1, arg2, arg3) {
        expect(arg1).assertEqual(1);
        expect(arg2).assertEqual(2);
        expect(arg3).assertEqual(3);
        return 42;
      }
      const resource = {};
      let process = {};
      expect(napitest.makeCallbackOne(resource, process, function() {
        expect(arguments.length).assertEqual(0);
        expect(this).assertEqual(process);
        return 42;
      })).assertEqual(42);
      expect(napitest.makeCallbackOne(resource, process, function(x) {
        expect(arguments.length).assertEqual(1);
        expect(this).assertEqual(process);
        expect(x).assertEqual(1337);
        return 42;
      }, 1337)).assertEqual(42);
      let obj = {};
      expect(napitest.makeCallbackOne(resource, obj, myMultiArgFunc, 1, 2, 3)).assertEqual(42);
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0121
     * @tc.name      aceNapiTest0121
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0121', 0, async function (done) {
    console.info('aceNapiTest0121 START');
      value = napitest.runEventLoop(0)
      console.info('aceNapiTest0121 testString result is: ' + value);
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0121
     * @tc.name      aceNapiTest0122
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0122', 0, async function (done) {
    console.info('aceNapiTest0122 START');
      value = napitest.runEventLoop(1)
      console.info('aceNapiTest0122 testString result is: ' + value);
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_NAPI_0123
     * @tc.name      aceNapiTest0123
     * @tc.desc      aceNapiEtsTest
     */
    it('aceNapiTest0123', 0, async function (done) {
    console.info('aceNapiTest0123 START');
      value = napitest.stopEventLoop(0)
      console.info('aceNapiTest0123 testString result is: ' + value);
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0124
     * @tc.name aceNapiTest0124
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0124', 0, async (done: Function) => {
      console.info('aceNapiTest0124 START');
      value = napitest.napiSerialize();
      console.info('aceNapiTest0124 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(2000);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0125
     * @tc.name aceNapiTest0125
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0125', 0, async (done: Function) => {
      console.info('aceNapiTest0125 START');
      value = napitest.napiDeSerialize();
      console.info('aceNapiTest0125 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(2000);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0126
     * @tc.name aceNapiTest0126
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0126', 0, async (done: Function) => {
      console.info('aceNapiTest0126 START');
      value = napitest.napiDeleteSerializationData();
      console.info('aceNapiTest0126 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(2000);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0127
     * @tc.name aceNapiTest0127
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0127', 0, async (done: Function) => {
      console.info('aceNapiTest0127 START');
      value = napitest.napiSerializeDate();
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0128
     * @tc.name aceNapiTest0128
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0128', 0, async (done: Function) => {
      console.info('aceNapiTest0128 START');
      value = napitest.napiSerializeString();
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0129
     * @tc.name aceNapiTest0129
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0129', 0, async (done: Function) => {
      console.info('aceNapiTest0129 START');
      value = napitest.napiSerializeArray();
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0130
     * @tc.name aceNapiTest0130
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0130', 0, async (done: Function) => {
      console.info('aceNapiTest0130 START');
      value = napitest.napiSerializeObject();
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0131
     * @tc.name aceNapiTest0131
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0131', 0, async (done: Function) => {
      console.info('aceNapiTest0131 START');
      value = napitest.napiSerializeArraybuffer();
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0132
     * @tc.name aceNapiTest0132
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0132', 0, async (done: Function) => {
      console.info('aceNapiTest0132 START');
      value = napitest.napiSerializeTypearray();
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0133
     * @tc.name aceNapiTest0133
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0133', 0, async (done: Function) => {
      console.info('aceNapiTest0133 START');
      let temp = new SharedArrayBuffer(20);
      value = napitest.napiSerializeSharedarraybuffer(temp);
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0134
     * @tc.name aceNapiTest0134
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0134', 0, async (done: Function) => {
      console.info('aceNapiTest0134 START');
      let mapTemp = new Map();
      value = napitest.napiSerializeMap(mapTemp);
      expect(value).assertEqual(0);
      done();
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0135
     * @tc.name aceNapiTest0135
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0135', 0, async (done: Function) => {
      console.info('aceNapiTest0135 START');
      let setTemp = new Set();
      value = napitest.napiSerializeSet(setTemp);
      expect(value).assertEqual(0);
      done();//let regexp: RegExp = new RegExp('\\[', 'g');
    });
    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0136
     * @tc.name aceNapiTest0136
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0136', 0, async (done: Function) => {
      console.info('aceNapiTest0136 START');
      let regexp: RegExp = new RegExp('\\[', 'g');
      value = napitest.napiSerializeRegExp(regexp);
      expect(value).assertEqual(0);
      done();
  });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0137
     * @tc.name aceNapiTest0137
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0137', 0, async (done: Function) => {
      console.info('aceNapiTest0137 START');
      value = napitest.runEventLoop(2);
      console.info('aceNapiTest0137 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0138
     * @tc.name aceNapiTest0138
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0138', 0, async (done: Function) => {
      console.info('aceNapiTest0138 START');
      value = napitest.runEventLoop(3);
      console.info('aceNapiTest0138 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0139
     * @tc.name aceNapiTest0139
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0139', 0, async function (done) {
      console.info('aceNapiTest0139 START');
      const workerInstance = new worker.Worker('workers/worker.js');
      let isTerminate = false;
      workerInstance.onexit = function () {
        isTerminate = true;
      }
      expect(workerInstance != null).assertTrue();
      let res = undefined;
      workerInstance.onmessage = async (e) => {
        console.info('aceNapiTest0139 testString result is: ' + e.data);
        res = e.data;
        workerInstance.terminate();
      }
      workerInstance.postMessage("call napi_run_event_loop with nowait");
      while (!isTerminate) {
        await promiseCase()
      }
      expect(res).assertEqual("success")
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0140
     * @tc.name aceNapiTest0140
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0140', 0, async function (done) {
      console.info('aceNapiTest0140 START');
      const workerInstance = new worker.Worker('workers/worker.js');
      let isTerminate = false;
      workerInstance.onexit = function () {
        isTerminate = true;
      }
      expect(workerInstance != null).assertTrue();
      let res = undefined;
      workerInstance.onmessage = async (e) => {
        console.info('aceNapiTest0140 testString result is: ' + e.data);
        res = e.data;
        workerInstance.terminate();
      }
      workerInstance.postMessage("call napi_run_event_loop with nowait");
      while (!isTerminate) {
        await promiseCase()
      }
      expect(res).assertEqual("success")
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0141
     * @tc.name aceNapiTest0141
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0141', 0, async (done: Function) => {
      console.info('aceNapiTest0141 START');
      value = napitest.runEventLoop(6);
      console.info('aceNapiTest0141 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0142
     * @tc.name aceNapiTest0142
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0142', 0, async (done: Function) => {
      console.info('aceNapiTest0142 START');
      value = napitest.runEventLoop(7);
      console.info('aceNapiTest0142 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0143
     * @tc.name aceNapiTest0143
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0143', 0, async (done: Function) => {
      console.info('aceNapiTest0143 START');
      value = napitest.runEventLoop(8);
      console.info('aceNapiTest0143 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0144
     * @tc.name aceNapiTest0144
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0144', 0, async (done: Function) => {
      console.info('aceNapiTest0144 START');
      value = napitest.runEventLoop(9);
      console.info('aceNapiTest0144 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0145
     * @tc.name aceNapiTest0145
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0145', 0, async function (done) {
    console.info('aceNapiTest0145 START');
      value = napitest.stopEventLoop(1)
      console.info('aceNapiTest0145 testString result is: ' + value);
      expect(value).assertEqual(0)
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0146
     * @tc.name aceNapiTest0146
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0146', 0, async function (done) {
      console.info('aceNapiTest0146 START');
      const workerInstance = new worker.Worker('workers/worker.js');
      let isTerminate = false;
      workerInstance.onexit = function () {
        isTerminate = true;
      }
      expect(workerInstance != null).assertTrue();
      let res = undefined;
      workerInstance.onmessage = async (e) => {
        console.info('aceNapiTest0146 testString result is: ' + e.data);
        res = e.data;
        workerInstance.terminate();
      }
      workerInstance.postMessage("call napi_stop_event_loop");
      while (!isTerminate) {
        await promiseCase()
      }
      expect(res).assertEqual("success")
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0147
     * @tc.name aceNapiTest0147
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0147', 0, async function (done) {
      console.info('aceNapiTest0147 START');
      value = napitest.stopEventLoop(3);
      console.info('aceNapiTest0147 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0148
     * @tc.name aceNapiTest0148
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0148', 0, async function (done) {
      console.info('aceNapiTest0148 START');
      value = napitest.stopEventLoop(4);
      console.info('aceNapiTest0148 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0149
     * @tc.name aceNapiTest0149
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0149', 0, async function (done) {
      console.info('aceNapiTest0149 START');
      value = napitest.napiSetNamedProperty();
      console.info('aceNapiTest0149 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0150
     * @tc.name aceNapiTest0150
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0150', 0, async function (done) {
      console.info('aceNapiTest0150 START');
      value = napitest.napiGetNamedProperty();
      console.info('aceNapiTest0150 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0151
     * @tc.name aceNapiTest0151
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0151', 0, async function (done) {
      class MyClass {
        constructor() {
        }
        // 类的方法
        add(num1, num2) {
          return num1 + num2;
        }
      }
      const myObj = new MyClass();
      console.info('aceNapiTest0151 START');
      value = napitest.callAddNumFunction(myObj, myObj.add);
      console.info('aceNapiTest0151 testString result is: ' + value);
      expect(value).assertEqual(12);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0152
     * @tc.name aceNapiTest0152
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0152', 0, async function (done) {
      console.info('aceNapiTest0152 START');
      value = napitest.napiNewInstance();
      console.info('aceNapiTest0152 testString result is: ' + value);
      expect(value).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0153
     * @tc.name aceNapiTest0153
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0153', 0, async function (done) {
      console.info('aceNapiTest0153 START');
      value = napitest.napiCrateAndGetValueString('love');
      console.info('aceNapiTest0153 testString result is: ' + value);
      expect(value).assertEqual('love');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0154
     * @tc.name aceNapiTest0154
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0154', 0, async function (done) {
      try {
        console.info('aceNapiTest0154 START');
        value = napitest.exceptionalSetNamedProperty();
        console.info('aceNapiTest0154 testString result is: ' + value);
      } catch (err) {
        console.info('aceNapiTest0154 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er === '{}').assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0155
     * @tc.name aceNapiTest0155
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0155', 0, async function (done) {
      try {
        console.info('aceNapiTest0155 START');
        value = napitest.exceptionalGetNamedProperty();
        console.info('aceNapiTest0155 testString result is: ' + value);
      } catch (err) {
        console.info('aceNapiTest0155 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er === '{}').assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0156
     * @tc.name aceNapiTest0156
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0156', 0, async function (done) {
      class MyClass {
        constructor() {
        }
        // 类的方法
        add(num1, num2) {
          return num1 + num2;
        }
      }
      try {
        console.info('aceNapiTest0156 START');
        value = napitest.exceptionalCallAddNumFunction(myObj, myObj.add);
        console.info('aceNapiTest0156 testString result is: ' + value);
      } catch (err) {
        console.info('aceNapiTest0156 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er === '{}').assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0157
     * @tc.name aceNapiTest0157
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0157', 0, async function (done) {
      try {
        console.info('aceNapiTest0157 START');
        value = napitest.exceptionalNapiNewInstance();
        console.info('aceNapiTest0157 testString result is: ' + value);
      } catch (err) {
        console.info('aceNapiTest0157 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er === '{}').assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0158
     * @tc.name aceNapiTest0158
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0158', 0, async function (done) {
      try {
        console.info('aceNapiTest0158 START');
        value = napitest.exceptionalNapiCrateAndGetValueString('love');
        console.info('aceNapiTest0158 testString result is: ' + value);
      } catch (err) {
        console.info('aceNapiTest0158 testString result is err: ' + err + "--" + JSON.stringify(err));
        let er = JSON.stringify(err)
        expect(er === '{}').assertTrue();
      }
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0159
     * @tc.name aceNapiTest0159
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0159', 0, async function (done) {
      console.info('aceNapiTest0159 START');
      function test1() {
        "use concurrent"
      }
      function test2() {}
      value = napitest.isConcurrentFunction(test1);
      expect(value).assertEqual(true);
      console.info('aceNapiTest0159 testString result is: ' + value);
      value = napitest.isConcurrentFunction(test2);
      expect(value).assertEqual(false);
      console.info('aceNapiTest0159 testString result is: ' + value);
      done();
    });

    /**
     * @tc.name aceNapiTest0160
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0160', 0, async (done: Function) => {
      console.info('aceNapiTest0160 START');
      class Class {
        constructor() {
        }
      }
      class SendableClass {
        constructor() {
          'use sendable';
        }
      }
      let value = napitest.NapiIsSendable(Class, SendableClass);
      console.info('aceNapiTest0160 testString result is: ' + value + '--' + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0160
     * @tc.name aceNapiTest0161
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0161', 0, async (done: Function) => {
      console.info('aceNapiTest0161 START');
      let value = napitest.NapiDefineSendableClass();
      console.info('aceNapiTest0161 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0162
     * @tc.name aceNapiTest0162
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0162', 0, async (done: Function) => {
      console.info('aceNapiTest0162 START');
      value = napitest.threadSafePriorityWithInvalidParam();
      console.info('aceNapiTest0162 testString result is value: ' + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0163
     * @tc.name aceNapiTest0163
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0163', 0, async function (done) {
      console.info('aceNapiTest0163 START');
      const workerInstance = new worker.Worker('workers/worker.js');
      let isTerminate = false;
      workerInstance.onexit = function () {
        isTerminate = true;
      }
      expect(workerInstance != null).assertTrue();
      let res = undefined;
      workerInstance.onmessage = async (e) => {
        console.info('aceNapiTest0163 testString result is: ' + e.data);
        res = e.data;
        workerInstance.terminate();
      }
      workerInstance.postMessage("call napi_define_sendable_class");
      while (!isTerminate) {
        await promiseCase()
      }
      expect(res).assertEqual("success")
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0164
     * @tc.name aceNapiTest0164
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0164', 0, async function (done) {
      console.info('aceNapiTest0164 START');
      let proxyHandler = {};
      let proxyobj = new Proxy(promiseCase, proxyHandler);
      let value = napitest.checkUnwrapFunc(proxyobj);
      console.info('aceNapiTest0164 testString result is: ' + value);
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0165
     * @tc.name aceNapiTest0165
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0165', 0, async function (done) {
      console.info('aceNapiTest0165 START');
      let array = [1, 2];
      let value = napitest.createSendableArrayTest(array);
      let obj = JSON.stringify(value);
      expect(obj).assertEqual('[1,2]');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0166
     * @tc.name aceNapiTest0166
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0166', 0, async function (done) {
      console.info('aceNapiTest0166 START');
      let res = napitest.createSendableArrayWithLengthTest([1, 2]);
      let obj = JSON.stringify(res);
      expect(obj).assertEqual('[1,2]');
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0167
     * @tc.name aceNapiTest0167
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0167', 0, async function (done) {
      console.info('aceNapiTest0167 START');
      value = napitest.createSendableArrayBufferTest();
      console.info('aceNapiTest0167 testString result is: ' + JSON.stringify(value));
      expect(value instanceof SendableArrayBuffer).assertTrue();
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0168
     * @tc.name aceNapiTest0168
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0168', 0, async function (done) {
      console.info('aceNapiTest0168 START');
      let value = napitest.createSendableTypedArrayTest();
      console.info('aceNapiTest0168 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value instanceof SendableInt32Array).assertTrue();
      expect(value.length).assertEqual(4);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0169
     * @tc.name aceNapiTest0169
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0169', 0, async function (done) {
      console.info('aceNapiTest0169 START');
      let value = napitest.createSendableObjectWithProperties();
      console.info('aceNapiTest0169 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0170
     * @tc.name aceNapiTest0170
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0170', 0, async function (done) {
      console.info('aceNapiTest0170 START');
      let value = napitest.napiWrapSendableTest();
      console.info('aceNapiTest0170 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0171
     * @tc.name aceNapiTest0171
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0171', 0, async function (done) {
      console.info('aceNapiTest0171 START');
      let value = napitest.napiWrapSendableWithSizeTest();
      console.info('aceNapiTest0171 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0172
     * @tc.name aceNapiTest0172
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0172', 0, async function (done) {
      console.info('aceNapiTest0172 START');
      let value = napitest.napiUnWrapSendableTest();
      console.info('aceNapiTest0172 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_NAPI_0173
     * @tc.name aceNapiTest0173
     * @tc.desc aceNapiEtsTest
     */
    it('aceNapiTest0173', 0, async function (done) {
      console.info('aceNapiTest0173 START');
      let value = napitest.napiRemoveWrapSendableTest();
      console.info('aceNapiTest0173 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual(0);
      done();
    });
  })
}
