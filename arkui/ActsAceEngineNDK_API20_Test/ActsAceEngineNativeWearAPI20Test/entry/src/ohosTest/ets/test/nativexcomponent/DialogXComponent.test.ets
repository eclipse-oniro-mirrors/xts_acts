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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import nativexcomponent from 'libnativexcomponent.so';
import Utils from "../common/Utils";

const ARKUI_ERROR_CODE_NO_ERROR = 0;
const ARKUI_ERROR_CODE_PARAM_INVALID = 401;

export default function DialogXComponent() {
  describe('DialogXComponent', () => {
    beforeAll(async (done: Function) => {
      await Utils.pushPageNoClear(`NativeXComponent/DialogXComponent`, done);
    })
    /**
     * @tc.name   testCustomDialogGetStateOk
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CUSTOMDIALOG_GETSTATE_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogGetStateOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ShowDialog();
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CUSTOMDIALOG_GETSTATE_0100 start<====`);
        let Result: number = nativexcomponent.CustomDialogGetStateOk();
        nativexcomponent.CloseDialog();
        await Utils.sleep(100);
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CUSTOMDIALOG_GETSTATE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCustomDialogGetStateParamInvalid
     * @tc.number SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CUSTOMDIALOG_GETSTATE_0200
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogGetStateParamInvalid', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CUSTOMDIALOG_GETSTATE_0200 start<====`);
        let Result: number = nativexcomponent.CustomDialogGetStateParamInvalid();
        expect(ARKUI_ERROR_CODE_PARAM_INVALID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_ARKUI_CUSTOMDIALOG_GETSTATE_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCustomDialogGetState0100
     * @tc.number SUB_ARKUI_ACE_ENGINE_DIALOG_UNINITIALIZED_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogGetState0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ShowDialog();
        await Utils.sleep(100);
        nativexcomponent.CloseDialog();
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_UNINITIALIZED_0100 start<====`);
        let Result: number = nativexcomponent.CustomDialogGetState(0);
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_UNINITIALIZED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCustomDialogGetState0200
     * @tc.number SUB_ARKUI_ACE_ENGINE_DIALOG_INITIALIZED_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogGetState0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ShowDialog();
        await Utils.sleep(100);
        nativexcomponent.CloseDialog();
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_INITIALIZED_0100 start<====`);
        let Result: number = nativexcomponent.CustomDialogGetState(1);
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_INITIALIZED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCustomDialogGetState0300
     * @tc.number SUB_ARKUI_ACE_ENGINE_DIALOG_APPEARING_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogGetState0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ShowDialog();
        await Utils.sleep(100);
        nativexcomponent.CloseDialog();
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_APPEARING_0100 start<====`);
        let Result: number = nativexcomponent.CustomDialogGetState(2);
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_APPEARING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCustomDialogGetState0400
     * @tc.number SUB_ARKUI_ACE_ENGINE_DIALOG_APPEARED_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogGetState0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ShowDialog();
        await Utils.sleep(100);
        nativexcomponent.CloseDialog();
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_APPEARED_0100 start<====`);
        let Result: number = nativexcomponent.CustomDialogGetState(3);
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_APPEARED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCustomDialogGetState0500
     * @tc.number SUB_ARKUI_ACE_ENGINE_DIALOG_DISAPPEARING_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogGetState0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ShowDialog();
        await Utils.sleep(100);
        nativexcomponent.CloseDialog();
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_DISAPPEARING_0100 start<====`);
        let Result: number = nativexcomponent.CustomDialogGetState(4);
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_DISAPPEARING_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.name   testCustomDialogGetState0600
     * @tc.number SUB_ARKUI_ACE_ENGINE_DIALOG_DISAPPEARED_0100
     * @tc.desc   Test get native xcomopnent key event action works.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testCustomDialogGetState0600', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        nativexcomponent.ShowDialog();
        await Utils.sleep(100);
        nativexcomponent.CloseDialog();
        await Utils.sleep(100);
        console.info(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_DISAPPEARED_0100 start<====`);
        let Result: number = nativexcomponent.CustomDialogGetState(5);
        expect(ARKUI_ERROR_CODE_NO_ERROR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_DIALOG_DISAPPEARED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
  })
}