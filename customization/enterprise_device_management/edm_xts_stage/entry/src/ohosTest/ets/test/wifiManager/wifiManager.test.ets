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
import { ENTINFO1, SELFWANT, SELFHAPNAME, TEST_APP_ID_1, TEST_POLICY_NAME, TEST_POLICY_VALUE, INVALID_WANT } from '../commom.ets';

import adminManager from '@ohos.enterprise.adminManager';
import wifiManager from '@ohos.enterprise.wifiManager';
import restrictions from '@ohos.enterprise.restrictions';

const WIFI_LIST_MAX_SIZE = 200;

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
    testTurnOnWifiList();
    testTurnOffWifiList();
  })
}

function testIsWifiActiveSync() {
  /**
   * @tc.name   test_is_wifi_active_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WIFI_ACTIVE_SYNC_JS_0100
   * @tc.desc   test wifiManager isWifiActiveSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_wifi_active_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      wifiManager.isWifiActiveSync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_is_wifi_active_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WIFI_ACTIVE_SYNC_JS_0101
   * @tc.desc   test wifiManager isWifiActiveSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_wifi_active_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      wifiManager.isWifiActiveSync(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_is_wifi_active_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WIFI_ACTIVE_SYNC_JS_0102
   * @tc.desc   test wifiManager isWifiActiveSync with invalid admin param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_wifi_active_sync_0102", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      wifiManager.isWifiActiveSync(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_is_wifi_active_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_IS_WIFI_ACTIVE_SYNC_JS_0103
   * @tc.desc   test wifiManager isWifiActiveSync
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_is_wifi_active_sync_0103", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let result: boolean = wifiManager.isWifiActiveSync(SELFWANT);
      expect(result !== undefined).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testSetWifiProfileSync() {
  /**
   * @tc.name   test_set_wifi_profile_sync_0100
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0100
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0100", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_INVALID
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0101
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0101
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0101", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0102
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0102
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0102", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0103
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0103
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0103", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0104
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0104
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0104", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_PSK
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0105
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0105
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0105", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_SAE
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0106
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0106
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0106", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP_SUITE_B
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0107
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0107
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0107", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OWE
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0108
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0108
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0108", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_CERT
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0109
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0109
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0109", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WAPI_PSK
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0110
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0110
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0110", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_TLS,
        "phase2Method": wifiManager.Phase2Method.PHASE2_AKA,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let ipConfig: wifiManager.IpProfile = {
        "ipAddress": 1284752956,
        "gateway": 1284752936,
        "prefixLength": 2,
        "dnsServers": [0, 1],
        "domains": ["0", "1"],
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "bssid": "00:1A:2B:3C:4D:5E",
        "isHiddenSsid": false,
        "creatorUid": 110,
        "disableReason": 1,
        "netId": 1254,
        "randomMacType": 1,
        "randomMacAddr": "00:1A:2B:3C:4D:5E",
        "ipType": wifiManager.IpType.STATIC,
        "staticIp": ipConfig,
        "preSharedKey": "password",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0111
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0111
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0111", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_NONE,
        "phase2Method": wifiManager.Phase2Method.PHASE2_NONE,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let ipConfig: wifiManager.IpProfile = {
        "ipAddress": 1284752956,
        "gateway": 1284752936,
        "prefixLength": 2,
        "dnsServers": [0, 1],
        "domains": ["0", "1"],
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "ipType": wifiManager.IpType.DHCP,
        "staticIp": ipConfig,
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0112
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0112
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0112", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_PEAP,
        "phase2Method": wifiManager.Phase2Method.PHASE2_PAP,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let ipConfig: wifiManager.IpProfile = {
        "ipAddress": 1284752956,
        "gateway": 1284752936,
        "prefixLength": 2,
        "dnsServers": [0, 1],
        "domains": ["0", "1"],
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "ipType": wifiManager.IpType.UNKNOWN,
        "staticIp": ipConfig,
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0113
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0113
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0113", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_TLS,
        "phase2Method": wifiManager.Phase2Method.PHASE2_MSCHAP,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0114
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0114
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0114", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_TTLS,
        "phase2Method": wifiManager.Phase2Method.PHASE2_MSCHAPV2,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0115
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0115
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0115", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_PWD,
        "phase2Method": wifiManager.Phase2Method.PHASE2_GTC,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0116
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0116
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0116", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_SIM,
        "phase2Method": wifiManager.Phase2Method.PHASE2_SIM,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0117
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0117
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0117", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_AKA,
        "phase2Method": wifiManager.Phase2Method.PHASE2_AKA,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0118
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0118
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0118", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_AKA_PRIME,
        "phase2Method": wifiManager.Phase2Method.PHASE2_AKA_PRIME,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0119
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0119
   * @tc.desc   test wifiManager setWifiProfileSync without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0119", Level.LEVEL2, async (done: Function) => {
    try {
      const certEntry: Uint8Array = new Uint8Array([23, 120, 112, 97, 110, 100, 32, 51, 50, 45, 98, 121, 116, 101, 32, 107])
      let eapConfig: wifiManager.WifiEapProfile = {
        "eapMethod": wifiManager.EapMethod.EAP_UNAUTH_TLS,
        "phase2Method": wifiManager.Phase2Method.PHASE2_AKA_PRIME,
        "identity": "testIdentity",
        "anonymousIdentity": "testAnonymousIdentity",
        "password": "Passwd",
        "caCertAliases": "testCaCertAliases",
        "caPath": "testCaPath",
        "certEntry": certEntry,
        "certPassword": "012345678901234567890123456789012345678901234567890123",
        "clientCertAliases": "testClientCertAliases",
        "altSubjectMatch": "testSubjectMatch",
        "domainSuffixMatch": "testSuffixMatch",
        "realm": "testRealm",
        "plmn": "testPlmn",
        "eapSubId": 1,
      }
      let config: wifiManager.WifiProfile = {
        "ssid": "name",
        "preSharedKey": "password",
        "securityType": wifiManager.WifiSecurityType.WIFI_SEC_TYPE_EAP,
        "eapProfile": eapConfig,
      }
      wifiManager.setWifiProfileSync(SELFWANT, config);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0120
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0120
   * @tc.desc   test wifiManager setWifiProfileSync with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0120", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_OPEN
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_set_wifi_profile_sync_0121
   * @tc.number SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0121
   * @tc.desc   test wifiManager setWifiProfileSync with param staticIp
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_set_wifi_profile_sync_0121", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ipConfig: wifiManager.IpProfile = {
        ipAddress: 1284752956,
        gateway: 1284752936,
        prefixLength: 2,
        dnsServers: [0, 1],
        domains: ['0', '1']
      }
      let wifiProfile: wifiManager.WifiProfile = {
        ssid: 'name',
        preSharedKey: 'password',
        securityType: wifiManager.WifiSecurityType.WIFI_SEC_TYPE_WEP,
        ipType: wifiManager.IpType.STATIC,
        staticIp: ipConfig
      }
      wifiManager.setWifiProfileSync(SELFWANT, wifiProfile);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200007).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testAddAllowedWifiList() {
  /**
   * @tc.name   test_add_allowed_wifi_list_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0001
   * @tc.desc   test wifiManager addAllowedWifiList without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0002
   * @tc.desc   test wifiManager addAllowedWifiList with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0003
   * @tc.desc   test wifiManager addAllowedWifiList with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      expect(ret.length == wifiAccessInfos.length).assertTrue();
      wifiManager.removeAllowedWifiList(SELFWANT, ret);
      let result: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      expect(result.length == 0).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0004
   * @tc.desc   test wifiManager addAllowedWifiList with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos1: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      let wifiAccessInfos2: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi3", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos1);
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos2);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      expect(ret.length == 3).assertTrue();
      wifiManager.removeAllowedWifiList(SELFWANT, ret);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0005
   * @tc.desc   test wifiManager addAllowedWifiList with list length > 200
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = []
      for (let i = 0; i < WIFI_LIST_MAX_SIZE+1; i++) {
        let temp: wifiManager.WifiAccessInfo = {
          ssid: "wifi" + i,
          bssid: "68:77:24:77:A6:D4"
        };
        wifiAccessInfos.push(temp);
      }
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0006
   * @tc.desc   test wifiManager addAllowedWifiList without bssid
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1"}]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      expect(ret.length == 1).assertTrue();
      wifiManager.removeAllowedWifiList(SELFWANT, ret);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0007
   * @tc.desc   test wifiManager addAllowedWifiList ssid is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0008
   * @tc.desc   test wifiManager addAllowedWifiList ssid length > 32
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ssid1 = "0123456789012345678901234567890123"
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: ssid1, bssid: "68:77:24:77:A6:D6"}]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_0009
   * @tc.desc   test wifiManager addAllowedWifiList bssid length != 17
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi_name", bssid: "68:77:24:77:A6"}]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_00010
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_00010
   * @tc.desc   test wifiManager addAllowedWifiList without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_00010", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.addAllowedWifiList(null, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_00011
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_00011
   * @tc.desc   test wifiManager addAllowedWifiList with list length = 200
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_00011", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = []
      for (let i = 0; i < WIFI_LIST_MAX_SIZE; i++) {
        let temp: wifiManager.WifiAccessInfo = {
          ssid: "wifi" + i,
          bssid: "68:77:24:77:A6:D2"
        };
        wifiAccessInfos.push(temp);
      }
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      expect(ret.length == WIFI_LIST_MAX_SIZE).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      wifiManager.removeAllowedWifiList(SELFWANT, ret);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_00012
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_00012
   * @tc.desc   test wifiManager addAllowedWifiList conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_00012", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_allowed_wifi_list_00013
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_WIFI_LIST_JS_00013
   * @tc.desc   test wifiManager addAllowedWifiList without bssid
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_allowed_wifi_list_00013", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos1: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"}
      ]
      let wifiAccessInfos2: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1"}
      ]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos1);
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos2);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      expect(ret.length == 2).assertTrue();
      wifiManager.removeAllowedWifiList(SELFWANT, ret);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

}

function testRemoveAllowedWifiList() {
  /**
   * @tc.name   test_remove_allowed_wifi_list_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_WIFI_LIST_JS_0001
   * @tc.desc   test wifiManager removeAllowedWifiList activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.removeAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_allowed_wifi_list_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_WIFI_LIST_JS_0002
   * @tc.desc   test wifiManager removeAllowedWifiList with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.removeAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_allowed_wifi_list_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_WIFI_LIST_JS_0003
   * @tc.desc   test wifiManager removeAllowedWifiList without bssid
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_wifi_list_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos1: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"}
      ]
      let wifiAccessInfos2: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1"}
      ]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos1);
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos2);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      expect(ret.length == 2).assertTrue();
      wifiManager.removeAllowedWifiList(SELFWANT, wifiAccessInfos2);
      let ret1: Array<wifiManager.WifiAccessInfo> = wifiManager.getAllowedWifiList(SELFWANT);
      expect(ret1.length == 1).assertTrue();
      wifiManager.removeAllowedWifiList(SELFWANT, ret1);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_allowed_wifi_list_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_WIFI_LIST_JS_0004
   * @tc.desc   test wifiManager removeAllowedWifiList ssid is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_wifi_list_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.removeAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_allowed_wifi_list_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_WIFI_LIST_JS_0005
   * @tc.desc   test wifiManager removeAllowedWifiList ssid length > 32
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_wifi_list_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ssid1 = "0123456789012345678901234567890123"
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: ssid1, bssid: "68:77:24:77:A6:D6"}]
      wifiManager.removeAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_allowed_wifi_list_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_WIFI_LIST_JS_0006
   * @tc.desc   test wifiManager removeAllowedWifiList bssid length != 17
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_wifi_list_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1", bssid: "68:77:24:77:A6"}]
      wifiManager.removeAllowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_allowed_wifi_list_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_WIFI_LIST_JS_0007
   * @tc.desc   test wifiManager removeAllowedWifiList without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_allowed_wifi_list_0007", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.removeAllowedWifiList(null, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });
}

function testGetAllowedWifiList() {
  /**
   * @tc.name   test_get_allowed_wifi_list_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WIFI_LIST_JS_0001
   * @tc.desc   test wifiManager getAllowedWifiList without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_allowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    try {
      wifiManager.getAllowedWifiList(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_allowed_wifi_list_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WIFI_LIST_JS_0002
   * @tc.desc   test wifiManager getAllowedWifiList with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_allowed_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      wifiManager.getAllowedWifiList(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_allowed_wifi_list_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_WIFI_LIST_JS_0003
   * @tc.desc   test wifiManager getAllowedWifiList without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_allowed_wifi_list_0003", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.getAllowedWifiList(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });
}

function testAddDisallowedWifiList() {
  /**
   * @tc.name   test_add_disallowed_wifi_list_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0001
   * @tc.desc   test wifiManager addDisallowedWifiList without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0002
   * @tc.desc   test wifiManager addDisallowedWifiList with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0003
   * @tc.desc   test wifiManager addDisallowedWifiList with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getDisallowedWifiList(SELFWANT);
      expect(ret.length == wifiAccessInfos.length).assertTrue();
      wifiManager.removeDisallowedWifiList(SELFWANT, ret);
      let result: Array<wifiManager.WifiAccessInfo> = wifiManager.getDisallowedWifiList(SELFWANT);
      expect(result.length == 0).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0004
   * @tc.desc   test wifiManager addDisallowedWifiList with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos1: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      let wifiAccessInfos2: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi3", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos1);
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos2);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getDisallowedWifiList(SELFWANT);
      expect(ret.length == 3).assertTrue();
      wifiManager.removeDisallowedWifiList(SELFWANT, ret);
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0005
   * @tc.desc   test wifiManager addDisallowedWifiList with with list length > 200
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = []
      for (let i = 0; i < WIFI_LIST_MAX_SIZE+1; i++) {
        let temp: wifiManager.WifiAccessInfo = {
          ssid: "wifi" + i,
          bssid: "68:77:24:77:A6:D2"
        };
        wifiAccessInfos.push(temp);
      }
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0006
   * @tc.desc   test wifiManager addDisallowedWifiList without bssid
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1"}]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      let ret1: Array<wifiManager.WifiAccessInfo> = wifiManager.getDisallowedWifiList(SELFWANT);
      expect(ret1.length == wifiAccessInfos.length).assertTrue();
      wifiManager.removeDisallowedWifiList(SELFWANT, wifiAccessInfos);
      let ret2: Array<wifiManager.WifiAccessInfo> = wifiManager.getDisallowedWifiList(SELFWANT);
      expect(ret2.length == 0).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0007
   * @tc.desc   test wifiManager addDisallowedWifiList ssid is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0008
   * @tc.desc   test wifiManager addDisallowedWifiList ssid length > 32
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ssid1 = "0123456789012345678901234567890123"
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: ssid1, bssid: "68:77:24:77:A6:D6"}]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0009
   * @tc.desc   test wifiManager addDisallowedWifiList bssid length != 17
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi_name", bssid: "68:77:24:77:A6"}]
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_0010
   * @tc.desc   test wifiManager addDisallowedWifiList without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_0010", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.addDisallowedWifiList(null, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_00011
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_00011
   * @tc.desc   test wifiManager addDisallowedWifiList with list length = 200
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_00011", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = []
      for (let i = 0; i < WIFI_LIST_MAX_SIZE; i++) {
        let temp: wifiManager.WifiAccessInfo = {
          ssid: "wifi" + i,
          bssid: "68:77:24:77:A6:D2"
        };
        wifiAccessInfos.push(temp);
      }
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getDisallowedWifiList(SELFWANT);
      expect(ret.length == WIFI_LIST_MAX_SIZE).assertTrue();
    } catch (error) {
      expect(error == null).assertTrue();
    } finally {
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getDisallowedWifiList(SELFWANT);
      wifiManager.removeDisallowedWifiList(SELFWANT, ret);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_add_disallowed_wifi_list_00012
   * @tc.number SUB_CUSTOMIZATION_EDM_ADD_DISALLOWED_WIFI_LIST_JS_00012
   * @tc.desc   test wifiManager addDisallowedWifiList conflict
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_add_disallowed_wifi_list_00012", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.addAllowedWifiList(SELFWANT, wifiAccessInfos);
      wifiManager.addDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200010).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });
}

function testRemoveDisallowedWifiList() {
  /**
   * @tc.name   test_remove_disallowed_wifi_list_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_WIFI_LIST_JS_0001
   * @tc.desc   test wifiManager removeDisallowedWifiList activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.removeDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_wifi_list_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_WIFI_LIST_JS_0002
   * @tc.desc   test wifiManager removeDisallowedWifiList with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [
        {ssid: "wifi1", bssid: "68:77:24:77:A6:D6"},
        {ssid: "wifi2", bssid: "68:77:24:77:A6:D6"}
      ]
      wifiManager.removeDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_wifi_list_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_WIFI_LIST_JS_0003
   * @tc.desc   test wifiManager removeDisallowedWifiList without bssid
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_wifi_list_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1"}]
      wifiManager.removeDisallowedWifiList(SELFWANT, wifiAccessInfos);
      let ret: Array<wifiManager.WifiAccessInfo> = wifiManager.getDisallowedWifiList(SELFWANT);
      expect(ret.length == 0).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_wifi_list_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_WIFI_LIST_JS_0004
   * @tc.desc   test wifiManager removeDisallowedWifiList ssid is empty
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_wifi_list_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.removeDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_wifi_list_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_WIFI_LIST_JS_0005
   * @tc.desc   test wifiManager removeDisallowedWifiList ssid length > 32
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_wifi_list_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let ssid1 = "0123456789012345678901234567890123"
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: ssid1, bssid: "68:77:24:77:A6:D6"}]
      wifiManager.removeDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_wifi_list_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_WIFI_LIST_JS_0006
   * @tc.desc   test wifiManager removeAllowedWifiList bssid length != 17
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_wifi_list_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1", bssid: "68:77:24:77:A6"}]
      wifiManager.removeDisallowedWifiList(SELFWANT, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_remove_disallowed_wifi_list_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_REMOVE_DISALLOWED_WIFI_LIST_JS_0007
   * @tc.desc   test wifiManager removeDisallowedWifiList without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_remove_disallowed_wifi_list_0007", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.removeDisallowedWifiList(null, wifiAccessInfos);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });
}

function testGetDisallowedWifiList() {
  /**
   * @tc.name   test_get_disallowed_wifi_list_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_WIFI_LIST_JS_0001
   * @tc.desc   test wifiManager getDisallowedWifiList without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    try {
      wifiManager.getDisallowedWifiList(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_wifi_list_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_WIFI_LIST_JS_0002
   * @tc.desc   test wifiManager getDisallowedWifiList with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      wifiManager.getDisallowedWifiList(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_get_disallowed_wifi_list_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_GET_DISALLOWED_WIFI_LIST_JS_0003
   * @tc.desc   test wifiManager getDisallowedWifiList without admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_get_disallowed_wifi_list_0003", Level.LEVEL2, async (done: Function) => {
    try {
      let wifiAccessInfos: Array<wifiManager.WifiAccessInfo> = [{ssid: "wifi1", bssid: "68:77:24:77:A6:D6"}]
      wifiManager.getDisallowedWifiList(null);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    }
    done();
  });
}

function testTurnOnWifiList() {
  /**
   * @tc.name   test_turnon_wifi_list_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0001
   * @tc.desc   test wifiManager turnOnWifi without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    try {
      wifiManager.turnOnWifi(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0002
   * @tc.desc   test wifiManager turnOnWifi without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    try {
      wifiManager.turnOnWifi(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0003
   * @tc.desc   test wifiManager turnOnWifi with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      wifiManager.turnOnWifi(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0004
   * @tc.desc   test wifiManager turnOnWifi with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      wifiManager.turnOnWifi(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0005
   * @tc.desc   test wifiManager turnOnWifi with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      wifiManager.turnOnWifi(SELFWANT, true);
      let result: boolean = wifiManager.isWifiActiveSync(SELFWANT);
      expect(result == true).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0006
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0006
   * @tc.desc   test wifiManager turnOnWifi with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0006", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      wifiManager.turnOnWifi(SELFWANT, false);
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0007
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0007
   * @tc.desc   test wifiManager turnOnWifi with super admin && disablewifi
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0007", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const LABEL_WIFI = "wifi";
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, true);
      wifiManager.turnOnWifi(SELFWANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 203).assertTrue();
    } finally {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, false);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0008
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0008
   * @tc.desc   test wifiManager turnOnWifi with super admin && disablewifi
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0008", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const LABEL_WIFI = "wifi";
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, true);
      wifiManager.turnOnWifi(SELFWANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 203).assertTrue();
    } finally {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, false);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0009
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0009
   * @tc.desc   test wifiManager turnOnWifi with error param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0009", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      wifiManager.turnOnWifi(INVALID_WANT, true);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnon_wifi_list_0010
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNON_WIFI_LIST_JS_0010
   * @tc.desc   test wifiManager turnOnWifi with error param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnon_wifi_list_0010", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      wifiManager.turnOnWifi(INVALID_WANT, false);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}

function testTurnOffWifiList() {
  /**
   * @tc.name   test_turnoff_wifi_list_0001
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_WIFI_LIST_JS_0001
   * @tc.desc   test wifiManager turnOffWifi without activated admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnoff_wifi_list_0001", Level.LEVEL2, async (done: Function) => {
    try {
      wifiManager.turnOffWifi(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200001).assertTrue();
    }
    done();
  });

  /**
   * @tc.name   test_turnoff_wifi_list_0002
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_WIFI_LIST_JS_0002
   * @tc.desc   test wifiManager turnOffWifi with normal admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnoff_wifi_list_0002", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_BYOD);
    try {
      wifiManager.turnOffWifi(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.name   test_turnoff_wifi_list_0003
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_WIFI_LIST_JS_0003
   * @tc.desc   test wifiManager turnOffWifi with super admin
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnoff_wifi_list_0003", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      wifiManager.turnOffWifi(SELFWANT);
      let result: boolean = wifiManager.isWifiActiveSync(SELFWANT);
      expect(result == false).assertTrue();
    } catch (error) {
      expect(false).assertTrue();
    } finally {
      wifiManager.turnOnWifi(SELFWANT, false);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_turnoff_wifi_list_0004
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_WIFI_LIST_JS_0004
   * @tc.desc   test wifiManager turnOffWifi with super admin && disablewifi
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnoff_wifi_list_0004", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    const LABEL_WIFI = "wifi";
    try {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, true);
      wifiManager.turnOffWifi(SELFWANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 203).assertTrue();
    } finally {
      restrictions.setDisallowedPolicy(SELFWANT, LABEL_WIFI, false);
      await adminManager.disableSuperAdmin(SELFHAPNAME);
    }
    done();
  });

  /**
   * @tc.name   test_turnoff_wifi_list_0005
   * @tc.number SUB_CUSTOMIZATION_EDM_TURNOFF_WIFI_LIST_JS_0005
   * @tc.desc   test wifiManager turnOffWifi with error param
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL2
   */
  it("test_turnoff_wifi_list_0005", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_SUPER);
    try {
      wifiManager.turnOffWifi(INVALID_WANT);
      expect(false).assertTrue();
    } catch (error) {
      expect(error.code == 401).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });
}
