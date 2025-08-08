/*
 * Copyright (c) 2024-2025 Huawei Device Co., Ltd.
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
    testAddAllowedWifiList();
    testRemoveAllowedWifiList();
    testGetAllowedWifiList();
    testAddDisallowedWifiList();
    testRemoveDisallowedWifiList();
    testGetDisallowedWifiList();
    testTurnOnWifi();
    testTurnOffWifi();
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

function testAddAllowedWifiList() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0001
   * @tc.name      : test_add_allowed_wifi_list_0001
   * @tc.desc      : test wifiManager addAllowedWifiList with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_allowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveAllowedWifiList() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_WIFI_LIST_JS_0001
   * @tc.name      : test_remove_allowed_wifi_list_0001
   * @tc.desc      : test wifiManager removeAllowedWifiList with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_allowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.removeAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetAllowedWifiList() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_WIFI_LIST_JS_0001
   * @tc.name      : test_get_allowed_wifi_list_0001
   * @tc.desc      : test wifiManager getAllowedWifiList with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_allowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      wifiManager.getAllowedWifiList(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testAddDisallowedWifiList() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0001
   * @tc.name      : test_add_disallowed_wifi_list_0001
   * @tc.desc      : test wifiManager addDisallowedWifiList with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_add_disallowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testRemoveDisallowedWifiList() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_WIFI_LIST_JS_0001
   * @tc.name      : test_remove_disallowed_wifi_list_0001
   * @tc.desc      : test wifiManager removeDisallowedWifiList with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_remove_disallowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.removeDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testGetDisallowedWifiList() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_WIFI_LIST_JS_0001
   * @tc.name      : test_get_disallowed_wifi_list_0001
   * @tc.desc      : test wifiManager getDisallowedWifiList with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_get_disallowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      wifiManager.getDisallowedWifiList(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testTurnOnWifi() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_WIFI_JS_0001
   * @tc.name      : test_turnon_wifi_list_0001
   * @tc.desc      : test wifiManager turnOnWifi with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      wifiManager.turnOnWifi(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNON_WIFI_JS_0002
   * @tc.name      : test_turnon_wifi_list_0002
   * @tc.desc      : test wifiManager turnOnWifi with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnon_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      wifiManager.turnOnWifi(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testTurnOffWifi() {
  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_TURNOFF_WIFI_JS_0001
   * @tc.name      : test_turnoff_wifi_list_0001
   * @tc.desc      : test wifiManager turnOffWifi with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_turnoff_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
    try {
      wifiManager.turnOffWifi(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 201).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

