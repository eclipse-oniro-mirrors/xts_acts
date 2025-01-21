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
      value = napitest.coerceToString(123);
      console.info('aceNapiTest047 testString result is: ' + value + "--" + JSON.stringify(value));
      expect(value).assertEqual('123');
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
      expect(value).assertEqual(2147483647 );
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
  })
}
