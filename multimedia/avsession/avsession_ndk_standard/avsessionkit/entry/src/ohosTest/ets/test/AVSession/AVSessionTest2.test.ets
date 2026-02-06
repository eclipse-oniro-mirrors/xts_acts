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
     * @tc.number   SUB_AVSession_RegisterForwardCallback_001
     * @tc.name     testAVSessionRegisterForwardCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterForwardCallback_002
     * @tc.name     testAVSessionRegisterForwardCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterForwardCallback_001
     * @tc.name     testAVSessionUnregisterForwardCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterForwardCallback_002
     * @tc.name     testAVSessionUnregisterForwardCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterRewindCallback_001
     * @tc.name     testAVSessionRegisterRewindCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterRewindCallback_002
     * @tc.name     testAVSessionRegisterRewindCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterRewindCallback_001
     * @tc.name     testAVSessionUnregisterRewindCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterRewindCallback_002
     * @tc.name     testAVSessionUnregisterRewindCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterSeekCallback_001
     * @tc.name     testAVSessionRegisterSeekCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterSeekCallback_002
     * @tc.name     testAVSessionRegisterSeekCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterSeekCallback_001
     * @tc.name     testAVSessionUnregisterSeekCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterSeekCallback_002
     * @tc.name     testAVSessionUnregisterSeekCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterSetLoopModeCallback_001
     * @tc.name     testAVSessionRegisterSetLoopModeCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterSetLoopModeCallback_002
     * @tc.name     testAVSessionRegisterSetLoopModeCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterSetLoopModeCallback_001
     * @tc.name     testAVSessionUnregisterSetLoopModeCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterSetLoopModeCallback_002
     * @tc.name     testAVSessionUnregisterSetLoopModeCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterToggleFavoriteCallback_001
     * @tc.name     testAVSessionRegisterToggleFavoriteCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_RegisterToggleFavoriteCallback_002
     * @tc.name     testAVSessionRegisterToggleFavoriteCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterToggleFavoriteCallback_001
     * @tc.name     testAVSessionUnregisterToggleFavoriteCallback001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_UnregisterToggleFavoriteCallback_002
     * @tc.name     testAVSessionUnregisterToggleFavoriteCallback002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_ErrorCode_001
     * @tc.name     testAVSessionErrorCode001
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_ErrorCode_002
     * @tc.name     testAVSessionErrorCode002
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
     * @tc.number   SUB_AVSession_ErrorCode_003
     * @tc.name     testAVSessionErrorCode003
     * @tc.desc     testing OH_ArkUI_CustomSpanMetrics_SetWidth interface.
     * @tc.level    Level1
     * @tc.size     MediumTest
     * @tc.type     Function
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
  })
}
