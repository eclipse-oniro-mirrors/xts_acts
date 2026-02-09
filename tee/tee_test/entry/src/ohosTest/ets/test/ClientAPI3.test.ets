/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import TEETEST from 'libclient_api_test3.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'


const TEEC_SUCCESS = 0x0;
const TEEC_ERROR_SERVICE_NOT_EXIST = 0x2;
const TEEC_ERROR_GENERIC = 0xFFFF0000;
const TEEC_ERROR_ACCESS_DENIED = 0xFFFF0001;
const TEEC_ERROR_CANCEL = 0xFFFF0002;
const TEEC_ERROR_ACCESS_CONFLICT = 0xFFFF0003;
const TEEC_ERROR_EXCESS_DATA = 0xFFFF0004;
const TEEC_ERROR_BAD_FORMAT = 0xFFFF0005;
const TEEC_ERROR_BAD_PARAMETERS = 0xFFFF0006;
const TEEC_ERROR_BAD_STATE = 0xFFFF0007;
const TEEC_ERROR_ITEM_NOT_FOUND = 0xFFFF0008;
const TEEC_ERROR_NOT_IMPLEMENTED = 0xFFFF0009;
const TEEC_ERROR_NOT_SUPPORTED = 0xFFFF000A;
const TEEC_ERROR_NO_DATA = 0xFFFF000B;
const TEEC_ERROR_OUT_OF_MEMORY = 0xFFFF000C;
const TEEC_ERROR_BUSY = 0xFFFF000D;
const TEEC_ERROR_COMMUNICATION = 0xFFFF000E;
const TEEC_ERROR_SECURITY = 0xFFFF000F;
const TEEC_ERROR_SHORT_BUFFER = 0xFFFF0010;
const TEEC_ERROR_MAC_INVALID = 0xFFFF3071;
const TEEC_ERROR_TARGET_DEAD = 0xFFFF3024;
const TEEC_FAIL = 0xFFFF5002;

const TEEC_ORIGIN_API = 0x1;
const TEEC_ORIGIN_COMMS = 0x2;
const TEEC_ORIGIN_TEE = 0x3;
const TEEC_ORIGIN_TRUSTED_APP = 0x4;


export default function ClientAPITest3() {
  describe('ClientAPITest3', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      let ret: number = TEETEST.InitContext();
      console.info("in beforeAll:tee_test_client_api3-------------InitContext ret:" + ret.toString(16));
      expect(ret).assertEqual(TEEC_SUCCESS);
      ret = TEETEST.OpenSession();
      console.info("in beforeAll:tee_test_client_api3-------------OpenSession ret:" + ret.toString(16));
      expect(ret).assertEqual(TEEC_SUCCESS);
      ret = TEETEST.AllocateSharedMemory();
      console.info("in beforeAll:tee_test_client_api3-------------AllocateSharedMemory ret:" + ret.toString(16));
      expect(ret).assertEqual(TEEC_SUCCESS);
    })
    beforeEach(() => {
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
      TEETEST.ReleaseSharedMemory();
      TEETEST.CloseSession();
      TEETEST.FinalizeContext();
    })

    /**
     * @tc.name   InvokeCommand_WithoutOperation
     * @tc.number InvokeCommand_WithoutOperation
     * @tc.desc   call TEEC_InvokeCommand Without operation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithoutOperation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.InvokeCommand_WithoutOperation();
      expect(ret[0]).assertEqual(TEEC_SUCCESS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
      done();
    });

    /**
     * @tc.name   InvokeCommand_WithoutSession
     * @tc.number InvokeCommand_WithoutSession
     * @tc.desc   call TEEC_InvokeCommand Without session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithoutSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithoutSession();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithOperationIsValue
     * @tc.number InvokeCommand_WithOperationIsValue
     * @tc.desc   call TEEC_InvokeCommand With paramtype is value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithOperationIsValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationIsValue();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(0x111);
        expect(ret[3]).assertEqual(0x222);
        expect(ret[4]).assertEqual(0x333 + 1);
        expect(ret[5]).assertEqual(0x444 + 1);
        expect(ret[6]).assertEqual(0x555 - 1);
        expect(ret[7]).assertEqual(0x666 - 1);
        expect(ret[8]).assertEqual(0x777 - 1);
        expect(ret[9]).assertEqual(0x888 - 1);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithOperationIsTempMem
     * @tc.number InvokeCommand_WithOperationIsTempMem
     * @tc.desc   call TEEC_InvokeCommand With paramtype is TempMem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithOperationIsTempMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationIsTempMem();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(256);
        expect(ret[3]).assertEqual(13);
        expect(ret[4]).assertEqual(25);
        expect(ret[5]).assertEqual(25);
        expect(ret[6]).assertEqual("Hello");
        expect(ret[7]).assertEqual("TEEMEM_OUTPUT");
        expect(ret[8]).assertEqual("the param is TEEMEM_INOUT");
        expect(ret[9]).assertEqual("the param is TEEMEM_INOUT");
        done();
      });

    /**
     * @tc.name   InvokeCommand_WithOperationIsPartialMem
     * @tc.number InvokeCommand_WithOperationIsPartialMem
     * @tc.desc   call TEEC_InvokeCommand With paramtype is PartialMem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithOperationIsPartialMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationIsPartialMem();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(256);
        expect(ret[3]).assertEqual(13);
        expect(ret[4]).assertEqual(25);
        expect(ret[5]).assertEqual(25);
        expect(ret[6]).assertEqual("Hello");
        expect(ret[7]).assertEqual("TEEMEM_OUTPUT");
        expect(ret[8]).assertEqual("the param is TEEMEM_INOUT");
        expect(ret[9]).assertEqual("the param is TEEMEM_INOUT");
        expect(ret[10]).assertEqual(TEEC_SUCCESS);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithOperationIsTempMemIsNULL
     * @tc.number InvokeCommand_WithOperationIsTempMemIsNULL
     * @tc.desc   call TEEC_InvokeCommand With tempMem is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithOperationIsTempMemIsNULL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationIsTempMemIsNULL();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithOperationNotStart
     * @tc.number InvokeCommand_WithOperationNotStart
     * @tc.desc   call TEEC_InvokeCommand With Operation is Not Start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithOperationNotStart', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationNotStart();
        expect(ret[0]).assertEqual(TEEC_ERROR_NOT_IMPLEMENTED);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithOperationTypePartialUseTemp
     * @tc.number InvokeCommand_WithOperationTypePartialUseTemp
     * @tc.desc   call TEEC_InvokeCommand With ParamType is partial while operation is tmpref
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithOperationTypePartialUseTemp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationTypePartialUseTemp();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithOperationTypePartialSizeIsExceed
     * @tc.number InvokeCommand_WithOperationTypePartialSizeIsExceed
     * @tc.desc   call TEEC_InvokeCommand With ParamType is partial while memref offset+size > sharedMem.size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithOperationTypePartialSizeIsExceed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationTypePartialSizeIsExceed();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithOperationTypePartialSizeIsZero
     * @tc.number InvokeCommand_WithOperationTypePartialSizeIsZero
     * @tc.desc   call TEEC_InvokeCommand With ParamType is partial while memref.size = 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithOperationTypePartialSizeIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithOperationTypePartialSizeIsZero();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_COMMS);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithMemrefTempInoutExceed1024k
     * @tc.number InvokeCommand_WithMemrefTempInoutExceed1024k
     * @tc.desc   call TEEC_InvokeCommand With paramType is TEMP_INOUT and size is 1024k + 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithMemrefTempInoutExceed1024k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithMemrefTempInoutExceed1024k();
        expect(ret[0]).assertEqual(TEEC_ERROR_ACCESS_DENIED);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_COMMS);
        done();
      });
    /**
     * @tc.name   InvokeCommand_WithMemrefWholeExceed2048k
     * @tc.number InvokeCommand_WithMemrefWholeExceed2048k
     * @tc.desc   call TEEC_InvokeCommand With paramType is WHOLE and sharedMem.size is 2048k + 1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InvokeCommand_WithMemrefWholeExceed2048k', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.InvokeCommand_WithMemrefWholeExceed2048k();
        expect(ret[0]).assertEqual(TEEC_ERROR_OUT_OF_MEMORY);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_COMMS);
        done();
      });


  })
}