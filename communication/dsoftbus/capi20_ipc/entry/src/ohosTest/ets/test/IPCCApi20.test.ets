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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
import iPCCApi from 'libIPC20CApi.so'

const Success = 0;

export default function iPCCCApi20Test() {
  describe('iPCCCApi20Test', () => {

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100
     * @tc.desc   test OHIPCParcelRewindReadPositionParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100 start====");
          let result: number = iPCCApi.OHIPCParcelRewindReadPositionParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelRewindReadPositionParamError_0100 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200
     * @tc.desc   test OHIPCParcelRewindWritePositionParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200 start====");
          let result: number = iPCCApi.OHIPCParcelRewindWritePositionParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelRewindWritePositionParamError_0200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300
     * @tc.desc   test OHIPCParcelWriteInt8WriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt8WriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8WriteError_0300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400
     * @tc.desc   test OHIPCParcelWriteInt8ParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt8ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt8ParamError_0400 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500
     * @tc.desc   test OHIPCParcelReadInt8ReadError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt8ReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ReadError_0500 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600
     * @tc.desc   test OHIPCParcelReadInt8ParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt8ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt8ParamError_0600 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700
     * @tc.desc   test OHIPCParcelWriteInt16WriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt16WriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16WriteError_0700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800
     * @tc.desc   test OHIPCParcelWriteInt16ParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt16ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt16ParamError_0800 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900
     * @tc.desc   test OHIPCParcelReadInt16ReadError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt16ReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ReadError_0900 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000
     * @tc.desc   test OHIPCParcelReadInt16ParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt16ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt16ParamError_1000 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100
     * @tc.desc   test OHIPCParcelWriteInt32WriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt32WriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32WriteError_1100 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200
     * @tc.desc   test OHIPCParcelWriteInt32ParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt32ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt32ParamError_1200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300
     * @tc.desc   test OHIPCParcelReadInt32ReadError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt32ReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ReadError_1300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400
     * @tc.desc   test OHIPCParcelReadInt32ParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt32ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt32ParamError_1400 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500
     * @tc.desc   test OHIPCParcelWriteInt64WriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt64WriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64WriteError_1500 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600
     * @tc.desc   test OHIPCParcelWriteInt64ParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInt64ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInt64ParamError_1600 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700
     * @tc.desc   test OHIPCParcelReadInt64ReadError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt64ReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ReadError_1700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800
     * @tc.desc   test OHIPCParcelReadInt64ParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800 start====");
          let result: number = iPCCApi.OHIPCParcelReadInt64ParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInt64ParamError_1800 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900
     * @tc.desc   test OHIPCParcelWriteFloatWriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900 start====");
          let result: number = iPCCApi.OHIPCParcelWriteFloatWriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatWriteError_1900 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000
     * @tc.desc   test OHIPCParcelWriteFloatParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000 start====");
          let result: number = iPCCApi.OHIPCParcelWriteFloatParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFloatParamError_2000 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadFloatReadError_2100
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadFloatReadError_2100
     * @tc.desc   test OHIPCParcelReadFloatReadError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadFloatReadError_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFloatReadError_2100 start====");
          let result: number = iPCCApi.OHIPCParcelReadFloatReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFloatReadError_2100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadFloatReadError_2100 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadFloatParamError_2200
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadFloatParamError_2200
     * @tc.desc   test OHIPCParcelReadFloatParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadFloatParamError_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFloatParamError_2200 start====");
          let result: number = iPCCApi.OHIPCParcelReadFloatParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFloatParamError_2200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadFloatParamError_2200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleWriteError_2300
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleWriteError_2300
     * @tc.desc   test OHIPCParcelWriteDoubleWriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleWriteError_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleWriteError_2300 start====");
          let result: number = iPCCApi.OHIPCParcelWriteDoubleWriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleWriteError_2300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleWriteError_2300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleParamError_2400
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleParamError_2400
     * @tc.desc   test OHIPCParcelWriteDoubleParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleParamError_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleParamError_2400 start====");
          let result: number = iPCCApi.OHIPCParcelWriteDoubleParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleParamError_2400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteDoubleParamError_2400 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadDoubleReadError_2500
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadDoubleReadError_2500
     * @tc.desc   test OHIPCParcelReadDoubleReadError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadDoubleReadError_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadDoubleReadError_2500 start====");
          let result: number = iPCCApi.OHIPCParcelReadDoubleReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadDoubleReadError_2500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadDoubleReadError_2500 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadDoubleParamError_2600
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadDoubleParamError_2600
     * @tc.desc   test OHIPCParcelReadDoubleParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadDoubleParamError_2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadDoubleParamError_2600 start====");
          let result: number = iPCCApi.OHIPCParcelReadDoubleParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadDoubleParamError_2600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadDoubleParamError_2600 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteStringWriteError_2700
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteStringWriteError_2700
     * @tc.desc   test OHIPCParcelWriteStringWriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteStringWriteError_2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteStringWriteError_2700 start====");
          let result: number = iPCCApi.OHIPCParcelWriteStringWriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteStringWriteError_2700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteStringWriteError_2700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteStringParamError_2800
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteStringParamError_2800
     * @tc.desc   test OHIPCParcelWriteStringParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteStringParamError_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteStringParamError_2800 start====");
          let result: number = iPCCApi.OHIPCParcelWriteStringParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteStringParamError_2800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteStringParamError_2800 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteBufferWriteError_3300
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteBufferWriteError_3300
     * @tc.desc   test OHIPCParcelWriteBufferWriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteBufferWriteError_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteBufferWriteError_3300 start====");
          let result: number = iPCCApi.OHIPCParcelWriteBufferWriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteBufferWriteError_3300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteBufferWriteError_3300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteBufferParamError_2900
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteBufferParamError_2900
     * @tc.desc   test OHIPCParcelWriteBufferParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteBufferParamError_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteBufferParamError_2900 start====");
          let result: number = iPCCApi.OHIPCParcelWriteBufferParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteBufferParamError_2900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteBufferParamError_2900 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubSuccess_3000
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubSuccess_3000
     * @tc.desc   test OHIPCParcelWriteRemoteStubSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubSuccess_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubSuccess_3000 start====");
          let result: number = iPCCApi.OHIPCParcelWriteRemoteStubSuccess();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubSuccess_3000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubSuccess_3000 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubWriteError_3100
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubWriteError_3100
     * @tc.desc   test OHIPCParcelWriteRemoteStubWriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubWriteError_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubWriteError_3100 start====");
          let result: number = iPCCApi.OHIPCParcelWriteRemoteStubWriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubWriteError_3100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubWriteError_3100 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubParamError_3200
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubParamError_3200
     * @tc.desc   test OHIPCParcelWriteRemoteStubParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubParamError_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubParamError_3200 start====");
          let result: number = iPCCApi.OHIPCParcelWriteRemoteStubParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubParamError_3200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteStubParamError_3200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteProxyParamError_3500
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteProxyParamError_3500
     * @tc.desc   test OHIPCParcelWriteRemoteProxyParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteProxyParamError_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteProxyParamError_3500 start====");
          let result: number = iPCCApi.OHIPCParcelWriteRemoteProxyParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteProxyParamError_3500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteRemoteProxyParamError_3500 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorSuccess_3600
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorSuccess_3600
     * @tc.desc   test OHIPCParcelWriteFileDescriptorSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorSuccess_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorSuccess_3600 start====");
          let result: number = iPCCApi.OHIPCParcelWriteFileDescriptorSuccess();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorSuccess_3600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorSuccess_3600 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorWriteError_3700
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorWriteError_3700
     * @tc.desc   test OHIPCParcelWriteFileDescriptorWriteError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorWriteError_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorWriteError_3700 start====");
          let result: number = iPCCApi.OHIPCParcelWriteFileDescriptorWriteError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorWriteError_3700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorWriteError_3700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorParamError_3800
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorParamError_3800
     * @tc.desc   test OHIPCParcelWriteFileDescriptorParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorParamError_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorParamError_3800 start====");
          let result: number = iPCCApi.OHIPCParcelWriteFileDescriptorParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorParamError_3800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteFileDescriptorParamError_3800 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorSuccess_3900
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorSuccess_3900
     * @tc.desc   test OHIPCParcelReadFileDescriptorSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorSuccess_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorSuccess_3900 start====");
          let result: number = iPCCApi.OHIPCParcelReadFileDescriptorSuccess();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorSuccess_3900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorSuccess_3900 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorReadError_4000
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorReadError_4000
     * @tc.desc   test OHIPCParcelReadFileDescriptorReadError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorReadError_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorReadError_4000 start====");
          let result: number = iPCCApi.OHIPCParcelReadFileDescriptorReadError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorReadError_4000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorReadError_4000 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorParamError_4100
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorParamError_4100
     * @tc.desc   test OHIPCParcelReadFileDescriptorParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorParamError_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorParamError_4100 start====");
          let result: number = iPCCApi.OHIPCParcelReadFileDescriptorParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorParamError_4100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadFileDescriptorParamError_4100 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCQuestModeAsync_4200
     * @tc.number SUB_DSoftbus_IPC_OHIPCQuestModeAsync_4200
     * @tc.desc   test OHIPCQuestModeAsync
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCQuestModeAsync_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCQuestModeAsync_4200 start====");
          let result: number = iPCCApi.OHIPCQuestModeAsync();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCQuestModeAsync_4200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCQuestModeAsync_4200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelAppendSuccess_4300
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelAppendSuccess_4300
     * @tc.desc   test OHIPCParcelAppendSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelAppendSuccess_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelAppendSuccess_4300 start====");
          let result: number = iPCCApi.OHIPCParcelAppendSuccess();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelAppendSuccess_4300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelAppendSuccess_4300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelAppendParamError_4500
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelAppendParamError_4500
     * @tc.desc   test OHIPCParcelAppendParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelAppendParamError_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelAppendParamError_4500 start====");
          let result: number = iPCCApi.OHIPCParcelAppendParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelAppendParamError_4500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelAppendParamError_4500 catch err: " + err);
          expect().assertFail();
        }
      });


    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelWriteInterfaceTokenParamError_4700
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelWriteInterfaceTokenParamError_4700
     * @tc.desc   test OHIPCParcelWriteInterfaceTokenParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelWriteInterfaceTokenParamError_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInterfaceTokenParamError_4700 start====");
          let result: number = iPCCApi.OHIPCParcelWriteInterfaceTokenParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInterfaceTokenParamError_4700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelWriteInterfaceTokenParamError_4700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenSuccess_4800
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenSuccess_4800
     * @tc.desc   test OHIPCParcelReadInterfaceTokenSuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenSuccess_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenSuccess_4800 start====");
          let result: number = iPCCApi.OHIPCParcelReadInterfaceTokenSuccess();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenSuccess_4800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenSuccess_4800 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenParamError_5000
     * @tc.number SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenParamError_5000
     * @tc.desc   test OHIPCParcelReadInterfaceTokenParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenParamError_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenParamError_5000 start====");
          let result: number = iPCCApi.OHIPCParcelReadInterfaceTokenParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenParamError_5000 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCParcelReadInterfaceTokenParamError_5000 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCRemoteProxyGetInterfaceDescriptorParamError_5200
     * @tc.number SUB_DSoftbus_IPC_OHIPCRemoteProxyGetInterfaceDescriptorParamError_5200
     * @tc.desc   test OHIPCRemoteProxyGetInterfaceDescriptorParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCRemoteProxyGetInterfaceDescriptorParamError_5200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyGetInterfaceDescriptorParamError_5200 start====");
          let result: number = iPCCApi.OHIPCRemoteProxyGetInterfaceDescriptorParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyGetInterfaceDescriptorParamError_5200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyGetInterfaceDescriptorParamError_5200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCRemoteProxyAddDeathRecipientParamError_5300
     * @tc.number SUB_DSoftbus_IPC_OHIPCRemoteProxyAddDeathRecipientParamError_5300
     * @tc.desc   test OHIPCRemoteProxyAddDeathRecipientParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCRemoteProxyAddDeathRecipientParamError_5300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyAddDeathRecipientParamError_5300 start====");
          let result: number = iPCCApi.OHIPCRemoteProxyAddDeathRecipientParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyAddDeathRecipientParamError_5300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyAddDeathRecipientParamError_5300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCRemoteProxyRemoveDeathRecipientParamError_5400
     * @tc.number SUB_DSoftbus_IPC_OHIPCRemoteProxyRemoveDeathRecipientParamError_5400
     * @tc.desc   test OHIPCRemoteProxyRemoveDeathRecipientParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCRemoteProxyRemoveDeathRecipientParamError_5400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyRemoveDeathRecipientParamError_5400 start====");
          let result: number = iPCCApi.OHIPCRemoteProxyRemoveDeathRecipientParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyRemoveDeathRecipientParamError_5400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCRemoteProxyRemoveDeathRecipientParamError_5400 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCSkeletonSetMaxWorkThreadNumParamError_5500
     * @tc.number SUB_DSoftbus_IPC_OHIPCSkeletonSetMaxWorkThreadNumParamError_5500
     * @tc.desc   test OHIPCSkeletonSetMaxWorkThreadNumParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCSkeletonSetMaxWorkThreadNumParamError_5500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonSetMaxWorkThreadNumParamError_5500 start====");
          let result: number = iPCCApi.OHIPCSkeletonSetMaxWorkThreadNumParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonSetMaxWorkThreadNumParamError_5500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCSkeletonSetMaxWorkThreadNumParamError_5500 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentitySuccess_5600
     * @tc.number SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentitySuccess_5600
     * @tc.desc   test OHIPCSkeletonResetCallingIdentitySuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentitySuccess_5600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentitySuccess_5600 start====");
          let result: number = iPCCApi.OHIPCSkeletonResetCallingIdentitySuccess();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentitySuccess_5600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentitySuccess_5600 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentityParamError_5700
     * @tc.number SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentityParamError_5700
     * @tc.desc   test OHIPCSkeletonResetCallingIdentityParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentityParamError_5700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentityParamError_5700 start====");
          let result: number = iPCCApi.OHIPCSkeletonResetCallingIdentityParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentityParamError_5700 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentityParamError_5700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentitySuccess_5800
     * @tc.number SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentitySuccess_5800
     * @tc.desc   test OHIPCSkeletonSetCallingIdentitySuccess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentitySuccess_5800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentitySuccess_5800 start====");
          let result: number = iPCCApi.OHIPCSkeletonSetCallingIdentitySuccess();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentitySuccess_5800 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentitySuccess_5800 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentityParamError_5900
     * @tc.number SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentityParamError_5900
     * @tc.desc   test OHIPCSkeletonSetCallingIdentityParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentityParamError_5900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentityParamError_5900 start====");
          let result: number = iPCCApi.OHIPCSkeletonSetCallingIdentityParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCSkeletonSetCallingIdentityParamError_5900 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCSkeletonResetCallingIdentityParamError_5700 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCRemoteProxySendRequestParamError_6100
     * @tc.number SUB_DSoftbus_IPC_OHIPCRemoteProxySendRequestParamError_6100
     * @tc.desc   test OHIPCRemoteProxySendRequestParamError
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCRemoteProxySendRequestParamError_6100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCRemoteProxySendRequestParamError_6100 start====");
          let result: number = iPCCApi.OHIPCRemoteProxySendRequestParamError();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCRemoteProxySendRequestParamError_6100 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCRemoteProxySendRequestParamError_6100 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCInvalidUserErrorCode_6200
     * @tc.number SUB_DSoftbus_IPC_OHIPCInvalidUserErrorCode_6200
     * @tc.desc   test OHIPCInvalidUserErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCInvalidUserErrorCode_6200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCInvalidUserErrorCode_6200 start====");
          let result: number = iPCCApi.OHIPCInvalidUserErrorCode();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCInvalidUserErrorCode_6200 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCInvalidUserErrorCode_6200 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCErrorCodeMAX_6300
     * @tc.number SUB_DSoftbus_IPC_OHIPCErrorCodeMAX_6300
     * @tc.desc   test OHIPCErrorCodeMAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCErrorCodeMAX_6300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCErrorCodeMAX_6300 start====");
          let result: number = iPCCApi.OHIPCErrorCodeMAX();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCErrorCodeMAX_6300 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCErrorCodeMAX_6300 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCUserErrorCodeMIN_6400
     * @tc.number SUB_DSoftbus_IPC_OHIPCUserErrorCodeMIN_6400
     * @tc.desc   test OHIPCUserErrorCodeMIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCUserErrorCodeMIN_6400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCUserErrorCodeMIN_6400 start====");
          let result: number = iPCCApi.OHIPCUserErrorCodeMIN();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCUserErrorCodeMIN_6400 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCUserErrorCodeMIN_6400 catch err: " + err);
          expect().assertFail();
        }
      });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCUserErrorCodeMAX_6500
     * @tc.number SUB_DSoftbus_IPC_OHIPCUserErrorCodeMAX_6500
     * @tc.desc   test OHIPCUserErrorCodeMAX
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCUserErrorCodeMAX_6500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCUserErrorCodeMAX_6500 start====");
          let result: number = iPCCApi.OHIPCUserErrorCodeMAX();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCUserErrorCodeMAX_6500 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCUserErrorCodeMAX_6500 catch err: " + err);
          expect().assertFail();
        }
    });

    /**
     * @tc.name   SUB_DSoftbus_IPC_OHIPCErrorCode_6600
     * @tc.number SUB_DSoftbus_IPC_OHIPCErrorCode_6600
     * @tc.desc   test OHIPCErrorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DSoftbus_IPC_OHIPCErrorCode_6600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        try {
          console.info("====>SUB_DSoftbus_IPC_OHIPCErrorCode_6600 start====");
          let result: number = iPCCApi.OHIPCErrorCode();
          expect(result).assertEqual(Success);
          console.info("====>SUB_DSoftbus_IPC_OHIPCErrorCode_6600 result: " + result);
          done();
        } catch (err) {
          console.error("====>SUB_DSoftbus_IPC_OHIPCErrorCode_6600 catch err: " + err);
          expect().assertFail();
        }
    });

  })
}