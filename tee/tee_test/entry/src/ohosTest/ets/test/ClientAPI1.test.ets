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
import TEETEST from 'libclient_api_test1.so';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'


const TEEC_SUCCESS = 0x0;
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


export default function ClientAPITest1() {
  describe('ClientAPITest1', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
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
    })

    /**
     * @tc.name   InitContext_NameIsNotNULL
     * @tc.number InitContext_NameIsNotNULL
     * @tc.desc   call TEEC_InitializeContext normal test
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InitContext_NameIsNotNULL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = TEETEST.InitContext_NameIsNotNULL();
      expect(ret).assertEqual(TEEC_SUCCESS);
      done();
    });

    /**
     * @tc.name   InitContext_ContextIsNULL
     * @tc.number InitContext_ContextIsNULL
     * @tc.desc   call TEEC_InitializeContext with context is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InitContext_ContextIsNULL', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: number = TEETEST.InitContext_ContextIsNULL();
      expect(ret).assertEqual(TEEC_ERROR_BAD_PARAMETERS);
      done();
    });

    /**
     * @tc.name   InitContext_AfterFinalizeContext
     * @tc.number InitContext_AfterFinalizeContext
     * @tc.desc   call TEEC_InitializeContext after Finalize Context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InitContext_AfterFinalizeContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.InitContext_AfterFinalizeContext();
        expect(ret).assertEqual(TEEC_SUCCESS);
        done();
      });

    /**
     * @tc.name   InitContext_Use17Context
     * @tc.number InitContext_Use17Context
     * @tc.desc   one CA call TEEC_InitializeContext use 17 different Context,
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('InitContext_Use17Context', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let ret: Array<number> = TEETEST.InitContext_Use17Context();
      expect(ret[0]).assertEqual(TEEC_SUCCESS);
      expect(ret[1]).assertEqual(TEEC_FAIL);
      done();
    });

    /**
     * @tc.name   Finalizecontext_WithCreatedContext
     * @tc.number Finalizecontext_WithCreatedContext
     * @tc.desc   call TEEC_FinalizeContext With created context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Finalizecontext_WithCreatedContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Finalizecontext_WithCreatedContext();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(-1);
        done();
      });

    /**
     * @tc.name   Finalizecontext_WithNotCreatedContext
     * @tc.number Finalizecontext_WithNotCreatedContext
     * @tc.desc   call TEEC_FinalizeContext With not created context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Finalizecontext_WithNotCreatedContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: number = TEETEST.Finalizecontext_WithNotCreatedContext();
        expect(ret).assertEqual(-1);
        done();
      });

    /**
     * @tc.name   Finalizecontext_WithoutContext
     * @tc.number Finalizecontext_WithoutContext
     * @tc.desc   call TEEC_FinalizeContext Without context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Finalizecontext_WithoutContext', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        let ret: Array<number> = TEETEST.Finalizecontext_WithoutContext();
        expect(ret[0]).assertEqual(TEEC_SUCCESS);
        expect(ret[1]).assertEqual(TEEC_SUCCESS);
        done();
      });
  })
}