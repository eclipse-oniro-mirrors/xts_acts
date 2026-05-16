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
import hilog from '@ohos.hilog';

// 用例执行超时为15s
const SLEEP_WAIT = 13 * 1000;

function wait(ms: number): Promise<void> {
  return new Promise((resolve) => {
    setTimeout(resolve, ms);
  });
}

export default function CApiRealDeviceTest() {
  describe('CApiRealDeviceTest', () => {
    /**
     * @tc.name   ActsRealDevice_Test
     * @tc.number ActsRealDevice_Test
     * @tc.desc   test for real device
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ActsRealDevice_Test', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      if (SyscapChecker.canNotUse()) {
        return;
      }
      let ret: number = GC.ActsRealDeviceGetAllDevices();
      expect(ret).assertEqual(0);
      if (GC.ActsRealDeviceHasRealDevice() == 0) {
        hilog.info(0x0000, "GameControllerXts", "There is no any real device.");
        return;
      }

      hilog.info(0x0000, "GameControllerXts", "There are some real device. and sleep to receive event");

      // 存在真实设备时, 等待13s接受事件, 并解析事件,
      await wait(SLEEP_WAIT);

      // 事件中肯定应该存在设备上线事件
      ret = GC.ActsRealDeviceCheckDeviceEvent();
      expect(ret).assertEqual(0);

      // 检查手柄的按键和轴事件，如果没有收到，则返回成功；收到则进行事件解析，检查解析结果是否正确
      ret = GC.ActsRealDeviceCheckGamePadEvent();
      expect(ret).assertEqual(0);
    });
  })
}