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
import { ENTINFO1, SELFWANT, SELFHAPNAME, INVALID_WANT } from '../commom';

import adminManager from '@ohos.enterprise.adminManager';
import wifiManager from '@ohos.enterprise.wifiManager';

export default function wifiManagerTest() {
  describe('wifiManager_test', () => {
    testIsWifiActiveSync();
    testSetWifiProfileSync();
  })
}

function testIsWifiActiveSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_WIFI_ACTIVE_SYNC_JS_0100
   * @tc.name      : test_is_wifi_active_sync_0100
   * @tc.desc      : test wifiManager isWifiActiveSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_wifi_active_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      wifiManager.isWifiActiveSync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testSetWifiProfileSync() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0100
   * @tc.name      : test_set_wifi_profile_sync_0100
   * @tc.desc      : test wifiManager setWifiProfileSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_wifi_profile_sync_0100", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}