/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import worker from '@ohos.worker';

async function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

interface Person{
  name: string
  age:number
}


export default function napiApiTest() {
  describe('napiApiTest', () => {
    /**
     * run after testcase
     */
    afterEach(async () => {
      console.info('[napiApiTest] after each called')
    });

    /**
     * @tc.name   testGetLastErrorInfo0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETLASTERRORINFO_0100
     * @tc.desc   Testing GetLastErrorInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetLastErrorInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetLastErrorInfo0001 START');
      try {
        let value = napitest.getLastErrorInfo();
        console.info('testGetLastErrorInfo0001 result is: ' + value);
        expect(value).assertEqual(6);
      } catch (err) {
        console.error('testGetLastErrorInfo0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetLastErrorInfo0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETLASTERRORINFO_0200
     * @tc.desc   Testing GetLastErrorInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetLastErrorInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testGetLastErrorInfo0002 START');
      try {
        let value = napitest.getLastErrorInfoNull();
        console.info('testGetLastErrorInfo0002 result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetLastErrorInfo0002 err message' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testThrow0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_THROW_0100
     * @tc.desc   Testing Throw NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testThrow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testThrow0001 START');
      try {
        let value = napitest.throwFunc();
        console.info('testThrow0001 result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testThrow0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testThrow0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_THROW_0200
     * @tc.desc   Testing Throw NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testThrow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testThrow0002 START');
      try {
        let value = napitest.throwFuncNull();
        console.info('testThrow0002 result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testThrow0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testThrowError0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_THROWERROR_0100
     * @tc.desc   Testing ThrowError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testThrowError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testThrowError0001 START');
      try {
        let value = napitest.throwError();
        console.info('testThrowError0001 result is: ' + value);
        expect().assertFail();
      } catch (err) {
        console.error('testThrowError0001 err msg' + err.message);
        expect(JSON.stringify(err)).assertEqual('{"code":"500"}');
      }
      done();
    });

    /**
     * @tc.name   testThrowTypeError0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_THROWTYPEERROR_0100
     * @tc.desc   Testing ThrowTypeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testThrowTypeError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testThrowTypeError0001 START');
      try {
        let value = napitest.throwTypeError();
        console.info('testThrowTypeError0001 result is: ' + value);
        expect().assertFail();
      } catch (err) {
        console.error('testThrowTypeError0001 err msg' + err.messsage);
        expect(err instanceof TypeError).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testThrowRangeError0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_THROWRANGEERROR_0100
     * @tc.desc   Testing ThrowRangeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testThrowRangeError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testThrowRangeError0001 START');
      try {
        let ret = napitest.throwRangeError();
        console.info('testThrowRangeError0001 ret is: ' + ret);
        expect().assertFail();
      } catch (err) {
        console.error('testThrowRangeError0001 err msg' + err.message);
        expect(err instanceof RangeError).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testIsError0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISERROR_0100
     * @tc.desc   Testing IsError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsError0001 START');
      try {
        let ret = napitest.isError(true);
        console.info('testIsError0001 ret is: ' + ret);
        expect(ret).assertEqual(false);
      } catch (err) {
        console.error('testIsError0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsError0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISERROR_0200
     * @tc.desc   Testing IsError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testIsError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('testIsError0002 START');
      try {
        let ret = napitest.isError(null);
        console.info('testIsError0002 ret is: ' + ret);
        expect(ret).assertEqual(false);
      } catch (err) {
        console.error('testIsError0002 err msg' + err.message);
        expect(err).assertEqual('RangeError: range error');
      }
      done();
    });

    /**
     * @tc.name   testIsError0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISERROR_0300
     * @tc.desc   Testing IsError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testIsError0003 START');
      try {
        let ret = napitest.isErrorValueNull(null);
        console.info('testIsError0003 ret is: ' + ret);
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error('testIsError0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsError0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISERROR_0400
     * @tc.desc   Testing IsError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsError0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testIsError0004 START');
      try {
        let ret = napitest.isErrorRstNull(null);
        console.info('testIsError0004 ret is: ' + ret);
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error('testIsError0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringUtf80001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF8_0100
     * @tc.desc   Testing CreateStringUtf8 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringUtf80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringUtf80001 START');
      try {
        let ret = napitest.createStringUtf8('abc');
        console.info('testCreateStringUtf80001 ret is: ' + ret);
        expect(ret).assertEqual('abc');
      } catch (err) {
        console.error('testCreateStringUtf80001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringUtf80002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF8_0200
     * @tc.desc   Testing CreateStringUtf8 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateStringUtf80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      console.info('testCreateStringUtf80002 START');
      try {
        let ret = napitest.createStringUtf8(null);
        console.info('testCreateStringUtf80002 ret is: ' + ret);
        expect().assertFail();
      } catch (err) {
        console.error('testCreateStringUtf80002 err msg' + err.messsage);
        expect(err instanceof TypeError).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testCreateError0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEERROR_0100
     * @tc.desc   Testing CreateError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateError0001 START');
      try {
        let ret = napitest.createError();
        console.info('testCreateError0001 ret is: ' + ret);
        expect(ret).assertEqual(0);
      } catch (err) {
        console.error('testCreateError0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateError0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEERROR_0200
     * @tc.desc   Testing CreateError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateError0002 START');
      try {
        let ret = napitest.createErrorMsgNull();
        console.info('testCreateError0002 result is: ' + ret);
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error('testCreateError0002 err code' + err.Error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateError0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEERROR_0300
     * @tc.desc   Testing CreateError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateError0003 START');
      try {
        let ret = napitest.createErrorRstNull();
        console.info('testCreateError0003 ret is: ' + ret);
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error('testCreateError0003 err code' + err.Error);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateTypeError0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEERROR_0100
     * @tc.desc   Testing CreateTypeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateTypeError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateTypeError0001 START');
      try {
        let ret = napitest.createTypeError();
        console.info('testCreateTypeError0001 ret is: ' + ret);
        expect(ret).assertEqual(0);
      } catch (err) {
        console.error('testCreateTypeError0001 err msg' + err.message);
        expect(err).assertEqual('RangeError: range error');
      }
      done();
    });

    /**
     * @tc.name   testCreateTypeError0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEERROR_0200
     * @tc.desc   Testing CreateTypeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypeError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateTypeError0002 START');
      try {
        let ret = napitest.createTypeErrorMsgNull();
        console.info('testCreateTypeError0002 result is: ' + ret);
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error('testCreateTypeError0002 err message' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateTypeError0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEERROR_0300
     * @tc.desc   Testing CreateTypeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypeError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateTypeError0003 START');
      try {
        let ret = napitest.createTypeErrorRstNull();
        console.info('testCreateTypeError0003 ret is: ' + ret);
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error('testCreateTypeError0003 err message' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateRangeError0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATERANGEERROR_0100
     * @tc.desc   Testing CreateRangeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateRangeError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateRangeError0001 START');
      try {
        let ret = napitest.createRangeError();
        console.info('testCreateRangeError0001 ret is: ' + ret);
        expect(ret).assertEqual(0);
      } catch (err) {
        console.error('testCreateRangeError0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateRangeError0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATERANGEERROR_0200
     * @tc.desc   Testing CreateRangeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateRangeError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateRangeError0002 START');
      try {
        let ret = napitest.createRangeErrorRstNull();
        console.info('testCreateRangeError0002 ret is: ' + ret);
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error('testCreateRangeError0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetAndClearLastException0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETANDCLEARLASTEXCEPTION_0100
     * @tc.desc   Testing GetAndClearLastException NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetAndClearLastException0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetAndClearLastException0001 START');
      try {
        let ret = napitest.getAndClearLastException();
        console.info('testGetAndClearLastException0001 ret is: ' + ret);
      } catch (err) {
        console.error('testGetAndClearLastException0001 err msg' + err.message);
        let er = JSON.stringify(err)
        expect(er === '{"code":"600"}').assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testGetAndClearLastException0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETANDCLEARLASTEXCEPTION_0200
     * @tc.desc   Testing GetAndClearLastException NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetAndClearLastException0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testGetAndClearLastException0002 START');
      try {
        let ret = napitest.getAndClearLastExceptionNull();
        console.info('testGetAndClearLastException0002 ret is: ' + ret);
        expect(ret).assertEqual(1);
      } catch (err) {
        console.error('testGetAndClearLastException0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsExceptionPending0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISEXCEPTIONPENDING_0100
     * @tc.desc   Testing IsExceptionPending NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsExceptionPending0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsExceptionPending0001 START');
      try {
        let value = napitest.isExceptionPending();
        console.info('testIsExceptionPending0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testIsExceptionPending0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsExceptionPending0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISEXCEPTIONPENDING_0200
     * @tc.desc   Testing IsExceptionPending NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testIsExceptionPending0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testIsExceptionPending0002 START');
      try {
        let value = napitest.isExceptionPendingNull();
        console.info('testIsExceptionPending0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsExceptionPending0002 err.msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testOpenAndCloseHandleScope0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OPENANDCLOSEHANDLESCOPE_0100
     * @tc.desc   Testing OpenAndCloseHandleScope NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOpenAndCloseHandleScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testOpenAndCloseHandleScope0001 START');
      try {
        let value = napitest.openAndCloseHandleScope();
        console.info('testOpenAndCloseHandleScope0001 value is: ' + value);
        expect(value == undefined).assertTrue();
      } catch (err) {
        console.error('testOpenAndCloseHandleScope0001 err.msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testOpenAndCloseHandleScope0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OPENANDCLOSEHANDLESCOPE_0200
     * @tc.desc   Testing OpenAndCloseHandleScope NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpenAndCloseHandleScope0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testOpenAndCloseHandleScope0002 START');
      try {
        let value = napitest.openAndCloseHandleScopeNull();
        console.info('testOpenAndCloseHandleScope0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testOpenAndCloseHandleScope0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testOpenAndCloseEscapableHandleScope0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OPENANDCLOSEESCAPABLEHANDLESCOPE_0100
     * @tc.desc   Testing OpenAndCloseEscapableHandleScope NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOpenAndCloseEscapableHandleScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testOpenAndCloseEscapableHandleScope0001 START');
      try {
        let value = napitest.openAndCloseEscapableHandleScope();
        console.info('testOpenAndCloseEscapableHandleScope0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testOpenAndCloseEscapableHandleScope0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testOpenAndCloseEscapableHandleScope0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OPENANDCLOSEESCAPABLEHANDLESCOPE_0200
     * @tc.desc   Testing OpenAndCloseEscapableHandleScope NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testOpenAndCloseEscapableHandleScope0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testOpenAndCloseEscapableHandleScope0002 START');
      try {
        let value = napitest.openAndCloseEscapableHandleScopeNull();
        console.info('testOpenAndCloseEscapableHandleScope0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testOpenAndCloseEscapableHandleScope0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testEscapeHandle0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ESCAPEHANDLE_0100
     * @tc.desc   Testing EscapeHandle NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEscapeHandle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testEscapeHandle0001 START');
      try {
        let value = napitest.escapeHandle();
        console.info('testEscapeHandle0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testEscapeHandle0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testEscapeHandle0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ESCAPEHANDLE_0200
     * @tc.desc   Testing EscapeHandle NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEscapeHandle0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testEscapeHandle0002 START');
      try {
        let value = napitest.escapeHandleScopeNull();
        console.info('testEscapeHandle0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testEscapeHandle0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testEscapeHandle0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ESCAPEHANDLE_0300
     * @tc.desc   Testing EscapeHandle NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEscapeHandle0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testEscapeHandle0003 START');
      try {
        let value = napitest.escapeHandleOutputNull();
        console.info('testEscapeHandle0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testEscapeHandle0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testEscapeHandle0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ESCAPEHANDLE_0400
     * @tc.desc   Testing EscapeHandle NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testEscapeHandle0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testEscapeHandle0004 START');
      try {
        let value = napitest.escapeHandleRstNull();
        console.info('testEscapeHandle0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testEscapeHandle0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateReference0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEREFERENCE_0100
     * @tc.desc   Testing CreateReference NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateReference0001 START');
      try {
        let value = napitest.createReference();
        console.info('testCreateReference0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateReference0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateReference0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEREFERENCE_0200
     * @tc.desc   Testing CreateReference NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateReference0002 START');
      try {
        let value = napitest.createReferenceValueNull();
        console.info('testCreateReference0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateReference0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetReferenceValue0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETREFERENCEVALUE_0100
     * @tc.desc   Testing GetReferenceValue NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetReferenceValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetReferenceValue0001 START');
      try {
        let value = napitest.getReferenceValue();
        console.info('testGetReferenceValue0001 value is: ' + value);
        expect(value).assertEqual(666);
      } catch (err) {
        console.error('testGetReferenceValue0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetReferenceValue0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETREFERENCEVALUE_0200
     * @tc.desc   Testing GetReferenceValue NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetReferenceValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testGetReferenceValue0002 START');
      try {
        let value = napitest.getReferenceValueRefNull();
        console.info('testGetReferenceValue0002 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetReferenceValue0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetReferenceValue0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETREFERENCEVALUE_0300
     * @tc.desc   Testing GetReferenceValue NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testGetReferenceValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testGetReferenceValue0003 START');
      try {
        let value = napitest.getReferenceValueRstNull();
        console.info('testGetReferenceValue0003 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetReferenceValue0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteReference0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEREFERENCE_0100
     * @tc.desc   Testing DeleteReference NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteReference0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteReference0001 START');
      try {
        let value = napitest.getAndDeleteReference();
        console.info('testDeleteReference0001 value is: ' + value);
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error('testDeleteReference0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteReference0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEREFERENCE_0200
     * @tc.desc   Testing DeleteReference NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testDeleteReference0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testDeleteReference0002 START');
      try {
        let value = napitest.deleteReferenceNull();
        console.info('testDeleteReference0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDeleteReference0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testReferenceRef0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REFERENCEREF_0100
     * @tc.desc   Testing ReferenceRef NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReferenceRef0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testReferenceRef0001 START');
      try {
        let value = napitest.referenceRef();
        console.info('testReferenceRef0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testReferenceRef0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testReferenceRef0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REFERENCEREF_0200
     * @tc.desc   Testing ReferenceRef NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReferenceRef0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testReferenceRef0002 START');
      try {
        let value = napitest.referenceRefNull();
        console.info('testReferenceRef0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testReferenceRef0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testReferenceUnRef0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REFERENCEUNREF_0100
     * @tc.desc   Testing ReferenceRef NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReferenceUnRef0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testReferenceUnRef0001 START');
      try {
        let value = napitest.referenceRefAndUnref();
        console.info('testReferenceUnRef0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testReferenceUnRef0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testReferenceUnRef0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REFERENCEUNREF_0200
     * @tc.desc   Testing ReferenceRef NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testReferenceUnRef0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testReferenceUnRef0002 START');
      try {
        let value = napitest.referenceRefAndUnrefNull();
        console.info('testReferenceUnRef0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testReferenceUnRef0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateArray0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEARRAY_0100
     * @tc.desc   Testing CreateArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateArray0001 START');
      try {
        let array = [1, 2];
        let value = napitest.createArrayAndGetLength(array);
        console.info('testCreateArray0001 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(obj).assertEqual('[1,2]');
      } catch (err) {
        console.error('testCreateArray0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateArray0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEARRAY_0200
     * @tc.desc   Testing CreateArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateArray0002 START');
      try {
        let value = napitest.createArrayNull(null);
        console.info('testCreateArray0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateArray0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateArrayBuffer0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEARRAYBUFFER_0100
     * @tc.desc   Testing CreateArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateArrayBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateArrayBuffer0001 START');
      try {
        let value = napitest.napCreateArrayBuffer();
        console.info('testCreateArrayBuffer0001 value is: ' + value);
        expect(value instanceof ArrayBuffer).assertTrue();
      } catch (err) {
        console.error('testCreateArrayBuffer0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateArrayBuffer0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEARRAYBUFFER_0200
     * @tc.desc   Testing CreateArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateArrayBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateArrayBuffer0002 START');
      try {
        let value = napitest.napCreateArrayBufferNull();
        console.info('testCreateArrayBuffer0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateArrayBuffer0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateExternal0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNAL_0100
     * @tc.desc   Testing CreateExternal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateExternal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateExternal0001 START');
      try {
        let value = napitest.createExternal();
        console.info('testCreateExternal0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateExternal0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateExternal0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNAL_0200
     * @tc.desc   Testing CreateExternal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateExternal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateExternal0002 START');
      try {
        let value = napitest.createExternalNull();
        console.info('testCreateExternal0002 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateExternal0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateExternalArraybuffer0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNALARRAYBUFFER_0100
     * @tc.desc   Testing CreateExternal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateExternalArraybuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateExternalArraybuffer0001 START');
      try {
        let value = napitest.createExternalArraybuffer();
        console.info('testCreateExternalArraybuffer0001 value is: ' + value);
        expect(value instanceof ArrayBuffer).assertTrue();
        let view = new Int32Array(value);
        expect(view[0]).assertEqual(666);
      } catch (err) {
        console.error('testCreateExternalArraybuffer0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateExternalArraybuffer0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNALARRAYBUFFER_0200
     * @tc.desc   Testing CreateExternal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateExternalArraybuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateExternalArraybuffer0002 START');
      try {
        let value = napitest.createExternalArraybufferDataNull();
        console.info('testCreateExternalArraybuffer0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateExternalArraybuffer0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateObject0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEOBJECT_0100
     * @tc.desc   Testing CreateObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateObject0001 START');
      try {
        let value = napitest.createObject();
        console.info('testCreateObject0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testCreateObject0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateObject0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEOBJECT_0200
     * @tc.desc   Testing CreateObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateObject0002 START');
      try {
        let value = napitest.createObjectNull();
        console.info('testCreateObject0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateObject0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSymbol0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESYMBOL_0100
     * @tc.desc   Testing CreateObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSymbol0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSymbol0001 START');
      try {
        let value = napitest.createSymbol('symbol');
        console.info('testCreateSymbol0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateSymbol0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSymbol0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESYMBOL_0200
     * @tc.desc   Testing CreateObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSymbol0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateSymbol0002 START');
      try {
        let value = napitest.createSymbolNull(null);
        console.info('testCreateSymbol0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSymbol0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSymbol0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESYMBOL_0300
     * @tc.desc   Testing CreateObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateSymbol0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateSymbol0003 START');
      try {
        let value = napitest.createSymbolDescriptionNull(null);
        console.info('testCreateSymbol0003 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateSymbol0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSymbol0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESYMBOL_0400
     * @tc.desc   Testing CreateObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateSymbol0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      console.info('testCreateSymbol0004 START');
      try {
        let value = napitest.createSymbolDescriptionNotString('symbol');
        console.info('testCreateSymbol0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSymbol0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateTypeArray0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0100
     * @tc.desc   Testing CreateTypeArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateTypeArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateTypeArray0001 START');
      try {
        let value = napitest.createTypeArray();
        console.info('testCreateTypeArray0001 value is: ' + value);
        expect(value instanceof Int32Array).assertTrue();
        expect(value.length).assertEqual(4);
      } catch (err) {
        console.error('testCreateTypeArray0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateTypeArray0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0200
     * @tc.desc   Testing CreateTypeArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypeArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateTypeArray0002 START');
      try {
        let value = napitest.createTypeArrayBufferNull();
        console.info('testCreateTypeArray0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateTypeArray0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateTypeArray0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0300
     * @tc.desc   Testing CreateTypeArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypeArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateTypeArray0003 START');
      try {
        let value = napitest.createTypeArrayResultNull();
        console.info('testCreateTypeArray0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateTypeArray0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateTypeArray0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0400
     * @tc.desc   Testing CreateTypeArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testCreateTypeArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL4, async (done: Function) => {
      console.info('testCreateTypeArray0004 START');
      try {
        let value = napitest.createTypeArrayNotBufferObj();
        console.info('testCreateTypeArray0004 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateTypeArray0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateTypeArray0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0500
     * @tc.desc   Testing CreateTypeArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateTypeArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateTypeArray0005 START');
      try {
        let value = napitest.createTypeArrayNotEnumValue();
        console.info('testCreateTypeArray0005 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateTypeArray0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateDataView0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEDATAVIEW_0100
     * @tc.desc   Testing CreateDataView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateDataView0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateDataView0001 START');
      try {
        let value = napitest.createDataView();
        console.info('testCreateDataView0001 value is: ' + value);
        expect(value instanceof DataView).assertTrue();
        value.setInt16(1, 42);
        expect(value.getInt16(1)).assertEqual(42);
      } catch (err) {
        console.error('testCreateDataView0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateDataView0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEDATAVIEW_0200
     * @tc.desc   Testing CreateDataView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDataView0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateDataView0002 START');
      try {
        let value = napitest.createDataViewBufferNull();
        console.info('testCreateDataView0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateDataView0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateDataView0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEDATAVIEW_0300
     * @tc.desc   Testing CreateDataView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testCreateDataView0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      console.info('testCreateDataView0003 START');
      try {
        let value = napitest.createDataViewResultNull();
        console.info('testCreateDataView0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateDataView0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateDataView0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEDATAVIEW_0400
     * @tc.desc   Testing CreateDataView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateDataView0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateDataView0004 START');
      try {
        let value = napitest.createDataViewBufferNotObj();
        console.info('testCreateDataView0004 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateDataView0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateInt320001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT32_0100
     * @tc.desc   Testing CreateInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateInt320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateInt320001 START');
      try {
        let value = napitest.createAndGetInt32(32);
        console.info('testCreateInt320001 value is: ' + value);
        expect(value).assertEqual(32);
      } catch (err) {
        console.error('testCreateInt320001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateInt320002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT32_0200
     * @tc.desc   Testing CreateInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateInt320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateInt320002 START');
      try {
        let value = napitest.createInt32Null(null);
        console.info('testCreateInt320002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateInt320002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueInt320001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT32_0100
     * @tc.desc   Testing GetValueInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueInt320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueInt320001 START');
      try {
        let value = napitest.getValueInt32(32);
        console.info('testGetValueInt320001 value is: ' + value);
        expect(value).assertEqual(32);
      } catch (err) {
        console.error('testGetValueInt320001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueInt320002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT32_0200
     * @tc.desc   Testing GetValueInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueInt320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueInt320002 START');
      try {
        let value = napitest.getValueInt32ValueNull(null);
        console.info('testGetValueInt320002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueInt320002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueInt320003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT32_0300
     * @tc.desc   Testing GetValueInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueInt320003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueInt320003 START');
      try {
        let value = napitest.getValueInt32RstNull(null);
        console.info('testGetValueInt320003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueInt320003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueInt640001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT64_0100
     * @tc.desc   Testing GetValueInt64 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueInt640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueInt640001 START');
      try {
        let value = napitest.getValueInt64(23);
        console.info('testGetValueInt640001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetValueInt640001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueInt640002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT64_0200
     * @tc.desc   Testing GetValueInt64 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueInt640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueInt640002 START');
      try {
        let value = napitest.getValueInt64ValueNull(null);
        console.info('testGetValueInt640002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueInt640002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueInt640003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT64_0300
     * @tc.desc   Testing GetValueInt64 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueInt640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueInt640003 START');
      try {
        let value = napitest.getValueInt64RstNull(null);
        console.info('testGetValueInt640003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueInt640003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateUInt320001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEUINT32_0100
     * @tc.desc   Testing CreateInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateUInt320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateUInt320001 START');
      try {
        let value = napitest.createAndGetUInt32(32);
        console.info('testCreateUInt320001 value is: ' + value);
        expect(value).assertEqual(32);
      } catch (err) {
        console.error('testCreateUInt320001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateUInt320002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT32_0200
     * @tc.desc   Testing CreateInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateUInt320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateUInt320002 START');
      try {
        let value = napitest.createUInt32Null(null);
        console.info('testCreateUInt320002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateUInt320002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateInt640001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT64_0100
     * @tc.desc   Testing CreateInt64 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateInt640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateInt640001 START');
      try {
        let value = napitest.createAndGetInt64(23);
        console.info('testCreateInt640001 value is: ' + value);
        expect(value).assertEqual(23);
      } catch (err) {
        console.error('testCreateInt640001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateInt640002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT64_0200
     * @tc.desc   Testing CreateInt64 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateInt640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateInt640002 START');
      try {
        let value = napitest.createInt64Null(null);
        console.info('testCreateInt640002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateInt640002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateDouble0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT64_0100
     * @tc.desc   Testing CreateDouble NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateDouble0001 START');
      try {
        let value = napitest.createDouble(24.67);
        console.info('testCreateDouble0001 value is: ' + value);
        expect(value).assertEqual(24.67);
      } catch (err) {
        console.error('testCreateDouble0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateDouble0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT64_0200
     * @tc.desc   Testing CreateDouble NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateDouble0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateDouble0002 START');
      try {
        let value = napitest.createDoubleNull(null);
        console.info('testCreateDouble0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateDouble0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringLatin10001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGLATIN1_0100
     * @tc.desc   Testing CreateStringLatin NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringLatin10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringLatin10001 START');
      try {
        let value = napitest.createAndGetStringLatin1("tst");
        console.info('testCreateStringLatin10001 value is: ' + value);
        expect(value).assertEqual("tst");
      } catch (err) {
        console.error('testCreateStringLatin10001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringLatin10002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGLATIN1_0200
     * @tc.desc   Testing CreateStringLatin NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringLatin10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringLatin10002 START');
      try {
        let value = napitest.createAndGetStringLatin1BufferNull(null);
        console.info('testCreateStringLatin10002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateStringLatin10002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringLatin10003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGLATIN1_0300
     * @tc.desc   Testing CreateStringLatin NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringLatin10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringLatin10003 START');
      try {
        let value = napitest.createAndGetStringLatin1ResultNull(null);
        console.info('testCreateStringLatin10003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateStringLatin10003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringUtf160001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0100
     * @tc.desc   Testing CreateStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringUtf160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringUtf160001 START');
      try {
        let value = napitest.createAndGetStringUtf16('he');
        let value1 = napitest.stringUtf16OfCase('abc2r42');
        expect(value).assertEqual('he');
        expect(value1).assertEqual('abc2');
      } catch (err) {
        console.error('testCreateStringUtf160001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringUtf160002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0200
     * @tc.desc   Testing CreateStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringUtf160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringUtf160002 START');
      try {
        console.info('testCreateStringUtf160002 START');
        let valueeEmpty = napitest.createAndGetStringUtf16(' ');
        let value = napitest.createAndGetStringUtf16('中文');
        expect(valueeEmpty).assertEqual(' ');
        expect(value).assertEqual('中文');
      } catch (err) {
        console.error('testCreateStringUtf160002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringUtf160003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0300
     * @tc.desc   Testing CreateStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringUtf160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringUtf160003 START');
      try {
        console.info('testCreateStringUtf160003 START');
        let value = napitest.createAndGetStringUtf16BufferNull(null);
        console.info('testCreateStringUtf160003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateStringUtf160003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringUtf160004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0400
     * @tc.desc   Testing CreateStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringUtf160004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringUtf160004 START');
      try {
        console.info('testCreateStringUtf160004 START');
        let value = napitest.createAndGetStringUtf16ResultNull(null);
        console.info('testCreateStringUtf160004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateStringUtf160004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateStringUtf160005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0500
     * @tc.desc   Testing CreateStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateStringUtf160005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateStringUtf160005 START');
      try {
        console.info('testCreateStringUtf160005 START');
        let value = napitest.createAndGetStringUtf16Exceed('test');
        console.info('testCreateStringUtf160005 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateStringUtf160005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetArrayLength0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0100
     * @tc.desc   Testing GetArrayLength NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetArrayLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetArrayLength0001 START');
      try {
        let array = [1, 2];
        let value = napitest.createArrayAndGetLength(array);
        console.info('testGetArrayLength0001 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(obj).assertEqual('[1,2]');
      } catch (err) {
        console.error('testGetArrayLength0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetArrayLength0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0200
     * @tc.desc   Testing GetArrayLength NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetArrayLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetArrayLength0002 START');
      try {
        let value = napitest.getArrayLengthResultNull(null);
        console.info('testGetArrayLength0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetArrayLength0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetArrayLength0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0300
     * @tc.desc   Testing GetArrayLength NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetArrayLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetArrayLength0003 START');
      try {
        let array = [1, 2];
        let value = napitest.getArrayLengthValueNull(null);
        console.info('testGetArrayLength0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetArrayLength0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetArrayBufferInfo0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0100
     * @tc.desc   Testing GetArrayBufferInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetArrayBufferInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetArrayBufferInfo0001 START');
      try {
        let value = napitest.naiGetArrayBufferInfo();
        console.info('testGetArrayBufferInfo0001 value is: ' + value);
        expect(value).assertEqual(1024);
      } catch (err) {
        console.error('testGetArrayBufferInfo0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetArrayBufferInfo0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0200
     * @tc.desc   Testing GetArrayBufferInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetArrayBufferInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetArrayBufferInfo0002 START');
      try {
        let value = napitest.getArrayBufferInfoBufferNull();
        console.info('testGetArrayBufferInfo0001 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetArrayBufferInfo0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetArrayBufferInfo0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0300
     * @tc.desc   Testing GetArrayBufferInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetArrayBufferInfo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetArrayBufferInfo0003 START');
      try {
        let value = napitest.getArrayBufferInfoLengthNull();
        console.info('testGetArrayBufferInfo0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetArrayBufferInfo0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetArrayBufferInfo0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0400
     * @tc.desc   Testing GetArrayBufferInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetArrayBufferInfo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetArrayBufferInfo0004 START');
      try {
        let value = napitest.getArrayBufferInfoNotObj();
        console.info('testGetArrayBufferInfo0004 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetArrayBufferInfo0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetPrototype0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTGETPROTOTYPE_0100
     * @tc.desc   Testing GetPrototype NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPrototype0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetPrototype0001 START');
      try {
        let value = napitest.getPrototype();
        console.info('testGetPrototype0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testGetPrototype0001 err msg' + err.message);
        console.error('testGetPrototype0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetPrototype0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTGETPROTOTYPE_0200
     * @tc.desc   Testing GetPrototype NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPrototype0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetPrototype0002 START');
      try {
        let value = napitest.getPrototypeObjectNull();
        console.info('testGetPrototype0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetPrototype0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetPrototype0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTGETPROTOTYPE_0300
     * @tc.desc   Testing GetPrototype NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPrototype0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetPrototype0003 START');
      try {
        let value = napitest.getPrototypeResultNull();
        console.info('testGetPrototype0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetPrototype0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetPrototype0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTGETPROTOTYPE_0400
     * @tc.desc   Testing GetPrototype NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPrototype0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetPrototype0004 START');
      try {
        let value = napitest.getPrototypeNotObj();
        console.info('testGetPrototype0004 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetPrototype0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetTypedArrayInfo0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETTYPEDARRAYINFO_0100
     * @tc.desc   Testing GetTypedArrayInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTypedArrayInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetTypedArrayInfo0001 START');
      try {
        let value = napitest.getTypedArrayInfo();
        console.info('testGetTypedArrayInfo0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetTypedArrayInfo0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetTypedArrayInfo0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETTYPEDARRAYINFO_0200
     * @tc.desc   Testing GetTypedArrayInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetTypedArrayInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetTypedArrayInfo0002 START');
      try {
        let value = napitest.getTypedArrayInfoNull();
        console.info('testGetTypedArrayInfo0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetTypedArrayInfo0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetDataViewInfo0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETDATAVIEWINFO_0100
     * @tc.desc   Testing GetDataViewInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDataViewInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetDataViewInfo0001 START');
      try {
        let buffer = new ArrayBuffer(2);
        let dView = new DataView(buffer).setInt16(0, 256, true);
        let value = napitest.getDataViewInfo(dView);
        console.info('testGetDataViewInfo0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetDataViewInfo0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetDataViewInfo0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETDATAVIEWINFO_0200
     * @tc.desc   Testing GetDataViewInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDataViewInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetDataViewInfo0002 START');
      try {
        let value = napitest.getDataViewInfoNull();
        console.info('testGetDataViewInfo0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetDataViewInfo0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetDataViewInfo0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETDATAVIEWINFO_0300
     * @tc.desc   Testing GetDataViewInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetDataViewInfo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetDataViewInfo0003 START');
      try {
        let value = napitest.getDataViewInfoNotObj();
        console.info('testGetDataViewInfo0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetDataViewInfo0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueBool0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBOOL_0100
     * @tc.desc   Testing GetValueBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueBool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueBool0001 START');
      try {
        let value = napitest.getValueBool(false);
        console.info('testGetValueBool0001 value is: ' + value);
        expect(value).assertFalse();
      } catch (err) {
        console.error('testGetValueBool0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueBool0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBOOL_0200
     * @tc.desc   Testing GetValueBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueBool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueBool0002 START');
      try {
        let value = napitest.getValueBool(true);
        console.info('testGetValueBool0002 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testGetValueBool0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueBool0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBOOL_0300
     * @tc.desc   Testing GetValueBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueBool0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueBool0003 START');
      try {
        let value = napitest.getValueBoolValueNull(null);
        console.info('testGetValueBool0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueBool0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueBool0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBOOL_0400
     * @tc.desc   Testing GetValueBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueBool0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueBool0004 START');
      try {
        let value = napitest.getValueBoolResultNull(null);
        console.info('testGetValueBool0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueBool0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetBoolean0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETBOOLEAN_0100
     * @tc.desc   Testing GetBoolean NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBoolean0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetBoolean0001 START');
      try {
        let value = napitest.getBoolean(false);
        console.info('testGetBoolean0001 value is: ' + value);
        expect(value).assertFalse();
      } catch (err) {
        console.error('testGetBoolean0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetBoolean0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETBOOLEAN_0200
     * @tc.desc   Testing GetBoolean NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBoolean0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetBoolean0002 START');
      try {
        let value = napitest.getBoolean(true);
        console.info('testGetBoolean0002 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testGetBoolean0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetBoolean0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETBOOLEAN_0300
     * @tc.desc   Testing GetBoolean NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetBoolean0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetBoolean0003 START');
      try {
        let value = napitest.getBooleanNull(null);
        console.info('testGetBoolean0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetBoolean0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueDouble0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEDOUBLE_0100
     * @tc.desc   Testing GetValueDouble NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueDouble0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueDouble0001 START');
      try {
        let value = napitest.getValueDouble(24.5);
        console.info('testGetValueDouble0001 value is: ' + value);
        expect(value === 24.5).assertTrue();
      } catch (err) {
        console.error('testGetValueDouble0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueDouble0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEDOUBLE_0200
     * @tc.desc   Testing GetValueDouble NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueDouble0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueDouble0002 START');
      try {
        let value = napitest.getValueDoubleValueNull(null);
        console.info('testGetValueDouble0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueDouble0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueDouble0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEDOUBLE_0300
     * @tc.desc   Testing GetValueDouble NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueDouble0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueDouble0003 START');
      try {
        let value = napitest.getValueDoubleResultNull(null);
        console.info('testGetValueDouble0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueDouble0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueExternal0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEEXTERNAL_0100
     * @tc.desc   Testing GetValueExternal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueExternal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueExternal0001 START');
      try {
        let value = napitest.getValueExternal();
        console.info('testGetValueExternal0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetValueExternal0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueExternal0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEEXTERNAL_0200
     * @tc.desc   Testing GetValueExternal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueExternal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueExternal0002 START');
      try {
        let value = napitest.getValueExternalValueNull();
        console.info('testGetValueExternal0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueExternal0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueExternal0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEEXTERNAL_0300
     * @tc.desc   Testing GetValueExternal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueExternal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueExternal0003 START');
      try {
        let value = napitest.getValueExternalResultNull();
        console.info('testGetValueExternal0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueExternal0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueExternal0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEEXTERNAL_0400
     * @tc.desc   Testing GetValueExternal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueExternal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueExternal0004 START');
      try {
        let value = napitest.getValueExternalNotPtr();
        console.info('testGetValueExternal0004 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetValueExternal0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueStringLatin10001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGLATIN1_0100
     * @tc.desc   Testing GetValueStringLatin1 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueStringLatin10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueStringLatin10001 START');
      try {
        let value = napitest.getValueStringLatin1("tst");
        console.info('testGetValueStringLatin10001 value is: ' + value);
        expect(value).assertEqual("tst");
      } catch (err) {
        console.error('testGetValueStringLatin10001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueStringLatin10002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGLATIN1_0200
     * @tc.desc   Testing GetValueStringLatin1 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueStringLatin10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueStringLatin10002 START');
      try {
        let value = napitest.getValueStringLatin1Null(null);
        console.info('testGetValueStringLatin10002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueStringLatin10002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueStringUtf80001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF8_0100
     * @tc.desc   Testing GetValueStringUtf8 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueStringUtf80001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueStringUtf80001 START');
      try {
        let value = napitest.getValueStringUtf8("he");
        console.info('testGetValueStringUtf80001 value is: ' + value);
        expect(value).assertEqual("he");
      } catch (err) {
        console.error('testGetValueStringUtf80001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueStringUtf80002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF8_0200
     * @tc.desc   Testing GetValueStringUtf8 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueStringUtf80002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueStringUtf80002 START');
      try {
        let value = napitest.getValueStringUtf8Null(null);
        console.info('testGetValueStringUtf80002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueStringUtf80002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueStringUtf80003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF8_0300
     * @tc.desc   Testing GetValueStringUtf8 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueStringUtf80003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueStringUtf80003 START');
      try {
        let value = napitest.getValueStringUtf8NotStr(123);
        console.info('testGetValueStringUtf80003 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetValueStringUtf80003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueStringUtf160001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF16_0100
     * @tc.desc   Testing GetValueStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueStringUtf160001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueStringUtf160001 START');
      try {
        let value = napitest.getValueStringUtf16("he");
        console.info('testGetValueStringUtf160001 value is: ' + value);
        expect(value).assertEqual("he");
      } catch (err) {
        console.error('testGetValueStringUtf160001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueStringUtf160002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF16_0200
     * @tc.desc   Testing GetValueStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueStringUtf160002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueStringUtf160002 START');
      try {
        let value = napitest.getValueStringUtf16Null(null);
        console.info('testGetValueStringUtf160002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetValueStringUtf160002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueStringUtf160003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF16_0300
     * @tc.desc   Testing GetValueStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueStringUtf160003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueStringUtf160003 START');
      try {
        let value = napitest.getValueStringUtf16NotStr(123);
        console.info('testGetValueStringUtf160003 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetValueStringUtf160003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueUint320001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEUINT32_0100
     * @tc.desc   Testing GetValueUint32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueUint320001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueUint320001 START');
      try {
        let value = napitest.getValueUint32(12);
        console.info('testGetValueUint320001 value is: ' + value);
        expect(value).assertEqual(12);
      } catch (err) {
        console.error('testGetValueUint320001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetValueUint320002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEUINT32_0200
     * @tc.desc   Testing GetValueUint32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetValueUint320002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetValueUint320002 START');
      try {
        let value = napitest.getValueUint32Null(null);
        console.info('testGetValueUint320002 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetValueUint320002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetGlobal0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETGLOBAL_0100
     * @tc.desc   Testing GetGlobal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetGlobal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetGlobal0001 START');
      try {
        let value = napitest.getGlobal();
        console.info('testGetGlobal0001 value is: ' + value);
        expect(value === undefined).assertTrue();
      } catch (err) {
        console.error('testGetGlobal0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNull0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETNULL_0100
     * @tc.desc   Testing GetNull NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNull0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNull0001 START');
      try {
        let value = napitest.getNull();
        console.info('testGetNull0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetNull0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetUndefined0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETUNDEFINED_0100
     * @tc.desc   Testing GetUndefined NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUndefined0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetUndefined0001 START');
      try {
        let value = napitest.getUndefined();
        console.info('testGetUndefined0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetUndefined0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToBool0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOBOOL_0100
     * @tc.desc   Testing CoerceToBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToBool0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToBool0001 START');
      try {
        let value = napitest.coerceToBool(0);
        console.info('testCoerceToBool0001 value is: ' + value);
        expect(value).assertFalse();
      } catch (err) {
        console.error('testCoerceToBool0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToBool0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOBOOL_0200
     * @tc.desc   Testing CoerceToBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToBool0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToBool0002 START');
      try {
        let value = napitest.coerceToBool(1);
        console.info('testCoerceToBool0002 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testCoerceToBool0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToBool0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOBOOL_0500
     * @tc.desc   Testing CoerceToBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToBool0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToBool0005 START');
      try {
        let value = napitest.coerceToBoolValueNull(null);
        console.info('testCoerceToBool0005 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCoerceToBool0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToBool0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOBOOL_0600
     * @tc.desc   Testing CoerceToBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToBool0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToBool0006 START');
      try {
        let value = napitest.coerceToBoolResultNull(null);
        console.info('testCoerceToBool0006 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCoerceToBool0006 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToNumber0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETONUMBER_0200
     * @tc.desc   Testing CoerceToNumber NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToNumber0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToNumber0002 START');
      try {
        let value = napitest.coerceToNumber('12');
        console.info('testCoerceToNumber0002 value is: ' + value);
        expect(value).assertEqual(12);
      } catch (err) {
        console.error('testCoerceToNumber0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToNumber0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETONUMBER_0500
     * @tc.desc   Testing CoerceToNumber NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToNumber0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToNumber0005 START');
      try {
        let value = napitest.coerceToNumberValueNull(null);
        console.info('testCoerceToNumber0005 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCoerceToNumber0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToNumber0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETONUMBER_0600
     * @tc.desc   Testing CoerceToNumber NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToNumber0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToNumber0006 START');
      try {
        let value = napitest.coerceToNumberRstNull(null);
        console.info('testCoerceToNumber0006 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCoerceToNumber0006 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToObject0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOOBJECT_0100
     * @tc.desc   Testing CoerceToObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToObject0001 START');
      try {
        let value = napitest.coerceToObject([2, 3]);
        console.info('testCoerceToObject0001 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(obj).assertEqual('[2,3]');
      } catch (err) {
        console.error('testCoerceToObject0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToObject0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOOBJECT_0400
     * @tc.desc   Testing CoerceToObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToObject0004 START');
      try {
        let value = napitest.coerceToObject(undefined);
        console.info('testCoerceToObject0004 value is: ' + value);
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error('testCoerceToObject0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToObject0007
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOOBJECT_0700
     * @tc.desc   Testing CoerceToObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToObject0007 START');
      try {
        let value = napitest.coerceToObject(null);
        console.info('testCoerceToObject0007 value is: ' + value);
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error('testCoerceToObject0007 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToString0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0100
     * @tc.desc   Testing CoerceToString NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToString0001 START');
      try {
        let value = napitest.coerceToString(123);
        console.info('testCoerceToString0001 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(value).assertEqual('123');
      } catch (err) {
        console.error('testCoerceToString0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToString0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0200
     * @tc.desc   Testing CoerceToString NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToString0002 START');
      try {
        let value = napitest.coerceToString(undefined);
        console.info('testCoerceToString0002 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(value).assertEqual('undefined');
      } catch (err) {
        console.error('testCoerceToString0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToString0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0300
     * @tc.desc   Testing CoerceToString NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToString0003 START');
      try {
        let value = napitest.coerceToString(null);
        console.info('testCoerceToString0003 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(value).assertEqual('null');
      } catch (err) {
        console.error('testCoerceToString0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToString0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0400
     * @tc.desc   Testing CoerceToString NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToString0004 START');
      try {
        let value = napitest.coerceToString(true);
        console.info('testCoerceToString0004 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(value).assertEqual('true');
      } catch (err) {
        console.error('testCoerceToString0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToString0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0500
     * @tc.desc   Testing CoerceToString NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToString0005 START');
      try {
        let value = napitest.coerceToString(false);
        console.info('testCoerceToString0005 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(value).assertEqual('false');
      } catch (err) {
        console.error('testCoerceToString0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCoerceToString0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0600
     * @tc.desc   Testing CoerceToString NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCoerceToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCoerceToString0006 START');
      try {
        let value = napitest.coerceToString('123');
        console.info('testCoerceToString0006 value is: ' + value);
        let obj = JSON.stringify(value);
        expect(value).assertEqual('123');
      } catch (err) {
        console.error('testCoerceToString0006 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTypeOf0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TYPEOF_0100
     * @tc.desc   Testing InstanceOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testTypeOf0001 START');
      try {
        let value = napitest.typeOf('test');
        console.info('testTypeOf0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testTypeOf0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTypeOf0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TYPEOF_0200
     * @tc.desc   Testing InstanceOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeOf0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testTypeOf0002 START');
      try {
        let value = napitest.typeOfValueNull(null);
        console.info('testTypeOf0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testTypeOf0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTypeOf0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TYPEOF_0300
     * @tc.desc   Testing InstanceOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testTypeOf0003 START');
      try {
        let value = napitest.typeOfRstNull(null);
        console.info('testTypeOf0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testTypeOf0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testInstanceOf0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_INSTANCEOF_0100
     * @tc.desc   Testing InstanceOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInstanceOf0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testInstanceOf0001 START');
      try {
        let value = napitest.instanceOf();
        console.info('testInstanceOf0001 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testInstanceOf0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testInstanceOf0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_INSTANCEOF_0300
     * @tc.desc   Testing InstanceOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInstanceOf0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testInstanceOf0003 START');
      try {
        let value = napitest.instanceOfObjectNull();
        console.info('testInstanceOf0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testInstanceOf0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testInstanceOf0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_INSTANCEOF_0400
     * @tc.desc   Testing InstanceOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInstanceOf0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testInstanceOf0004 START');
      try {
        let value = napitest.instanceOfConstructorNull();
        console.info('testInstanceOf0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testInstanceOf0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testInstanceOf0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_INSTANCEOF_0500
     * @tc.desc   Testing InstanceOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testInstanceOf0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testInstanceOf0005 START');
      try {
        let value = napitest.instanceOfResultNull();
        console.info('testInstanceOf0005 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testInstanceOf0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsArray0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISARRAY_0100
     * @tc.desc   Testing IsArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsArray0001 START');
      try {
        let value = napitest.isArray();
        console.info('testIsArray0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testIsArray0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsArray0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISARRAY_0300
     * @tc.desc   Testing IsArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsArray0003 START');
      try {
        let value = napitest.isArrayValueNull(null);
        console.info('testIsArray0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsArray0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsArray0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISARRAY_0400
     * @tc.desc   Testing IsArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsArray0004 START');
      try {
        let value = napitest.isArrayResultNull(null);
        console.info('testIsArray0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsArray0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsDataView0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISDATAVIEW_0100
     * @tc.desc   Testing IsDataView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsDataView0001 START');
      try {
        let value = napitest.isDataView();
        console.info('testIsDataView0001 value is: ' + value);
        expect(value instanceof DataView).assertTrue();
        value.setInt16(1, 42);
        expect(value.getInt16(1)).assertEqual(42);
      } catch (err) {
        console.error('testIsDataView0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsDataView0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISDATAVIEW_0200
     * @tc.desc   Testing IsDataView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsDataView0002 START');
      try {
        let value = napitest.isDataViewValueNull();
        console.info('testIsDataView0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsDataView0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsDataView0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISDATAVIEW_0300
     * @tc.desc   Testing IsDataView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDataView0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsDataView0003 START');
      try {
        let value = napitest.isDataViewRstNull();
        console.info('testIsDataView0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsDataView0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsArrayBuffer0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISARRAYBUFFER_0100
     * @tc.desc   Testing IsArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsArrayBuffer0001 START');
      try {
        let value = napitest.isArrayBuffer();
        console.info('testIsArrayBuffer0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testIsArrayBuffer0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsArrayBuffer0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISARRAYBUFFER_0200
     * @tc.desc   Testing IsArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsArrayBuffer0002 START');
      try {
        let value = napitest.isArrayBufferValueNull();
        console.info('testIsArrayBuffer0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsArrayBuffer0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsArrayBuffer0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISARRAYBUFFER_0300
     * @tc.desc   Testing IsArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsArrayBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsArrayBuffer0003 START');
      try {
        let value = napitest.isArrayBufferRstNull();
        console.info('testIsArrayBuffer0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsArrayBuffer0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsTypedArray0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISTYPEDARRAY_0100
     * @tc.desc   Testing IsTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsTypedArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsTypedArray0001 START');
      try {
        let value = napitest.isTypedArray([123,456]);
        console.info('testIsTypedArray0001 value is: ' + value);
        console.info('testIsTypedArray0001 value is: ' + JSON.stringify(value));
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testIsTypedArray0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsTypedArray0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISTYPEDARRAY_0200
     * @tc.desc   Testing IsTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsTypedArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsTypedArray0002 START');
      try {
        let value = napitest.isTypedArrayValueNull(null);
        console.info('testIsTypedArray0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsTypedArray0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsTypedArray0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISTYPEDARRAY_0300
     * @tc.desc   Testing IsTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsTypedArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsTypedArray0003 START');
      try {
        let value = napitest.isTypedArrayRstNull(null);
        console.info('testIsTypedArray0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsTypedArray0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsDate0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISDATE_0100
     * @tc.desc   Testing IsDate NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsDate0001 START');
      try {
        const date1 = new Date('December 17, 1995 03:24:00');
        let value = napitest.isDate(date1);
        console.info('testIsDate0001 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testIsDate0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsDate0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISDATE_0200
     * @tc.desc   Testing IsDate NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsDate0002 START');
      try {
        const date1 = new Date('abc');
        let value = napitest.isDate(date1);
        console.info('testIsDate0002 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testIsDate0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsDate0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISDATE_0300
     * @tc.desc   Testing IsDate NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsDate0003 START');
      try {
        let value = napitest.isDateValueNull();
        console.info('testIsDate0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsDate0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsDate0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISDATE_0400
     * @tc.desc   Testing IsDate NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsDate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testIsDate0004 START');
      try {
        let value = napitest.isDateResultNull();
        console.info('testIsDate0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testIsDate0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStrictEquals0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0100
     * @tc.desc   Testing StrictEquals NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrictEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testStrictEquals0001 START');
      try {
        let value = napitest.strictEquals();
        console.info('testStrictEquals0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testStrictEquals0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStrictEquals0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0200
     * @tc.desc   Testing StrictEquals NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrictEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testStrictEquals0002 START');
      try {
        let value = napitest.strictEqualsFirstValueNull();
        console.info('testStrictEquals0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testStrictEquals0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStrictEquals0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0300
     * @tc.desc   Testing StrictEquals NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrictEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testStrictEquals0003 START');
      try {
        let value = napitest.strictEqualsSecondValueNull();
        console.info('testStrictEquals0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testStrictEquals0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStrictEquals0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0400
     * @tc.desc   Testing StrictEquals NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrictEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testStrictEquals0004 START');
      try {
        let value = napitest.strictEqualsNaN();
        console.info('testStrictEquals0004 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testStrictEquals0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testStrictEquals0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0400
     * @tc.desc   Testing IsDate NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testStrictEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testStrictEquals0004 START');
      try {
        let value = napitest.strictEqualsResultNull();
        console.info('testStrictEquals0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testStrictEquals0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetPropertyNames0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTYNAMES_0100
     * @tc.desc   Testing GetPropertyNames NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPropertyNames0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetPropertyNames0001 START');
      try {
        let value = napitest.getPropertyNames();
        console.info('testGetPropertyNames0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetPropertyNames0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetPropertyNames0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTYNAMES_0200
     * @tc.desc   Testing GetPropertyNames NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPropertyNames0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetPropertyNames0002 START');
      try {
        let value = napitest.getPropertyNamesObjectNull();
        console.info('testGetPropertyNames0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetPropertyNames0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetPropertyNames0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTYNAMES_0300
     * @tc.desc   Testing GetPropertyNames NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPropertyNames0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetPropertyNames0003 START');
      try {
        let value = napitest.getPropertyNamesResultNull();
        console.info('testGetPropertyNames0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetPropertyNames0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetPropertyNames0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTYNAMES_0400
     * @tc.desc   Testing GetPropertyNames NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetPropertyNames0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetPropertyNames0004 START');
      try {
        let value = napitest.getPropertyNamesNotObject();
        console.info('testGetPropertyNames0004 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetPropertyNames0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetProperty0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETPROPERTY_0100
     * @tc.desc   Testing SetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetProperty0001 START');
      try {
        let value = napitest.setProperty();
        console.info('testSetProperty0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testSetProperty0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetProperty0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETPROPERTY_0200
     * @tc.desc   Testing SetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetProperty0002 START');
      try {
        let value = napitest.setPropertyValueNull();
        console.info('testSetProperty0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetProperty0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetProperty0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETPROPERTY_0300
     * @tc.desc   Testing SetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetProperty0003 START');
      try {
        let value = napitest.setPropertyResultNull();
        console.info('testSetProperty0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetProperty0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetProperty0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETPROPERTY_0400
     * @tc.desc   Testing SetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetProperty0004 START');
      try {
        let value = napitest.setPropertyNoObject();
        console.info('testSetProperty0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetProperty0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetProperty0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0100
     * @tc.desc   Testing GetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetProperty0001 START');
      try {
        let value = napitest.getProperty();
        console.info('testGetProperty0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testGetProperty0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetProperty0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0200
     * @tc.desc   Testing GetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetProperty0002 START');
      try {
        let value = napitest.getPropertyObjectNull();
        console.info('testGetProperty0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetProperty0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetProperty0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0300
     * @tc.desc   Testing GetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetProperty0003 START');
      try {
        let value = napitest.getPropertyKeyNull();
        console.info('testGetProperty0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetProperty0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetProperty0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0400
     * @tc.desc   Testing GetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetProperty0004 START');
      try {
        let value = napitest.getPropertyResultNull();
        console.info('testGetProperty0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetProperty0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetProperty0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0500
     * @tc.desc   Testing GetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetProperty0005 START');
      try {
        let value = napitest.getPropertyNotObject();
        console.info('testGetProperty0005 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetProperty0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasProperty0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASPROPERTY_0100
     * @tc.desc   Testing HasProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasProperty0001 START');
      try {
        let value = napitest.hasProperty();
        console.info('testHasProperty0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testHasProperty0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });



    /**
     * @tc.name   testHasProperty0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASPROPERTY_0300
     * @tc.desc   Testing HasProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasProperty0003 START');
      try {
        let value = napitest.hasPropertyKeyNull();
        console.info('testHasProperty0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasProperty0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasProperty0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASPROPERTY_0400
     * @tc.desc   Testing HasProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasProperty0004 START');
      try {
        let value = napitest.hasPropertyResultNull();
        console.info('testHasProperty0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasProperty0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteProperty0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEPROPERTY_0100
     * @tc.desc   Testing DeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteProperty0001 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.setAndDeleteProperty(peop, 'a');
        console.info('testDeleteProperty0001 value is: ' + value);
        expect(value === 0).assertTrue();
      } catch (err) {
        console.error('testDeleteProperty0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteProperty0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEPROPERTY_0200
     * @tc.desc   Testing DeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteProperty0002 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.setAndDeleteProperty(peop, 'c');
        expect(value === 0).assertTrue();
      } catch (err) {
        console.error('testDeleteProperty0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteProperty0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEPROPERTY_0300
     * @tc.desc   Testing DeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteProperty0003 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.deletePropertyObjectNull(peop, null);
        console.info('testDeleteProperty0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDeleteProperty0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteProperty0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEPROPERTY_0400
     * @tc.desc   Testing DeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteProperty0004 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.deletePropertyKeyNull(peop, null);
        console.info('testDeleteProperty0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDeleteProperty0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasOwnProperty0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0100
     * @tc.desc   Testing HasOwnProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasOwnProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasOwnProperty0001 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasOwnProperty(peop, 'name');
        console.info('testHasOwnProperty0001 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testHasOwnProperty0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasOwnProperty0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0200
     * @tc.desc   Testing HasOwnProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasOwnProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasOwnProperty0002 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasOwnProperty(peop, 'c');
        console.info('testHasOwnProperty0002 value is: ' + value);
        expect(value).assertFalse();
      } catch (err) {
        console.error('testHasOwnProperty0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasOwnProperty0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0300
     * @tc.desc   Testing HasOwnProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasOwnProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasOwnProperty0003 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasOwnPropertyObjectNull(peop, null);
        console.info('testHasOwnProperty0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasOwnProperty0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasOwnProperty0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0400
     * @tc.desc   Testing HasOwnProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasOwnProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasOwnProperty0004 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasOwnPropertyKeytNull(peop, null);
        console.info('testHasOwnProperty0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasOwnProperty0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasOwnProperty0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0500
     * @tc.desc   Testing HasOwnProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasOwnProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasOwnProperty0005 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasOwnPropertyResultNull(peop, null);
        console.info('testHasOwnProperty0005 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasOwnProperty0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetNamedProperty0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0100
     * @tc.desc   Testing SetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamedProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetNamedProperty0001 START');
      try {
        let value = napitest.setNamedProperty([1, 2], "e", false);
        console.info('testSetNamedProperty0001 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testSetNamedProperty0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetNamedProperty0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0200
     * @tc.desc   Testing SetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamedProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetNamedProperty0002 START');
      try {
        let value = napitest.setNamedPropertyObjectNull([1, 2], "e", false);
        console.info('testSetNamedProperty0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetNamedProperty0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetNamedProperty0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0300
     * @tc.desc   Testing SetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamedProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetNamedProperty0003 START');
      try {
        let value = napitest.setNamedPropertyKeyNull([1, 2], "e", false);
        console.info('testSetNamedProperty0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetNamedProperty0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetNamedProperty0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0400
     * @tc.desc   Testing SetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetNamedProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetNamedProperty0004 START');
      try {
        let value = napitest.setNamedPropertyResultNull([1, 2], "e", false);
        console.info('testSetNamedProperty0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetNamedProperty0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNamedProperty0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0100
     * @tc.desc   Testing GetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNamedProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNamedProperty0001 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.getNamedProperty(peop, "name");
        console.info('testGetNamedProperty0001 value is: ' + value);
        expect(value).assertEqual('zhangsan');
      } catch (err) {
        console.error('testGetNamedProperty0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNamedProperty0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0200
     * @tc.desc   Testing GetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNamedProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNamedProperty0002 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.getNamedProperty(peop, "age");
        console.info('testGetNamedProperty0002 value is: ' + value);
        expect(value).assertEqual(18);
      } catch (err) {
        console.error('testGetNamedProperty0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNamedProperty0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0400
     * @tc.desc   Testing GetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNamedProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNamedProperty0004 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.getNamedPropertyKeyNull(peop, null);
        console.info('testGetNamedProperty0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetNamedProperty0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNamedProperty0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0500
     * @tc.desc   Testing GetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNamedProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNamedProperty0005 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.getNamedPropertyResultNull(peop, null);
        console.info('testGetNamedProperty0005 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetNamedProperty0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasNamedProperty0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0100
     * @tc.desc   Testing HasNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasNamedProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasNamedProperty0001 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasNamedProperty(peop, "name");
        console.info('testHasNamedProperty0001 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testHasNamedProperty0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasNamedProperty0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0200
     * @tc.desc   Testing HasNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasNamedProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasNamedProperty0002 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasNamedProperty(peop, "age");
        console.info('testHasNamedProperty0002 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testHasNamedProperty0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasNamedProperty0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0300
     * @tc.desc   Testing HasNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasNamedProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasNamedProperty0003 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasNamedPropertyObjectNull(peop, null);
        console.info('testHasNamedProperty0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasNamedProperty0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasNamedProperty0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0400
     * @tc.desc   Testing HasNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasNamedProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasNamedProperty0004 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasNamedPropertyKeyNull(peop, null);
        console.info('testHasNamedProperty0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasNamedProperty0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasNamedProperty0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0500
     * @tc.desc   Testing HasNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasNamedProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasNamedProperty0005 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.hasNamedPropertyResultNull(peop, null);
        console.info('testHasNamedProperty0005 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasNamedProperty0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetElement0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETELEMENT_0100
     * @tc.desc   Testing SetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetElement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetElement0001 START');
      try {
        let value = napitest.setElement();
        console.info('testSetElement0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testSetElement0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetElement0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETELEMENT_0200
     * @tc.desc   Testing SetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetElement0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetElement0002 START');
      try {
        let value = napitest.setElementObjectNull();
        console.info('testSetElement0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetElement0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetElement0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETELEMENT_0300
     * @tc.desc   Testing SetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetElement0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetElement0003 START');
      try {
        let value = napitest.setElementRstNull();
        console.info('testSetElement0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetElement0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testSetElement0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SETELEMENT_0400
     * @tc.desc   Testing SetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testSetElement0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testSetElement0004 START');
      try {
        let value = napitest.setElementNotObj();
        console.info('testSetElement0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testSetElement0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testGetElement0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETELEMENT_0100
     * @tc.desc   Testing GetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetElement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetElement0001 START');
      try {
        let value = napitest.getElement();
        console.info('testGetElement0001 value is: ' + value);
        expect(typeof (value)).assertEqual('object');
      } catch (err) {
        console.error('testGetElement0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetElement0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETELEMENT_0200
     * @tc.desc   Testing GetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetElement0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetElement0002 START');
      try {
        let value = napitest.getElementObjNull();
        console.info('testGetElement0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetElement0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetElement0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETELEMENT_0300
     * @tc.desc   Testing GetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetElement0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetElement0003 START');
      try {
        let value = napitest.getElementRstNull();
        console.info('testGetElement0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetElement0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetElement0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETELEMENT_0400
     * @tc.desc   Testing GetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetElement0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetElement0004 START');
      try {
        let value = napitest.getElementNotObj();
        console.info('testGetElement0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetElement0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasElement0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASELEMENT_0100
     * @tc.desc   Testing HasElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasElement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasElement0001 START');
      try {
        let value = napitest.hasElement();
        console.info('testHasElement0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testHasElement0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasElement0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASELEMENT_0200
     * @tc.desc   Testing HasElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasElement0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasElement0002 START');
      try {
        let value = napitest.hasElementObjNull();
        console.info('testHasElement0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasElement0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testHasElement0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASELEMENT_0300
     * @tc.desc   Testing HasElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testHasElement0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testHasElement0003 START');
      try {
        let value = napitest.hasElementRstNull();
        console.info('testHasElement0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testHasElement0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteElement0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0100
     * @tc.desc   Testing DeleteElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteElement0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteElement0001 START');
      try {
        let value = napitest.deleteElement();
        console.info('testDeleteElement0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testDeleteElement0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteElement0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0200
     * @tc.desc   Testing DeleteElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteElement0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteElement0002 START');
      try {
        let value = napitest.deleteElementObjNull();
        console.info('testDeleteElement0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDeleteElement0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteElement0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0300
     * @tc.desc   Testing DeleteElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteElement0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteElement0003 START');
      try {
        let value = napitest.deleteElementRstNull();
        console.info('testDeleteElement0003 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testDeleteElement0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineProperties0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0100
     * @tc.desc   Testing DefineProperties NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineProperties0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineProperties0001 START');
      try {
        let value = napitest.defineProperties();
        console.info('testDefineProperties0001 value is: ' + value);
        expect(value instanceof Object).assertTrue();
      } catch (err) {
        console.error('testDefineProperties0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineProperties0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0200
     * @tc.desc   Testing DefineProperties NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineProperties0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineProperties0002 START');
      try {
        let value = napitest.definePropertiesObjNull();
        console.info('testDefineProperties0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDefineProperties0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTypeTag0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TypeTag_0100
     * @tc.desc   Testing typeTag NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeTag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testTypeTag0001 START');
      try {
        let obj1 = napitest.typeTaggedInstance(0);
        let obj2 = napitest.typeTaggedInstance(1);
        let obj3 = napitest.typeTaggedInstance(2);
        let obj4 = napitest.typeTaggedInstance(3);
        let isTag = napitest.checkTypeTag(0, obj1);
        let isTag1 = napitest.checkTypeTag(1, obj2);
        let isTag2 = napitest.checkTypeTag(2, obj3);
        let isTag3 = napitest.checkTypeTag(3, obj4);
        expect(isTag).assertTrue();
        expect(isTag1).assertTrue();
        expect(isTag2).assertTrue();
        expect(isTag3).assertTrue();
      } catch (err) {
        console.error('testTypeTag0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTypeTag0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TypeTag_0200
     * @tc.desc   Testing typeTag NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeTag0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testTypeTag0002 START');
      try {
        let value = napitest.typeTaggedObjNull();
        console.info('testTypeTag0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testTypeTag0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testTypeTag0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TypeTag_0300
     * @tc.desc   Testing typeTag NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTypeTag0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testTypeTag0003 START');
      try {
        let value = napitest.typeTaggedTagNull('null');
        console.info('testTypeTag0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testTypeTag0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCheckTypeTag0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CHECKTYPETAG_0100
     * @tc.desc   Testing CheckTypeTag NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckTypeTag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCheckTypeTag0001 START');
      try {
        let obj1 = napitest.typeTaggedInstance(0);
        let obj2 = napitest.typeTaggedInstance(1);
        let isTag = napitest.checkTypeTag(1, obj1);
        let isTag1 = napitest.checkTypeTag(0, obj2);
        console.info('testCheckTypeTag0001 testString isTag is: ' + isTag);
        console.info('testCheckTypeTag0001 testString isTag1 is: ' + isTag1);
        expect(isTag).assertFalse();
        expect(isTag1).assertFalse();
      } catch (err) {
        console.error('testCheckTypeTag0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCheckTypeTag0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CHECKTYPETAG_0200
     * @tc.desc   Testing CheckTypeTag NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckTypeTag0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCheckTypeTag0002 START');
      try {
        let value = napitest.CheckTypeTagObjNull(1,null);
        console.info('testCheckTypeTag0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCheckTypeTag0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCheckTypeTag0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CHECKTYPETAG_0300
     * @tc.desc   Testing CheckTypeTag NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckTypeTag0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCheckTypeTag0003 START');
      try {
        let value = napitest.CheckTypeTagTagNull(1,null);
        console.info('testCheckTypeTag0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCheckTypeTag0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCheckTypeTag0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CHECKTYPETAG_0400
     * @tc.desc   Testing CheckTypeTag NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCheckTypeTag0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCheckTypeTag0004 START');
      try {
        let value = napitest.CheckTypeTagRstNull(1,null);
        console.info('testCheckTypeTag0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCheckTypeTag0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCallFunction0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CALLFUNCTION_0100
     * @tc.desc   Testing CallFunction NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCallFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCallFunction0001 START');
      try {
        let value = napitest.callFunctionNull(null);
        console.info('testCallFunction0001 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCallFunction0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateFunction0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEFUNCTION_0100
     * @tc.desc   Testing CreateFunction NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateFunction0001 START');
      try {
        let value = napitest.napiCreateFunctionFuncNull();
        console.info('testCreateFunction0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateFunction0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateFunction0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEFUNCTION_0200
     * @tc.desc   Testing CreateFunction NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateFunction0002 START');
      try {
        let value = napitest.napiCreateFunctionRstNull();
        console.info('testCreateFunction0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateFunction0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetCbInfo0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETCBINFO_0100
     * @tc.desc   Testing GetCbInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCbInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetCbInfo0001 START');
      try {
        let value = napitest.napiGetCbInfo(12.06);
        console.info('testGetCbInfo0001 value is: ' + value);
        expect(value == 12.06).assertTrue
      } catch (err) {
        console.error('testGetCbInfo0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetCbInfo0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETCBINFO_0200
     * @tc.desc   Testing GetCbInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetCbInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetCbInfo0002 START');
      try {
        let value = napitest.napiGetCbInfoNull('null');
        console.info('testGetCbInfo0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetCbInfo0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNewInstance0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETNEWINSTANCE_0100
     * @tc.desc   Testing GetNewInstance NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNewInstance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNewInstance0001 START');
      try {
        let value = napitest.napiNewInstance();
        console.info('testGetNewInstance0001 testString result is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testGetNewInstance0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNewInstance0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETNEWINSTANCE_0200
     * @tc.desc   Testing GetNewInstance NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNewInstance0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNewInstance0002 START');
      try {
        let value = napitest.newInstanceNull();
        console.info('testGetNewInstance0002 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testGetNewInstance0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineClass0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0100
     * @tc.desc   Testing DefineClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineClass0001 START');
      try {
        let value = napitest.napiDefineClass();
        console.info('testDefineClass0001 testString result is: ' + value);
        expect(value).assertEqual(0)
      } catch (err) {
        console.error('testDefineClass0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineClass0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0200
     * @tc.desc   Testing DefineClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineClass0002 START');
      try {
        let value = napitest.defineClassUTFNull();
        console.info('testDefineClass0002 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDefineClass0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineClass0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0300
     * @tc.desc   Testing DefineClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineClass0003 START');
      try {
        let value = napitest.defineClassConstructorNull();
        console.info('testDefineClass0003 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDefineClass0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineClass0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0400
     * @tc.desc   Testing DefineClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineClass0004 START');
      try {
        let value = napitest.defineClassRstNull();
        console.info('testDefineClass0004 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDefineClass0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineClass0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0500
     * @tc.desc   Testing DefineClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineClass0005 START');
      try {
        let value = napitest.defineClassLengthExceed();
        console.info('testDefineClass0005 testString result is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testDefineClass0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testUnwrap0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_UNWRAP_0100
     * @tc.desc   Testing Unwrap NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnwrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testUnwrap0001 START');
      try {
        let value = napitest.unwrap();
        console.info('testUnwrap0001 testString result is: ' + value);
        expect(value).assertEqual(0)
      } catch (err) {
        console.error('testUnwrap0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testUnwrap0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_UNWRAP_0200
     * @tc.desc   Testing Unwrap NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnwrap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testUnwrap0002 START');
      try {
        let value = napitest.unwrapObjNull();
        console.info('testUnwrap0002 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testUnwrap0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testUnwrap0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_UNWRAP_0300
     * @tc.desc   Testing Unwrap NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testUnwrap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testUnwrap0003 START');
      try {
        let value = napitest.unwrapRstNull();
        console.info('testUnwrap0003 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testUnwrap0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testRemoveWrap0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAP_0100
     * @tc.desc   Testing RemoveWrap NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveWrap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testRemoveWrap0001 START');
      try {
        let value = napitest.removeWrap();
        console.info('testRemoveWrap0001 testString result is: ' + value);
        expect(value).assertEqual(0)
      } catch (err) {
        console.error('testRemoveWrap0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testRemoveWrap0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAP_0200
     * @tc.desc   Testing RemoveWrap NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveWrap0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testRemoveWrap0002 START');
      try {
        let value = napitest.removeWrapObjNull(null);
        console.info('testRemoveWrap0002 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testRemoveWrap0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testRemoveWrap0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAP_0300
     * @tc.desc   Testing RemoveWrap NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveWrap0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testRemoveWrap0003 START');
      try {
        let value = napitest.removeWrapRstNull(null);
        console.info('testRemoveWrap0003 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testRemoveWrap0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCancelAsyncWork0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CANCELASYNCWORK_0100
     * @tc.desc   Testing CancelAsyncWork NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCancelAsyncWork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCancelAsyncWork0001 START');
      try {
        let value = napitest.napiCancelAsyncWork();
        console.info('testCancelAsyncWork0001 testString result is: ' + value);
        expect(value).assertEqual(0)
      } catch (err) {
        console.error('testCancelAsyncWork0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCancelAsyncWork0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CANCELASYNCWORK_0200
     * @tc.desc   Testing CancelAsyncWork NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCancelAsyncWork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCancelAsyncWork0002 START');
      try {
        let value = napitest.cancelAsyncWorkNull();
        console.info('testCancelAsyncWork0002 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCancelAsyncWork0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testQueueAsyncWork0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_QUEUEASYNCWORK_0100
     * @tc.desc   Testing queueAsyncWork NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueAsyncWork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testQueueAsyncWork0001 START');
      try {
        let value = napitest.queueAsyncWork();
        console.info('testQueueAsyncWork0001 testString result is: ' + value);
        expect(value).assertEqual(undefined)
      } catch (err) {
        console.error('testQueueAsyncWork0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testQueueAsyncWork0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_QUEUEASYNCWORK_0200
     * @tc.desc   Testing queueAsyncWork NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testQueueAsyncWork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testQueueAsyncWork0002 START');
      try {
        let value = napitest.queueAsyncWorkNull();
        console.info('testQueueAsyncWork0002 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testQueueAsyncWork0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteAsyncWork0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEASYNCWORK_0100
     * @tc.desc   Testing DeleteAsyncWork NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteAsyncWork0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteAsyncWork0001 START');
      try {
        let value = napitest.deleteAsyncWork();
        console.info('testDeleteAsyncWork0001 testString result is: ' + value);
        expect(value).assertEqual(0)
      } catch (err) {
        console.error('testDeleteAsyncWork0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDeleteAsyncWork0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DELETEASYNCWORK_0200
     * @tc.desc   Testing DeleteAsyncWork NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDeleteAsyncWork0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDeleteAsyncWork0002 START');
      try {
        let value = napitest.deleteAsyncWorkNull();
        console.info('testDeleteAsyncWork0002 testString result is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDeleteAsyncWork0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineSendableClass0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINESENDABLECLASS_0200
     * @tc.desc   Testing DefineSendableClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineSendableClass0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineSendableClass0002 START');
      try {
        let value = napitest.defineSendableClassEnvNull();
        console.info('testDefineSendableClass0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testDefineSendableClass0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineSendableClass0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINESENDABLECLASS_0300
     * @tc.desc   Testing DefineSendableClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineSendableClass0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineSendableClass0003 START');
      try {
        let value = napitest.defineSendableClassNameNull();
        console.info('testDefineSendableClass0003 value is: ' + value);
        expect(value).assertEqual(1)
      } catch (err) {
        console.error('testDefineSendableClass0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineSendableClass0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINESENDABLECLASS_0400
     * @tc.desc   Testing DefineSendableClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineSendableClass0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineSendableClass0004 START');
      try {
        let value = napitest.defineSendableClassConstructorNull();
        console.info('testDefineSendableClass0004 value is: ' + value);
        expect(value).assertEqual(1)
      } catch (err) {
        console.error('testDefineSendableClass0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testDefineSendableClass0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DEFINESENDABLECLASS_0500
     * @tc.desc   Testing DefineSendableClass NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testDefineSendableClass0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testDefineSendableClass0005 START');
      try {
        let value = napitest.defineSendableClassRstNull();
        console.info('testDefineSendableClass0005 value is: ' + value);
        expect(value).assertEqual(1)
      } catch (err) {
        console.error('testDefineSendableClass0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableObjectWithProperties0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEOBJECTWITHPROPERTIES_0100
     * @tc.desc   Testing CreateSendableObjectWithProperties NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableObjectWithProperties0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableObjectWithProperties0001 START');
      try {
        let value = napitest.createSendableObjectWithProperties();
        console.info('testCreateSendableObjectWithProperties0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateSendableObjectWithProperties0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableObjectWithProperties0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEOBJECTWITHPROPERTIES_0200
     * @tc.desc   Testing CreateSendableObjectWithProperties NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableObjectWithProperties0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableObjectWithProperties0002 START');
      try {
        let value = napitest.createSendableObjectWithPropertiesEnvNull();
        console.info('testCreateSendableObjectWithProperties0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableObjectWithProperties0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableObjectWithProperties0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEOBJECTWITHPROPERTIES_0300
     * @tc.desc   Testing CreateSendableObjectWithProperties NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableObjectWithProperties0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableObjectWithProperties0003 START');
      try {
        let value = napitest.createSendableObjectWithPropertiesRstNull();
        console.info('testCreateSendableObjectWithProperties0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableObjectWithProperties0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateSendableArray0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESENDABLEARRAY_0100
     * @tc.desc   Testing NapiCreateSendableArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreateSendableArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testNapiCreateSendableArray0001 START');
      try {
        let value = napitest.NapiCreateSendableArray();
        console.info('testNapiCreateSendableArray0001 value is: ' + value);
        expect(napitest.NapiIsSendable(value)).assertEqual(true);
        expect(value.length).assertEqual(0);
      } catch (err) {
        console.error('testNapiCreateSendableArray0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateSendableArray0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESENDABLEARRAY_0200
     * @tc.desc   Testing NapiCreateSendableArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreateSendableArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testNapiCreateSendableArray0002 START');
      try {
        let value = napitest.createSendableArrayEnvNull();
        console.info('testNapiCreateSendableArray0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testNapiCreateSendableArray0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateSendableArray0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESENDABLEARRAY_0300
     * @tc.desc   Testing NapiCreateSendableArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreateSendableArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testNapiCreateSendableArray0003 START');
      try {
        let value = napitest.createSendableArrayRstNull();
        console.info('testNapiCreateSendableArray0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testNapiCreateSendableArray0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableArrayWithLength0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYWITHLENGTH_0100
     * @tc.desc   Testing CreateSendableArrayWithLength NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableArrayWithLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableArrayWithLength0001 START');
      try {
        let value = napitest.NapiCreateSendableArrayWithLength();
        console.info('testCreateSendableArrayWithLength0001 value is: ' + value);
        expect(napitest.NapiIsSendable(value)).assertEqual(true);
        expect(value.length).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableArrayWithLength0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableArrayWithLength0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYWITHLENGTH_0200
     * @tc.desc   Testing CreateSendableArrayWithLength NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableArrayWithLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableArrayWithLength0002 START');
      try {
        let value = napitest.createSendableArrayWithLengthEnvNull();
        console.info('testCreateSendableArrayWithLength0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableArrayWithLength0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableArrayWithLength0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYWITHLENGTH_0300
     * @tc.desc   Testing CreateSendableArrayWithLength NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableArrayWithLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableArrayWithLength0003 START');
      try {
        let value = napitest.createSendableArrayWithLengthRstNull();
        console.info('testCreateSendableArrayWithLength0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableArrayWithLength0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableArrayBuffer0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYBUFFER_0100
     * @tc.desc   Testing CreateSendableArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableArrayBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableArrayBuffer0001 START');
      try {
        let value = napitest.createSendableArrayBufferEnvNull();
        console.info('testCreateSendableArrayBuffer0001 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableArrayBuffer0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableArrayBuffer0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYBUFFER_0200
     * @tc.desc   Testing CreateSendableArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableArrayBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableArrayBuffer0002 START');
      try {
        let value = napitest.createSendableArrayBufferDataNull();
        console.info('testCreateSendableArrayBuffer0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableArrayBuffer0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableArrayBuffer0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYBUFFER_0300
     * @tc.desc   Testing CreateSendableArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableArrayBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableArrayBuffer0003 START');
      try {
        let value = napitest.createSendableArrayBufferRstNull();
        console.info('testCreateSendableArrayBuffer0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableArrayBuffer0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableTypedArray0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0100
     * @tc.desc   Testing CreateSendableTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableTypedArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableTypedArray0001 START');
      try {
        let value = napitest.NapiCreateSendableTypedArray();
        console.info('testCreateSendableTypedArray0001 value is: ' + value);
        expect(napitest.NapiIsSendable(value)).assertEqual(true);
        expect(value.byteLength).assertEqual(1024);
      } catch (err) {
        console.error('testCreateSendableTypedArray0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableTypedArray0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0200
     * @tc.desc   Testing CreateSendableTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableTypedArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableTypedArray0002 START');
      try {
        let value = napitest.createSendableTypedArrayEnvNull();
        console.info('testCreateSendableTypedArray0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableTypedArray0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableTypedArray0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0300
     * @tc.desc   Testing CreateSendableTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableTypedArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableTypedArray0003 START');
      try {
        let value = napitest.createSendableTypedArraRstNull();
        console.info('testCreateSendableTypedArray0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableTypedArray0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableTypedArray0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0400
     * @tc.desc   Testing CreateSendableTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableTypedArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableTypedArray0004 START');
      try {
        let value = napitest.createSendableTypedArraBufferNull();
        console.info('testCreateSendableTypedArray0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableTypedArray0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableTypedArray0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0500
     * @tc.desc   Testing CreateSendableTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableTypedArray0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableTypedArray0005 START');
      try {
        let value = napitest.createSendableTypedArrayNotBuffer();
        console.info('testCreateSendableTypedArray0005 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateSendableTypedArray0005 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateSendableTypedArray0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0600
     * @tc.desc   Testing CreateSendableTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateSendableTypedArray0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateSendableTypedArray0006 START');
      try {
        let value = napitest.createSendableTypedArrayNotType();
        console.info('testCreateSendableTypedArray0006 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateSendableTypedArray0006 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testWrapSendable0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLE_0100
     * @tc.desc   Testing WrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrapSendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testWrapSendable0001 START');
      try {
        let value = napitest.napiWrapSendableTest();
        console.info('testWrapSendable0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testWrapSendable0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testWrapSendable0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLE_0200
     * @tc.desc   Testing WrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrapSendable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testWrapSendable0002 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.wrapSendableEnvNull(peop, null);
        console.info('testWrapSendable0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testWrapSendable0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testWrapSendable0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLE_0300
     * @tc.desc   Testing WrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrapSendable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testWrapSendable0003 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.NapiWrapSendableObj1Null(peop, null);
        console.info('testWrapSendable0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testWrapSendable0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testWrapSendable0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLE_0400
     * @tc.desc   Testing WrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrapSendable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testWrapSendable0004 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.NapiWrapSendableObj2Null(peop, null);
        console.info('testWrapSendable0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testWrapSendable0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testWrapSendableWithSize0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLEWITHSIZE_0100
     * @tc.desc   Testing WrapSendableWithSize NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrapSendableWithSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testWrapSendableWithSize0001 START');
      try {
        let value = napitest.napiWrapSendableWithSizeTest();
        console.info('testWrapSendableWithSize0001 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testWrapSendableWithSize0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testWrapSendableWithSize0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLEWITHSIZE_0200
     * @tc.desc   Testing WrapSendableWithSize NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrapSendableWithSize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testWrapSendableWithSize0002 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.wrapSendableWithSizeEnvNull(peop, null);
        console.info('testWrapSendableWithSize0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testWrapSendableWithSize0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testWrapSendableWithSize0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLEWITHSIZE_0300
     * @tc.desc   Testing WrapSendableWithSize NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrapSendableWithSize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testWrapSendableWithSize0003 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.wrapSendableWithSizeObj1Null(peop, null);
        console.info('testWrapSendableWithSize0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testWrapSendableWithSize0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testWrapSendableWithSize0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLEWITHSIZE_0400
     * @tc.desc   Testing WrapSendableWithSize NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testWrapSendableWithSize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testWrapSendableWithSize0004 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.wrapSendableWithSizeObj2Null(peop, null);
        console.info('testWrapSendableWithSize0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testWrapSendableWithSize0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testRemoveWrapSendable0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAPSENDABLE_0100
     * @tc.desc   Testing RemoveWrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveWrapSendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testRemoveWrapSendable0001 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.NapiRemoveWrapSendable(peop);
        console.info('testRemoveWrapSendable0001 value is: ' + value);
        expect(value).assertEqual(undefined);
      } catch (err) {
        console.error('testRemoveWrapSendable0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testRemoveWrapSendable0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAPSENDABLE_0200
     * @tc.desc   Testing RemoveWrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveWrapSendable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testRemoveWrapSendable0002 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.removeWrapSendableEnvNull(peop);
        console.info('testRemoveWrapSendable0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testRemoveWrapSendable0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testRemoveWrapSendable0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAPSENDABLE_0300
     * @tc.desc   Testing RemoveWrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveWrapSendable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testRemoveWrapSendable0003 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.removeWrapSendableObjNull(peop);
        console.info('testRemoveWrapSendable0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testRemoveWrapSendable0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testRemoveWrapSendable0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAPSENDABLE_0400
     * @tc.desc   Testing RemoveWrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testRemoveWrapSendable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testRemoveWrapSendable0004 START');
      try {
        let peop:Person = {
          name: 'zhangsan',
          age: 18
        }
        let value = napitest.removeWrapSendableRstNull(peop);
        console.info('testRemoveWrapSendable0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testRemoveWrapSendable0004 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNodeVersion0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETNODEVERSION_0200
     * @tc.desc   Testing GetNodeVersion NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNodeVersion0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNodeVersion0002 START');
      try {
        let value = napitest.getNodeVersionEnvNull();
        console.info('testGetNodeVersion0002 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetNodeVersion0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetNodeVersion0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETNODEVERSION_0300
     * @tc.desc   Testing GetNodeVersion NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetNodeVersion0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testGetNodeVersion0003 START');
      try {
        let value = napitest.getNodeVersionRstNull();
        console.info('testGetNodeVersion0003 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testGetNodeVersion0003 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testReleaseThreadsafeFunction0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_RELEASETHREADSAFEFUNCTION_0100
     * @tc.desc   Testing ReleaseThreadsafeFunction NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReleaseThreadsafeFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testReleaseThreadsafeFunction0001 START');
      try {
        let value = napitest.releaseThreadsafeFunction();
        console.info('testReleaseThreadsafeFunction0001 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testReleaseThreadsafeFunction0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testReleaseThreadsafeFunction0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_RELEASETHREADSAFEFUNCTION_0200
     * @tc.desc   Testing ReleaseThreadsafeFunction NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testReleaseThreadsafeFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testReleaseThreadsafeFunction0002 START');
      try {
        let value = napitest.releaseThreadsafeFunctionNull();
        console.info('testReleaseThreadsafeFunction0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testReleaseThreadsafeFunction0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateThreadsafeFunction0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETHREADSAFEFUNCTION_0100
     * @tc.desc   Testing createThreadsafeFunction NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateThreadsafeFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateThreadsafeFunction0001 START');
      try {
        let value = napitest.createThreadsafeFunctionMaxQueueSizeNegative();
        console.info('testCreateThreadsafeFunction0001 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateThreadsafeFunction0001 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testCreateThreadsafeFunction0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETHREADSAFEFUNCTION_0200
     * @tc.desc   Testing createThreadsafeFunction NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCreateThreadsafeFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testCreateThreadsafeFunction0002 START');
      try {
        let value = napitest.createThreadsafeFunctionInitialThreadCountNegative();
        console.info('testCreateThreadsafeFunction0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('testCreateThreadsafeFunction0002 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetVersion0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_VERSION_0100
     * @tc.desc   Testing napi_get_version interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiGetVersion0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testNapiGetVersion0001";
      console.info(`${TAG} START`);
      try {
        let value = napitest.getVersion();
        console.info(`${TAG} testString result is: ` + value + "--" + JSON.stringify(value));
        expect(value).assertEqual(8);
      } catch (err) {
        console.error(`${TAG} err is`, err)
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetVersion0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_VERSION_0200
     * @tc.desc   Testing napi_get_version interface with nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiGetVersion0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testNapiGetVersion0002";
      console.info(`${TAG} START`);
      try {
        let value = napitest.getVersionRstNull();
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetVersion0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_VERSION_0300
     * @tc.desc   Testing napi_get_version interface with nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiGetVersion0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testNapiGetVersion0003";
      console.info(`${TAG} START`);
      try {
        let value = napitest.getVersionEnvNull();
        console.info('testNapiGetVersion0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreatePromise0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_PROMISE_0100
     * @tc.desc   Testing napi_create_promise interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreatePromise0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testNapiCreatePromise0001";
      console.info(`${TAG} START`);
      try {
        let value = napitest.createPromise();
        console.info(`${TAG} testString result is: ` + value + "--" + JSON.stringify(value));
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreatePromise0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_PROMISE_0200
     * @tc.desc   Testing napi_create_promise interface with nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreatePromise0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testNapiCreatePromise0002";
      console.info(`${TAG} START`);
      try {
        let value = napitest.createPromiseEnvNull();
        console.info('testNapiCreatePromise0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreatePromise0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_PROMISE_0300
     * @tc.desc   Testing napi_create_promise interface with nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreatePromise0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testNapiCreatePromise0003";
      console.info(`${TAG} START`);
      try {
        let value = napitest.createPromiseDeferredNull();
        console.info('testNapiCreatePromise0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreatePromise0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_PROMISE_0400
     * @tc.desc   Testing napi_create_promise interface with nullptr.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testNapiCreatePromise0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testNapiCreatePromise0004";
      console.info(`${TAG} START`);
      try {
        let value = napitest.createPromiseDeferredNull();
        console.info('testNapiCreatePromise0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testResolveAndRejectDeferred0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_RESOLVEANDREJECTDEFERRED_0100
     * @tc.desc   Testing resolveAndRejectDeferred NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResolveAndRejectDeferred0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testResolveAndRejectDeferred0001";
      console.info(`${TAG} START`);
      try {
        let value = napitest.resolveAndRejectDeferred();
        console.info(`${TAG} testString result is: ` + value + "--" + JSON.stringify(value));
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testResolveDeferred0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_RESOLVEDEFERRED_0100
     * @tc.desc   Testing ResolveDeferred NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResolveDeferred0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testResolveDeferred0001";
      console.info(`${TAG} START`);
      try {
        let value = napitest.resolveDeferredEnvNull();
        console.info('testResolveDeferred0001 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testResolveDeferred0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_RESOLVEDEFERRED_0200
     * @tc.desc   Testing ResolveDeferred NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testResolveDeferred0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testResolveDeferred0002";
      console.info(`${TAG} START`);
      try {
        let value = napitest.resolveDeferredNull();
        console.info('testResolveDeferred0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsPromise0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISPROMISE_0100
     * @tc.desc   Testing isPromise NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsPromise0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testIsPromise0001";
      console.info(`${TAG} START`);
      try {
        let value = napitest.isPromise();
        console.info(`${TAG} testString result is: ` + value + "--" + JSON.stringify(value));
        expect(value).assertEqual(0);
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsPromise0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISPROMISE_0200
     * @tc.desc   Testing isPromiseNull NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsPromise0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testIsPromise0002";
      console.info(`${TAG} START`);
      try {
        let value = napitest.isPromiseEnvNull();
        console.info('testIsPromise0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsPromise0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISPROMISE_0300
     * @tc.desc   Testing isPromiseNull NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsPromise0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testIsPromise0003";
      console.info(`${TAG} START`);
      try {
        let value = napitest.isPromiseEnvNull();
        console.info('testIsPromise0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testIsPromise0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ISPROMISE_0400
     * @tc.desc   Testing isPromiseNull NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testIsPromise0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testIsPromise0004";
      console.info(`${TAG} START`);
      try {
        let value = napitest.isPromiseEnvNull();
        console.info('testIsPromise0004 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetUvEventLoop0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETUVEVENTLOOP_0100
     * @tc.desc   Testing getUvEventLoop NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUvEventLoop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testGetUvEventLoop0001";
      console.info(`${TAG} START`);
      try {
        let value = napitest.getUvEventLoop();
        console.info('aceNapiTest075 testString result is: ' + value + "--" + JSON.stringify(value));
        expect(value === undefined).assertTrue();
      } catch (err) {
        console.error(`${TAG} error is ${err}`);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetUvEventLoop0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETUVEVENTLOOP_0200
     * @tc.desc   Testing getUvEventLoopNull NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUvEventLoop0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testGetUvEventLoop0002";
      console.info(`${TAG} START`);
      try {
        let value = napitest.getUvEventLoopEnvNull();
        console.info('testGetUvEventLoop0002 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testGetUvEventLoop0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETUVEVENTLOOP_0300
     * @tc.desc   Testing getUvEventLoopNull NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testGetUvEventLoop0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      let TAG = "testGetUvEventLoop0003";
      console.info(`${TAG} START`);
      try {
        let value = napitest.getUvEventLoopRstNull();
        console.info('testGetUvEventLoop0003 value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error(`${TAG} error is ${err} `);
        expect().assertFail();
      }
      done();
    });

      /**
       * @tc.name   testNapiCreateThreadsafeFunction0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_THREADSAFE_FUNCTION
       * @tc.desc   Testing napi_create_threadsafe_function interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateThreadsafeFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateThreadsafeFunction0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiCreateThreadsafeFunction();
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateThreadsafeFunction0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_THREADSAFE_FUNCTION
       * @tc.desc   Testing napi_create_threadsafe_function interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateThreadsafeFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateThreadsafeFunction0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createThreadsafeFunctionEnvNull();
          console.info('testNapiCreateThreadsafeFunction0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateThreadsafeFunction0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_THREADSAFE_FUNCTION
       * @tc.desc   Testing napi_create_threadsafe_function interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateThreadsafeFunction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateThreadsafeFunction0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createThreadsafeFunctionNameNull();
          console.info('testNapiCreateThreadsafeFunction0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetThreadsafeFunctionContext0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_THREADSAFE_FUNCTION_CONTEXT_0100
       * @tc.desc   Testing napi_get_threadsafe_function_context interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetThreadsafeFunctionContext0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetThreadsafeFunctionContext0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.ThreadSafeTest(() => {
            return 666;
          });
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetThreadsafeFunctionContext0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_THREADSAFE_FUNCTION_CONTEXT_0200
       * @tc.desc   Testing napi_get_threadsafe_function_context interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetThreadsafeFunctionContext0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetThreadsafeFunctionContext0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.ThreadSafeTestNull(() => {
            return 666;
          });
          console.info('testNapiCreateThreadsafeFunction0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCallThreadsafeFunction0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CALL_THREADSAFE_FUNCTION_0100
       * @tc.desc   Testing napi_call_threadsafe_function interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCallThreadsafeFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCallThreadsafeFunction0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiCallThreadsafeFunction();
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCallThreadsafeFunction0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CALL_THREADSAFE_FUNCTION_0200
       * @tc.desc   Testing napi_call_threadsafe_function interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCallThreadsafeFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCallThreadsafeFunction0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiCallThreadsafeFunctionNull();
          console.info('testNapiCallThreadsafeFunction0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRefThreadsafeFunction0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REF_THREADSAFE_FUNCTION_0100
       * @tc.desc   Testing napi_call_threadsafe_function interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRefThreadsafeFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRefThreadsafeFunction0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiRefthreadSafeFunction();
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRefThreadsafeFunction0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REF_THREADSAFE_FUNCTION_0200
       * @tc.desc   Testing napi_call_threadsafe_function interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRefThreadsafeFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRefThreadsafeFunction0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.refThreadSafeFunctionEnvNull();
          console.info('testNapiRefThreadsafeFunction0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRefThreadsafeFunction0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REF_THREADSAFE_FUNCTION_0300
       * @tc.desc   Testing napi_call_threadsafe_function interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRefThreadsafeFunction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRefThreadsafeFunction0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.refThreadSafeFunctionFuncNull();
          console.info('testNapiRefThreadsafeFunction0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateDate0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_DATE_0100
       * @tc.desc   Testing napi_create_date interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateDate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateDate0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiCreateDate();
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRefThreadsafeFunction0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_DATE_0200
       * @tc.desc   Testing napi_create_date interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRefThreadsafeFunction0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRefThreadsafeFunction0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createDateEnvNull();
          console.info('testNapiRefThreadsafeFunction0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRefThreadsafeFunction0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_DATE_0300
       * @tc.desc   Testing napi_create_date interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRefThreadsafeFunction0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRefThreadsafeFunction0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createDateRstNull();
          console.info('testNapiRefThreadsafeFunction0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintUint640001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0100
       * @tc.desc   Testing GetValueBigintUint64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintUint640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintUint640001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintUint64();
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintUint640002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0200
       * @tc.desc   Testing GetValueBigintUint64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintUint640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintUint640002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintUint64EnvNull();
          console.info('testGetValueBigintUint640002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintUint640003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0300
       * @tc.desc   Testing GetValueBigintUint64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintUint640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintUint640003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintUint64ValueNull();
          console.info('testGetValueBigintUint640003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintUint640004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0400
       * @tc.desc   Testing GetValueBigintUint64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintUint640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintUint640004";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintUint64RstNull();
          console.info('testGetValueBigintUint640004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintUint640005
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0500
       * @tc.desc   Testing GetValueBigintUint64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintUint640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintUint640005";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintUint64LossNull();
          console.info('testGetValueBigintUint640005 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintInt640001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0100
       * @tc.desc   Testing GetValueBigintInt64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintInt640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintInt640001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintInt64();
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintInt640002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0200
       * @tc.desc   Testing GetValueBigintInt64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintInt640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintInt640002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintInt64EnvNull();
          console.info('testGetValueBigintInt640002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintInt640003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0300
       * @tc.desc   Testing GetValueBigintInt64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintInt640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintInt640003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintInt64ValueNull();
          console.info('testGetValueBigintInt640003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintInt640004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0400
       * @tc.desc   Testing GetValueBigintInt64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintInt640004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintInt640004";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintInt64RstNull();
          console.info('testGetValueBigintInt640004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintInt640005
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0500
       * @tc.desc   Testing GetValueBigintInt64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintInt640005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintInt640005";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintInt64LossNull();
          console.info(`${TAG} value is ${value} `);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintWords0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0100
       * @tc.desc   Testing GetValueBigintWords interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintWords0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintWords0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintWords();
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintWords0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0200
       * @tc.desc   Testing GetValueBigintWords interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintWords0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintWords0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintWordsEnvNull();
          console.info('testGetValueBigintWords0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintWords0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0300
       * @tc.desc   Testing GetValueBigintWords interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintWords0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintWords0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintWordsValueNull();
          console.info('testGetValueBigintWords0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintWords0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0400
       * @tc.desc   Testing GetValueBigintWords interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintWords0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintWords0004";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintWordsSignNull();
          console.info('testGetValueBigintWords0004 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintWords0005
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0500
       * @tc.desc   Testing GetValueBigintWords interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintWords0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintWords0005";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintWordsCountNull();
          console.info('testGetValueBigintWords0005 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBigintWords0006
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0600
       * @tc.desc   Testing GetValueBigintWords interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBigintWords0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testGetValueBigintWords0006";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getValueBigintWordsWordsNull();
          console.info('testGetValueBigintWords0006 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintInt640001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_INT64_0100
       * @tc.desc   Testing napi_create_bigint_int64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintInt640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintInt640001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiCreateBigintInt64();
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintInt640002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_INT64_0200
       * @tc.desc   Testing napi_create_bigint_int64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintInt640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintInt640002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBigintInt64EnvNull();
          console.info('testNapiCreateBigintInt640002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintInt640003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_INT64_0300
       * @tc.desc   Testing napi_create_bigint_int64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintInt640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintInt640003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBigintInt64RstNull();
          console.info('testNapiCreateBigintInt640003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintUint640001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_UINT64_0100
       * @tc.desc   Testing napi_create_bigint_uint64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintUint640001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintUint640001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiCreateBigintUint64();
          console.info('testNapiCreateBigintUint640001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintUint640002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_UINT64_0200
       * @tc.desc   Testing napi_create_bigint_uint64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintUint640002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintUint640002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBigintUint64EnvNull();
          console.info('testNapiCreateBigintUint640002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintUint640003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_UINT64_0300
       * @tc.desc   Testing napi_create_bigint_uint64 interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintUint640003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintUint640003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBigintUint64EnvNull();
          console.info('testNapiCreateBigintUint640003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintWords0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_WORDS_0100
       * @tc.desc   Testing napi_create_bigint_words interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintWords0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintWords0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiCreateBigintWords();
          console.info('testNapiCreateBigintWords0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintWords0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_WORDS_0200
       * @tc.desc   Testing napi_create_bigint_words interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintWords0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintWords0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBigintWordsEnvNull();
          console.info('testNapiCreateBigintWords0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintWords0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_WORDS_0300
       * @tc.desc   Testing napi_create_bigint_words interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintWords0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintWords0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBigintWordsNull();
          console.info('testNapiCreateBigintWords0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBigintWords0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_WORDS_0400
       * @tc.desc   Testing napi_create_bigint_words interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBigintWords0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBigintWords0004";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBigintWordsRstNull();
          console.info('testNapiCreateBigintWords0004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBuffer0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_0100
       * @tc.desc   Testing napi_create_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBuffer0001";
        console.info(`${TAG} START`);
        try {
          let buffer = napitest.CreateBuffer();
          expect(napitest.IsBuffer(buffer)).assertTrue();
          expect(napitest.GetBufferInfo(buffer)).assertTrue();
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBuffer0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_0200
       * @tc.desc   Testing napi_create_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBuffer0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBufferEnvNull();
          console.info('testNapiCreateBuffer0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBuffer0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_0300
       * @tc.desc   Testing napi_create_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBuffer0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBufferDataNull();
          console.info('testNapiCreateBuffer0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect(err.message).assertEqual('Failed to create buffer');
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBuffer0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_0400
       * @tc.desc   Testing napi_create_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBuffer0004";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBufferRstNull();
          console.info('testNapiCreateBuffer0004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect(err.message).assertEqual('Failed to create buffer');
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBufferCopy0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0100
       * @tc.desc   Testing napi_create_buffer_copy interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBufferCopy0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBufferCopy0001";
        console.info(`${TAG} START`);
        try {
          expect(napitest.BufferCopy().toString()).assertDeepEquals(napitest.testStr);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBufferCopy0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0200
       * @tc.desc   Testing napi_create_buffer_copy interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBufferCopy0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBufferCopy0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBufferCopyEnvNull()
          console.info('testNapiCreateBufferCopy0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBufferCopy0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0300
       * @tc.desc   Testing napi_create_buffer_copy interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBufferCopy0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBufferCopy0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBufferCopyDataNull()
          console.info('testNapiCreateBufferCopy0003 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBufferCopy0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0400
       * @tc.desc   Testing napi_create_buffer_copy interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBufferCopy0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBufferCopy0004";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBufferCopyRstDataNull()
          console.info('testNapiCreateBufferCopy0004 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateBufferCopy0005
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0500
       * @tc.desc   Testing napi_create_buffer_copy interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateBufferCopy0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateBufferCopy0005";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createBufferCopyRstNull()
          console.info('testNapiCreateBufferCopy0005 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });


      /**
       * @tc.name   testNapiCreateExternalBuffer0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_EXTERNAL_BUFFER_0100
       * @tc.desc   Testing napi_create_external_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateExternalBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateExternalBuffer0001";
        console.info(`${TAG} START`);
        try {
          expect(napitest.CreateExternalBuffer().toString()).assertDeepEquals(napitest.testStr);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateExternalBuffer0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_EXTERNAL_BUFFER_0200
       * @tc.desc   Testing napi_create_external_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateExternalBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateExternalBuffer0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createExternalBuffereEnvNull();
          console.info('testNapiCreateExternalBuffer0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateExternalBuffer0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_EXTERNAL_BUFFER_0300
       * @tc.desc   Testing napi_create_external_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateExternalBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateExternalBuffer0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createExternalBuffereDataNull();
          console.info('testNapiCreateExternalBuffer0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetBufferInfo0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_BUFFER_INFO_0100
       * @tc.desc   Testing napi_get_buffer_info interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetBufferInfo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetBufferInfo0001";
        console.info(`${TAG} START`);
        try {
          let buffer = napitest.CreateBuffer();
          expect(napitest.GetBufferInfo(buffer)).assertTrue();
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetBufferInfo0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_BUFFER_INFO_0200
       * @tc.desc   Testing napi_get_buffer_info interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetBufferInfo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetBufferInfo0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getBufferInfoEnvNull('null');
          console.info('testNapiGetBufferInfo0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetBufferInfo0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_BUFFER_INFO_0300
       * @tc.desc   Testing napi_get_buffer_info interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetBufferInfo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetBufferInfo0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getBufferInfoValueNull('null');
          console.info('testNapiGetBufferInfo0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiIsBuffer0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_IS_BUFFER_0100
       * @tc.desc   Testing napi_is_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiIsBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiIsBuffer0001";
        console.info(`${TAG} START`);
        try {
          let buffer = napitest.CreateBuffer();
          expect(napitest.IsBuffer(buffer)).assertTrue();
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiIsBuffer0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_IS_BUFFER_0200
       * @tc.desc   Testing napi_is_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiIsBuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiIsBuffer0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.IsBufferEnvNull('null');
          console.info('testNapiIsBuffer0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiIsBuffer0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_IS_BUFFER_0300
       * @tc.desc   Testing napi_is_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiIsBuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiIsBuffer0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.IsBufferValueNull('null');
          console.info('testNapiIsBuffer0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiIsBuffer0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_IS_BUFFER_0400
       * @tc.desc   Testing napi_is_buffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiIsBuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiIsBuffer0004";
        console.info(`${TAG} START`);
        try {
          let value = napitest.IsBufferRstNull('null');
          console.info('testNapiIsBuffer0004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiObjectFreeze0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OBJECT_FREEZE_0100
       * @tc.desc   Testing napi_object_freeze interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiObjectFreeze0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiObjectFreeze0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.objectFreezeEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiObjectFreeze0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OBJECT_FREEZE_0200
       * @tc.desc   Testing napi_object_freeze interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiObjectFreeze0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiObjectFreeze0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.objectFreezeObjNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiObjectSeal0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OBJECT_SEAL_0100
       * @tc.desc   Testing napi_object_seal interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiObjectSeal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiObjectSeal0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.objectSealEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiObjectSeal0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OBJECT_SEAL_0200
       * @tc.desc   Testing napi_object_seal interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiObjectSeal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiObjectSeal0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.objectSealObjNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetAllPropertyNames0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_ALL_PROPERTY_NAMES_0100
       * @tc.desc   Testing napi_get_all_property_names interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetAllPropertyNames0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetAllPropertyNames0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.GetAllPropertyNamesEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetAllPropertyNames0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_ALL_PROPERTY_NAMES_0200
       * @tc.desc   Testing napi_get_all_property_names interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetAllPropertyNames0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetAllPropertyNames0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.GetAllPropertyNamesObjNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetAllPropertyNames0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_ALL_PROPERTY_NAMES_0300
       * @tc.desc   Testing napi_get_all_property_names interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetAllPropertyNames0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetAllPropertyNames0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.GetAllPropertyNamesResNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiDetachArraybuffer0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DETACH_ARRAYBUFFER_0100
       * @tc.desc   Testing napi_detach_arraybuffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiDetachArraybuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiDetachArraybuffer0001";
        console.info(`${TAG} START`);
        try {
          const buffer = napitest.External();
          expect(!napitest.IsDetachedTest(buffer.buffer)).assertTrue();
          napitest.DetachTest(buffer);
          expect(napitest.IsDetachedTest(buffer.buffer)).assertTrue();
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiDetachArraybuffer0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DETACH_ARRAYBUFFER_0200
       * @tc.desc   Testing napi_detach_arraybuffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiDetachArraybuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiDetachArraybuffer0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.DetachEnvNull(null);
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiDetachArraybuffer0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DETACH_ARRAYBUFFER_0300
       * @tc.desc   Testing napi_detach_arraybuffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiDetachArraybuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiDetachArraybuffer0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.DetachArrNull(null);
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiIsDetachedArraybuffer0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_IS_DETACHED_ARRAYBUFFER_0100
       * @tc.desc   Testing napi_is_detached_arraybuffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiIsDetachedArraybuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiIsDetachedArraybuffer0001";
        console.info(`${TAG} START`);
        try {
          const buffer1 = new ArrayBuffer(128);
          expect(!napitest.IsDetachedTest(buffer1)).assertTrue();
          const buffer = napitest.External();
          expect(!napitest.IsDetachedTest(buffer.buffer)).assertTrue();
          napitest.DetachTest(buffer);
          expect(napitest.IsDetachedTest(buffer.buffer)).assertTrue();
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiIsDetachedArraybuffer0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_IS_DETACHED_ARRAYBUFFER_0200
       * @tc.desc   Testing napi_is_detached_arraybuffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiIsDetachedArraybuffer0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiIsDetachedArraybuffer0002";
        console.info(`${TAG} START`);
        try {
          let buffer = new ArrayBuffer(1024);
          let value = napitest.IsDetachedEnvNull(buffer)
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiIsDetachedArraybuffer0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_IS_DETACHED_ARRAYBUFFER_0300
       * @tc.desc   Testing napi_is_detached_arraybuffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiIsDetachedArraybuffer0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiIsDetachedArraybuffer0003";
        console.info(`${TAG} START`);
        try {
          let buffer = new ArrayBuffer(1024);
          let value = napitest.IsDetachedArrNull(buffer)
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiIsDetachedArraybuffer0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_IS_DETACHED_ARRAYBUFFER_0400
       * @tc.desc   Testing napi_is_detached_arraybuffer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiIsDetachedArraybuffer0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiIsDetachedArraybuffer0004";
        console.info(`${TAG} START`);
        try {
          let buffer = new ArrayBuffer(1024);
          let value = napitest.IsDetachedResNull(buffer)
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiSetInstanceData0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SET_INSTANCE_DATA_0100
       * @tc.desc   Testing napi_set_instance_data interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiSetInstanceData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiSetInstanceData0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiSetInstanceData();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiSetInstanceData0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SET_INSTANCE_DATA_0200
       * @tc.desc   Testing napi_set_instance_data interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiSetInstanceData0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiSetInstanceData0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.NapiSetInstanceDataEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiGetInstanceData0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GET_INSTANCE_DATA_0100
       * @tc.desc   Testing napi_get_instance_data interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiGetInstanceData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiGetInstanceData0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.NapiGetInstanceDataDataNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiAddEnvCleanupHook0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ADD_ENV_CLEANUP_HOOK_0100
       * @tc.desc   Testing napi_add_env_cleanup_hook interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiAddEnvCleanupHook0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiAddEnvCleanupHook0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiEnvCleanUpHook();
          expect(value == undefined).assertTrue();
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiAddEnvCleanupHook0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ADD_ENV_CLEANUP_HOOK_0200
       * @tc.desc   Testing napi_add_env_cleanup_hook interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiAddEnvCleanupHook0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiAddEnvCleanupHook0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.NapiEnvCleanUpHookEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiAddEnvCleanupHook0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ADD_ENV_CLEANUP_HOOK_0300
       * @tc.desc   Testing napi_add_env_cleanup_hook interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiAddEnvCleanupHook0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiAddEnvCleanupHook0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.NapiEnvCleanUpHookFuncNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRemoveEnvCleanupHook0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVE_ENV_CLEANUP_HOOK_0100
       * @tc.desc   Testing napi_remove_env_cleanup_hook interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRemoveEnvCleanupHook0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRemoveEnvCleanupHook0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.NapiRemoveEnvCleanUpHookEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRemoveEnvCleanupHook0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_REMOVE_ENV_CLEANUP_HOOK_0200
       * @tc.desc   Testing napi_remove_env_cleanup_hook interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRemoveEnvCleanupHook0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRemoveEnvCleanupHook0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.NapiRemoveEnvCleanUpHookFuncNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiApiGetModuleFileName0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NODE_API_GET_MODULE_FILE_NAME_0100
       * @tc.desc   Testing node_api_get_module_file_name interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiApiGetModuleFileName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiApiGetModuleFileName0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.getModuleFileName().indexOf(".so");
          console.error(`${TAG} value is ` + value);
          expect(value > 0).assertTrue();
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiApiGetModuleFileName0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NODE_API_GET_MODULE_FILE_NAME_0200
       * @tc.desc   Testing node_api_get_module_file_name interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiApiGetModuleFileName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiApiGetModuleFileName0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.GetModuleFileNameEnvNull()
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect(err.message).assertEqual('Cannot read property indexOf of undefined');
        }
        done();
      });

      /**
       * @tc.name   testNapiApiGetModuleFileName0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NODE_API_GET_MODULE_FILE_NAME_0300
       * @tc.desc   Testing node_api_get_module_file_name interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiApiGetModuleFileName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiApiGetModuleFileName0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.GetModuleFileNameResNull()
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiAddFinalizer0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_ADD_FINALIZER_0100
       * @tc.desc   Testing napi_add_finalizer interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiAddFinalizer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiAddFinalizer0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createAsyncResource({
            foo: 'bar'
          }, false);
          expect(value instanceof Object).assertTrue();
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiQueueAsyncWorkWithQos0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_QUEUE_ASYNC_WORK_WITH_QOS_0100
       * @tc.desc   Testing napi_queue_async_work_with_qos interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiQueueAsyncWorkWithQos0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiQueueAsyncWorkWithQos0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.asyncWorkWithQos(1000, (input) => {
            console.info('asyncWorkWithQos ' + (input * 2));
            return input * 2;
          });
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiQueueAsyncWorkWithQos0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_QUEUE_ASYNC_WORK_WITH_QOS_0200
       * @tc.desc   Testing napi_queue_async_work_with_qos interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiQueueAsyncWorkWithQos0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiQueueAsyncWorkWithQos0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.asyncWorkWithQosEnvNull(1000, null)
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiQueueAsyncWorkWithQos0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_QUEUE_ASYNC_WORK_WITH_QOS_0300
       * @tc.desc   Testing napi_queue_async_work_with_qos interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiQueueAsyncWorkWithQos0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiQueueAsyncWorkWithQos0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.asyncWorkWithQosWorkNull(1000, null)
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRunScriptPath0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_RUN_SCRIPT_PATH_0100
       * @tc.desc   Testing napi_run_script_path interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRunScriptPath0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRunScriptPath0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiRunScriptPathEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiRunScriptPath0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_RUN_SCRIPT_PATH_0200
       * @tc.desc   Testing napi_run_script_path interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiRunScriptPath0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiRunScriptPath0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiRunScriptPathResNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiLoadModule0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_LOAD_MODULE_0100
       * @tc.desc   Testing napi_load_module interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiLoadModule0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiLoadModule0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiLoadModule();
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiLoadModule0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_LOAD_MODULE_0200
       * @tc.desc   Testing napi_load_module interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiLoadModule0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiLoadModule0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiLoadModuleEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiLoadModule0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_LOAD_MODULE_0300
       * @tc.desc   Testing napi_load_module interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiLoadModule0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiLoadModule0003";
        console.info(`${TAG} START`);
        try {
          let value = napitest.napiLoadModuleResNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateObjectWithProperties0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_OBJECT_WITH_PROPERTIES_0100
       * @tc.desc   Testing napi_create_object_with_properties interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateObjectWithProperties0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateObjectWithProperties0001";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createObjectWithProperties();
          expect(value).assertEqual(0);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiCreateObjectWithProperties0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATE_OBJECT_WITH_PROPERTIES_0200
       * @tc.desc   Testing napi_create_object_with_properties interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiCreateObjectWithProperties0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        let TAG = "testNapiCreateObjectWithProperties0002";
        console.info(`${TAG} START`);
        try {
          let value = napitest.createObjectWithPropertiesEnvNull();
          console.error(`${TAG} value is ` + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error(`${TAG} error is ${err} `);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetDateValue0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0100
       * @tc.desc   Testing GetDateValue NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetDateValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testGetDateValue0001 START');
        try {
          let value = napitest.getDateValue();
          console.info('testGetDateValue0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testGetDateValue0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetDateValue0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0200
       * @tc.desc   Testing GetDateValue NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetDateValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testGetDateValue0002 START');
        try {
          let value = napitest.getDateValueNotDateObj();
          console.info('testGetDateValue0002 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testGetDateValue0002 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetDateValue0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0300
       * @tc.desc   Testing GetDateValue NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetDateValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testGetDateValue0003 START');
        try {
          let value = napitest.getDateValueEnvNull();
          console.info('testGetDateValue0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testGetDateValue0003 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetDateValue0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0400
       * @tc.desc   Testing GetDateValue NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetDateValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testGetDateValue0004 START');
        try {
          let value = napitest.getDateValueNull();
          console.info('testGetDateValue0004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testGetDateValue0004 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetDateValue0005
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0500
       * @tc.desc   Testing GetDateValue NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetDateValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testGetDateValue0005 START');
        try {
          let value = napitest.getDateValueRstNull();
          console.info('testGetDateValue0005 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testGetDateValue0005 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCreateBigintWords0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEBIGINTWORDS_0100
       * @tc.desc   Testing CreateBigintWords NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateBigintWords0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateBigintWords0001 START');
        try {
          let value = napitest.createBigintWordsCountIntMax();
          console.info('testCreateBigintWords0001 value is: ' + value);
          expect().assertFail();
        } catch (err) {
          console.error('testCreateBigintWords0001 err msg' + err.message);
          expect(err.message).assertEqual('Maximum BigInt size exceeded');
        }
        done();
      });

      /**
       * @tc.name   testCreateBigintInt64ValueNotJS0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEBIGINTINT64VALUENOTJS_0100
       * @tc.desc   Testing CreateBigintInt64 NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateBigintInt64ValueNotJS0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateBigintInt64ValueNotJS0001 START');
        try {
          let value = napitest.createBigintInt64ValueNotJS();
          console.info('testCreateBigintInt64ValueNotJS0001 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testCreateBigintInt64ValueNotJS0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCreateBigintUint64ValueNotJS0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEBIGINTUINT64VALUENOTJS_0100
       * @tc.desc   Testing CreateBigintUint64 NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateBigintUint64ValueNotJS0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateBigintUint64ValueNotJS0001 START');
        try {
          let value = napitest.createBigintUint64ValueNotJS();
          console.info('testCreateBigintUint64ValueNotJS0001 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testCreateBigintUint64ValueNotJS0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testGetValueBiginWords0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINWORDSNOTBIGINT_0100
       * @tc.desc   Testing GetValueBiginWords NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetValueBiginWords0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testGetValueBiginWords0001 START');
        try {
          let value = napitest.getValueBiginWordsNotBigInt();
          console.info('testGetValueBiginWords0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testGetValueBiginWords0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCreateBufferSizeZero0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CreateBufferSizeZero_0100
       * @tc.desc   Testing CreateBufferSizeZero NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateBufferSizeZero0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateBufferSizeZero0001 START');
        try {
          let value = napitest.createBufferSizeZero();
          console.info('testCreateBufferSizeZero0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCreateBufferSizeZero0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });


      /**
       * @tc.name   testCreateBufferCopyLengthMax0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEBUFFERCOPYLENGTHMAX_0100
       * @tc.desc   Testing createBufferCopyLengthMax NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateBufferCopyLengthMax0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateBufferCopyLengthMax0001 START');
        try {
          let value = napitest.createBufferSizeZero();
          console.info('testCreateBufferCopyLengthMax0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCreateBufferCopyLengthMax0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCreateBufferCopyLengthZero0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEBUFFERCOPYLENGTHZERO_0100
       * @tc.desc   Testing createBufferCopyLengthMax NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateBufferCopyLengthZero0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateBufferCopyLengthZero0001 START');
        try {
          let value = napitest.createBufferCopyLengthZero();
          console.info('testCreateBufferCopyLengthZero0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCreateBufferCopyLengthZero0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCreateExternalBufferLengthZero0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNALBUFFERLENGTHZERO_0100
       * @tc.desc   Testing createExternalBufferLengthZero NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateExternalBufferLengthZero0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateExternalBufferLengthZero0001 START');
        try {
          let value = napitest.createExternalBufferLengthZero();
          console.info('testCreateExternalBufferLengthZero0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCreateExternalBufferLengthZero0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCreateExternalBufferLengthMax0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNALBUFFERLENGTHMAX_0100
       * @tc.desc   Testing createExternalBufferLengthMax NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateExternalBufferLengthMax0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateExternalBufferLengthMax0001 START');
        try {
          let value = napitest.createExternalBufferLengthMax();
          console.info('testCreateExternalBufferLengthMax0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCreateExternalBufferLengthMax0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });


      /**
       * @tc.name   testGetBufferInfoValueNotBuffer0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_GETBUFFERINFOVALUENOTBUFFER_0100
       * @tc.desc   Testing getBufferInfoValueNotBuffer NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testGetBufferInfoValueNotBuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testGetBufferInfoValueNotBuffer0001 START');
        try {
          let value = napitest.getBufferInfoValueNotBuffer('test');
          console.info('testGetBufferInfoValueNotBuffer0001 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testGetBufferInfoValueNotBuffer0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testObjectSeal0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OBJECTSEAL_0100
       * @tc.desc   Testing ObjectSeal NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testObjectSeal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testObjectSeal0001 START');
        try {
          let value = napitest.objectSealNotObj();
          console.info('testObjectSeal0001 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testObjectSeal0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testObjectFreeze0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_OBJECTFREEZE_0100
       * @tc.desc   Testing ObjectFreeze NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testObjectFreeze0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testObjectFreeze0001 START');
        try {
          let value = napitest.objectFreezeNotObj();
          console.info('testObjectFreeze0001 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testObjectFreeze0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testDetachArraybuffer0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_DETACHARRAYBUFFER_0100
       * @tc.desc   Testing DetachArraybuffer NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDetachArraybuffer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testDetachArraybuffer0001 START');
        try {
          let value = napitest.detachArraybufferNotObj(null);
          console.info('testDetachArraybuffer0001 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testDetachArraybuffer0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testIsSendable0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLE_0100
       * @tc.desc   Testing NapiIsSendable NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testIsSendable0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testIsSendable0001 START');
        try {
          let test = [1,2];
          let value = napitest.NapiIsSendable(test);
          console.info('testIsSendable0001 value is: ' + value);
          expect(value).assertEqual(false);
        } catch (err) {
          console.error('testIsSendable0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testIsSendable0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLE_0200
       * @tc.desc   Testing NapiIsSendable NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testIsSendable0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testIsSendable0002 START');
        try {
          let test = [1,2];
          let value = napitest.isSendableEnvNull(test);
          console.info('testIsSendable0002 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testIsSendable0002 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testIsSendable0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLE_0300
       * @tc.desc   Testing NapiIsSendable NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testIsSendable0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testIsSendable0003 START');
        try {
          let test = [1,2];
          let value = napitest.isSendableValueNull(test);
          console.info('testIsSendable0003 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testIsSendable0003 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testIsSendable0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLE_0400
       * @tc.desc   Testing NapiIsSendable NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testIsSendable0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testIsSendable0004 START');
        try {
          let peop:Person = {
            name: 'zhangsan',
            age: 18
          }
          let value = napitest.isSendableRstNull(peop);
          console.info('testIsSendable0004 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testIsSendable0004 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiDeserialize0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZE_0100
       * @tc.desc   Testing NapiDeserialize NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiDeserialize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testNapiDeserialize0001 START');
        try {
          let value = napitest.napiDeSerialize();
          console.info('testNapiDeserialize0001 value is: ' + value);
          expect(value).assertEqual(2000);
        } catch (err) {
          console.error('testNapiDeserialize0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiDeserialize0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZE_0200
       * @tc.desc   Testing NapiDeserialize NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiDeserialize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testNapiDeserialize0002 START');
        try {
          let value = napitest.deserializeEnvNull();
          console.info('testNapiDeserialize0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testNapiDeserialize0002 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiDeserialize0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZE_0300
       * @tc.desc   Testing NapiDeserialize NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiDeserialize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testNapiDeserialize0003 START');
        try {
          let value = napitest.deserializeDataNull();
          console.info('testNapiDeserialize0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testNapiDeserialize0003 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiDeserialize0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZE_0400
       * @tc.desc   Testing NapiDeserialize NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiDeserialize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testNapiDeserialize0004 START');
        try {
          let value = napitest.deserializeRstNull();
          console.info('testNapiDeserialize0004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testNapiDeserialize0004 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiSerialize0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALIZE_0100
       * @tc.desc   Testing NapiSerialize NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiSerialize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testNapiSerialize0001 START');
        try {
          let value = napitest.napiSerialize();
          console.info('testNapiSerialize0001 value is: ' + value);
          expect(value).assertEqual(2000);
        } catch (err) {
          console.error('testNapiSerialize0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiSerialize0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALIZE_0200
       * @tc.desc   Testing NapiSerialize NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiSerialize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testNapiSerialize0002 START');
        try {
          let value = napitest.serializeEnvNull();
          console.info('testNapiSerialize0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testNapiSerialize0002 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiSerialize0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALIZE_0300
       * @tc.desc   Testing NapiSerialize NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiSerialize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testNapiSerialize0003 START');
        try {
          let value = napitest.serializeObjNull();
          console.info('testNapiSerialize0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testNapiSerialize0003 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testNapiSerialize0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALIZE_0400
       * @tc.desc   Testing NapiSerialize NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testNapiSerialize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testNapiSerialize0004 START');
        try {
          let value = napitest.serializeDataNull();
          console.info('testNapiSerialize0004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testNapiSerialize0004 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCreateObjectWithNamedProperties0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEOBJECTWITHNAMEDPROPERTIES_0100
       * @tc.desc   Testing CreateObjectWithNamedProperties NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateObjectWithNamedProperties0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateObjectWithNamedProperties0001 START');
        try {
          let value = napitest.createObjectWithNamedProperties();
          console.info('testCreateObjectWithNamedProperties0001 value is: ' + value);
          expect(value).assertEqual(0);
        } catch (err) {
          console.error('testCreateObjectWithNamedProperties0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCreateObjectWithNamedProperties0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATEOBJECTWITHNAMEDPROPERTIES_0200
       * @tc.desc   Testing CreateObjectWithNamedProperties NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCreateObjectWithNamedProperties0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCreateObjectWithNamedProperties0002 START');
        try {
          let value = napitest.createObjectWithNamePropertiesEnvNull();
          console.info('testCreateObjectWithNamedProperties0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCreateObjectWithNamedProperties0002 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCoerceToNativeBindingObject0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0100
       * @tc.desc   Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCoerceToNativeBindingObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCoerceToNativeBindingObject0001 START');
        try {
          let value = napitest.coerceToNativeBindingObjectEnvNull(null);
          console.info('testCoerceToNativeBindingObject0001 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCoerceToNativeBindingObject0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCoerceToNativeBindingObject0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0200
       * @tc.desc   Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCoerceToNativeBindingObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCoerceToNativeBindingObject0002 START');
        try {
          let test = [1,2];
          let value = napitest.coerceToNativeBindingObjectObjNull(test);
          console.info('testCoerceToNativeBindingObject0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCoerceToNativeBindingObject0002 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCoerceToNativeBindingObject0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0300
       * @tc.desc   Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCoerceToNativeBindingObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCoerceToNativeBindingObject0003 START');
        try {
          let test = [1,2];
          let value = napitest.coerceToNativeBindingObjectDetachNull(test);
          console.info('testCoerceToNativeBindingObject0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCoerceToNativeBindingObject0003 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCoerceToNativeBindingObject0004
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0400
       * @tc.desc   Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCoerceToNativeBindingObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCoerceToNativeBindingObject0004 START');
        try {
          let test = [1,2];
          let value = napitest.coerceToNativeBindingObjectAttachNull(test);
          console.info('testCoerceToNativeBindingObject0004 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCoerceToNativeBindingObject0004 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testCoerceToNativeBindingObject0005
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0500
       * @tc.desc   Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testCoerceToNativeBindingObject0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testCoerceToNativeBindingObject0005 START');
        try {
          let test = [1,2];
          let value = napitest.coerceToNativeBindingObjectNativeNull(test);
          console.info('testCoerceToNativeBindingObject0005 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testCoerceToNativeBindingObject0005 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testDeleteSerializationData0001
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTDELETESERIALIZATIONDATA0001_0100
       * @tc.desc   Testing deleteSerializationData NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDeleteSerializationData0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testDeleteSerializationData0001 START');
        try {
          let value = napitest.napiDeleteSerializationData();
          console.info('testDeleteSerializationData0001 value is: ' + value);
          expect(value).assertEqual(2000);
        } catch (err) {
          console.error('testDeleteSerializationData0001 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testDeleteSerializationData0002
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTDELETESERIALIZATIONDATA0001_0200
       * @tc.desc   Testing deleteSerializationData NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDeleteSerializationData0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testDeleteSerializationData0002 START');
        try {
          let value = napitest.deleteSerializationEnvNull();
          console.info('testDeleteSerializationData0002 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testDeleteSerializationData0002 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

      /**
       * @tc.name   testDeleteSerializationData0003
       * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTDELETESERIALIZATIONDATA0001_0300
       * @tc.desc   Testing deleteSerializationData NAPI interface.
       * @tc.type   FUNCTION
       * @tc.size   MEDIUMTEST
       * @tc.level  LEVEL1
       */
      it('testDeleteSerializationData0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        console.info('testDeleteSerializationData0003 START');
        try {
          let value = napitest.deleteSerializationDataNull();
          console.info('testDeleteSerializationData0003 value is: ' + value);
          expect(value).assertEqual(1);
        } catch (err) {
          console.error('testDeleteSerializationData0003 err msg' + err.message);
          expect().assertFail();
        }
        done();
      });

    /**
     * @tc.name   testhasOwnPropertyCheckpro0100
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0100
     * @tc.desc   Testing hasOwnProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testhasOwnPropertyCheckpro0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testhasOwnPropertyCheckpro0100 START');
      try {
        let value = napitest.hasOwnPropertyCheckpro();
        console.info('testhasOwnPropertyCheckpro0100 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testhasOwnPropertyCheckpro0100 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testhasOwnPropertyCheckOwnpro0200
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0200
     * @tc.desc   Testing hasOwnProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testhasOwnPropertyCheckOwnpro0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testhasOwnPropertyCheckOwnpro0200 START');
      try {
        let value = napitest.hasOwnPropertyCheckOwnpro();
        console.info('testhasOwnPropertyCheckOwnpro0200 value is: ' + value);
        expect(value).assertTrue();
      } catch (err) {
        console.error('testhasOwnPropertyCheckOwnpro0200 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testcreateTypeErrorRes0100
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_createTypeErrorRes_0100
     * @tc.desc   Testing napi_create_type_error NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testcreateTypeErrorRes0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testcreateTypeErrorRes0100 START');
      try {
        throw napitest.createTypeErrorRes();
      } catch (error) {
        console.error('testcreateTypeErrorRes0100 err msg' + error.message);
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testcreateTypeErrorRes0200
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEERRORRES_0200
     * @tc.desc   Testing napi_create_type_error NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testcreateTypeErrorRes0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testcreateTypeErrorRes0200 START');
      try {
        throw napitest.createTypeErrorRes();
      } catch (error) {
        console.error('testcreateTypeErrorRes0200 err msg' + error.message);
        expect(error instanceof TypeError).assertFalse();
      }
      done();
    });

    /**
     * @tc.name   testcreateRangeErrorRes0100
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATERANGEERRORRES_0100
     * @tc.desc   Testing napi_create_range_error NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testcreateRangeErrorRes0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testcreateRangeErrorRes0100 START');
      try {
        throw napitest.createRangeErrorRes();
      } catch (error) {
        console.error('testcreateRangeErrorRes0100 err msg' + error.message);
        expect(error instanceof Error).assertTrue();
      }
      done();
    });

    /**
     * @tc.name   testcreateRangeErrorRes0200
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_CREATERANGEERRORRES_0200
     * @tc.desc   Testing napi_create_range_error NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testcreateRangeErrorRes0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info('testcreateRangeErrorRes0200 START');
      try {
        throw napitest.createRangeErrorRes();
      } catch (error) {
        console.error('testcreateRangeErrorRes0200 err msg' + error.message);
        expect(error instanceof RangeError).assertFalse();
      }
      done();
    });
    /**
     * @tc.name   testNapiModuleRegisterTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TestNAPIMODULEREGISTERTEST_0100
     * @tc.desc   Testing NapiModuleRegister NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiModuleRegisterTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiModuleRegisterTest0001 START');
      try {
        let value = napitest.NapiModuleRegisterTest();
        console.info('NapiGetLastErrorInfoTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetLastErrorInfoTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetLastErrorInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETLASTERRORINFOTEST_0100
     * @tc.desc   Testing NapiGetLastErrorInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetLastErrorInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetLastErrorInfoTest0001 START');
      try {
        let value = napitest.NapiGetLastErrorInfoTest();
        console.info('NapiGetLastErrorInfoTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetLastErrorInfoTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiThrowTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITHROWTEST_0100
     * @tc.desc   Testing NapiGetLastErrorInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiThrowTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiThrowTest0001 START');
      try {
        let value = napitest.NapiThrowTest();
        console.info('NapiThrowTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiThrowTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiThrowErrorTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITHROWERRORTEST_0100
     * @tc.desc   Testing NapiGetLastErrorInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiThrowErrorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiThrowErrorTest0001 START');
      try {
        let value = napitest.NapiThrowErrorTest();
        console.info('NapiThrowErrorTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiThrowErrorTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiThrowTypeErrorTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITHROWTYPEERRORTEST_0100
     * @tc.desc   Testing NapiThrowTypeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiThrowTypeErrorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiThrowTypeErrorTest0001 START');
      try {
        let value = napitest.NapiThrowTypeErrorTest();
        console.info('NapiThrowTypeErrorTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiThrowTypeErrorTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiThrowRangeErrorTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITHROWRANGEERRORTEST_0100
     * @tc.desc   Testing NapiThrowRangeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiThrowRangeErrorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiThrowRangeErrorTest0001 START');
      try {
        let value = napitest.NapiThrowRangeErrorTest();
        console.info('NapiThrowRangeErrorTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiThrowRangeErrorTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiIsErrorTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISERRORTEST_0100
     * @tc.desc   Testing NapiIsError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsErrorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsErrorTest0001 START');
      try {
        let value = napitest.NapiIsErrorTest();
        console.info('NapiIsErrorTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsErrorTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateErrorTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEERRORTEST_0100
     * @tc.desc   Testing NapiCreateError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateErrorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateErrorTest0001 START');
      try {
        let value = napitest.NapiCreateErrorTest();
        console.info('NapiCreateErrorTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateErrorTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateTypeErrorTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATETYPEERRORTEST_0100
     * @tc.desc   Testing NapiCreateTypeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateTypeErrorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateTypeErrorTest0001 START');
      try {
        let value = napitest.NapiCreateTypeErrorTest();
        console.info('NapiCreateTypeErrorTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateTypeErrorTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateRangeErrorTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATERANGEERRORTEST_0100
     * @tc.desc   Testing NapiCreateRangeError NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateRangeErrorTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateRangeErrorTest0001 START');
      try {
        let value = napitest.NapiCreateRangeErrorTest();
        console.info('NapiCreateRangeErrorTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateRangeErrorTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetAndClearLastExceptionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETANDCLEARLASTEXCEPTIONTEST_0100
     * @tc.desc   Testing NapiGetAndClearLastException NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetAndClearLastExceptionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetAndClearLastExceptionTest0001 START');
      try {
        let value = napitest.NapiGetAndClearLastExceptionTest();
        console.info('NapiGetAndClearLastExceptionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetAndClearLastExceptionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiIsExceptionPendingTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISEXCEPTIONPENDINGTEST_0100
     * @tc.desc   Testing NapiIsExceptionPending NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsExceptionPendingTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsExceptionPendingTest0001 START');
      try {
        let value = napitest.NapiIsExceptionPendingTest();
        console.info('NapiIsExceptionPendingTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsExceptionPendingTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiOpenHandleScopeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIOPENHANDLESCOPETEST_0100
     * @tc.desc   Testing NapiOpenHandleScope NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiOpenHandleScopeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiOpenHandleScopeTest0001 START');
      try {
        let value = napitest.NapiOpenHandleScopeTest();
        console.info('NapiOpenHandleScopeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiOpenHandleScopeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCloseHandleScopeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICLOSEHANDLESCOPETEST_0100
     * @tc.desc   Testing NapiCloseHandleScope NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCloseHandleScopeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCloseHandleScopeTest0001 START');
      try {
        let value = napitest.NapiCloseHandleScopeTest();
        console.info('NapiCloseHandleScopeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCloseHandleScopeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiOpenEscapableHandleScopeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIOPENESCAPABLEHANDLESCOPETEST_0100
     * @tc.desc   Testing NapiOpenEscapableHandleScope NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiOpenEscapableHandleScopeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiOpenEscapableHandleScopeTest0001 START');
      try {
        let value = napitest.NapiOpenEscapableHandleScopeTest();
        console.info('NapiOpenEscapableHandleScopeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiOpenEscapableHandleScopeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCloseEscapableHandleScopeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICLOSEESCAPABLEHANDLESCOPETEST_0100
     * @tc.desc   Testing NapiCloseEscapableHandleScope NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCloseEscapableHandleScopeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCloseEscapableHandleScopeTest0001 START');
      try {
        let value = napitest.NapiCloseEscapableHandleScopeTest();
        console.info('NapiCloseEscapableHandleScopeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCloseEscapableHandleScopeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiEscapeHandleTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIESCAPEHANDLETEST_0100
     * @tc.desc   Testing NapiEscapeHandle NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiEscapeHandleTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiEscapeHandleTest0001 START');
      try {
        let value = napitest.NapiEscapeHandleTest();
        console.info('NapiEscapeHandleTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiEscapeHandleTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateReferenceTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEREFERENCETEST_0100
     * @tc.desc   Testing NapiCreateReference NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateReferenceTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateReferenceTest0001 START');
      try {
        let value = napitest.NapiCreateReferenceTest();
        console.info('NapiCreateReferenceTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateReferenceTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeleteReferenceTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEREFERENCETEST_0100
     * @tc.desc   Testing NapiDeleteReference NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteReferenceTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteReferenceTest0001 START');
      try {
        let value = napitest.NapiDeleteReferenceTest();
        console.info('NapiDeleteReferenceTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteReferenceTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiReferenceRefTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIREFERENCEREFTEST_0100
     * @tc.desc   Testing NapiReferenceRef NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiReferenceRefTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiReferenceRefTest0001 START');
      try {
        let value = napitest.NapiReferenceRefTest();
        console.info('NapiReferenceRefTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiReferenceRefTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiReferenceUnrefTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIREFERENCEUNREFTEST_0100
     * @tc.desc   Testing NapiReferenceUnref NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiReferenceUnrefTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiReferenceUnrefTest0001 START');
      try {
        let value = napitest.NapiReferenceUnrefTest();
        console.info('NapiReferenceUnrefTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiReferenceUnrefTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetReferenceValueTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETREFERENCEVALUETEST_0100
     * @tc.desc   Testing NapiGetReferenceValue NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetReferenceValueTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetReferenceValueTest0001 START');
      try {
        let value = napitest.NapiGetReferenceValueTest();
        console.info('NapiGetReferenceValueTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetReferenceValueTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateArrayTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEARRAYTEST_0100
     * @tc.desc   Testing NapiCreateArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateArrayTest0001 START');
      try {
        let value = napitest.NapiCreateArrayTest();
        console.info('NapiCreateArrayTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateArrayTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateArrayWithLengthTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEARRAYWITHLENGTHTEST_0100
     * @tc.desc   Testing NapiCreateArrayWithLength NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateArrayWithLengthTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateArrayWithLengthTest0001 START');
      try {
        let value = napitest.NapiCreateArrayWithLengthTest();
        console.info('NapiCreateArrayWithLengthTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateArrayWithLengthTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateArrayBufferTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEARRAYBUFFERTEST_0100
     * @tc.desc   Testing NapiCreateArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateArrayBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateArrayBufferTest0001 START');
      try {
        let value = napitest.NapiCreateArrayBufferTest();
        console.info('NapiCreateArrayBufferTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateArrayBufferTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateObjectTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEOBJECTTEST_0100
     * @tc.desc   Testing NapiCreateObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateObjectTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateObjectTest0001 START');
      try {
        let value = napitest.NapiCreateObjectTest();
        console.info('NapiCreateObjectTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateObjectTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateSymbolTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESYMBOLTEST_0100
     * @tc.desc   Testing NapiCreateSymbol NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateSymbolTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateSymbolTest0001 START');
      try {
        let value = napitest.NapiCreateSymbolTest();
        console.info('NapiCreateSymbolTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateSymbolTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateTypedArrayTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATECREATETYPEDARRAYTEST_0100
     * @tc.desc   Testing NapiCreateTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateTypedArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateTypedArrayTest0001 START');
      try {
        let value = napitest.NapiCreateTypedArrayTest();
        console.info('NapiCreateTypedArrayTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateTypedArrayTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateDateViewTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEDATEVIEWTEST_0100
     * @tc.desc   Testing NapiCreateDateView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateDateViewTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateDateViewTest0001 START');
      try {
        let value = napitest.NapiCreateDateViewTest();
        console.info('NapiCreateDateViewTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateDateViewTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateInt32Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEINT32TEST_0100
     * @tc.desc   Testing NapiCreateInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateInt32Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateInt32Test0001 START');
      try {
        let value = napitest.NapiCreateInt32Test();
        console.info('NapiCreateInt32Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateInt32Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateUint32Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEUINT32TEST_0100
     * @tc.desc   Testing NapiCreateUint32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateUint32Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateUint32Test0001 START');
      try {
        let value = napitest.NapiCreateUint32Test();
        console.info('NapiCreateUint32Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateUint32Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateInt64Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEUINT64TEST_0100
     * @tc.desc   Testing NapiCreateInt64 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateInt64Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateInt64Test0001 START');
      try {
        let value = napitest.NapiCreateInt64Test();
        console.info('NapiCreateInt64Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateInt64Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateDoubleTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEDOUBLETEST_0100
     * @tc.desc   Testing NapiCreateDouble NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateDoubleTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateDoubleTest0001 START');
      try {
        let value = napitest.NapiCreateDoubleTest();
        console.info('NapiCreateDoubleTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateDoubleTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateStringLatin1Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESTRINGLATIN1TEST_0100
     * @tc.desc   Testing NapiCreateStringLatin1 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateStringLatin1Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateStringLatin1Test0001 START');
      try {
        let value = napitest.NapiCreateStringLatin1Test();
        console.info('NapiCreateStringLatin1Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateStringLatin1Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateStringUtf8Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESTRINGUTF8TEST_0100
     * @tc.desc   Testing NapiCreateStringUtf8 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateStringUtf8Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateStringUtf8Test0001 START');
      try {
        let value = napitest.NapiCreateStringUtf8Test();
        console.info('NapiCreateStringUtf8Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateStringUtf8Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCreateStringUtf16Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESTRINGUTF16TEST_0100
     * @tc.desc   Testing NapiCreateStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateStringUtf16Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateStringUtf16Test0001 START');
      try {
        let value = napitest.NapiCreateStringUtf16Test();
        console.info('NapiCreateStringUtf16Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateStringUtf16Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetArrayLengthTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETARRAYLENGTHTEST_0100
     * @tc.desc   Testing NapiGetArrayLength NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetArrayLengthTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetArrayLengthTest0001 START');
      try {
        let value = napitest.NapiGetArrayLengthTest();
        console.info('NapiGetArrayLengthTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetArrayLengthTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetArrayBufferInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETARRAYBUFFERINFOTEST_0100
     * @tc.desc   Testing NapiGetArrayBufferInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetArrayBufferInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetArrayBufferInfoTest0001 START');
      try {
        let value = napitest.NapiGetArrayBufferInfoTest();
        console.info('NapiGetArrayBufferInfoTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetArrayBufferInfoTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPrototypeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROTOTYPETEST_0100
     * @tc.desc   Testing NapiGetPrototype NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPrototypeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPrototypeTest0001 START');
      try {
        let value = napitest.NapiGetPrototypeTest();
        console.info('NapiGetPrototypeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPrototypeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetTypedArrayTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETYPEDARRAYTEST_0100
     * @tc.desc   Testing NapiGetTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetTypedArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetTypedArrayTest0001 START');
      try {
        let value = napitest.NapiGetTypedArrayTest();
        console.info('NapiGetTypedArrayTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetTypedArrayTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetDataViewInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETDATAVIEWINFOTEST_0100
     * @tc.desc   Testing NapiGetDataViewInfo NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetDataViewInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetDataViewInfoTest0001 START');
      try {
        let value = napitest.NapiGetDataViewInfoTest();
        console.info('NapiGetDataViewInfoTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetDataViewInfoTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetValueBoolTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUEBOOLTEST_0100
     * @tc.desc   Testing NapiGetValueBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueBoolTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueBoolTest0001 START');
      try {
        let value = napitest.NapiGetValueBoolTest();
        console.info('NapiGetValueBoolTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueBoolTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetValueDoubleTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUEDOUBLETEST_0100
     * @tc.desc   Testing NapiGetValueDouble NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueDoubleTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueDoubleTest0001 START');
      try {
        let value = napitest.NapiGetValueDoubleTest();
        console.info('NapiGetValueDoubleTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueDoubleTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetValueInt32Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUEINT32TEST_0100
     * @tc.desc   Testing NapiGetValueInt32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueInt32Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueInt32Test0001 START');
      try {
        let value = napitest.NapiGetValueInt32Test();
        console.info('NapiGetValueInt32Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueInt32Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetValueInt64Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUEINT64TEST_0100
     * @tc.desc   Testing NapiGetValueInt64 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueInt64Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueInt64Test0001 START');
      try {
        let value = napitest.NapiGetValueInt64Test();
        console.info('NapiGetValueInt64Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueInt64Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetValueStringLatin1Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUESTRINGLATIN1TEST_0100
     * @tc.desc   Testing NapiGetValueStringLatin1 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueStringLatin1Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueStringLatin1Test0001 START');
      try {
        let value = napitest.NapiGetValueStringLatin1Test();
        console.info('NapiGetValueStringLatin1Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueStringLatin1Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetValueStringUtf8Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUESTRINGUTF8TEST_0100
     * @tc.desc   Testing NapiGetValueStringUtf8Test NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueStringUtf8Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueStringUtf8Test0001 START');
      try {
        let value = napitest.NapiGetValueStringUtf8Test();
        console.info('NapiGetValueStringUtf8Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueStringUtf8Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetValueStringUtf16Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUESTRINGUTF16TEST_0100
     * @tc.desc   Testing NapiGetValueStringUtf16 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueStringUtf16Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueStringUtf16Test0001 START');
      try {
        let value = napitest.NapiGetValueStringUtf16Test();
        console.info('NapiGetValueStringUtf16Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueStringUtf16Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetValueUint32Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUEUINT32TEST_0100
     * @tc.desc   Testing NapiGetValueUint32 NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueUint32Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueUint32Test0001 START');
      try {
        let value = napitest.NapiGetValueUint32Test();
        console.info('NapiGetValueUint32Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueUint32Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetBooleanTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETBOOLEANTEST_0100
     * @tc.desc   Testing NapiGetBoolean NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetBooleanTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetBooleanTest0001 START');
      try {
        let value = napitest.NapiGetBooleanTest();
        console.info('NapiGetBooleanTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetBooleanTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetGlobalTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETGLOBALTEST_0100
     * @tc.desc   Testing NapiGetGlobal NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetGlobalTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetGlobalTest0001 START');
      try {
        let value = napitest.NapiGetGlobalTest();
        console.info('NapiGetGlobalTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetGlobalTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetNullTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETNULLTEST_0100
     * @tc.desc   Testing NapiGetNull NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetNullTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetNullTest0001 START');
      try {
        let value = napitest.NapiGetNullTest();
        console.info('NapiGetNullTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetNullTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetUndefinedTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETUNDEFINEDTEST_0100
     * @tc.desc   Testing NapiGetUndefined NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetUndefinedTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetUndefinedTest0001 START');
      try {
        let value = napitest.NapiGetUndefinedTest();
        console.info('NapiGetUndefinedTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetUndefinedTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCoerceToBoolTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICOERCETOBOOLTEST_0100
     * @tc.desc   Testing NapiCoerceToBool NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCoerceToBoolTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCoerceToBoolTest0001 START');
      try {
        let value = napitest.NapiCoerceToBoolTest();
        console.info('NapiCoerceToBoolTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCoerceToBoolTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCoerceToNumberTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICOERCETONUMBERTEST_0100
     * @tc.desc   Testing NapiCoerceToNumber NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCoerceToNumberTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCoerceToNumberTest0001 START');
      try {
        let value = napitest.NapiCoerceToNumberTest();
        console.info('NapiCoerceToNumberTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCoerceToNumberTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCoerceToObjectTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICOERCETOOBJECTTEST_0100
     * @tc.desc   Testing NapiCoerceToObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCoerceToObjectTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCoerceToObjectTest0001 START');
      try {
        let value = napitest.NapiCoerceToObjectTest();
        console.info('NapiCoerceToObjectTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCoerceToObjectTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiCoerceToStringTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICOERCETOSTRINGTEST_0100
     * @tc.desc   Testing NapiCoerceToString NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCoerceToStringTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCoerceToStringTest0001 START');
      try {
        let value = napitest.NapiCoerceToStringTest();
        console.info('NapiCoerceToStringTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCoerceToStringTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiTypeOfTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITYPEOFTEST_0100
     * @tc.desc   Testing NapiTypeOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiTypeOfTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiTypeOfTest0001 START');
      try {
        let value = napitest.NapiTypeOfTest();
        console.info('NapiTypeOfTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiTypeOfTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiInstanceOfTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIINSTANCEOFTEST_0100
     * @tc.desc   Testing NapiInstanceOf NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiInstanceOfTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiInstanceOfTest0001 START');
      try {
        let value = napitest.NapiInstanceOfTest();
        console.info('NapiInstanceOfTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiInstanceOfTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiIsArrayTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISARRAYTEST_0100
     * @tc.desc   Testing NapiIsArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsArrayTest0001 START');
      try {
        let value = napitest.NapiIsArrayTest();
        console.info('NapiIsArrayTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsArrayTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiIsArrayBufferTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISARRAYBUFFERTEST_0100
     * @tc.desc   Testing NapiIsArrayBuffer NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsArrayBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsArrayBufferTest0001 START');
      try {
        let value = napitest.NapiIsArrayBufferTest();
        console.info('NapiIsArrayBufferTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsArrayBufferTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiIsTypedArrayTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISTYPEDARRAYTEST_0100
     * @tc.desc   Testing NapiIsTypedArray NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsTypedArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsTypedArrayTest0001 START');
      try {
        let value = napitest.NapiIsTypedArrayTest();
        console.info('NapiIsTypedArrayTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsTypedArrayTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiIsDataViewTestTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISDATAVIEWTEST_0100
     * @tc.desc   Testing NapiIsDataView NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsDataViewTestTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsDataViewTest0001 START');
      try {
        let value = napitest.NapiIsDataViewTest();
        console.info('NapiIsDataViewTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsDataViewTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiIsDateTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISDATETEST_0100
     * @tc.desc   Testing NapiIsDate NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsDateTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsDateTest0001 START');
      try {
        let value = napitest.NapiIsDateTest();
        console.info('NapiIsDateTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsDateTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiStrictEqualsTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISTRICTEQUALSTEST_0100
     * @tc.desc   Testing NapiStrictEquals NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiStrictEqualsTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiStrictEqualsTest0001 START');
      try {
        let value = napitest.NapiStrictEqualsTest();
        console.info('NapiStrictEqualsTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiStrictEqualsTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropertyNamesTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPERTYNAMETEST_0100
     * @tc.desc   Testing NapiGetPropertyNames NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropertyNamesTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropertyNamesTest0001 START');
      try {
        let value = napitest.NapiGetPropertyNamesTest();
        console.info('NapiGetPropertyNamesTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropertyNamesTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetPropertyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETPROPERTYTEST_0100
     * @tc.desc   Testing NapiSetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetPropertyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetPropertyTest0001 START');
      try {
        let value = napitest.NapiSetPropertyTest();
        console.info('NapiSetPropertyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetPropertyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetPropertyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETPROPERTYTEST_0100
     * @tc.desc   Testing NapiGetProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetPropertyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetPropertyTest0001 START');
      try {
        let value = napitest.NapiGetPropertyTest();
        console.info('NapiGetPropertyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetPropertyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiHasPropertyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIHASPROPERTYTEST_0100
     * @tc.desc   Testing NapiHasProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiHasPropertyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiHasPropertyTest0001 START');
      try {
        let value = napitest.NapiHasPropertyTest();
        console.info('NapiHasPropertyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiHasPropertyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeletePropertyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEPROPERTYTEST_0100
     * @tc.desc   Testing NapiDeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeletePropertyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeletePropertyTest0001 START');
      try {
        let value = napitest.NapiDeletePropertyTest01();
        console.info('NapiDeletePropertyTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeletePropertyTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeletePropertyTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEPROPERTYTEST_0200
     * @tc.desc   Testing NapiDeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeletePropertyTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeletePropertyTest0002 START');
      try {
        let value = napitest.NapiDeletePropertyTest02();
        console.info('NapiDeletePropertyTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeletePropertyTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeletePropertyTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEPROPERTYTEST_0300
     * @tc.desc   Testing NapiDeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeletePropertyTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeletePropertyTest0003 START');
      try {
        let value = napitest.NapiDeletePropertyTest03();
        console.info('NapiDeletePropertyTest03 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeletePropertyTest03 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeletePropertyTest0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEPROPERTYTEST_0400
     * @tc.desc   Testing NapiDeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeletePropertyTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeletePropertyTest0004 START');
      try {
        let value = napitest.NapiDeletePropertyTest04();
        console.info('NapiDeletePropertyTest04 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeletePropertyTest04 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeletePropertyTest0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEPROPERTYTEST_0500
     * @tc.desc   Testing NapiDeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeletePropertyTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeletePropertyTest0005 START');
      try {
        let value = napitest.NapiDeletePropertyTest05();
        console.info('NapiDeletePropertyTest05 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeletePropertyTest05 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeletePropertyTest0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEPROPERTYTEST_0600
     * @tc.desc   Testing NapiDeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeletePropertyTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeletePropertyTest0006 START');
      try {
        let value = napitest.NapiDeletePropertyTest06();
        console.info('NapiDeletePropertyTest06 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeletePropertyTest06 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeletePropertyTest0007
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEPROPERTYTEST_0700
     * @tc.desc   Testing NapiDeleteProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeletePropertyTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeletePropertyTest0007 START');
      try {
        let value = napitest.NapiDeletePropertyTest07();
        console.info('NapiDeletePropertyTest07 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeletePropertyTest07 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiHasOwnPropertyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIHASOWNPROPERTYTEST_0100
     * @tc.desc   Testing NapiHasOwnProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiHasOwnPropertyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiHasOwnPropertyTest0001 START');
      try {
        let value = napitest.NapiHasOwnPropertyTest();
        console.info('NapiHasOwnPropertyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiHasOwnPropertyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetNamedPropertyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETNAMEDPROPERTYTEST_0100
     * @tc.desc   Testing NapiSetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetNamedPropertyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetNamedPropertyTest0001 START');
      try {
        let value = napitest.NapiSetNamedPropertyTest();
        console.info('NapiSetNamedPropertyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetNamedPropertyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetNamedPropertyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETNAMEDPROPERTYTEST_0100
     * @tc.desc   Testing NapiGetNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetNamedPropertyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetNamedPropertyTest0001 START');
      try {
        let value = napitest.NapiGetNamedPropertyTest();
        console.info('NapiGetNamedPropertyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetNamedPropertyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiHasNamedPropertyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIHASNAMEDPROPERTYTEST_0100
     * @tc.desc   Testing NapiHasNamedProperty NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiHasNamedPropertyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiHasNamedPropertyTest0001 START');
      try {
        let value = napitest.NapiHasNamedPropertyTest();
        console.info('NapiHasNamedPropertyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiHasNamedPropertyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiSetElementTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETELEMENTTEST_0100
     * @tc.desc   Testing NapiSetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetElementTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetElementTest0001 START');
      try {
        let value = napitest.NapiSetElementTest();
        console.info('NapiSetElementTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetElementTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiGetElementTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETELEMENTTEST_0100
     * @tc.desc   Testing NapiGetElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetElementTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetElementTest0001 START');
      try {
        let value = napitest.NapiGetElementTest();
        console.info('NapiGetElementTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetElementTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiHasElementTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIHASELEMENTTEST_0100
     * @tc.desc   Testing NapiHasElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiHasElementTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiHasElementTest0001 START');
      try {
        let value = napitest.NapiHasElementTest();
        console.info('NapiHasElementTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiHasElementTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeleteElementTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEELEMENTTEST_0100
     * @tc.desc   Testing NapiDeleteElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteElementTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteElementTest0001 START');
      try {
        let value = napitest.NapiDeleteElementTest01();
        console.info('NapiDeleteElementTest01 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteElementTest01 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeleteElementTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEELEMENTTEST_0200
     * @tc.desc   Testing NapiDeleteElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteElementTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteElementTest0002 START');
      try {
        let value = napitest.NapiDeleteElementTest02();
        console.info('NapiDeleteElementTest02 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteElementTest02 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeleteElementTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEELEMENTTEST_0300
     * @tc.desc   Testing NapiDeleteElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteElementTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteElementTest0003 START');
      try {
        let value = napitest.NapiDeleteElementTest03();
        console.info('NapiDeleteElementTest03 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteElementTest03 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeleteElementTest0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEELEMENTTEST_0400
     * @tc.desc   Testing NapiDeleteElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteElementTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteElementTest0004 START');
      try {
        let value = napitest.NapiDeleteElementTest04();
        console.info('NapiDeleteElementTest04 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteElementTest04 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDeleteElementTest0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEELEMENTTEST_0500
     * @tc.desc   Testing NapiDeleteElement NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteElementTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteElementTest0005 START');
      try {
        let value = napitest.NapiDeleteElementTest05();
        console.info('NapiDeleteElementTest05 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteElementTest05 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiDefinePropertiesTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINEPROPERTIESTEST_0100
     * @tc.desc   Testing NapiDefineProperties NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefinePropertiesTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefinePropertiesTest0001 START');
      try {
        let value = napitest.NapiDefinePropertiesTest();
        console.info('NapiDefinePropertiesTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefinePropertiesTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiTypeTagObjectTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITYPETAGOBJECTTEST_0100
     * @tc.desc   Testing NapiTypeTagObject NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiTypeTagObjectTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiTypeTagObjectTest0001 START');
      try {
        let value = napitest.NapiTypeTagObjectTest();
        console.info('NapiTypeTagObjectTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiTypeTagObjectTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    /**
     * @tc.name   testNapiRemoveWrapSendableTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIREMOVEWRAPSENDABLETEST_0100
     * @tc.desc   Testing NapiRemoveWrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRemoveWrapSendableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiRemoveWrapSendableTest0001 START');
      try {
        let value = napitest.NapiRemoveWrapSendableTest1();
        console.info('NapiRemoveWrapSendable value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiRemoveWrapSendable err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiUwrapSendableTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIUWRAPSENDABLETEST_0100
     * @tc.desc   Testing NapiUwrapSendable NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiUwrapSendableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiUwrapSendableTest0001 START');
      try {
        let value = napitest.NapiUwrapSendableTest();
        console.info('NapiUwrapSendableTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiUwrapSendableTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapSendableWithSizeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPSENDABLEWITHSIZETEST_0100
     * @tc.desc   Testing NapiWrapSendableWithSize NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapSendableWithSizeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapSendableWithSizeTest0001 START');
      try {
        let value = napitest.NapiWrapSendableWithSizeTest1();
        console.info('NapiWrapSendableWithSizeTest1 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapSendableWithSizeTest1 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapSendableTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPSENDABLETEST_0100
     * @tc.desc   Testing NapiWrapSendableTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapSendableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapSendableTest0001 START');
      try {
        let value = napitest.NapiWrapSendableTest1();
        console.info('NapiWrapSendableTest1 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapSendableTest1 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateSendableTypeArrayTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATSENDABLETYPEARRAYTEST_0100
     * @tc.desc   Testing NapiCreateSendableTypeArrayTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateSendableTypeArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateSendableTypeArrayTest0001 START');
      try {
        let value = napitest.NapiCreateSendableTypeArrayTest();
        console.info('NapiCreateSendableTypeArrayTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateSendableTypeArrayTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateSendableArrayBufferTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATSENDABLEARRAYBUFFERTEST_0100
     * @tc.desc   Testing NapiCreateSendableArrayBufferTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateSendableArrayBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateSendableArrayBufferTest0001 START');
      try {
        let value = napitest.NapiCreateSendableArrayBufferTest();
        console.info('NapiCreateSendableArrayBufferTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateSendableArrayBufferTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateSendableArrayWithLengthTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATSENDABLEARRAYWITHLENGTHTEST_0100
     * @tc.desc   Testing NapiCreateSendableArrayWithLengthTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateSendableArrayWithLengthTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateSendableArrayWithLengthTest0001 START');
      try {
        let value = napitest.NapiCreateSendableArrayWithLengthTest();
        console.info('NapiCreateSendableArrayWithLengthTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateSendableArrayWithLengthTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateSendableArrayTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATSENDABLEARRAYTEST_0100
     * @tc.desc   Testing NapiCreateSendableArrayTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateSendableArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateSendableArrayTest0001 START');
      try {
        let value = napitest.NapiCreateSendableArrayTest();
        console.info('NapiCreateSendableArrayTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateSendableArrayTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateSendableObjectWithPropertiesTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATSENDABLEOBJECTWITHPROPERTIESTEST_0100
     * @tc.desc   Testing NapiCreateSendableObjectWithPropertiesTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateSendableObjectWithPropertiesTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateSendableObjectWithPropertiesTest0001 START');
      try {
        let value = napitest.NapiCreateSendableObjectWithPropertiesTest();
        console.info('NapiCreateSendableObjectWithPropertiesTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateSendableObjectWithPropertiesTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineSendableClassTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINESENDABLECLASSTEST_0100
     * @tc.desc   Testing NapiDefineSendableClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineSendableClassTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineSendableClassTest0001 START');
      try {
        let value = napitest.NapiDefineSendableClassTest1();
        console.info('NapiDefineSendableClassTest1 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineSendableClassTest1 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineSendableClassTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINESENDABLECLASSTEST_0200
     * @tc.desc   Testing NapiDefineSendableClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineSendableClassTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineSendableClassTest0002 START');
      try {
        let value = napitest.NapiDefineSendableClassTest2();
        console.info('NapiDefineSendableClassTest2 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineSendableClassTest2 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineSendableClassTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINESENDABLECLASSTEST_0300
     * @tc.desc   Testing NapiDefineSendableClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineSendableClassTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineSendableClassTest0003 START');
      try {
        let value = napitest.NapiDefineSendableClassTest3();
        console.info('NapiDefineSendableClassTest3 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineSendableClassTest3 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineSendableClassTest0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINESENDABLECLASSTEST_0400
     * @tc.desc   Testing NapiDefineSendableClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineSendableClassTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineSendableClassTest0004 START');
      try {
        let value = napitest.NapiDefineSendableClassTest4();
        console.info('NapiDefineSendableClassTest4 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineSendableClassTest4 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineSendableClassTest0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINESENDABLECLASSTEST_0500
     * @tc.desc   Testing NapiDefineSendableClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineSendableClassTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineSendableClassTest0005 START');
      try {
        let value = napitest.NapiDefineSendableClassTest5();
        console.info('NapiDefineSendableClassTest5 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineSendableClassTest5 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineSendableClassTest0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINESENDABLECLASSTEST_0600
     * @tc.desc   Testing NapiDefineSendableClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineSendableClassTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineSendableClassTest0006 START');
      try {
        let value = napitest.NapiDefineSendableClassTest6();
        console.info('NapiDefineSendableClassTest6 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineSendableClassTest6 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineSendableClassTest0007
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINESENDABLECLASSTEST_0700
     * @tc.desc   Testing NapiDefineSendableClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineSendableClassTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineSendableClassTest0007 START');
      try {
        let value = napitest.NapiDefineSendableClassTest7();
        console.info('NapiDefineSendableClassTest7 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineSendableClassTest7 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineSendableClassTest0008
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINESENDABLECLASSTEST_0800
     * @tc.desc   Testing NapiDefineSendableClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineSendableClassTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineSendableClassTest0008 START');
      try {
        let value = napitest.NapiDefineSendableClassTest8();
        console.info('NapiDefineSendableClassTest8 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineSendableClassTest8 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiIsSendableTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLETEST_0100
     * @tc.desc   Testing NapiIsSendableTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsSendableTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsSendableTest0001 START');
      try {
        let value = napitest.NapiIsSendableTest();
        console.info('NapiIsSendableTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsSendableTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCallThreadsafeFunctionWithPriorityTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLTHREADSAFEFUNCTIONWITHPRIORITYTEST_0100
     * @tc.desc   Testing NapiCallThreadsafeFunctionWithPriorityTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallThreadsafeFunctionWithPriorityTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallThreadsafeFunctionWithPriorityTest0001 START');
      try {
        let value = napitest.NapiCallThreadsafeFunctionWithPriorityTest();
        console.info('NapiCallThreadsafeFunctionWithPriorityTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallThreadsafeFunctionWithPriorityTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDeleteSerializationDataTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETESERIALIZATIONDATATEST_0100
     * @tc.desc   Testing NapiDeleteSerializationDataTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteSerializationDataTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteSerializationDataTest0001 START');
      try {
        let value = napitest.NapiDeleteSerializationDataTest();
        console.info('NapiDeleteSerializationDataTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteSerializationDataTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDeserializeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZETEST_0100
     * @tc.desc   Testing NapiDeserializeTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeserializeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeserializeTest0001 START');
      try {
        let value = napitest.NapiDeserializeTest();
        console.info('NapiDeserializeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeserializeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiSerializeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALZETEST_0100
     * @tc.desc   Testing NapiSerializeTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSerializeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSerializeTest0001 START');
      try {
        let value = napitest.NapiSerializeTest();
        console.info('NapiSerializeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSerializeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiLoadModuleWithInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPILOADMODULEWITHINFOTEST_0100
     * @tc.desc   Testing NapiLoadModuleWithInfoTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiLoadModuleWithInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiLoadModuleWithInfoTest0001 START');
      try {
        let value = napitest.NapiLoadModuleWithInfoTest();
        console.info('NapiLoadModuleWithInfoTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiLoadModuleWithInfoTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiStopEventLoopTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISTOPEVENTLOOPTEST_0100
     * @tc.desc   Testing NapiStopEventLoopTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiStopEventLoopTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiStopEventLoopTest0001 START');
      try {
        let value = napitest.NapiStopEventLoopTest();
        console.info('NapiStopEventLoopTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiStopEventLoopTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiRunEventLoopTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIRUNEVENTLOOPTEST_0100
     * @tc.desc   Testing NapiRunEventLoopTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRunEventLoopTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiRunEventLoopTest0001 START');
      try {
        let value = napitest.NapiRunEventLoopTest();
        console.info('NapiRunEventLoopTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiRunEventLoopTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDestroyArkRuntimeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESTROYARKRUNTIMETEST_0100
     * @tc.desc   Testing NapiDestroyArkRuntimeTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDestroyArkRuntimeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDestroyArkRuntimeTest0001 START');
      try {
        let value = napitest.NapiDestroyArkRuntimeTest();
        console.info('NapiDestroyArkRuntimeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDestroyArkRuntimeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateArkRuntimeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEARKRUNTIMETEST_0100
     * @tc.desc   Testing NapiCreateArkRuntimeTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateArkRuntimeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateArkRuntimeTest0001 START');
      try {
        let value = napitest.NapiCreateArkRuntimeTest();
        console.info('NapiCreateArkRuntimeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateArkRuntimeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCoerceToNativeBindingObjectTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICOERCETONATIVEBINDINGOBJECTTEST_0100
     * @tc.desc   Testing NapiCoerceToNativeBindingObjectTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCoerceToNativeBindingObjectTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCoerceToNativeBindingObjectTest0001 START');
      try {
        let value = napitest.NapiCoerceToNativeBindingObjectTest();
        console.info('NapiCoerceToNativeBindingObjectTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCoerceToNativeBindingObjectTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateObjectWithNamedPropertiesTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEOBJECTWITHNAMEPROPERTIESTEST_0100
     * @tc.desc   Testing NapiCreateObjectWithNamedPropertiesTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateObjectWithNamedPropertiesTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateObjectWithNamedPropertiesTest0001 START');
      try {
        let value = napitest.NapiCreateObjectWithNamedPropertiesTest();
        console.info('NapiCreateObjectWithNamedPropertiesTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateObjectWithNamedPropertiesTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateObjectWithPropertiesTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICOERCETONATIVEBINDINGOBJECTTEST_0100
     * @tc.desc   Testing NapiCreateObjectWithPropertiesTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateObjectWithPropertiesTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateObjectWithPropertiesTest0001 START');
      try {
        let value = napitest.NapiCreateObjectWithPropertiesTest();
        console.info('NapiCreateObjectWithPropertiesTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateObjectWithPropertiesTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiLoadModuleTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPILOADMODULETEST_0100
     * @tc.desc   Testing NapiLoadModuleTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiLoadModuleTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiLoadModuleTest0001 START');
      try {
        let value = napitest.NapiLoadModuleTest();
        console.info('NapiLoadModuleTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiLoadModuleTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiRunScriptPathTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIRUNSCRIPTPATHTEST_0100
     * @tc.desc   Testing NapiRunScriptPathTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRunScriptPathTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiRunScriptPathTest0001 START');
      try {
        let value = napitest.NapiRunScriptPathTest();
        console.info('NapiRunScriptPathTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiRunScriptPathTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiQueueAsyncWorkWithQosTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIQUEUEASYNCWORKWITHQOSTEST_0100
     * @tc.desc   Testing NapiQueueAsyncWorkWithQosTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiQueueAsyncWorkWithQosTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiQueueAsyncWorkWithQosTest0001 START');
      try {
        let value = napitest.NapiQueueAsyncWorkWithQosTest();
        console.info('NapiQueueAsyncWorkWithQosTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiQueueAsyncWorkWithQosTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiFatalExceptionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIFATALEXCEPTIONTEST_0100
     * @tc.desc   Testing NapiFatalExceptionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiFatalExceptionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiFatalExceptionTest0001 START');
      try {
        let value = napitest.NapiFatalExceptionTest();
        console.info('NapiFatalExceptionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiFatalExceptionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiAddFinalizerTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIADDFINALIZERTEST_0100
     * @tc.desc   Testing NapiAddFinalizerTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiAddFinalizerTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiAddFinalizerTest0001 START');
      try {
        let value = napitest.NapiAddFinalizerTest();
        console.info('NapiAddFinalizerTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiAddFinalizerTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNodeApiGetModuleFileNameTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NODEAPIGETMODULEFILENAMETEST_0100
     * @tc.desc   Testing NodeApiGetModuleFileNameTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNodeApiGetModuleFileNameTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNodeApiGetModuleFileNameTest0001 START');
      try {
        let value = napitest.NodeApiGetModuleFileNameTest();
        console.info('NodeApiGetModuleFileNameTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NodeApiGetModuleFileNameTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiRemoveAsyncCleanupHookTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIREMOVEASYNCCLEANUPHOOKTEST_0100
     * @tc.desc   Testing NapiRemoveAsyncCleanupHookTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRemoveAsyncCleanupHookTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiRemoveAsyncCleanupHookTest0001 START');
      try {
        let value = napitest.NapiRemoveAsyncCleanupHookTest();
        console.info('NapiRemoveAsyncCleanupHookTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiRemoveAsyncCleanupHookTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiAddAsyncCleanupHookTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIADDASYNCCLEANUPHOOKTEST_0100
     * @tc.desc   Testing NapiAddAsyncCleanupHookTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiAddAsyncCleanupHookTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiAddAsyncCleanupHookTest0001 START');
      try {
        let value = napitest.NapiAddAsyncCleanupHookTest();
        console.info('NapiAddAsyncCleanupHookTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiAddAsyncCleanupHookTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiRemoveEnvCleanupHookTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIREMOVEENVCLEANUPHOOKTEST_0100
     * @tc.desc   Testing NapiRemoveEnvCleanupHookTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRemoveEnvCleanupHookTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiRemoveEnvCleanupHookTest0001 START');
      try {
        let value = napitest.NapiRemoveEnvCleanupHookTest();
        console.info('NapiRemoveEnvCleanupHookTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiRemoveEnvCleanupHookTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiAddEnvCleanupHookTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIADDENVCLEANUPHOOKTEST_0100
     * @tc.desc   Testing NapiAddEnvCleanupHookTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiAddEnvCleanupHookTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiAddEnvCleanupHookTest0001 START');
      try {
        let value = napitest.NapiAddEnvCleanupHookTest();
        console.info('NapiAddEnvCleanupHookTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiAddEnvCleanupHookTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetInstanceDataTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETINSTANCEDATATEST_0100
     * @tc.desc   Testing NapiGetInstanceDataTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetInstanceDataTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetInstanceDataTest0001 START');
      try {
        let value = napitest.NapiGetInstanceDataTest();
        console.info('NapiGetInstanceDataTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetInstanceDataTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiSetInstanceDataTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPISETINSTANCEDATATEST_0100
     * @tc.desc   Testing NapiSetInstanceDataTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiSetInstanceDataTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiSetInstanceDataTest0001 START');
      try {
        let value = napitest.NapiSetInstanceDataTest();
        console.info('NapiSetInstanceDataTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiSetInstanceDataTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiIsDetachedArrayBufferTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISDETACHEDARRAYBUFFERTEST_0100
     * @tc.desc   Testing NapiIsDetachedArrayBufferTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsDetachedArrayBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsDetachedArrayBufferTest0001 START');
      try {
        let value = napitest.NapiIsDetachedArrayBufferTest();
        console.info('NapiIsDetachedArrayBufferTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsDetachedArrayBufferTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDetachedArrayBufferTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDETACHEDARRAYBUFFERTEST_0100
     * @tc.desc   Testing NapiDetachedArrayBufferTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDetachedArrayBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDetachedArrayBufferTest0001 START');
      try {
        let value = napitest.NapiDetachedArrayBufferTest();
        console.info('NapiDetachedArrayBufferTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDetachedArrayBufferTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetAllPropertyNamesTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETALLPROPERTYNAMESTEST_0100
     * @tc.desc   Testing NapiGetAllPropertyNamesTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetAllPropertyNamesTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetAllPropertyNamesTest0001 START');
      try {
        let value = napitest.NapiGetAllPropertyNamesTest();
        console.info('NapiGetAllPropertyNamesTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetAllPropertyNamesTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiObjectSealTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIOBJECTSEALTEST_0100
     * @tc.desc   Testing NapiObjectSealTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiObjectSealTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiObjectSealTest0001 START');
      try {
        let value = napitest.NapiObjectSealTest();
        console.info('NapiObjectSealTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiObjectSealTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiObjectFreezeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIOBJECTFREEZETEST_0100
     * @tc.desc   Testing NapiObjectFreezeTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiObjectFreezeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiObjectFreezeTest0001 START');
      try {
        let value = napitest.NapiObjectFreezeTest();
        console.info('NapiObjectFreezeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiObjectFreezeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiIsBufferTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISBUFFERTEST_0100
     * @tc.desc   Testing NapiIsBufferTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsBufferTest0001 START');
      try {
        let value = napitest.NapiIsBufferTest();
        console.info('NapiIsBufferTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsBufferTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetBufferInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETBUFFERINFOTEST_0100
     * @tc.desc   Testing NapiGetBufferInfoTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetBufferInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetBufferInfoTest0001 START');
      try {
        let value = napitest.NapiGetBufferInfoTest();
        console.info('NapiGetBufferInfoTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetBufferInfoTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateExternalBufferTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEEXTERNALBUFFERTEST_0100
     * @tc.desc   Testing NapiCreateExternalBufferTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateExternalBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateExternalBufferTest0001 START');
      try {
        let value = napitest.NapiCreateExternalBufferTest();
        console.info('NapiCreateExternalBufferTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateExternalBufferTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateBufferCopyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEBUFFERCOPYTEST_0100
     * @tc.desc   Testing NapiCreateBufferCopyTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateBufferCopyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateBufferCopyTest0001 START');
      try {
        let value = napitest.NapiCreateBufferCopyTest();
        console.info('NapiCreateBufferCopyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateBufferCopyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateBufferTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEBUFFERTEST_0100
     * @tc.desc   Testing NapiCreateBufferTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateBufferTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateBufferTest0001 START');
      try {
        let value = napitest.NapiCreateBufferTest();
        console.info('NapiCreateBufferTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateBufferTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetValueBigintWordsTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUEBIGINTWORDSTEST_0100
     * @tc.desc   Testing NapiGetValueBigintWordsTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueBigintWordsTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueBigintWordsTest0001 START');
      try {
        let value = napitest.NapiGetValueBigintWordsTest();
        console.info('NapiGetValueBigintWordsTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueBigintWordsTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetValueBigintUint64Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUEBIGINTUINT64TEST_0100
     * @tc.desc   Testing NapiGetValueBigintUint64Test NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueBigintUint64Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueBigintUint64Test0001 START');
      try {
        let value = napitest.NapiGetValueBigintUint64Test();
        console.info('NapiGetValueBigintUint64Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueBigintUint64Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetValueBigintInt64Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVALUEBIGINTINT64TEST_0100
     * @tc.desc   Testing NapiGetValueBigintInt64Test NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetValueBigintInt64Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetValueBigintInt64Test0001 START');
      try {
        let value = napitest.NapiGetValueBigintInt64Test();
        console.info('NapiGetValueBigintInt64Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetValueBigintInt64Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateBigintWordsTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEBIGINTWORDSTEST_0100
     * @tc.desc   Testing NapiCreateBigintWordsTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateBigintWordsTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateBigintWordsTest0001 START');
      try {
        let value = napitest.NapiCreateBigintWordsTest();
        console.info('NapiCreateBigintWordsTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateBigintWordsTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateBigintUint64Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEBIGINTUINT64TEST_0100
     * @tc.desc   Testing NapiCreateBigintUint64Test NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateBigintUint64Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateBigintUint64Test0001 START');
      try {
        let value = napitest.NapiCreateBigintUint64Test();
        console.info('NapiCreateBigintUint64Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateBigintUint64Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateBigintInt64Test0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEBIGINTINT64TEST_0100
     * @tc.desc   Testing NapiCreateBigintInt64Test NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateBigintInt64Test0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateBigintInt64Test0001 START');
      try {
        let value = napitest.NapiCreateBigintInt64Test();
        console.info('NapiCreateBigintInt64Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateBigintInt64Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetDataValueTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETDATAVALUETEST_0100
     * @tc.desc   Testing NapiGetDataValueTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetDataValueTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetDataValueTest0001 START');
      try {
        let value = napitest.NapiGetDataValueTest();
        console.info('NapiGetDataValueTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetDataValueTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateDataTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEDATATEST_0100
     * @tc.desc   Testing NapiCreateDataTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateDataTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateDataTest0001 START');
      try {
        let value = napitest.NapiCreateDataTest();
        console.info('NapiCreateDataTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateDataTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiUnrefThreadsafeFunctionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIUNREFTHREADSAFEFUNCTIONTEST_0100
     * @tc.desc   Testing NapiUnrefThreadsafeFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiUnrefThreadsafeFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiUnrefThreadsafeFunctionTest0001 START');
      try {
        let value = napitest.NapiUnrefThreadsafeFunctionTest();
        console.info('NapiUnrefThreadsafeFunctionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiUnrefThreadsafeFunctionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiRefThreadsafeFunctionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIREFTHREADSAFEFUNCTIONTEST_0100
     * @tc.desc   Testing NapiRefThreadsafeFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRefThreadsafeFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiRefThreadsafeFunctionTest0001 START');
      try {
        let value = napitest.NapiRefThreadsafeFunctionTest();
        console.info('NapiRefThreadsafeFunctionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiRefThreadsafeFunctionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiReleaseThreadsafeFunctionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIRELEASETHREADSAFEFUNCTIONTEST_0100
     * @tc.desc   Testing NapiReleaseThreadsafeFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiReleaseThreadsafeFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiReleaseThreadsafeFunctionTest0001 START');
      try {
        let value = napitest.NapiReleaseThreadsafeFunctionTest();
        console.info('NapiReleaseThreadsafeFunctionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiReleaseThreadsafeFunctionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiAcquireThreadsafeFunctionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIACQUIRETHREADSAFEFUNCTIONTEST_0100
     * @tc.desc   Testing NapiAcquireThreadsafeFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiAcquireThreadsafeFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiAcquireThreadsafeFunctionTest0001 START');
      try {
        let value = napitest.NapiAcquireThreadsafeFunctionTest();
        console.info('NapiAcquireThreadsafeFunctionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiAcquireThreadsafeFunctionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCallThreadsafeFunctionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLTHREADSAFEFUNCTIONTEST_0100
     * @tc.desc   Testing NapiCallThreadsafeFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallThreadsafeFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallThreadsafeFunctionTest0001 START');
      try {
        let value = napitest.NapiCallThreadsafeFunctionTest();
        console.info('NapiCallThreadsafeFunctionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallThreadsafeFunctionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetThreadsafeFunctionContextTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETTHREADSAFEFUNCTIONCONTEXTTEST_0100
     * @tc.desc   Testing NapiGetThreadsafeFunctionContextTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetThreadsafeFunctionContextTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetThreadsafeFunctionContextTest0001 START');
      try {
        let value = napitest.NapiGetThreadsafeFunctionContextTest();
        console.info('NapiGetThreadsafeFunctionContextTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetThreadsafeFunctionContextTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateThreadsafeFunctionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATETHREADSAFEFUNCTIONTEST_0100
     * @tc.desc   Testing NapiCreateThreadsafeFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateThreadsafeFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateThreadsafeFunctionTest0001 START');
      try {
        let value = napitest.NapiCreateThreadsafeFunctionTest1();
        console.info('NapiCreateThreadsafeFunctionTest1 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateThreadsafeFunctionTest1 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateThreadsafeFunctionTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATETHREADSAFEFUNCTIONTEST_0200
     * @tc.desc   Testing NapiCreateThreadsafeFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateThreadsafeFunctionTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateThreadsafeFunctionTest0002 START');
      try {
        let value = napitest.NapiCreateThreadsafeFunctionTest2();
        console.info('NapiCreateThreadsafeFunctionTest2 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateThreadsafeFunctionTest2 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateThreadsafeFunctionTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATETHREADSAFEFUNCTIONTEST_0300
     * @tc.desc   Testing NapiCreateThreadsafeFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateThreadsafeFunctionTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateThreadsafeFunctionTest0003 START');
      try {
        let value = napitest.NapiCreateThreadsafeFunctionTest3();
        console.info('NapiCreateThreadsafeFunctionTest3 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateThreadsafeFunctionTest3 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetUvEventLoopTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETUVEVENTLOOPTEST_0100
     * @tc.desc   Testing NapiGetUvEventLoopTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetUvEventLoopTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetUvEventLoopTest0001 START');
      try {
        let value = napitest.NapiGetUvEventLoopTest();
        console.info('NapiGetUvEventLoopTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetUvEventLoopTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiIsPromiseTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIISPROMISETEST_0100
     * @tc.desc   Testing NapiIsPromiseTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiIsPromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiIsPromiseTest0001 START');
      try {
        let value = napitest.NapiIsPromiseTest();
        console.info('NapiIsPromiseTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiIsPromiseTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiRejectDeferredTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIREJECTDEFERREDTEST_0100
     * @tc.desc   Testing NapiRejectDeferredTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRejectDeferredTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiRejectDeferredTest0001 START');
      try {
        let value = napitest.NapiRejectDeferredTest();
        console.info('NapiRejectDeferredTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiRejectDeferredTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiResolveDeferredTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIRESOLVEDEFERREDTEST_0100
     * @tc.desc   Testing NapiResolveDeferredTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiResolveDeferredTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiResolveDeferredTest0001 START');
      try {
        let value = napitest.NapiResolveDeferredTest();
        console.info('NapiResolveDeferredTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiResolveDeferredTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreatePromiseTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEPROMISETEST_0100
     * @tc.desc   Testing NapiCreatePromiseTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreatePromiseTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreatePromiseTest0001 START');
      try {
        let value = napitest.NapiCreatePromiseTest();
        console.info('NapiCreatePromiseTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreatePromiseTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetVersionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETVERSIONTEST_0100
     * @tc.desc   Testing NapiGetVersionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetVersionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetVersionTest0001 START');
      try {
        let value = napitest.NapiGetVersionTest();
        console.info('NapiGetVersionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetVersionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetNodeVersionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETNODEVERSIONTEST_0100
     * @tc.desc   Testing NapiGetNodeVersionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetNodeVersionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetNodeVersionTest0001 START');
      try {
        let value = napitest.NapiGetNodeVersionTest();
        console.info('NapiGetNodeVersionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetNodeVersionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCloseCallbackScopeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICLOSECALLBACKSCOPETEST_0100
     * @tc.desc   Testing NapiCloseCallbackScopeTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCloseCallbackScopeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCloseCallbackScopeTest0001 START');
      try {
        let value = napitest.NapiCloseCallbackScopeTest();
        console.info('NapiCloseCallbackScopeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCloseCallbackScopeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiOpenCallbackScopeTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIOPENCALLBACKSCOPETEST_0100
     * @tc.desc   Testing NapiOpenCallbackScopeTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiOpenCallbackScopeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiOpenCallbackScopeTest0001 START');
      try {
        let value = napitest.NapiOpenCallbackScopeTest();
        console.info('NapiOpenCallbackScopeTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiOpenCallbackScopeTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiAsyncDestroyTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIASYNCDESTROYTEST_0100
     * @tc.desc   Testing NapiAsyncDestroyTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiAsyncDestroyTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiAsyncDestroyTest0001 START');
      try {
        let value = napitest.NapiAsyncDestroyTest();
        console.info('NapiAsyncDestroyTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiAsyncDestroyTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiMakeCallbackTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIMAKECALLBACKTEST_0100
     * @tc.desc   Testing NapiMakeCallbackTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiMakeCallbackTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiMakeCallbackTest0001 START');
      try {
        let value = napitest.NapiMakeCallback1Test();
        console.info('NapiMakeCallback1Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiMakeCallback1Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiMakeCallbackTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIMAKECALLBACKTEST_0200
     * @tc.desc   Testing NapiMakeCallbackTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiMakeCallbackTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiMakeCallbackTest0002 START');
      try {
        let value = napitest.NapiMakeCallback2Test();
        console.info('NapiMakeCallback2Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiMakeCallback2Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiMakeCallbackTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIMAKECALLBACKTEST_0300
     * @tc.desc   Testing NapiMakeCallbackTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiMakeCallbackTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiMakeCallbackTest0003 START');
      try {
        let value = napitest.NapiMakeCallback3Test();
        console.info('NapiMakeCallback3Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiMakeCallback3Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiMakeCallbackTest0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIMAKECALLBACKTEST_0400
     * @tc.desc   Testing NapiMakeCallbackTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiMakeCallbackTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiMakeCallbackTest0004 START');
      try {
        let value = napitest.NapiMakeCallback4Test();
        console.info('NapiMakeCallback4Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiMakeCallback4Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiMakeCallbackTest0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIMAKECALLBACKTEST_0500
     * @tc.desc   Testing NapiMakeCallbackTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiMakeCallbackTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiMakeCallbackTest0005 START');
      try {
        let value = napitest.NapiMakeCallback5Test();
        console.info('NapiMakeCallback5Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiMakeCallback5Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiMakeCallbackTest0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIMAKECALLBACKTEST_0600
     * @tc.desc   Testing NapiMakeCallbackTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiMakeCallbackTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiMakeCallbackTest0006 START');
      try {
        let value = napitest.NapiMakeCallback6Test();
        console.info('NapiMakeCallback6Test value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiMakeCallback6Test err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiAsyncInitTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIASYNCINITTEST_0100
     * @tc.desc   Testing NapiAsyncInitTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiAsyncInitTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiAsyncInitTest0001 START');
      try {
        let value = napitest.NapiAsyncInitTest();
        console.info('NapiAsyncInitTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiAsyncInitTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCancelAsyncWorkTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICANCELASYNCWORKTEST_0100
     * @tc.desc   Testing NapiCancelAsyncWorkTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCancelAsyncWorkTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCancelAsyncWorkTest0001 START');
      try {
        let value = napitest.NapiCancelAsyncWorkTest();
        console.info('NapiCancelAsyncWorkTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCancelAsyncWorkTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiQueueAsyncWorkTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIQUEUEASYNCWORKTEST_0100
     * @tc.desc   Testing NapiQueueAsyncWorkTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiQueueAsyncWorkTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiQueueAsyncWorkTest0001 START');
      try {
        let value = napitest.NapiQueueAsyncWorkTest();
        console.info('NapiQueueAsyncWorkTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiQueueAsyncWorkTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDeleteAsyncWorkTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDELETEASYNCWORKTEST_0100
     * @tc.desc   Testing NapiDeleteAsyncWorkTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDeleteAsyncWorkTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDeleteAsyncWorkTest0001 START');
      try {
        let value = napitest.NapiDeleteAsyncWorkTest();
        console.info('NapiDeleteAsyncWorkTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDeleteAsyncWorkTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateAsyncWorkTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEASYNCWORKTEST_0100
     * @tc.desc   Testing NapiCreateAsyncWorkTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateAsyncWorkTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateAsyncWorkTest0001 START');
      try {
        let value = napitest.NapiCreateAsyncWorkTest();
        console.info('NapiCreateAsyncWorkTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateAsyncWorkTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiRemoveWrapTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIREMOVEWRAPTEST_0100
     * @tc.desc   Testing NapiRemoveWrapTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiRemoveWrapTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiRemoveWrapTest0001 START');
      try {
        let value = napitest.NapiRemoveWrapTest();
        console.info('NapiRemoveWrapTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiRemoveWrapTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiUnwrapTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIUNWRAPTEST_0100
     * @tc.desc   Testing NapiUnwrapTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiUnwrapTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiUnwrapTest0001 START');
      try {
        let value = napitest.NapiUnwrapTest();
        console.info('NapiUnwrapTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiUnwrapTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPTEST_0100
     * @tc.desc   Testing NapiWrapTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapTest0001 START');
      try {
        let value = napitest.NapiWrapTest();
        console.info('NapiWrapTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiDefineClassTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIDEFINECLASSTEST_0100
     * @tc.desc   Testing NapiDefineClassTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiDefineClassTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiDefineClassTest0001 START');
      try {
        let value = napitest.NapiDefineClassTest();
        console.info('NapiDefineClassTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiDefineClassTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewInstanceTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPINEWINSTANCETEST_0100
     * @tc.desc   Testing NapiNewInstanceTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewInstanceTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewInstanceTest0001 START');
      try {
        let value = napitest.NapiNewInstanceTest();
        console.info('NapiNewInstanceTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiNewInstanceTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetNewTargetTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETNEWTARGETTEST_0100
     * @tc.desc   Testing NapiGetNewTargetTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetNewTargetTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetNewTargetTest0001 START');
      try {
        let value = napitest.NapiGetNewTargetTest();
        console.info('NapiGetNewTargetTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetNewTargetTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiGetCbInfoTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIGETCBINFOTEST_0100
     * @tc.desc   Testing NapiGetCbInfoTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiGetCbInfoTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiGetCbInfoTest0001 START');
      try {
        let value = napitest.NapiGetCbInfoTest();
        console.info('NapiGetCbInfoTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiGetCbInfoTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCreateFunctionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATEFUNCTIONTEST_0100
     * @tc.desc   Testing NapiCreateFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCreateFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCreateFunctionTest0001 START');
      try {
        let value = napitest.NapiCreateFunctionTest();
        console.info('NapiCreateFunctionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCreateFunctionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCallFunctionTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICALLFUNCTIONTEST_0100
     * @tc.desc   Testing NapiCallFunctionTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCallFunctionTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCallFunctionTest0001 START');
      try {
        let value = napitest.NapiCallFunctionTest();
        console.info('NapiCallFunctionTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCallFunctionTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiCheckObjectTypeTagTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPICHECKOBJECTTYPETAGTEST_0100
     * @tc.desc   Testing NapiCheckObjectTypeTagTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiCheckObjectTypeTagTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCheckObjectTypeTagTest0001 START');
      try {
        let value = napitest.NapiCheckObjectTypeTagTest();
        console.info('NapiCheckObjectTypeTagTest value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiCheckObjectTypeTagTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_testNapiWrapEnhanceTest0001
     * @tc.desc   Testing NapiCheckObjectTypeTagTest NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiCheckObjectTypeTagTest0001 START');
      try {
        let value:number = napitest.NapiWrapEnhanceTest();
        console.info('NapiWrapEnhanceTest value is: ' + value);
        expect(value).assertEqual(1);
      } catch (err) {
        console.error('NapiWrapEnhanceTest err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0100
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0100
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0100 START');
      try {
      let value = napitest.DestroyEnvByNull();
      console.info('DestroyEnvByNull value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('DestroyEnvByNull err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0200
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0200
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0200 START');
      try {
      let value = napitest.CreateEnv();
      console.info('CreateEnv value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('CreateEnv err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0300
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0300
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0300 START');
      try {
      let value = napitest.CreateEnvByNotContextEnv();
      console.info('CreateEnvByNotContextEnv value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('CreateEnvByNotContextEnv err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0400
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0400
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0400 START');
      try {
      let value = napitest.DestroyEnv();
      console.info('DestroyEnv value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('DestroyEnv err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0500
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0500
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0500 START');
      try {
      let value = napitest.CreateEnvByEnvContext();
      console.info('CreateEnvByEnvContext value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('CreateEnvByEnvContext err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0600
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0600
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0600 START');
      try {
      let value = napitest.CreateEnvByEnvIsNull();
      console.info('CreateEnvByEnvIsNull value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('CreateEnvByEnvIsNull err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0700
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0700
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0700 START');
      try {
      let value = napitest.UseContext();
      console.info('UseContext value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('UseContext err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0800
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0800
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0800 START');
      try {
      let value = napitest.UseMutilContext();
      console.info('UseMutilContext value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('UseMutilContext err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv0900
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV0900
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv0900 START');
      try {
      let value = napitest.SwitchEnv();
      console.info('SwitchEnv value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('SwitchEnv err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv1000
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_TESTNAPINEWCONTEXTENV1000
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv1000 START');
      try {
      let value = napitest.SwitchEnvByNull();
      console.info('SwitchEnvByNull value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('SwitchEnvByNull err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiNewContextEnv1100
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_SWITCHENVBYNEWENV
     * @tc.desc   Testing EnvContext NAPI interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiNewContextEnv1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiNewContextEnv1100 START');
      try {
      let value = napitest.SwitchEnvByNewEnv();
      console.info('SwitchEnvByNewEnv value is: ' + value);
      expect(value).assertEqual(true);
      } catch (err) {
      console.error('SwitchEnvByNewEnv err msg' + err.message);
      expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0100
     * @tc.desc   Testing NapiWrapEnhanceTest synchronize binding of string type object test cases.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0001 START');
      try {
        let value = napitest.NapiWrapEnhanceTest1();
        console.info('NapiWrapEnhanceTest1 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest1 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0200
     * @tc.desc   Testing NapiWrapEnhanceTest synchronize binding of number type object test cases.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0002 START');
      try {
        let value = napitest.NapiWrapEnhanceTest2();
        console.info('NapiWrapEnhanceTest2 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest2 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0300
     * @tc.desc   Testing NapiWrapEnhanceTest asynchronous binding of complex object test cases.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0003 START');
      try {
        let value = napitest.NapiWrapEnhanceTest3();
        console.info('NapiWrapEnhanceTest3 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest3 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0004
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0400
     * @tc.desc   Testing NapiWrapEnhanceTest each parameter value is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0004 START');
      try {
        let value = napitest.NapiWrapEnhanceTest4();
        console.info('NapiWrapEnhanceTest4 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest4 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0005
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0500
     * @tc.desc   Testing NapiWrapEnhanceTest each parameter value is null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0005 START');
      try {
        let value = napitest.NapiWrapEnhanceTest5();
        console.info('NapiWrapEnhanceTest5 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest5 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0006
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0600
     * @tc.desc   Testing NapiWrapEnhanceTest synchronized callback execution successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0006 START');
      try {
        let value = napitest.NapiWrapEnhanceTest6();
        console.info('NapiWrapEnhanceTest6 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest6 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0007
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0700
     * @tc.desc   Testing NapiWrapEnhanceTest asynchronous callback execution successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0007 START');
      try {
        let value = napitest.NapiWrapEnhanceTest7();
        console.info('NapiWrapEnhanceTest7 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest7 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0008
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0800
     * @tc.desc   Testing NapiWrapEnhanceTest obtaining and managing references.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0008 START');
      try {
        let value = napitest.NapiWrapEnhanceTest8();
        console.info('NapiWrapEnhanceTest8 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest8 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0009
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_0900
     * @tc.desc   Testing NapiWrapEnhanceTest called when there are uncaught exceptions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0009 START');
      try {
        let value = napitest.NapiWrapEnhanceTest9();
        console.info('NapiWrapEnhanceTest9 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest9 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0010
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_1000
     * @tc.desc   Testing NapiWrapEnhanceTest zero size binding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0010 START');
      try {
        let value = napitest.NapiWrapEnhanceTest10();
        console.info('NapiWrapEnhanceTest10 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest10 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0011
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_1100
     * @tc.desc   Testing NapiWrapEnhanceTest binding of super large objects.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0011 START');
      try {
        let value = napitest.NapiWrapEnhanceTest11();
        console.info('NapiWrapEnhanceTest11 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest11 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiWrapEnhanceTest0012
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPIWRAPENHANCETEST_1200
     * @tc.desc   Testing NapiWrapEnhanceTest multi object binding testing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiWrapEnhanceTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiWrapEnhanceTest0012 START');
      try {
        let value = napitest.NapiWrapEnhanceTest12();
        console.info('NapiWrapEnhanceTest12 value is: ' + value);
        expect(value).assertEqual(true);
      } catch (err) {
        console.error('NapiWrapEnhanceTest12 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.name   testNapiThrowBusinessError0001
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITHROWBUSINESSERROR_0001
     * @tc.desc   Testing NapiThrowBusinessError normal function.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testNapiThrowBusinessError0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiThrowBusinessError0001 START');
      try {
        let value : number = napitest.NapiThrowBusinessError();
        console.info('NapiThrowBusinessError result is: ' + value);
        expect().assertFail();
      } catch (err) {
        console.error('NapiThrowBusinessError err msg' + err.message);
        expect(JSON.stringify(err)).assertEqual('{"code":100}');
      }
      done();
    });

    /**
     * @tc.name   testNapiThrowBusinessError0002
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITHROWBUSINESSERROR_0002
     * @tc.desc   Testing NapiThrowBusinessError function when parameters are null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */    
    it('testNapiThrowBusinessError0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiThrowBusinessError0002 START');
      try {
        let value : number = napitest.NapiThrowBusinessErrorPar();
        console.info('NapiThrowBusinessErrorPar result is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('NapiThrowBusinessErrorPar err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
    
    /**
     * @tc.name   testNapiThrowBusinessError0003
     * @tc.number SUB_RUNTIME_LANGUAGE_NAPI_NAPITHROWBUSINESSERROR_0003
     * @tc.desc   Testing NapiThrowBusinessError function when parameters are null.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */    
    it('testNapiThrowBusinessError0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info('testNapiThrowBusinessError0003 START');
      try {
        let value : number = napitest.NapiThrowBusinessErrorPendingError();
        console.info('NapiThrowBusinessErrorPendingError result is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('NapiThrowBusinessErrorPendingError err msg' + err.message);
        expect().assertFail();
      }
      done();
    });
  })
}
