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
import testNapi from 'libentry.so'

export default function ActsInputmethodTest() {
  describe('ActsInputmethodTest', () => {
    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_AttachOptions_IsShowKeyboard_0100
     * @tc.number SUB_InputMethod_Imf_SDK_OH_AttachOptions_IsShowKeyboard_0100
     * @tc.desc   test OH_AttachOptions_IsShowKeyboard Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_AttachOptions_IsShowKeyboard_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_AttachOptions_IsShowKeyboard_0100 start====");
          let result: number = testNapi.testOhAttachOptionsIsShowKeyboardNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_AttachOptions_IsShowKeyboard_0100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_AttachOptions_IsShowKeyboard_0100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_AttachOptions_GetRequestKeyboardReason_0200
     * @tc.number SUB_InputMethod_Imf_SDK_OH_AttachOptions_GetRequestKeyboardReason_0200
     * @tc.desc   test OH_AttachOptions_GetRequestKeyboardReason Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_AttachOptions_GetRequestKeyboardReason_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_AttachOptions_GetRequestKeyboardReason_0200 start====");
          let result: number = testNapi.testOhAttachOptionsGetRequestKeyboardReasonNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_AttachOptions_GetRequestKeyboardReason_0200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_AttachOptions_GetRequestKeyboardReason_0200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodController_Attach_0300
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodController_Attach_0300
     * @tc.desc   test OH_InputMethodController_Attach Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodController_Attach_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodController_Attach_0300 start====");
          let result: number = testNapi.testOhInputMethodControllerAttachNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodController_Attach_0300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodController_Attach_0300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodController_Detach_0400
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodController_Detach_0400
     * @tc.desc   test OH_InputMethodController_Detach Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodController_Detach_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodController_Detach_0400 start====");
          let result: number = testNapi.testOhInputMethodControllerDetachNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodController_Detach_0400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodController_Detach_0400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0500
     * @tc.number SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0500
     * @tc.desc   test OH_CursorInfo_SetRect Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0500 start====");
          let result: number = testNapi.testOhCursorInfoSetRectNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0600
     * @tc.number SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0600
     * @tc.desc   test OH_CursorInfo_SetRect Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0600 start====");
          let result: number = testNapi.testOhCursorInfoSetRectOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_SetRect_0600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0700
     * @tc.number SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0700
     * @tc.desc   test OH_CursorInfo_GetRect Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0700 start====");
          let result: number = testNapi.testOhCursorInfoGetRectNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0800
     * @tc.number SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0800
     * @tc.desc   test OH_CursorInfo_GetRect Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0800 start====");
          let result: number = testNapi.testOhCursorInfoGetRectOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_CursorInfo_GetRect_0800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_0900
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_0900
     * @tc.desc   test OH_InputMethodProxy_ShowKeyboard Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_0900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_0900 start====");
          let result: number = testNapi.testOhInputMethodProxyShowKeyboardNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_0900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_0900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_1000
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_1000
     * @tc.desc   test OH_InputMethodProxy_ShowKeyboard Detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_1000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_1000 start====");
          let result: number = testNapi.testOhInputMethodProxyShowKeyboardDetached();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_1000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowKeyboard_1000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1100
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1100
     * @tc.desc   test OH_InputMethodProxy_ShowTextInput Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1100 start====");
          let result: number = testNapi.testOhInputMethodProxyShowTextInputNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1200
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1200
     * @tc.desc   test OH_InputMethodProxy_ShowTextInput Detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1200 start====");
          let result: number = testNapi.testOhInputMethodProxyShowTextInputDetached();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_ShowTextInput_1200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1300
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1300
     * @tc.desc   test OH_InputMethodProxy_HideKeyboard Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1300 start====");
          let result: number = testNapi.testOhInputMethodProxyHideKeyboardNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1400
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1400
     * @tc.desc   test OH_InputMethodProxy_HideKeyboard Detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1400 start====");
          let result: number = testNapi.testOhInputMethodProxyHideKeyboardDetached();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_HideKeyboard_1400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1500
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1500
     * @tc.desc   test OH_InputMethodProxy_NotifySelectionChange Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1500 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifySelectionChangeNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1600
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1600
     * @tc.desc   test OH_InputMethodProxy_NotifySelectionChange Detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1600 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifySelectionChangeDetached();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1700
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1700
     * @tc.desc   test OH_InputMethodProxy_NotifySelectionChange PARAMCHECK Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1700 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifySelectionChangeParamCheckError();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifySelectionChange_1700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1800
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1800
     * @tc.desc   test OH_InputMethodProxy_NotifyConfigurationChange Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1800 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifyConfigurationChangeNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1900
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1900
     * @tc.desc   test OH_InputMethodProxy_NotifyConfigurationChange Detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1900 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifyConfigurationChangeDetached();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_2000
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_2000
     * @tc.desc   test OH_InputMethodProxy_NotifyConfigurationChange PARAMCHECK Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_2000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_2000 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifyConfigurationChangeParamCheckError();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_1900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyConfigurationChange_2000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2100
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2100
     * @tc.desc   test OH_InputMethodProxy_NotifyCursorUpdate Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2100 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifyCursorUpdateNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2200
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2200
     * @tc.desc   test OH_InputMethodProxy_NotifyCursorUpdate Detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2200 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifyCursorUpdateDetached();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2300
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2300
     * @tc.desc   test OH_InputMethodProxy_NotifyCursorUpdate PARAMCHECK Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2300 start====");
          let result: number = testNapi.testOhInputMethodProxyNotifyCursorUpdateParamCheckError();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_NotifyCursorUpdate_2300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2400
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2400
     * @tc.desc   test OH_InputMethodProxy_SendPrivateCommand Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2400 start====");
          let result: number = testNapi.testOhInputMethodProxySendPrivateCommandNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2500
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2500
     * @tc.desc   test OH_InputMethodProxy_SendPrivateCommand Detached
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2500 start====");
          let result: number = testNapi.testOhInputMethodProxySendPrivateCommandDetached();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2600
     * @tc.number SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2600
     * @tc.desc   test OH_InputMethodProxy_SendPrivateCommand PARAMCHECK Error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2600 start====");
          let result: number = testNapi.testOhInputMethodProxySendPrivateCommandParamCheckError();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_InputMethodProxy_SendPrivateCommand_2600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2700
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2700
     * @tc.desc   test OH_PrivateCommand_SetKey Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2700 start====");
          let result: number = testNapi.testOhPrivateCommandSetKeyNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2800
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2800
     * @tc.desc   test OH_PrivateCommand_SetKey OK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2800 start====");
          let result: number = testNapi.testOhPrivateCommandSetKeyOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetKey_2800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetBoolValue_2900
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetBoolValue_2900
     * @tc.desc   test OH_PrivateCommand_SetBoolValue Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetBoolValue_2900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetBoolValue_2900 start====");
          let result: number = testNapi.testOhPrivateCommandSetBoolValueNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetBoolValue_2900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetBoolValue_2900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetIntValue_3000
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetIntValue_3000
     * @tc.desc   test OH_PrivateCommand_SetIntValue Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetIntValue_3000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetIntValue_3000 start====");
          let result: number = testNapi.testOhPrivateCommandSetIntValueNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetIntValue_3000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetIntValue_3000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetStrValue_3100
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetStrValue_3100
     * @tc.desc   test OH_PrivateCommand_SetStrValue Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetStrValue_3100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetStrValue_3100 start====");
          let result: number = testNapi.testOhPrivateCommandSetStrValueNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetStrValue_3100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_SetStrValue_3100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3200
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3200
     * @tc.desc   test OH_PrivateCommand_GetKey Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3200 start====");
          let result: number = testNapi.testOhPrivateCommandGetKeyNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3300
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3300
     * @tc.desc   test OH_PrivateCommand_GetKey Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3300 start====");
          let result: number = testNapi.testOhPrivateCommandGetKeyOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetKey_3300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3400
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3400
     * @tc.desc   test OH_PrivateCommand_GetValueType Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3400 start====");
          let result: number = testNapi.testOHPrivateCommandGetValueTypeNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3500
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3500
     * @tc.desc   test OH_PrivateCommand_GetValueType Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3500 start====");
          let result: number = testNapi.testOHPrivateCommandGetValueTypeOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetValueType_3500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3600
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3600
     * @tc.desc   test OH_PrivateCommand_GetBoolValue Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3600 start====");
          let result: number = testNapi.testOhPrivateCommandGetBoolValueNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3700
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3700
     * @tc.desc   test OH_PrivateCommand_GetBoolValue Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3700 start====");
          let result: number = testNapi.testOhPrivateCommandGetBoolValueOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3800
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3800
     * @tc.desc   test OH_PrivateCommand_GetBoolValue Query Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3800 start====");
          let result: number = testNapi.testOhPrivateCommandGetBoolValueQueryFailed();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetBoolValue_3800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_3900
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_3900
     * @tc.desc   test OH_PrivateCommand_GetIntValue Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_3900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_3900 start====");
          let result: number = testNapi.testOhPrivateCommandGetIntValueNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_3900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_3900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4000
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4000
     * @tc.desc   test OH_PrivateCommand_GetIntValue Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4000 start====");
          let result: number = testNapi.testOhPrivateCommandGetIntValueOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4100
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4100
     * @tc.desc   test OH_PrivateCommand_GetIntValue Query Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4100 start====");
          let result: number = testNapi.testOhPrivateCommandGetIntValueQueryFailed();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetIntValue_4100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4200
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4200
     * @tc.desc   test OH_PrivateCommand_GetStrValue Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4200 start====");
          let result: number = testNapi.testOhPrivateCommandGetStrValueNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4300
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4300
     * @tc.desc   test OH_PrivateCommand_GetStrValue Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4300 start====");
          let result: number = testNapi.testOhPrivateCommandGetStrValueOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4400
     * @tc.number SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4400
     * @tc.desc   test OH_PrivateCommand_GetStrValue Query Failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4400 start====");
          let result: number = testNapi.testOhPrivateCommandGetStrValueQueryFailed();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_PrivateCommand_GetStrValue_4400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4500
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4500
     * @tc.desc   test OH_TextAvoidInfo_SetPositionY Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4500 start====");
          let result: number = testNapi.testOhTextAvoidInfoSetPositionYNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4600
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4600
     * @tc.desc   test OH_TextAvoidInfo_SetPositionY Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4600 start====");
          let result: number = testNapi.testOhTextAvoidInfoSetPositionYOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetPositionY_4600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4700
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4700
     * @tc.desc   test OH_TextAvoidInfo_SetHeight Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4700 start====");
          let result: number = testNapi.testOhTextAvoidInfoSetHeightNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4800
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4800
     * @tc.desc   test OH_TextAvoidInfo_SetHeight Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4800 start====");
          let result: number = testNapi.testOhTextAvoidInfoSetHeightOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_SetHeight_4800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_4900
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_4900
     * @tc.desc   test OH_TextAvoidInfo_GetPositionY Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_4900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_4900 start====");
          let result: number = testNapi.testOhTextAvoidInfoGetPositionYNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_4900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_4900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_5000
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_5000
     * @tc.desc   test OH_TextAvoidInfo_GetPositionY Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_5000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_5000 start====");
          let result: number = testNapi.testOhTextAvoidInfoGetPositionYOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_5000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetPositionY_5000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5100
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5100
     * @tc.desc   test OH_TextAvoidInfo_GetHeight Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5100 start====");
          let result: number = testNapi.testOhTextAvoidInfoGetHeightNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5200
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5200
     * @tc.desc   test OH_TextAvoidInfo_GetHeight Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5200 start====");
          let result: number = testNapi.testOhTextAvoidInfoGetHeightOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextAvoidInfo_GetHeight_5200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5300
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5300
     * @tc.desc   test OH_TextConfig_SetInputType Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5300 start====");
          let result: number = testNapi.testOhTextConfigSetInputTypeNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5400
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5400
     * @tc.desc   test OH_TextConfig_SetInputType Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5400 start====");
          let result: number = testNapi.testOhTextConfigSetInputTypeOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetInputType_5400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5500
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5500
     * @tc.desc   test OH_TextConfig_SetEnterKeyType Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5500 start====");
          let result: number = testNapi.testOhTextConfigSetEnterKeyTypeNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5600
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5600
     * @tc.desc   test OH_TextConfig_SetEnterKeyType Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5600 start====");
          let result: number = testNapi.testOhTextConfigSetEnterKeyTypeOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetEnterKeyType_5600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5700
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5700
     * @tc.desc   test OH_TextConfig_SetPreviewTextSupport Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5700 start====");
          let result: number = testNapi.testOhTextConfigSetPreviewTextSupportNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5800
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5800
     * @tc.desc   test OH_TextConfig_SetPreviewTextSupport Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5800 start====");
          let result: number = testNapi.testOhTextConfigSetPreviewTextSupportOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPreviewTextSupport_5800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_5900
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_5900
     * @tc.desc   test OH_TextConfig_SetSelection Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_5900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_5900 start====");
          let result: number = testNapi.testOhTextConfigSetSelectionNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_5900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_5900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_6000
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_6000
     * @tc.desc   test OH_TextConfig_SetSelection Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_6000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_6000 start====");
          let result: number = testNapi.testOhTextConfigSetSelectionOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_6000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetSelection_6000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6100
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6100
     * @tc.desc   test OH_TextConfig_SetWindowId Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6100 start====");
          let result: number = testNapi.testOhTextConfigSetWindowIdNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6100 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6100 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6200
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6200
     * @tc.desc   test OH_TextConfig_SetWindowId Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6200 start====");
          let result: number = testNapi.testOhTextConfigSetWindowIdOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6200 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetWindowId_6200 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6300
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6300
     * @tc.desc   test OH_TextConfig_SetPlaceholder Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6300 start====");
          let result: number = testNapi.testOhTextConfigSetPlaceholderNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6300 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6300 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6400
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6400
     * @tc.desc   test OH_TextConfig_SetPlaceholder Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6400 start====");
          let result: number = testNapi.testOhTextConfigSetPlaceholderOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6400 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetPlaceholder_6400 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6500
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6500
     * @tc.desc   test OH_TextConfig_SetAbilityName Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6500 start====");
          let result: number = testNapi.testOhTextConfigSetAbilityNameNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6500 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6500 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6600
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6600
     * @tc.desc   test OH_TextConfig_SetAbilityName Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6600 start====");
          let result: number = testNapi.testOhTextConfigSetAbilityNameOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6600 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_SetAbilityName_6600 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6700
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6700
     * @tc.desc   test OH_TextConfig_GetInputType Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6700',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6700 start====");
          let result: number = testNapi.testOhTextConfigGetInputTypeNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6700 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6700 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6800
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6800
     * @tc.desc   test OH_TextConfig_GetInputType Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6800',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6800 start====");
          let result: number = testNapi.testOhTextConfigGetInputTypeOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6800 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetInputType_6800 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_6900
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_6900
     * @tc.desc   test OH_TextConfig_GetEnterKeyType Null Pointer
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_6900',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_6900 start====");
          let result: number = testNapi.testOhTextConfigGetEnterKeyTypeNullPointer();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_6900 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_6900 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_7000
     * @tc.number SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_7000
     * @tc.desc   test OH_TextConfig_GetEnterKeyType Ok
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_7000',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        try {
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_7000 start====");
          let result: number = testNapi.testOhTextConfigGetEnterKeyTypeOk();
          console.info("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_7000 result====",
            result);
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error("====>SUB_InputMethod_Imf_SDK_OH_TextConfig_GetEnterKeyType_7000 catch err: " +
            err);
          expect(err).assertFail();
          done();
        }
      })
  })
}
