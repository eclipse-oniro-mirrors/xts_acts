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
import TEETEST from 'libclient_api_test2.so';
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


export default function ClientAPITest2() {
  describe('ClientAPITest2', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
      let ret: number = TEETEST.InitContext();
      console.info("in beforeAll:tee_test_client_api2-------------InitContext ret:" + ret.toString(16));
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
      TEETEST.CloseSession();
      TEETEST.ReleaseSharedMemory();
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
      TEETEST.FinalizeContext();
    })

    /**
     * @tc.name   Opensession_WithoutContext
     * @tc.number Opensession_WithoutContext
     * @tc.desc   call TEEC_OpenSession Without Context,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithoutContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.Opensession_WithoutContext();
      expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
      done();
    });

    /**
     * @tc.name   Opensession_WithoutSession
     * @tc.number Opensession_WithoutSession
     * @tc.desc   call TEEC_OpenSession Without session,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithoutSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.Opensession_WithoutSession();
      expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
      done();
    });
    /**
     * @tc.name   Opensession_WithoutDestination
     * @tc.number Opensession_WithoutDestination
     * @tc.desc   call TEEC_OpenSession Without Destination,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithoutDestination', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.Opensession_WithoutDestination();
      expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
      done();
    });
    /**
     * @tc.name   Opensession_WithoutConnectionMethod
     * @tc.number Opensession_WithoutConnectionMethod
     * @tc.desc   call TEEC_OpenSession Without ConnectionMethod,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithoutConnectionMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithoutConnectionMethod();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @tc.name   Opensession_WithNotSupportConnectionMethod
     * @tc.number Opensession_WithNotSupportConnectionMethod
     * @tc.desc   call TEEC_OpenSession With Not Support ConnectionMethod,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithNotSupportConnectionMethod', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithNotSupportConnectionMethod();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[2]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[3]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[4]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[5]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[6]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[7]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[8]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[9]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[10]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[11]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[12]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[13]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[14]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[15]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @tc.name   Opensession_ContextIsNotInit
     * @tc.number Opensession_ContextIsNotInit
     * @tc.desc   call TEEC_OpenSession With Context is Not Init,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_ContextIsNotInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_ContextIsNotInit();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        expect(ret[2]).assertEqual(TEEC_SUCCESS);
        done();
      });

    /**
     * @tc.name   Opensession_ParamValueIsInvalid
     * @tc.number Opensession_ParamValueIsInvalid
     * @tc.desc   call TEEC_OpenSession With Param value is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_ParamValueIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_ParamValueIsInvalid();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });

    /**
     * @tc.name   Opensession_WithoutOperation
     * @tc.number Opensession_WithoutOperation
     * @tc.desc   call TEEC_OpenSession Without Operation,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithoutOperation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.Opensession_WithoutOperation();
      expect(ret[0]).assertEqual(TEEC_SUCCESS);
      expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
      done();
    });

    /**
     * @tc.name   Opensession_WithoutOrigin
     * @tc.number Opensession_WithoutOrigin
     * @tc.desc   call TEEC_OpenSession Without Origin,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithoutOrigin', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = TEETEST.Opensession_WithoutOrigin();
      expect(ret).assertEqual(TEEC_SUCCESS);
      done();
    });

    /**
     * @tc.name   Opensession_WithOperationIsNone
     * @tc.number Opensession_WithOperationIsNone
     * @tc.desc   call TEEC_OpenSession With Operation is none
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithOperationIsNone', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithOperationIsNone();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        done();
      });
    /**
     * @tc.name   Opensession_WithOperationIsValue
     * @tc.number Opensession_WithOperationIsValue
     * @tc.desc   call TEEC_OpenSession With Operation paramtype is value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithOperationIsValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithOperationIsValue();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(0x111);
        expect(ret[3]).assertEqual(0x222);
        expect(ret[4]).assertEqual(0x333);
        expect(ret[5]).assertEqual(0x444);
        expect(ret[6]).assertEqual(0x555);
        expect(ret[7]).assertEqual(0x666);
        expect(ret[8]).assertEqual(0x777);
        expect(ret[9]).assertEqual(0x888);
        done();
      });
    /**
     * @tc.name   Opensession_WithOperationIsTempMem
     * @tc.number Opensession_WithOperationIsTempMem
     * @tc.desc   call TEEC_OpenSession With Operation paramtype is tempmem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithOperationIsTempMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithOperationIsTempMem();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        expect(ret[2]).assertEqual(5);
        expect(ret[3]).assertEqual(8);
        expect(ret[4]).assertEqual(10);
        expect(ret[5]).assertEqual(19);
        expect(ret[6]).assertEqual(TEEC_SUCCESS);
        expect(ret[7]).assertEqual("Hello");
        expect(ret[8]).assertEqual("qwertyuiop");
        expect(ret[9]).assertEqual("this is test string");
        done();
      });
    /**
     * @tc.name   Opensession_WithNotExistUUID
     * @tc.number Opensession_WithNotExistUUID
     * @tc.desc   call TEEC_OpenSession With uuid is not exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithNotExistUUID', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithNotExistUUID();
        expect(ret[0]).assertEqual(TEEC_ERROR_GENERIC);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_COMMS);
        done();
      });
    /**
     * @tc.name   Opensession_ReturnErrorFromTA
     * @tc.number Opensession_ReturnErrorFromTA
     * @tc.desc   call TEEC_OpenSession With TA return error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_ReturnErrorFromTA', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_ReturnErrorFromTA();
        expect(ret[0]).assertEqual(TEEC_ERROR_GENERIC);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_TRUSTED_APP);
        done();
      });
    /**
     * @tc.name   Opensession_WithParamTypesIsInvalid
     * @tc.number Opensession_WithParamTypesIsInvalid
     * @tc.desc   call TEEC_OpenSession With paramtype is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Opensession_WithParamTypesIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Opensession_WithParamTypesIsInvalid();
        expect(ret[0]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        expect(ret[1]).assertEqual(TEEC_ORIGIN_API);
        done();
      });
    /**
     * @tc.name   RequestCancellationTest
     * @tc.number RequestCancellationTest
     * @tc.desc   call TEEC_RequestCancellation after TEEC_InvokeCommand
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RequestCancellationTest', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RequestCancellationTest();
        expect(ret).assertEqual(TEEC_SUCCESS);
        done();
      });
    
    /**
     * @tc.name   Closesession_WithCreatedSession
     * @tc.number Closesession_WithCreatedSession
     * @tc.desc   call TEEC_CloseSession With created session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Closesession_WithCreatedSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Closesession_WithCreatedSession();
        expect(ret[0]).assertEqual(0);
        expect(ret[1]).assertEqual(0);
        done();
      });

    /**
     * @tc.name   Closesession_WithoutSession
     * @tc.number Closesession_WithoutSession
     * @tc.desc   call TEEC_CloseSession WithoutSession
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Closesession_WithoutSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Closesession_WithoutSession();
        expect(ret[0]).assertEqual(0);
        expect(ret[1]).assertEqual(0);
        expect(ret[2]).assertEqual(0);
        done();
      });
    /**
     * @tc.name   Closesession_WithNotOpenedSession
     * @tc.number Closesession_WithNotOpenedSession
     * @tc.desc   call TEEC_CloseSession with Not Opened Session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Closesession_WithNotOpenedSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Closesession_WithNotOpenedSession();
        expect(ret[0]).assertEqual(0);
        expect(ret[1]).assertEqual(0);
        expect(ret[2]).assertEqual(0);
        done();
      });

    /**
     * @tc.name   AllocateSharedMemory_WithAllocatedMem
     * @tc.number AllocateSharedMemory_WithAllocatedMem
     * @tc.desc   call TEEC_AllocateSharedMemory normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllocateSharedMemory_WithAllocatedMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithAllocatedMem();
        expect(ret).assertEqual(TEEC_SUCCESS);
        done();
      });
    /**
     * @tc.name   AllocateSharedMemory_WithoutContext
     * @tc.number AllocateSharedMemory_WithoutContext
     * @tc.desc   call TEEC_AllocateSharedMemory Without Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllocateSharedMemory_WithoutContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithoutContext();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @tc.name   AllocateSharedMemory_WithoutSharedMem
     * @tc.number AllocateSharedMemory_WithoutSharedMem
     * @tc.desc   call TEEC_AllocateSharedMemory Without SharedMem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllocateSharedMemory_WithoutSharedMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithoutSharedMem();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @tc.name   AllocateSharedMemory_WithSharedMemHasReleased
     * @tc.number AllocateSharedMemory_WithSharedMemHasReleased
     * @tc.desc   call TEEC_AllocateSharedMemory With SharedMem has Released
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllocateSharedMemory_WithSharedMemHasReleased', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithSharedMemHasReleased();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @tc.name   AllocateSharedMemory_WithSharedMemFlagIsZero
     * @tc.number AllocateSharedMemory_WithSharedMemFlagIsZero
     * @tc.desc   call TEEC_AllocateSharedMemory With SharedMem flag is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllocateSharedMemory_WithSharedMemFlagIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithSharedMemFlagIsZero();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @tc.name   AllocateSharedMemory_WithSharedMemFlagIsInvalid
     * @tc.number AllocateSharedMemory_WithSharedMemFlagIsInvalid
     * @tc.desc   call TEEC_AllocateSharedMemory With SharedMem flag is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllocateSharedMemory_WithSharedMemFlagIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithSharedMemFlagIsInvalid();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @tc.name   AllocateSharedMemory_WithSizeExceed
     * @tc.number AllocateSharedMemory_WithSizeExceed
     * @tc.desc   call TEEC_AllocateSharedMemory With SharedMem size exceed 4M
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllocateSharedMemory_WithSizeExceed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.AllocateSharedMemory_WithSizeExceed();
        expect(ret).assertEqual(TEEC_ERROR_OUT_OF_MEMORY);
        done();
      });

    /**
     * @tc.name   AllocateSharedMemory_ReachSharememNumLimit
     * @tc.number AllocateSharedMemory_ReachSharememNumLimit
     * @tc.desc   call TEEC_AllocateSharedMemory With same Context 65 times,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('AllocateSharedMemory_ReachSharememNumLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.AllocateSharedMemory_ReachSharememNumLimit();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @tc.name   RegisterSharedMemory_WithRegisterMem
     * @tc.number RegisterSharedMemory_WithRegisterMem
     * @tc.desc   call TEEC_RegisterSharedMemory With RegisterMem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegisterSharedMemory_WithRegisterMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithRegisterMem();
        expect(ret).assertEqual(TEEC_SUCCESS);
        done();
      });

    /**
     * @tc.name   RegisterSharedMemory_WithoutContext
     * @tc.number RegisterSharedMemory_WithoutContext
     * @tc.desc   call TEEC_RegisterSharedMemory Without Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegisterSharedMemory_WithoutContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithoutContext();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @tc.name   RegisterSharedMemory_WithoutSharedMem
     * @tc.number RegisterSharedMemory_WithoutSharedMem
     * @tc.desc   call TEEC_RegisterSharedMemory Without SharedMem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegisterSharedMemory_WithoutSharedMem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithoutSharedMem();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

    /**
     * @tc.name   RegisterSharedMemory_WithSharedMemFlagIsZero
     * @tc.number RegisterSharedMemory_WithSharedMemFlagIsZero
     * @tc.desc   call TEEC_RegisterSharedMemory With SharedMem flag is 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegisterSharedMemory_WithSharedMemFlagIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithSharedMemFlagIsZero();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });
    /**
     * @tc.name   RegisterSharedMemory_WithSharedMemFlagIsInvalid
     * @tc.number RegisterSharedMemory_WithSharedMemFlagIsInvalid
     * @tc.desc   call TEEC_RegisterSharedMemory With SharedMem flag is invalid
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegisterSharedMemory_WithSharedMemFlagIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithSharedMemFlagIsInvalid();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });
    /**
     * @tc.name   RegisterSharedMemory_WithSharedMemBufferIsNull
     * @tc.number RegisterSharedMemory_WithSharedMemBufferIsNull
     * @tc.desc   call TEEC_RegisterSharedMemory With SharedMem buffer is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('RegisterSharedMemory_WithSharedMemBufferIsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.RegisterSharedMemory_WithSharedMemBufferIsNull();
        expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
        done();
      });

  })
}