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

import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "@ohos/hypium"
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETLASTERRORINFO_0100
     * @tc.name      : testGetLastErrorInfo0001
     * @tc.desc      : Testing GetLastErrorInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetLastErrorInfo0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETLASTERRORINFO_0200
     * @tc.name      : testGetLastErrorInfo0002
     * @tc.desc      : Testing GetLastErrorInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetLastErrorInfo0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_THROW_0100
     * @tc.name      : testThrow0001
     * @tc.desc      : Testing Throw NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testThrow0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_THROW_0200
     * @tc.name      : testThrow0002
     * @tc.desc      : Testing Throw NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testThrow0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_THROWERROR_0100
     * @tc.name      : testThrowError0001
     * @tc.desc      : Testing ThrowError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testThrowError0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_THROWTYPEERROR_0100
     * @tc.name      : testThrowTypeError0001
     * @tc.desc      : Testing ThrowTypeError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testThrowTypeError0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_THROWRANGEERROR_0100
     * @tc.name      : testThrowRangeError0001
     * @tc.desc      : Testing ThrowRangeError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testThrowRangeError0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISERROR_0100
     * @tc.name      : testIsError0001
     * @tc.desc      : Testing IsError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsError0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISERROR_0200
     * @tc.name      : testIsError0002
     * @tc.desc      : Testing IsError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testIsError0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISERROR_0300
     * @tc.name      : testIsError0003
     * @tc.desc      : Testing IsError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsError0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISERROR_0400
     * @tc.name      : testIsError0004
     * @tc.desc      : Testing IsError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsError0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF8_0100
     * @tc.name      : testCreateStringUtf80001
     * @tc.desc      : Testing CreateStringUtf8 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringUtf80001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF8_0200
     * @tc.name      : testCreateStringUtf80002
     * @tc.desc      : Testing CreateStringUtf8 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testCreateStringUtf80002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEERROR_0100
     * @tc.name      : testCreateError0001
     * @tc.desc      : Testing CreateError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateError0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEERROR_0200
     * @tc.name      : testCreateError0002
     * @tc.desc      : Testing CreateError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateError0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEERROR_0300
     * @tc.name      : testCreateError0003
     * @tc.desc      : Testing CreateError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateError0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEERROR_0100
     * @tc.name      : testCreateTypeError0001
     * @tc.desc      : Testing CreateTypeError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateTypeError0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEERROR_0200
     * @tc.name      : testCreateTypeError0002
     * @tc.desc      : Testing CreateTypeError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateTypeError0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEERROR_0300
     * @tc.name      : testCreateTypeError0003
     * @tc.desc      : Testing CreateTypeError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateTypeError0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATERANGEERROR_0100
     * @tc.name      : testCreateRangeError0001
     * @tc.desc      : Testing CreateRangeError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateRangeError0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATERANGEERROR_0200
     * @tc.name      : testCreateRangeError0002
     * @tc.desc      : Testing CreateRangeError NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateRangeError0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETANDCLEARLASTEXCEPTION_0100
     * @tc.name      : testGetAndClearLastException0001
     * @tc.desc      : Testing GetAndClearLastException NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetAndClearLastException0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETANDCLEARLASTEXCEPTION_0200
     * @tc.name      : testGetAndClearLastException0002
     * @tc.desc      : Testing GetAndClearLastException NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetAndClearLastException0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISEXCEPTIONPENDING_0100
     * @tc.name      : testIsExceptionPending0001
     * @tc.desc      : Testing IsExceptionPending NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsExceptionPending0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISEXCEPTIONPENDING_0200
     * @tc.name      : testIsExceptionPending0002
     * @tc.desc      : Testing IsExceptionPending NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testIsExceptionPending0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OPENANDCLOSEHANDLESCOPE_0100
     * @tc.name      : testOpenAndCloseHandleScope0001
     * @tc.desc      : Testing OpenAndCloseHandleScope NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testOpenAndCloseHandleScope0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OPENANDCLOSEHANDLESCOPE_0200
     * @tc.name      : testOpenAndCloseHandleScope0002
     * @tc.desc      : Testing OpenAndCloseHandleScope NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testOpenAndCloseHandleScope0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OPENANDCLOSEESCAPABLEHANDLESCOPE_0100
     * @tc.name      : testOpenAndCloseEscapableHandleScope0001
     * @tc.desc      : Testing OpenAndCloseEscapableHandleScope NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testOpenAndCloseEscapableHandleScope0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OPENANDCLOSEESCAPABLEHANDLESCOPE_0200
     * @tc.name      : testOpenAndCloseEscapableHandleScope0002
     * @tc.desc      : Testing OpenAndCloseEscapableHandleScope NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testOpenAndCloseEscapableHandleScope0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ESCAPEHANDLE_0100
     * @tc.name      : testEscapeHandle0001
     * @tc.desc      : Testing EscapeHandle NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testEscapeHandle0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ESCAPEHANDLE_0200
     * @tc.name      : testEscapeHandle0002
     * @tc.desc      : Testing EscapeHandle NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEscapeHandle0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ESCAPEHANDLE_0300
     * @tc.name      : testEscapeHandle0003
     * @tc.desc      : Testing EscapeHandle NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEscapeHandle0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ESCAPEHANDLE_0400
     * @tc.name      : testEscapeHandle0004
     * @tc.desc      : Testing EscapeHandle NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEscapeHandle0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEREFERENCE_0100
     * @tc.name      : testCreateReference0001
     * @tc.desc      : Testing CreateReference NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateReference0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEREFERENCE_0200
     * @tc.name      : testCreateReference0002
     * @tc.desc      : Testing CreateReference NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateReference0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETREFERENCEVALUE_0100
     * @tc.name      : testGetReferenceValue0001
     * @tc.desc      : Testing GetReferenceValue NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetReferenceValue0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETREFERENCEVALUE_0200
     * @tc.name      : testGetReferenceValue0002
     * @tc.desc      : Testing GetReferenceValue NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetReferenceValue0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETREFERENCEVALUE_0300
     * @tc.name      : testGetReferenceValue0003
     * @tc.desc      : Testing GetReferenceValue NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testGetReferenceValue0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEREFERENCE_0100
     * @tc.name      : testDeleteReference0001
     * @tc.desc      : Testing DeleteReference NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteReference0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEREFERENCE_0200
     * @tc.name      : testDeleteReference0002
     * @tc.desc      : Testing DeleteReference NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testDeleteReference0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REFERENCEREF_0100
     * @tc.name      : testReferenceRef0001
     * @tc.desc      : Testing ReferenceRef NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testReferenceRef0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REFERENCEREF_0200
     * @tc.name      : testReferenceRef0002
     * @tc.desc      : Testing ReferenceRef NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testReferenceRef0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REFERENCEUNREF_0100
     * @tc.name      : testReferenceUnRef0001
     * @tc.desc      : Testing ReferenceRef NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testReferenceUnRef0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REFERENCEUNREF_0200
     * @tc.name      : testReferenceUnRef0002
     * @tc.desc      : Testing ReferenceRef NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testReferenceUnRef0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEARRAY_0100
     * @tc.name      : testCreateArray0001
     * @tc.desc      : Testing CreateArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateArray0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEARRAY_0200
     * @tc.name      : testCreateArray0002
     * @tc.desc      : Testing CreateArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateArray0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEARRAYBUFFER_0100
     * @tc.name      : testCreateArrayBuffer0001
     * @tc.desc      : Testing CreateArrayBuffer NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateArrayBuffer0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEARRAYBUFFER_0200
     * @tc.name      : testCreateArrayBuffer0002
     * @tc.desc      : Testing CreateArrayBuffer NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateArrayBuffer0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNAL_0100
     * @tc.name      : testCreateExternal0001
     * @tc.desc      : Testing CreateExternal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateExternal0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNAL_0200
     * @tc.name      : testCreateExternal0002
     * @tc.desc      : Testing CreateExternal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateExternal0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNALARRAYBUFFER_0100
     * @tc.name      : testCreateExternalArraybuffer0001
     * @tc.desc      : Testing CreateExternal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateExternalArraybuffer0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNALARRAYBUFFER_0200
     * @tc.name      : testCreateExternalArraybuffer0002
     * @tc.desc      : Testing CreateExternal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateExternalArraybuffer0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEOBJECT_0100
     * @tc.name      : testCreateObject0001
     * @tc.desc      : Testing CreateObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateObject0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEOBJECT_0200
     * @tc.name      : testCreateObject0002
     * @tc.desc      : Testing CreateObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateObject0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESYMBOL_0100
     * @tc.name      : testCreateSymbol0001
     * @tc.desc      : Testing CreateObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSymbol0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESYMBOL_0200
     * @tc.name      : testCreateSymbol0002
     * @tc.desc      : Testing CreateObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSymbol0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESYMBOL_0300
     * @tc.name      : testCreateSymbol0003
     * @tc.desc      : Testing CreateObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateSymbol0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESYMBOL_0400
     * @tc.name      : testCreateSymbol0004
     * @tc.desc      : Testing CreateObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 4
     */
    it('testCreateSymbol0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0100
     * @tc.name      : testCreateTypeArray0001
     * @tc.desc      : Testing CreateTypeArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateTypeArray0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0200
     * @tc.name      : testCreateTypeArray0002
     * @tc.desc      : Testing CreateTypeArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateTypeArray0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0300
     * @tc.name      : testCreateTypeArray0003
     * @tc.desc      : Testing CreateTypeArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateTypeArray0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0400
     * @tc.name      : testCreateTypeArray0004
     * @tc.desc      : Testing CreateTypeArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 4
     */
    it('testCreateTypeArray0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEARRAY_0500
     * @tc.name      : testCreateTypeArray0005
     * @tc.desc      : Testing CreateTypeArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateTypeArray0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEDATAVIEW_0100
     * @tc.name      : testCreateDataView0001
     * @tc.desc      : Testing CreateDataView NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateDataView0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEDATAVIEW_0200
     * @tc.name      : testCreateDataView0002
     * @tc.desc      : Testing CreateDataView NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateDataView0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEDATAVIEW_0300
     * @tc.name      : testCreateDataView0003
     * @tc.desc      : Testing CreateDataView NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testCreateDataView0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEDATAVIEW_0400
     * @tc.name      : testCreateDataView0004
     * @tc.desc      : Testing CreateDataView NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 4
     */
    it('testCreateDataView0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT32_0100
     * @tc.name      : testCreateInt320001
     * @tc.desc      : Testing CreateInt32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateInt320001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT32_0200
     * @tc.name      : testCreateInt320002
     * @tc.desc      : Testing CreateInt32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateInt320002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT32_0100
     * @tc.name      : testGetValueInt320001
     * @tc.desc      : Testing GetValueInt32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueInt320001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT32_0200
     * @tc.name      : testGetValueInt320002
     * @tc.desc      : Testing GetValueInt32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueInt320002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT32_0300
     * @tc.name      : testGetValueInt320003
     * @tc.desc      : Testing GetValueInt32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueInt320003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT64_0100
     * @tc.name      : testGetValueInt640001
     * @tc.desc      : Testing GetValueInt64 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueInt640001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT64_0200
     * @tc.name      : testGetValueInt640002
     * @tc.desc      : Testing GetValueInt64 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueInt640002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEINT64_0300
     * @tc.name      : testGetValueInt640003
     * @tc.desc      : Testing GetValueInt64 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueInt640003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEUINT32_0100
     * @tc.name      : testCreateUInt320001
     * @tc.desc      : Testing CreateInt32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateUInt320001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT32_0200
     * @tc.name      : testCreateUInt320002
     * @tc.desc      : Testing CreateInt32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateUInt320002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT64_0100
     * @tc.name      : testCreateInt640001
     * @tc.desc      : Testing CreateInt64 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateInt640001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT64_0200
     * @tc.name      : testCreateInt640002
     * @tc.desc      : Testing CreateInt64 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateInt640002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT64_0100
     * @tc.name      : testCreateDouble0001
     * @tc.desc      : Testing CreateDouble NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateDouble0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEINT64_0200
     * @tc.name      : testCreateDouble0002
     * @tc.desc      : Testing CreateDouble NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateDouble0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGLATIN1_0100
     * @tc.name      : testCreateStringLatin10001
     * @tc.desc      : Testing CreateStringLatin NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringLatin10001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGLATIN1_0200
     * @tc.name      : testCreateStringLatin10002
     * @tc.desc      : Testing CreateStringLatin NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringLatin10002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGLATIN1_0300
     * @tc.name      : testCreateStringLatin10003
     * @tc.desc      : Testing CreateStringLatin NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringLatin10003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0100
     * @tc.name      : testCreateStringUtf160001
     * @tc.desc      : Testing CreateStringUtf16 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringUtf160001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0200
     * @tc.name      : testCreateStringUtf160002
     * @tc.desc      : Testing CreateStringUtf16 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringUtf160002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0300
     * @tc.name      : testCreateStringUtf160003
     * @tc.desc      : Testing CreateStringUtf16 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringUtf160003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0400
     * @tc.name      : testCreateStringUtf160004
     * @tc.desc      : Testing CreateStringUtf16 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringUtf160004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESTRINGUTF16_0500
     * @tc.name      : testCreateStringUtf160005
     * @tc.desc      : Testing CreateStringUtf16 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateStringUtf160005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0100
     * @tc.name      : testGetArrayLength0001
     * @tc.desc      : Testing GetArrayLength NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetArrayLength0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0200
     * @tc.name      : testGetArrayLength0002
     * @tc.desc      : Testing GetArrayLength NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetArrayLength0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0300
     * @tc.name      : testGetArrayLength0003
     * @tc.desc      : Testing GetArrayLength NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetArrayLength0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0100
     * @tc.name      : testGetArrayBufferInfo0001
     * @tc.desc      : Testing GetArrayBufferInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetArrayBufferInfo0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0200
     * @tc.name      : testGetArrayBufferInfo0002
     * @tc.desc      : Testing GetArrayBufferInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetArrayBufferInfo0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0300
     * @tc.name      : testGetArrayBufferInfo0003
     * @tc.desc      : Testing GetArrayBufferInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetArrayBufferInfo0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETARRAYLENGTH_0400
     * @tc.name      : testGetArrayBufferInfo0004
     * @tc.desc      : Testing GetArrayBufferInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetArrayBufferInfo0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TESTGETPROTOTYPE_0100
     * @tc.name      : testGetPrototype0001
     * @tc.desc      : Testing GetPrototype NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetPrototype0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TESTGETPROTOTYPE_0200
     * @tc.name      : testGetPrototype0002
     * @tc.desc      : Testing GetPrototype NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetPrototype0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TESTGETPROTOTYPE_0300
     * @tc.name      : testGetPrototype0003
     * @tc.desc      : Testing GetPrototype NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetPrototype0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TESTGETPROTOTYPE_0400
     * @tc.name      : testGetPrototype0004
     * @tc.desc      : Testing GetPrototype NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetPrototype0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETTYPEDARRAYINFO_0100
     * @tc.name      : testGetTypedArrayInfo0001
     * @tc.desc      : Testing GetTypedArrayInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetTypedArrayInfo0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETTYPEDARRAYINFO_0200
     * @tc.name      : testGetTypedArrayInfo0002
     * @tc.desc      : Testing GetTypedArrayInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetTypedArrayInfo0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETDATAVIEWINFO_0100
     * @tc.name      : testGetDataViewInfo0001
     * @tc.desc      : Testing GetDataViewInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetDataViewInfo0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETDATAVIEWINFO_0200
     * @tc.name      : testGetDataViewInfo0002
     * @tc.desc      : Testing GetDataViewInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetDataViewInfo0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETDATAVIEWINFO_0300
     * @tc.name      : testGetDataViewInfo0003
     * @tc.desc      : Testing GetDataViewInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetDataViewInfo0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBOOL_0100
     * @tc.name      : testGetValueBool0001
     * @tc.desc      : Testing GetValueBool NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueBool0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBOOL_0200
     * @tc.name      : testGetValueBool0002
     * @tc.desc      : Testing GetValueBool NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueBool0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBOOL_0300
     * @tc.name      : testGetValueBool0003
     * @tc.desc      : Testing GetValueBool NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueBool0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBOOL_0400
     * @tc.name      : testGetValueBool0004
     * @tc.desc      : Testing GetValueBool NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueBool0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETBOOLEAN_0100
     * @tc.name      : testGetBoolean0001
     * @tc.desc      : Testing GetBoolean NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetBoolean0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETBOOLEAN_0200
     * @tc.name      : testGetBoolean0002
     * @tc.desc      : Testing GetBoolean NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetBoolean0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETBOOLEAN_0300
     * @tc.name      : testGetBoolean0003
     * @tc.desc      : Testing GetBoolean NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetBoolean0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEDOUBLE_0100
     * @tc.name      : testGetValueDouble0001
     * @tc.desc      : Testing GetValueDouble NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueDouble0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEDOUBLE_0200
     * @tc.name      : testGetValueDouble0002
     * @tc.desc      : Testing GetValueDouble NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueDouble0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEDOUBLE_0300
     * @tc.name      : testGetValueDouble0003
     * @tc.desc      : Testing GetValueDouble NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueDouble0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEEXTERNAL_0100
     * @tc.name      : testGetValueExternal0001
     * @tc.desc      : Testing GetValueExternal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueExternal0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEEXTERNAL_0200
     * @tc.name      : testGetValueExternal0002
     * @tc.desc      : Testing GetValueExternal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueExternal0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEEXTERNAL_0300
     * @tc.name      : testGetValueExternal0003
     * @tc.desc      : Testing GetValueExternal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueExternal0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEEXTERNAL_0400
     * @tc.name      : testGetValueExternal0004
     * @tc.desc      : Testing GetValueExternal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueExternal0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGLATIN1_0100
     * @tc.name      : testGetValueStringLatin10001
     * @tc.desc      : Testing GetValueStringLatin1 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueStringLatin10001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGLATIN1_0200
     * @tc.name      : testGetValueStringLatin10002
     * @tc.desc      : Testing GetValueStringLatin1 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueStringLatin10002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF8_0100
     * @tc.name      : testGetValueStringUtf80001
     * @tc.desc      : Testing GetValueStringUtf8 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueStringUtf80001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF8_0200
     * @tc.name      : testGetValueStringUtf80002
     * @tc.desc      : Testing GetValueStringUtf8 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueStringUtf80002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF8_0300
     * @tc.name      : testGetValueStringUtf80003
     * @tc.desc      : Testing GetValueStringUtf8 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueStringUtf80003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF16_0100
     * @tc.name      : testGetValueStringUtf160001
     * @tc.desc      : Testing GetValueStringUtf16 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueStringUtf160001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF16_0200
     * @tc.name      : testGetValueStringUtf160002
     * @tc.desc      : Testing GetValueStringUtf16 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueStringUtf160002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUESTRINGUTF16_0300
     * @tc.name      : testGetValueStringUtf160003
     * @tc.desc      : Testing GetValueStringUtf16 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueStringUtf160003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEUINT32_0100
     * @tc.name      : testGetValueUint320001
     * @tc.desc      : Testing GetValueUint32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueUint320001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEUINT32_0200
     * @tc.name      : testGetValueUint320002
     * @tc.desc      : Testing GetValueUint32 NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetValueUint320002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETGLOBAL_0100
     * @tc.name      : testGetGlobal0001
     * @tc.desc      : Testing GetGlobal NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetGlobal0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETNULL_0100
     * @tc.name      : testGetNull0001
     * @tc.desc      : Testing GetNull NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNull0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETUNDEFINED_0100
     * @tc.name      : testGetUndefined0001
     * @tc.desc      : Testing GetUndefined NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetUndefined0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOBOOL_0100
     * @tc.name      : testCoerceToBool0001
     * @tc.desc      : Testing CoerceToBool NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToBool0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOBOOL_0200
     * @tc.name      : testCoerceToBool0002
     * @tc.desc      : Testing CoerceToBool NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToBool0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOBOOL_0500
     * @tc.name      : testCoerceToBool0005
     * @tc.desc      : Testing CoerceToBool NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToBool0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOBOOL_0600
     * @tc.name      : testCoerceToBool0006
     * @tc.desc      : Testing CoerceToBool NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToBool0006', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETONUMBER_0200
     * @tc.name      : testCoerceToNumber0002
     * @tc.desc      : Testing CoerceToNumber NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToNumber0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETONUMBER_0500
     * @tc.name      : testCoerceToNumber0005
     * @tc.desc      : Testing CoerceToNumber NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToNumber0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETONUMBER_0600
     * @tc.name      : testCoerceToNumber0006
     * @tc.desc      : Testing CoerceToNumber NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToNumber0006', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOOBJECT_0100
     * @tc.name      : testCoerceToObject0001
     * @tc.desc      : Testing CoerceToObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToObject0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOOBJECT_0400
     * @tc.name      : testCoerceToObject0004
     * @tc.desc      : Testing CoerceToObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToObject0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOOBJECT_0700
     * @tc.name      : testCoerceToObject0007
     * @tc.desc      : Testing CoerceToObject NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToObject0007', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0100
     * @tc.name      : testCoerceToString0001
     * @tc.desc      : Testing CoerceToString NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToString0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0200
     * @tc.name      : testCoerceToString0002
     * @tc.desc      : Testing CoerceToString NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToString0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0300
     * @tc.name      : testCoerceToString0003
     * @tc.desc      : Testing CoerceToString NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToString0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0400
     * @tc.name      : testCoerceToString0004
     * @tc.desc      : Testing CoerceToString NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToString0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0500
     * @tc.name      : testCoerceToString0005
     * @tc.desc      : Testing CoerceToString NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToString0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETOSTRING_0600
     * @tc.name      : testCoerceToString0006
     * @tc.desc      : Testing CoerceToString NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCoerceToString0006', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TYPEOF_0100
     * @tc.name      : testTypeOf0001
     * @tc.desc      : Testing InstanceOf NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeOf0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TYPEOF_0200
     * @tc.name      : testTypeOf0002
     * @tc.desc      : Testing InstanceOf NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeOf0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TYPEOF_0300
     * @tc.name      : testTypeOf0003
     * @tc.desc      : Testing InstanceOf NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeOf0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_INSTANCEOF_0100
     * @tc.name      : testInstanceOf0001
     * @tc.desc      : Testing InstanceOf NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testInstanceOf0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_INSTANCEOF_0300
     * @tc.name      : testInstanceOf0003
     * @tc.desc      : Testing InstanceOf NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testInstanceOf0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_INSTANCEOF_0400
     * @tc.name      : testInstanceOf0004
     * @tc.desc      : Testing InstanceOf NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testInstanceOf0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_INSTANCEOF_0500
     * @tc.name      : testInstanceOf0005
     * @tc.desc      : Testing InstanceOf NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testInstanceOf0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISARRAY_0100
     * @tc.name      : testIsArray0001
     * @tc.desc      : Testing IsArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsArray0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISARRAY_0300
     * @tc.name      : testIsArray0003
     * @tc.desc      : Testing IsArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsArray0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISARRAY_0400
     * @tc.name      : testIsArray0004
     * @tc.desc      : Testing IsArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsArray0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISDATAVIEW_0100
     * @tc.name      : testIsDataView0001
     * @tc.desc      : Testing IsDataView NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsDataView0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISDATAVIEW_0200
     * @tc.name      : testIsDataView0002
     * @tc.desc      : Testing IsDataView NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsDataView0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISDATAVIEW_0300
     * @tc.name      : testIsDataView0003
     * @tc.desc      : Testing IsDataView NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsDataView0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISARRAYBUFFER_0100
     * @tc.name      : testIsArrayBuffer0001
     * @tc.desc      : Testing IsArrayBuffer NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsArrayBuffer0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISARRAYBUFFER_0200
     * @tc.name      : testIsArrayBuffer0002
     * @tc.desc      : Testing IsArrayBuffer NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsArrayBuffer0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISARRAYBUFFER_0300
     * @tc.name      : testIsArrayBuffer0003
     * @tc.desc      : Testing IsArrayBuffer NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsArrayBuffer0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISTYPEDARRAY_0100
     * @tc.name      : testIsTypedArray0001
     * @tc.desc      : Testing IsTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsTypedArray0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISTYPEDARRAY_0200
     * @tc.name      : testIsTypedArray0002
     * @tc.desc      : Testing IsTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsTypedArray0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISTYPEDARRAY_0300
     * @tc.name      : testIsTypedArray0003
     * @tc.desc      : Testing IsTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsTypedArray0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISDATE_0100
     * @tc.name      : testIsDate0001
     * @tc.desc      : Testing IsDate NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsDate0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISDATE_0200
     * @tc.name      : testIsDate0002
     * @tc.desc      : Testing IsDate NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsDate0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISDATE_0300
     * @tc.name      : testIsDate0003
     * @tc.desc      : Testing IsDate NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsDate0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISDATE_0400
     * @tc.name      : testIsDate0004
     * @tc.desc      : Testing IsDate NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsDate0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0100
     * @tc.name      : testStrictEquals0001
     * @tc.desc      : Testing StrictEquals NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testStrictEquals0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0200
     * @tc.name      : testStrictEquals0002
     * @tc.desc      : Testing StrictEquals NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testStrictEquals0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0300
     * @tc.name      : testStrictEquals0003
     * @tc.desc      : Testing StrictEquals NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testStrictEquals0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0400
     * @tc.name      : testStrictEquals0004
     * @tc.desc      : Testing StrictEquals NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testStrictEquals0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_STRICTEQUALS_0400
     * @tc.name      : testStrictEquals0004
     * @tc.desc      : Testing IsDate NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testStrictEquals0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTYNAMES_0100
     * @tc.name      : testGetPropertyNames0001
     * @tc.desc      : Testing GetPropertyNames NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetPropertyNames0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTYNAMES_0200
     * @tc.name      : testGetPropertyNames0002
     * @tc.desc      : Testing GetPropertyNames NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetPropertyNames0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTYNAMES_0300
     * @tc.name      : testGetPropertyNames0003
     * @tc.desc      : Testing GetPropertyNames NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetPropertyNames0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTYNAMES_0400
     * @tc.name      : testGetPropertyNames0004
     * @tc.desc      : Testing GetPropertyNames NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetPropertyNames0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETPROPERTY_0100
     * @tc.name      : testSetProperty0001
     * @tc.desc      : Testing SetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetProperty0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETPROPERTY_0200
     * @tc.name      : testSetProperty0002
     * @tc.desc      : Testing SetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetProperty0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETPROPERTY_0300
     * @tc.name      : testSetProperty0003
     * @tc.desc      : Testing SetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetProperty0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETPROPERTY_0400
     * @tc.name      : testSetProperty0004
     * @tc.desc      : Testing SetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetProperty0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0100
     * @tc.name      : testGetProperty0001
     * @tc.desc      : Testing GetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetProperty0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0200
     * @tc.name      : testGetProperty0002
     * @tc.desc      : Testing GetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetProperty0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0300
     * @tc.name      : testGetProperty0003
     * @tc.desc      : Testing GetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetProperty0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0400
     * @tc.name      : testGetProperty0004
     * @tc.desc      : Testing GetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetProperty0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETPROPERTY_0500
     * @tc.name      : testGetProperty0005
     * @tc.desc      : Testing GetProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetProperty0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASPROPERTY_0100
     * @tc.name      : testHasProperty0001
     * @tc.desc      : Testing HasProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasProperty0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASPROPERTY_0300
     * @tc.name      : testHasProperty0003
     * @tc.desc      : Testing HasProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasProperty0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASPROPERTY_0400
     * @tc.name      : testHasProperty0004
     * @tc.desc      : Testing HasProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasProperty0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEPROPERTY_0100
     * @tc.name      : testDeleteProperty0001
     * @tc.desc      : Testing DeleteProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteProperty0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEPROPERTY_0200
     * @tc.name      : testDeleteProperty0002
     * @tc.desc      : Testing DeleteProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteProperty0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEPROPERTY_0300
     * @tc.name      : testDeleteProperty0003
     * @tc.desc      : Testing DeleteProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteProperty0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEPROPERTY_0400
     * @tc.name      : testDeleteProperty0004
     * @tc.desc      : Testing DeleteProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteProperty0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0100
     * @tc.name      : testHasOwnProperty0001
     * @tc.desc      : Testing HasOwnProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasOwnProperty0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0200
     * @tc.name      : testHasOwnProperty0002
     * @tc.desc      : Testing HasOwnProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasOwnProperty0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0300
     * @tc.name      : testHasOwnProperty0003
     * @tc.desc      : Testing HasOwnProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasOwnProperty0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0400
     * @tc.name      : testHasOwnProperty0004
     * @tc.desc      : Testing HasOwnProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasOwnProperty0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0500
     * @tc.name      : testHasOwnProperty0005
     * @tc.desc      : Testing HasOwnProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasOwnProperty0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0100
     * @tc.name      : testSetNamedProperty0001
     * @tc.desc      : Testing SetNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetNamedProperty0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0200
     * @tc.name      : testSetNamedProperty0002
     * @tc.desc      : Testing SetNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetNamedProperty0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0300
     * @tc.name      : testSetNamedProperty0003
     * @tc.desc      : Testing SetNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetNamedProperty0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0400
     * @tc.name      : testSetNamedProperty0004
     * @tc.desc      : Testing SetNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetNamedProperty0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0100
     * @tc.name      : testGetNamedProperty0001
     * @tc.desc      : Testing GetNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNamedProperty0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0200
     * @tc.name      : testGetNamedProperty0002
     * @tc.desc      : Testing GetNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNamedProperty0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0400
     * @tc.name      : testGetNamedProperty0004
     * @tc.desc      : Testing GetNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNamedProperty0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETNAMEDPROPERTY_0500
     * @tc.name      : testGetNamedProperty0005
     * @tc.desc      : Testing GetNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNamedProperty0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0100
     * @tc.name      : testHasNamedProperty0001
     * @tc.desc      : Testing HasNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasNamedProperty0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0200
     * @tc.name      : testHasNamedProperty0002
     * @tc.desc      : Testing HasNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasNamedProperty0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0300
     * @tc.name      : testHasNamedProperty0003
     * @tc.desc      : Testing HasNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasNamedProperty0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0400
     * @tc.name      : testHasNamedProperty0004
     * @tc.desc      : Testing HasNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasNamedProperty0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASNAMEDPROPERTY_0500
     * @tc.name      : testHasNamedProperty0005
     * @tc.desc      : Testing HasNamedProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasNamedProperty0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETELEMENT_0100
     * @tc.name      : testSetElement0001
     * @tc.desc      : Testing SetElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetElement0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETELEMENT_0200
     * @tc.name      : testSetElement0002
     * @tc.desc      : Testing SetElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetElement0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETELEMENT_0300
     * @tc.name      : testSetElement0003
     * @tc.desc      : Testing SetElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetElement0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SETELEMENT_0400
     * @tc.name      : testSetElement0004
     * @tc.desc      : Testing SetElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testSetElement0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETELEMENT_0100
     * @tc.name      : testGetElement0001
     * @tc.desc      : Testing GetElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetElement0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETELEMENT_0200
     * @tc.name      : testGetElement0002
     * @tc.desc      : Testing GetElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetElement0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETELEMENT_0300
     * @tc.name      : testGetElement0003
     * @tc.desc      : Testing GetElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetElement0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETELEMENT_0400
     * @tc.name      : testGetElement0004
     * @tc.desc      : Testing GetElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetElement0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASELEMENT_0100
     * @tc.name      : testHasElement0001
     * @tc.desc      : Testing HasElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasElement0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASELEMENT_0200
     * @tc.name      : testHasElement0002
     * @tc.desc      : Testing HasElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasElement0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASELEMENT_0300
     * @tc.name      : testHasElement0003
     * @tc.desc      : Testing HasElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testHasElement0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0100
     * @tc.name      : testDeleteElement0001
     * @tc.desc      : Testing DeleteElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteElement0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0200
     * @tc.name      : testDeleteElement0002
     * @tc.desc      : Testing DeleteElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteElement0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0300
     * @tc.name      : testDeleteElement0003
     * @tc.desc      : Testing DeleteElement NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteElement0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0100
     * @tc.name      : testDefineProperties0001
     * @tc.desc      : Testing DefineProperties NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineProperties0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEELEMENT_0200
     * @tc.name      : testDefineProperties0002
     * @tc.desc      : Testing DefineProperties NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineProperties0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TypeTag_0100
     * @tc.name      : testTypeTag0001
     * @tc.desc      : Testing typeTag NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeTag0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TypeTag_0200
     * @tc.name      : testTypeTag0002
     * @tc.desc      : Testing typeTag NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeTag0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TypeTag_0300
     * @tc.name      : testTypeTag0003
     * @tc.desc      : Testing typeTag NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTypeTag0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CHECKTYPETAG_0100
     * @tc.name      : testCheckTypeTag0001
     * @tc.desc      : Testing CheckTypeTag NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCheckTypeTag0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CHECKTYPETAG_0200
     * @tc.name      : testCheckTypeTag0002
     * @tc.desc      : Testing CheckTypeTag NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCheckTypeTag0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CHECKTYPETAG_0300
     * @tc.name      : testCheckTypeTag0003
     * @tc.desc      : Testing CheckTypeTag NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCheckTypeTag0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CHECKTYPETAG_0400
     * @tc.name      : testCheckTypeTag0004
     * @tc.desc      : Testing CheckTypeTag NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCheckTypeTag0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CALLFUNCTION_0100
     * @tc.name      : testCallFunction0001
     * @tc.desc      : Testing CallFunction NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCallFunction0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEFUNCTION_0100
     * @tc.name      : testCreateFunction0001
     * @tc.desc      : Testing CreateFunction NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateFunction0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEFUNCTION_0200
     * @tc.name      : testCreateFunction0002
     * @tc.desc      : Testing CreateFunction NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateFunction0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETCBINFO_0100
     * @tc.name      : testGetCbInfo0001
     * @tc.desc      : Testing GetCbInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetCbInfo0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETCBINFO_0200
     * @tc.name      : testGetCbInfo0002
     * @tc.desc      : Testing GetCbInfo NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetCbInfo0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETNEWINSTANCE_0100
     * @tc.name      : testGetNewInstance0001
     * @tc.desc      : Testing GetNewInstance NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNewInstance0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETNEWINSTANCE_0200
     * @tc.name      : testGetNewInstance0002
     * @tc.desc      : Testing GetNewInstance NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNewInstance0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0100
     * @tc.name      : testDefineClass0001
     * @tc.desc      : Testing DefineClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineClass0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0200
     * @tc.name      : testDefineClass0002
     * @tc.desc      : Testing DefineClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineClass0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0300
     * @tc.name      : testDefineClass0003
     * @tc.desc      : Testing DefineClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineClass0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0400
     * @tc.name      : testDefineClass0004
     * @tc.desc      : Testing DefineClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineClass0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINECLASS_0500
     * @tc.name      : testDefineClass0005
     * @tc.desc      : Testing DefineClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineClass0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_UNWRAP_0100
     * @tc.name      : testUnwrap0001
     * @tc.desc      : Testing Unwrap NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testUnwrap0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_UNWRAP_0200
     * @tc.name      : testUnwrap0002
     * @tc.desc      : Testing Unwrap NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testUnwrap0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_UNWRAP_0300
     * @tc.name      : testUnwrap0003
     * @tc.desc      : Testing Unwrap NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testUnwrap0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAP_0100
     * @tc.name      : testRemoveWrap0001
     * @tc.desc      : Testing RemoveWrap NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testRemoveWrap0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAP_0200
     * @tc.name      : testRemoveWrap0002
     * @tc.desc      : Testing RemoveWrap NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testRemoveWrap0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAP_0300
     * @tc.name      : testRemoveWrap0003
     * @tc.desc      : Testing RemoveWrap NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testRemoveWrap0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CANCELASYNCWORK_0100
     * @tc.name      : testCancelAsyncWork0001
     * @tc.desc      : Testing CancelAsyncWork NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCancelAsyncWork0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CANCELASYNCWORK_0200
     * @tc.name      : testCancelAsyncWork0002
     * @tc.desc      : Testing CancelAsyncWork NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCancelAsyncWork0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_QUEUEASYNCWORK_0100
     * @tc.name      : testQueueAsyncWork0001
     * @tc.desc      : Testing queueAsyncWork NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testQueueAsyncWork0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_QUEUEASYNCWORK_0200
     * @tc.name      : testQueueAsyncWork0002
     * @tc.desc      : Testing queueAsyncWork NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testQueueAsyncWork0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEASYNCWORK_0100
     * @tc.name      : testDeleteAsyncWork0001
     * @tc.desc      : Testing DeleteAsyncWork NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteAsyncWork0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DELETEASYNCWORK_0200
     * @tc.name      : testDeleteAsyncWork0002
     * @tc.desc      : Testing DeleteAsyncWork NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDeleteAsyncWork0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINESENDABLECLASS_0200
     * @tc.name      : testDefineSendableClass0002
     * @tc.desc      : Testing DefineSendableClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineSendableClass0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINESENDABLECLASS_0300
     * @tc.name      : testDefineSendableClass0003
     * @tc.desc      : Testing DefineSendableClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineSendableClass0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINESENDABLECLASS_0400
     * @tc.name      : testDefineSendableClass0004
     * @tc.desc      : Testing DefineSendableClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineSendableClass0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DEFINESENDABLECLASS_0500
     * @tc.name      : testDefineSendableClass0005
     * @tc.desc      : Testing DefineSendableClass NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDefineSendableClass0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEOBJECTWITHPROPERTIES_0100
     * @tc.name      : testCreateSendableObjectWithProperties0001
     * @tc.desc      : Testing CreateSendableObjectWithProperties NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableObjectWithProperties0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEOBJECTWITHPROPERTIES_0200
     * @tc.name      : testCreateSendableObjectWithProperties0002
     * @tc.desc      : Testing CreateSendableObjectWithProperties NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableObjectWithProperties0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEOBJECTWITHPROPERTIES_0300
     * @tc.name      : testCreateSendableObjectWithProperties0003
     * @tc.desc      : Testing CreateSendableObjectWithProperties NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableObjectWithProperties0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESENDABLEARRAY_0100
     * @tc.name      : testNapiCreateSendableArray0001
     * @tc.desc      : Testing NapiCreateSendableArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiCreateSendableArray0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESENDABLEARRAY_0200
     * @tc.name      : testNapiCreateSendableArray0002
     * @tc.desc      : Testing NapiCreateSendableArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiCreateSendableArray0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPICREATESENDABLEARRAY_0300
     * @tc.name      : testNapiCreateSendableArray0003
     * @tc.desc      : Testing NapiCreateSendableArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiCreateSendableArray0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYWITHLENGTH_0100
     * @tc.name      : testCreateSendableArrayWithLength0001
     * @tc.desc      : Testing CreateSendableArrayWithLength NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableArrayWithLength0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYWITHLENGTH_0200
     * @tc.name      : testCreateSendableArrayWithLength0002
     * @tc.desc      : Testing CreateSendableArrayWithLength NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableArrayWithLength0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYWITHLENGTH_0300
     * @tc.name      : testCreateSendableArrayWithLength0003
     * @tc.desc      : Testing CreateSendableArrayWithLength NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableArrayWithLength0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYBUFFER_0100
     * @tc.name      : testCreateSendableArrayBuffer0001
     * @tc.desc      : Testing CreateSendableArrayBuffer NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableArrayBuffer0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYBUFFER_0200
     * @tc.name      : testCreateSendableArrayBuffer0002
     * @tc.desc      : Testing CreateSendableArrayBuffer NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableArrayBuffer0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLEARRAYBUFFER_0300
     * @tc.name      : testCreateSendableArrayBuffer0003
     * @tc.desc      : Testing CreateSendableArrayBuffer NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableArrayBuffer0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0100
     * @tc.name      : testCreateSendableTypedArray0001
     * @tc.desc      : Testing CreateSendableTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableTypedArray0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0200
     * @tc.name      : testCreateSendableTypedArray0002
     * @tc.desc      : Testing CreateSendableTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableTypedArray0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0300
     * @tc.name      : testCreateSendableTypedArray0003
     * @tc.desc      : Testing CreateSendableTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableTypedArray0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0400
     * @tc.name      : testCreateSendableTypedArray0004
     * @tc.desc      : Testing CreateSendableTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableTypedArray0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0500
     * @tc.name      : testCreateSendableTypedArray0005
     * @tc.desc      : Testing CreateSendableTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableTypedArray0005', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0600
     * @tc.name      : testCreateSendableTypedArray0006
     * @tc.desc      : Testing CreateSendableTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableTypedArray0006', 0, async (done: Function) => {
      console.info('testCreateSendableTypedArray0006 START');
      try {
        let value = napitest.createSendableFloat64ArrayTest();
        console.info('testCreateSendableTypedArray0006 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateSendableTypedArray0006 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0700
     * @tc.name      : testCreateSendableTypedArray0007
     * @tc.desc      : Testing CreateSendableTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableTypedArray0007', 0, async (done: Function) => {
      console.info('testCreateSendableTypedArray0007 START');
      try {
        let value = napitest.createSendableBigInt64ArrayTest();
        console.info('testCreateSendableTypedArray0007 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateSendableTypedArray0007 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATESENDABLETYPEDARRAY_0800
     * @tc.name      : testCreateSendableTypedArray0008
     * @tc.desc      : Testing CreateSendableTypedArray NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateSendableTypedArray0008', 0, async (done: Function) => {
      console.info('testCreateSendableTypedArray0008 START');
      try {
        let value = napitest.createSendableBigUint64ArrayTest();
        console.info('testCreateSendableTypedArray0008 value is: ' + value);
        expect(value).assertEqual(0);
      } catch (err) {
        console.error('testCreateSendableTypedArray0008 err msg' + err.message);
        expect().assertFail();
      }
      done();
    });

    /**
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLE_0100
     * @tc.name      : testWrapSendable0001
     * @tc.desc      : Testing WrapSendable NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testWrapSendable0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLE_0200
     * @tc.name      : testWrapSendable0002
     * @tc.desc      : Testing WrapSendable NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testWrapSendable0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLE_0300
     * @tc.name      : testWrapSendable0003
     * @tc.desc      : Testing WrapSendable NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testWrapSendable0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLE_0400
     * @tc.name      : testWrapSendable0004
     * @tc.desc      : Testing WrapSendable NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testWrapSendable0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLEWITHSIZE_0100
     * @tc.name      : testWrapSendableWithSize0001
     * @tc.desc      : Testing WrapSendableWithSize NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testWrapSendableWithSize0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLEWITHSIZE_0200
     * @tc.name      : testWrapSendableWithSize0002
     * @tc.desc      : Testing WrapSendableWithSize NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testWrapSendableWithSize0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLEWITHSIZE_0300
     * @tc.name      : testWrapSendableWithSize0003
     * @tc.desc      : Testing WrapSendableWithSize NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testWrapSendableWithSize0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_WRAPSENDABLEWITHSIZE_0400
     * @tc.name      : testWrapSendableWithSize0004
     * @tc.desc      : Testing WrapSendableWithSize NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testWrapSendableWithSize0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAPSENDABLE_0100
     * @tc.name      : testRemoveWrapSendable0001
     * @tc.desc      : Testing RemoveWrapSendable NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testRemoveWrapSendable0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAPSENDABLE_0200
     * @tc.name      : testRemoveWrapSendable0002
     * @tc.desc      : Testing RemoveWrapSendable NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testRemoveWrapSendable0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAPSENDABLE_0300
     * @tc.name      : testRemoveWrapSendable0003
     * @tc.desc      : Testing RemoveWrapSendable NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testRemoveWrapSendable0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVEWRAPSENDABLE_0400
     * @tc.name      : testRemoveWrapSendable0004
     * @tc.desc      : Testing RemoveWrapSendable NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testRemoveWrapSendable0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETNODEVERSION_0200
     * @tc.name      : testGetNodeVersion0002
     * @tc.desc      : Testing GetNodeVersion NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNodeVersion0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETNODEVERSION_0300
     * @tc.name      : testGetNodeVersion0003
     * @tc.desc      : Testing GetNodeVersion NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetNodeVersion0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_RELEASETHREADSAFEFUNCTION_0100
     * @tc.name      : testReleaseThreadsafeFunction0001
     * @tc.desc      : Testing ReleaseThreadsafeFunction NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testReleaseThreadsafeFunction0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_RELEASETHREADSAFEFUNCTION_0200
     * @tc.name      : testReleaseThreadsafeFunction0002
     * @tc.desc      : Testing ReleaseThreadsafeFunction NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testReleaseThreadsafeFunction0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETHREADSAFEFUNCTION_0100
     * @tc.name      : testCreateThreadsafeFunction0001
     * @tc.desc      : Testing createThreadsafeFunction NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateThreadsafeFunction0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETHREADSAFEFUNCTION_0200
     * @tc.name      : testCreateThreadsafeFunction0002
     * @tc.desc      : Testing createThreadsafeFunction NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCreateThreadsafeFunction0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_VERSION_0100
     * @tc.name      : testNapiGetVersion0001
     * @tc.desc      : Testing napi_get_version interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiGetVersion0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_VERSION_0200
     * @tc.name      : testNapiGetVersion0002
     * @tc.desc      : Testing napi_get_version interface with nullptr.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiGetVersion0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_VERSION_0300
     * @tc.name      : testNapiGetVersion0003
     * @tc.desc      : Testing napi_get_version interface with nullptr.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiGetVersion0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_PROMISE_0100
     * @tc.name      : testNapiCreatePromise0001
     * @tc.desc      : Testing napi_create_promise interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiCreatePromise0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_PROMISE_0200
     * @tc.name      : testNapiCreatePromise0002
     * @tc.desc      : Testing napi_create_promise interface with nullptr.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiCreatePromise0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_PROMISE_0300
     * @tc.name      : testNapiCreatePromise0003
     * @tc.desc      : Testing napi_create_promise interface with nullptr.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiCreatePromise0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_PROMISE_0400
     * @tc.name      : testNapiCreatePromise0004
     * @tc.desc      : Testing napi_create_promise interface with nullptr.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiCreatePromise0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_RESOLVEANDREJECTDEFERRED_0100
     * @tc.name      : testResolveAndRejectDeferred0001
     * @tc.desc      : Testing resolveAndRejectDeferred NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testResolveAndRejectDeferred0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_RESOLVEDEFERRED_0100
     * @tc.name      : testResolveDeferred0001
     * @tc.desc      : Testing ResolveDeferred NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testResolveDeferred0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_RESOLVEDEFERRED_0200
     * @tc.name      : testResolveDeferred0002
     * @tc.desc      : Testing ResolveDeferred NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testResolveDeferred0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISPROMISE_0100
     * @tc.name      : testIsPromise0001
     * @tc.desc      : Testing isPromise NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsPromise0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISPROMISE_0200
     * @tc.name      : testIsPromise0002
     * @tc.desc      : Testing isPromiseNull NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsPromise0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISPROMISE_0300
     * @tc.name      : testIsPromise0003
     * @tc.desc      : Testing isPromiseNull NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsPromise0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ISPROMISE_0400
     * @tc.name      : testIsPromise0004
     * @tc.desc      : Testing isPromiseNull NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testIsPromise0004', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETUVEVENTLOOP_0100
     * @tc.name      : testGetUvEventLoop0001
     * @tc.desc      : Testing getUvEventLoop NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetUvEventLoop0001', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETUVEVENTLOOP_0200
     * @tc.name      : testGetUvEventLoop0002
     * @tc.desc      : Testing getUvEventLoopNull NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetUvEventLoop0002', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETUVEVENTLOOP_0300
     * @tc.name      : testGetUvEventLoop0003
     * @tc.desc      : Testing getUvEventLoopNull NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testGetUvEventLoop0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_THREADSAFE_FUNCTION
       _0100
       * @tc.name      : testNapiCreateThreadsafeFunction0001
       * @tc.desc      : Testing napi_create_threadsafe_function interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateThreadsafeFunction0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_THREADSAFE_FUNCTION
       _0200
       * @tc.name      : testNapiCreateThreadsafeFunction0002
       * @tc.desc      : Testing napi_create_threadsafe_function interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateThreadsafeFunction0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_THREADSAFE_FUNCTION
       _0300
       * @tc.name      : testNapiCreateThreadsafeFunction0003
       * @tc.desc      : Testing napi_create_threadsafe_function interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateThreadsafeFunction0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_THREADSAFE_FUNCTION_CONTEXT_0100
       * @tc.name      : testNapiGetThreadsafeFunctionContext0001
       * @tc.desc      : Testing napi_get_threadsafe_function_context interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetThreadsafeFunctionContext0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_THREADSAFE_FUNCTION_CONTEXT_0200
       * @tc.name      : testNapiGetThreadsafeFunctionContext0002
       * @tc.desc      : Testing napi_get_threadsafe_function_context interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetThreadsafeFunctionContext0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CALL_THREADSAFE_FUNCTION_0100
       * @tc.name      : testNapiCallThreadsafeFunction0001
       * @tc.desc      : Testing napi_call_threadsafe_function interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCallThreadsafeFunction0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CALL_THREADSAFE_FUNCTION_0200
       * @tc.name      : testNapiCallThreadsafeFunction0002
       * @tc.desc      : Testing napi_call_threadsafe_function interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCallThreadsafeFunction0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REF_THREADSAFE_FUNCTION_0100
       * @tc.name      : testNapiRefThreadsafeFunction0001
       * @tc.desc      : Testing napi_call_threadsafe_function interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRefThreadsafeFunction0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REF_THREADSAFE_FUNCTION_0200
       * @tc.name      : testNapiRefThreadsafeFunction0002
       * @tc.desc      : Testing napi_call_threadsafe_function interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRefThreadsafeFunction0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REF_THREADSAFE_FUNCTION_0300
       * @tc.name      : testNapiRefThreadsafeFunction0003
       * @tc.desc      : Testing napi_call_threadsafe_function interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRefThreadsafeFunction0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_DATE_0100
       * @tc.name      : testNapiCreateDate0001
       * @tc.desc      : Testing napi_create_date interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateDate0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_DATE_0200
       * @tc.name      : testNapiRefThreadsafeFunction0002
       * @tc.desc      : Testing napi_create_date interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRefThreadsafeFunction0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_DATE_0300
       * @tc.name      : testNapiRefThreadsafeFunction0003
       * @tc.desc      : Testing napi_create_date interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRefThreadsafeFunction0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0100
       * @tc.name      : testGetValueBigintUint640001
       * @tc.desc      : Testing GetValueBigintUint64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintUint640001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0200
       * @tc.name      : testGetValueBigintUint640002
       * @tc.desc      : Testing GetValueBigintUint64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintUint640002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0300
       * @tc.name      : testGetValueBigintUint640003
       * @tc.desc      : Testing GetValueBigintUint64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintUint640003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0400
       * @tc.name      : testGetValueBigintUint640004
       * @tc.desc      : Testing GetValueBigintUint64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintUint640004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTUINT64_0500
       * @tc.name      : testGetValueBigintUint640005
       * @tc.desc      : Testing GetValueBigintUint64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintUint640005', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0100
       * @tc.name      : testGetValueBigintInt640001
       * @tc.desc      : Testing GetValueBigintInt64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintInt640001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0200
       * @tc.name      : testGetValueBigintInt640002
       * @tc.desc      : Testing GetValueBigintInt64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintInt640002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0300
       * @tc.name      : testGetValueBigintInt640003
       * @tc.desc      : Testing GetValueBigintInt64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintInt640003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0400
       * @tc.name      : testGetValueBigintInt640004
       * @tc.desc      : Testing GetValueBigintInt64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintInt640004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTINT64_0500
       * @tc.name      : testGetValueBigintInt640005
       * @tc.desc      : Testing GetValueBigintInt64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintInt640005', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0100
       * @tc.name      : testGetValueBigintWords0001
       * @tc.desc      : Testing GetValueBigintWords interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintWords0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0200
       * @tc.name      : testGetValueBigintWords0002
       * @tc.desc      : Testing GetValueBigintWords interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintWords0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0300
       * @tc.name      : testGetValueBigintWords0003
       * @tc.desc      : Testing GetValueBigintWords interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintWords0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0400
       * @tc.name      : testGetValueBigintWords0004
       * @tc.desc      : Testing GetValueBigintWords interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintWords0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0500
       * @tc.name      : testGetValueBigintWords0005
       * @tc.desc      : Testing GetValueBigintWords interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintWords0005', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINTWORDS_0600
       * @tc.name      : testGetValueBigintWords0006
       * @tc.desc      : Testing GetValueBigintWords interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBigintWords0006', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_INT64_0100
       * @tc.name      : testNapiCreateBigintInt640001
       * @tc.desc      : Testing napi_create_bigint_int64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintInt640001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_INT64_0200
       * @tc.name      : testNapiCreateBigintInt640002
       * @tc.desc      : Testing napi_create_bigint_int64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintInt640002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_INT64_0300
       * @tc.name      : testNapiCreateBigintInt640003
       * @tc.desc      : Testing napi_create_bigint_int64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintInt640003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_UINT64_0100
       * @tc.name      : testNapiCreateBigintUint640001
       * @tc.desc      : Testing napi_create_bigint_uint64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintUint640001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_UINT64_0200
       * @tc.name      : testNapiCreateBigintUint640002
       * @tc.desc      : Testing napi_create_bigint_uint64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintUint640002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_UINT64_0300
       * @tc.name      : testNapiCreateBigintUint640003
       * @tc.desc      : Testing napi_create_bigint_uint64 interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintUint640003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_WORDS_0100
       * @tc.name      : testNapiCreateBigintWords0001
       * @tc.desc      : Testing napi_create_bigint_words interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintWords0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_WORDS_0200
       * @tc.name      : testNapiCreateBigintWords0002
       * @tc.desc      : Testing napi_create_bigint_words interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintWords0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_WORDS_0300
       * @tc.name      : testNapiCreateBigintWords0003
       * @tc.desc      : Testing napi_create_bigint_words interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintWords0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BIGINT_WORDS_0400
       * @tc.name      : testNapiCreateBigintWords0004
       * @tc.desc      : Testing napi_create_bigint_words interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBigintWords0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_0100
       * @tc.name      : testNapiCreateBuffer0001
       * @tc.desc      : Testing napi_create_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBuffer0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_0200
       * @tc.name      : testNapiCreateBuffer0002
       * @tc.desc      : Testing napi_create_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBuffer0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_0300
       * @tc.name      : testNapiCreateBuffer0003
       * @tc.desc      : Testing napi_create_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBuffer0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_0400
       * @tc.name      : testNapiCreateBuffer0004
       * @tc.desc      : Testing napi_create_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBuffer0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0100
       * @tc.name      : testNapiCreateBufferCopy0001
       * @tc.desc      : Testing napi_create_buffer_copy interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBufferCopy0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0200
       * @tc.name      : testNapiCreateBufferCopy0002
       * @tc.desc      : Testing napi_create_buffer_copy interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBufferCopy0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0300
       * @tc.name      : testNapiCreateBufferCopy0003
       * @tc.desc      : Testing napi_create_buffer_copy interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBufferCopy0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0400
       * @tc.name      : testNapiCreateBufferCopy0004
       * @tc.desc      : Testing napi_create_buffer_copy interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBufferCopy0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_BUFFER_COPY_0500
       * @tc.name      : testNapiCreateBufferCopy0005
       * @tc.desc      : Testing napi_create_buffer_copy interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateBufferCopy0005', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_EXTERNAL_BUFFER_0100
       * @tc.name      : testNapiCreateExternalBuffer0001
       * @tc.desc      : Testing napi_create_external_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateExternalBuffer0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_EXTERNAL_BUFFER_0200
       * @tc.name      : testNapiCreateExternalBuffer0002
       * @tc.desc      : Testing napi_create_external_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateExternalBuffer0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_EXTERNAL_BUFFER_0300
       * @tc.name      : testNapiCreateExternalBuffer0003
       * @tc.desc      : Testing napi_create_external_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateExternalBuffer0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_BUFFER_INFO_0100
       * @tc.name      : testNapiGetBufferInfo0001
       * @tc.desc      : Testing napi_get_buffer_info interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetBufferInfo0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_BUFFER_INFO_0200
       * @tc.name      : testNapiGetBufferInfo0002
       * @tc.desc      : Testing napi_get_buffer_info interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetBufferInfo0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_BUFFER_INFO_0300
       * @tc.name      : testNapiGetBufferInfo0003
       * @tc.desc      : Testing napi_get_buffer_info interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetBufferInfo0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_IS_BUFFER_0100
       * @tc.name      : testNapiIsBuffer0001
       * @tc.desc      : Testing napi_is_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiIsBuffer0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_IS_BUFFER_0200
       * @tc.name      : testNapiIsBuffer0002
       * @tc.desc      : Testing napi_is_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiIsBuffer0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_IS_BUFFER_0300
       * @tc.name      : testNapiIsBuffer0003
       * @tc.desc      : Testing napi_is_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiIsBuffer0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_IS_BUFFER_0400
       * @tc.name      : testNapiIsBuffer0004
       * @tc.desc      : Testing napi_is_buffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiIsBuffer0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OBJECT_FREEZE_0100
       * @tc.name      : testNapiObjectFreeze0001
       * @tc.desc      : Testing napi_object_freeze interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiObjectFreeze0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OBJECT_FREEZE_0200
       * @tc.name      : testNapiObjectFreeze0002
       * @tc.desc      : Testing napi_object_freeze interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiObjectFreeze0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OBJECT_SEAL_0100
       * @tc.name      : testNapiObjectSeal0001
       * @tc.desc      : Testing napi_object_seal interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiObjectSeal0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OBJECT_SEAL_0200
       * @tc.name      : testNapiObjectSeal0002
       * @tc.desc      : Testing napi_object_seal interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiObjectSeal0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_ALL_PROPERTY_NAMES_0100
       * @tc.name      : testNapiGetAllPropertyNames0001
       * @tc.desc      : Testing napi_get_all_property_names interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetAllPropertyNames0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_ALL_PROPERTY_NAMES_0200
       * @tc.name      : testNapiGetAllPropertyNames0002
       * @tc.desc      : Testing napi_get_all_property_names interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetAllPropertyNames0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_ALL_PROPERTY_NAMES_0300
       * @tc.name      : testNapiGetAllPropertyNames0003
       * @tc.desc      : Testing napi_get_all_property_names interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetAllPropertyNames0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DETACH_ARRAYBUFFER_0100
       * @tc.name      : testNapiDetachArraybuffer0001
       * @tc.desc      : Testing napi_detach_arraybuffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiDetachArraybuffer0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DETACH_ARRAYBUFFER_0200
       * @tc.name      : testNapiDetachArraybuffer0002
       * @tc.desc      : Testing napi_detach_arraybuffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiDetachArraybuffer0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DETACH_ARRAYBUFFER_0300
       * @tc.name      : testNapiDetachArraybuffer0003
       * @tc.desc      : Testing napi_detach_arraybuffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiDetachArraybuffer0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_IS_DETACHED_ARRAYBUFFER_0100
       * @tc.name      : testNapiIsDetachedArraybuffer0001
       * @tc.desc      : Testing napi_is_detached_arraybuffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiIsDetachedArraybuffer0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_IS_DETACHED_ARRAYBUFFER_0200
       * @tc.name      : testNapiIsDetachedArraybuffer0002
       * @tc.desc      : Testing napi_is_detached_arraybuffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiIsDetachedArraybuffer0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_IS_DETACHED_ARRAYBUFFER_0300
       * @tc.name      : testNapiIsDetachedArraybuffer0003
       * @tc.desc      : Testing napi_is_detached_arraybuffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiIsDetachedArraybuffer0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_IS_DETACHED_ARRAYBUFFER_0400
       * @tc.name      : testNapiIsDetachedArraybuffer0004
       * @tc.desc      : Testing napi_is_detached_arraybuffer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiIsDetachedArraybuffer0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SET_INSTANCE_DATA_0100
       * @tc.name      : testNapiSetInstanceData0001
       * @tc.desc      : Testing napi_set_instance_data interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiSetInstanceData0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_SET_INSTANCE_DATA_0200
       * @tc.name      : testNapiSetInstanceData0002
       * @tc.desc      : Testing napi_set_instance_data interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiSetInstanceData0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GET_INSTANCE_DATA_0100
       * @tc.name      : testNapiGetInstanceData0001
       * @tc.desc      : Testing napi_get_instance_data interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiGetInstanceData0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ADD_ENV_CLEANUP_HOOK_0100
       * @tc.name      : testNapiAddEnvCleanupHook0001
       * @tc.desc      : Testing napi_add_env_cleanup_hook interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiAddEnvCleanupHook0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ADD_ENV_CLEANUP_HOOK_0200
       * @tc.name      : testNapiAddEnvCleanupHook0002
       * @tc.desc      : Testing napi_add_env_cleanup_hook interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiAddEnvCleanupHook0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ADD_ENV_CLEANUP_HOOK_0300
       * @tc.name      : testNapiAddEnvCleanupHook0003
       * @tc.desc      : Testing napi_add_env_cleanup_hook interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiAddEnvCleanupHook0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVE_ENV_CLEANUP_HOOK_0100
       * @tc.name      : testNapiRemoveEnvCleanupHook0001
       * @tc.desc      : Testing napi_remove_env_cleanup_hook interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRemoveEnvCleanupHook0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_REMOVE_ENV_CLEANUP_HOOK_0200
       * @tc.name      : testNapiRemoveEnvCleanupHook0002
       * @tc.desc      : Testing napi_remove_env_cleanup_hook interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRemoveEnvCleanupHook0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NODE_API_GET_MODULE_FILE_NAME_0100
       * @tc.name      : testNapiApiGetModuleFileName0001
       * @tc.desc      : Testing node_api_get_module_file_name interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiApiGetModuleFileName0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NODE_API_GET_MODULE_FILE_NAME_0200
       * @tc.name      : testNapiApiGetModuleFileName0002
       * @tc.desc      : Testing node_api_get_module_file_name interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiApiGetModuleFileName0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NODE_API_GET_MODULE_FILE_NAME_0300
       * @tc.name      : testNapiApiGetModuleFileName0003
       * @tc.desc      : Testing node_api_get_module_file_name interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiApiGetModuleFileName0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_ADD_FINALIZER_0100
       * @tc.name      : testNapiAddFinalizer0001
       * @tc.desc      : Testing napi_add_finalizer interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiAddFinalizer0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_QUEUE_ASYNC_WORK_WITH_QOS_0100
       * @tc.name      : testNapiQueueAsyncWorkWithQos0001
       * @tc.desc      : Testing napi_queue_async_work_with_qos interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiQueueAsyncWorkWithQos0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_QUEUE_ASYNC_WORK_WITH_QOS_0200
       * @tc.name      : testNapiQueueAsyncWorkWithQos0002
       * @tc.desc      : Testing napi_queue_async_work_with_qos interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiQueueAsyncWorkWithQos0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_QUEUE_ASYNC_WORK_WITH_QOS_0300
       * @tc.name      : testNapiQueueAsyncWorkWithQos0003
       * @tc.desc      : Testing napi_queue_async_work_with_qos interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiQueueAsyncWorkWithQos0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_RUN_SCRIPT_PATH_0100
       * @tc.name      : testNapiRunScriptPath0001
       * @tc.desc      : Testing napi_run_script_path interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRunScriptPath0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_RUN_SCRIPT_PATH_0200
       * @tc.name      : testNapiRunScriptPath0002
       * @tc.desc      : Testing napi_run_script_path interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiRunScriptPath0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_LOAD_MODULE_0100
       * @tc.name      : testNapiLoadModule0001
       * @tc.desc      : Testing napi_load_module interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiLoadModule0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_LOAD_MODULE_0200
       * @tc.name      : testNapiLoadModule0002
       * @tc.desc      : Testing napi_load_module interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiLoadModule0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_LOAD_MODULE_0300
       * @tc.name      : testNapiLoadModule0003
       * @tc.desc      : Testing napi_load_module interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiLoadModule0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_OBJECT_WITH_PROPERTIES_0100
       * @tc.name      : testNapiCreateObjectWithProperties0001
       * @tc.desc      : Testing napi_create_object_with_properties interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateObjectWithProperties0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATE_OBJECT_WITH_PROPERTIES_0200
       * @tc.name      : testNapiCreateObjectWithProperties0002
       * @tc.desc      : Testing napi_create_object_with_properties interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiCreateObjectWithProperties0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0100
       * @tc.name      : testGetDateValue0001
       * @tc.desc      : Testing GetDateValue NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetDateValue0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0200
       * @tc.name      : testGetDateValue0002
       * @tc.desc      : Testing GetDateValue NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetDateValue0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0300
       * @tc.name      : testGetDateValue0003
       * @tc.desc      : Testing GetDateValue NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetDateValue0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0400
       * @tc.name      : testGetDateValue0004
       * @tc.desc      : Testing GetDateValue NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetDateValue0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETDATEVALUE_0500
       * @tc.name      : testGetDateValue0005
       * @tc.desc      : Testing GetDateValue NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetDateValue0005', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEBIGINTWORDS_0100
       * @tc.name      : testCreateBigintWords0001
       * @tc.desc      : Testing CreateBigintWords NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateBigintWords0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEBIGINTINT64VALUENOTJS_0100
       * @tc.name      : testCreateBigintInt64ValueNotJS0001
       * @tc.desc      : Testing CreateBigintInt64 NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateBigintInt64ValueNotJS0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEBIGINTUINT64VALUENOTJS_0100
       * @tc.name      : testCreateBigintUint64ValueNotJS0001
       * @tc.desc      : Testing CreateBigintUint64 NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateBigintUint64ValueNotJS0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETVALUEBIGINWORDSNOTBIGINT_0100
       * @tc.name      : testGetValueBiginWords0001
       * @tc.desc      : Testing GetValueBiginWords NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetValueBiginWords0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CreateBufferSizeZero_0100
       * @tc.name      : testCreateBufferSizeZero0001
       * @tc.desc      : Testing CreateBufferSizeZero NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateBufferSizeZero0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEBUFFERCOPYLENGTHMAX_0100
       * @tc.name      : testCreateBufferCopyLengthMax0001
       * @tc.desc      : Testing createBufferCopyLengthMax NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateBufferCopyLengthMax0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEBUFFERCOPYLENGTHZERO_0100
       * @tc.name      : testCreateBufferCopyLengthZero0001
       * @tc.desc      : Testing createBufferCopyLengthMax NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateBufferCopyLengthZero0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNALBUFFERLENGTHZERO_0100
       * @tc.name      : testCreateExternalBufferLengthZero0001
       * @tc.desc      : Testing createExternalBufferLengthZero NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateExternalBufferLengthZero0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEEXTERNALBUFFERLENGTHMAX_0100
       * @tc.name      : testCreateExternalBufferLengthMax0001
       * @tc.desc      : Testing createExternalBufferLengthMax NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateExternalBufferLengthMax0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_GETBUFFERINFOVALUENOTBUFFER_0100
       * @tc.name      : testGetBufferInfoValueNotBuffer0001
       * @tc.desc      : Testing getBufferInfoValueNotBuffer NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testGetBufferInfoValueNotBuffer0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OBJECTSEAL_0100
       * @tc.name      : testObjectSeal0001
       * @tc.desc      : Testing ObjectSeal NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testObjectSeal0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_OBJECTFREEZE_0100
       * @tc.name      : testObjectFreeze0001
       * @tc.desc      : Testing ObjectFreeze NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testObjectFreeze0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_DETACHARRAYBUFFER_0100
       * @tc.name      : testDetachArraybuffer0001
       * @tc.desc      : Testing DetachArraybuffer NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testDetachArraybuffer0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLE_0100
       * @tc.name      : testIsSendable0001
       * @tc.desc      : Testing NapiIsSendable NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testIsSendable0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLE_0200
       * @tc.name      : testIsSendable0002
       * @tc.desc      : Testing NapiIsSendable NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testIsSendable0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLE_0300
       * @tc.name      : testIsSendable0003
       * @tc.desc      : Testing NapiIsSendable NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testIsSendable0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPIISSENDABLE_0400
       * @tc.name      : testIsSendable0004
       * @tc.desc      : Testing NapiIsSendable NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testIsSendable0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZE_0100
       * @tc.name      : testNapiDeserialize0001
       * @tc.desc      : Testing NapiDeserialize NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiDeserialize0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZE_0200
       * @tc.name      : testNapiDeserialize0002
       * @tc.desc      : Testing NapiDeserialize NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiDeserialize0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZE_0300
       * @tc.name      : testNapiDeserialize0003
       * @tc.desc      : Testing NapiDeserialize NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiDeserialize0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPIDESERIALIZE_0400
       * @tc.name      : testNapiDeserialize0004
       * @tc.desc      : Testing NapiDeserialize NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiDeserialize0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALIZE_0100
       * @tc.name      : testNapiSerialize0001
       * @tc.desc      : Testing NapiSerialize NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiSerialize0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALIZE_0200
       * @tc.name      : testNapiSerialize0002
       * @tc.desc      : Testing NapiSerialize NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiSerialize0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALIZE_0300
       * @tc.name      : testNapiSerialize0003
       * @tc.desc      : Testing NapiSerialize NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiSerialize0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_NAPISERIALIZE_0400
       * @tc.name      : testNapiSerialize0004
       * @tc.desc      : Testing NapiSerialize NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testNapiSerialize0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEOBJECTWITHNAMEDPROPERTIES_0100
       * @tc.name      : testCreateObjectWithNamedProperties0001
       * @tc.desc      : Testing CreateObjectWithNamedProperties NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateObjectWithNamedProperties0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATEOBJECTWITHNAMEDPROPERTIES_0200
       * @tc.name      : testCreateObjectWithNamedProperties0002
       * @tc.desc      : Testing CreateObjectWithNamedProperties NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCreateObjectWithNamedProperties0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0100
       * @tc.name      : testCoerceToNativeBindingObject0001
       * @tc.desc      : Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCoerceToNativeBindingObject0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0200
       * @tc.name      : testCoerceToNativeBindingObject0002
       * @tc.desc      : Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCoerceToNativeBindingObject0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0300
       * @tc.name      : testCoerceToNativeBindingObject0003
       * @tc.desc      : Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCoerceToNativeBindingObject0003', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0400
       * @tc.name      : testCoerceToNativeBindingObject0004
       * @tc.desc      : Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCoerceToNativeBindingObject0004', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_COERCETONATIVEBINDINGOBJECT_0500
       * @tc.name      : testCoerceToNativeBindingObject0005
       * @tc.desc      : Testing CoerceToNativeBindingObject NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testCoerceToNativeBindingObject0005', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TESTDELETESERIALIZATIONDATA0001_0100
       * @tc.name      : testDeleteSerializationData0001
       * @tc.desc      : Testing deleteSerializationData NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testDeleteSerializationData0001', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TESTDELETESERIALIZATIONDATA0001_0200
       * @tc.name      : testDeleteSerializationData0002
       * @tc.desc      : Testing deleteSerializationData NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testDeleteSerializationData0002', 0, async (done: Function) => {
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
       * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_TESTDELETESERIALIZATIONDATA0001_0300
       * @tc.name      : testDeleteSerializationData0003
       * @tc.desc      : Testing deleteSerializationData NAPI interface.
       * @tc.size      : MediumTest
       * @tc.type      : Function
       * @tc.level     : Level 1
       */
      it('testDeleteSerializationData0003', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0100
     * @tc.name      : testhasOwnPropertyCheckpro0001
     * @tc.desc      : Testing hasOwnProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testhasOwnPropertyCheckpro0100', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_HASOWNPROPERTY_0200
     * @tc.name      : testhasOwnPropertyCheckpro0001
     * @tc.desc      : Testing hasOwnProperty NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testhasOwnPropertyCheckOwnpro0200', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_createTypeErrorRes_0100
     * @tc.name      : testcreateTypeErrorRes0100
     * @tc.desc      : Testing napi_create_type_error NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testcreateTypeErrorRes0100', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATETYPEERRORRES_0200
     * @tc.name      : testcreateTypeErrorRes0200
     * @tc.desc      : Testing napi_create_type_error NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testcreateTypeErrorRes0200', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATERANGEERRORRES_0100
     * @tc.name      : testcreateRangeErrorRes0100
     * @tc.desc      : Testing napi_create_range_error NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testcreateRangeErrorRes0100', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_CREATERANGEERRORRES_0200
     * @tc.name      : testcreateRangeErrorRes0200
     * @tc.desc      : Testing napi_create_range_error NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testcreateRangeErrorRes0200', 0, async (done: Function) => {
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
     * @tc.number    : SUB_RUNTIME_LANGUAGE_NAPI_testNapiWrapEnhanceTest0001
     * @tc.name      : testNapiWrapEnhanceTest0001
     * @tc.desc      : Testing NapiCheckObjectTypeTagTest NAPI interface.
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('testNapiWrapEnhanceTest0001', 0, async (done: Function) => {
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
  })
}
