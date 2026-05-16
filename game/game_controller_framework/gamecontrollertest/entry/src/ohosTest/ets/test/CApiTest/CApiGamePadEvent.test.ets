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

export default function CApiGamePadEventTest() {
  describe('CApiGamePadEventTest', () => {
    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetDeviceId01
     * @tc.number OH_GamePad_ButtonEvent_GetDeviceId01
     * @tc.desc   GetDeviceId success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetDeviceId01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetDeviceId01();
      expect(ret).assertEqual(0);
    });
    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetDeviceId02
     * @tc.number OH_GamePad_ButtonEvent_GetDeviceId02
     * @tc.desc   GetDeviceId failed when buttonEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetDeviceId02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetDeviceId02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetDeviceId03
     * @tc.number OH_GamePad_ButtonEvent_GetDeviceId03
     * @tc.desc   GetDeviceId failed when deviceId is nullptr
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetDeviceId03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetDeviceId03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetButtonAction01
     * @tc.number OH_GamePad_ButtonEvent_GetButtonAction01
     * @tc.desc   GetButtonAction success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetButtonAction01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetButtonAction01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetButtonAction02
     * @tc.number OH_GamePad_ButtonEvent_GetButtonAction02
     * @tc.desc   GetButtonAction failed when buttonEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetButtonAction02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetButtonAction02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetButtonCode01
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCode01
     * @tc.desc   GetButtonCode success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetButtonCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetButtonCode01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetButtonCode02
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCode02
     * @tc.desc   GetButtonCode failed when buttonEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetButtonCode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetButtonCode02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetButtonCodeName01
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCodeName01
     * @tc.desc   GetButtonCodeName success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetButtonCodeName01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetButtonCodeName01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetButtonCodeName02
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCodeName02
     * @tc.desc   GetButtonCodeName failed when buttonEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetButtonCodeName02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetButtonCodeName02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetButtonCodeName03
     * @tc.number OH_GamePad_ButtonEvent_GetButtonCodeName03
     * @tc.desc   GetButtonCodeName failed when codeName is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetButtonCodeName03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetButtonCodeName03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_PressedButtons_GetCount01
     * @tc.number OH_GamePad_PressedButtons_GetCount01
     * @tc.desc   PressedButtons_GetCount success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButtons_GetCount01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadPressedButtonsGetCount01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_PressedButtons_GetCount02
     * @tc.number OH_GamePad_PressedButtons_GetCount02
     * @tc.desc   PressedButtons_GetCount failed when buttonEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButtons_GetCount02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadPressedButtonsGetCount02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_PressedButtons_GetButtonInfo01
     * @tc.number OH_GamePad_PressedButtons_GetButtonInfo01
     * @tc.desc   GetButtonInfo success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButtons_GetButtonInfo01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadPressedButtonsGetButtonInfo01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_PressedButtons_GetButtonInfo02
     * @tc.number OH_GamePad_PressedButtons_GetButtonInfo02
     * @tc.desc   GetButtonInfo failed when buttonEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButtons_GetButtonInfo02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadPressedButtonsGetButtonInfo02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_PressedButtons_GetButtonInfo03
     * @tc.number OH_GamePad_PressedButtons_GetButtonInfo03
     * @tc.desc   GetButtonInfo failed when index is more than count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButtons_GetButtonInfo03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadPressedButtonsGetButtonInfo03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_PressedButtons_GetButtonInfo04
     * @tc.number OH_GamePad_PressedButtons_GetButtonInfo04
     * @tc.desc   GetButtonInfo failed when index is less than 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButtons_GetButtonInfo04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadPressedButtonsGetButtonInfo04();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_DestroyPressedButton01
     * @tc.number OH_GamePad_DestroyPressedButton01
     * @tc.desc   DestroyPressedButton success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_DestroyPressedButton01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadDestroyPressedButton01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_DestroyPressedButton02
     * @tc.number OH_GamePad_DestroyPressedButton02
     * @tc.desc   DestroyPressedButton failed when pressedButton is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_DestroyPressedButton02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadDestroyPressedButton02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_PressedButton_GetButtonCode01
     * @tc.number OH_GamePad_PressedButton_GetButtonCode01
     * @tc.desc   PressedButton_GetButtonCode success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButton_GetButtonCode01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadPressedButtonGetButtonCode01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_PressedButton_GetButtonCode02
     * @tc.number OH_GamePad_PressedButton_GetButtonCode02
     * @tc.desc   PressedButton_GetButtonCode failed when pressedButton is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButton_GetButtonCode02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadPressedButtonGetButtonCode02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_PressedButton_GetButtonCodeName01
     * @tc.number OH_GamePad_PressedButton_GetButtonCodeName01
     * @tc.desc   PressedButton_GetButtonCodeName success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButton_GetButtonCodeName01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGameControllerGamePadPressedButtonGetButtonCodeName01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GamePad_PressedButton_GetButtonCodeName02
     * @tc.number OH_GamePad_PressedButton_GetButtonCodeName02
     * @tc.desc   PressedButton_GetButtonCodeName failed when pressedButton is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButton_GetButtonCodeName02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGameControllerGamePadPressedButtonGetButtonCodeName02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_PressedButton_GetButtonCodeName03
     * @tc.number OH_GamePad_PressedButton_GetButtonCodeName03
     * @tc.desc   PressedButton_GetButtonCodeName failed when codeName is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_PressedButton_GetButtonCodeName03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGameControllerGamePadPressedButtonGetButtonCodeName03();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetActionTime01
     * @tc.number OH_GamePad_ButtonEvent_GetActionTime01
     * @tc.desc   ButtonEvent_GetActionTime success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetActionTime01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetActionTime01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_ButtonEvent_GetActionTime02
     * @tc.number OH_GamePad_ButtonEvent_GetActionTime02
     * @tc.desc   ButtonEvent_GetActionTime failed when buttonEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_ButtonEvent_GetActionTime02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadButtonEventGetActionTime02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetDeviceId01
     * @tc.number OH_GamePad_AxisEvent_GetDeviceId01
     * @tc.desc   GetDeviceId success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetDeviceId01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetDeviceId01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetDeviceId02
     * @tc.number OH_GamePad_AxisEvent_GetDeviceId02
     * @tc.desc   GetDeviceId failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetDeviceId02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetDeviceId02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetDeviceId03
     * @tc.number OH_GamePad_AxisEvent_GetDeviceId03
     * @tc.desc   GetDeviceId failed when deviceId is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetDeviceId03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetDeviceId03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetAxisSourceType01
     * @tc.number OH_GamePad_AxisEvent_GetAxisSourceType01
     * @tc.desc   AxisEvent_GetAxisSourceType sucess
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetAxisSourceType01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetAxisSourceType01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetAxisSourceType02
     * @tc.number OH_GamePad_AxisEvent_GetAxisSourceType02
     * @tc.desc   AxisEvent_GetAxisSourceType failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetAxisSourceType02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetAxisSourceType02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetXAxisValue01
     * @tc.number OH_GamePad_AxisEvent_GetXAxisValue01
     * @tc.desc   AxisEvent_GetXAxisValue success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetXAxisValue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetXAxisValue01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetXAxisValue02
     * @tc.number OH_GamePad_AxisEvent_GetXAxisValue02
     * @tc.desc   AxisEvent_GetXAxisValue failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetXAxisValue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetXAxisValue02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetYAxisValue01
     * @tc.number OH_GamePad_AxisEvent_GetYAxisValue01
     * @tc.desc   AxisEvent_GetYAxisValue success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetYAxisValue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetYAxisValue01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetYAxisValue02
     * @tc.number OH_GamePad_AxisEvent_GetYAxisValue02
     * @tc.desc   AxisEvent_GetYAxisValue failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetYAxisValue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetYAxisValue02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetZAxisValue01
     * @tc.number OH_GamePad_AxisEvent_GetZAxisValue01
     * @tc.desc   AxisEvent_GetZAxisValue success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetZAxisValue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetZAxisValue01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetZAxisValue02
     * @tc.number OH_GamePad_AxisEvent_GetZAxisValue02
     * @tc.desc   AxisEvent_GetZAxisValue failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetZAxisValue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetZAxisValue02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetRZAxisValue01
     * @tc.number OH_GamePad_AxisEvent_GetRZAxisValue01
     * @tc.desc   AxisEvent_GetRZAxisValue success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetRZAxisValue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetRZAxisValue01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetRZAxisValue02
     * @tc.number OH_GamePad_AxisEvent_GetRZAxisValue02
     * @tc.desc   AxisEvent_GetRZAxisValue failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetRZAxisValue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetRZAxisValue02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetHatXAxisValue01
     * @tc.number OH_GamePad_AxisEvent_GetHatXAxisValue01
     * @tc.desc   AxisEvent_GetHatXAxisValue success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetHatXAxisValue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetHatXAxisValue01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetHatXAxisValue02
     * @tc.number OH_GamePad_AxisEvent_GetHatXAxisValue02
     * @tc.desc   AxisEvent_GetHatXAxisValue failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetHatXAxisValue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetHatXAxisValue02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetHatYAxisValue01
     * @tc.number OH_GamePad_AxisEvent_GetHatYAxisValue01
     * @tc.desc   AxisEvent_GetHatYAxisValue success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetHatYAxisValue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetHatYAxisValue01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetHatYAxisValue02
     * @tc.number OH_GamePad_AxisEvent_GetHatYAxisValue02
     * @tc.desc   AxisEvent_GetHatYAxisValue failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetHatYAxisValue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetHatYAxisValue02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetBrakeAxisValue01
     * @tc.number OH_GamePad_AxisEvent_GetBrakeAxisValue01
     * @tc.desc   AxisEvent_GetBrakeAxisValue success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetBrakeAxisValue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetBrakeAxisValue01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetBrakeAxisValue02
     * @tc.number OH_GamePad_AxisEvent_GetBrakeAxisValue02
     * @tc.desc   AxisEvent_GetBrakeAxisValue failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetBrakeAxisValue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetBrakeAxisValue02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetGasAxisValue01
     * @tc.number OH_GamePad_AxisEvent_GetGasAxisValue01
     * @tc.desc   AxisEvent_GetGasAxisValue success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetGasAxisValue01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetGasAxisValue01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetGasAxisValue02
     * @tc.number OH_GamePad_AxisEvent_GetGasAxisValue02
     * @tc.desc   AxisEvent_GetGasAxisValue failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetGasAxisValue02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetGasAxisValue02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetActionTime01
     * @tc.number OH_GamePad_AxisEvent_GetActionTime01
     * @tc.desc   AxisEvent_GetActionTime success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetActionTime01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetActionTime01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GamePad_AxisEvent_GetActionTime02
     * @tc.number OH_GamePad_AxisEvent_GetActionTime02
     * @tc.desc   AxisEvent_GetActionTime failed when axisEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GamePad_AxisEvent_GetActionTime02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameControllerGamePadAxisEventGetActionTime02();
      expect(ret).assertEqual(401);
    });
  })
}