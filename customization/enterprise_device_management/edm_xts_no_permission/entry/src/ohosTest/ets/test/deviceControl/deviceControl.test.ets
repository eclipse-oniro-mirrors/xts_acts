/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, expect, it, Level } from '@ohos/hypium';
import { ENTINFO1, SELFWANT, SELFHAPNAME } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import deviceControl from '@ohos.enterprise.deviceControl';

const LOCK_SCREEN: string = "lockScreen";
const OPERATE_DEVICE: string = "operateDevice";

export default function deviceControlTest() {
  describe('deviceControl_test', () => {
    testOperateDevice();
  })
}

function testOperateDevice() {
  /**
   * @tc.name   test_operate_device_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0001
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      deviceControl.operateDevice(SELFWANT, LOCK_SCREEN);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_operate_device_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_OPERATE_DEVICE_JS_0002
   * @tc.desc   test deviceControl operateDevice with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_operate_device_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      deviceControl.operateDevice(SELFWANT, LOCK_SCREEN, OPERATE_DEVICE);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}