/*
* Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import napitest from 'libnapitest.so'

export default function napiCallsiteInfoTest() {
  describe('napiCallsiteInfoTest', () => {
    afterEach(async () => {
      console.info('[napiCallsiteInfoTest] after each called')
    });

    /**
     * @tc.name   testNapiCreateCallsiteInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATECALLSITEINFO_0100
     * @tc.desc   Happy path: create callsite info, non-null, two distinct, delete both.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateCallsiteInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateCallsiteInfoTest0001 START');
      try {
        let value = napitest.NapiCreateCallsiteInfoTest01();
        console.info('NapiCreateCallsiteInfoTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateCallsiteInfoTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateCallsiteInfoTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATECALLSITEINFO_0200
     * @tc.desc   result=nullptr returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateCallsiteInfoTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateCallsiteInfoTest0002 START');
      try {
        let value = napitest.NapiCreateCallsiteInfoTest02();
        console.info('NapiCreateCallsiteInfoTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateCallsiteInfoTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateCallsiteInfoTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATECALLSITEINFO_0300
     * @tc.desc   env=nullptr returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateCallsiteInfoTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateCallsiteInfoTest0003 START');
      try {
        let value = napitest.NapiCreateCallsiteInfoTest03();
        console.info('NapiCreateCallsiteInfoTest03 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateCallsiteInfoTest03 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeleteCallsiteInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETECALLSITEINFO_0100
     * @tc.desc   Delete valid info succeeds; info=nullptr returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteCallsiteInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteCallsiteInfoTest0001 START');
      try {
        let value = napitest.NapiDeleteCallsiteInfoTest01();
        console.info('NapiDeleteCallsiteInfoTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteCallsiteInfoTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeleteCallsiteInfoTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETECALLSITEINFO_0200
     * @tc.desc   env=nullptr returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteCallsiteInfoTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteCallsiteInfoTest0002 START');
      try {
        let value = napitest.NapiDeleteCallsiteInfoTest02();
        console.info('NapiDeleteCallsiteInfoTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteCallsiteInfoTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0100
     * @tc.desc   Happy path: get property via callsite info, verify value.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0001 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest01();
        console.info('NapiGetPropCallsiteInfoTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0200
     * @tc.desc   IC cache reuse: second get with same key and info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0002 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest02();
        console.info('NapiGetPropCallsiteInfoTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0300
     * @tc.desc   key=undefined succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0003 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest03();
        console.info('NapiGetPropCallsiteInfoTest03 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest03 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0400
     * @tc.desc   info=nullptr falls back to slow path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0004 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest04();
        console.info('NapiGetPropCallsiteInfoTest04 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest04 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0500
     * @tc.desc   Non-existent key returns undefined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0005 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest05();
        console.info('NapiGetPropCallsiteInfoTest05 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest05 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0600
     * @tc.desc   Function receiver (valid object) succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0006 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest06();
        console.info('NapiGetPropCallsiteInfoTest06 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest06 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0007
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0700
     * @tc.desc   object=undefined returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0007 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest07();
        console.info('NapiGetPropCallsiteInfoTest07 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest07 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0008
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0800
     * @tc.desc   object=null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0008 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest08();
        console.info('NapiGetPropCallsiteInfoTest08 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest08 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0009
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_0900
     * @tc.desc   key=null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0009 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest09();
        console.info('NapiGetPropCallsiteInfoTest09 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest09 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0010
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_1000
     * @tc.desc   result=null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0010 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest10();
        console.info('NapiGetPropCallsiteInfoTest10 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest10 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0011
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_1100
     * @tc.desc   env=null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0011 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest11();
        console.info('NapiGetPropCallsiteInfoTest11 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest11 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0012
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_1200
     * @tc.desc   All null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0012 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest12();
        console.info('NapiGetPropCallsiteInfoTest12 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest12 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0013
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_1300
     * @tc.desc   object=number returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0013 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest13();
        console.info('NapiGetPropCallsiteInfoTest13 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest13 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0014
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_1400
     * @tc.desc   object=boolean returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0014 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest14();
        console.info('NapiGetPropCallsiteInfoTest14 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest14 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0015
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_1500
     * @tc.desc   object=null(JS) returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0015 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest15();
        console.info('NapiGetPropCallsiteInfoTest15 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest15 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropCallsiteInfoTest0016
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPCALLSITEINFO_1600
     * @tc.desc   object=string returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropCallsiteInfoTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropCallsiteInfoTest0016 START');
      try {
        let value = napitest.NapiGetPropCallsiteInfoTest16();
        console.info('NapiGetPropCallsiteInfoTest16 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropCallsiteInfoTest16 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0100
     * @tc.desc   Happy path: set property via callsite info, verify with normal get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0001 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest01();
        console.info('NapiSetPropCallsiteInfoTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0200
     * @tc.desc   IC overwrite: second set same key, last value wins.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0002 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest02();
        console.info('NapiSetPropCallsiteInfoTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0300
     * @tc.desc   key=undefined succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0003 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest03();
        console.info('NapiSetPropCallsiteInfoTest03 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest03 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0400
     * @tc.desc   value=undefined succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0004 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest04();
        console.info('NapiSetPropCallsiteInfoTest04 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest04 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0500
     * @tc.desc   info=nullptr falls back to slow path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0005 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest05();
        console.info('NapiSetPropCallsiteInfoTest05 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest05 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0600
     * @tc.desc   Function receiver (valid object) succeeds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0006 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest06();
        console.info('NapiSetPropCallsiteInfoTest06 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest06 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0007
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0700
     * @tc.desc   object=undefined returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0007 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest07();
        console.info('NapiSetPropCallsiteInfoTest07 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest07 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0008
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0800
     * @tc.desc   object=null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0008 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest08();
        console.info('NapiSetPropCallsiteInfoTest08 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest08 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0009
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_0900
     * @tc.desc   key=null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0009 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest09();
        console.info('NapiSetPropCallsiteInfoTest09 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest09 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0010
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_1000
     * @tc.desc   value=null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0010 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest10();
        console.info('NapiSetPropCallsiteInfoTest10 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest10 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0011
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_1100
     * @tc.desc   env=null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0011 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest11();
        console.info('NapiSetPropCallsiteInfoTest11 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest11 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0012
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_1200
     * @tc.desc   All null returns napi_invalid_arg.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0012 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest12();
        console.info('NapiSetPropCallsiteInfoTest12 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest12 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0013
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_1300
     * @tc.desc   object=number returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0013 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest13();
        console.info('NapiSetPropCallsiteInfoTest13 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest13 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0014
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_1400
     * @tc.desc   object=boolean returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0014 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest14();
        console.info('NapiSetPropCallsiteInfoTest14 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest14 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0015
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_1500
     * @tc.desc   object=null(JS) returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0015 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest15();
        console.info('NapiSetPropCallsiteInfoTest15 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest15 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropCallsiteInfoTest0016
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPCALLSITEINFO_1600
     * @tc.desc   object=string returns napi_object_expected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropCallsiteInfoTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropCallsiteInfoTest0016 START');
      try {
        let value = napitest.NapiSetPropCallsiteInfoTest16();
        console.info('NapiSetPropCallsiteInfoTest16 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropCallsiteInfoTest16 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoCrossUseTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOCROSSUSE_0100
     * @tc.desc   Get-populated info used for set falls back to slow path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoCrossUseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoCrossUseTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoCrossUseTest01();
        console.info('NapiCallsiteInfoCrossUseTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoCrossUseTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoCrossUseTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOCROSSUSE_0200
     * @tc.desc   Set-populated info used for get falls back to slow path.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoCrossUseTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoCrossUseTest0002 START');
      try {
        let value = napitest.NapiCallsiteInfoCrossUseTest02();
        console.info('NapiCallsiteInfoCrossUseTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoCrossUseTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoCrossUseTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOCROSSUSE_0300
     * @tc.desc   Cross-use hit tracking: cross-direction set has hit=false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoCrossUseTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoCrossUseTest0003 START');
      try {
        let value = napitest.NapiCallsiteInfoCrossUseTest03();
        console.info('NapiCallsiteInfoCrossUseTest03 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoCrossUseTest03 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoRoundTripTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOROUNDTRIP_0100
     * @tc.desc   Fast set + fast get with separate callsite infos.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoRoundTripTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoRoundTripTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoRoundTripTest01();
        console.info('NapiCallsiteInfoRoundTripTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoRoundTripTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoRoundTripTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOROUNDTRIP_0200
     * @tc.desc   Normal set to fast get, fast set to normal get.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoRoundTripTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoRoundTripTest0002 START');
      try {
        let value = napitest.NapiCallsiteInfoRoundTripTest02();
        console.info('NapiCallsiteInfoRoundTripTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoRoundTripTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoMultiObjectTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOMULTIOBJECT_0100
     * @tc.desc   Same key across objects with different HClasses.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoMultiObjectTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoMultiObjectTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoMultiObjectTest();
        console.info('NapiCallsiteInfoMultiObjectTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoMultiObjectTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoValueTypeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOVALUETYPE_0100
     * @tc.desc   String value round-trip via callsite info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoValueTypeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoValueTypeTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoValueTypeTest01();
        console.info('NapiCallsiteInfoValueTypeTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoValueTypeTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoValueTypeTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOVALUETYPE_0200
     * @tc.desc   Boolean value round-trip via callsite info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoValueTypeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoValueTypeTest0002 START');
      try {
        let value = napitest.NapiCallsiteInfoValueTypeTest02();
        console.info('NapiCallsiteInfoValueTypeTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoValueTypeTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoValueTypeTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOVALUETYPE_0300
     * @tc.desc   Double value round-trip via callsite info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoValueTypeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoValueTypeTest0003 START');
      try {
        let value = napitest.NapiCallsiteInfoValueTypeTest03();
        console.info('NapiCallsiteInfoValueTypeTest03 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoValueTypeTest03 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoValueTypeTest0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOVALUETYPE_0400
     * @tc.desc   Null value round-trip via callsite info.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoValueTypeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoValueTypeTest0004 START');
      try {
        let value = napitest.NapiCallsiteInfoValueTypeTest04();
        console.info('NapiCallsiteInfoValueTypeTest04 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoValueTypeTest04 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoHitGetTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOHIT_0100
     * @tc.desc   Get hit parameter: false on miss, true on hit.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoHitGetTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoHitGetTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoHitGetTest();
        console.info('NapiCallsiteInfoHitGetTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoHitGetTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoHitSetTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOHIT_0200
     * @tc.desc   Set hit parameter: false on miss, true on hit.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoHitSetTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoHitSetTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoHitSetTest();
        console.info('NapiCallsiteInfoHitSetTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoHitSetTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoMegaStateTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOMEGASTATE_0100
     * @tc.desc   >4 different object Shapes cause IC mega state; verify correctness and hit=false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoMegaStateTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoMegaStateTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoMegaStateTest();
        console.info('NapiCallsiteInfoMegaStateTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoMegaStateTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoPrototypeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOPROTOTYPE_0100
     * @tc.desc   Get inherited prototype chain property via callsite IC.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoPrototypeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoPrototypeTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoPrototypeTest();
        console.info('NapiCallsiteInfoPrototypeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoPrototypeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoMegaStateSetTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOMEGASTATESET_0100
     * @tc.desc   SET direction mega state: >4 shapes with pre-created property, verify values and hit=false.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoMegaStateSetTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoMegaStateSetTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoMegaStateSetTest();
        console.info('NapiCallsiteInfoMegaStateSetTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoMegaStateSetTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoMegaStatePermanentTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOMEGASTATEPERMANENT_0100
     * @tc.desc   After mega state, re-access first shape — hit still false (permanent slow path).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoMegaStatePermanentTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoMegaStatePermanentTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoMegaStatePermanentTest();
        console.info('NapiCallsiteInfoMegaStatePermanentTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoMegaStatePermanentTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoPrototypeHitTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOPROTOTYPEHIT_0100
     * @tc.desc   Prototype inherited property: verify IC miss→hit transition with hit tracking.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoPrototypeHitTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoPrototypeHitTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoPrototypeHitTest();
        console.info('NapiCallsiteInfoPrototypeHitTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoPrototypeHitTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoPrototypeShadowTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOPROTOTYPESHADOW_0100
     * @tc.desc   SET on child shadows inherited property; verify child has new value, proto unchanged.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoPrototypeShadowTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoPrototypeShadowTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoPrototypeShadowTest();
        console.info('NapiCallsiteInfoPrototypeShadowTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoPrototypeShadowTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCallsiteInfoPrototypeInvalidationTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLSITEINFOPROTOTYPEINVALIDATION_0100
     * @tc.desc   Warm IC on inherited property, mutate proto value, verify IC returns new value (not stale).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallsiteInfoPrototypeInvalidationTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallsiteInfoPrototypeInvalidationTest0001 START');
      try {
        let value = napitest.NapiCallsiteInfoPrototypeInvalidationTest();
        console.info('NapiCallsiteInfoPrototypeInvalidationTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallsiteInfoPrototypeInvalidationTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
  });
}
