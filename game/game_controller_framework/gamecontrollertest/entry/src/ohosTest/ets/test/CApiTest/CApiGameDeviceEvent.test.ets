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

export default function CApiGameDeviceEventTest() {
  describe('CApiGameDeviceEventTest', () => {
    /**
     * @tc.name   OH_GameDevice_DeviceEvent_GetChangedType01
     * @tc.number OH_GameDevice_DeviceEvent_GetChangedType01
     * @tc.desc   get changed type success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceEvent_GetChangedType01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceEventGetChangedType01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceEvent_GetChangedType02
     * @tc.number OH_GameDevice_DeviceEvent_GetChangedType02
     * @tc.desc   get changed type failed, when deviceEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceEvent_GetChangedType02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceEventGetChangedType02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceEvent_GetDeviceInfo01
     * @tc.number OH_GameDevice_DeviceEvent_GetDeviceInfo01
     * @tc.desc   get deviceInfo success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceEvent_GetDeviceInfo01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceEventGetDeviceInfo01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceEvent_GetDeviceInfo02
     * @tc.number OH_GameDevice_DeviceEvent_GetDeviceInfo02
     * @tc.desc   get deviceInfo failed, when deviceEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceEvent_GetDeviceInfo02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceEventGetDeviceInfo02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DestroyDeviceInfo01
     * @tc.number OH_GameDevice_DestroyDeviceInfo01
     * @tc.desc   destroy device info success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DestroyDeviceInfo01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDestroyDeviceInfo01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DestroyDeviceInfo02
     * @tc.number OH_GameDevice_DestroyDeviceInfo02
     * @tc.desc   destroy device info failed, when deviceInfo is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DestroyDeviceInfo02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDestroyDeviceInfo02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetDeviceId01
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceId01
     * @tc.desc   get deviceId success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceId01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetDeviceId01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetDeviceId02
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceId02
     * @tc.desc   get deviceId failed, when deviceEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceId02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetDeviceId02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetDeviceId03
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceId03
     * @tc.desc   get deviceId failed, when deviceId is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceId03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetDeviceId03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetName01
     * @tc.number OH_GameDevice_DeviceInfo_GetName01
     * @tc.desc   get name success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetName01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetName01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetName02
     * @tc.number OH_GameDevice_DeviceInfo_GetName02
     * @tc.desc   get name failed, when deviceEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetName02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetName02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetName03
     * @tc.number OH_GameDevice_DeviceInfo_GetName03
     * @tc.desc   get name failed, when name is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetName03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetName03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetProduct01
     * @tc.number OH_GameDevice_DeviceInfo_GetProduct01
     * @tc.desc   GetProduct success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetProduct01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetProduct01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetProduct02
     * @tc.number OH_GameDevice_DeviceInfo_GetProduct02
     * @tc.desc   GetProduct failed, device event null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetProduct02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetProduct02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetVersion01
     * @tc.number OH_GameDevice_DeviceInfo_GetVersion01
     * @tc.desc   GetVersion success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetVersion01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetVersion01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetVersion02
     * @tc.number OH_GameDevice_DeviceInfo_GetVersion02
     * @tc.desc   GetVersion failed, when deviceEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetVersion02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetVersion02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetPhys01
     * @tc.number OH_GameDevice_DeviceInfo_GetPhys01
     * @tc.desc   GetPhys success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetPhys01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetPhys01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetPhys02
     * @tc.number OH_GameDevice_DeviceInfo_GetPhys02
     * @tc.desc   GetPhys failed, when deviceEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetPhys02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetPhys02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetPhys03
     * @tc.number OH_GameDevice_DeviceInfo_GetPhys03
     * @tc.desc   GetPhys failed, when deviceEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetPhys03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetPhys03();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetDeviceType01
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceType01
     * @tc.desc   GetDeviceType success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceType01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetDeviceType01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DeviceInfo_GetDeviceType02
     * @tc.number OH_GameDevice_DeviceInfo_GetDeviceType02
     * @tc.desc   GetDeviceType failed, when deviceEvent is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DeviceInfo_GetDeviceType02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDeviceInfoGetDeviceType02();
      expect(ret).assertEqual(401);
    });

  })
}