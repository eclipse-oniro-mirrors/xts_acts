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
import deviceInfo from '@ohos.enterprise.deviceInfo';
import sysDeviceInfo from '@ohos.deviceInfo';

const LABEL_DEVICE_NAME: string = 'deviceName';
const LABEL_DEVICE_SERIAL: string = 'deviceSerial';
const LABEL_SIM_INFO: string = 'simInfo';

export default function deviceInfoTest() {
  describe('deviceInfo_test', () => {
    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DEVICE_INFO_JS_0100
     * @tc.name      : test_get_device_info_0100
     * @tc.desc      : test deviceInfo getDeviceInfo with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_device_info_0100", Level.LEVEL2, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceInfo.getDeviceInfo(SELFWANT, LABEL_DEVICE_NAME);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 201).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });
  })
}