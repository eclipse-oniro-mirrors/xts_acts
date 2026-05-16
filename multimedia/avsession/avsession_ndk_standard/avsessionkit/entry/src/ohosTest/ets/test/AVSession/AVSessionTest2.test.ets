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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import libavsession from 'libavsession.so'

const OS_ACCOUNT_ERR_OK = 0;

export default function AVSessionTest2() {
  describe('AVSessionTest2', () => {
    /**
     * @tc.name   testAVSessionRegisterForwardCallback001
     * @tc.number SUB_AVSession_RegisterForwardCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterForwardCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterForwardCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterForwardCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterForwardCallback002
     * @tc.number SUB_AVSession_RegisterForwardCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterForwardCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterForwardCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterForwardCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterForwardCallback001
     * @tc.number SUB_AVSession_UnregisterForwardCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterForwardCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterForwardCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterForwardCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterForwardCallback002
     * @tc.number SUB_AVSession_UnregisterForwardCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterForwardCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterForwardCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterForwardCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
    /**
     * @tc.name   testAVSessionRegisterRewindCallback001
     * @tc.number SUB_AVSession_RegisterRewindCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterRewindCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterRewindCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterRewindCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterRewindCallback002
     * @tc.number SUB_AVSession_RegisterRewindCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterRewindCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterRewindCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterRewindCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterRewindCallback001
     * @tc.number SUB_AVSession_UnregisterRewindCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterRewindCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterRewindCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterRewindCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterRewindCallback002
     * @tc.number SUB_AVSession_UnregisterRewindCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterRewindCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterRewindCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterRewindCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterSeekCallback001
     * @tc.number SUB_AVSession_RegisterSeekCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterSeekCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterSeekCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterSeekCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterSeekCallback002
     * @tc.number SUB_AVSession_RegisterSeekCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterSeekCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterSeekCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterSeekCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterSeekCallback001
     * @tc.number SUB_AVSession_UnregisterSeekCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterSeekCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterSeekCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterSeekCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterSeekCallback002
     * @tc.number SUB_AVSession_UnregisterSeekCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterSeekCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterSeekCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterSeekCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterSetLoopModeCallback001
     * @tc.number SUB_AVSession_RegisterSetLoopModeCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterSetLoopModeCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterSetLoopModeCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterSetLoopModeCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterSetLoopModeCallback002
     * @tc.number SUB_AVSession_RegisterSetLoopModeCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterSetLoopModeCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterSetLoopModeCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterSetLoopModeCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterSetLoopModeCallback001
     * @tc.number SUB_AVSession_UnregisterSetLoopModeCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterSetLoopModeCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterSetLoopModeCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterSetLoopModeCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterSetLoopModeCallback002
     * @tc.number SUB_AVSession_UnregisterSetLoopModeCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterSetLoopModeCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterSetLoopModeCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterSetLoopModeCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterToggleFavoriteCallback001
     * @tc.number SUB_AVSession_RegisterToggleFavoriteCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterToggleFavoriteCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterToggleFavoriteCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterToggleFavoriteCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterToggleFavoriteCallback002
     * @tc.number SUB_AVSession_RegisterToggleFavoriteCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionRegisterToggleFavoriteCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterToggleFavoriteCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterToggleFavoriteCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterToggleFavoriteCallback001
     * @tc.number SUB_AVSession_UnregisterToggleFavoriteCallback_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterToggleFavoriteCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterToggleFavoriteCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterToggleFavoriteCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterToggleFavoriteCallback002
     * @tc.number SUB_AVSession_UnregisterToggleFavoriteCallback_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionUnregisterToggleFavoriteCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterToggleFavoriteCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterToggleFavoriteCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionErrorCode001
     * @tc.number SUB_AVSession_ErrorCode_001
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionErrorCode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionErrInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionErrorCode001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionErrorCode002
     * @tc.number SUB_AVSession_ErrorCode_002
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionErrorCode002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionErrServiceException();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionErrorCode002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionErrorCode003
     * @tc.number SUB_AVSession_ErrorCode_003
     * @tc.desc   testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionErrorCode003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionErrCodeCommandInvalid();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionErrorCode003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterOutputDeviceChangeCallback001
     * @tc.number SUB_AVSession_RegisterOutputDeviceChangeCallback_001
     * @tc.desc   testing OH_AVSession_RegisterOutputDeviceChangeCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it('testAVSessionRegisterOutputDeviceChangeCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterOutputDeviceChangeCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterOutputDeviceChangeCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionRegisterOutputDeviceChangeCallback002
     * @tc.number SUB_AVSession_RegisterOutputDeviceChangeCallback_002
     * @tc.desc   testing OH_AVSession_RegisterOutputDeviceChangeCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it('testAVSessionRegisterOutputDeviceChangeCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionRegisterOutputDeviceChangeCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionRegisterOutputDeviceChangeCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterOutputDeviceChangeCallback001
     * @tc.number SUB_AVSession_UnregisterOutputDeviceChangeCallback_001
     * @tc.desc   testing OH_AVSession_UnregisterOutputDeviceChangeCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it('testAVSessionUnregisterOutputDeviceChangeCallback001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterOutputDeviceChangeCallbackSuccess();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterOutputDeviceChangeCallback001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionUnregisterOutputDeviceChangeCallback002
     * @tc.number SUB_AVSession_UnregisterOutputDeviceChangeCallback_002
     * @tc.desc   testing OH_AVSession_UnregisterOutputDeviceChangeCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
     it('testAVSessionUnregisterOutputDeviceChangeCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionUnregisterOutputDeviceChangeCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionUnregisterOutputDeviceChangeCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSession_TypeSESSION_TYPE_PHOTO001
     * @tc.number SUB_AVSession_Type_SESSION_TYPE_PHOTO_001
     * @tc.desc   testing SESSION_TYPE_PHOTO.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSession_TypeSESSION_TYPE_PHOTO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_TypeSESSION_TYPE_PHOTO();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSession_TypeSESSION_TYPE_PHOTO001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionConnectionStateSTATE_CONNECTING001
     * @tc.number SUB_AVSession_ConnectionState_STATE_CONNECTING_001
     * @tc.desc   testing STATE_CONNECTING.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionConnectionStateSTATE_CONNECTING001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionConnectionStateSTATE_CONNECTING();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionConnectionStateSTATE_CONNECTING001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionConnectionStateSTATE_CONNECTED001
     * @tc.number SUB_AVSession_ConnectionState_STATE_CONNECTED_001
     * @tc.desc   testing STATE_CONNECTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionConnectionStateSTATE_CONNECTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionConnectionStateSTATE_CONNECTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionConnectionStateSTATE_CONNECTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionConnectionStateSTATE_DISCONNECTED001
     * @tc.number SUB_AVSession_ConnectionState_STATE_DISCONNECTED_001
     * @tc.desc   testing STATE_DISCONNECTED.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionConnectionStateSTATE_DISCONNECTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionConnectionStateSTATE_DISCONNECTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionConnectionStateSTATE_DISCONNECTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionAVCastCategoryCATEGORY_LOCAL001
     * @tc.number SUB_AVSession_AVCastCategory_CATEGORY_LOCAL_001
     * @tc.desc   testing CATEGORY_LOCAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionAVCastCategoryCATEGORY_LOCAL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionAVCastCategoryCATEGORY_LOCAL();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVCastCategoryCATEGORY_LOCAL001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionAVCastCategoryCATEGORY_REMOTE001
     * @tc.number SUB_AVSession_AVCastCategory_CATEGORY_REMOTE_001
     * @tc.desc   testing CATEGORY_REMOTE.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionAVCastCategoryCATEGORY_REMOTE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionAVCastCategoryCATEGORY_REMOTE();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionAVCastCategoryCATEGORY_REMOTE001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionDeviceTypeDEVICE_TYPE_LOCAL001
     * @tc.number SUB_AVSession_DeviceType_DEVICE_TYPE_LOCAL_001
     * @tc.desc   testing DEVICE_TYPE_LOCAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionDeviceTypeDEVICE_TYPE_LOCAL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionDeviceTypeDEVICE_TYPE_LOCAL();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionDeviceTypeDEVICE_TYPE_LOCAL001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionDeviceTypeDEVICE_TYPE_TV001
     * @tc.number SUB_AVSession_DeviceType_DEVICE_TYPE_TV_001
     * @tc.desc   testing DEVICE_TYPE_TV.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionDeviceTypeDEVICE_TYPE_TV001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionDeviceTypeDEVICE_TYPE_TV();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionDeviceTypeDEVICE_TYPE_TV001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionDeviceTypeDEVICE_TYPE_SMART_SPEAKER001
     * @tc.number SUB_AVSession_DeviceType_DEVICE_TYPE_SMART_SPEAKER_001
     * @tc.desc   testing DEVICE_TYPE_SMART_SPEAKER.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionDeviceTypeDEVICE_TYPE_SMART_SPEAKER001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionDeviceTypeDEVICE_TYPE_SMART_SPEAKER();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionDeviceTypeDEVICE_TYPE_SMART_SPEAKER001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionDeviceTypeDEVICE_TYPE_BLUETOOTH001
     * @tc.number SUB_AVSession_DeviceType_DEVICE_TYPE_BLUETOOTH_001
     * @tc.desc   testing DEVICE_TYPE_BLUETOOTH.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionDeviceTypeDEVICE_TYPE_BLUETOOTH001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionDeviceTypeDEVICE_TYPE_BLUETOOTH();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionDeviceTypeDEVICE_TYPE_BLUETOOTH001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
    /**
     * @tc.name   testAVSessionProtocolTypeTYPE_LOCAL001
     * @tc.number SUB_AVSession_ProtocolType_TYPE_LOCAL_001
     * @tc.desc   testing TYPE_LOCAL.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionProtocolTypeTYPE_LOCAL001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionProtocolTypeTYPE_LOCAL();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionProtocolTypeTYPE_LOCAL001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAVSessionProtocolTypeTYPE_CAST_PLUS_STREAM001
      * @tc.number SUB_AVSession_ProtocolType_TYPE_CAST_PLUS_STREAM_001
      * @tc.desc   testing TYPE_CAST_PLUS_STREAM.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAVSessionProtocolTypeTYPE_CAST_PLUS_STREAM001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionProtocolTypeTYPE_CAST_PLUS_STREAM();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionProtocolTypeTYPE_CAST_PLUS_STREAM001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAVSessionProtocolTypeTYPE_DLNA001
      * @tc.number SUB_AVSession_ProtocolType_TYPE_DLNA_001
      * @tc.desc   testing TYPE_DLNA.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAVSessionProtocolTypeTYPE_DLNA001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionProtocolTypeTYPE_DLNA();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionProtocolTypeTYPE_DLNA001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAVSessionProtocolTypeTYPE_CAST_PLUS_AUDIO001
      * @tc.number SUB_AVSession_ProtocolType_TYPE_CAST_PLUS_AUDIO_001
      * @tc.desc   testing TYPE_CAST_PLUS_AUDIO.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAVSessionProtocolTypeTYPE_CAST_PLUS_AUDIO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionProtocolTypeTYPE_CAST_PLUS_AUDIO();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionProtocolTypeTYPE_CAST_PLUS_AUDIO001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST001
      * @tc.number SUB_AV_SESSION_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_REMOTE_CONNECTION_NOT_EXIST001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_UNSPECIFIED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_UNSPECIFIED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_REMOTE_ERROR();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_REMOTE_ERROR001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_BEHIND_LIVE_WINDOW001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_TIMEOUT001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_TIMEOUT_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_TIMEOUT.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_TIMEOUT001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_TIMEOUT();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_TIMEOUT001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_RUNTIME_CHECK_FAILED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAYER_NOT_WORKING001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_SEEK_MODE_UNSUPPORTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_ILLEGAL_SEEK_TARGET001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_MODE_UNSUPPORTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_PLAY_SPEED_UNSUPPORTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_DEVICE_MISSING();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_DEVICE_MISSING001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_INVALID_PARAM();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_INVALID_PARAM001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_NO_MEMORY();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_NO_MEMORY001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_OPERATION_NOT_ALLOWED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_UNSPECIFIED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_FAILED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_CONNECTION_TIMEOUT001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_INVALID_HTTP_CONTENT_TYPE001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_BAD_HTTP_STATUS001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_FILE_NOT_FOUND001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_PERMISSION001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CLEARTEXT_NOT_PERMITTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_POSITION_OUT_OF_RANGE001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NO_CONTENTS001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_READ_ERROR();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_READ_ERROR001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_BUSY001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_CONTENT_EXPIRED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_USE_FORBIDDEN001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NOT_VERIFIED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_EXHAUSTED_ALLOWED_USES001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_IO_NETWORK_PACKET_SENDING_FAILED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_UNSPECIFIED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_MALFORMED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_MALFORMED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_CONTAINER_UNSUPPORTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_PARSING_MANIFEST_UNSUPPORTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_UNSPECIFIED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_INIT_FAILED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_QUERY_FAILED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_DECODING_FAILED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FAILED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_EXCEEDS_CAPABILITIES001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_DECODING_FORMAT_UNSUPPORTED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_UNSPECIFIED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_INIT_FAILED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED001
      * @tc.number SUB_AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED_001
      * @tc.desc   testing AV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
    it('testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSession_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAV_SESSION_ERR_CODE_CAST_CONTROL_AUDIO_RENDERER_WRITE_FAILED001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
      * @tc.name   testAV_SESSION_AVQUEUEITEM_ERR_NO_MEMORY001
      * @tc.number SUB_AVQUEUEITEM_ERROR_NO_MEMORY_001
      * @tc.desc   testing AVQUEUEITEM_ERROR_NO_MEMORY.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
      it('testAV_SESSION_AVQUEUEITEM_ERR_NO_MEMORY001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
        async (done: Function) => {
          try {
            let result: number = libavsession.AVSession_AVQUEUEITEM_ERROR_NO_MEMORY();
            expect(result).assertEqual(1);
            done()
          } catch (err) {
            console.error("====>testAV_SESSION_AVQUEUEITEM_ERR_NO_MEMORY001 catch err: " + err);
            expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
          }
        });
  })
}