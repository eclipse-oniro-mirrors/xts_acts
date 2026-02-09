/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import GC from 'libentry.so';
import { SyscapChecker } from './SyscapChecker.test';

export default function CApiGamePadTest() {
  describe('CApiGamePadTest', () => {
    /**
     * @tc.name   OH_GamePad_LeftShoulder_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_LeftShoulder_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftShoulder_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftShoulderRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftShoulder_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_LeftShoulder_RegisterButtonInputMonitor02
     * @tc.desc   register failed, callback null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftShoulder_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftShoulderRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftShoulder_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftShoulderUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightShoulder_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_RightShoulder_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightShoulder_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightShoulderRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightShoulder_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_RightShoulder_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightShoulder_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightShoulderRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_RightShoulder_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_RightShoulder_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightShoulder_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightShoulderUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftTrigger_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_LeftTrigger_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftTrigger_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftTriggerRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftTrigger_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_LeftTrigger_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftTrigger_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftTriggerRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftTrigger_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftTriggerUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftTrigger_RegisterAxisInputMonitor01
     * @tc.number OH_GamePad_LeftTrigger_RegisterAxisInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftTrigger_RegisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftTriggerRegisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftTrigger_RegisterAxisInputMonitor02
     * @tc.number OH_GamePad_LeftTrigger_RegisterAxisInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftTrigger_RegisterAxisInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftTriggerRegisterAxisInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor01
     * @tc.number OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftTrigger_UnregisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftTriggerUnregisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightTrigger_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_RightTrigger_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightTrigger_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightTriggerRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightTrigger_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_RightTrigger_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightTrigger_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightTriggerRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_RightTrigger_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_RightTrigger_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightTrigger_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightTriggerUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightTrigger_RegisterAxisInputMonitor01
     * @tc.number OH_GamePad_RightTrigger_RegisterAxisInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightTrigger_RegisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightTriggerRegisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightTrigger_RegisterAxisInputMonitor02
     * @tc.number OH_GamePad_RightTrigger_RegisterAxisInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightTrigger_RegisterAxisInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightTriggerRegisterAxisInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_RightTrigger_UnregisterAxisInputMonitor01
     * @tc.number OH_GamePad_RightTrigger_UnregisterAxisInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightTrigger_UnregisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightTriggerUnregisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonMenu_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonMenu_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonMenu_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonMenuRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonMenu_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_ButtonMenu_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonMenu_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonMenuRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonMenu_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonMenuUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonHome_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonHome_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonHome_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonHomeRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonHome_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_ButtonHome_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonHome_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonHomeRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_ButtonHome_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonHome_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonHome_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonHomeUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonA_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonA_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonA_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonARegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonA_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_ButtonA_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonA_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonARegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_ButtonA_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonA_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonA_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonAUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonB_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonB_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonB_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonBRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonB_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_ButtonB_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonB_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonBRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_ButtonB_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonB_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonB_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonBUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonX_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonX_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonX_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonXRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonX_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_ButtonX_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonX_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonXRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_ButtonX_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonX_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonX_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonXUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonY_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonY_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonY_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonYRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonY_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_ButtonY_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonY_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonYRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_ButtonY_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonY_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonY_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonYUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonC_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonC_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonC_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonCRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_ButtonC_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_ButtonC_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonC_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonCRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_ButtonC_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_ButtonC_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonC_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadButtonCUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadLeftButtonRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_LeftButton_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadLeftButtonRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_LeftButton_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadLeftButtonUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadRightButtonRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_RightButton_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadRightButtonRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_RightButton_UnregisterButtonInputMonitor01',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadRightButtonUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadUpButtonRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_UpButton_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadUpButtonRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_UpButton_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadUpButtonUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadDownButtonRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_DownButton_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadDownButtonRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_DownButton_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadDownButtonUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_Dpad_RegisterAxisInputMonitor01
     * @tc.number OH_GamePad_Dpad_RegisterAxisInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_RegisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGamePadDpadRegisterAxisInputMonitor01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_Dpad_RegisterAxisInputMonitor02
     * @tc.number OH_GamePad_Dpad_RegisterAxisInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_RegisterAxisInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGamePadDpadRegisterAxisInputMonitor02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_Dpad_UnregisterAxisInputMonitor01
     * @tc.number OH_GamePad_Dpad_UnregisterAxisInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_Dpad_UnregisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadDpadUnregisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftThumbstickRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftThumbstick_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftThumbstickRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftThumbstick_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftThumbstickUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor01
     * @tc.number OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftThumbstickRegisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor02
     * @tc.number OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftThumbstick_RegisterAxisInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftThumbstickRegisterAxisInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor01
     * @tc.number OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_LeftThumbstick_UnregisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadLeftThumbstickUnregisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightThumbstick_RegisterButtonInputMonitor01
     * @tc.number OH_GamePad_RightThumbstick_RegisterButtonInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightThumbstick_RegisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightThumbstickRegisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightThumbstick_RegisterButtonInputMonitor02
     * @tc.number OH_GamePad_RightThumbstick_RegisterButtonInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightThumbstick_RegisterButtonInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightThumbstickRegisterButtonInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor01
     * @tc.number OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightThumbstick_UnregisterButtonInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightThumbstickUnregisterButtonInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightThumbstick_RegisterAxisInputMonitor01
     * @tc.number OH_GamePad_RightThumbstick_RegisterAxisInputMonitor01
     * @tc.desc   register success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightThumbstick_RegisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightThumbstickRegisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_RightThumbstick_RegisterAxisInputMonitor02
     * @tc.number OH_GamePad_RightThumbstick_RegisterAxisInputMonitor02
     * @tc.desc   when callback is null, register failed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightThumbstick_RegisterAxisInputMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightThumbstickRegisterAxisInputMonitor02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor01
     * @tc.number OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor01
     * @tc.desc   unregister success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_RightThumbstick_UnregisterAxisInputMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGamePadRightThumbstickUnregisterAxisInputMonitor01();
        expect(ret).assertEqual(0);
      });
  })
}
