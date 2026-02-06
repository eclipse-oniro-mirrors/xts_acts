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

export default function CApiGameDeviceTest() {
  describe('CApiGameDeviceTest', () => {
    /**
     * @tc.name   OH_GameDevice_GetAllDeviceInfos
     * @tc.number OH_GameDevice_GetAllDeviceInfos
     * @tc.desc   get AllDeviceInfos success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_GetAllDeviceInfos', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceGetAllDeviceInfos01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_RegisterDeviceMonitor01
     * @tc.number OH_GameDevice_RegisterDeviceMonitor01
     * @tc.desc   registerDeviceMonitor success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_RegisterDeviceMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceRegisterDeviceMonitor01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_RegisterDeviceMonitor02
     * @tc.number OH_GameDevice_RegisterDeviceMonitor02
     * @tc.desc   registerDeviceMonitor failed when deviceMonitorCallback is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_RegisterDeviceMonitor02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceRegisterDeviceMonitor02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_UnregisterDeviceMonitor01
     * @tc.number OH_GameDevice_UnregisterDeviceMonitor01
     * @tc.desc   UnregisterDeviceMonitor success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_UnregisterDeviceMonitor01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceUnregisterDeviceMonitor01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DestroyAllDeviceInfos01
     * @tc.number OH_GameDevice_DestroyAllDeviceInfos01
     * @tc.desc   destroy allDeviceInfos success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DestroyAllDeviceInfos01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDestroyAllDeviceInfos01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_DestroyAllDeviceInfos02
     * @tc.number OH_GameDevice_DestroyAllDeviceInfos02
     * @tc.desc   destroy allDeviceInfos failed when allDeviceInfos is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_DestroyAllDeviceInfos02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceDestroyAllDeviceInfos02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_AllDeviceInfos_GetCount01
     * @tc.number OH_GameDevice_AllDeviceInfos_GetCount01
     * @tc.desc   get count success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_AllDeviceInfos_GetCount01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceAllDeviceInfosGetCount01();
      expect(ret).assertEqual(0);
    });

    /**
     * @tc.name   OH_GameDevice_AllDeviceInfos_GetCount02
     * @tc.number OH_GameDevice_AllDeviceInfos_GetCount02
     * @tc.desc   get count failed when allDeviceInfos is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_AllDeviceInfos_GetCount02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsGameDeviceAllDeviceInfosGetCount02();
      expect(ret).assertEqual(401);
    });

    /**
     * @tc.name   OH_GameDevice_AllDeviceInfos_GetDeviceInfo01
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo01
     * @tc.desc   get deviceInfo success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGameDeviceAllDeviceInfosGetDeviceInfo01();
        expect(ret).assertEqual(0);
      });

    /**
     * @tc.name   OH_GameDevice_AllDeviceInfos_GetDeviceInfo02
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo02
     * @tc.desc   get deviceInfo failed, when allDeviceInfos is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo02', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGameDeviceAllDeviceInfosGetDeviceInfo02();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GameDevice_AllDeviceInfos_GetDeviceInfo03
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo03
     * @tc.desc   get deviceInfo failed,  when index is more than count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo03', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGameDeviceAllDeviceInfosGetDeviceInfo03();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GameDevice_AllDeviceInfos_GetDeviceInfo04
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo04
     * @tc.desc   get deviceInfo failed, when index is less than 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo04', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGameDeviceAllDeviceInfosGetDeviceInfo04();
        expect(ret).assertEqual(401);
      });

    /**
     * @tc.name   OH_GameDevice_AllDeviceInfos_GetDeviceInfo05
     * @tc.number OH_GameDevice_AllDeviceInfos_GetDeviceInfo05
     * @tc.desc   get deviceInfo failed, when index is equal with count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('OH_GameDevice_AllDeviceInfos_GetDeviceInfo05', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async () => {
        if (SyscapChecker.canNotUse()) {
          return;
        }
        let ret: number = GC.ActsGameDeviceAllDeviceInfosGetDeviceInfo05();
        expect(ret).assertEqual(401);
      });
  })
}