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

import { describe, expect, it } from '@ohos/hypium';
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
     * @tc.desc      : test deviceInfo getDeviceInfo without admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_device_info_0100", 0, async (done: Function) => {
      try {
        deviceInfo.getDeviceInfo(SELFWANT, LABEL_DEVICE_NAME);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200001).assertTrue();
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DEVICE_INFO_JS_0200
     * @tc.name      : test_get_device_info_0200
     * @tc.desc      : test deviceInfo getDeviceInfo with normal admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_device_info_0200", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
      try {
        deviceInfo.getDeviceInfo(SELFWANT, LABEL_DEVICE_NAME);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 9200002).assertTrue();
      } finally {
        await adminManager.disableAdmin(SELFWANT);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DEVICE_INFO_JS_0300
     * @tc.name      : test_get_device_info_0300
     * @tc.desc      : test deviceInfo getDeviceInfo unsupported item
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_device_info_0300", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceInfo.getDeviceInfo(SELFWANT, '123');
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 801).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DEVICE_INFO_JS_0400
     * @tc.name      : test_get_device_info_0400
     * @tc.desc      : test deviceInfo getDeviceInfo, item = deviceName
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_device_info_0400", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceInfo.getDeviceInfo(SELFWANT, LABEL_DEVICE_NAME);
        expect(result).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DEVICE_INFO_JS_0500
     * @tc.name      : test_get_device_info_0500
     * @tc.desc      : test deviceInfo getDeviceInfo, item = deviceSerial
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_device_info_0500", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceInfo.getDeviceInfo(SELFWANT, LABEL_DEVICE_SERIAL);
        expect(result).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DEVICE_INFO_JS_0600
     * @tc.name      : test_get_device_info_0600
     * @tc.desc      : test deviceInfo getDeviceInfo, item = deviceSerial
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_device_info_0600", 0, async (done: Function) => {
      if (sysDeviceInfo.deviceType != 'phone') {
        done();
        return;
      }
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        let result: string = deviceInfo.getDeviceInfo(SELFWANT, LABEL_SIM_INFO);
        expect(JSON.parse(result)).not().assertUndefined();
      } catch (error) {
        expect().assertFail();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });

    /**
     * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DEVICE_INFO_JS_0700
     * @tc.name      : test_get_device_info_0700
     * @tc.desc      : test deviceInfo getDeviceInfo with super admin
     * @tc.level     : Level 2
     * @tc.type      : Function
     * @tc.size      : MediumTest
     */
    it("test_get_device_info_0700", 0, async (done: Function) => {
      await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
      try {
        deviceInfo.getDeviceInfo(null, LABEL_DEVICE_NAME);
        expect(false).assertTrue();
      } catch (error) {
        expect(error.code == 401).assertTrue();
      } finally {
        await adminManager.disableSuperAdmin(SELFHAPNAME);
      }
      done();
    });
  })
}