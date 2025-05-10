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
   * @tc.desc      : test wifiManager isWifiActiveSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_WIFI_ACTIVE_SYNC_JS_0101
   * @tc.name      : test_is_wifi_active_sync_0101
   * @tc.desc      : test wifiManager isWifiActiveSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_is_wifi_active_sync_0101", Level.LEVEL2, async (done: Function) => {
    await adminManager.enableAdmin(SELFWANT, ENTINFO1, adminManager.AdminType.ADMIN_TYPE_NORMAL);
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_WIFI_ACTIVE_SYNC_JS_0102
   * @tc.name      : test_is_wifi_active_sync_0102
   * @tc.desc      : test wifiManager isWifiActiveSync with invalid admin param
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_IS_WIFI_ACTIVE_SYNC_JS_0103
   * @tc.name      : test_is_wifi_active_sync_0103
   * @tc.desc      : test wifiManager isWifiActiveSync
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0100
   * @tc.name      : test_set_wifi_profile_sync_0100
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0101
   * @tc.name      : test_set_wifi_profile_sync_0101
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0102
   * @tc.name      : test_set_wifi_profile_sync_0102
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0103
   * @tc.name      : test_set_wifi_profile_sync_0103
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0104
   * @tc.name      : test_set_wifi_profile_sync_0104
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0105
   * @tc.name      : test_set_wifi_profile_sync_0105
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0106
   * @tc.name      : test_set_wifi_profile_sync_0106
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0107
   * @tc.name      : test_set_wifi_profile_sync_0107
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0108
   * @tc.name      : test_set_wifi_profile_sync_0108
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0109
   * @tc.name      : test_set_wifi_profile_sync_0109
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0110
   * @tc.name      : test_set_wifi_profile_sync_0110
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0111
   * @tc.name      : test_set_wifi_profile_sync_0111
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0112
   * @tc.name      : test_set_wifi_profile_sync_0112
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0113
   * @tc.name      : test_set_wifi_profile_sync_0113
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0114
   * @tc.name      : test_set_wifi_profile_sync_0114
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0115
   * @tc.name      : test_set_wifi_profile_sync_0115
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0116
   * @tc.name      : test_set_wifi_profile_sync_0116
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0117
   * @tc.name      : test_set_wifi_profile_sync_0117
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0118
   * @tc.name      : test_set_wifi_profile_sync_0118
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0119
   * @tc.name      : test_set_wifi_profile_sync_0119
   * @tc.desc      : test wifiManager setWifiProfileSync without admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0120
   * @tc.name      : test_set_wifi_profile_sync_0120
   * @tc.desc      : test wifiManager setWifiProfileSync with normal admin
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
   */
  it("test_set_wifi_profile_sync_0120", Level.LEVEL2, async (done: Function) => {
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
      expect(error.code == 9200002).assertTrue();
    } finally {
      await adminManager.disableAdmin(SELFWANT);
    }
    done();
  });

  /**
   * @tc.number    : SUB_CUSTOMIZATION_EDM_SET_WIFI_PROFILE_SYNC_JS_0121
   * @tc.name      : test_set_wifi_profile_sync_0121
   * @tc.desc      : test wifiManager setWifiProfileSync with param staticIp
   * @tc.level     : Level 2
   * @tc.type      : Function
   * @tc.size      : MediumTest
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