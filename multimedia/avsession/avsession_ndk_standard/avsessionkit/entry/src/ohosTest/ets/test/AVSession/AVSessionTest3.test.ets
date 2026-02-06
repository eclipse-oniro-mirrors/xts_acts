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

export default function AVSessionTest3() {
  describe('AVSessionTest3', () => {

    /**
     * @tc.name   testOHAVCastControllerDestroy002
     * @tc.number SUB_OHAVCastController_Destroy_002
     * @tc.desc   testing OH_AVCastController_Destroy interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerDestroy002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerDestroyInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerDestroy002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerGetPlaybackState002
     * @tc.number SUB_OHAVCastController_GetPlaybackState_002
     * @tc.desc   testing OH_AVCastController_GetPlaybackState interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerGetPlaybackState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerGetPlaybackStateInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerGetPlaybackState002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerRegisterPlaybackStateChangedCallback002
     * @tc.number SUB_OHAVCastController_RegisterPlaybackStateChangedCallback_002
     * @tc.desc   testing OH_AVCastController_RegisterPlaybackStateChangedCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerRegisterPlaybackStateChangedCallback002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerRegisterPlaybackStateChangedCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerRegisterPlaybackStateChangedCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerUnregisterPlaybackStateChangedCallback002
     * @tc.number SUB_OHAVCastController_UnregisterPlaybackStateChangedCallback_002
     * @tc.desc   testing OH_AVCastController_UnregisterPlaybackStateChangedCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerUnregisterPlaybackStateChangedCallback002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerRegisterPlaybackStateChangedCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerUnregisterPlaybackStateChangedCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerRegisterMediaItemChangedCallback002
     * @tc.number SUB_OHAVCastController_RegisterMediaItemChangedCallback_002
     * @tc.desc   testing OH_AVCastController_RegisterMediaItemChangedCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerRegisterMediaItemChangedCallback002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerRegisterMediaItemChangedCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerRegisterMediaItemChangedCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerUnregisterMediaItemChangedCallback002
     * @tc.number SUB_OHAVCastController_UnregisterMediaItemChangedCallback_002
     * @tc.desc   testing OH_AVCastController_UnregisterMediaItemChangedCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerUnregisterMediaItemChangedCallback002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerUnregisterMediaItemChangedCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerUnregisterMediaItemChangedCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerRegisterPlayNextCallback002
     * @tc.number SUB_OHAVCastController_RegisterPlayNextCallback_002
     * @tc.desc   testing OH_AVCastController_RegisterPlayNextCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerRegisterPlayNextCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerRegisterPlayNextCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerRegisterPlayNextCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerUnregisterPlayNextCallback002
     * @tc.number SUB_OHAVCastController_UnregisterPlayNextCallback_002
     * @tc.desc   testing OH_AVCastController_UnregisterPlayNextCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerUnregisterPlayNextCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerUnregisterPlayNextCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerUnregisterPlayNextCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerRegisterPlayPreviousCallback002
     * @tc.number SUB_OHAVCastController_RegisterPlayPreviousCallback_002
     * @tc.desc   testing OH_AVCastController_RegisterPlayPreviousCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerRegisterPlayPreviousCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerRegisterPlayPreviousCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerRegisterPlayPreviousCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerUnregisterPlayPreviousCallback002
     * @tc.number SUB_OHAVCastController_UnregisterPlayPreviousCallback_002
     * @tc.desc   testing OH_AVCastController_UnregisterPlayPreviousCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerUnregisterPlayPreviousCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerUnregisterPlayPreviousCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerUnregisterPlayPreviousCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerRegisterSeekDoneCallback002
     * @tc.number SUB_OHAVCastController_RegisterSeekDoneCallback_002
     * @tc.desc   testing OH_AVCastController_RegisterSeekDoneCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerRegisterSeekDoneCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerRegisterSeekDoneCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerRegisterSeekDoneCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerUnregisterSeekDoneCallback002
     * @tc.number SUB_OHAVCastController_UnregisterSeekDoneCallback_002
     * @tc.desc   testing OH_AVCastController_UnregisterSeekDoneCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerUnregisterSeekDoneCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerUnregisterSeekDoneCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerUnregisterSeekDoneCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerRegisterEndOfStreamCallback002
     * @tc.number SUB_OHAVCastController_RegisterEndOfStreamCallback_002
     * @tc.desc   testing OH_AVCastController_RegisterEndOfStreamCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerRegisterEndOfStreamCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerRegisterEndOfStreamCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerRegisterEndOfStreamCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerUnregisterEndOfStreamCallback002
     * @tc.number SUB_OHAVCastController_UnregisterEndOfStreamCallback_002
     * @tc.desc   testing OH_AVCastController_UnregisterEndOfStreamCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerUnregisterEndOfStreamCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerUnregisterEndOfStreamCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerUnregisterEndOfStreamCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerRegisterErrorCallback002
     * @tc.number SUB_OHAVCastController_RegisterErrorCallback_002
     * @tc.desc   testing OH_AVCastController_RegisterErrorCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerRegisterErrorCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerRegisterErrorCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerRegisterErrorCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerUnregisterErrorCallback002
     * @tc.number SUB_OHAVCastController_UnregisterErrorCallback_002
     * @tc.desc   testing OH_AVCastController_UnregisterErrorCallback interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerUnregisterErrorCallback002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerUnregisterErrorCallbackInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerUnregisterErrorCallback002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerSendCommonCommand002
     * @tc.number SUB_OHAVCastController_SendCommonCommand_002
     * @tc.desc   testing OH_AVCastController_SendCommonCommand interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerSendCommonCommand002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerSendCommonCommandInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerSendCommonCommand002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerSendSeekCommand002
     * @tc.number SUB_OHAVCastController_SendSeekCommand_002
     * @tc.desc   testing OH_AVCastController_SendSeekCommand interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerSendSeekCommand002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerSendSeekCommandInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerSendSeekCommand002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerSendFastForwardCommand002
     * @tc.number SUB_OHAVCastController_SendFastForwardCommand_002
     * @tc.desc   testing OH_AVCastController_SendFastForwardCommand interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */ 
    it('testOHAVCastControllerSendFastForwardCommand002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerSendFastForwardCommandInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerSendFastForwardCommand002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerSendRewindCommand002
     * @tc.number SUB_OHAVCastController_SendRewindCommand_002
     * @tc.desc   testing OH_AVCastController_SendRewindCommand interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerSendRewindCommand002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerSendRewindCommandInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerSendRewindCommand002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerSendSetSpeedCommand002
     * @tc.number SUB_OHAVCastController_SendSetSpeedCommand_002
     * @tc.desc   testing OH_AVCastController_SendSetSpeedCommand interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerSendSetSpeedCommand002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerSendSetSpeedCommandInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerSendSetSpeedCommand002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerSendVolumeCommand002
     * @tc.number SUB_OHAVCastController_SendVolumeCommand_002
     * @tc.desc   testing OH_AVCastController_SendVolumeCommand interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerSendVolumeCommand002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerSendVolumeCommandInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerSendVolumeCommand002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerPrepare002
     * @tc.number SUB_OHAVCastController_Prepare_002
     * @tc.desc   testing OH_AVCastController_Prepare interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerPrepare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerPrepareInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerPrepare002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVCastControllerStart002
     * @tc.number SUB_OHAVCastController_Start_002
     * @tc.desc   testing OH_AVCastController_Start interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVCastControllerStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControllerStartInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVCastControllerStart002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVSessionGetPlaybackState002
     * @tc.number SUB_OHAVSession_GetPlaybackState_002
     * @tc.desc   testing OH_AVSession_GetPlaybackState interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVSessionGetPlaybackState002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionGetPlaybackStateInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVSessionGetPlaybackState002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVSessionGetPlaybackPosition002
     * @tc.number SUB_OHAVSession_GetPlaybackPosition_002
     * @tc.desc   testing OH_AVSession_GetPlaybackPosition interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVSessionGetPlaybackPosition002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionGetPlaybackPositionInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVSessionGetPlaybackPosition002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVSessionGetPlaybackSpeed002
     * @tc.number SUB_OHAVSession_GetPlaybackSpeed_002
     * @tc.desc   testing OH_AVSession_GetPlaybackSpeed interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVSessionGetPlaybackSpeed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionGetPlaybackSpeedInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVSessionGetPlaybackSpeed002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testOHAVSessionGetPlaybackVolume002
     * @tc.number SUB_OHAVSession_GetPlaybackVolume_002
     * @tc.desc   testing OH_AVSession_GetPlaybackVolume interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testOHAVSessionGetPlaybackVolume002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionGetPlaybackVolumeInvalidParam();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testOHAVSessionGetPlaybackVolume002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypePlay001
     * @tc.number SUB_AVCastControlCommandTypePlay_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_PLAY interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypePlay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypePlay();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypePlay001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypePause001
     * @tc.number SUB_AVCastControlCommandTypePause_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_PAUSE interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypePause001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypePause();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypePause001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypeStop001
     * @tc.number SUB_AVCastControlCommandTypeStop_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_STOP interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypeStop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypeStop();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypeStop001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypePlayNext001
     * @tc.number SUB_AVCastControlCommandTypePlayNext_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_PLAY_NEXT interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypePlayNext001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypePlayNext();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypePlayNext001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypePlayPrevious001
     * @tc.number SUB_AVCastControlCommandTypePlayPrevious_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_PLAY_PREVIOUS interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypePlayPrevious001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypePlayPrevious();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypePlayPrevious001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

     /**
     * @tc.name   testAVCastControlCommandTypeFastForward001
     * @tc.number SUB_AVCastControlCommandTypeFastForward_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_FAST_FORWARD interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypeFastForward001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypeFastForward();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypeFastForward001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypeRewind001
     * @tc.number SUB_AVCastControlCommandTypeRewind_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_REWIND interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypeRewind001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypeRewind();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypeRewind001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypeSeek001
     * @tc.number SUB_AVCastControlCommandTypeSeek_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_SEEK interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypeSeek001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypeSeek();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypeSeek001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypeSetVolume001
     * @tc.number SUB_AVCastControlCommandTypeSetVolume_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_SET_VOLUME interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypeSetVolume001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypeSetVolume();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypeSetVolume001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVCastControlCommandTypeSetSpeed001
     * @tc.number SUB_AVCastControlCommandTypeSetSpeed_001
     * @tc.desc   testing AVCastControlCommandType CAST_CONTROL_CMD_SET_SPEED interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVCastControlCommandTypeSetSpeed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVCastControlCommandTypeSetSpeed();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVCastControlCommandTypeSetSpeed001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionPlaybackSpeed001
     * @tc.number SUB_AVSessionPlaybackSpeed_001
     * @tc.desc   testing AVSession_PlaybackSpeed SPEED_FORWARD_0_75_X interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionPlaybackSpeed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionPlaybackSpeed0_75X();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackSpeed001 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionPlaybackSpeed002
     * @tc.number SUB_AVSessionPlaybackSpeed_002
     * @tc.desc   testing AVSession_PlaybackSpeed SPEED_FORWARD_1_00_X interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionPlaybackSpeed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionPlaybackSpeed1_00X();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackSpeed002 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionPlaybackSpeed003
     * @tc.number SUB_AVSessionPlaybackSpeed_003
     * @tc.desc   testing AVSession_PlaybackSpeed SPEED_FORWARD_1_25_X interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionPlaybackSpeed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionPlaybackSpeed1_25X();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackSpeed003 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionPlaybackSpeed004
     * @tc.number SUB_AVSessionPlaybackSpeed_004
     * @tc.desc   testing AVSession_PlaybackSpeed SPEED_FORWARD_1_75_X interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionPlaybackSpeed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionPlaybackSpeed1_75X();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackSpeed004 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionPlaybackSpeed005
     * @tc.number SUB_AVSessionPlaybackSpeed_005
     * @tc.desc   testing AVSession_PlaybackSpeed SPEED_FORWARD_2_00_X interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionPlaybackSpeed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionPlaybackSpeed2_00X();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackSpeed005 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionPlaybackSpeed006
     * @tc.number SUB_AVSessionPlaybackSpeed_006
     * @tc.desc   testing AVSession_PlaybackSpeed SPEED_FORWARD_0_50_X interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionPlaybackSpeed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionPlaybackSpeed0_50X();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackSpeed006 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });

    /**
     * @tc.name   testAVSessionPlaybackSpeed007
     * @tc.number SUB_AVSessionPlaybackSpeed_007
     * @tc.desc   testing AVSession_PlaybackSpeed SPEED_FORWARD_1_50_X interface.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testAVSessionPlaybackSpeed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          let result: number = libavsession.AVSessionPlaybackSpeed1_50X();
          expect(result).assertEqual(1);
          done()
        } catch (err) {
          console.error("====>testAVSessionPlaybackSpeed007 catch err: " + err);
          expect(false).assertEqual(OS_ACCOUNT_ERR_OK);
        }
      });
  })
}